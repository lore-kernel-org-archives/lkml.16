Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7488D30114B;
	Wed,  2 Jul 2025 20:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751487279; cv=none; b=hZQU5tdJbkl/sL10gE5EvJXfgIZBxX1CoQVc3vgovrPrXJa1eFC4BQja3nnZw9QQvyTazI7BiAr2WLDGiVqtGyCdkoCppxWYOjcPrCaKoLkUyajCpcId7poj3vG1iSPvAYutmcxB0oY2dtH2Iir8miTMxpsxYgJBOf0o4XJS4+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751487279; c=relaxed/simple;
	bh=7ntNinQfVlf+pugu/WTlvuD/GFP+GYiXqJRcWk0ejH4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=si3fyzTXh236Hyg9d4Zrao9vdivufNNR+4Tsk/AqNMJ5ppSxI9dsqfAcb47r4TXacjA5HF83YAJRPSqtX8g0bQxsB0ogi0ShgImnLL0EJluB2AkSyMo07vBk5y6FjH3UoK0dEBbDnZRHZSFxzWvdYprg1a1LoHtaziBtHIK+rXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RUc6lWKn; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RUc6lWKn"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e898fb745beso151891276.1;
        Wed, 02 Jul 2025 13:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751487276; x=1752092076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ws2fCY+40qz7qYM2UXMSStun9zyhHrsexuHO2VyV7ZQ=;
        b=RUc6lWKn0fkF+1RhTc7oTkYGODDZt+ZREs0COufJevs/jWkvLCabJIb9ZOLqXxGIry
         7DP5WqquMnHOfRDdJSmFAB7Kx5pCENsYb0CMtyEgXMhzHjqMGMICMZkjR5YLwlWikO3G
         kjdUvnvZl2A/gGeBhr/81EHfZJUXMlbKmYKW4SbOp0yz4TppP3gr9027vyPNA+ECVqJJ
         LDwxFNPaKw4KNilU6r4rtMpijCF02iWafiWY5sv4V5ADD9/+1dlXEBGklwNsHQt9QUyW
         2tMSh7VtsWqwQtMlkOh1ZWmRXJDc1DUOcWfryYkkG3gJRAdJj+7qwJ+AuWHwtNfRMH/P
         Ds0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751487276; x=1752092076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ws2fCY+40qz7qYM2UXMSStun9zyhHrsexuHO2VyV7ZQ=;
        b=Wx/DEN63433RE3wpPqDALls7DE9wgFk5IIUnjyRMKTA8SPBMfQLnMFlLe3nhJKukA7
         nG6JH36X7dQzH+MfPPGOeHKwriSNxffwZrS4IaPMSk1tKsFFB3zBtWVjur8+vK923VRd
         EkJDEfgih70+ENmQUmNx8u9XGDis3/nrFdYu79zdVghnRf7yV038OQSwMWiY5GwGff8Q
         TBpMDnzAsSa7ZRH4wfFuB+OlramozGGBxR7DoDTxWPwe94O9J8BX8PTZOOVJuGJWIZnd
         5BjIMcyyTDFUUG1WnnFeW+5uK16sw7u3nGtON10QWzV7McQb08QJTqVGxrCIY2bQHVeW
         T8qA==
X-Forwarded-Encrypted: i=1; AJvYcCU/oq/ZYXXnKdkrx9wGkdqm4ltoz+MozDwERLivCTKoxj+SYQPIwWQiYUPzX31APk1LgDX79FRdt9M=@vger.kernel.org, AJvYcCXy+PAu3u3RB3mADStGAWyNt9j6fYuy4a2sxd/YqJlE/2/K1c4SMYbRF9nmIyffdOoz/54YmNIHQFYaLqsl@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi4/cDRJUESPmp0cVhJYHZgDZe3ueUr30uXB1qGTI8uFbb6XAG
	YNsAqCk2XlmICraKZxCZ2rqTAoq0JLgKyo84C0TSk41UEGGj0GrmO0bJ
