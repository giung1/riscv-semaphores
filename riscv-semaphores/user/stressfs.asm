
user/_stressfs:     formato del fichero elf64-littleriscv


Desensamblado de la sección .text:

0000000000000000 <main>:
   0:	dd010113          	addi	sp,sp,-560
   4:	22113423          	sd	ra,552(sp)
   8:	22813023          	sd	s0,544(sp)
   c:	20913c23          	sd	s1,536(sp)
  10:	21213823          	sd	s2,528(sp)
  14:	1c00                	addi	s0,sp,560
  16:	00001797          	auipc	a5,0x1
  1a:	8ca78793          	addi	a5,a5,-1846 # 8e0 <malloc+0x11c>
  1e:	6398                	ld	a4,0(a5)
  20:	fce43823          	sd	a4,-48(s0)
  24:	0087d783          	lhu	a5,8(a5)
  28:	fcf41c23          	sh	a5,-40(s0)
  2c:	00001517          	auipc	a0,0x1
  30:	88450513          	addi	a0,a0,-1916 # 8b0 <malloc+0xec>
  34:	00000097          	auipc	ra,0x0
  38:	6d8080e7          	jalr	1752(ra) # 70c <printf>
  3c:	20000613          	li	a2,512
  40:	06100593          	li	a1,97
  44:	dd040513          	addi	a0,s0,-560
  48:	00000097          	auipc	ra,0x0
  4c:	150080e7          	jalr	336(ra) # 198 <memset>
  50:	4481                	li	s1,0
  52:	4911                	li	s2,4
  54:	00000097          	auipc	ra,0x0
  58:	336080e7          	jalr	822(ra) # 38a <fork>
  5c:	00a04563          	bgtz	a0,66 <main+0x66>
  60:	2485                	addiw	s1,s1,1
  62:	ff2499e3          	bne	s1,s2,54 <main+0x54>
  66:	85a6                	mv	a1,s1
  68:	00001517          	auipc	a0,0x1
  6c:	86050513          	addi	a0,a0,-1952 # 8c8 <malloc+0x104>
  70:	00000097          	auipc	ra,0x0
  74:	69c080e7          	jalr	1692(ra) # 70c <printf>
  78:	fd844783          	lbu	a5,-40(s0)
  7c:	9fa5                	addw	a5,a5,s1
  7e:	fcf40c23          	sb	a5,-40(s0)
  82:	20200593          	li	a1,514
  86:	fd040513          	addi	a0,s0,-48
  8a:	00000097          	auipc	ra,0x0
  8e:	348080e7          	jalr	840(ra) # 3d2 <open>
  92:	892a                	mv	s2,a0
  94:	44d1                	li	s1,20
  96:	20000613          	li	a2,512
  9a:	dd040593          	addi	a1,s0,-560
  9e:	854a                	mv	a0,s2
  a0:	00000097          	auipc	ra,0x0
  a4:	312080e7          	jalr	786(ra) # 3b2 <write>
  a8:	34fd                	addiw	s1,s1,-1
  aa:	f4f5                	bnez	s1,96 <main+0x96>
  ac:	854a                	mv	a0,s2
  ae:	00000097          	auipc	ra,0x0
  b2:	30c080e7          	jalr	780(ra) # 3ba <close>
  b6:	00001517          	auipc	a0,0x1
  ba:	82250513          	addi	a0,a0,-2014 # 8d8 <malloc+0x114>
  be:	00000097          	auipc	ra,0x0
  c2:	64e080e7          	jalr	1614(ra) # 70c <printf>
  c6:	4581                	li	a1,0
  c8:	fd040513          	addi	a0,s0,-48
  cc:	00000097          	auipc	ra,0x0
  d0:	306080e7          	jalr	774(ra) # 3d2 <open>
  d4:	892a                	mv	s2,a0
  d6:	44d1                	li	s1,20
  d8:	20000613          	li	a2,512
  dc:	dd040593          	addi	a1,s0,-560
  e0:	854a                	mv	a0,s2
  e2:	00000097          	auipc	ra,0x0
  e6:	2c8080e7          	jalr	712(ra) # 3aa <read>
  ea:	34fd                	addiw	s1,s1,-1
  ec:	f4f5                	bnez	s1,d8 <main+0xd8>
  ee:	854a                	mv	a0,s2
  f0:	00000097          	auipc	ra,0x0
  f4:	2ca080e7          	jalr	714(ra) # 3ba <close>
  f8:	4501                	li	a0,0
  fa:	00000097          	auipc	ra,0x0
  fe:	2a0080e7          	jalr	672(ra) # 39a <wait>
 102:	4501                	li	a0,0
 104:	00000097          	auipc	ra,0x0
 108:	28e080e7          	jalr	654(ra) # 392 <exit>

000000000000010c <_main>:
 10c:	1141                	addi	sp,sp,-16
 10e:	e406                	sd	ra,8(sp)
 110:	e022                	sd	s0,0(sp)
 112:	0800                	addi	s0,sp,16
 114:	00000097          	auipc	ra,0x0
 118:	eec080e7          	jalr	-276(ra) # 0 <main>
 11c:	4501                	li	a0,0
 11e:	00000097          	auipc	ra,0x0
 122:	274080e7          	jalr	628(ra) # 392 <exit>

0000000000000126 <strcpy>:
 126:	1141                	addi	sp,sp,-16
 128:	e422                	sd	s0,8(sp)
 12a:	0800                	addi	s0,sp,16
 12c:	87aa                	mv	a5,a0
 12e:	0585                	addi	a1,a1,1
 130:	0785                	addi	a5,a5,1
 132:	fff5c703          	lbu	a4,-1(a1)
 136:	fee78fa3          	sb	a4,-1(a5)
 13a:	fb75                	bnez	a4,12e <strcpy+0x8>
 13c:	6422                	ld	s0,8(sp)
 13e:	0141                	addi	sp,sp,16
 140:	8082                	ret

