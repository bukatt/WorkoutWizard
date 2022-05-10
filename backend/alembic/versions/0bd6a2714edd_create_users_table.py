"""create users table

Revision ID: 0bd6a2714edd
Revises: 
Create Date: 2022-02-28 22:46:43.660366

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '0bd6a2714edd'
down_revision = None
branch_labels = None
depends_on = None


def upgrade():
    op.create_table(
        'users',
        sa.Column('id', sa.Integer, primary_key=True),
        sa.Column('first_name', sa.String(50), nullable=False),
        sa.Column('last_name', sa.String(50), nullable=False),
        sa.Column('user_name', sa.String(50), nullable=False),
        sa.Column('password', sa.String(500), nullable=False),
        sa.Column('email', sa.String(100), nullable=False)
    )


def downgrade():
    op.drop_table('users')
