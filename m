Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE6F450F2
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 01:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743040708; cv=none; b=RgTZpTPTLJZlNWbLyEgMC4BLRPHhODSFj+8gAkxR8PSF8VEj9GncUO6NPgPICM2xiYlSf9Gu1g4QdsQkAB0pGW8qR1XxT9MvhhQ5sinzdW2kz7afRffc2CIp0aGyj2v/IP+a3qGynBnic5+s+tsLeoGkjFeLe7sxOXoqbfxfPbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743040708; c=relaxed/simple;
	bh=y5Yc2AWg7KRuGni0Mizpld+5ZmkhffNgW7Th7yyA5FM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u3sp40mgdea7ysT5RkMfOucqwHPFTYqUWNAH14KHe5BZS8DCg+VM8Q4wZHW51x11k9ye5p7+P0RU7in1d+TSsc6WrY4g5Hcx90q/PRLXukvig26FPp/5ilWSpNi3Y8c49A0WwHCSZmQAsTu+Gj9YpP25+4K2ofFJ6pgsB7SAE8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MIPPGnS2; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MIPPGnS2"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2279915e06eso10614815ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 18:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743040706; x=1743645506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6uNWrXSTjfeu5Aiv0ot8FNDbO+2f9UO0L73RTwUFwaI=;
        b=MIPPGnS2KGC/Picb1QH4HuBErO/74iBOFMlLOY3k8koIo6wHM1RXiiCPgFNbZgkcMG
         yyT42bG69/D6gml1wCalByM6ZdGKSzTFMpbLdvd9XtTXrLBB7Lp/06vXl6d0SfO64pIL
         xITn5Oliigo3eABPKhuqtsThH4SFKySyPYvWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743040706; x=1743645506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6uNWrXSTjfeu5Aiv0ot8FNDbO+2f9UO0L73RTwUFwaI=;
        b=ZiYjnvNnknrLZ+wcZaBOihc/0iCZ7ajmT4u0e3KDXoEbEbWtfmkXzSjcSi7bVcxQ1q
         P3BDFp4jgOLH4ZeYDL5xQtILOR7YnhUnoYiCd4okruyeQjDXwUzRl9ERTJAHvvGIBaT1
         ol37CuE0XXLnlIu+LWiuYROcaJi2f1YFE5s0ip6O4rIaZJuxk4rf9CUeGjQKevl9v7N9
         pcGnZ3dJhmKDupfm3mW8LzYzMwLLUUTO9QOThqYr3vdXQmhHs0+NQq5jplzJ5ZuoE25f
         n8WRYe8NmMzghvXEzM6m+e0PQCM8o5xQoD+WzUnfLoY4+pro44kf8Bu7a1hmqqFh16L8
         2S0w==
X-Forwarded-Encrypted: i=1; AJvYcCXcpr6Koz+07SdC813tTSiNl/qzHbV1kVnIxXqAbVvwG+0MS8YboUFJcSHoO7ocIF2qKXlekMaUcyvB1T0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4MmxMJofldfC9hQzlY6soj2X980pct/3s3j/47yTosjlgkKAn
	k9nbr5ivphRpUdoMf0NP45g+u4CsgeKUF1sO2B9/lnzZ+kMJn5B8IcYqtRZxGrnGTaGKbcKguyP
	7bg==
X-Gm-Gg: ASbGncvgBzKtFLuaxAKRc9eyJ+EW65shYM+FLk3nxvQMwp1zTThOV2R4Ly1DI1oJCNB
	k3PnzHqZJwhwCfmIOML1ZOL6vyQjonvnw9bWGZAhzSmZA4ICAqrOPgIw2m3u4WzhrYjDY6+qV5l
	0Ml3AbXL8GFpfM0eGVBfghlqngsg+UnD9q9ntYqrc8UFfvJXmPDjS3k0Bqehi+0ZLexMgvlL78Q
	yNvolobzi3blW1PsCMpTCinV+bKUQeJhrYQn79N87gT3x5lMuGFRLqpPn9MyjjTA2kJ+pQJdbtO
	HL/9y8Bxvl9n5FErGfVjZ1h+X0j7O7lAhaK0oNfcoxQfm4FSGRBb7fP6wEo3FPEC7OLUIg==
