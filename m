Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6945B14F102
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 04:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738212317; cv=none; b=BnESuGAeq0OSGDQzfyjo7jvei0kHHcJpjP846rgr+3ZUXmW/HVtFvvSFYKHhrS1nYmOQelzEuay/XwdNkhA/T89KsGLiUWihQFtI6bR7Mx4BPbD4Yv4q1Z0S+WGcCqKqaQ4rvehZ/OBxUzg0tNG8aPLB6JOBEHR7zmSD5jUK5YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738212317; c=relaxed/simple;
	bh=mf8hb9oMGAcg6xZZocFsqBCJKRD7U4e7NciQTHCeCJk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sS+YqSJR+o/3V6nPzxmTBCNKIwr8LP6aKZFWRR0aW0rvOScHU1vHCZQRrFnSm93N/kguMM2b7Ys2cxMea21ovvtmfNmNbC1OKS+ehY1Oa1TpnFUIZIDr3EQbmTTQt5e9NaICqa9Gx0fCMXZfhvDbmsysXflPkRZZoy6SvVAfXxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Tc2klEBG; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Tc2klEBG"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ef8c012913so427934a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 20:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738212315; x=1738817115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qoanfGA+iKM2lkr04fEBeNmdyi5bnUfmaHtYhcyT7Yw=;
        b=Tc2klEBGL5ZPnOVYJaERNOol/ecdMnAh4PAIcnlDdkfNhm/1gALnZG75b2WEBLD3z+
         T8zzAbOTg1LrbTPfzaqzSdT5F2ebixwXM+bwsjjkbu1TWlcBm0VdnFz+owMOqxMzM2kX
         clBRVRI9bfwWMbXOWY4CjYj9Op+Jj2M2XdKW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738212315; x=1738817115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qoanfGA+iKM2lkr04fEBeNmdyi5bnUfmaHtYhcyT7Yw=;
        b=quq+EZ7lBFn/uCvIFdx4IPOdDQAwVfRw4wQQIIQGuyxMKURx0elmo2BrZziJNX61H2
         FFAnJwpT3fMlLcaHmzdBd+cgJhojKHLfVwZAePsJoTgAZHoo6jS4jujDxThBmB0TZpUH
         O66JwyOcAKd08+tUVGfEdOyrQ5dwvLYKLOMDaVijNmr0B+vmEQNC0NJBOH/Gc3Pk04Ba
         boL6UCVNwwbd3yAlO3FtCjuwcdNTVQNtiTNhJmomILZJYUdK1Z7ryZqJ+gACT6gbWELJ
         O89tt8cdc6KPEJeAsSN2s8Pa9o8jMNF9x+b3V7EkKAk9XRmVxc1e/gtZczlpI9L/pcZ0
         NWFg==
X-Forwarded-Encrypted: i=1; AJvYcCVIfm8sXaqDvZvdYDrnfWML6/PhRmSOn9k5jJeweaEhWuU8HLNmMnxIFssR9dYS81ZhR4E24y4BAMsGLaU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyL7M0FMyq0ygZ1igXb6jtnNbT5vuwZ+p90UQE/BuGYqgz6S+3P
	U/LST9W9iiBkjbuFxldGtG7KBN4G45UK3+Uur3mtwlKXKr4CwZ7nltr6yYbvKw==
X-Gm-Gg: ASbGncskxsE5m8hZj2xeNFc1sllnsvSeAgb123U+jp1uv/gUvq9OOC0V9e8AZe4gqfn
	bZHku1v7qi2uEKgVIO6Xl6eQ9A3jFyJgThtdqhKUb+/YDjU5/SArH2loJrBnXcypDt+BRv0npgX
	HSlm1A4AotLdkrRhIrkSLqSNdpF1OKeDCeuwWw/MnHIhPJuSaYBIJstQPVK5ouXIFgh8sHPoQ19
	FK0Bq3ZtL+k1mtqgwZauXf+UlZzN8Um4nvsbbVeeX5XYjaXhLbM/EHqMCVX5RSZqsakeRYScnOF
	sV3zwMckF/hhNiEulQ==
X-Google-Smtp-Source: AGHT+IF2UbQJQ89YEqryPhFxoeZX28FVlFBfWDCACr57M7BnO6sGVckgAr34ZiwemLJQw2ugQkpK1Q==
X-Received: by 2002:a17:90b:5190:b0:2ee:ad18:b30d with SMTP id 98e67ed59e1d1-2f83abbd886mr7881534a91.6.1738212314683;
        Wed, 29 Jan 2025 20:45:14 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:d794:9e7a:5186:857e])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2f83bc98ae9sm3012541a91.10.2025.01.29.20.45.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 20:45:14 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Minchan Kim <minchan@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Uros Bizjak <ubizjak@gmail.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv2 2/7] zsmalloc: re-shuffle zs_pool members
Date: Thu, 30 Jan 2025 13:42:45 +0900
Message-ID: <20250130044455.2642465-3-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
In-Reply-To: <20250130044455.2642465-1-senozhatsky@chromium.org>
References: <20250130044455.2642465-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no need in having ->name at offset 0, it's never user and is
being followed but a very large RO (after init) array of size classes,
so each time we need to lock pool->migrate_lock (which happens relatively
often) we need to jump over that RO region.  Swap ->migrate_lock and ->name.

Move ->pages_allocated is modified relatively often, move it up
right after RO size_classes arrays.

We modify ->compaction_in_progress and ->stats only from compaction
(defragmentation), which can run only on one CPU at a time and,
depending on the case, may or may not be common.  Move both to down.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 mm/zsmalloc.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index 8972b4b56cd3..2280ea17796b 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -204,18 +204,15 @@ struct link_free {
 };
 
 struct zs_pool {
-	const char *name;
+	/* protect page/zspage migration */
+	rwlock_t migrate_lock;
 
 	struct size_class *size_class[ZS_SIZE_CLASSES];
-	struct kmem_cache *handle_cachep;
-	struct kmem_cache *zspage_cachep;
 
 	atomic_long_t pages_allocated;
 
-	struct zs_pool_stats stats;
-
-	/* Compact classes */
-	struct shrinker *shrinker;
+	struct kmem_cache *handle_cachep;
+	struct kmem_cache *zspage_cachep;
 
 #ifdef CONFIG_ZSMALLOC_STAT
 	struct dentry *stat_dentry;
@@ -223,9 +220,14 @@ struct zs_pool {
 #ifdef CONFIG_COMPACTION
 	struct work_struct free_work;
 #endif
-	/* protect page/zspage migration */
-	rwlock_t migrate_lock;
+	const char *name;
+
+	/* Compact classes */
+	struct shrinker *shrinker;
+	/* Permit only once compaction at a time */
 	atomic_t compaction_in_progress;
+	/* compaction stats */
+	struct zs_pool_stats stats;
 };
 
 static void pool_write_unlock(struct zs_pool *pool)
-- 
2.48.1.262.g85cc9f2d1e-goog