X-Gm-Gg: ASbGnct3ZyV3lK203OLQ7ureGImuQNLfiNPqHmZmS3KzM2jWOeGo7YtqF7628uqxGkA
	MfnW6bnKKrdf3D7/q21KC4AB2ZxSB59rZEoNWfN8/Gb+UHsfbu+iOg+l/6Nu/pet2raOQSM42Jm
	cc0Uon3+S6ukLvHbKsmAfWEgsHJKfFJDm5t6VOUTjXnEWj3e8YFbSE8pAhSyse9ZLqH90m+zlen
	ch3FS6B/cMF6AQpHm45nn4Gr7Vlocia+4Qlazb/O9Gf1B/sCxzKaEPcKptk/X9pSbLVa/HjKjT4
	YyxpBwI9ZsbV1Mz4o5C0/TJifrxRSTJcciGln/fHGdA9MUP8RqhysRpLL+cRnMmXHPqd8ZIIW2k
	mwSVFWYM=
X-Google-Smtp-Source: AGHT+IFMh0Zpmv4j5OzZGutnmhihaCWP4mrmEUdEh5Fn5yyRhW1DwP6dI+488wgyAG0GH6wDYQKuKQ==
X-Received: by 2002:a05:690c:8686:10b0:70e:4d8:5cab with SMTP id 00721157ae682-716590c7964mr10179957b3.2.1751487276493;
        Wed, 02 Jul 2025 13:14:36 -0700 (PDT)
Received: from bijan-laptop.attlocal.net ([2600:1700:680e:c000:873e:8f35:7cd8:3fe3])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-71515cb4347sm26124157b3.83.2025.07.02.13.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 13:14:36 -0700 (PDT)
From: Bijan Tabatabai <bijan311@gmail.com>
To: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: sj@kernel.org,
	akpm@linux-foundation.org,
	corbet@lwn.net,
	joshua.hahnjy@gmail.com,
	bijantabatab@micron.com,
	venkataravis@micron.com,
	emirakhur@micron.com,
	ajayjoshi@micron.com,
	vtavarespetr@micron.com
Subject: [RFC PATCH v3 07/13] mm/damon/core: Commit damos->target_nid/migrate_dests
Date: Wed,  2 Jul 2025 15:13:30 -0500
Message-ID: <20250702201337.5780-8-bijan311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702201337.5780-1-bijan311@gmail.com>
References: <20250702201337.5780-1-bijan311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bijan Tabatabai <bijantabatab@micron.com>

When committing new scheme parameters from the sysfs, copy the
target_nid and migrate_dests of the source schemes into the destination
schemes.

Signed-off-by: Bijan Tabatabai <bijantabatab@micron.com>
---
 mm/damon/core.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/mm/damon/core.c b/mm/damon/core.c
index a4c3cfe531df..0565aae8d1fa 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -943,6 +943,41 @@ static void damos_set_filters_default_reject(struct damos *s)
 		damos_filters_default_reject(&s->ops_filters);
 }
 
+static int damos_commit_dests(struct damos *dst, struct damos *src)
+{
+	struct damos_migrate_dests *dst_dests, *src_dests;
+
+	dst_dests = &dst->migrate_dests;
+	src_dests = &src->migrate_dests;
+
+	if (dst_dests->nr_dests != src_dests->nr_dests) {
+		kfree(dst_dests->node_id_arr);
+		kfree(dst_dests->weight_arr);
+
+		dst_dests->node_id_arr = kmalloc_array(src_dests->nr_dests,
+			sizeof(*dst_dests->node_id_arr), GFP_KERNEL);
+		if (!dst_dests->node_id_arr) {
+			dst_dests->weight_arr = NULL;
+			return -ENOMEM;
+		}
+
+		dst_dests->weight_arr = kmalloc_array(src_dests->nr_dests,
+			sizeof(*dst_dests->weight_arr), GFP_KERNEL);
+		if (!dst_dests->weight_arr) {
+			/* ->node_id_arr will be freed by scheme destruction */
+			return -ENOMEM;
+		}
+	}
+
+	dst_dests->nr_dests = src_dests->nr_dests;
+	for (int i = 0; i < src_dests->nr_dests; i++) {
+		dst_dests->node_id_arr[i] = src_dests->node_id_arr[i];
+		dst_dests->weight_arr[i] = src_dests->weight_arr[i];
+	}
+
+	return 0;
+}
+
 static int damos_commit_filters(struct damos *dst, struct damos *src)
 {
 	int err;
@@ -983,6 +1018,11 @@ static int damos_commit(struct damos *dst, struct damos *src)
 
 	dst->wmarks = src->wmarks;
 
+	dst->target_nid = src->target_nid;
+	err = damos_commit_dests(dst, src);
+	if (err)
+		return err;
+
 	err = damos_commit_filters(dst, src);
 	return err;
 }
-- 
2.43.5

