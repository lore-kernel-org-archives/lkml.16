Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD371C5F28
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 16:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738427502; cv=none; b=q83ACmrmzay2mzKIQesSclBfOxVhoYaoQuGrTiOqTjv+IZ/b9APvS6yQgeBoE9x/ixFJAn8I7vOZjx2EeO8JOxcTiPaPZs25/DGsfmOF2QbqTXDYviH/6l/MtCokoeFWaUGVkyN4WgrUqDt+XQ33vUlcRMeTD+6FYRv9+1TLmLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738427502; c=relaxed/simple;
	bh=GbMEVsA74CTWVArAw5XlDKDbJHLapYEAHSmRoMhecN4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rHBZKe+8mKVfCTGGFb/AEhnRsS9H2KrC6CBdNko+ZSuQaFTcnJRLRDcj5jH1BDuwwIss8VQtUjT1rw2UguddkvaFtsM4FuosK7+tISTE9uL7rmzni+lIald2o/rRrBjzEBk6TayYe1DZH26/f0RtTeB5XnGHPQWBZq5+DQ/pzHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lOz4z8I3; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lOz4z8I3"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5d3f28a4fccso4476710a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 08:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738427498; x=1739032298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KxrKCmOPbL9lf6kX3GnLZapq/62phjaxdfTVTGbwAvo=;
        b=lOz4z8I3n0CRvyETWIqIrwixl5eF6nJIqzmMHG3p0UQFC6gJi1mn1k7ewL0NY3C2Fe
         CvXCuflv65tcx/HTdEoGEGQDO6OcHA83ghkX59JzbgTVi24xzvt+KnpOadYUjOUfTzou
         lfzNo3TvuJJ5+mGqcNB+bLiHhJmHHLoRadyl5IEfC0av2Kf0sCYKzko4/qiIk2uVtu/U
         wJYgqL5QF8J/DUFRlixfUAb0uiBFExA5Za8LEp0pmh6Xn9RSEBbH/z7IkJeviMogN8x6
         K3SoTwyIJKtpsQtmuEUIVlWAtjHSEs98H1bzzusjf1Ptxg2HWzPsSOaRxi2A7vVMqkCI
         +YWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738427498; x=1739032298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KxrKCmOPbL9lf6kX3GnLZapq/62phjaxdfTVTGbwAvo=;
        b=XLoRwsptfkU6ThLQ3N80xXc/ujQGWizyySpYp+BqB9UvDSadvR5nvylMGcazf6EvBQ
         UXLrgNIOAWEmerMQG+3kimsRSlrFb8t9Geq9puB6XHgTsLXiD2NCSaOW245tnjeexF09
         20t4X5RrZEc5vWSq6TJ0TpkO5C0BZgp2DoL69H/1k66Hh1mrJwDh4q999qRUBKXH7v3O
         VjPgsQAj/n0+30mj+coE0l/Mv/lR0R5L3/xyZl0LP0hmpcVjtRZbRIXqOBCARgDqsKHb
         PmkOG7zIzE+54g4nSmNLzpsMXafEgUbwNhq9WNlEvb3vTPXNVgJIV4N7EOTOd4TxgXMv
         G7Dw==
X-Forwarded-Encrypted: i=1; AJvYcCUR/ZXYKoYuMbbg7uqAn6s+gN4MFFJ/PajHu1OSDKJWnLKBFLbHNQ14iU2pKWOGHI2FyQAKKJliI9SVPnI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnC+gRW7lsANWoly0T+zZtWMDD+kpfJZdpAzdd0JZNqIjaEE0R
	TwnJpi873jmbNfJ5IXZd4HekxnVeQGJe9hAPW3y4Iu2J7PaZvKUQ
X-Gm-Gg: ASbGncuifl3czez1n+j3wTcrkxgSYR/0V7m2DvybAqaMwQSRJDzMqvnaI1GnGHKfwzx
	AAqSrEVJ6DAXGpivYWDucur0ZDelEET3GrfhS236CZxqVM0h91UJGEeRNcHnjhtNgHzTLtFY/Y8
	+OTWNeBnUeOZj1pqFkTUPPJB5yQQBKoGvKnYN5G2tPUHAblG0ily3HtkOm8bPu9M6UpV5p9FzOB
	c1WX7uVFTc1NmChjopW3AWdbgaHzQM7g9iTNMBNrKZQxOpbm/unqSaDqzzRP+jq1W15X+9NfKZM
	l5l1iOR8HnRiJ3M+yE3lAVg5WwNr/hZqjA==
X-Google-Smtp-Source: AGHT+IGwN8EDOCEWYQ+wXNUeHKgeJQKZbne3lalB1Xi6RAalLKFML7voSYY/GTyC8a3v+rsL/rd8PQ==
X-Received: by 2002:a05:6402:42ce:b0:5d0:b925:a8a with SMTP id 4fb4d7f45d1cf-5dc5efc7231mr18239742a12.16.1738427498295;
        Sat, 01 Feb 2025 08:31:38 -0800 (PST)
