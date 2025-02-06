Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F0A23645B
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 16:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738860298; cv=none; b=nPgFvNEiN1iez+2/WkJqqqL1ltW4SfyNfqarZOKJG9oVOdnoqRZeYhdvbcU5KEPR6dHTf6idVFjfLpV/S74EaFfUNHKh4/X4VVtpxmWoqhLOmVNa3KlecWTMnzX410YKvKpxG45Z+54gO4dAKO1Sb4QinPRADIx1STeCfzljjsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738860298; c=relaxed/simple;
	bh=GJ2y/FCanDqhcGlPwrjJkUUipKVr30iT6x4rWzEDa78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rRwQogbhrK/jEcKNhGk3tKnTKg9puiQQtHgC9VNcRy7GvBHBdzhw1nva/Nbby9JFEnIyNvgWMGE4DTCpeFZVpNDBlgahZ0U0+qt+qajHLOS1yFs7MCugPS6eC9x3Zccu/OjrS+OXevRzERoH4Tn0RYslnbz1q9/5wTyDzlgtORw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VG1i3wRH; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VG1i3wRH"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aaedd529ba1so148672666b.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 08:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738860295; x=1739465095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6DMFX6YMCCpHUnKPYix3pzepx5ItpSalkZSrvWGNgEw=;
        b=VG1i3wRHYmjJhCgEjUG4hGISBW5r6Kuq1+o42K9Ufm8y7MrkIG3CtoN/AqsIwapLjA
         Fva6hbXvUwZ8gbDKZQ7f0BR3sJRYmSaWMOtA4ITlQYb9U34PuwiPwfaZRZ2JVX6VziuV
         1mT8DVKZbx7hi6C3nEXKdnYHkWc/MYH8gRO1V6eZMXrIglmf7HWYnYQ/gpWNxfPpYh4U
         n3Eoh1d5o6IV3EMTkGk+Ptl2S3SAYHW1+hUhy3iAl/UEYUZKnyHtkZ/khUGfvpowKn5Z
         DXMCI42xVaz8DQmPy5Y5RBvwfZtvDxCF36FHIxhGeZ1m8u25+pfZY7hHPErYF5jsNHPg
         6/0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738860295; x=1739465095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6DMFX6YMCCpHUnKPYix3pzepx5ItpSalkZSrvWGNgEw=;
        b=EZyYtzDTA7xh0ySZSuV9N6FcHa3V+zmXz5nf1Lq0nPi8ukKrPMoHM5Q2jLCFYJlmik
         BxK6Gk5iKIJmQ+XyKo6Y0i6CmOK3d4r0IVJAsPUezMZ0bW3ZQ7RDE34weXFbroGclH1h
         wtC+o6nw3y2p5EwFETIVXjrzyUzoYRs7Pro4q+MQarkcOL2j9e/uap03vbD5NqN3iFbX
         6Mcbw8Vh7b5guzXL6sli6DBv5OlZ10xaDEE2B5qIKelkqPeuGnPDVl+8Tv8sZk314gVO
         0N5L19BaHFvct818ttYJdIoqxRp84K9rjQ66EKlG2gcsAXoteWrjTFY9+oTDsDhPfn5i
         zm2g==
X-Forwarded-Encrypted: i=1; AJvYcCVGr4XGXxwa8bvHVon+G/b3n8vPSNoXwPVGmWalLELh2bXIriPorB2V/vPgeHDGMW50HhVlezcf14/H9rg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3UoKB3HDs3CXm2zFtccUKXIgtXaVnjYeXRSA1p751w29oYH6J
	Wj2ff08buMmn28vN1DoSg0coSCW1cBjUT21djTD6JjNY0TkGIhwH
X-Gm-Gg: ASbGncuAkyQpO/8ku3VEx2q2CmZoixVde5+NKHODQ7GHJ+H9rbSsqExBNptQn0P2Yyu
	vtLlAy4UFCcmQkanbHJCvbO826nFL0Az/XUqD5HeIRJiDvpMkvaFUs9f6lecQoKvOx0ILxRrngV
	PaNMtii5c6mARdewTvQsU/Fm3sHg9Q35jdNqRJGgXMGshHjIhC3ry/pTSMJV0xKWcIbbNf9U35m
	lUTcshJ2nwiqwpGLtWIulXlp7K0yYXv3Wx90+c+WiOq8+aohhUUtHNzCQgVO9ASbRQAHYLxG7ij
	HMkkHaumuxkeddnwIc0oBFiT7hN6dLQ=
X-Google-Smtp-Source: AGHT+IGOagMU3s4dSLwHCKRWQGm5DZx3LMYAR9bqVzPeh6m8lqHiM8BrELKuAU/htbOM8AWykF4F6A==
X-Received: by 2002:a05:6402:210e:b0:5dc:58c8:3154 with SMTP id 4fb4d7f45d1cf-5de450800a4mr213355a12.28.1738860294539;
        Thu, 06 Feb 2025 08:44:54 -0800 (PST)
Received: from f.. (cst-prg-95-94.cust.vodafone.cz. [46.135.95.94])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf9f6fa69sm1121849a12.73.2025.02.06.08.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 08:44:53 -0800 (PST)
From: Mateusz Guzik <mjguzik@gmail.com>
To: ebiederm@xmission.com,
	oleg@redhat.com
Cc: brauner@kernel.org,
	akpm@linux-foundation.org,
	Liam.Howlett@oracle.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: [PATCH v6 5/5] pid: drop irq disablement around pidmap_lock
Date: Thu,  6 Feb 2025 17:44:14 +0100
Message-ID: <20250206164415.450051-6-mjguzik@gmail.com>
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

