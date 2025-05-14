Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E719E28EC
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 02:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747190943; cv=none; b=uOJfb7M5LgHUMWnF9rwRnLC0n2VV11Xsu5pABK3d4n3bYNyVWHnR0dWXRJqnVCLpmmI7vKmoz96w1bsNZX0JFVXSOBGR564qrk/7+1stx6ClTkyfxo3G6BGcw2IdG+JXBz/y13V/BzigGIEhnGacwBnyPHoTBGm8Oniw9WTqjwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747190943; c=relaxed/simple;
	bh=FrsrCOIsrVWdZBQureWJlyAelgtZXl4vdG5/kqjT0Uo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KS+69CQb8Rwvi3D6uEgf1leP/5zWELbG3VpQ4FN19LRk/a4e1s9onvz5EougFfBksIqVr74hyNrjeFg4XN1YehlHHQMF/vUsr4SUQhSDIv6DJDlVeFWLh2hCST4uKOKceWULWjKLgFrBeNm/t+MnCTf16Ek/CxM3GVNcs0iKRlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YaBerzYx; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YaBerzYx"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7410c18bb00so7532922b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 19:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747190931; x=1747795731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YfYQ/WK8QWoi6yOsmfhqLphXHC1mtE6IrX6WF+13WJo=;
        b=YaBerzYxsCAQm85bDzqXT78Af4jcRs676q363rObnXQGcMSIGXBnD4jBnwNng0WgJs
         QlYJYBiIZ8xwvIIbzZ1BQN2gFeTHu5E+YJV+Ep65l7xmZJwmQZS+H8djWRKgwZape23p
         o4G33XQ9TPI1sutii8u5Q0BCPa30SvNCmqmWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747190931; x=1747795731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YfYQ/WK8QWoi6yOsmfhqLphXHC1mtE6IrX6WF+13WJo=;
        b=JHx0IBWdL+sB8mwTkpHUjIUNFYLeXkMG4usuS5DSzj3d9l6MqKNzEX8p8VIOMn1Aul
         6PjHTe0yX4oO9i3gaSxKNhz5cDvxm3nUfeoUHbNK/OdOex9VgOyDF16EBMq20xga05rr
         dDnCzIgUX16FPL7jsw5ecPKGK6p/Cj/QVSlr4NnpMZK9jRAbs+VGGPOUM2pCjsOEldmO
         EZTDRcZCArQWJTs430XMINjp6cR36G2Lx1N5OcZr5cCCn1XXe8zmXzjWYr9WFACv1vsk
         j6igeCi4/WwLLiewDA5giQw0Zxnfp8hmGPRnrN8CkWAh1NKEG0s5KdpsmboQXsVPf6x3
         P0AQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPBJJfhm54GO3nhOLyalf/PEk4qTROocRyUYyvhXilGLiX+TYMONXD7t5YrDmN0oC/btUkiSy0SoxXqMU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2zfTKA4rgBl7kJ8Z1PNQXJFyXhlOdWGy7O2T8frJeGKwPwKMU
	r1rqqgtPbg/73q4W25dU0dOrhOo7O+lkvKy12pG7nBykpTG7gR1LbX6naLzljBVEj0vL8EqIc4g
	=
X-Gm-Gg: ASbGncsQkE6UdL/a8G1+ukRa/nF9En6tV/wqKG5N4xvki7CSyqTLttAmtJ4JFwBW3se
	E5XxsyHAvzFCDO6BITqkdKs2MI6T1qiHxfn25r7ygtomfck/L0GssAyrfxmA2axLBFPEgPy0vgw
	VsWdRVpiqRGLdmYkeUUeNFN+U/PlYLJMv/5dqNjsS9AZxVjLdRUQ9PL2rd0MghuqwdXZafkC/hy
	BAL9uTLEihtubzMkLS1jEUgm25cLddJzqdv/Mx1Nv5naxC1hj3rWcet9z2V+Y6dTaOTUD/oiA4Y
	4qub+tFUN7KWF9tFbB0r9DAngLiSq02Gux9eZeKUxAM6yhYBN8pS/wXMPZFRgB0OoDokjSR4OFw
	nCQ==
X-Google-Smtp-Source: AGHT+IF4ldq1Xj0QllHQs826ty0PgNOR/aQFXOR03YUP8fNtH/S40aAtPrbk82+q/rpOhKN2HsBt9g==
X-Received: by 2002:a17:902:d4c6:b0:224:1781:a947 with SMTP id d9443c01a7336-2319813f761mr26920275ad.21.1747190920383;
        Tue, 13 May 2025 19:48:40 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:d415:5e1d:3550:1855])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc75494cesm88759135ad.1.2025.05.13.19.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 19:48:39 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Zaslonko Mikhail <zaslonko@linux.ibm.com>
Cc: Minchan Kim <minchan@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH 2/2] zram: support deflate-specific params
Date: Wed, 14 May 2025 11:47:51 +0900
Message-ID: <20250514024825.1745489-3-senozhatsky@chromium.org>
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

Introduce support of algorithm specific parameters in
algorithm_params device attribute.  The expected format
is algorithm.param=value.

For starters, add support for deflate.winbits parameter.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/backend_deflate.c | 10 ++++++----
 drivers/block/zram/zcomp.h           |  7 +++++++
 drivers/block/zram/zram_drv.c        | 17 +++++++++++++++--
 3 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/drivers/block/zram/backend_deflate.c b/drivers/block/zram/backend_deflate.c