X-Google-Smtp-Source: AGHT+IFgCjEGsfmZC/cFD1rz5jTmPfnSGBzSPP2T8YYuA6b3EF7+oKU92MWdhl5U1dvCKyZ+zR8XHg==
X-Received: by 2002:a17:902:e5c6:b0:223:60ce:2451 with SMTP id d9443c01a7336-22804851df6mr23326415ad.15.1743040705764;
        Wed, 26 Mar 2025 18:58:25 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:cd9c:961:27c5:9ceb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73905fab592sm13482435b3a.19.2025.03.26.18.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 18:58:25 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Richard Chang <richardycc@google.com>,
	Brian Geffon <bgeffon@google.com>,
	Minchan Kim <minchan@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv2] zram: modernize writeback interface
Date: Thu, 27 Mar 2025 10:58:09 +0900
Message-ID: <20250327015818.4148660-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The writeback interface supports a page_index=N parameter which
performs writeback of the given page.  Since we rarely need to
writeback just one single page, the typical use case involves
a number of writeback calls, each performing writeback of one
page:

  echo page_index=100 > zram0/writeback
  ...
  echo page_index=200 > zram0/writeback
  echo page_index=500 > zram0/writeback
  ...
  echo page_index=700 > zram0/writeback

One obvious downside of this is that it increases the number of
syscalls.  Less obvious, but a significantly more important downside,
is that when given only one page to post-process zram cannot perform
an optimal target selection.  This becomes a critical limitation
when writeback_limit is enabled, because under writeback_limit we
want to guarantee the highest memory savings hence we first need
to writeback pages that release the highest amount of zsmalloc pool
memory.

This patch adds page_indexes=LOW-HIGH parameter to the writeback
interface:

  echo page_indexes=100-200 page_indexes=500-700 > zram0/writeback

This gives zram a chance to apply an optimal target selection
strategy on each iteration of the writeback loop.

We also now permit multiple page_index parameters per call (previously
zram would recognize only one page_index) and a mix or single pages and
page ranges:

  echo page_index=42 page_index=99 page_indexes=100-200 \
       page_indexes=500-700 > zram0/writeback

Apart from that the patch also unifies parameters passing and resembles
other "modern" zram device attributes (e.g. recompression), while the
old interface used a mixed scheme: values-less parameters for mode and
a key=value format for page_index.  We still support the "old" value-less
format for compatibility reasons.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 Documentation/admin-guide/blockdev/zram.rst |  17 ++
 drivers/block/zram/zram_drv.c               | 320 +++++++++++++-------
 2 files changed, 232 insertions(+), 105 deletions(-)

diff --git a/Documentation/admin-guide/blockdev/zram.rst b/Documentation/admin-guide/blockdev/zram.rst
index 9bdb30901a93..b8d36134a151 100644
--- a/Documentation/admin-guide/blockdev/zram.rst
+++ b/Documentation/admin-guide/blockdev/zram.rst
@@ -369,6 +369,23 @@ they could write a page index into the interface::
 
 	echo "page_index=1251" > /sys/block/zramX/writeback
 
+In Linux 6.16 this interface underwent some rework.  First, the interface
+now supports `key=value` format for all of its parameters (`type=huge_idle`,
+etc.)  Second, the support for `page_indexes` was introduced, which specify
+`LOW-HIGH` range (or ranges) of pages to be written-back.  This reduces the
+number of syscalls, but more importantly this enables optimal post-processing
+target selection strategy. Usage example::
+
+	echo "type=idle" > /sys/block/zramX/writeback
+	echo "page_indexes=1-100 page_indexes=200-300" > \
+		/sys/block/zramX/writeback
+
+We also now permit multiple page_index params per call and a mix of
+single pages and page ranges::
+
+	echo page_index=42 page_index=99 page_indexes=100-200 \
+		page_indexes=500-700 > /sys/block/zramX/writeback
+
 If there are lots of write IO with flash device, potentially, it has
 flash wearout problem so that admin needs to design write limitation
 to guarantee storage health for entire product life.
diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index fda7d8624889..9e8ed1bf308b 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -734,114 +734,19 @@ static void read_from_bdev_async(struct zram *zram, struct page *page,
 	submit_bio(bio);
 }
 
-#define PAGE_WB_SIG "page_index="
-
-#define PAGE_WRITEBACK			0
-#define HUGE_WRITEBACK			(1<<0)
-#define IDLE_WRITEBACK			(1<<1)
-#define INCOMPRESSIBLE_WRITEBACK	(1<<2)
-
-static int scan_slots_for_writeback(struct zram *zram, u32 mode,
-				    unsigned long nr_pages,
-				    unsigned long index,
-				    struct zram_pp_ctl *ctl)
+static int zram_writeback_slots(struct zram *zram, struct zram_pp_ctl *ctl)
 {
-	for (; nr_pages != 0; index++, nr_pages--) {
-		bool ok = true;
-
-		zram_slot_lock(zram, index);
-		if (!zram_allocated(zram, index))
-			goto next;
-
-		if (zram_test_flag(zram, index, ZRAM_WB) ||
-		    zram_test_flag(zram, index, ZRAM_SAME))
-			goto next;
-
-		if (mode & IDLE_WRITEBACK &&
-		    !zram_test_flag(zram, index, ZRAM_IDLE))
-			goto next;
-		if (mode & HUGE_WRITEBACK &&
-		    !zram_test_flag(zram, index, ZRAM_HUGE))
-			goto next;
-		if (mode & INCOMPRESSIBLE_WRITEBACK &&
-		    !zram_test_flag(zram, index, ZRAM_INCOMPRESSIBLE))
-			goto next;
-
-		ok = place_pp_slot(zram, ctl, index);
-next:
-		zram_slot_unlock(zram, index);
-		if (!ok)
-			break;
-	}
-
-	return 0;
-}
-
-static ssize_t writeback_store(struct device *dev,
-		struct device_attribute *attr, const char *buf, size_t len)
-{
-	struct zram *zram = dev_to_zram(dev);
-	unsigned long nr_pages = zram->disksize >> PAGE_SHIFT;
-	struct zram_pp_ctl *ctl = NULL;
+	unsigned long blk_idx = 0;
+	struct page *page = NULL;
 	struct zram_pp_slot *pps;
-	unsigned long index = 0;
-	struct bio bio;
 	struct bio_vec bio_vec;
-	struct page *page = NULL;
-	ssize_t ret = len;
-	int mode, err;
-	unsigned long blk_idx = 0;
-
-	if (sysfs_streq(buf, "idle"))
-		mode = IDLE_WRITEBACK;
-	else if (sysfs_streq(buf, "huge"))
-		mode = HUGE_WRITEBACK;
-	else if (sysfs_streq(buf, "huge_idle"))
-		mode = IDLE_WRITEBACK | HUGE_WRITEBACK;
-	else if (sysfs_streq(buf, "incompressible"))
-		mode = INCOMPRESSIBLE_WRITEBACK;
-	else {
-		if (strncmp(buf, PAGE_WB_SIG, sizeof(PAGE_WB_SIG) - 1))
-			return -EINVAL;
-
-		if (kstrtol(buf + sizeof(PAGE_WB_SIG) - 1, 10, &index) ||
-				index >= nr_pages)
-			return -EINVAL;
-
-		nr_pages = 1;
-		mode = PAGE_WRITEBACK;
-	}
-
-	down_read(&zram->init_lock);
-	if (!init_done(zram)) {
-		ret = -EINVAL;
-		goto release_init_lock;
-	}
-
-	/* Do not permit concurrent post-processing actions. */
-	if (atomic_xchg(&zram->pp_in_progress, 1)) {
-		up_read(&zram->init_lock);
-		return -EAGAIN;
-	}
-
-	if (!zram->backing_dev) {
-		ret = -ENODEV;
-		goto release_init_lock;
-	}
+	struct bio bio;
+	int ret, err;
+	u32 index;
 
 	page = alloc_page(GFP_KERNEL);
-	if (!page) {
-		ret = -ENOMEM;
-		goto release_init_lock;
-	}
-
-	ctl = init_pp_ctl();
-	if (!ctl) {
-		ret = -ENOMEM;
-		goto release_init_lock;
-	}
-
-	scan_slots_for_writeback(zram, mode, nr_pages, index, ctl);
+	if (!page)
+		return -ENOMEM;
 
 	while ((pps = select_pp_slot(ctl))) {
 		spin_lock(&zram->wb_limit_lock);
@@ -929,10 +834,215 @@ static ssize_t writeback_store(struct device *dev,
 
 	if (blk_idx)
 		free_block_bdev(zram, blk_idx);
-
-release_init_lock:
 	if (page)
 		__free_page(page);
+
+	return ret;
+}
+
+#define PAGE_WRITEBACK			0
+#define HUGE_WRITEBACK			(1 << 0)
+#define IDLE_WRITEBACK			(1 << 1)
+#define INCOMPRESSIBLE_WRITEBACK	(1 << 2)
+
+static int parse_page_index(char *val, unsigned long nr_pages,
+			    unsigned long *lo, unsigned long *hi)
+{
+	int ret;
+
+	ret = kstrtoul(val, 10, lo);
+	if (ret)
+		return ret;
+	*hi = *lo + 1;
+	if (*lo >= nr_pages || *hi > nr_pages)
+		return -ERANGE;
+	return 0;
+}
+
+static int parse_page_indexes(char *val, unsigned long nr_pages,
+			      unsigned long *lo, unsigned long *hi)
+{
+	char *delim;
+	int ret;
+
+	delim = strchr(val, '-');
+	if (!delim)
+		return -EINVAL;
+
+	*delim = 0x00;
+	ret = kstrtoul(val, 10, lo);
+	if (ret)
+		return ret;
+	if (*lo >= nr_pages)
+		return -ERANGE;
+
+	ret = kstrtoul(delim + 1, 10, hi);
+	if (ret)
+		return ret;
+	if (*hi >= nr_pages || *lo > *hi)
+		return -ERANGE;
+	*hi += 1;
+	return 0;
+}
+
+static int parse_mode(char *val, u32 *mode)
+{
+	*mode = 0;
+
+	if (!strcmp(val, "idle"))
+		*mode = IDLE_WRITEBACK;
+	if (!strcmp(val, "huge"))
+		*mode = HUGE_WRITEBACK;
+	if (!strcmp(val, "huge_idle"))
+		*mode = IDLE_WRITEBACK | HUGE_WRITEBACK;
+	if (!strcmp(val, "incompressible"))
+		*mode = INCOMPRESSIBLE_WRITEBACK;
+
+	if (*mode == 0)
+		return -EINVAL;
+	return 0;
+}
+
+static int scan_slots_for_writeback(struct zram *zram, u32 mode,
+				    unsigned long lo, unsigned long hi,
+				    struct zram_pp_ctl *ctl)
+{
+	u32 index = lo;
+
+	while (index < hi) {
+		bool ok = true;
+
+		zram_slot_lock(zram, index);
+		if (!zram_allocated(zram, index))
+			goto next;
+
+		if (zram_test_flag(zram, index, ZRAM_WB) ||
+		    zram_test_flag(zram, index, ZRAM_SAME))
+			goto next;
+
+		if (mode & IDLE_WRITEBACK &&
+		    !zram_test_flag(zram, index, ZRAM_IDLE))
+			goto next;
+		if (mode & HUGE_WRITEBACK &&
+		    !zram_test_flag(zram, index, ZRAM_HUGE))
+			goto next;
+		if (mode & INCOMPRESSIBLE_WRITEBACK &&
+		    !zram_test_flag(zram, index, ZRAM_INCOMPRESSIBLE))
+			goto next;
+
+		ok = place_pp_slot(zram, ctl, index);
+next:
+		zram_slot_unlock(zram, index);
+		if (!ok)
+			break;
+		index++;
+	}
+
+	return 0;
+}
+
+static ssize_t writeback_store(struct device *dev,
+			       struct device_attribute *attr,
+			       const char *buf, size_t len)
+{
+	struct zram *zram = dev_to_zram(dev);
+	u64 nr_pages = zram->disksize >> PAGE_SHIFT;
+	unsigned long lo = 0, hi = nr_pages;
+	struct zram_pp_ctl *ctl = NULL;
+	char *args, *param, *val;
+	ssize_t ret = len;
+	int err, mode = 0;
+
+	down_read(&zram->init_lock);
+	if (!init_done(zram)) {
+		up_read(&zram->init_lock);
+		return -EINVAL;
+	}
+
+	/* Do not permit concurrent post-processing actions. */
+	if (atomic_xchg(&zram->pp_in_progress, 1)) {
+		up_read(&zram->init_lock);
+		return -EAGAIN;
+	}
+
+	if (!zram->backing_dev) {
+		ret = -ENODEV;
+		goto release_init_lock;
+	}
+
+	ctl = init_pp_ctl();
+	if (!ctl) {
+		ret = -ENOMEM;
+		goto release_init_lock;
+	}
+
+	args = skip_spaces(buf);
+	while (*args) {
+		args = next_arg(args, &param, &val);
+
+		/*
+		 * Workaround to support the old writeback interface.
+		 *
+		 * The old writeback interface has a minor inconsistency and
+		 * requires key=value only for page_index parameter, while the
+		 * writeback mode is a valueless parameter.
+		 *
+		 * This is not the case anymore and now all parameters are
+		 * required to have values, however, we need to support the
+		 * legacy writeback interface format so we check if we can
+		 * recognize a valueless parameter as the (legacy) writeback
+		 * mode.
+		 */
+		if (!val || !*val) {
+			err = parse_mode(param, &mode);
+			if (err) {
+				ret = err;
+				goto release_init_lock;
+			}
+
+			scan_slots_for_writeback(zram, mode, lo, hi, ctl);
+			break;
+		}
+
+		if (!strcmp(param, "type")) {
+			err = parse_mode(val, &mode);
+			if (err) {
+				ret = err;
+				goto release_init_lock;
+			}
+
+			scan_slots_for_writeback(zram, mode, lo, hi, ctl);
+			break;
+		}
+
+		if (!strcmp(param, "page_index")) {
+			err = parse_page_index(val, nr_pages, &lo, &hi);
+			if (err) {
+				ret = err;
+				goto release_init_lock;
+			}
+
+			scan_slots_for_writeback(zram, mode, lo, hi, ctl);
+			continue;
+		}
+
+		if (!strcmp(param, "page_indexes")) {
+			err = parse_page_indexes(val, nr_pages, &lo, &hi);
+			if (err) {
+				ret = err;
+				goto release_init_lock;
+			}
+
+			scan_slots_for_writeback(zram, mode, lo, hi, ctl);
+			continue;
+		}
+	}
+
+	err = zram_writeback_slots(zram, ctl);
+	if (err)
+		ret = err;
+
+release_init_lock:
 	release_pp_ctl(zram, ctl);
 	atomic_set(&zram->pp_in_progress, 0);
 	up_read(&zram->init_lock);
-- 
2.49.0.395.g12beb8f557-goog

