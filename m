Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A86C2AD14
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 06:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749451500; cv=none; b=ZsqcCmFJbDyJjJ0LoL42LZIXJ+yPMNwARQ+SzcS7ZyqOZNxvmgNP4PgmBwu8BXhVQODN0dMIkgvp+pHQU87tUBNbBWHr2fBXBfrZjZHKCApCR/a5RwM9VPkwLWSMftxTNJo/1GHpQ/hIt7F+pUPwF1bfaPQ2kvB04sHSvrid35E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749451500; c=relaxed/simple;
	bh=wE2j26rQsWzCV/CI9aX5cBigniSM7EhhkFPbJ9xwQe4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TnM3AbDVK6SklyjbONxlrGX1KhNDl/nFIvhWv37eHYOsa5ksPaXsIsvXH7SkzqC0ASgDmJk7yysdGrChU3TTPVCAPx/Hzc4ghc33znYSmUfw3Ue1/Rf6TXTgfoqdY0oRLMz/hVv2gjt1o7eIOH+W4NfJdrINyLmx5DRM7xpsE0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=afp0TTIs; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="afp0TTIs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Nt
	vTdpGq4cK/AGPSUfzlsigYkbELU/HQBy1Zz8L3loY=; b=afp0TTIsYo/kz/OwpR
	bg4Ie2kGRk40jWlHDiARVLTDFc6EqGxLEc6kk6hE+z88S/rmpZDm1e4JHDCzwYxq
	+KkDW83S2OBGdoZlVFheH3wqmFcOux50xI0nvoWv7cV3+ad78pBcR+e6dIxMljx/
	Et3MBwZCG59oYK4+FYebo62NQ=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wDnV8S5gkZo60cLHQ--.18568S4;
	Mon, 09 Jun 2025 14:44:17 +0800 (CST)
From: David Wang <00107082@163.com>
To: surenb@google.com
Cc: tim.c.chen@linux.intel.com,
	kent.overstreet@linux.dev,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	David Wang <00107082@163.com>
Subject: [PATCH v3 2/2] alloc_tag: keep codetag iterator active between read()
Date: Mon,  9 Jun 2025 14:44:08 +0800
Message-Id: <20250609064408.112783-1-00107082@163.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <CAJuCfpE670s5=QAbuqCLB3XuOkfL=L44r93cwJdrhHn=bYNd-Q@mail.gmail.com>
References: <CAJuCfpE670s5=QAbuqCLB3XuOkfL=L44r93cwJdrhHn=bYNd-Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnV8S5gkZo60cLHQ--.18568S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxGFWUWw1UXF18ZrWDXF47Jwb_yoWruw1fpa
	13ua4YkF4rJr1UuF4rJw4IgFW5tw1kta18XF42qr4SvFn0vrs8uF98Jryj9Fy3AFy8Kan0
	va90k34UJr9rZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0p__-BDUUUUU=
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/1tbiqBpnqmhGgbUsJgAAsv

When reading /proc/allocinfo, for each read syscall, seq_file would
invoke start/stop callbacks. In start callback, a memory is alloced
to store iterator and the iterator would start from beginning to
walk linearly to current read position.

seq_file read() takes at most 4096 bytes, even if read with a larger
user space buffer, meaning read out all of /proc/allocinfo, tens of read
syscalls are needed. For example, a 306036 bytes allocinfo files need
76 reads:

 $ sudo cat /proc/allocinfo  | wc
    3964   16678  306036
 $ sudo strace -T -e read cat /proc/allocinfo
 ...
 read(3, "        4096        1 arch/x86/k"..., 131072) = 4063 <0.000062>
 ...
 read(3, "           0        0 sound/core"..., 131072) = 4021 <0.000150>
 ...
For those n=3964 lines, each read takes about m=3964/76=52 lines,
since iterator restart from beginning for each read(),
it would move forward
   m  steps on 1st read
 2*m  steps on 2nd read
 3*m  steps on 3rd read
 ...
   n  steps on last read
