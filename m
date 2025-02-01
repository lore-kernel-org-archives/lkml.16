Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363BB1C5D78
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 16:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738427493; cv=none; b=UGxJJ3d+isb7X8e2HsOQ71YODBdW0+PsB0Bv0ckyUxE705KpxTqd6qfG9byq534u/L+JjKg3UFxqF4FW0JkkcEXHGMggM/hdxDnpCRDVl9+Yu299reZ0E3Tv2ZvbVpIbZFlp9r7PqUHlDnY6+BpTFH3aoEnjZY22HJRp48ufmkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738427493; c=relaxed/simple;
	bh=HzNBnUBkt9bW/QkVS5iMhHOaiUUrO6ZWY/9e1VL/jG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ClDRfZkAC4JVMSIfkp2mzProRXGxFScaTHdGpsZUF0OL8QDiOPMS7bb1rUcnVeVxolNqWvpF7r/Wy3jZhmiHA4y9V1XwkKEmhtbsUkYvg/acAdbDetnL5fgLbpj3UsRr+jTYPMgkncHKWMKSzZ/HFn+pK1g1dHmcwIP6Zl5VJ4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fNQxHCFb; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fNQxHCFb"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5d3dce16a3dso5561660a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 08:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738427490; x=1739032290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dahzR0UxsGypw5SX9Oc+7ltkwZX50Rxb2ddXibPMRZo=;
        b=fNQxHCFbyaogkLAPkCnFMRCdh92O4YcGzEp19QOyfxC9Y40hxPpSh+YkYkC7/rmyl9
         WJxOjazOQOeMP+CszW2TZAHW84toH5Ytw0GsTO3G177CunV0EDRIRzGKp1neq6HBzYlc
         3GOGvQaw9n7I4ICLYtC7JZF04Gr6uhaJh8ELVytCUcU+TEJUVv0PRbP13oJQSZ5saRBt
         gXfmwStG3pEAPnQc1ed5UwhMz74uVfDmf6hwnoZXQQAmktHPqDP1XsN+63ZWiwrdseeo
         Lf0qflVeNSVc3csHnosqq/7nxKuk2C75eVz6s5NpQYdsDc3NSbflksref/hlSV+/jiLt
         a19g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738427490; x=1739032290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dahzR0UxsGypw5SX9Oc+7ltkwZX50Rxb2ddXibPMRZo=;
        b=FFvhVbAA2hl1wdAYapTPYPSHXLo+bu0fDCV0JvqTPIXKIb10a8HWCpDKDtKmldz6JQ
         EVEHFOuD4IoPMJy+2qE0XnxX2/PRjZfoD1OEimv4Qt0ovKbzZBhzzhm8adR2S0NF8HGE
         tH846w9Jicq67aqDrXT8i0rPD4Yr77oWImkkW/wN7ypG2n+JUDQmH9yOgkF+S6GptfU6
         itJLlubgWbayHoxCJ+uIHjcBUJxoaMDjhj8T1sS0vfSuQKdvDP5HkPP2jvpNkv/MAyJM
         Hl6ZwfUT9zsCTFbgrFMMfb05fMxPPZWo8KNMUPnKcUV0jqt9FDeYCg4fclbwmKGrVoaI
         Tbog==
X-Forwarded-Encrypted: i=1; AJvYcCVVOhgrtps48QOIRoOW30XFrh+rEKvK9eRAqAm2KQJf1kdpCzn48O7uBudIQby+gQGv00+ST4KrymQs7xk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7hnKnSB2CYwfR7iKfF04UKRo+AtU8u0pa9xGRufzp/Tyzpwaz
	PKcq1Cc7JWlGNIhJ17oxdiH7FaQmnJTGeSGJ4PWjU3JNwCtjXsRH
X-Gm-Gg: ASbGncsacAy8gjv40/EXZbky0eNHFF5GyKn29TK25dk9EEHZQwM4OPuxUVX8uKZJgdj
	LZu1xJAbMcIHFADmY5/8Tp4VgeZ4pulsLo/iNaTCw7MnveFZCeaSAIvrh0VAgRkvhFi20AEl/9w
	jkHNNpv0Vo7R77R2euR/7OHGT3KVRy8haUe1fzVg7x/7mfGWsz5T4CvfNiMqOhdsYtgqct8nWLd
	Ne8FfQOuXuP+5KfdEh0FOvHxq10u0oa9pg+gpBX7YN6ZM68NKmtwcSf+BvjhbYVnKqCsYLuy7xi
	38hbbJ3JPV5LkC1TkOqDXOtgUH/aCdXCIQ==
