for tbl in 'psql -qAt -c "select tablename from pg_tables where schemaname = 'public';" namayeyar' ; do  psql -c "alter table \"$tbl\" owner to namayeyar" namayeyar ; done