index 4c00b5b6739f..b75016e0e654 100644
--- a/drivers/block/zram/backend_deflate.c
+++ b/drivers/block/zram/backend_deflate.c
@@ -8,7 +8,7 @@
 #include "backend_deflate.h"
 
 /* Use the same value as crypto API */
-#define DEFLATE_DEF_WINBITS		11
+#define DEFLATE_DEF_WINBITS		(-11)
 #define DEFLATE_DEF_MEMLEVEL		MAX_MEM_LEVEL
 
 struct deflate_ctx {
@@ -24,6 +24,8 @@ static int deflate_setup_params(struct zcomp_params *params)
 {
 	if (params->level == ZCOMP_PARAM_NOT_SET)
 		params->level = Z_DEFAULT_COMPRESSION;
+	if (params->deflate.winbits == ZCOMP_PARAM_NOT_SET)
+		params->deflate.winbits = DEFLATE_DEF_WINBITS;
 
 	return 0;
 }
@@ -57,13 +59,13 @@ static int deflate_create(struct zcomp_params *params, struct zcomp_ctx *ctx)
 		return -ENOMEM;
 
 	ctx->context = zctx;
-	sz = zlib_deflate_workspacesize(-DEFLATE_DEF_WINBITS, MAX_MEM_LEVEL);
+	sz = zlib_deflate_workspacesize(params->deflate.winbits, MAX_MEM_LEVEL);
 	zctx->cctx.workspace = vzalloc(sz);
 	if (!zctx->cctx.workspace)
 		goto error;
 
 	ret = zlib_deflateInit2(&zctx->cctx, params->level, Z_DEFLATED,
-				-DEFLATE_DEF_WINBITS, DEFLATE_DEF_MEMLEVEL,
+				params->deflate.winbits, DEFLATE_DEF_MEMLEVEL,
 				Z_DEFAULT_STRATEGY);
 	if (ret != Z_OK)
 		goto error;
@@ -73,7 +75,7 @@ static int deflate_create(struct zcomp_params *params, struct zcomp_ctx *ctx)
 	if (!zctx->dctx.workspace)
 		goto error;
 
-	ret = zlib_inflateInit2(&zctx->dctx, -DEFLATE_DEF_WINBITS);
+	ret = zlib_inflateInit2(&zctx->dctx, params->deflate.winbits);
 	if (ret != Z_OK)
 		goto error;
 
diff --git a/drivers/block/zram/zcomp.h b/drivers/block/zram/zcomp.h
index cfacdfe9044c..4acffe671a5e 100644
--- a/drivers/block/zram/zcomp.h
+++ b/drivers/block/zram/zcomp.h
@@ -7,6 +7,10 @@
 
 #define ZCOMP_PARAM_NOT_SET	INT_MIN
 
+struct deflate_params {
+	s32 winbits;
+};
+
 /*
  * Immutable driver (backend) parameters. The driver may attach private
  * data to it (e.g. driver representation of the dictionary, etc.).
@@ -17,6 +21,9 @@ struct zcomp_params {
 	void *dict;
 	size_t dict_sz;
 	s32 level;
+	union {
+		struct deflate_params deflate;
+	};
 
 	void *drv_data;
 };
diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index a11b7a6e35f4..54c57103715f 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -1277,12 +1277,14 @@ static void comp_params_reset(struct zram *zram, u32 prio)
 
 	vfree(params->dict);
 	params->level = ZCOMP_PARAM_NOT_SET;
+	params->deflate.winbits = ZCOMP_PARAM_NOT_SET;
 	params->dict_sz = 0;
 	params->dict = NULL;
 }
 
 static int comp_params_store(struct zram *zram, u32 prio, s32 level,
-			     const char *dict_path)
+			     const char *dict_path,
+			     struct deflate_params *deflate_params)
 {
 	ssize_t sz = 0;
 
@@ -1300,6 +1302,7 @@ static int comp_params_store(struct zram *zram, u32 prio, s32 level,
 
 	zram->params[prio].dict_sz = sz;
 	zram->params[prio].level = level;
+	zram->params[prio].deflate.winbits = deflate_params->winbits;
 	return 0;
 }
 
@@ -1310,9 +1313,12 @@ static ssize_t algorithm_params_store(struct device *dev,
 {
 	s32 prio = ZRAM_PRIMARY_COMP, level = ZCOMP_PARAM_NOT_SET;
 	char *args, *param, *val, *algo = NULL, *dict_path = NULL;
+	struct deflate_params deflate_params;
 	struct zram *zram = dev_to_zram(dev);
 	int ret;
 
+	deflate_params.winbits = ZCOMP_PARAM_NOT_SET;
+
 	args = skip_spaces(buf);
 	while (*args) {
 		args = next_arg(args, &param, &val);
@@ -1343,6 +1349,13 @@ static ssize_t algorithm_params_store(struct device *dev,
 			dict_path = val;
 			continue;
 		}
+
+		if (!strcmp(param, "deflate.winbits")) {
+			ret = kstrtoint(val, 10, &deflate_params.winbits);
+			if (ret)
+				return ret;
+			continue;
+		}
 	}
 
 	/* Lookup priority by algorithm name */
@@ -1364,7 +1377,7 @@ static ssize_t algorithm_params_store(struct device *dev,
 	if (prio < ZRAM_PRIMARY_COMP || prio >= ZRAM_MAX_COMPS)
 		return -EINVAL;
 
-	ret = comp_params_store(zram, prio, level, dict_path);
+	ret = comp_params_store(zram, prio, level, dict_path, &deflate_params);
 	return ret ? ret : len;
 }
 
-- 
2.49.0.1045.g170613ef41-goog