0000000000000142 <strcmp>:
 142:	1141                	addi	sp,sp,-16
 144:	e422                	sd	s0,8(sp)
 146:	0800                	addi	s0,sp,16
 148:	00054783          	lbu	a5,0(a0)
 14c:	cb91                	beqz	a5,160 <strcmp+0x1e>
 14e:	0005c703          	lbu	a4,0(a1)
 152:	00f71763          	bne	a4,a5,160 <strcmp+0x1e>
 156:	0505                	addi	a0,a0,1
 158:	0585                	addi	a1,a1,1
 15a:	00054783          	lbu	a5,0(a0)
 15e:	fbe5                	bnez	a5,14e <strcmp+0xc>
 160:	0005c503          	lbu	a0,0(a1)
 164:	40a7853b          	subw	a0,a5,a0
 168:	6422                	ld	s0,8(sp)
 16a:	0141                	addi	sp,sp,16
 16c:	8082                	ret

000000000000016e <strlen>:
 16e:	1141                	addi	sp,sp,-16
 170:	e422                	sd	s0,8(sp)
 172:	0800                	addi	s0,sp,16
 174:	00054783          	lbu	a5,0(a0)
 178:	cf91                	beqz	a5,194 <strlen+0x26>
 17a:	0505                	addi	a0,a0,1
 17c:	87aa                	mv	a5,a0
 17e:	4685                	li	a3,1
 180:	9e89                	subw	a3,a3,a0
 182:	00f6853b          	addw	a0,a3,a5
 186:	0785                	addi	a5,a5,1
 188:	fff7c703          	lbu	a4,-1(a5)
 18c:	fb7d                	bnez	a4,182 <strlen+0x14>
 18e:	6422                	ld	s0,8(sp)
 190:	0141                	addi	sp,sp,16
 192:	8082                	ret
 194:	4501                	li	a0,0
 196:	bfe5                	j	18e <strlen+0x20>

0000000000000198 <memset>:
 198:	1141                	addi	sp,sp,-16
 19a:	e422                	sd	s0,8(sp)
 19c:	0800                	addi	s0,sp,16
 19e:	ca19                	beqz	a2,1b4 <memset+0x1c>
 1a0:	87aa                	mv	a5,a0
 1a2:	1602                	slli	a2,a2,0x20
 1a4:	9201                	srli	a2,a2,0x20
 1a6:	00a60733          	add	a4,a2,a0
 1aa:	00b78023          	sb	a1,0(a5)
 1ae:	0785                	addi	a5,a5,1
 1b0:	fee79de3          	bne	a5,a4,1aa <memset+0x12>
 1b4:	6422                	ld	s0,8(sp)
 1b6:	0141                	addi	sp,sp,16
 1b8:	8082                	ret

00000000000001ba <strchr>:
 1ba:	1141                	addi	sp,sp,-16
 1bc:	e422                	sd	s0,8(sp)
 1be:	0800                	addi	s0,sp,16
 1c0:	00054783          	lbu	a5,0(a0)
 1c4:	cb99                	beqz	a5,1da <strchr+0x20>
 1c6:	00f58763          	beq	a1,a5,1d4 <strchr+0x1a>
 1ca:	0505                	addi	a0,a0,1
 1cc:	00054783          	lbu	a5,0(a0)
 1d0:	fbfd                	bnez	a5,1c6 <strchr+0xc>
 1d2:	4501                	li	a0,0
 1d4:	6422                	ld	s0,8(sp)
 1d6:	0141                	addi	sp,sp,16
 1d8:	8082                	ret
 1da:	4501                	li	a0,0
 1dc:	bfe5                	j	1d4 <strchr+0x1a>

00000000000001de <gets>:
 1de:	711d                	addi	sp,sp,-96
 1e0:	ec86                	sd	ra,88(sp)
 1e2:	e8a2                	sd	s0,80(sp)
 1e4:	e4a6                	sd	s1,72(sp)
 1e6:	e0ca                	sd	s2,64(sp)
 1e8:	fc4e                	sd	s3,56(sp)
 1ea:	f852                	sd	s4,48(sp)
 1ec:	f456                	sd	s5,40(sp)
 1ee:	f05a                	sd	s6,32(sp)
 1f0:	ec5e                	sd	s7,24(sp)
 1f2:	1080                	addi	s0,sp,96
 1f4:	8baa                	mv	s7,a0
 1f6:	8a2e                	mv	s4,a1
 1f8:	892a                	mv	s2,a0
 1fa:	4481                	li	s1,0
 1fc:	4aa9                	li	s5,10
 1fe:	4b35                	li	s6,13
 200:	89a6                	mv	s3,s1
 202:	2485                	addiw	s1,s1,1
 204:	0344d863          	bge	s1,s4,234 <gets+0x56>
 208:	4605                	li	a2,1
 20a:	faf40593          	addi	a1,s0,-81
 20e:	4501                	li	a0,0
 210:	00000097          	auipc	ra,0x0
 214:	19a080e7          	jalr	410(ra) # 3aa <read>
 218:	00a05e63          	blez	a0,234 <gets+0x56>
 21c:	faf44783          	lbu	a5,-81(s0)
 220:	00f90023          	sb	a5,0(s2)
 224:	01578763          	beq	a5,s5,232 <gets+0x54>
 228:	0905                	addi	s2,s2,1
 22a:	fd679be3          	bne	a5,s6,200 <gets+0x22>
 22e:	89a6                	mv	s3,s1
 230:	a011                	j	234 <gets+0x56>
 232:	89a6                	mv	s3,s1
 234:	99de                	add	s3,s3,s7
 236:	00098023          	sb	zero,0(s3)
 23a:	855e                	mv	a0,s7
 23c:	60e6                	ld	ra,88(sp)
 23e:	6446                	ld	s0,80(sp)
 240:	64a6                	ld	s1,72(sp)
 242:	6906                	ld	s2,64(sp)
 244:	79e2                	ld	s3,56(sp)
 246:	7a42                	ld	s4,48(sp)
 248:	7aa2                	ld	s5,40(sp)
 24a:	7b02                	ld	s6,32(sp)
 24c:	6be2                	ld	s7,24(sp)
 24e:	6125                	addi	sp,sp,96
 250:	8082                	ret

