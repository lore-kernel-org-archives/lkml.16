Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340C325DAE3
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 11:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744197984; cv=none; b=dOnDzVj95jTTvWWhE5QYDyrSAklF9mI27UuYiJzzY4HzJICDqVy5q8xZ56pLmya4fDyMwmi8w5JoIB8qBfh2TdWN1DsUOlU2KWdDqoLbS5XHJyXJWrj7ZjpSwh8x8sS9Hrl+B+uTCVY4+da6v2NN/lI54VovnsRTOAyP1wp7bGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744197984; c=relaxed/simple;
	bh=0mn+3NktmcYKm7NKq0yw9rhIy5kuyedvRvMIu5FtCTg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TH/eLRGjRO74f0UOwSJH4xOFDml22kADY5A5+w+jkP0f2FLtBkjVmOXpq/Gy59G0uVJwwTWV5yqcMAHSKBRD3tminM/cPocs1L1I7xApfKjrzUglPAbVFCsjGruM9AwgSzKBOCPsEuUxBcTmVI4DtIUFiXIHGfUAjyMI68HETrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RXXT93gI; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RXXT93gI"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-736c062b1f5so5553569b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 04:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744197981; x=1744802781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8njVRyswJxjtKP2Kc60M9Ee21lx/HZIRc/YI1JehKSo=;
        b=RXXT93gIGZtDwBCSHwy7W+Bo2VWuRR8NfJ8YziiMWwKYZKRJj62c5aePio4djT/yWF
         /2XxD8dGfRhTaXsM6wVX+vmPrQZuD5eA0flJeFppoCbZLO0vjkmy5QxA/ruHAXbJpyq3
         VV33YnOPsnM7Mur3AmfM+FWU9u3t+qaPxuX9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744197981; x=1744802781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8njVRyswJxjtKP2Kc60M9Ee21lx/HZIRc/YI1JehKSo=;
        b=hlfESicYJa43FNXImqdqREOHXdfGXd696UhGV53u4Xlvh4M3nVAD7JAEaVxDhTCj+H
         iPMSLQ5yRy4HQTZu0aQoMTPexwqVb92PUvQX5IlTuuYdaRL4rPobhyFVfMRvLOR6lFdW
         WRf6oYO1WZLfZEM61i/5ahDanOQCbNI3rl8r/W07kTSD2d6NsW4fl5UbCw8xw4tcf/Ty
         JG8hCXUfgq1w3qSJ/gJuo2pgKgy52j8UNQpqTwXS7A5CSEVO75+RKwsXrrFhmjOmIPac
         09hnrT+seu3ry1lJTM7MUQ8uVUwprbR5Jnp4cTH1o+SWAKGfUO9mcSjV8IwJflJVgk8C
         7XIg==
X-Forwarded-Encrypted: i=1; AJvYcCUZZyjc6g+GDPQBu1jz7hJdBl7yQzwu9glEV8ckChLqxIIHUs4cyXW14sYiu7zF/lB4ZetTFSEBvtT892Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFAJ2Fw4LBnAX3CUANVjcQDUZPdLZxZHJ8tRlaVhT6Uhp3i6Y8
	f2OiWdttmSYVCmDKTiZmRpSGU/EvjxuMfReiCYJD7a0yAK/dn37ynw6uXx4x+A==
X-Gm-Gg: ASbGncuUG+Fx3qia+aRjyC2miyltk4t64Qe6wutzYuZLMecT7Z0b3BQliQmUCKrS37O
	6yZFfjkTjfMDRXiRO61I63VcdgL6i7a34VBS8aMWm7pDs3d8UBrqOz5MIULGy6uE7lGNLg5ayK6
	lL9tk524i2/AuxwTUuSDEBM8L3PNPFJl6K6QVtB83rlQh8D3RMPNmMeRJsTOOdX3MqdTsAMDpQd
	TcddCVsRCpJ0UfahrVt2IbGz9DtLLWpkzuByngInBxyyIFtlw1P3ToDsaDw8qOypz/wMnOrra9m
	3dwG3eT8ngpPctlYZYDYJv7TN5wYkZgPjksTnJ4we8Esn6Hqnq7Metme0tpcit1tthw=
X-Google-Smtp-Source: AGHT+IEJFZyVK28vWR0AC+GkqJiC2rDlgDQbL9yrvvipReuj5umGjR3KAq61kLyLEk5yWNA9Wx5dLw==
X-Received: by 2002:a05:6a20:d528:b0:1fd:f4df:96ed with SMTP id adf61e73a8af0-201592af3aemr3446614637.26.1744197981338;
        Wed, 09 Apr 2025 04:26:21 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:eb5e:c849:7471:d0ed])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a11d3180sm966735a12.43.2025.04.09.04.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 04:26:20 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Richard Chang <richardycc@google.com>,
	Brian Geffon <bgeffon@google.com>,
	Minchan Kim <minchan@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv4] zram: modernize writeback interface
Date: Wed,  9 Apr 2025 20:23:48 +0900
Message-ID: <20250409112611.1154282-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
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

Reviewed-by: Brian Geffon <bgeffon@google.com>
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---

v4: fixed uninitialized variable in zram_writeback_slots (Dan)

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
index fda7d8624889..31332155e845 100644
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
+	int ret = 0, err;
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
+	if (*lo >= nr_pages)
+		return -ERANGE;
+	*hi = *lo + 1;
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
2.49.0.504.g3bcea36a83-goog

