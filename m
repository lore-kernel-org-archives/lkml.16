Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6230B1C1F0F
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 11:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738235495; cv=none; b=KLq1fmez2QBYAY8P9VSfPvfDhj12gvHW047JxOlg+LFZ5v+6r+RtzJTdvOyRw1RY+CHjnm81yp1WX/jBc5O4glO9bAS78raysZhw0MEqIEKkAqLjxPeiwzJUmd9v6GQ3uwmAReK1+fJneLUaUyLxAFAXggUOqQdzJS8QP/3BizU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738235495; c=relaxed/simple;
	bh=d/TyFBuIGsVcz9XqaXtscP8eB4S/GZoaiYxC9PgMSIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oM61mrDmGbX+vZENzZaKrVVTsAqW00cosK8CE/ILP8s6XvQfL27QgR14my9fnLjJlRxbp9AVeRpAvhYkowNikT6HMRj3mzrnryVwK88xv45D+B1lWHLsyfQKpjyLYXZUZNuoqk1Y89ca8oAOteUmSvkc0h4jvWAEwphWpDmdJ2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fnbX7KhE; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fnbX7KhE"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2166651f752so15132515ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 03:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738235492; x=1738840292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q/yW7cYsxX6u2D6RjpsktMUNNjtmh2H6QDs8XtL+Hec=;
        b=fnbX7KhEzlQZ+uw3gETanTxuX+LEn64BuXwI1Z3IIO4EoAb1CIZgHj7u0Vrdq6gq39
         RBpMkbj5weIGqaHxG0FhAO+PCvF4fbrad1wt/2rKiK4U7x1mbZ53v8hV8S+qv49f2ggY
         2248lYvyme0jhlag+RDgxFUHOfu5y62nK86oE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738235492; x=1738840292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q/yW7cYsxX6u2D6RjpsktMUNNjtmh2H6QDs8XtL+Hec=;
        b=iFmtfytOxus1A5E3k+a1U/x0M7IWqCTk6x0d/uZBbJebJFBnAYbx2GIxyXyNoGIyKg
         giFw3W+ZqrwpGbDSMYpu/c91NnKWYboxEsHhdb75kHFSXLNT8lNm4Fsqct3JpHPfpMFT
         YEPgPw4B/2Uf6Sf+LRwJLLpjJSoMYZPDrO56hbVUtarFvu6BdOBoEM+38zbx/lYZfkGB
         QfGtLVYTcicGQ1c2xe3yPhXIWU7UvohbQkbuSVYgnwEP/kzzBl2Gb/7NaPw1pYaUHRUT
         mxunqoWtj8dx9xwpjTDATkhpGRP8AVWzWQyZVtYfjvr+PQtIgtt1I8J9kMezMZHr2E1u
         9zow==
X-Forwarded-Encrypted: i=1; AJvYcCXSvpU58ShzLHcnW/rczE0F09CKe9WXtFOMR5Ql+/pAbtYXKLnVYekgPlTSA4hXDQgLCyKC0lyhpeGmhnM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXSbl+RoYjECW/y3x3NDcTc0Bp94TcEDzH1uGOSpGCNG01ygO5
	gVzIsH9I8HHfF10Ta0UEDM9Ulii6mHMpFr7FYSA/ou4+RRrDRDV6p7+Tz28wEu2a6ZWZgENVhVA
	=
X-Gm-Gg: ASbGncuT+XtptxdIc7fLVl5lWFoX4CzcJCTKIqfDn4hE0N+GoigXYi0J74UTqvu3Jg0
	IHqPc+8Ewe47Twp+iV47h8PwUGICGdJQtj08hRY1esapRxw0JZEbbIyeBPB7jV0e0OXFDm7Jd/1
	UjT5eZKXrVm5GyRcnGOMdEadMgsiLdeDg5fi4JW7amOZqcpAlwnzCQRKWNCujVfOFx0XYSF2ZNq
	c93QWhSBfcdYtF2TFZDXKNIAM5IiS3N/0x6voFIK9Yg7ItkDkEeBaMz7cE/hVpc0fVlYeyaoMdr
	6Fm/cmBpSi/YJbXt
