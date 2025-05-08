Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467BD1FE468
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 16:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746720506; cv=none; b=mCCL0wC8whE0nesR+XCFxev2PwVrKW2boRUxPr14ZiiN8vBUrDVVeoEG7YvC3c9HCaADXOrm27tC0mK2gpcO+faly4bBXyQeDfJOvFj3kggYRz3xT1q4ElMX8ZYoDe3e1QldN5+8xy+SeMwmRL6U5nywzpt2ZTvsWvGR5kddGl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746720506; c=relaxed/simple;
	bh=b3l8croKUW8dc4yIHxsq9I2nI/YpuMXFK/OXZDm9tHA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iVvHJ9bOTfEklpOBi1ve7qwjkX3w7OVyKP3vKyrXcnXzzpxzT4qJTFsQItXWpyoUlEJk4G47DDeKiT+Lkf9Xa2c/Kp82XZv112rBptDAxaXsD+J2645NPP0VsRXNPkL3uAmJ5gAO0/Ib0L4mgHJfDxjjPBz4XVO266BE+BFWlP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dGk+TtfK; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dGk+TtfK"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22fa414c478so5858445ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 09:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746720504; x=1747325304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s9ROv9KuczvUa1Vp2qDPzp6MZDV4UqLLpvvc3qAXFJw=;
        b=dGk+TtfKcNzPqlkq9ENjWrOYbPoN+I+lAjHX1qBrwRtaoLPbJ4IdLZa8Ds90x0SWc3
         hTpcjI6ZBxZ8mw8J739yav1LevUDlHQ4o/885rDwERJbqfLwD1B0dKZWUxgvZsRVHi9+
         YOPGMNaVmw/XMhNu+ZkGl34RlXmf3QSyEgsvNGNnDay+Kr1AjU6VWTd3FwuPD5Y3SKFi
         IvycnDNYUDeU0pr6PP471aH4gr/nSQlJl1ZKfUnZ2x6te8lBicFcBh2Y5TF81MCQne4Y
         1BhSvRUvK3kvgyO/Rsc8kHu8VQgGXlGAJ5dHq8k+smMqZsT2WqBA6TeEMj745C6jIh4j
         Eouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746720504; x=1747325304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s9ROv9KuczvUa1Vp2qDPzp6MZDV4UqLLpvvc3qAXFJw=;
        b=t2d4Z4wVcMN2pHap9eycl+a4s6V9xFBkNDdHfvOHKJ1Kk7M5/6EUs0l/DlvyCiDCst
         y+VA8m1Fxcpz4AvHdTEGclhP+FM8uOYKWo0izGREv8aiuwvcrC5AGtnyjEbaGRD/iEcQ
         N1MVO9d7zOpfoxdIIldQvftfwABQ5fSQaY1V643tsRCqiN/on2l6FvemOGe6Vj8VzQL8
         ywXoSGukOvdezP+/MxYaPg6In02lSRZ3YQLhoCCjxJFKL3VV0s8/RPnoHsWTv8rQPNOk
         O5JGyqgIVtVFMcQi5OF84X4ln+rVpuqpueI/YhwyTys5shU3s0N9FdKi2GDlgV6QAk7i
         pNag==
X-Forwarded-Encrypted: i=1; AJvYcCWNAJZ6wl/2yyQSuKgyW4hNKytncz2A6lLwPiWlHD3k5eE03DbpD2v+Q7HxR3vwY5hj2tK/Reujty/atds=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNh0qLj0YVbRb9THSWfiY5/ezgmyR6LJF29aKnKu3hKJZloLB6
	HxlVSazzHUELQ+aR1ZtoTVLXoMFLl5DflSckGuSFGaFo6rv80x9Y8VvZiSJB5eU=
