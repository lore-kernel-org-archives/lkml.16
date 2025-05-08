Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD042B9AA
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 06:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746687382; cv=none; b=OgZFvPx7p0MCJMV25j4845UF6LKXWe/B6UIAutExypSdFvKNuOlOfLIRWOJV11B1xtHKFL872cS2A2KsqRBAjL8GmZVRyC4ZsXVPmCo+OP6vU/WOv2BNJQiXyoK2FjIBVQ8mg6YqVaL25THEVeUncGtMb4wuFqon3RThj6dUtps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746687382; c=relaxed/simple;
	bh=yfk+syG7UvFPjK49iCE8z/wbu+fKHybJxcTQoTCfacA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GK33YwSRZJDVdXRfuwAz61vzpBLSyd4rOlFLOTUwpAuxdXvMRj3XXXGxQQc2gOP6UmWAHDbbfl3XgD8KtdvPCy66CB5pMJTM+ymsm3XU+QW1V5773ihjmyBwfubNJPcPdAKvMLoVWZPCX7KylpUQ5vVCe3ZZUoSFxCOwM+ah2fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CtJ+uIFB; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CtJ+uIFB"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-224341bbc1dso8613835ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 23:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746687380; x=1747292180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kv5nIQYUHwKXVpDAEk6oAoPFzEzBx5U/yf9HqEFM2ZA=;
        b=CtJ+uIFBGSSnAZcz3drZ5D2lpcxND7Rk5Oso4CZikLgR7RxCa4sLPZUmARg2lDZfPi
         V98QJXJNo658UUmLeshLDjnkj86r4TcYK7bpKdl0eKZ6KcqDXqj8Ahund0Xao3PdmEbH
         503JcmPj0xU0gzaqCgATYJw8ww6nqKpOVfbR2UacZXDkF3YqnASQr1ACHtrAlMinRemi
         /eOjtdEv25gV7nD6douOoOPb2Gsa/NvQ5ycTxAFu4BNx4a3IPAeNrCcqv1hgj7bb6tBZ
         r751pnsMy2Bv81Fh0hPiVVlF2KnsUEbBRbKvndNt8LNkATVJDVKP9hU/1u+1f0q0v+CT
         jafQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746687380; x=1747292180;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kv5nIQYUHwKXVpDAEk6oAoPFzEzBx5U/yf9HqEFM2ZA=;
        b=CWVIgeWqzFsKzZCLmR9R3wdYQw7yBaiFEaUBWRPINspwNNSbdyGhtqwxXxFogPTWxP
         IOPKVXNrVWfJ9/tjT3xYGEnMAuqUcKuI9RuQyFLCIoVFbnRqcRkQyNl1AHDDPF0btwfO
         6caha8oZaf5ElI8KXZITlo5+HfqSPtp26I8Nb5+2qaPk9n/bvArBweyrdktizpHGARrT
         ysSxij77s0jmsu3BiFhuP6gyn3Uwksma68xVWAGn5NSiQbkSgFBkahDGdls4baqYWZXI
         SPne74tnZESMEAj/GnZFELCkyB+ujwrUHOp6qGS8ISn1eKE/J/EfTaV3eNeXNPkGdq7B
         DQfA==
X-Forwarded-Encrypted: i=1; AJvYcCUIaXeaPpji5AQ9RggayNcaoRKDkVpkRLoQI59gYOAj9K283pzfRmbfer2E5aYIgGnCzyagLpk8w3X4eGU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0+Q9ZTrqj9eMBeIx66lrh1Vsq8LFiDoP8ur7wNVuAnIhSLaKt
	imTloTa3ew+6T1In/awK2UGthQ0F9SRNwZDz3zkH+rSS2QAzDppBJog+XRRx
