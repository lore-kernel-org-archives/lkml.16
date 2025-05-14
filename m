Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624A91E1DE5
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 02:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747190920; cv=none; b=hsER+NgQiCCB/O/iqwIcTVIPOZwVzRr1EENSSWBoeAtnCgUg8GpLBCR1hb3pEm4vMaxMBhpAJkfIUjPafbqrcZT7OVHNRP7c4xH+N0Zeqk4bmzKKrcza0PrpdWtD6e8P3xTBjv+EXrwOJ00MklBotiCMB/2rMZg39GQz9RQ8hAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747190920; c=relaxed/simple;
	bh=XdJVMJ1T1WKrcopMnLrB04u+S588PAofbnd72d0zH40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MWBtPFUkdUd7fc2mOxPm6Pnev5Rq8iJZnhm2gv8Pzvg0AzQT9DhKkMJ74ewuxD5qLM+yKwQ1j6UR2GPxuJYDWIhizacD59GOlfw3EIbcL2EQ2Is5euVbhwPIAT82YzEPM6x7KfbaieHCMGpv0m8mgzWE/FMSqs56bm6pBAInJfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fa8P9c7k; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fa8P9c7k"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b200047a6a5so380372a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 19:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747190917; x=1747795717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bm+4BtLol9/sqpOcVOE8llO8FpdxZiHIedhNVFbErKc=;
        b=fa8P9c7k/E5bXui1/qfazNLDv5xzcYdeuxUrCwRaXvvoGr7rvwwBLiw8SYWwjL52kf
         wgD3KvCcDMgb3vYIsIOjnrIoBAkySSn+8w7wlxFnuyFzkIIcOwXOkFZ8BF5xgEAQDHmO
         PoFOaClmgKyZ8zJg1rusa8eOhbixxOn/yyoXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747190917; x=1747795717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bm+4BtLol9/sqpOcVOE8llO8FpdxZiHIedhNVFbErKc=;
        b=WiLmYRjCw22wxhLtOWMM4pLV5RmhSxmJTbTUz0S00ZR1/EgW/sXnGm8Ukzhos1TFF0
         ctgwPsJr6BnZ6z7m5jtBOmCSztzpbaHzBHpgWmxNDVK7gw/5cd17fuKSD5zYanJcbaCL
         Gazx/Vca9O4hmomPvbFnvy2f0ah6h323Q3yLD6v6zz4T6/xLgAlwa9PE+YkOz6Dbl7zl
         0e+Era5YJZuVlbVN27lBAHl9/kQVmswzwrKO62im+YNM8QNnzVOZth8huM1vFqhYXUDG
         qmi112E0Gjkg7QpXGBNWRsiihU7K6O5BXtG3P8woOwFHxIa/BC4bpSYSi46Bz+jaVimq
         b68w==
X-Forwarded-Encrypted: i=1; AJvYcCWuuislGXZNuTcAE9Mo5dDObmkrdS/CLp5guTkwHU4v8+alA6Zj5HkjRaPbBUPWewwyIZPPkbvtgNZ0uWI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3pgnOT/YXu7h3iEaEVLe4OwPanLDMWGCtBrLNntck2vMe+mIs
	B48W1e1N4FWDL6Km/7gvtjkess7Pw55we4umIV8hjNTVkaUVdjtcFMly5h4OVg==
X-Gm-Gg: ASbGncurXukWP8j4s9Usb66bGuBdMKOkiAVbyCymyfJYbQmDcydIOW6BxRI/J9ygm0l
	4VdN+Eek/wfSlOaYFW8SROz0l7RVNmo2yy+Nugl7mtEGVuxM5ffuUlA8A9xOVCMPQWPVRdKxZag
	R/Sv38BRLdqZxqP0eod4egOWTeA65OOOA5vp2lmNgUe/605U9bYs/8QmE+ulyNx9Ba+Hn0WHd2D
	Lo6badfDazbfdNNiEwGTqAe+25Hb/VOVa9dD9PWPGpjcA8o+pWInAW4dwbWORSsQKvwCAHB5B/v
	aTD07Rig7aC4G4lAiNY6TqkrXbGz1BFmgLc/KynUGQP8nIQBzHLglQC/FJIpLSgefDHbhI5IwOf
	M5A==
X-Google-Smtp-Source: AGHT+IGxdnCV7Xgmaq4ExIVkzPQEkLkcGBzTDQDOsBCcrwnoUTsrzifxMTPcrfJO6IG2sJKAEAwYqQ==
X-Received: by 2002:a17:903:2406:b0:21f:6ce8:29df with SMTP id d9443c01a7336-2317cade041mr86349495ad.3.1747190917682;
        Tue, 13 May 2025 19:48:37 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:d415:5e1d:3550:1855])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc75494cesm88759135ad.1.2025.05.13.19.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 19:48:37 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Zaslonko Mikhail <zaslonko@linux.ibm.com>
