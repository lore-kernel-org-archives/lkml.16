Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06EF26BD8B
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 06:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739254651; cv=none; b=d+94fK4K1IHljMj16CNJmcG8xZLORqhB8AHGkz0wldb+Do+jX9ZoDrXFT/3ywrcqCbQfgcd8s9VXlpf6vKnOhWvFo3EgfOct8QjpWz8BWVTUvgWV0xjxC9ouceTZ0hL7Nfdek2GcQiYLBETvVMKvfr5IErrZl+MtOjrVI+LwRyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739254651; c=relaxed/simple;
	bh=pawQH0X2eo4RQikQwbqJwPs4SaDTjDOKU0TkkRMKASs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ptTNsZahkwZ0+9G/wTv5CAg84+GxhM/xx96Xsocw/6oJtwD/tok3hjF6auvLeflRAzEOs1eBa21CQa2LojUbhi8lqg+kt2QIwPVW+V4tbOOJ66AzWiiqvgr7bL7Gpn7Zmiw/D/x8YjrMbP1aXLma5mJQDdFSG25srDf1AmZAanY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aDs58eJc; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aDs58eJc"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21f62cc4088so55312865ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 22:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739254649; x=1739859449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z3xXFqpADFNZHcvFuJ7TdGB3NCFsB9U489yzK7E0MwM=;
        b=aDs58eJcqUur5DcmmXMwhzEIDpj9BLX/mfKzUgPilHB7gerQLcpx6OuF0+j+5kZ2/f
         mGEsLuAs3bYarb/LkUAwSdtqueGM/II0NlE3nrqMQjgOYiX0+IWOU9WR1JhKMFsCjmmt
         ipDdLlaPBOEBcQ4OqsJOhEI1SpDHbpCIV/Er6Rp7QXTFKZwuc+NZXDO6BkP4insxi3QK
         HYKce+W5VTIs4XdKzFUROTjx7K9+IMaJyEM4fEgcM7rH7BZ8FGNiqR6C5Z7G0Fy2Ev8C
         scjo6gHm1L9pw05/SQoqYwwo9P9ZPSZ1ZOuKs1bDDA6rIGZZTFHU8dmIhNO8P5wIXGdQ
         jiGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739254649; x=1739859449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z3xXFqpADFNZHcvFuJ7TdGB3NCFsB9U489yzK7E0MwM=;
        b=OWYqA7M+Kf/VUo21KvQY0wHUuqooXlwoBfIaD6YqV6jB3gRWotnWuwxzk5yzKG0w7c
         u7nWjSkGuwflQMyAr+sRI3F8kyVz88TMivY7RHfrRKkxd1lw44vkukSoU5g6V38EEH5X
         mseb93JyiP77oqWHs7wqBhzyacEZfRFyKxxExcxD2unfJKNY6kmEwtirUUdMcJKxXDBE
         JNks5VpkqlZBeAOWJG3Gfq2Zcs2Rlu4WdSpr62+iTkwWpj9789TDcvT+03ZdSqSKATtE
         K6PdayQnuwXVCfzsAp5EvYnQ4RSQy2W3ecX94P5bCfsEr9VJqII+C6hW+jaq7D9/cb7H
         AMXQ==
X-Gm-Message-State: AOJu0YxSpBrxCldkuxGbPCe3rYAxpHTIuPgvtXMY7142m3QEmCtvFUfO
	fLgOVOVlxdqlBWe41p+dosZzu7FZZj1Y2tQDOXqJHyETm8uUs1eZ
X-Gm-Gg: ASbGncvovGEGnTMX+icmyy/IGFHPb6ljM0myxdrX8wYfYgAw0GPwhbD8hOViUKaVplI
	CM7Ta6RDFATD/JEUoA5Bdoo0xJwEU9VWzYcmAMReA/YlG8M3HgmwhGPv8L/o8YLAd8/M+jJthVr
	OOZmGVb2mTFdoNUYw+ipPPtZWcgoOrDsOAjmpAOci+Gxmq/glYjRRXqGqklOEvOTNYRvTiXEz/g
	ygtIqf/1zOPH+Whxn8nT3WDvrMlb/T0jYXc1CSyWQBfINuytjGSVD5aa1D7eqIfWcmZjYZtl+LQ
	xTPoeKTgqdZO0l0jG5aD6fsE/A==
X-Google-Smtp-Source: AGHT+IHHkFlDYsexZ50tzC+zGsgDMzYjQ3Ah1jbbEIROCa+3DhdaFkiA8lecw3AISzqkzfNLGAfMHA==
X-Received: by 2002:a17:902:f54a:b0:215:44fe:163e with SMTP id d9443c01a7336-21f4e1cf11emr238380195ad.1.1739254648732;
        Mon, 10 Feb 2025 22:17:28 -0800 (PST)
