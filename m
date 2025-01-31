Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21469175D53
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 09:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738314443; cv=none; b=lElQ34vEUX3EY1KTtF6aZvDXQJTWrHWARP5ekXkeFCt2c5Ju83xfEtQ6/KsLD+nivKKUEP6kcgeTjLtcaSw1+c2NgngH5cdIV4/fQqp6sFhGzwWayeQ13YDLjml2fMl8x1k0EqyaAOKT2ga7sAEHjweXtD9jfIDHuRp+1wbI9Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738314443; c=relaxed/simple;
	bh=ENMfLDd2Rvn+6if/WlSoG7kHUOF/ByzGPafWP6rI63s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XVGu1jFE/njxZxF3Zn1XvRdavc0YkhXBYkjo/O9R76lYQp5K5wPxN47ZMlZnjGOJi/g37IYAo6rixZUMNz9ov0/+W7fM5XLTDbX0+2XOv2PzrBd4qAzoUheppBqtD4pwAoythnwjG7IZZxygp0RUM/HyACNjUR42bd65iynkGQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cWHKgG/f; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cWHKgG/f"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2ee50ffcf14so4458504a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 01:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738314441; x=1738919241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TXbFDLYuuOhKufVYkqbgI//dvCPqRmfyGlKUIOvD+TU=;
        b=cWHKgG/fvFQKUCIytoAQvlCYsq0HBnArVr/BJHJXGVj2wGrv9/avq71C6tBDlbJzxm
         sin5dcNybHufQU7ajBcZ/rMv6bZaA0XLB92m7wCPanB8BzVIgWEQLF4Ik5/dsx+OBTuz
         DOYiw0mjjs4huDb3aAgdTOXxh4OYPFnAKoj8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738314441; x=1738919241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TXbFDLYuuOhKufVYkqbgI//dvCPqRmfyGlKUIOvD+TU=;
        b=YZouJHKRoS7UqqcdGZd4xESZuQOivoyKyaUy5uwHVUDUYWxKJXi5tre1pn2NOkZ+jk
         C8r2mY2SDvon9DD22+Rei3cV7SSeoRw7xd8VQqOHE6GHkUadaGs/dviRhJQw/AB1AWC7
         sWQO1o0sP6EbQPt7otlM6n2lg7xDNSrBsKTGZgi6vYw/xgLtsURRCkEMkdnMZVU6U5hi
         e/2WjStrXsb9w9SL8YhDSjKoUWFc1KWMZXkI/H2rcNKOSufW3LJNUfb4CeL/s4pymuO5
         qpMGkWSfjsCPf0jUb4DEpKzR/KBVq3IDr5x2r9M+WhrUIjW2ndUdwNHU/bOlFf9REDFf
         8k0A==
X-Forwarded-Encrypted: i=1; AJvYcCUbCOhvMDSiDkOknSv4fJuw1eXdj30uks3ZEYtuESjBxUK/VoDa+Mb34Zc/YwN1NKxdecXoy/KVgyOvrFg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6N0ZMEyY02SFAOHXWHha4RFINyQDr/dnu3MuzeCfDWLTr+G+E
	4bYPXpzApEKEBNvLUxXhfPPw+ORVdwrTNBLTSw+LF93299r2goQunI1pLE4+SQ==
X-Gm-Gg: ASbGncs5Zzv+lNMelMsx25AggLU+9lc0nQ3+hbinYijvt/1U9wYCHxo4TS2UgByg+2n
	8HY7QSyrL0qss94uCsavUurAiofdS8n6TMA/LsGjdy8ZzKlIUYcozzN9l6T65HlQ/YItsKnHG20
	K8fisoEb1WqIqt10jG9T2ukzl4dB3bdnC80RS9WcSMCSxpDoNXnhbCEBcGRARDe6ObznIk1YScR
	lQF0CcLtwSsuJoJwnqsFSlR6wI4Tra/Rr8dUdCzJV7hoyt9r9gfydG+U6OOyRj2OSLdYgVCPG3r
	nPjIYSPEWGKJ34IUtg==
X-Google-Smtp-Source: AGHT+IEKH7u2FXrx6jWcyNcJb/PaxSPMsTyCbU1VktjzxFUwBwz+4J7kQF6itN5PPT+0HWOIKATLLw==
X-Received: by 2002:a17:90b:2dc7:b0:2ee:9229:e4bd with SMTP id 98e67ed59e1d1-2f84633eaeemr10228618a91.2.1738314440902;
        Fri, 31 Jan 2025 01:07:20 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:c752:be9d:3368:16fa])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2f83bccd590sm5442929a91.12.2025.01.31.01.07.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 01:07:20 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Minchan Kim <minchan@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv4 04/17] zram: remove max_comp_streams device attr
Date: Fri, 31 Jan 2025 18:06:03 +0900
Message-ID: <20250131090658.3386285-5-senozhatsky@chromium.org>
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
index 6239fcc340b6..dd987e3942c7 100644
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
@@ -2533,7 +2512,6 @@ static DEVICE_ATTR_WO(reset);
 static DEVICE_ATTR_WO(mem_limit);
 static DEVICE_ATTR_WO(mem_used_max);
 static DEVICE_ATTR_WO(idle);
-static DEVICE_ATTR_RW(max_comp_streams);
 static DEVICE_ATTR_RW(comp_algorithm);
 #ifdef CONFIG_ZRAM_WRITEBACK
 static DEVICE_ATTR_RW(backing_dev);
@@ -2555,7 +2533,6 @@ static struct attribute *zram_disk_attrs[] = {
 	&dev_attr_mem_limit.attr,
 	&dev_attr_mem_used_max.attr,
 	&dev_attr_idle.attr,
-	&dev_attr_max_comp_streams.attr,
 	&dev_attr_comp_algorithm.attr,
 #ifdef CONFIG_ZRAM_WRITEBACK
 	&dev_attr_backing_dev.attr,
-- 
2.48.1.362.g079036d154-goog