Received: from f.. (cst-prg-25-223.cust.vodafone.cz. [46.135.25.223])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc723cff72sm4636959a12.15.2025.02.01.08.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 08:31:37 -0800 (PST)
From: Mateusz Guzik <mjguzik@gmail.com>
To: ebiederm@xmission.com,
	oleg@redhat.com
Cc: brauner@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: [PATCH v3 6/6] pid: drop irq disablement around pidmap_lock
Date: Sat,  1 Feb 2025 17:31:06 +0100
Message-ID: <20250201163106.28912-7-mjguzik@gmail.com>
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

It no longer serves any purpose now that the tasklist_lock ->
pidmap_lock ordering got eliminated.

Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
---
 kernel/pid.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/kernel/pid.c b/kernel/pid.c
index 73625f28c166..900193de4232 100644
--- a/kernel/pid.c
+++ b/kernel/pid.c
@@ -115,11 +115,10 @@ static void delayed_put_pid(struct rcu_head *rhp)
 void free_pid(struct pid *pid)
 {
 	int i;
-	unsigned long flags;
 
 	lockdep_assert_not_held(&tasklist_lock);
 
-	spin_lock_irqsave(&pidmap_lock, flags);
+	spin_lock(&pidmap_lock);
 	for (i = 0; i <= pid->level; i++) {
 		struct upid *upid = pid->numbers + i;
 		struct pid_namespace *ns = upid->ns;
@@ -142,7 +141,7 @@ void free_pid(struct pid *pid)
 		idr_remove(&ns->idr, upid->nr);
 	}
 	pidfs_remove_pid(pid);
-	spin_unlock_irqrestore(&pidmap_lock, flags);
+	spin_unlock(&pidmap_lock);
 
 	call_rcu(&pid->rcu, delayed_put_pid);
 }
@@ -210,7 +209,7 @@ struct pid *alloc_pid(struct pid_namespace *ns, pid_t *set_tid,
 		}
 
 		idr_preload(GFP_KERNEL);
-		spin_lock_irq(&pidmap_lock);
+		spin_lock(&pidmap_lock);
 
 		if (tid) {
 			nr = idr_alloc(&tmp->idr, NULL, tid,
@@ -237,7 +236,7 @@ struct pid *alloc_pid(struct pid_namespace *ns, pid_t *set_tid,
 			nr = idr_alloc_cyclic(&tmp->idr, NULL, pid_min,
 					      pid_max, GFP_ATOMIC);
 		}
-		spin_unlock_irq(&pidmap_lock);
+		spin_unlock(&pidmap_lock);
 		idr_preload_end();
 
 		if (nr < 0) {
@@ -271,7 +270,7 @@ struct pid *alloc_pid(struct pid_namespace *ns, pid_t *set_tid,
 
 	upid = pid->numbers + ns->level;
 	idr_preload(GFP_KERNEL);
-	spin_lock_irq(&pidmap_lock);
+	spin_lock(&pidmap_lock);
 	if (!(ns->pid_allocated & PIDNS_ADDING))
 		goto out_unlock;
 	pidfs_add_pid(pid);
@@ -280,18 +279,18 @@ struct pid *alloc_pid(struct pid_namespace *ns, pid_t *set_tid,
 		idr_replace(&upid->ns->idr, pid, upid->nr);
 		upid->ns->pid_allocated++;
 	}
-	spin_unlock_irq(&pidmap_lock);
+	spin_unlock(&pidmap_lock);
 	idr_preload_end();
 
 	return pid;
 
 out_unlock:
-	spin_unlock_irq(&pidmap_lock);
+	spin_unlock(&pidmap_lock);
 	idr_preload_end();
 	put_pid_ns(ns);
 
 out_free:
-	spin_lock_irq(&pidmap_lock);
+	spin_lock(&pidmap_lock);
 	while (++i <= ns->level) {
 		upid = pid->numbers + i;
 		idr_remove(&upid->ns->idr, upid->nr);
@@ -301,7 +300,7 @@ struct pid *alloc_pid(struct pid_namespace *ns, pid_t *set_tid,
 	if (ns->pid_allocated == PIDNS_ADDING)
 		idr_set_cursor(&ns->idr, 0);
 
-	spin_unlock_irq(&pidmap_lock);
+	spin_unlock(&pidmap_lock);
 
 	kmem_cache_free(ns->pid_cachep, pid);
 	return ERR_PTR(retval);
@@ -309,9 +308,9 @@ struct pid *alloc_pid(struct pid_namespace *ns, pid_t *set_tid,
 
 void disable_pid_allocation(struct pid_namespace *ns)
 {
-	spin_lock_irq(&pidmap_lock);
+	spin_lock(&pidmap_lock);
 	ns->pid_allocated &= ~PIDNS_ADDING;
-	spin_unlock_irq(&pidmap_lock);
+	spin_unlock(&pidmap_lock);
 }
 
 struct pid *find_pid_ns(int nr, struct pid_namespace *ns)
-- 
2.43.0

