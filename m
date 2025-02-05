Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AAF20E032
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 19:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738783985; cv=none; b=g9ftJAh5Zn2FSOmkKdx3y6kS57npE9hGjUz23mLXBS+A/L2Rha+bokxgEIzbdNcP5MIEkMvN1OPLYwjerA/LFWVSLDwsLau0lWXOgqOC2kOrhe3ysM2UJncj0pzuHTKtdHMzOqZ8SkFW90yj346j3q1tIl4WDZLRSxe68JvVwcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738783985; c=relaxed/simple;
	bh=8ylPtGjmg8BqUJh8ssxlycLuhNCMbKhKYTzosnppwMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n4IeCLOaFoN8ee8eWpPs+nZirZgQ2bwXkNND/51n+zTkc/Cfnri1haw2JyzQ4coZlY5XKIgn9SsdV/gxYdJqBFUdytQwQXqOeWgP9ys25MDg0DzvZ9TK7bRqiLGd+e196vA3VECDcFxmRw4lbgBw+0k3TZ1KPmlk2Qnt/BBmkgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S/lhY9bW; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S/lhY9bW"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5dc7eba78e6so353309a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 11:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738783982; x=1739388782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pj3pWrosGkUlfXcIPyDNQK+jIHHC44medwj1pRwHHC4=;
        b=S/lhY9bWdqMxzR2tXJH19qAulJI3GSWSSKAX3HrK/5SrwWeZlLm27yht7gFsYrRNK+
         uoTm3VyxU2dZ1ZYGX1iFP5vUTfAzclAKvF8agcSX3TaAuZ83p6uDAzQa0KskBiZzpwVJ
         Lm8sUuv8N+4bal505pd7FEFA/XsT+RD52E7gY6zIP362AL7YfNnl+CoAuFoU2rj5r2Vl
         eY2ZdsjhyCNlEFbrVvIkHlDOUBNiMb0di9R9yNehytDK/odCfEAwJiTrcfEOqQF95Pyu
         C0n1dOq7GaIdFwvZcytd9jy3Dzc+eI4z7Ao2ATw4u+0ZLd3wdHMuszJcUQWoEFIsH1Fg
         fVhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738783982; x=1739388782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pj3pWrosGkUlfXcIPyDNQK+jIHHC44medwj1pRwHHC4=;
        b=nvARqd1qfk3e+Eropd09NQIRh6LVuHaT26/Sl1JyNWSbUeGGRCoNtMI7KeC/DI8xHO
         JvtWFV01DyHr5ZGixTN3RArjn1M7oXwDO0HOJ/u0RMCSMLDmed1GqnaxEay6e6r4/OKZ
         CzbGvyaoA5vTXQLIZjYgFtaf4lFDE4IikMqhvCitd4KEez8jJHi5r5InyeMvAJY9Wqn9
         8JrWuZ+0kvarJ2YPRdpMlh8V6rqVq1s+HkPNeR/dMv/eEZi7fAD12ZUMmnABFo3j5pkj
         JFwjsWRqFp+Jz3KzKYSLAhKDoaWjJbhV8yO/aAVUpT5FVezDUjFNqbphk5CXsRHxxOwJ
         Lxzg==
X-Forwarded-Encrypted: i=1; AJvYcCXRkblfS8I60UgE5OZRH5Z2cnXgnhVZfGe1DP2f2TfA2DfW9sdXUjPIC1UWkd7JtdzMdKV3At/RTW0n9us=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNWNbwETKkkqkczgF6r/IvzQTW9gQcq2GOLyYIMhkeEFjjjh7l
	02vnVoZZa+iHkiZ5p5M1i2rV+913p8EV+rExHi0OA77IBgM/6Fk/