X-Google-Smtp-Source: AGHT+IHRhQXy77fDs2DUj5z16q9LiSjBM8lSRxMlB0gLWnyP7Ox6pdNXNxWqKncG1n2YwlehavUUvA==
X-Received: by 2002:a17:902:d485:b0:216:4853:4c0b with SMTP id d9443c01a7336-21dd7deef0bmr99162575ad.33.1738235492597;
        Thu, 30 Jan 2025 03:11:32 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:d4ce:e744:f46b:4fb])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-21de3302e63sm11331925ad.172.2025.01.30.03.11.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 03:11:32 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Minchan Kim <minchan@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv3 04/11] zram: remove max_comp_streams device attr
Date: Thu, 30 Jan 2025 20:10:49 +0900
Message-ID: <20250130111105.2861324-5-senozhatsky@chromium.org>
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

max_comp_streams device attribute has been defunct since
May 2016 when zram switched to per-CPU compression streams,
remove it.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 Documentation/ABI/testing/sysfs-block-zram  |  8 -----
 Documentation/admin-guide/blockdev/zram.rst | 36 ++++++---------------
 drivers/block/zram/zram_drv.c               | 23 -------------
 3 files changed, 10 insertions(+), 57 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-block-zram b/Documentation/ABI/testing/sysfs-block-zram
index 1ef69e0271f9..36c57de0a10a 100644
--- a/Documentation/ABI/testing/sysfs-block-zram
+++ b/Documentation/ABI/testing/sysfs-block-zram
@@ -22,14 +22,6 @@ Description:
 		device. The reset operation frees all the memory associated
 		with this device.
 
-What:		/sys/block/zram<id>/max_comp_streams
-Date:		February 2014
-Contact:	Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
-Description:
-		The max_comp_streams file is read-write and specifies the
-		number of backend's zcomp_strm compression streams (number of
-		concurrent compress operations).
-
 What:		/sys/block/zram<id>/comp_algorithm
 Date:		February 2014
 Contact:	Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
diff --git a/Documentation/admin-guide/blockdev/zram.rst b/Documentation/admin-guide/blockdev/zram.rst
index 1576fb93f06c..9bdb30901a93 100644
--- a/Documentation/admin-guide/blockdev/zram.rst
+++ b/Documentation/admin-guide/blockdev/zram.rst
@@ -54,7 +54,7 @@ The list of possible return codes:
 If you use 'echo', the returned value is set by the 'echo' utility,
 and, in general case, something like::
 
-	echo 3 > /sys/block/zram0/max_comp_streams
+	echo foo > /sys/block/zram0/comp_algorithm
 	if [ $? -ne 0 ]; then
 		handle_error
 	fi
@@ -73,21 +73,7 @@ This creates 4 devices: /dev/zram{0,1,2,3}
 num_devices parameter is optional and tells zram how many devices should be
 pre-created. Default: 1.
 
-2) Set max number of compression streams
-========================================
-
-Regardless of the value passed to this attribute, ZRAM will always
-allocate multiple compression streams - one per online CPU - thus
-allowing several concurrent compression operations. The number of
-allocated compression streams goes down when some of the CPUs
-become offline. There is no single-compression-stream mode anymore,
-unless you are running a UP system or have only 1 CPU online.
-
-To find out how many streams are currently available::
-
-	cat /sys/block/zram0/max_comp_streams
-
-3) Select compression algorithm
+2) Select compression algorithm
 ===============================
 
 Using comp_algorithm device attribute one can see available and
@@ -107,7 +93,7 @@ Examples::
 For the time being, the `comp_algorithm` content shows only compression
 algorithms that are supported by zram.
 
-4) Set compression algorithm parameters: Optional
+3) Set compression algorithm parameters: Optional
 =================================================
 
 Compression algorithms may support specific parameters which can be
@@ -138,7 +124,7 @@ better the compression ratio, it even can take negatives values for some
 algorithms), for other algorithms `level` is acceleration level (the higher
 the value the lower the compression ratio).
 
-5) Set Disksize
+4) Set Disksize
 ===============
 
 Set disk size by writing the value to sysfs node 'disksize'.
@@ -158,7 +144,7 @@ There is little point creating a zram of greater than twice the size of memory
 since we expect a 2:1 compression ratio. Note that zram uses about 0.1% of the
 size of the disk when not in use so a huge zram is wasteful.
 