0000000000000252 <stat>:
 252:	1101                	addi	sp,sp,-32
 254:	ec06                	sd	ra,24(sp)
 256:	e822                	sd	s0,16(sp)
 258:	e426                	sd	s1,8(sp)
 25a:	e04a                	sd	s2,0(sp)
 25c:	1000                	addi	s0,sp,32
 25e:	892e                	mv	s2,a1
 260:	4581                	li	a1,0
 262:	00000097          	auipc	ra,0x0
 266:	170080e7          	jalr	368(ra) # 3d2 <open>
 26a:	02054563          	bltz	a0,294 <stat+0x42>
 26e:	84aa                	mv	s1,a0
 270:	85ca                	mv	a1,s2
 272:	00000097          	auipc	ra,0x0
 276:	178080e7          	jalr	376(ra) # 3ea <fstat>
 27a:	892a                	mv	s2,a0
 27c:	8526                	mv	a0,s1
 27e:	00000097          	auipc	ra,0x0
 282:	13c080e7          	jalr	316(ra) # 3ba <close>
 286:	854a                	mv	a0,s2
 288:	60e2                	ld	ra,24(sp)
 28a:	6442                	ld	s0,16(sp)
 28c:	64a2                	ld	s1,8(sp)
 28e:	6902                	ld	s2,0(sp)
 290:	6105                	addi	sp,sp,32
 292:	8082                	ret
 294:	597d                	li	s2,-1
 296:	bfc5                	j	286 <stat+0x34>

0000000000000298 <atoi>:
 298:	1141                	addi	sp,sp,-16
 29a:	e422                	sd	s0,8(sp)
 29c:	0800                	addi	s0,sp,16
 29e:	00054683          	lbu	a3,0(a0)
 2a2:	fd06879b          	addiw	a5,a3,-48
 2a6:	0ff7f793          	zext.b	a5,a5
 2aa:	4625                	li	a2,9
 2ac:	02f66863          	bltu	a2,a5,2dc <atoi+0x44>
 2b0:	872a                	mv	a4,a0
 2b2:	4501                	li	a0,0
 2b4:	0705                	addi	a4,a4,1
 2b6:	0025179b          	slliw	a5,a0,0x2
 2ba:	9fa9                	addw	a5,a5,a0
 2bc:	0017979b          	slliw	a5,a5,0x1
 2c0:	9fb5                	addw	a5,a5,a3
 2c2:	fd07851b          	addiw	a0,a5,-48
 2c6:	00074683          	lbu	a3,0(a4)
 2ca:	fd06879b          	addiw	a5,a3,-48
 2ce:	0ff7f793          	zext.b	a5,a5
 2d2:	fef671e3          	bgeu	a2,a5,2b4 <atoi+0x1c>
 2d6:	6422                	ld	s0,8(sp)
 2d8:	0141                	addi	sp,sp,16
 2da:	8082                	ret
 2dc:	4501                	li	a0,0
 2de:	bfe5                	j	2d6 <atoi+0x3e>

00000000000002e0 <memmove>:
 2e0:	1141                	addi	sp,sp,-16
 2e2:	e422                	sd	s0,8(sp)
 2e4:	0800                	addi	s0,sp,16
 2e6:	02b57463          	bgeu	a0,a1,30e <memmove+0x2e>
 2ea:	00c05f63          	blez	a2,308 <memmove+0x28>
 2ee:	1602                	slli	a2,a2,0x20
 2f0:	9201                	srli	a2,a2,0x20
 2f2:	00c507b3          	add	a5,a0,a2
 2f6:	872a                	mv	a4,a0
 2f8:	0585                	addi	a1,a1,1
 2fa:	0705                	addi	a4,a4,1
 2fc:	fff5c683          	lbu	a3,-1(a1)
 300:	fed70fa3          	sb	a3,-1(a4)
 304:	fee79ae3          	bne	a5,a4,2f8 <memmove+0x18>
 308:	6422                	ld	s0,8(sp)
 30a:	0141                	addi	sp,sp,16
 30c:	8082                	ret
 30e:	00c50733          	add	a4,a0,a2
 312:	95b2                	add	a1,a1,a2
 314:	fec05ae3          	blez	a2,308 <memmove+0x28>
 318:	fff6079b          	addiw	a5,a2,-1
 31c:	1782                	slli	a5,a5,0x20
 31e:	9381                	srli	a5,a5,0x20
 320:	fff7c793          	not	a5,a5
 324:	97ba                	add	a5,a5,a4
 326:	15fd                	addi	a1,a1,-1
 328:	177d                	addi	a4,a4,-1
 32a:	0005c683          	lbu	a3,0(a1)
 32e:	00d70023          	sb	a3,0(a4)
 332:	fee79ae3          	bne	a5,a4,326 <memmove+0x46>
 336:	bfc9                	j	308 <memmove+0x28>