X-Gm-Gg: ASbGnctSW1uHuODQP92rp0FA8BrW479mNSFHS/+B3S+Wilk2AKFX7IOQ4ryHBmY7Sou
	2I83qmB0RZm1SZ0gOX7R1mRw0iUNxhfFMKUYZ5IyczWopC5HGqBjZU2xKLUZ3R+gXw/Xcm8Lr9V
	GDvPfyGcKZw9poabwMqV65PJn+Z9ctKoHMx6+29y8iWfdwG/Pv6XPtQMTBNNM0mSM2jsWlKG5zY
	wBHD5M2errwiVXg0lZX2UJpn3xchfgWFyqbT3tGbI95coUrexGkqI8el7r8h3Uk32eC1pcF+nEP
	D97XTNyDmHDiFPPNgZ8CNde9KFRWhonTtwFmTsox21Wsq6zGJwux
X-Google-Smtp-Source: AGHT+IHxsERgycA8eNkC/Ri4FaFVk51rp5Z1uYjmooPdZ/f6gnCibov5sFSQL33WyqVCJtKOqfx3pA==
X-Received: by 2002:a17:903:8c5:b0:227:e980:919d with SMTP id d9443c01a7336-22e5ecc4150mr93225215ad.47.1746687379746;
        Wed, 07 May 2025 23:56:19 -0700 (PDT)