X-Gm-Gg: ASbGncvRcMNXZ8gEMC9SaA50siIekkp5kYmSS7PLdZDiOPhHXb0NOn5YjFkMVLSVuJj
	Oqqt1X6vt0vqquZNwQr0YbA/p/CXJjXz7zMEUAdTuM1pG8s+hueyxxN2AQQNFKyQZJIAJ3r/5+c
	xXozUI2OCiO6H1/5MsrUzh++Y8UA6EbuEuRRCxcd2if3kJCHmWx0c+EOmljyRE9CXEIAUH+CPuQ
	irrGEl9BhLp71MiuBp5bz1EJwM8DhifDn/UCB8PJYCZO3MNTThacup80+zF1Cl16gxTghf49zZO
	cavS8XU3dnVpPUxiqihjPfqAHnWXFkU=
X-Google-Smtp-Source: AGHT+IH+v0+Y71X4Ng4Ev9fgSiJ1PgjylvwyDIfUtEEs89NqNYiVQlGoTsrKGaT1p5nA/a4xbnCAyw==
X-Received: by 2002:a17:907:7da0:b0:aaf:afb3:ad63 with SMTP id a640c23a62f3a-ab75e35de67mr425464666b.43.1738783981639;
        Wed, 05 Feb 2025 11:33:01 -0800 (PST)
Received: from f.. (cst-prg-95-94.cust.vodafone.cz. [46.135.95.94])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47d06e5sm1167625566b.63.2025.02.05.11.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 11:33:01 -0800 (PST)
From: Mateusz Guzik <mjguzik@gmail.com>
To: ebiederm@xmission.com,
	oleg@redhat.com
Cc: brauner@kernel.org,
	akpm@linux-foundation.org,
	Liam.Howlett@oracle.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: [PATCH v4 3/5] pid: sprinkle tasklist_lock asserts
Date: Wed,  5 Feb 2025 20:32:19 +0100
Message-ID: <20250205193221.402150-4-mjguzik@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205193221.402150-1-mjguzik@gmail.com>
References: <20250205193221.402150-1-mjguzik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reviewed-by: Oleg Nesterov <oleg@redhat.com>
Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
---
 kernel/pid.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/kernel/pid.c b/kernel/pid.c
index 924084713be8..2ae872f689a7 100644
--- a/kernel/pid.c
+++ b/kernel/pid.c
@@ -339,17 +339,23 @@ static struct pid **task_pid_ptr(struct task_struct *task, enum pid_type type)
  */
 void attach_pid(struct task_struct *task, enum pid_type type)
 {
-	struct pid *pid = *task_pid_ptr(task, type);
+	struct pid *pid;
+
+	lockdep_assert_held_write(&tasklist_lock);
+
+	pid = *task_pid_ptr(task, type);
 	hlist_add_head_rcu(&task->pid_links[type], &pid->tasks[type]);
 }
 
 static void __change_pid(struct task_struct *task, enum pid_type type,
 			struct pid *new)
 {
-	struct pid **pid_ptr = task_pid_ptr(task, type);
-	struct pid *pid;
+	struct pid **pid_ptr, *pid;
 	int tmp;
 
+	lockdep_assert_held_write(&tasklist_lock);
+
+	pid_ptr = task_pid_ptr(task, type);
 	pid = *pid_ptr;
 
 	hlist_del_rcu(&task->pid_links[type]);
@@ -386,6 +392,8 @@ void exchange_tids(struct task_struct *left, struct task_struct *right)
 	struct hlist_head *head1 = &pid1->tasks[PIDTYPE_PID];
 	struct hlist_head *head2 = &pid2->tasks[PIDTYPE_PID];
 
+	lockdep_assert_held_write(&tasklist_lock);
+
 	/* Swap the single entry tid lists */
 	hlists_swap_heads_rcu(head1, head2);
 
@@ -403,6 +411,7 @@ void transfer_pid(struct task_struct *old, struct task_struct *new,
 			   enum pid_type type)
 {
 	WARN_ON_ONCE(type == PIDTYPE_PID);
+	lockdep_assert_held_write(&tasklist_lock);
 	hlist_replace_rcu(&old->pid_links[type], &new->pid_links[type]);
 }
 
-- 
2.43.0

