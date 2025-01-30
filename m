Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0CC1C1F0F
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 11:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738235489; cv=none; b=eQHnv+M636FCeKuDoXz9iSQJPDs52aQtxl8ibQAdQweRGY8lRBog/HXfcMNrce2eXkiW7+hy7l9Sb9Qn7n3XAGu2tZSnrtYRbxSODzquf1s7DkYmH5yXim1WRgFir3JmqowNIHFAHfMHtodtELKauXBcCbr+0nJ595ziM5d6s0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738235489; c=relaxed/simple;
	bh=tY358JOT6veKi7LsBzecpXyxdMh6+UMn99jF1ru1xDY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MBxwhACuUMNZLkUtODLkL4qFnbrd+KnnmDucVS1iv4CgckAAbmUZZBFkvGMxtjTpPBKn1G9Uhwk386girfKK3rXGebwECvRvv/TGJRpM3irnbATrPa4HIRFg81b8kBG8bFpmDCz9tj0T2UhBOhu7HEKvXLZVlM9fzcAenGLyAxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aTr40ktQ; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aTr40ktQ"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21669fd5c7cso9728925ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 03:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738235487; x=1738840287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ti4+lyxlKNsrQ+jB6ZeK4CLAAqx7hgqRlGDCYQ/kK7M=;
        b=aTr40ktQL4krnhSLVUO6w2Uxh63B6h4jWNTMMBtpbgKqAz5oDXQB1TbT5AvFUhjVk2
         LR2VipcR/7YX+Ykhs9c/g9PxGXKem8mvQ0HxhQ03B5qjGSrzvakg9b44ixWuRG4lE2Or
         e2vBCsLi96c8n6qVcdkxTyzdXUsi/PShSND6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738235487; x=1738840287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ti4+lyxlKNsrQ+jB6ZeK4CLAAqx7hgqRlGDCYQ/kK7M=;
        b=rTFlNuyT4wHps9SVJTy0Ok05LvvKX1vvJoweA6/j0cYguQIqQb9ZcWRJHs3NH9LAto
         NDN1yylVC69enaaDNsSmegYQbaGYWnFByG9xsv2oUjDUaAfdicU9LXfj4E5m0In3KTvp
         9cE896F/qScEBiF4O4cTVCsXXf8pnsn+piu/4Z8KtrYQnRMeUZdKxqupTK3wPY2qbJTk
         HhZZjlKO+fnxgCasrS5XjOMyxSMqUA+h4bu8kTyKG9skLkaEfrfmErBlEEprjpoeh3eK
         xTO6oNRTeI+7xiOwYO4A1g5nu9+0IBZt0iGCNg+aiIahVyW3bvdgG1XL6L9vOnzynpZ4
         hntg==
X-Forwarded-Encrypted: i=1; AJvYcCW5dlHId0R2jpFUqFHkvUL1pzGHu4OUlkIk2LSzwarLZwziQD3CfvO5q4kcwOD7uCJtdN8UcKFp37vS6Q4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBpKSQ1oUo4D14dMbkgGD2SCBxZ9koIjsoA81fXlMK74UAAiDe
	gpuE57dJaSpbfDrun7kMjW15K2ImuTYHaE+tmehFNLdOLMn49BSSFIQWJU2+mQ==
X-Gm-Gg: ASbGncsTbRNegXZIgGHAEfUWkx6egSVwAqPE3NWoACKt+PMtnHZGZfFJtnTe09x/I7g
	gLBg9m8IEzQaPCvap7L8XVMFC75ZBqjSJPl7wJ/I3L2saHBce6hIMwgdyL73UoT4vr1+uJwj3JG
	0CsMlrLS88mc7NtoA1ETKgcEbYnug1hqgzczrWVZszE6uufmdkvkyr5ED6KYKVsGHK3Ia3T49x1
	iMz+NIkA8nMlBRJ9ogsSm7wAPSBeHi7/1BtT4gDFdhpob8DgPIcXPVxktyducThCQ2vLmL+XRWh
	WHQufMVLovjFRGWe
X-Google-Smtp-Source: AGHT+IHPjAb1rLSQ43OqGrbcZ/IzSuiJRWw/EpDyVdzrzHNxzjb1Y6QeLs4mCWjkG7KecIPQmqzeGg==
X-Received: by 2002:a05:6a21:c94:b0:1e1:a671:7122 with SMTP id adf61e73a8af0-1ed7a5b663fmr11965895637.2.1738235487646;
        Thu, 30 Jan 2025 03:11:27 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:d4ce:e744:f46b:4fb])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-72fe631be3csm1169577b3a.7.2025.01.30.03.11.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 03:11:27 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Minchan Kim <minchan@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv3 03/11] zram: remove crypto include
Date: Thu, 30 Jan 2025 20:10:48 +0900
Message-ID: <20250130111105.2861324-4-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
In-Reply-To: <20250130111105.2861324-1-senozhatsky@chromium.org>
References: <20250130111105.2861324-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove a leftover crypto header include.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/zcomp.c    | 1 -
 drivers/block/zram/zram_drv.c | 4 +++-
 drivers/block/zram/zram_drv.h | 1 -
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/block/zram/zcomp.c b/drivers/block/zram/zcomp.c
index 982c769d5831..efd5919808d9 100644
--- a/drivers/block/zram/zcomp.c
+++ b/drivers/block/zram/zcomp.c
@@ -7,7 +7,6 @@
 #include <linux/wait.h>
 #include <linux/sched.h>
 #include <linux/cpumask.h>
-#include <linux/crypto.h>
 #include <linux/vmalloc.h>
 
 #include "zcomp.h"
diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index 9ba3f8d97310..31b653ad6d0e 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -43,6 +43,8 @@ static DEFINE_MUTEX(zram_index_mutex);
 static int zram_major;
 static const char *default_compressor = CONFIG_ZRAM_DEF_COMP;
 
+#define ZRAM_MAX_ALGO_NAME_SZ	64
+
 /* Module params (documentation at end) */
 static unsigned int num_devices = 1;
 /*
@@ -1141,7 +1143,7 @@ static int __comp_algorithm_store(struct zram *zram, u32 prio, const char *buf)
 	size_t sz;
 
 	sz = strlen(buf);
-	if (sz >= CRYPTO_MAX_ALG_NAME)
+	if (sz >= ZRAM_MAX_ALGO_NAME_SZ)
 		return -E2BIG;
 
 	compressor = kstrdup(buf, GFP_KERNEL);
diff --git a/drivers/block/zram/zram_drv.h b/drivers/block/zram/zram_drv.h
index 3436ddf8ab23..045032acb22f 100644
--- a/drivers/block/zram/zram_drv.h
+++ b/drivers/block/zram/zram_drv.h
@@ -16,7 +16,6 @@
 #define _ZRAM_DRV_H_
 
 #include <linux/zsmalloc.h>
-#include <linux/crypto.h>
 
 #include "zcomp.h"
 
-- 
2.48.1.262.g85cc9f2d1e-goog

