-- WARNING: This schema is for context only and is not meant to be run.
-- Table order and constraints may not be valid for execution.

CREATE TABLE public.perfil_usuario (
  id_perfil integer GENERATED ALWAYS AS IDENTITY NOT NULL,
  id_login integer NOT NULL,
  nome character varying,
  visualizações integer,
  seguidores integer,
  CONSTRAINT perfil_usuario_pkey PRIMARY KEY (id_perfil)
);
CREATE TABLE public.posts (
  id_post integer GENERATED ALWAYS AS IDENTITY NOT NULL,
  id_usuario integer NOT NULL,
  comentario character varying,
  CONSTRAINT posts_pkey PRIMARY KEY (id_post),
  CONSTRAINT posts_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.perfil_usuario(id_perfil)
);
CREATE TABLE public.likes (
  id_like integer GENERATED ALWAYS AS IDENTITY NOT NULL,
  id_postagem integer NOT NULL,
  CONSTRAINT likes_pkey PRIMARY KEY (id_like),
  CONSTRAINT likes_id_postagem_fkey FOREIGN KEY (id_postagem) REFERENCES public.posts(id_post)
);
CREATE TABLE public.respostas (
  id_resp integer GENERATED ALWAYS AS IDENTITY NOT NULL,
  id_post integer NOT NULL,
  conteudo character,
  CONSTRAINT respostas_pkey PRIMARY KEY (id_resp),
  CONSTRAINT respostas_id_post_fkey FOREIGN KEY (id_post) REFERENCES public.posts(id_post)
);
CREATE TABLE public.turmas (
  id_turmas integer GENERATED ALWAYS AS IDENTITY NOT NULL,
  aluno_id integer NOT NULL,
  CONSTRAINT turmas_pkey PRIMARY KEY (id_turmas),
  CONSTRAINT turmas_aluno_id_fkey FOREIGN KEY (aluno_id) REFERENCES public.perfil_usuario(id_perfil)
);
