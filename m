Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F33C207DED
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 19:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738783991; cv=none; b=ddzFkHRASuprYCs/MqXpTjfsGC/rLVNvGAiIGVyDT6ZvslPxfB0dMdjVuOqx8cyMBTZW0OD0Kw2dRclb+9cdh3pZAZEF1LzlcXpR0rCdMAgfxftgqamuz5Fsc5Uwt8q0YVZklg7DsWJW2yVxrYp2StJ8/8jIFKQ/qrkJJ7vvWt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738783991; c=relaxed/simple;
	bh=GJ2y/FCanDqhcGlPwrjJkUUipKVr30iT6x4rWzEDa78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XgKBFms2k2Y0VsVdilhtMiUdBjFaTIA89yub3rT8ts+7PuZT4PLDtdrGBCtQ9P0Me15wDtSal1+STbXM8AGAC2MlyxCDvzmkLyBlbC7PnO7hnMhyPb9uXtRjuVRPH9EVkMtvQGgUvOZcxki/eummZSJDbY0y6rnyge2Itnb9Ivo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=awdjGAUs; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="awdjGAUs"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aaf900cc7fbso38064866b.3
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 11:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738783988; x=1739388788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6DMFX6YMCCpHUnKPYix3pzepx5ItpSalkZSrvWGNgEw=;
        b=awdjGAUsKqL783Icn90tI3Dw0bxr0MoUH32HOVfLlWTOdOFbUD+IGy5V+WD1jJOgDp
         egPRADv/r0sONCUhy0cknVhcxueNJqExJj0FeeDa0Rgn4Kex5cAKD3UPikTEtwqfW0+B
         6tcEHfyMuMHbf9WnS7ohEsNmMzsfU8xl9OuNC1Tq2uDCOIyug7moHnYy54X+k1/2enn1
         tCfIeuqFdNv9nlPSnUnOE5hWtWzTZAdkMdOaIpM3Xp/8Uuq0TbjRoOW73z4wBs73HTMa
         OUUIkSN6YHqs4yrCFHjbm1xbuyIcPY1StaSHaEbwJJxfAfnpkYOr9vP01nSY6lqPWxYJ
         tjJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738783988; x=1739388788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6DMFX6YMCCpHUnKPYix3pzepx5ItpSalkZSrvWGNgEw=;
        b=Q/onv9JtqM+gqWTacR5Rn4ZfcnCNNrndUnSVvi2dMdd3l2PMeRNd9Ot3viABi0NUGY
         0f50GD0AANM0aZa7og8gnLVeofXY7qH3vEzAqDoGqpv8tGrmqzkyfJewxBKEXRxKVViQ
         Dzd9XdYUn5MoadRBpCfc955h3EzFgBaG3+7QeLeMU0TpbZxdJrs/A0NMRrgNboUHZNuE
         fD6WGg7KOqeuLkEfOia99cBQIX89k7ImgMOIOCIkogf7muInjONcmeRZeXeJQTgIGIsN
         OaQyAXDc1bGPE1HRkJyWR/oo9tdD3riMPsZI+VfA4/e0MTUNHQDESNq2bIFhM0N2Aucq
         P26g==
X-Forwarded-Encrypted: i=1; AJvYcCU6kFCLLaqOirPSMSiaYqYWVyuDxOeDQz/wSbBcx0TDWTOeSgq599r/Fd5GZvSfxjyBHHn1/UdPNLqPOjQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSzWeQaTw7K7xBJGSoqEthZYv1a3xGW+pYNXi3MzVXV2HdcmWl
	YjnWoh/YSA43Ikx5A2yVhppWQV+nLwuswt/ITXbN/4P72HSYxz4P
X-Gm-Gg: ASbGncuHi0XkrRs8rLHzGANKpZ9eAsJ01LcoG4fcO8/LSPYo3Z0I1UZ88vnQzruMyVo
	SFCaPcREHr+ndXya9hRuxFLIJPqT8rmljdYgmhZisF7JS2KCUml8RwWAT5QaLJPllt9cYgRsfBA
	KOQc7BJcKrT90UPZDwZSG0BErhVXcBPFl5V2qXlNls9Q1FVSiRRUVgZ17GNXSTb0lhC+uYNGHZz
	BuN2twXV4kzFLKWgKDb88FYlXK9N/ktTJ7sQCIUd1QaiyMSrwUE/MWt7Bp33Sf1zkEmBD3V8DXd
	P3220++1ggP+eMmoZzMhKnj4zlckLsA=
X-Google-Smtp-Source: AGHT+IEspfSoxqbLIt/wPS3oIyPyVwU5YXPwKuyWMm8XPvGckSHESK4eRb45elfXhYfcQxhI/KTf5w==
X-Received: by 2002:a17:906:7315:b0:aaf:1183:ec2c with SMTP id a640c23a62f3a-ab75e221e80mr485372166b.5.1738783987681;
        Wed, 05 Feb 2025 11:33:07 -0800 (PST)
Received: from f.. (cst-prg-95-94.cust.vodafone.cz. [46.135.95.94])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47d06e5sm1167625566b.63.2025.02.05.11.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 11:33:07 -0800 (PST)
From: Mateusz Guzik <mjguzik@gmail.com>
To: ebiederm@xmission.com,
	oleg@redhat.com
Cc: brauner@kernel.org,
	akpm@linux-foundation.org,
	Liam.Howlett@oracle.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: [PATCH v4 5/5] pid: drop irq disablement around pidmap_lock
Date: Wed,  5 Feb 2025 20:32:21 +0100
Message-ID: <20250205193221.402150-6-mjguzik@gmail.com>
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