Cc: Minchan Kim <minchan@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH 1/2] zram: rename ZCOMP_PARAM_NO_LEVEL
Date: Wed, 14 May 2025 11:47:50 +0900
Message-ID: <20250514024825.1745489-2-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
In-Reply-To: <20250514024825.1745489-1-senozhatsky@chromium.org>
References: <20250514024825.1745489-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use more generic name because this will be default "un-set"
value for more params in the future.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/backend_deflate.c | 2 +-
 drivers/block/zram/backend_lz4.c     | 2 +-
 drivers/block/zram/backend_lz4hc.c   | 2 +-
 drivers/block/zram/backend_zstd.c    | 2 +-
 drivers/block/zram/zcomp.h           | 2 +-
 drivers/block/zram/zram_drv.c        | 4 ++--
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/block/zram/backend_deflate.c b/drivers/block/zram/backend_deflate.c
index 0f7f252c12f4..4c00b5b6739f 100644
--- a/drivers/block/zram/backend_deflate.c
+++ b/drivers/block/zram/backend_deflate.c
@@ -22,7 +22,7 @@ static void deflate_release_params(struct zcomp_params *params)
 
 static int deflate_setup_params(struct zcomp_params *params)
 {
-	if (params->level == ZCOMP_PARAM_NO_LEVEL)
+	if (params->level == ZCOMP_PARAM_NOT_SET)
 		params->level = Z_DEFAULT_COMPRESSION;
 
 	return 0;
diff --git a/drivers/block/zram/backend_lz4.c b/drivers/block/zram/backend_lz4.c
index 847f3334eb38..daccd60857eb 100644
--- a/drivers/block/zram/backend_lz4.c
+++ b/drivers/block/zram/backend_lz4.c
@@ -18,7 +18,7 @@ static void lz4_release_params(struct zcomp_params *params)
 
 static int lz4_setup_params(struct zcomp_params *params)
 {
-	if (params->level == ZCOMP_PARAM_NO_LEVEL)
+	if (params->level == ZCOMP_PARAM_NOT_SET)
 		params->level = LZ4_ACCELERATION_DEFAULT;
 
 	return 0;
diff --git a/drivers/block/zram/backend_lz4hc.c b/drivers/block/zram/backend_lz4hc.c
index 5f37d5abcaeb..9e8a35dfa56d 100644
--- a/drivers/block/zram/backend_lz4hc.c
+++ b/drivers/block/zram/backend_lz4hc.c
@@ -18,7 +18,7 @@ static void lz4hc_release_params(struct zcomp_params *params)
 
 static int lz4hc_setup_params(struct zcomp_params *params)
 {
-	if (params->level == ZCOMP_PARAM_NO_LEVEL)
+	if (params->level == ZCOMP_PARAM_NOT_SET)
 		params->level = LZ4HC_DEFAULT_CLEVEL;
 
 	return 0;
diff --git a/drivers/block/zram/backend_zstd.c b/drivers/block/zram/backend_zstd.c
index 22c8067536f3..81defb98ed09 100644
--- a/drivers/block/zram/backend_zstd.c
+++ b/drivers/block/zram/backend_zstd.c
@@ -58,7 +58,7 @@ static int zstd_setup_params(struct zcomp_params *params)
 		return -ENOMEM;
 
 	params->drv_data = zp;
-	if (params->level == ZCOMP_PARAM_NO_LEVEL)
+	if (params->level == ZCOMP_PARAM_NOT_SET)
 		params->level = zstd_default_clevel();
 
 	zp->cprm = zstd_get_params(params->level, PAGE_SIZE);
diff --git a/drivers/block/zram/zcomp.h b/drivers/block/zram/zcomp.h
index 25339ed1e07e..cfacdfe9044c 100644
--- a/drivers/block/zram/zcomp.h
+++ b/drivers/block/zram/zcomp.h
@@ -5,7 +5,7 @@
 
 #include <linux/mutex.h>
 
-#define ZCOMP_PARAM_NO_LEVEL	INT_MIN
+#define ZCOMP_PARAM_NOT_SET	INT_MIN
 
 /*
  * Immutable driver (backend) parameters. The driver may attach private
diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index 94e6e9b80bf0..a11b7a6e35f4 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -1276,7 +1276,7 @@ static void comp_params_reset(struct zram *zram, u32 prio)
 	struct zcomp_params *params = &zram->params[prio];
 
 	vfree(params->dict);
-	params->level = ZCOMP_PARAM_NO_LEVEL;
+	params->level = ZCOMP_PARAM_NOT_SET;
 	params->dict_sz = 0;
 	params->dict = NULL;
 }
@@ -1308,7 +1308,7 @@ static ssize_t algorithm_params_store(struct device *dev,
 				      const char *buf,
 				      size_t len)
 {
-	s32 prio = ZRAM_PRIMARY_COMP, level = ZCOMP_PARAM_NO_LEVEL;
+	s32 prio = ZRAM_PRIMARY_COMP, level = ZCOMP_PARAM_NOT_SET;
 	char *args, *param, *val, *algo = NULL, *dict_path = NULL;
 	struct zram *zram = dev_to_zram(dev);
 	int ret;
-- 
2.49.0.1045.g170613ef41-goog

