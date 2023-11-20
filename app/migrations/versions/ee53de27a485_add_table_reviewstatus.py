"""Add table ReviewStatus

Revision ID: ee53de27a485
Revises: 5be99fe57a0f
Create Date: 2023-06-24 19:30:06.693742

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'ee53de27a485'
down_revision = '5be99fe57a0f'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('review_statuses',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('name', sa.String(length=50), nullable=False),
    sa.PrimaryKeyConstraint('id', name=op.f('pk_review_statuses')),
    sa.UniqueConstraint('name', name=op.f('uq_review_statuses_name'))
    )
    op.add_column('reviews', sa.Column('status_id', sa.Integer(), nullable=False))
    op.create_foreign_key(op.f('fk_reviews_status_id_review_statuses'), 'reviews', 'review_statuses', ['status_id'], ['id'], ondelete='CASCADE')
    # ### end Alembic commands ###
    review_status_data_upgrades()


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_constraint(op.f('fk_reviews_status_id_review_statuses'), 'reviews', type_='foreignkey')
    op.drop_column('reviews', 'status_id')
    op.drop_table('review_statuses')
    # ### end Alembic commands ###


def review_status_data_upgrades():
    """Add any optional data upgrade migrations here!"""
    table = sa.sql.table('review_statuses', sa.sql.column('name', sa.String))
    op.bulk_insert(table,
        [
            {'name': 'На рассмотрении'},
            {'name': 'Одобрено'},
            {'name': 'Отклонено'},
        ]
    )