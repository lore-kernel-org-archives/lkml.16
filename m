Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D6324685
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 17:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746812415; cv=none; b=V8+2nju6b9tCMs4ILmg8CAv3UwClipbNFpVommVUYO73+q8ahC4xNMvhMjPwVGrTQuSjhBi2DA/U7rg4xPAGfQHkdXE0x8j2vnjBSY+yhlXOoSnJBzOqvqkdZ+qa+SzvnSuiYKQu6bWDKJVw6QuGUdL3CoQRSv9A2fn1aUhr0GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746812415; c=relaxed/simple;
	bh=+qCNOud0fg9OPCPJYle0fLKy/ERft65W3dJCJenBqZY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ovlapERMr0PWdLp8OToUsYRcux1IdmZmzxLZ3emJS1tdqZQ2IqOJXrkPZpLh9bTOkT3ByQYl1NtxWErLqL1kXdYww78l1TLfrPdJQZObdZ2bnIgchyKimyzpmVbUPUpY7aenNuxcRgSK1DirBIwQ7QakGHQeKPwtAtl8zNBN4R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=LNJqiJRQ; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="LNJqiJRQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=07
	i3jvklR0vx9OSADeziqkp40nZ/Zft1yJ0zQrQjUFM=; b=LNJqiJRQZH3S2sw4JD
	4thGkWRXrwU8woLFBVOBkhRxZ+RJxkXyzo5f5NYL6iX9JKNBSb8rJq792inZyFun
	GQUOzpqzhfY/KWq6UQ7lNtDsqWlekjSCcgEodSkGZK7OLHxaPHGKgq6dHzzlaH6E
	XlCRPuQgL/H050gREmN3lc6Tw=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgDHg9HSPR5oUrKHAA--.12846S4;
	Sat, 10 May 2025 01:39:37 +0800 (CST)
From: David Wang <00107082@163.com>
To: surenb@google.com,
	kent.overstreet@linux.dev,
	akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	David Wang <00107082@163.com>
Subject: [PATCH v2 2/2] alloc_tag: keep codetag iterator active between read() calls
Date: Sat, 10 May 2025 01:39:29 +0800
Message-Id: <20250509173929.42508-1-00107082@163.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250507175500.204569-1-00107082@163.com>
References: <20250507175500.204569-1-00107082@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgDHg9HSPR5oUrKHAA--.12846S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxGFWUWw1UXF18ZrWDXF47Jwb_yoWruF17pa
	13ua4YkF4rAr1UCF4rJr4IqFW3t3W8ta18XF42qrWFvFn0vrs8uF98Jryj9Fy3AFy8Ka1a
	va90k34UJr9IvaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0p__-BDUUUUU=
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/xtbB0gRIqmgePWgV5gAAsk

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
 lib/alloc_tag.c | 29 ++++++++++-------------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
index 25ecc1334b67..fdd5887769a6 100644
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
@@ -249,7 +239,8 @@ static void __init procfs_init(void)
 	if (!mem_profiling_support)
 		return;
 
-	if (!proc_create_seq(ALLOCINFO_FILE_NAME, 0400, NULL, &allocinfo_seq_op)) {
+	if (!proc_create_seq_private(ALLOCINFO_FILE_NAME, 0400, NULL, &allocinfo_seq_op,
+				     sizeof(struct allocinfo_private), NULL)) {
 		pr_err("Failed to create %s file\n", ALLOCINFO_FILE_NAME);
 		shutdown_mem_profiling(false);
 	}
-- 
2.39.2

