DROP TABLE IF EXISTS `#__al_docentes`;
DROP TABLE IF EXISTS `#__al_discentes`;
DROP TABLE IF EXISTS `#__al_categorias`;
DROP TABLE IF EXISTS `#__al_trabalhos`;
DROP TABLE IF EXISTS `#__al_banca`;
DROP TABLE IF EXISTS `#__al_autoria`;
DROP TABLE IF EXISTS `#__al_orientacao`;

CREATE TABLE `#__al_docentes` (
	`doc_id` INT(10) NOT NULL AUTO_INCREMENT,
	`doc_nome` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`doc_id`)
)
ENGINE =MyISAM
AUTO_INCREMENT =0;

CREATE TABLE `#__al_discentes` (
	`dis_id` INT(10) NOT NULL AUTO_INCREMENT,
	`dis_matricula` BIGINT(11),
	`dis_nome` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`dis_id`)
)
ENGINE =MyISAM
AUTO_INCREMENT =0;

CREATE TABLE `#__al_categorias` (
	`cat_id` INT(10) NOT NULL AUTO_INCREMENT,
	`cat_titulo` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`cat_id`)
)
ENGINE =MyISAM
AUTO_INCREMENT =0;

CREATE TABLE `#__al_trabalhos` (
	`tra_id` INT(10) NOT NULL AUTO_INCREMENT,

	`tra_tema` VARCHAR(255),
	`tra_titulo` VARCHAR(255),
	`tra_ano` INT(5),
	`tra_cat_id` INT(10),
	`tra_nota` DECIMAL(2,1),
	`tra_palavras_chaves` TEXT(65535),
	`tra_resumo` TEXT(65535),
	`tra_defesa_data` DATE,

	`tra_endereco_projeto` VARCHAR(255),
	`tra_endereco_trabalho` VARCHAR(255),

	`published` tinyint(4) NOT NULL DEFAULT '1',
	PRIMARY KEY (`tra_id`)
) ENGINE =MyISAM 
AUTO_INCREMENT =0 
DEFAULT CHARSET =utf8;

CREATE TABLE `#__al_banca` (
	`ban_tra_id` INT(10) NOT NULL,
	`ban_doc_id` INT(10) NOT NULL
)
ENGINE =MyISAM;

CREATE TABLE `#__al_autoria` (
	`aut_tra_id` INT(10) NOT NULL,
	`aut_dis_id` INT(10) NOT NULL
)
ENGINE =MyISAM;

CREATE TABLE `#__al_orientacao` (
	`ori_tra_id` INT(10) NOT NULL,
	`ori_doc_id` INT(10) NOT NULL
)
ENGINE =MyISAM;

ALTER TABLE `#__al_trabalhos`
   ADD CONSTRAINT tra_cat_id FOREIGN KEY(`tra_cat_id`) REFERENCES `#__al_categorias`(`cat_id`);

ALTER TABLE `#__al_banca`
	ADD CONSTRAINT ban_tra_id FOREIGN KEY(`ban_tra_id`) REFERENCES  `#__al_trabalhos`(`tra_id`),
   ADD CONSTRAINT ban_doc_id FOREIGN KEY(`ban_doc_id`) REFERENCES `#__al_docentes`(`doc_id`);

ALTER TABLE `#__al_autoria`
	ADD CONSTRAINT aut_tra_id FOREIGN KEY(`aut_tra_id`) REFERENCES  `#__al_trabalhos`(`tra_id`),
   ADD CONSTRAINT aut_dis_id FOREIGN KEY(`aut_dis_id`) REFERENCES `#__al_discentes`(`dis_id`);

ALTER TABLE `#__al_orientacao`
	ADD CONSTRAINT ori_tra_id FOREIGN KEY(`ori_tra_id`) REFERENCES  `#__al_trabalhos`(`tra_id`),
   ADD CONSTRAINT ori_doc_id FOREIGN KEY(`ori_doc_id`) REFERENCES `#__al_docentes`(`doc_id`);