As read() along, those linear seek steps make read() calls slower and
slower.  Adding those up, codetag iterator moves about O(n*n/m) steps,
making data structure traversal take significant part of the whole reading.
Profiling when stress reading /proc/allocinfo confirms it:

 vfs_read(99.959% 1677299/1677995)
     proc_reg_read_iter(99.856% 1674881/1677299)
         seq_read_iter(99.959% 1674191/1674881)
             allocinfo_start(75.664% 1266755/1674191)
                 codetag_next_ct(79.217% 1003487/1266755)  <---
                 srso_return_thunk(1.264% 16011/1266755)
                 __kmalloc_cache_noprof(0.102% 1296/1266755)
                 ...
             allocinfo_show(21.287% 356378/1674191)
             allocinfo_next(1.530% 25621/1674191)
codetag_next_ct() takes major part.

A private data alloced at open() time can be used to carry iterator
alive across read() calls, and avoid the memory allocation and
iterator reset for each read(). This way, only O(1) memory allocation
and O(n) steps iterating, and `time` shows performance improvement
from ~7ms to ~4ms.
Profiling with the change:

 vfs_read(99.865% 1581073/1583214)
     proc_reg_read_iter(99.485% 1572934/1581073)
         seq_read_iter(99.846% 1570519/1572934)
             allocinfo_show(87.428% 1373074/1570519)
                 seq_buf_printf(83.695% 1149196/1373074)
                 seq_buf_putc(1.917% 26321/1373074)
                 _find_next_bit(1.531% 21023/1373074)
                 ...
                 codetag_to_text(0.490% 6727/1373074)
                 ...
             allocinfo_next(6.275% 98543/1570519)
             ...
             allocinfo_start(0.369% 5790/1570519)
             ...
Now seq_buf_printf() takes major part.

Signed-off-by: David Wang <00107082@163.com>
---
Changes since v2:
Rebase to 6.16-rc1, resolve conflicts.
---
 lib/alloc_tag.c | 29 ++++++++++-------------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
index d48b80f3f007..ac7e50b41b6a 100644
--- a/lib/alloc_tag.c
+++ b/lib/alloc_tag.c
@@ -45,21 +45,16 @@ struct allocinfo_private {
 static void *allocinfo_start(struct seq_file *m, loff_t *pos)
 {
 	struct allocinfo_private *priv;
-	struct codetag *ct;
 	loff_t node = *pos;
 
-	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
-	m->private = priv;
-	if (!priv)
-		return NULL;
-
-	priv->print_header = (node == 0);
+	priv = (struct allocinfo_private *)m->private;
 	codetag_lock_module_list(alloc_tag_cttype, true);
-	priv->iter = codetag_get_ct_iter(alloc_tag_cttype);
-	while ((ct = codetag_next_ct(&priv->iter)) != NULL && node)
-		node--;
-
-	return ct ? priv : NULL;
+	if (node == 0) {
+		priv->print_header = true;
+		priv->iter = codetag_get_ct_iter(alloc_tag_cttype);
+		codetag_next_ct(&priv->iter);
+	}
+	return priv->iter.ct ? priv : NULL;
 }
 
 static void *allocinfo_next(struct seq_file *m, void *arg, loff_t *pos)
@@ -76,12 +71,7 @@ static void *allocinfo_next(struct seq_file *m, void *arg, loff_t *pos)
 
 static void allocinfo_stop(struct seq_file *m, void *arg)
 {
-	struct allocinfo_private *priv = (struct allocinfo_private *)m->private;
-
-	if (priv) {
-		codetag_lock_module_list(alloc_tag_cttype, false);
-		kfree(priv);
-	}
+	codetag_lock_module_list(alloc_tag_cttype, false);
 }
 
 static void print_allocinfo_header(struct seq_buf *buf)
@@ -811,7 +801,8 @@ static int __init alloc_tag_init(void)
 		return 0;
 	}
 
-	if (!proc_create_seq(ALLOCINFO_FILE_NAME, 0400, NULL, &allocinfo_seq_op)) {
+	if (!proc_create_seq_private(ALLOCINFO_FILE_NAME, 0400, NULL, &allocinfo_seq_op,
+				     sizeof(struct allocinfo_private), NULL)) {
 		pr_err("Failed to create %s file\n", ALLOCINFO_FILE_NAME);
 		shutdown_mem_profiling(false);
 		return -ENOMEM;
-- 
2.39.2