0000000000000338 <memcmp>:
 338:	1141                	addi	sp,sp,-16
 33a:	e422                	sd	s0,8(sp)
 33c:	0800                	addi	s0,sp,16
 33e:	ca05                	beqz	a2,36e <memcmp+0x36>
 340:	fff6069b          	addiw	a3,a2,-1
 344:	1682                	slli	a3,a3,0x20
 346:	9281                	srli	a3,a3,0x20
 348:	0685                	addi	a3,a3,1
 34a:	96aa                	add	a3,a3,a0
 34c:	00054783          	lbu	a5,0(a0)
 350:	0005c703          	lbu	a4,0(a1)
 354:	00e79863          	bne	a5,a4,364 <memcmp+0x2c>
 358:	0505                	addi	a0,a0,1
 35a:	0585                	addi	a1,a1,1
 35c:	fed518e3          	bne	a0,a3,34c <memcmp+0x14>
 360:	4501                	li	a0,0
 362:	a019                	j	368 <memcmp+0x30>
 364:	40e7853b          	subw	a0,a5,a4
 368:	6422                	ld	s0,8(sp)
 36a:	0141                	addi	sp,sp,16
 36c:	8082                	ret
 36e:	4501                	li	a0,0
 370:	bfe5                	j	368 <memcmp+0x30>

0000000000000372 <memcpy>:
 372:	1141                	addi	sp,sp,-16
 374:	e406                	sd	ra,8(sp)
 376:	e022                	sd	s0,0(sp)
 378:	0800                	addi	s0,sp,16
 37a:	00000097          	auipc	ra,0x0
 37e:	f66080e7          	jalr	-154(ra) # 2e0 <memmove>
 382:	60a2                	ld	ra,8(sp)
 384:	6402                	ld	s0,0(sp)
 386:	0141                	addi	sp,sp,16
 388:	8082                	ret

000000000000038a <fork>:
 38a:	4885                	li	a7,1
 38c:	00000073          	ecall
 390:	8082                	ret

0000000000000392 <exit>:
 392:	4889                	li	a7,2
 394:	00000073          	ecall
 398:	8082                	ret

000000000000039a <wait>:
 39a:	488d                	li	a7,3
 39c:	00000073          	ecall
 3a0:	8082                	ret

00000000000003a2 <pipe>:
 3a2:	4891                	li	a7,4
 3a4:	00000073          	ecall
 3a8:	8082                	ret

00000000000003aa <read>:
 3aa:	4895                	li	a7,5
 3ac:	00000073          	ecall
 3b0:	8082                	ret

00000000000003b2 <write>:
 3b2:	48c1                	li	a7,16
 3b4:	00000073          	ecall
 3b8:	8082                	ret

00000000000003ba <close>:
 3ba:	48d5                	li	a7,21
 3bc:	00000073          	ecall
 3c0:	8082                	ret

00000000000003c2 <kill>:
 3c2:	4899                	li	a7,6
 3c4:	00000073          	ecall
 3c8:	8082                	ret

00000000000003ca <exec>:
 3ca:	489d                	li	a7,7
 3cc:	00000073          	ecall
 3d0:	8082                	ret

00000000000003d2 <open>:
 3d2:	48bd                	li	a7,15
 3d4:	00000073          	ecall
 3d8:	8082                	ret

00000000000003da <mknod>:
 3da:	48c5                	li	a7,17
 3dc:	00000073          	ecall
 3e0:	8082                	ret

00000000000003e2 <unlink>:
 3e2:	48c9                	li	a7,18
 3e4:	00000073          	ecall
 3e8:	8082                	ret

00000000000003ea <fstat>:
 3ea:	48a1                	li	a7,8
 3ec:	00000073          	ecall
 3f0:	8082                	ret

00000000000003f2 <link>:
 3f2:	48cd                	li	a7,19
 3f4:	00000073          	ecall
 3f8:	8082                	ret

00000000000003fa <mkdir>:
 3fa:	48d1                	li	a7,20
 3fc:	00000073          	ecall
 400:	8082                	ret

0000000000000402 <chdir>:
 402:	48a5                	li	a7,9
 404:	00000073          	ecall
 408:	8082                	ret

000000000000040a <dup>:
 40a:	48a9                	li	a7,10
 40c:	00000073          	ecall
 410:	8082                	ret

0000000000000412 <getpid>:
 412:	48ad                	li	a7,11
 414:	00000073          	ecall
 418:	8082                	ret

000000000000041a <sbrk>:
 41a:	48b1                	li	a7,12
 41c:	00000073          	ecall
 420:	8082                	ret

0000000000000422 <sleep>:
 422:	48b5                	li	a7,13
 424:	00000073          	ecall
 428:	8082                	ret

000000000000042a <uptime>:
 42a:	48b9                	li	a7,14
 42c:	00000073          	ecall
 430:	8082                	ret

0000000000000432 <putc>:
 432:	1101                	addi	sp,sp,-32
 434:	ec06                	sd	ra,24(sp)
 436:	e822                	sd	s0,16(sp)
 438:	1000                	addi	s0,sp,32
 43a:	feb407a3          	sb	a1,-17(s0)
 43e:	4605                	li	a2,1
 440:	fef40593          	addi	a1,s0,-17
 444:	00000097          	auipc	ra,0x0
 448:	f6e080e7          	jalr	-146(ra) # 3b2 <write>
 44c:	60e2                	ld	ra,24(sp)
 44e:	6442                	ld	s0,16(sp)
 450:	6105                	addi	sp,sp,32
 452:	8082                	ret