Received: from xiaoa.mioffice.cn ([118.143.233.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f36561c0bsm88630085ad.102.2025.02.10.22.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 22:17:28 -0800 (PST)
From: Xiang Gao <gxxa03070307@gmail.com>
To: brauner@kernel.org,
	viro@zeniv.linux.org.uk,
	rostedt@goodmis.org,
	bhe@redhat.com,
	amir73il@gmail.com,
	joel.granados@kernel.org
Cc: linux-kernel@vger.kernel.org,
	gaoxiang17 <gaoxiang17@xiaomi.com>
Subject: [PATCH] pid: Add a judgment for ns null in pid_nr_ns
Date: Tue, 11 Feb 2025 14:17:12 +0800
Message-Id: <20250211061712.3234465-1-gxxa03070307@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: gaoxiang17 <gaoxiang17@xiaomi.com>

__task_pid_nr_ns
        ns = task_active_pid_ns(current);
        pid_nr_ns(rcu_dereference(*task_pid_ptr(task, type)), ns);
                if (pid && ns->level <= pid->level) {

Sometimes null is returned for task_active_pid_ns. Then it will trigger kernel panic in pid_nr_ns.

For example:
	Unable to handle kernel NULL pointer dereference at virtual address 0000000000000058
	Mem abort info:
	ESR = 0x0000000096000007
	EC = 0x25: DABT (current EL), IL = 32 bits
	SET = 0, FnV = 0
	EA = 0, S1PTW = 0
	FSC = 0x07: level 3 translation fault
	Data abort info:
	ISV = 0, ISS = 0x00000007, ISS2 = 0x00000000
	CM = 0, WnR = 0, TnD = 0, TagAccess = 0
	GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
	user pgtable: 4k pages, 39-bit VAs, pgdp=00000002175aa000
	[0000000000000058] pgd=08000002175ab003, p4d=08000002175ab003, pud=08000002175ab003, pmd=08000002175be003, pte=0000000000000000
	pstate: 834000c5 (Nzcv daIF +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
	pc : __task_pid_nr_ns+0x74/0xd0
	lr : __task_pid_nr_ns+0x24/0xd0
	sp : ffffffc08001bd10
	x29: ffffffc08001bd10 x28: ffffffd4422b2000 x27: 0000000000000001
	x26: ffffffd442821168 x25: ffffffd442821000 x24: 00000f89492eab31
	x23: 00000000000000c0 x22: ffffff806f5693c0 x21: ffffff806f5693c0
	x20: 0000000000000001 x19: 0000000000000000 x18: 0000000000000000
	x17: 00000000529c6ef0 x16: 00000000529c6ef0 x15: 00000000023a1adc
	x14: 0000000000000003 x13: 00000000007ef6d8 x12: 001167c391c78800
	x11: 00ffffffffffffff x10: 0000000000000000 x9 : 0000000000000001
	x8 : ffffff80816fa3c0 x7 : 0000000000000000 x6 : 49534d702d535449
	x5 : ffffffc080c4c2c0 x4 : ffffffd43ee128c8 x3 : ffffffd43ee124dc
	x2 : 0000000000000000 x1 : 0000000000000001 x0 : ffffff806f5693c0
	Call trace:
	__task_pid_nr_ns+0x74/0xd0
	...
	__handle_irq_event_percpu+0xd4/0x284
	handle_irq_event+0x48/0xb0
	handle_fasteoi_irq+0x160/0x2d8
	generic_handle_domain_irq+0x44/0x60
	gic_handle_irq+0x4c/0x114
	call_on_irq_stack+0x3c/0x74
	do_interrupt_handler+0x4c/0x84
	el1_interrupt+0x34/0x58
	el1h_64_irq_handler+0x18/0x24
	el1h_64_irq+0x68/0x6c
	account_kernel_stack+0x60/0x144
	exit_task_stack_account+0x1c/0x80
	do_exit+0x7e4/0xaf8
	...
	get_signal+0x7bc/0x8d8
	do_notify_resume+0x128/0x828
	el0_svc+0x6c/0x70
	el0t_64_sync_handler+0x68/0xbc
	el0t_64_sync+0x1a8/0x1ac
	Code: 35fffe54 911a02a8 f9400108 b4000128 (b9405a69)
	---[ end trace 0000000000000000 ]---
	Kernel panic - not syncing: Oops: Fatal exception in interrupt

Signed-off-by: gaoxiang17 <gaoxiang17@xiaomi.com>
---
 kernel/pid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/pid.c b/kernel/pid.c
index 924084713be8..2f73f5d13164 100644
--- a/kernel/pid.c
+++ b/kernel/pid.c
@@ -487,7 +487,7 @@ pid_t pid_nr_ns(struct pid *pid, struct pid_namespace *ns)
 	struct upid *upid;
 	pid_t nr = 0;
 
-	if (pid && ns->level <= pid->level) {
+	if (pid && ns && ns->level <= pid->level) {
 		upid = &pid->numbers[ns->level];
 		if (upid->ns == ns)
 			nr = upid->nr;
-- 
2.34.1

