Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0529B214221
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 20:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738786186; cv=none; b=cvUH/EctwALW8nYvbUu5hkwC0sU8ebJFKP+LRiXbN8Ye7yEjmNmHCnBxlrFqFkAqD+82VjEpIO+8vDnOxPn2M8Q/SsRTGqG9pp/JV3/KcHHnS7pkdcuQnaH8GxiVopmdPI0NDFqORCis23nT96yOmG97CS5dltUayfAcTD9VRY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738786186; c=relaxed/simple;
	bh=8ylPtGjmg8BqUJh8ssxlycLuhNCMbKhKYTzosnppwMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t1RKtytilsK4Cpm2gKDeMMcFDI4mqL7afQh3SBFh5rYv1ur5EOpQZYJAFQEGF3L4eCxKvwS5GSGtRA+86aEXsyDcfSCOloXAGtnJjP4VW/Z6BEGT3Z7G29cViyk3eZZ1BvgKV5hsXAeRwY8hhOR7XfeCFEK7+JVBIEHxQa9QQAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kia9j16z; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kia9j16z"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aab925654d9so37885766b.2
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 12:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738786182; x=1739390982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pj3pWrosGkUlfXcIPyDNQK+jIHHC44medwj1pRwHHC4=;
        b=Kia9j16z+dKBciWAtq/A2Mwefy8++jcKaPAvNB5PdDgTJb/Zw8eHCy6ubuwOR1Dj/i
         iOh0fgnaEHM7cZZTi2QuWoEhvT2CH7eRnQs3e6ZzHdjlxsertH204VRio5uy4g0lGeN7
         E8N31D+fGLUTyxbTe0nGM8cB/lre/2KQrYrLvqqJpWrKUovcoGts2bXt+ZQI5ABwtiC8
         35+h3cBHEzsPNPhSpW9y9EGPAgtEzbIZ17XH/AVv3JiccGe69o9K64AgnHCoinhP/oLH
         z3qjZQHkuDHMLjYtzWOyuWh5+3ucN/k70ikbbivtuCboHgyLJyXEDq02y+VJVVmUBLZX
         dDlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738786182; x=1739390982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pj3pWrosGkUlfXcIPyDNQK+jIHHC44medwj1pRwHHC4=;
        b=R+fj5SFywcMrwNQhU6wnrgAOoa2j9MAYi0s6cXtHY9HMKON0jyhOK2TarOIHmTmGps
         Ibq0LcK0GsGVzDEEBbuGXrFQP/B1aLd7CocpbfKZbZK6psFU/wyaoAMmfLFlrfNDMoq5
         ZHf+vEbY5BoYzo3NQJY22Xr4McXCy71xyTd511KK5QVcAEOmuxT1inxKCnWztXt2fxu1
         fqfvBcjG2qKAWC0lyU+gQ4qAckDYYDtYlGrvc2LpnG3wewazrq0tczbhZOncOF8YAm6t
         xvGVtLqwapko4+H+QORApu8I8i252YrThNh5Hu51TDW29fjg4jkJULumPm0B25ay0QE5
         ZBaA==
X-Forwarded-Encrypted: i=1; AJvYcCVIDIapKC79FX0LALmOCGar1ZE2NsN2pbJlpDlekwXbTDEGSWIQzlmJHEjX+a3H508G3Q90CQl+lOqtyyI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6W794oqHAfYSA4mHvlOyC7FG9SIF2G3bWlXHZd2eHKMSSNK+Q
	ZVKj2xemj/kUswCNzTO7YWAwPh1KVukKSGpC3d1ed48y9BiQLmSz
X-Gm-Gg: ASbGncvlomJm5R4Ax2/xY4HXCLGFJhmc2pGaNW6hjozCVJHEXp5V0hR2XYPPvnyzTGr
	jThowTMA8dOII/WCGt4KvUZGsOgegOAMlxV70cE8JDkWUyEboF3jWmgy5qUHR5xhv9pygNm/lsB
	Z2JtQCo2/CLONcxMrPET8FBPv796ae3goYZARBhbm49ijniwwMZAQjYRi0zG5E+WeSsB8KURIPE
	l4yu1kCBZFriRlAhwEmXxhsB5OOJSu+N9jtfAO0+kFPpl6w1a6IuNmFDWWBHk4cbuO/uKg/jlDU
	u+rISRl7KyvLs6C2l/cMScParoI/k0U=
X-Google-Smtp-Source: AGHT+IFgTBn5lP4dqU0ydTXpkrpjieHD7lv/hSESjvAyOOi9Zo+cwux8FPWnWR43OTCyLUkzOvro/Q==
X-Received: by 2002:a17:906:6a04:b0:ab2:b936:f110 with SMTP id a640c23a62f3a-ab75e241f9cmr455031666b.20.1738786182011;
        Wed, 05 Feb 2025 12:09:42 -0800 (PST)
Received: from f.. (cst-prg-95-94.cust.vodafone.cz. [46.135.95.94])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab703fbcc0csm932221866b.53.2025.02.05.12.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 12:09:41 -0800 (PST)
From: Mateusz Guzik <mjguzik@gmail.com>
To: ebiederm@xmission.com,
	oleg@redhat.com
Cc: brauner@kernel.org,
	akpm@linux-foundation.org,
	Liam.Howlett@oracle.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: [PATCH v5 3/5] pid: sprinkle tasklist_lock asserts
Date: Wed,  5 Feb 2025 21:09:27 +0100
Message-ID: <20250205200929.406568-4-mjguzik@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205200929.406568-1-mjguzik@gmail.com>
References: <20250205200929.406568-1-mjguzik@gmail.com>
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