0000000000000454 <printint>:
 454:	7139                	addi	sp,sp,-64
 456:	fc06                	sd	ra,56(sp)
 458:	f822                	sd	s0,48(sp)
 45a:	f426                	sd	s1,40(sp)
 45c:	f04a                	sd	s2,32(sp)
 45e:	ec4e                	sd	s3,24(sp)
 460:	0080                	addi	s0,sp,64
 462:	84aa                	mv	s1,a0
 464:	c299                	beqz	a3,46a <printint+0x16>
 466:	0805c963          	bltz	a1,4f8 <printint+0xa4>
 46a:	2581                	sext.w	a1,a1
 46c:	4881                	li	a7,0
 46e:	fc040693          	addi	a3,s0,-64
 472:	4701                	li	a4,0
 474:	2601                	sext.w	a2,a2
 476:	00000517          	auipc	a0,0x0
 47a:	4da50513          	addi	a0,a0,1242 # 950 <digits>
 47e:	883a                	mv	a6,a4
 480:	2705                	addiw	a4,a4,1
 482:	02c5f7bb          	remuw	a5,a1,a2
 486:	1782                	slli	a5,a5,0x20
 488:	9381                	srli	a5,a5,0x20
 48a:	97aa                	add	a5,a5,a0
 48c:	0007c783          	lbu	a5,0(a5)
 490:	00f68023          	sb	a5,0(a3)
 494:	0005879b          	sext.w	a5,a1
 498:	02c5d5bb          	divuw	a1,a1,a2
 49c:	0685                	addi	a3,a3,1
 49e:	fec7f0e3          	bgeu	a5,a2,47e <printint+0x2a>
 4a2:	00088c63          	beqz	a7,4ba <printint+0x66>
 4a6:	fd070793          	addi	a5,a4,-48
 4aa:	00878733          	add	a4,a5,s0
 4ae:	02d00793          	li	a5,45
 4b2:	fef70823          	sb	a5,-16(a4)
 4b6:	0028071b          	addiw	a4,a6,2
 4ba:	02e05863          	blez	a4,4ea <printint+0x96>
 4be:	fc040793          	addi	a5,s0,-64
 4c2:	00e78933          	add	s2,a5,a4
 4c6:	fff78993          	addi	s3,a5,-1
 4ca:	99ba                	add	s3,s3,a4
 4cc:	377d                	addiw	a4,a4,-1
 4ce:	1702                	slli	a4,a4,0x20
 4d0:	9301                	srli	a4,a4,0x20
 4d2:	40e989b3          	sub	s3,s3,a4
 4d6:	fff94583          	lbu	a1,-1(s2)
 4da:	8526                	mv	a0,s1
 4dc:	00000097          	auipc	ra,0x0
 4e0:	f56080e7          	jalr	-170(ra) # 432 <putc>
 4e4:	197d                	addi	s2,s2,-1
 4e6:	ff3918e3          	bne	s2,s3,4d6 <printint+0x82>
 4ea:	70e2                	ld	ra,56(sp)
 4ec:	7442                	ld	s0,48(sp)
 4ee:	74a2                	ld	s1,40(sp)
 4f0:	7902                	ld	s2,32(sp)
 4f2:	69e2                	ld	s3,24(sp)
 4f4:	6121                	addi	sp,sp,64
 4f6:	8082                	ret
 4f8:	40b005bb          	negw	a1,a1
 4fc:	4885                	li	a7,1
 4fe:	bf85                	j	46e <printint+0x1a>