X-Google-Smtp-Source: AGHT+IFZHEIO8U5RqJXJbo7DHyIgBpdE5v9HITImIJ/GuVeKkP/Vgt/hmam0AcjLWutOLfeAg8IQfg==
X-Received: by 2002:a05:6402:1d55:b0:5dc:92a9:8a5 with SMTP id 4fb4d7f45d1cf-5dc92a90b78mr2511527a12.6.1738427489352;
        Sat, 01 Feb 2025 08:31:29 -0800 (PST)
Received: from f.. (cst-prg-25-223.cust.vodafone.cz. [46.135.25.223])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc723cff72sm4636959a12.15.2025.02.01.08.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 08:31:28 -0800 (PST)
From: Mateusz Guzik <mjguzik@gmail.com>
To: ebiederm@xmission.com,
	oleg@redhat.com
Cc: brauner@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: [PATCH v3 3/6] exit: postpone tty_kref_put() until after tasklist_lock is dropped
Date: Sat,  1 Feb 2025 17:31:03 +0100
Message-ID: <20250201163106.28912-4-mjguzik@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250201163106.28912-1-mjguzik@gmail.com>
References: <20250201163106.28912-1-mjguzik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of smuggling the tty pointer directly, use a struct so that more
things can be added later.

Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
---
 kernel/exit.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/kernel/exit.c b/kernel/exit.c
index 257dd8ed45ea..d2c74f93f7d2 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -122,6 +122,13 @@ static __init int kernel_exit_sysfs_init(void)
 late_initcall(kernel_exit_sysfs_init);
 #endif
 
+/*
+ * For things release_task() would like to do *after* tasklist_lock is released.
+ */
+struct release_task_post {
+	struct tty_struct *tty;
+};
+
 static void __unhash_process(struct task_struct *p, bool group_dead)
 {
 	nr_threads--;
@@ -141,12 +148,11 @@ static void __unhash_process(struct task_struct *p, bool group_dead)
 /*
  * This function expects the tasklist_lock write-locked.
  */
-static void __exit_signal(struct task_struct *tsk)
+static void __exit_signal(struct release_task_post *post, struct task_struct *tsk)
 {
 	struct signal_struct *sig = tsk->signal;
 	bool group_dead = thread_group_leader(tsk);
 	struct sighand_struct *sighand;
-	struct tty_struct *tty;
 	u64 utime, stime;
 
 	sighand = rcu_dereference_check(tsk->sighand,
@@ -160,7 +166,7 @@ static void __exit_signal(struct task_struct *tsk)
 #endif
 
 	if (group_dead) {
-		tty = sig->tty;
+		post->tty = sig->tty;
 		sig->tty = NULL;
 	} else {
 		/*
@@ -207,10 +213,8 @@ static void __exit_signal(struct task_struct *tsk)
 
 	__cleanup_sighand(sighand);
 	clear_tsk_thread_flag(tsk, TIF_SIGPENDING);
-	if (group_dead) {
+	if (group_dead)
 		flush_sigqueue(&sig->shared_pending);
-		tty_kref_put(tty);
-	}
 }
 
 static void delayed_put_task_struct(struct rcu_head *rhp)
@@ -236,10 +240,13 @@ void __weak release_thread(struct task_struct *dead_task)
 
 void release_task(struct task_struct *p)
 {
+	struct release_task_post post;
 	struct task_struct *leader;
 	struct pid *thread_pid;
 	int zap_leader;
 repeat:
+	memset(&post, 0, sizeof(post));
+
 	/* don't need to get the RCU readlock here - the process is dead and
 	 * can't be modifying its own credentials. But shut RCU-lockdep up */
 	rcu_read_lock();
@@ -252,7 +259,7 @@ void release_task(struct task_struct *p)
 
 	write_lock_irq(&tasklist_lock);
 	ptrace_release_task(p);
-	__exit_signal(p);
+	__exit_signal(&post, p);
 
 	/*
 	 * If we are the last non-leader member of the thread
@@ -280,6 +287,7 @@ void release_task(struct task_struct *p)
 			      sizeof(unsigned long long));
 	release_thread(p);
 	put_task_struct_rcu_user(p);
+	tty_kref_put(post.tty);
 
 	p = leader;
 	if (unlikely(zap_leader))
-- 
2.43.0

