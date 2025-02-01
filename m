Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F161CAA6E
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 16:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738427497; cv=none; b=OLdT5Z2kV254/IzZr3oo6+Noe78uyIkzsGY/u9Uz6auAmZYZxcwlFI5e+Mz/e0oEE1f76fqQyxwqqTtEo6km4qQkbSB/5O166sjCUt8MgV8Tr4aktiASo/xDldPHld9esOk6H+FP+1YdG0pYJGMuedgd0AC2PWalTbZwhEmJ7eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738427497; c=relaxed/simple;
	bh=gewaK31HOiPxynrIPU4I77vQgKv9uOaKp+Qsck5H9mg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z1Y7VV4+8qSdEIBjqYtqpzrTOmewSrtycz9FWUzhu7Zycq0aIpXrRlq5rmADo47GagA8ELUrFam196ve1wRFNPP5nnGci2tYpL/4He6U1ZNlZyuN5Sl9Quy3trpGudpdTijy1Z7YvtYbwHDPjzGvFJ3yjEzLSXL5hKp5hYKaO24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QZu9P2VP; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QZu9P2VP"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ab633d9582aso626427666b.1
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 08:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738427494; x=1739032294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dyyFSflvKZq+gCyw4L+aRmZfdJK9jjjI1PXfRtKE+Wg=;
        b=QZu9P2VPmJyuc0uSW9OeG8NfhI42BoZ3kCodkwrU8y5RKYtrmD7awUgPQJPBumJNf2
         SV6UtfMfA9vsTEJ/XJNVmomWEtI69vX4eF8baOy2c6idJFLBukAwHoahA3qQLTlSZ3h+
         VK2j+QfWOwJWtGVMYj3QlPGhmvji2MwQm/Y7Wv8KtXQqGeej5s5BwY6ACF9kgC9cLs3H
         +ZPWPwpSSs1q9NLjw3eY3ohMuPx8+bpOM88mmlm6OgnZxoRv0N7VEQOSwyA2vdltB/s9
         W/tQF3SZOtKL7hxkt7i9PraEidiJ/jqjNYnZpWK0SFbYPEuovY27koptjokDvkXTP/xF
         CKYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738427494; x=1739032294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dyyFSflvKZq+gCyw4L+aRmZfdJK9jjjI1PXfRtKE+Wg=;
        b=xRAbkRTK3GbEP54Ng4LKYH7eqnubUjCfczLG2Kflra3pAjl6sCgfii2szUFu1gTywR
         e58tfFZVVCH0cz60iQZj8spFx/wc/lIfznsxYE81mPCHGBiH/zJW24avzs8m5/9keO06
         8Y8UBTqrdOlRFaGmGoQ3ZMK8O2B1JNY3t9SYbUZitpqkBUZ+ARG8kyYwATuComMiDJYh
         LP0qrukmq+DUbs8Eg/8C+4bttE5lVwCcE164o0tk3g8M8qSvT5YlI4uK4pBkpmYwjkdJ
         GSLcs0KbafKikm9fTGe/Eu43JNC8sEvlEo63Eg61OQsPL63ny0/iKeg9n/NqpiswimbS
         3zxA==
X-Forwarded-Encrypted: i=1; AJvYcCVIhYMwTbxdHBRd1Xf4a2L12RCdxWN7gL01xGEbmy/MwOsnxOp/2Hx+G/iD6D5qV4XqCe7KLSZMHC2h1ig=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUnM9P4Nru8LAYQzRNlvr92RyHzObsQUFPlOcU4ZnPWWAgop1v
	sCRvN/0VSJ5Jl8DhwmS5UOqmOXxwQUW7o0kVb+MDAUgtSngJ0W68
X-Gm-Gg: ASbGnctlJwPSRcFRP0hWle0GdGT309+B++/DEfrr3EJvcw7QRh5jRMZCMPGAyzIyrkH
	8ifCRhsqPPT9+u5bijnMEh9HL8tatO5Y9soCOzjemeHQrFcNUtNaEgSD42MQFkt5ELWLU47IZK9
	m4vs/sI0COHKefdgMVy3Hi9oz5R5SWeR9s4D2qpjhk6OGQJCAKKKQAPTXRxxuLDcfNelNKhe9it
	YTDd1egFeWM6A7sdDEWruWudJg7FSg/jt2cMxhIQRhlJqhCa0kjt2Xz9SyUifXFYqRKC0spKs4q
	xnXTIWWUZyKL41qX4H7E8KYPEA8kV7IjLA==
X-Google-Smtp-Source: AGHT+IFqaFYGHdlE7Mgj/EaOXQAoxs/uxy0rQwtHMZ/EngGz610MENXkBznnc7SJaPbJh49JC1NgBQ==
X-Received: by 2002:a17:907:7fa2:b0:aa6:6e10:61f6 with SMTP id a640c23a62f3a-ab6cfdc6724mr1500512566b.52.1738427493533;
        Sat, 01 Feb 2025 08:31:33 -0800 (PST)
Received: from f.. (cst-prg-25-223.cust.vodafone.cz. [46.135.25.223])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc723cff72sm4636959a12.15.2025.02.01.08.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 08:31:32 -0800 (PST)
From: Mateusz Guzik <mjguzik@gmail.com>
To: ebiederm@xmission.com,
	oleg@redhat.com
Cc: brauner@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: [PATCH v3 4/6] pid: sprinkle tasklist_lock asserts
Date: Sat,  1 Feb 2025 17:31:04 +0100
Message-ID: <20250201163106.28912-5-mjguzik@gmail.com>
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