0000000000000500 <vprintf>:
 500:	7119                	addi	sp,sp,-128
 502:	fc86                	sd	ra,120(sp)
 504:	f8a2                	sd	s0,112(sp)
 506:	f4a6                	sd	s1,104(sp)
 508:	f0ca                	sd	s2,96(sp)
 50a:	ecce                	sd	s3,88(sp)
 50c:	e8d2                	sd	s4,80(sp)
 50e:	e4d6                	sd	s5,72(sp)
 510:	e0da                	sd	s6,64(sp)
 512:	fc5e                	sd	s7,56(sp)
 514:	f862                	sd	s8,48(sp)
 516:	f466                	sd	s9,40(sp)
 518:	f06a                	sd	s10,32(sp)
 51a:	ec6e                	sd	s11,24(sp)
 51c:	0100                	addi	s0,sp,128
 51e:	0005c903          	lbu	s2,0(a1)
 522:	18090f63          	beqz	s2,6c0 <vprintf+0x1c0>
 526:	8aaa                	mv	s5,a0
 528:	8b32                	mv	s6,a2
 52a:	00158493          	addi	s1,a1,1
 52e:	4981                	li	s3,0
 530:	02500a13          	li	s4,37
 534:	4c55                	li	s8,21
 536:	00000c97          	auipc	s9,0x0
 53a:	3c2c8c93          	addi	s9,s9,962 # 8f8 <malloc+0x134>
 53e:	02800d93          	li	s11,40
 542:	4d41                	li	s10,16
 544:	00000b97          	auipc	s7,0x0
 548:	40cb8b93          	addi	s7,s7,1036 # 950 <digits>
 54c:	a839                	j	56a <vprintf+0x6a>
 54e:	85ca                	mv	a1,s2
 550:	8556                	mv	a0,s5
 552:	00000097          	auipc	ra,0x0
 556:	ee0080e7          	jalr	-288(ra) # 432 <putc>
 55a:	a019                	j	560 <vprintf+0x60>
 55c:	01498d63          	beq	s3,s4,576 <vprintf+0x76>
 560:	0485                	addi	s1,s1,1
 562:	fff4c903          	lbu	s2,-1(s1)
 566:	14090d63          	beqz	s2,6c0 <vprintf+0x1c0>
 56a:	fe0999e3          	bnez	s3,55c <vprintf+0x5c>
 56e:	ff4910e3          	bne	s2,s4,54e <vprintf+0x4e>
 572:	89d2                	mv	s3,s4
 574:	b7f5                	j	560 <vprintf+0x60>
 576:	11490c63          	beq	s2,s4,68e <vprintf+0x18e>
 57a:	f9d9079b          	addiw	a5,s2,-99
 57e:	0ff7f793          	zext.b	a5,a5
 582:	10fc6e63          	bltu	s8,a5,69e <vprintf+0x19e>
 586:	f9d9079b          	addiw	a5,s2,-99
 58a:	0ff7f713          	zext.b	a4,a5
 58e:	10ec6863          	bltu	s8,a4,69e <vprintf+0x19e>
 592:	00271793          	slli	a5,a4,0x2
 596:	97e6                	add	a5,a5,s9
 598:	439c                	lw	a5,0(a5)
 59a:	97e6                	add	a5,a5,s9
 59c:	8782                	jr	a5
 59e:	008b0913          	addi	s2,s6,8
 5a2:	4685                	li	a3,1
 5a4:	4629                	li	a2,10
 5a6:	000b2583          	lw	a1,0(s6)
 5aa:	8556                	mv	a0,s5
 5ac:	00000097          	auipc	ra,0x0
 5b0:	ea8080e7          	jalr	-344(ra) # 454 <printint>
 5b4:	8b4a                	mv	s6,s2
 5b6:	4981                	li	s3,0
 5b8:	b765                	j	560 <vprintf+0x60>
 5ba:	008b0913          	addi	s2,s6,8
 5be:	4681                	li	a3,0
 5c0:	4629                	li	a2,10
 5c2:	000b2583          	lw	a1,0(s6)
 5c6:	8556                	mv	a0,s5
 5c8:	00000097          	auipc	ra,0x0
 5cc:	e8c080e7          	jalr	-372(ra) # 454 <printint>
 5d0:	8b4a                	mv	s6,s2
 5d2:	4981                	li	s3,0
 5d4:	b771                	j	560 <vprintf+0x60>
 5d6:	008b0913          	addi	s2,s6,8
 5da:	4681                	li	a3,0
 5dc:	866a                	mv	a2,s10
 5de:	000b2583          	lw	a1,0(s6)
 5e2:	8556                	mv	a0,s5
 5e4:	00000097          	auipc	ra,0x0
 5e8:	e70080e7          	jalr	-400(ra) # 454 <printint>
 5ec:	8b4a                	mv	s6,s2
 5ee:	4981                	li	s3,0
 5f0:	bf85                	j	560 <vprintf+0x60>
 5f2:	008b0793          	addi	a5,s6,8
 5f6:	f8f43423          	sd	a5,-120(s0)
 5fa:	000b3983          	ld	s3,0(s6)
 5fe:	03000593          	li	a1,48
 602:	8556                	mv	a0,s5
 604:	00000097          	auipc	ra,0x0
 608:	e2e080e7          	jalr	-466(ra) # 432 <putc>
 60c:	07800593          	li	a1,120
 610:	8556                	mv	a0,s5
 612:	00000097          	auipc	ra,0x0
 616:	e20080e7          	jalr	-480(ra) # 432 <putc>
 61a:	896a                	mv	s2,s10
 61c:	03c9d793          	srli	a5,s3,0x3c
 620:	97de                	add	a5,a5,s7
 622:	0007c583          	lbu	a1,0(a5)
 626:	8556                	mv	a0,s5
 628:	00000097          	auipc	ra,0x0
 62c:	e0a080e7          	jalr	-502(ra) # 432 <putc>
 630:	0992                	slli	s3,s3,0x4
 632:	397d                	addiw	s2,s2,-1
 634:	fe0914e3          	bnez	s2,61c <vprintf+0x11c>
 638:	f8843b03          	ld	s6,-120(s0)
 63c:	4981                	li	s3,0
 63e:	b70d                	j	560 <vprintf+0x60>
 640:	008b0913          	addi	s2,s6,8
 644:	000b3983          	ld	s3,0(s6)
 648:	02098163          	beqz	s3,66a <vprintf+0x16a>
 64c:	0009c583          	lbu	a1,0(s3)
 650:	c5ad                	beqz	a1,6ba <vprintf+0x1ba>
 652:	8556                	mv	a0,s5
 654:	00000097          	auipc	ra,0x0
 658:	dde080e7          	jalr	-546(ra) # 432 <putc>
 65c:	0985                	addi	s3,s3,1
 65e:	0009c583          	lbu	a1,0(s3)
 662:	f9e5                	bnez	a1,652 <vprintf+0x152>
 664:	8b4a                	mv	s6,s2
 666:	4981                	li	s3,0
 668:	bde5                	j	560 <vprintf+0x60>
 66a:	00000997          	auipc	s3,0x0
 66e:	28698993          	addi	s3,s3,646 # 8f0 <malloc+0x12c>
 672:	85ee                	mv	a1,s11
 674:	bff9                	j	652 <vprintf+0x152>
 676:	008b0913          	addi	s2,s6,8
 67a:	000b4583          	lbu	a1,0(s6)
 67e:	8556                	mv	a0,s5
 680:	00000097          	auipc	ra,0x0
 684:	db2080e7          	jalr	-590(ra) # 432 <putc>
 688:	8b4a                	mv	s6,s2
 68a:	4981                	li	s3,0
 68c:	bdd1                	j	560 <vprintf+0x60>
 68e:	85d2                	mv	a1,s4
 690:	8556                	mv	a0,s5
 692:	00000097          	auipc	ra,0x0
 696:	da0080e7          	jalr	-608(ra) # 432 <putc>
 69a:	4981                	li	s3,0
 69c:	b5d1                	j	560 <vprintf+0x60>
 69e:	85d2                	mv	a1,s4
 6a0:	8556                	mv	a0,s5
 6a2:	00000097          	auipc	ra,0x0
 6a6:	d90080e7          	jalr	-624(ra) # 432 <putc>
 6aa:	85ca                	mv	a1,s2
 6ac:	8556                	mv	a0,s5
 6ae:	00000097          	auipc	ra,0x0
 6b2:	d84080e7          	jalr	-636(ra) # 432 <putc>
 6b6:	4981                	li	s3,0
 6b8:	b565                	j	560 <vprintf+0x60>
 6ba:	8b4a                	mv	s6,s2
 6bc:	4981                	li	s3,0
 6be:	b54d                	j	560 <vprintf+0x60>
 6c0:	70e6                	ld	ra,120(sp)
 6c2:	7446                	ld	s0,112(sp)
 6c4:	74a6                	ld	s1,104(sp)
 6c6:	7906                	ld	s2,96(sp)
 6c8:	69e6                	ld	s3,88(sp)
 6ca:	6a46                	ld	s4,80(sp)
 6cc:	6aa6                	ld	s5,72(sp)
 6ce:	6b06                	ld	s6,64(sp)
 6d0:	7be2                	ld	s7,56(sp)
 6d2:	7c42                	ld	s8,48(sp)
 6d4:	7ca2                	ld	s9,40(sp)
 6d6:	7d02                	ld	s10,32(sp)
 6d8:	6de2                	ld	s11,24(sp)
 6da:	6109                	addi	sp,sp,128
 6dc:	8082                	ret

