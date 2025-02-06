Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765081F416F
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 16:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738860291; cv=none; b=eJ8Oh0/rj6jKjKzwGXGa1ebK4LPTNMKynA7JFBzl3ioafjKzsVfRwxpUWKs/HcXOqe12r+WGVZrV3O2+QhAR8w9GUzSkpUG65cwxjRCdToRODDtuKxLwJ55Pg4QRD0PrqXAmluwWx6R7yA1r7KdY5F/Vlyi8E9ZbDNzWN2aeB5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738860291; c=relaxed/simple;
	bh=yWz5z+gHwV9XUNY6VnUyv8CsSXjlXfVJclxvnwu6d88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WMAxBmcNa0Swk2dlMzDiilB2VNuqyIwHA5KDlX/Zip/ZhO9EJAtBwXK6o6Ikcre2yCnxCMnC5wt0Hn8NEJBUsuY7XpsaGW34IRqE2Mdi02+XRkgnlh2EzKCXTV5U2LY1o6KKutfhSbGTud+utJZeHFueAmdefDyF05hj0qaXnEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NkKIdRWJ; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NkKIdRWJ"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5dc89df7eccso2325289a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 08:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738860288; x=1739465088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1rFXKBN/0DtbqyDMME4x+DYY2VQCCVBBL1fksWymTmA=;
        b=NkKIdRWJTGN6u4sOspY7pMms1ZwegzfrbmnHBYQ7LvqRcxVImeJEJC6Yon+cXlwLre
         NeoY/sk2Vfme9LrKRprTXDMb57xdh6fmQhZ7UE0qnsGn9d/RfjDt0MpHWR8j2F//ILpm
         BlUGlKGm6DYILckOxAIO1xhsB8rOKaJ/Mm3oBZT7YbyvMO7rri+Y8CFAsFZ6OM0h5MYq
         0snNzm7xDfJK/SxrZ4NvD/jrZeOXTC+iegT3rFo6NQI7iSRKhVi6/8kn35kysC5cz9aq
         Pz1WKB7C4hFtIK/W0CiG0kd5Shqxo4RweQAXcejjTIaAncSuHiD8g4nTTmOl06uVcaCr
         xLQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738860288; x=1739465088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1rFXKBN/0DtbqyDMME4x+DYY2VQCCVBBL1fksWymTmA=;
        b=uI8Mk/XP82Wd1sutGLB0KY/L5PLVo7lrgEJykPyLCxl5DOtOKWrk5buV9PZlmFjbQR
         2Ak+BM2+PMrU51FATGth1DsYjIFy04N2AicWY/31hbf2sOuOc4ay4ibQLxlMeunwIwHB
         TaOvEUpBhyKAcadwmWtAanrsfwU+47AnNNNPujmVV9luJrpSuetG4ChALjG6IBuJkifu
         7TKkOWUHTttE4PDSDvn9HwihE1/S4bMvwWKrpoqX8TTtZ7y+u/hbNeXxq0zJv5PT49Zy
         5xyqxkxST/cfOdklxtfbTHRvLLRplRc+41ybhUlBb+sdW2rS9ijtsT96DNCXx/IOOuSB
         WDpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUr08+KlaYHhMUUNKggBxoR6V8d/zw1XgkkncfPykSlJclcV43ei0rxJTARt6KYi5vLUm7Lb0jPpr+PO0o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsxdusn5N+speb030f0dtsUnu2LOMoG3P+oY7Dk7D8cyh5WG/P
	QiMHDM1hxQXZj/mzg6Jd2SuzoFTwL564/22PjAe31ZhwMwcOomDU
X-Gm-Gg: ASbGncvEMRPJrMwFzdmkdEree1Pl16ve3+rE3pO2wUMeEK0ZeFqs8ex6Uw8ltR8/Q2+
	esP1mGS9bcZNBzDIKjNHVDr+DzrckcijVI9Y8/wxjwgWpkbDGWO6Ha0tX6bES6RAAZSzwxi22MH
	6CbzbVgUV3o0g0d59LSRBJdyHesvekyujuh5UsDF3Hnkdquoz2k5uJAV+jSSaBCyR/c30sTFhT/
	Kamwr9n1rA+X+QkSVWA5uZz7WRy3lqUCp8lXT2cPKNeduHqBZfuelOMfl8hxTx+xNUrR+tc9ddO
	0vuQMPA1+36TAuElkJUhNoVYw8Kk5u4=
X-Google-Smtp-Source: AGHT+IEx3kN8qow07VpklbA04AmzqZOSoDCkjH+xrLCKw+n2wur1ISoraFYcVGyB09Stod4R1SRwNg==
X-Received: by 2002:a05:6402:e83:b0:5d0:bcdd:ffa1 with SMTP id 4fb4d7f45d1cf-5de4504014cmr104976a12.2.1738860286170;
        Thu, 06 Feb 2025 08:44:46 -0800 (PST)
Received: from f.. (cst-prg-95-94.cust.vodafone.cz. [46.135.95.94])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf9f6fa69sm1121849a12.73.2025.02.06.08.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 08:44:45 -0800 (PST)
From: Mateusz Guzik <mjguzik@gmail.com>
To: ebiederm@xmission.com,
	oleg@redhat.com
Cc: brauner@kernel.org,
	akpm@linux-foundation.org,
	Liam.Howlett@oracle.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: [PATCH v6 3/5] pid: sprinkle tasklist_lock asserts
Date: Thu,  6 Feb 2025 17:44:12 +0100
Message-ID: <20250206164415.450051-4-mjguzik@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250206164415.450051-1-mjguzik@gmail.com>
References: <20250206164415.450051-1-mjguzik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

They cost nothing on production kernels and document the requirement of
holding the tasklist_lock lock in respective routines.

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

