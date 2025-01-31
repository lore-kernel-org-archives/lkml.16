Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CD018871F
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 09:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738314438; cv=none; b=ScyRfnab72JrpCB0a345asxf8c2GrLMaFtsTeddKAbayOWoJfscf/nosLlVUlYxgw8LYO69slCX0K238pt6Rt6aK2ax87vW9xBhL9wTXiX9nV1CMwci8piaBKacUO8ip7lWfcpCYNTlt3T+bS8vQEUfVRhNibRb2bV7zUNBqLOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738314438; c=relaxed/simple;
	bh=KBisht+WpBvXm0v+20ockyV3U5DpyRL1QZ1uYJrU6jY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MdNRNqveDSg1YSiW4ulenF9S2Q/Bm3BZKWKwV2iUfrdPbd4bx3oi3gbrMD6niekmD4eXu5ZVHliGDk1XFz6V1CRRCZ5fgDWIke1gfMMTzVeqmL1GZos/OHFye19Lw0OBg0eeH0bCkrSKfeZ3G40aJ7JG9D8zcv0cYtngOay9B8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PLrFX7XS; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PLrFX7XS"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-215770613dbso22348565ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 01:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738314436; x=1738919236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n/jN2+B1aQ/0Z82UnSahO/vWpa5e/0HHbY39bdZtI8w=;
        b=PLrFX7XSSOLvj+zYEMOgCPTlwGhahiSFyF2eE2hVRE+oaAlPCHsFdWHq6iB0MS65YI
         fMx2pd1mlYb605GTUctF6WSghYl5ibWfNWIm+4jdcYrqYEqVoYdyU/IhJY6q/aVVNqve
         LfszcNCWbab6J8hVgRgJfpQRXWGPAYGGs5gS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738314436; x=1738919236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n/jN2+B1aQ/0Z82UnSahO/vWpa5e/0HHbY39bdZtI8w=;
        b=OTs0ggtvZWZINmIxLICz8JbiVbozN9kFDP5F84LYGxNcnnmHQSSxA0sZ6e+tj/asM0
         kSAPIG321Bc5L6Q9XN/U4qZ6PZZmvLDBfF0xeYpfkRE11KGCyQzX8+k9nBMHGSjHt974
         3uG0M/xDmVbiwO5vJw+gLWo9kDhSjBfQ7FVmPko/kF73/Gn6yrNaA/MSZU3Sqxcl1Fub
         Pl2duPVDowVAPTeqlCknlIjIFPJ0fQoU0yA7BAW2guzBb12qCTXPxwDDNK7x6nQtmWUh
         g9nR3wI01VChYMHkw1Wn5hlXwDdDU1H0k72aTCfaZrNMvvLOOT02BfSG9iQWmKEM6B2M
         iwlA==
X-Forwarded-Encrypted: i=1; AJvYcCWpvsOvl0k4zBSxuDcPIfdsuA4S54ZY5+SImZLUN5SkZmE/jWrdQ5YWKdQfIDA4Mg+tpZywqjaXZd3cFUQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEQ543Bo/0HFWNurCpgUuNjsPC801IscbEFZoKVbhod52Bh0hi
	PTu6shyYQKaD/Mksa4W9ozAjZLDwAliS922Px8ocRwNggswHG8ubf1H7c7c0uw==
X-Gm-Gg: ASbGncs26LNCZ1zG9kkCDOqiBkFWcook7kO1+xLQ/n6Imd1G946jUjdmhP160WyI3+0
	bcjtBlNHXOf7i5cN5pe3j+kZH4H+m/HRTpGxh/+DX8DvNc7YfpSODzTuKrJGCnBoehj/w4V1EQj
	CasmNz1VuZoEWDS2H0UCLS3lsnU4WzgSBFnTA5BuFXcFh6pCRq1CujODWVctM4kJ9DW5mxnsZvq
	8VC+DHeObMNnpq11/FcnSI4+RppozAdwIfbQ7S9Pk9mvJk3HE8CwsJwcWWLnEZkZAWLmFKG9yFd
	qHpZELfAokJPicraMg==
X-Google-Smtp-Source: AGHT+IFuc7qdcZdQN6B06WAX8++wNkf8GmtQ583C/YsjPsWR7di3HOqQJ5UOroWbF4X70ISjCdoQzA==
X-Received: by 2002:a05:6a00:3e13:b0:72a:a9d9:5a82 with SMTP id d2e1a72fcca58-72fd096a1bemr14710114b3a.0.1738314436186;
        Fri, 31 Jan 2025 01:07:16 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:c752:be9d:3368:16fa])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-72ff8ae7c9dsm575712b3a.71.2025.01.31.01.07.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 01:07:15 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Minchan Kim <minchan@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv4 03/17] zram: remove crypto include
Date: Fri, 31 Jan 2025 18:06:02 +0900
Message-ID: <20250131090658.3386285-4-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
In-Reply-To: <20250131090658.3386285-1-senozhatsky@chromium.org>
References: <20250131090658.3386285-1-senozhatsky@chromium.org>
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
index 8d5974ea8ff8..6239fcc340b6 100644
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
index e20538cdf565..3ae2988090b3 100644
--- a/drivers/block/zram/zram_drv.h
+++ b/drivers/block/zram/zram_drv.h
@@ -17,7 +17,6 @@
 
 #include <linux/rwsem.h>
 #include <linux/zsmalloc.h>
-#include <linux/crypto.h>
 
 #include "zcomp.h"
 
-- 
2.48.1.362.g079036d154-goog

