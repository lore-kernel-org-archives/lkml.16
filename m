Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE059214A94
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 20:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738786191; cv=none; b=Wem2NGPGWOUycQfQFO7zrCRDUXWXnnFJQxsG5z3pt7amsDhksct48svX0CuN+a3hhbphFmSdzXv/9ea1kv2qapuAcrDmSMe+prvuDWsTJN3i0cN18DszWHZsYjRJZdiaUOvI/FoRjTDdPAGBTUA4eMBDN7Rss2LmbAEegV8XUNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738786191; c=relaxed/simple;
	bh=GJ2y/FCanDqhcGlPwrjJkUUipKVr30iT6x4rWzEDa78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gks8G2DU1jD6fstkgCKgdgFoeZwwp+QeEsaftxQlmDlxrA9vWjMeBq1kohu0H6CAbi4B993Z3GTdT5nuCHOMnh0j7LUzkI1U3NvfgJlr1IAk2S4OdcMOLE1z0wzi5WHnpIA+qdt82sjZEvSLPPir4vPEU0YDR8XZD16bdannYGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R29pBxQ3; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R29pBxQ3"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5dce3adbc31so315007a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 12:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738786188; x=1739390988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6DMFX6YMCCpHUnKPYix3pzepx5ItpSalkZSrvWGNgEw=;
        b=R29pBxQ3EMJhM/0gqbRvkfwuaMbBSlzNHDcuLWwrkIEURxY5E13tg19t5S+bV8EPDW
         QkyNusZx1r+Z0omdMNVOw0t2CGljIdn0JZn4pOvrtqPRwh1y1YiiOfJidY3Jgku/7ScI
         QNxPJA/SwZA5SzsJRy29xrQcAPYdmFLJrcPy6f0pj+nb/Egce9P+fgkKCCGNUYDzsIfc
         1IxYAtjxMfX+eLNVHMlKrf2PkUoZsGXFAWZ9bu3oExu9WU+7LABvW1ucYbrSCHQiuIak
         3qsKt6pBCwqUJ8srU8WmeVGMaby9zP9zVJx+VfP3/Wu2DWwcuH+MKQXxgsJAase3+JKB
         PW5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738786188; x=1739390988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6DMFX6YMCCpHUnKPYix3pzepx5ItpSalkZSrvWGNgEw=;
        b=JihgXqBwe8jWb7xTSOnX0EdopE7pe/xQzKbZcXHEXafU6Rgh9gOXr3KCcIjIQylVNe
         QhWybJF0JMoHQReBnjuWMmBayLsWkD0zE0GpgB3hvkGOvuuZSIS9vvAaxIz3f2pMJZpn
         UAsm7Z4zou047BDj7RLnZg1d9O14mMPaQxPIiNNHGcFFA+kVWLlkcU8dlo2BZmpTTCnh
         ik3xbTg7Q+QD+KvKBSRdRw9lu4VoO7q8UiSq78AuDTD2KB1FXMRoryJ7IVIu5cAg7dIh
         ba5k0nglE1gpRTIHRZSK5+Wx5Ic5xlv5StMoZWbtnCr1yYR1abPDrL0o6UbufX6duduj
         WiJA==
X-Forwarded-Encrypted: i=1; AJvYcCUmWbnR5c+al5S32Br1NCKN7GjlJliQrXvY53c/ADh9fPkd0tg4KPYGcMaF9zL4RALbKhISB4zlar1laRA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3GdYo3meQRKthUOgQtyFDqSVgxBL+4TbCwAc6np2RPRD0G5h6
	phT51y4wV7BJw83FJxwJ6Ahjk/1vohsBXVFp6RMbmW7pbZzDsOzm
X-Gm-Gg: ASbGncvWyX6nhQYxaYBi/l7YflLDHS14a4ICIVuSlXixz0Tbl9Y7IkMfJGrjdEQpuy+
	uBHw8zY90kOU0f6EwZJ9VbzYDcUpn4fxJQ+wSPGxaE1kVITCTUu/ZuokvfC4aG4i7tkvPQGwMGQ
	yWOjxri51i2nlxjFcThkYV+i+W0/vZj1+4T/Xi05ahXLq+LXQbDisS/elAzUkDDItE17+biPhnG
	Ftu/iuxJ4X03IiN6NxKjKjbALISoiBEUzREwho+efHndruy8r7QlYWzb0KzmiWXgjomlV2Suq82
	s3to4m707pCccp/eZHRH/sRS1WFCOhY=
X-Google-Smtp-Source: AGHT+IHHavuHMxmpQwSvBcREM9wxFJNCAg1KvI/6JkedpqD328qTUBETfMZe6QbsgoB5QiI7qJgVCw==
X-Received: by 2002:a05:6402:3603:b0:5dc:5a51:cbfa with SMTP id 4fb4d7f45d1cf-5dcdb6f9f5fmr12270745a12.6.1738786188060;
        Wed, 05 Feb 2025 12:09:48 -0800 (PST)
Received: from f.. (cst-prg-95-94.cust.vodafone.cz. [46.135.95.94])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab703fbcc0csm932221866b.53.2025.02.05.12.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 12:09:47 -0800 (PST)
From: Mateusz Guzik <mjguzik@gmail.com>
To: ebiederm@xmission.com,
	oleg@redhat.com
Cc: brauner@kernel.org,
	akpm@linux-foundation.org,
	Liam.Howlett@oracle.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: [PATCH v5 5/5] pid: drop irq disablement around pidmap_lock
Date: Wed,  5 Feb 2025 21:09:29 +0100
Message-ID: <20250205200929.406568-6-mjguzik@gmail.com>
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

It no longer serves any purpose now that the tasklist_lock ->
pidmap_lock ordering got eliminated.

Reviewed-by: Oleg Nesterov <oleg@redhat.com>
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