Received: from localhost.localdomain ([118.46.108.16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151e950csm105470145ad.77.2025.05.07.23.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 23:56:19 -0700 (PDT)
From: Jeongjun Park <aha310510@gmail.com>
To: akpm@linux-foundation.org
Cc: urezki@gmail.com,
	edumazet@google.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH v4] mm/vmalloc: fix data race in show_numa_info()
Date: Thu,  8 May 2025 15:55:58 +0900
Message-ID: <20250508065558.149091-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following data-race was found in show_numa_info():

==================================================================
BUG: KCSAN: data-race in vmalloc_info_show / vmalloc_info_show

read to 0xffff88800971fe30 of 4 bytes by task 8289 on cpu 0:
 show_numa_info mm/vmalloc.c:4936 [inline]
 vmalloc_info_show+0x5a8/0x7e0 mm/vmalloc.c:5016
 seq_read_iter+0x373/0xb40 fs/seq_file.c:230
 proc_reg_read_iter+0x11e/0x170 fs/proc/inode.c:299
....

write to 0xffff88800971fe30 of 4 bytes by task 8287 on cpu 1:
 show_numa_info mm/vmalloc.c:4934 [inline]
 vmalloc_info_show+0x38f/0x7e0 mm/vmalloc.c:5016
 seq_read_iter+0x373/0xb40 fs/seq_file.c:230
 proc_reg_read_iter+0x11e/0x170 fs/proc/inode.c:299
....

value changed: 0x0000008f -> 0x00000000
==================================================================

According to this report,there is a read/write data-race because m->private
is accessible to multiple CPUs. To fix this, instead of allocating the heap
in proc_vmalloc_init() and passing the heap address to m->private,
vmalloc_info_show() should allocate the heap.

Fixes: a47a126ad5ea ("vmallocinfo: add NUMA information")
Suggested-by: Eric Dumazet <edumazet@google.com>
Suggested-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
Suggested-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
v4: Change the way counters array heap is allocated, per Andrew Morton's suggestion.
    And fix it to call smp_rmb() in the correct location.
- Link to v3: https://lore.kernel.org/all/20250507142552.9446-1-aha310510@gmail.com/
v3: Following Uladzislau Rezki's suggestion, we check v->flags beforehand
    to avoid printing uninitialized members of vm_struct.
- Link to v2: https://lore.kernel.org/all/20250506082520.84153-1-aha310510@gmail.com/
v2: Refactoring some functions and fix patch as per Eric Dumazet suggestion
- Link to v1: https://lore.kernel.org/all/20250505171948.24410-1-aha310510@gmail.com/
---
 mm/vmalloc.c | 61 ++++++++++++++++++++++++++++------------------------
 1 file changed, 33 insertions(+), 28 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 3ed720a787ec..112df5a86106 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3100,7 +3100,7 @@ static void clear_vm_uninitialized_flag(struct vm_struct *vm)
 	/*
 	 * Before removing VM_UNINITIALIZED,
 	 * we should make sure that vm has proper values.
-	 * Pair with smp_rmb() in show_numa_info().
+	 * Pair with smp_rmb() in vread_iter() and vmalloc_info_show().
 	 */
 	smp_wmb();
 	vm->flags &= ~VM_UNINITIALIZED;
@@ -4914,28 +4914,29 @@ bool vmalloc_dump_obj(void *object)
 #endif
 
 #ifdef CONFIG_PROC_FS
-static void show_numa_info(struct seq_file *m, struct vm_struct *v)
-{
-	if (IS_ENABLED(CONFIG_NUMA)) {
-		unsigned int nr, *counters = m->private;
-		unsigned int step = 1U << vm_area_page_order(v);
 
-		if (!counters)
-			return;
+/*
+ * Print number of pages allocated on each memory node.
+ *
+ * This function can only be called if CONFIG_NUMA is enabled
+ * and VM_UNINITIALIZED bit in v->flags is disabled.
+ */
+static void show_numa_info(struct seq_file *m, struct vm_struct *v,
+				 unsigned int *counters)
+{
+	unsigned int nr;
+	unsigned int step = 1U << vm_area_page_order(v);
 
-		if (v->flags & VM_UNINITIALIZED)
-			return;
-		/* Pair with smp_wmb() in clear_vm_uninitialized_flag() */
-		smp_rmb();
+	if (!counters)
+		return;
 
-		memset(counters, 0, nr_node_ids * sizeof(unsigned int));
+	memset(counters, 0, nr_node_ids * sizeof(unsigned int));
 
-		for (nr = 0; nr < v->nr_pages; nr += step)
-			counters[page_to_nid(v->pages[nr])] += step;
-		for_each_node_state(nr, N_HIGH_MEMORY)
-			if (counters[nr])
-				seq_printf(m, " N%u=%u", nr, counters[nr]);
-	}
+	for (nr = 0; nr < v->nr_pages; nr += step)
+		counters[page_to_nid(v->pages[nr])] += step;
+	for_each_node_state(nr, N_HIGH_MEMORY)
+		if (counters[nr])
+			seq_printf(m, " N%u=%u", nr, counters[nr]);
 }
 
 static void show_purge_info(struct seq_file *m)
@@ -4962,8 +4963,11 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
 	struct vmap_node *vn;
 	struct vmap_area *va;
 	struct vm_struct *v;
+	unsigned int *counters = NULL;
 	int i;
 
+	counters = kmalloc(nr_node_ids * sizeof(unsigned int), GFP_KERNEL);
+
 	for (i = 0; i < nr_vmap_nodes; i++) {
 		vn = &vmap_nodes[i];
 
@@ -4979,6 +4983,11 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
 			}
 
 			v = va->vm;
+			if (v->flags & VM_UNINITIALIZED)
+				continue;
+
+			/* Pair with smp_wmb() in clear_vm_uninitialized_flag() */
+			smp_rmb();
 
 			seq_printf(m, "0x%pK-0x%pK %7ld",
 				v->addr, v->addr + v->size, v->size);
@@ -5013,7 +5022,9 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
 			if (is_vmalloc_addr(v->pages))
 				seq_puts(m, " vpages");
 
-			show_numa_info(m, v);
+			if (IS_ENABLED(CONFIG_NUMA))
+				show_numa_info(m, v, counters);
+
 			seq_putc(m, '\n');
 		}
 		spin_unlock(&vn->busy.lock);
@@ -5023,19 +5034,13 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
 	 * As a final step, dump "unpurged" areas.
 	 */
 	show_purge_info(m);
+	kfree(counters);
 	return 0;
 }
 
 static int __init proc_vmalloc_init(void)
 {
-	void *priv_data = NULL;
-
-	if (IS_ENABLED(CONFIG_NUMA))
-		priv_data = kmalloc(nr_node_ids * sizeof(unsigned int), GFP_KERNEL);
-
-	proc_create_single_data("vmallocinfo",
-		0400, NULL, vmalloc_info_show, priv_data);
-
+	proc_create_single("vmallocinfo", 0400, NULL, vmalloc_info_show);
 	return 0;
 }
 module_init(proc_vmalloc_init);
--
