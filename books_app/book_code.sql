-- select
--     concat
--     (
--         substring(title, 1, 10),
--         '...'
--     ) as 'short title'
-- from books;

select
    substring(replace(title, 'e', '3'), 1, 10) as 'weird string'
from books;    