X-Gm-Gg: ASbGncvXj3o18j5j/EfvYSG193yXQkYVKymjmqUmb+j8FnladkPKj7legV+/u5qUfWr
	+5HCi/7dc7oEllmI8fBWrBGMmZ1QeCqHAyR9W2YBLAxRbdvAF9Shij/LX2P33drhyh5TV1YHcCH
	+LRIhQorKUb4XUMUZc2gHkByMOIhnh+XlrEXGu01wltX1eVcAbG4ZUSJb/xbNZDAbJZR/kowBDb
	3SSNo+dPDadtvXPO4fcHBxASetV+fmu8KhNhHKY9u+fWWt62lOlJK31EhorhWu0jAIRjiV+Vr0O
	o+TFJcKvsZU319Eumrf+zaNdsBHFbZeBGJFre/tctV4kDoXvK+ylRCRl/TVe7ZfyoITwfg==
X-Google-Smtp-Source: AGHT+IGAOO1c+/4k91yP++dVjTa8Iuat7ppKvVNLyvQrYUhnOk6p7L0QmsijCbwxNqboANgfh6bkdQ==
X-Received: by 2002:a17:902:f213:b0:22e:61dd:8900 with SMTP id d9443c01a7336-22e61dd8cdcmr93268025ad.29.1746720504235;
        Thu, 08 May 2025 09:08:24 -0700 (PDT)
Received: from localhost.localdomain ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271ad5sm879805ad.137.2025.05.08.09.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 09:08:23 -0700 (PDT)
From: Jeongjun Park <aha310510@gmail.com>
To: akpm@linux-foundation.org
Cc: urezki@gmail.com,
	edumazet@google.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH v5] mm/vmalloc: fix data race in show_numa_info()
Date: Fri,  9 May 2025 01:07:59 +0900
Message-ID: <20250508160800.12540-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.43.0
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
v5: Change heap to be allocated only when CONFIG_NUMA is enabled
- Link to v4: https://lore.kernel.org/all/20250508065558.149091-1-aha310510@gmail.com/
v4: Change the way counters array heap is allocated, per Andrew Morton's suggestion.
    And fix it to call smp_rmb() in the correct location.
- Link to v3: https://lore.kernel.org/all/20250507142552.9446-1-aha310510@gmail.com/
v3: Following Uladzislau Rezki's suggestion, we check v->flags beforehand
    to avoid printing uninitialized members of vm_struct.
- Link to v2: https://lore.kernel.org/all/20250506082520.84153-1-aha310510@gmail.com/
v2: Refactoring some functions and fix patch as per Eric Dumazet suggestion
- Link to v1: https://lore.kernel.org/all/20250505171948.24410-1-aha310510@gmail.com/
---
 mm/vmalloc.c | 62 ++++++++++++++++++++++++++++------------------------
 1 file changed, 34 insertions(+), 28 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 3ed720a787ec..866f18766dfc 100644
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
@@ -4962,8 +4963,12 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
 	struct vmap_node *vn;
 	struct vmap_area *va;
 	struct vm_struct *v;
+	unsigned int *counters = NULL;
 	int i;
 
+	if (IS_ENABLED(CONFIG_NUMA))
+		counters = kmalloc(nr_node_ids * sizeof(unsigned int), GFP_KERNEL);
+
 	for (i = 0; i < nr_vmap_nodes; i++) {
 		vn = &vmap_nodes[i];
 
@@ -4979,6 +4984,11 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
 			}
 
 			v = va->vm;
+			if (v->flags & VM_UNINITIALIZED)
+				continue;
+
+			/* Pair with smp_wmb() in clear_vm_uninitialized_flag() */
+			smp_rmb();
 
 			seq_printf(m, "0x%pK-0x%pK %7ld",
 				v->addr, v->addr + v->size, v->size);
@@ -5013,7 +5023,9 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
 			if (is_vmalloc_addr(v->pages))
 				seq_puts(m, " vpages");
 
-			show_numa_info(m, v);
+			if (counters)
+				show_numa_info(m, v, counters);
+
 			seq_putc(m, '\n');
 		}
 		spin_unlock(&vn->busy.lock);
@@ -5023,19 +5035,13 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
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