-6) Set memory limit: Optional
+5) Set memory limit: Optional
 =============================
 
 Set memory limit by writing the value to sysfs node 'mem_limit'.
@@ -177,7 +163,7 @@ Examples::
 	# To disable memory limit
 	echo 0 > /sys/block/zram0/mem_limit
 
-7) Activate
+6) Activate
 ===========
 
 ::
@@ -188,7 +174,7 @@ Examples::
 	mkfs.ext4 /dev/zram1
 	mount /dev/zram1 /tmp
 
-8) Add/remove zram devices
+7) Add/remove zram devices
 ==========================
 
 zram provides a control interface, which enables dynamic (on-demand) device
@@ -208,7 +194,7 @@ execute::
 
 	echo X > /sys/class/zram-control/hot_remove
 
-9) Stats
+8) Stats
 ========
 
 Per-device statistics are exported as various nodes under /sys/block/zram<id>/
@@ -228,8 +214,6 @@ mem_limit         	WO	specifies the maximum amount of memory ZRAM can
 writeback_limit   	WO	specifies the maximum amount of write IO zram
 				can write out to backing device as 4KB unit
 writeback_limit_enable  RW	show and set writeback_limit feature
-max_comp_streams  	RW	the number of possible concurrent compress
-				operations
 comp_algorithm    	RW	show and change the compression algorithm
 algorithm_params	WO	setup compression algorithm parameters
 compact           	WO	trigger memory compaction
@@ -310,7 +294,7 @@ a single line of text and contains the following stats separated by whitespace:
 		Unit: 4K bytes
  ============== =============================================================
 
-10) Deactivate
+9) Deactivate
 ==============
 
 ::
@@ -318,7 +302,7 @@ a single line of text and contains the following stats separated by whitespace:
 	swapoff /dev/zram0
 	umount /dev/zram1
 
-11) Reset
+10) Reset
 =========
 
 	Write any positive value to 'reset' sysfs node::
diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index 31b653ad6d0e..0c9b68fa8783 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -1096,27 +1096,6 @@ static void zram_debugfs_register(struct zram *zram) {};
 static void zram_debugfs_unregister(struct zram *zram) {};
 #endif
 
-/*
- * We switched to per-cpu streams and this attr is not needed anymore.
- * However, we will keep it around for some time, because:
- * a) we may revert per-cpu streams in the future
- * b) it's visible to user space and we need to follow our 2 years
- *    retirement rule; but we already have a number of 'soon to be
- *    altered' attrs, so max_comp_streams need to wait for the next
- *    layoff cycle.
- */
-static ssize_t max_comp_streams_show(struct device *dev,
-		struct device_attribute *attr, char *buf)
-{
-	return scnprintf(buf, PAGE_SIZE, "%d\n", num_online_cpus());
-}
-
-static ssize_t max_comp_streams_store(struct device *dev,
-		struct device_attribute *attr, const char *buf, size_t len)
-{
-	return len;
-}
-
 static void comp_algorithm_set(struct zram *zram, u32 prio, const char *alg)
 {
 	/* Do not free statically defined compression algorithms */
@@ -2535,7 +2514,6 @@ static DEVICE_ATTR_WO(reset);
 static DEVICE_ATTR_WO(mem_limit);
 static DEVICE_ATTR_WO(mem_used_max);
 static DEVICE_ATTR_WO(idle);
-static DEVICE_ATTR_RW(max_comp_streams);
 static DEVICE_ATTR_RW(comp_algorithm);
 #ifdef CONFIG_ZRAM_WRITEBACK
 static DEVICE_ATTR_RW(backing_dev);
@@ -2557,7 +2535,6 @@ static struct attribute *zram_disk_attrs[] = {
 	&dev_attr_mem_limit.attr,
 	&dev_attr_mem_used_max.attr,
 	&dev_attr_idle.attr,
-	&dev_attr_max_comp_streams.attr,
 	&dev_attr_comp_algorithm.attr,
 #ifdef CONFIG_ZRAM_WRITEBACK
 	&dev_attr_backing_dev.attr,
-- 
2.48.1.262.g85cc9f2d1e-goog

