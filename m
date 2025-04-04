Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11CC2E62B6
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 01:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743731619; cv=none; b=Nq7J8nDEK83C1jSZjwSUg2C/J6FttDSGvgOuzgdRBo7sCBLzfYlW6EEQ2Z3fpN1/jMK9t/t37V5NkbKcz2D4BS5VsKNqKt2GhnxjXeoDCRbaxE5cOvMz1DRJ5HyZTqWIT8enX9a/XhkqKZHxsZow4jpI4225+Xz+gvcu1oXO1QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743731619; c=relaxed/simple;
	bh=2XJMwVH+bzZX+qTJ7CsLEgU3ZD0I6qYVWo0irxmI8tM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r+m1yE8OKArx0vTTsrl58d82nUmaNlEWiOCHdlh3FOl8sVRmlCgEu/ZkJ9rnjiO3xVEzGnLAQmgd9gwkVhNh/z4bu0kCvVlHCeDPXHGTN0We78sfddf+jBDwICkummMHGNZrhLOq4a3mmg5veM9tKlHV1hX1rsGeANXW/StwpUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ChgpqEkG; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ChgpqEkG"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-ae727e87c26so1072861a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 18:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743731617; x=1744336417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gM9kShgBu7oU/9938AdNtYg0Hc0LzHaF/do+TxaeXG0=;
        b=ChgpqEkGH7Vsw9NSPIOvvJux9EV0Rk0S1q5yGJ75waFugeMQqruU7w0yKjS0Y2ZVz4
         PY4/pnFSLpXN94Ux4583Aqyj8QHK0sW4Ht+QJDRCA0hbsCXlyfvunbvRpR/k2WEdI5Cv
         Du8k+PNB1/MAppODjrhnleaPiYowdYsFeQuVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743731617; x=1744336417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gM9kShgBu7oU/9938AdNtYg0Hc0LzHaF/do+TxaeXG0=;
        b=T+1KgcJ0rPkbTbkD/o2yWSegosyG43RmiBwWb8ECOan2aob+q+8Amk3MyJpxuOXgmp
         8OTEHbjAtoLUHNarb2w6YDrxV02612hyVi9SirGY+5Pu3U9mtX7DdB70VP54AkivWHBd
         +oAbtmK+dpjm4vleJYCrWfkU6Ng6IdLAfM/nbxSB97xWJB+sevr2zcAEcaOOzjY9utMv
         vGu8vJvk/VH0L6z9Tfm3KDszo/6tzf3Fvn/sEvLRiDSW9wD1PdvNXa415gX0cT0cv2ue
         PFMsAttQchhgetTBVXEh2939vaCemFqpYx1pySgSWKzmrzfMP0dCEKgMOR3BemSA7RvC
         K3pg==
X-Forwarded-Encrypted: i=1; AJvYcCU81unFBCbUNRH6doteMmS6b1P0Lr+E4ef7np8tahacMud6m5CPUWEG6squDiCdgkLjxXWyjoG839H9+MM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy87FDWbgLzGCClKF6pU1baF5BX0CrlOQskWF1b+X2cObp7csA8
	n0avViN/A0K2GId3bXtSzY3JiOOuv9daAlMKn2gcObT0Wh0sc+iR7KvUR3hgHA==
X-Gm-Gg: ASbGncviou1oJrEwB9i540VxDpyhvom7mX+Zbr/0RBq2oZnV4fjo1Z/x5cG8H0YMWds
	WWzAM0aYe4k88iCpVlnQL9E7eih2kC7z1hQzX4st97wTm8pNt/kKec6aVOEaw1rR4xgoL6skl0f
	9GAacTxPTNPFv4Dc1e+dfiWZeY2IFvjIBZcw7nJMgNtlhsW0ObMxuxA5+QGMEgBh1sZ23bEECgf
	q9+VuAMa0WJp+5RZRhsRsjjWQNNi+D6tWA9q+wjvAhsdyvTIJfPZwuVRKD3aJ1k8DM3pmgR8Sqi
	M9gulNr2XSQZzFo7DYwFqwhKX5djHbBtbFIIdHcMDyhuw60aS4BGUz9qVs4cM5taMjD/bBwHx8/
	ZMGlhuw==
X-Google-Smtp-Source: AGHT+IETvstpK4Y1zwFz11kkxHnvLH3pWQioWI270XZOkkrbcyGa1kVVwkz3bSnSxa9cdPtRysoR5Q==
X-Received: by 2002:a17:90b:5347:b0:301:9f62:a944 with SMTP id 98e67ed59e1d1-306a4b85973mr2317658a91.33.1743731616963;
        Thu, 03 Apr 2025 18:53:36 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:addc:e770:41f7:fb85])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785c0127sm21552005ad.91.2025.04.03.18.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 18:53:36 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Richard Chang <richardycc@google.com>,
	Brian Geffon <bgeffon@google.com>,
	Minchan Kim <minchan@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv3] zram: modernize writeback interface
Date: Fri,  4 Apr 2025 10:52:50 +0900
Message-ID: <20250404015327.2427684-1-senozhatsky@chromium.org>
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

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Reviewed-by: Brian Geffon <bgeffon@google.com>
---

v3: simplified parse_page_index() range checks (Brian)

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
index 0ba18277ed7b..2133488dbfd4 100644
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