00000000000006de <fprintf>:
 6de:	715d                	addi	sp,sp,-80
 6e0:	ec06                	sd	ra,24(sp)
 6e2:	e822                	sd	s0,16(sp)
 6e4:	1000                	addi	s0,sp,32
 6e6:	e010                	sd	a2,0(s0)
 6e8:	e414                	sd	a3,8(s0)
 6ea:	e818                	sd	a4,16(s0)
 6ec:	ec1c                	sd	a5,24(s0)
 6ee:	03043023          	sd	a6,32(s0)
 6f2:	03143423          	sd	a7,40(s0)
 6f6:	fe843423          	sd	s0,-24(s0)
 6fa:	8622                	mv	a2,s0
 6fc:	00000097          	auipc	ra,0x0
 700:	e04080e7          	jalr	-508(ra) # 500 <vprintf>
 704:	60e2                	ld	ra,24(sp)
 706:	6442                	ld	s0,16(sp)
 708:	6161                	addi	sp,sp,80
 70a:	8082                	ret

000000000000070c <printf>:
 70c:	711d                	addi	sp,sp,-96
 70e:	ec06                	sd	ra,24(sp)
 710:	e822                	sd	s0,16(sp)
 712:	1000                	addi	s0,sp,32
 714:	e40c                	sd	a1,8(s0)
 716:	e810                	sd	a2,16(s0)
 718:	ec14                	sd	a3,24(s0)
 71a:	f018                	sd	a4,32(s0)
 71c:	f41c                	sd	a5,40(s0)
 71e:	03043823          	sd	a6,48(s0)
 722:	03143c23          	sd	a7,56(s0)
 726:	00840613          	addi	a2,s0,8
 72a:	fec43423          	sd	a2,-24(s0)
 72e:	85aa                	mv	a1,a0
 730:	4505                	li	a0,1
 732:	00000097          	auipc	ra,0x0
 736:	dce080e7          	jalr	-562(ra) # 500 <vprintf>
 73a:	60e2                	ld	ra,24(sp)
 73c:	6442                	ld	s0,16(sp)
 73e:	6125                	addi	sp,sp,96
 740:	8082                	ret

0000000000000742 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 742:	1141                	addi	sp,sp,-16
 744:	e422                	sd	s0,8(sp)
 746:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 748:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 74c:	00001797          	auipc	a5,0x1
 750:	8b47b783          	ld	a5,-1868(a5) # 1000 <freep>
 754:	a02d                	j	77e <free+0x3c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 756:	4618                	lw	a4,8(a2)
 758:	9f2d                	addw	a4,a4,a1
 75a:	fee52c23          	sw	a4,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 75e:	6398                	ld	a4,0(a5)
 760:	6310                	ld	a2,0(a4)
 762:	a83d                	j	7a0 <free+0x5e>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 764:	ff852703          	lw	a4,-8(a0)
 768:	9f31                	addw	a4,a4,a2
 76a:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 76c:	ff053683          	ld	a3,-16(a0)
 770:	a091                	j	7b4 <free+0x72>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 772:	6398                	ld	a4,0(a5)
 774:	00e7e463          	bltu	a5,a4,77c <free+0x3a>
 778:	00e6ea63          	bltu	a3,a4,78c <free+0x4a>
{
 77c:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 77e:	fed7fae3          	bgeu	a5,a3,772 <free+0x30>
 782:	6398                	ld	a4,0(a5)
 784:	00e6e463          	bltu	a3,a4,78c <free+0x4a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 788:	fee7eae3          	bltu	a5,a4,77c <free+0x3a>
  if(bp + bp->s.size == p->s.ptr){
 78c:	ff852583          	lw	a1,-8(a0)
 790:	6390                	ld	a2,0(a5)
 792:	02059813          	slli	a6,a1,0x20
 796:	01c85713          	srli	a4,a6,0x1c
 79a:	9736                	add	a4,a4,a3
 79c:	fae60de3          	beq	a2,a4,756 <free+0x14>
    bp->s.ptr = p->s.ptr->s.ptr;
 7a0:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 7a4:	4790                	lw	a2,8(a5)
 7a6:	02061593          	slli	a1,a2,0x20
 7aa:	01c5d713          	srli	a4,a1,0x1c
 7ae:	973e                	add	a4,a4,a5
 7b0:	fae68ae3          	beq	a3,a4,764 <free+0x22>
    p->s.ptr = bp->s.ptr;
 7b4:	e394                	sd	a3,0(a5)
  } else
    p->s.ptr = bp;
  freep = p;
 7b6:	00001717          	auipc	a4,0x1
 7ba:	84f73523          	sd	a5,-1974(a4) # 1000 <freep>
}
 7be:	6422                	ld	s0,8(sp)
 7c0:	0141                	addi	sp,sp,16
 7c2:	8082                	ret

00000000000007c4 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7c4:	7139                	addi	sp,sp,-64
 7c6:	fc06                	sd	ra,56(sp)
 7c8:	f822                	sd	s0,48(sp)
 7ca:	f426                	sd	s1,40(sp)
 7cc:	f04a                	sd	s2,32(sp)
 7ce:	ec4e                	sd	s3,24(sp)
 7d0:	e852                	sd	s4,16(sp)
 7d2:	e456                	sd	s5,8(sp)
 7d4:	e05a                	sd	s6,0(sp)
 7d6:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7d8:	02051493          	slli	s1,a0,0x20
 7dc:	9081                	srli	s1,s1,0x20
 7de:	04bd                	addi	s1,s1,15
 7e0:	8091                	srli	s1,s1,0x4
 7e2:	0014899b          	addiw	s3,s1,1
 7e6:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 7e8:	00001517          	auipc	a0,0x1
 7ec:	81853503          	ld	a0,-2024(a0) # 1000 <freep>
 7f0:	c515                	beqz	a0,81c <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7f2:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 7f4:	4798                	lw	a4,8(a5)
 7f6:	02977f63          	bgeu	a4,s1,834 <malloc+0x70>
 7fa:	8a4e                	mv	s4,s3
 7fc:	0009871b          	sext.w	a4,s3
 800:	6685                	lui	a3,0x1
 802:	00d77363          	bgeu	a4,a3,808 <malloc+0x44>
 806:	6a05                	lui	s4,0x1
 808:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 80c:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 810:	00000917          	auipc	s2,0x0
 814:	7f090913          	addi	s2,s2,2032 # 1000 <freep>
  if(p == (char*)-1)
 818:	5afd                	li	s5,-1
 81a:	a895                	j	88e <malloc+0xca>
    base.s.ptr = freep = prevp = &base;
 81c:	00000797          	auipc	a5,0x0
 820:	7f478793          	addi	a5,a5,2036 # 1010 <base>
 824:	00000717          	auipc	a4,0x0
 828:	7cf73e23          	sd	a5,2012(a4) # 1000 <freep>
 82c:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 82e:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 832:	b7e1                	j	7fa <malloc+0x36>
      if(p->s.size == nunits)
 834:	02e48c63          	beq	s1,a4,86c <malloc+0xa8>
        p->s.size -= nunits;
 838:	4137073b          	subw	a4,a4,s3
 83c:	c798                	sw	a4,8(a5)
        p += p->s.size;
 83e:	02071693          	slli	a3,a4,0x20
 842:	01c6d713          	srli	a4,a3,0x1c
 846:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 848:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 84c:	00000717          	auipc	a4,0x0
 850:	7aa73a23          	sd	a0,1972(a4) # 1000 <freep>
      return (void*)(p + 1);
 854:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 858:	70e2                	ld	ra,56(sp)
 85a:	7442                	ld	s0,48(sp)
 85c:	74a2                	ld	s1,40(sp)
 85e:	7902                	ld	s2,32(sp)
 860:	69e2                	ld	s3,24(sp)
 862:	6a42                	ld	s4,16(sp)
 864:	6aa2                	ld	s5,8(sp)
 866:	6b02                	ld	s6,0(sp)
 868:	6121                	addi	sp,sp,64
 86a:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 86c:	6398                	ld	a4,0(a5)
 86e:	e118                	sd	a4,0(a0)
 870:	bff1                	j	84c <malloc+0x88>
  hp->s.size = nu;
 872:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 876:	0541                	addi	a0,a0,16
 878:	00000097          	auipc	ra,0x0
 87c:	eca080e7          	jalr	-310(ra) # 742 <free>
  return freep;
 880:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 884:	d971                	beqz	a0,858 <malloc+0x94>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 886:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 888:	4798                	lw	a4,8(a5)
 88a:	fa9775e3          	bgeu	a4,s1,834 <malloc+0x70>
    if(p == freep)
 88e:	00093703          	ld	a4,0(s2)
 892:	853e                	mv	a0,a5
 894:	fef719e3          	bne	a4,a5,886 <malloc+0xc2>
  p = sbrk(nu * sizeof(Header));
 898:	8552                	mv	a0,s4
 89a:	00000097          	auipc	ra,0x0
 89e:	b80080e7          	jalr	-1152(ra) # 41a <sbrk>
  if(p == (char*)-1)
 8a2:	fd5518e3          	bne	a0,s5,872 <malloc+0xae>
        return 0;
 8a6:	4501                	li	a0,0
 8a8:	bf45                	j	858 <malloc+0x94>
