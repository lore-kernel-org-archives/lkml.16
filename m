Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B3878F32
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 16:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746723473; cv=none; b=SD/00rF+Vde5XbpkseP7vSjySDRV/+gZP4YX4s8SCNAM/RialnmvgairGa27/nA/y1Y8PIDUxNth67Hfs09B6Nzk61R+Lkk4Ohhjvg5/xxXvQAXsKzQtQNDWPPbTcxB+Kbpw95+4egvVdHe2oJAmJtwQzNoHk9JAQ9GpzE9GCgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746723473; c=relaxed/simple;
	bh=6NQnmkbgTn93OinaQEM1HvAdQL5EEHCFq1WdACu5Z5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rkTwBwy2f9OzQgP2lm8bNRkRTbAS9rqzEtvZX8THp3T4PRHyAMDhsSpw0eT0J59Sb0HTGL0qzFc9l6wk74yaYOJJiVI40oFESVyBVkelYqMnDYL9L9u1h1iCRwwOc89Z6LMll3yI5W9QQ0nVsQlY0X5d7c80301fzTh5FX6lV24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JvD78IIC; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JvD78IIC"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22c33677183so13361265ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 09:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746723471; x=1747328271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HjM1dPb8bOv2aM34todpZOhFL53nHTuwDqy427KwNUM=;
        b=JvD78IICa9ogJj7SzA7qD1wbKfZcIkGAnWqkhJoFqsruDJe4ME9prrvO48UeB0rwis
         G8yPQIhn+uGPpkhCoX6itR/H1JFLjpaqAtv9hIFp/MRifToAB1jcpQsmZgR6Os92iyLm
         mykKW/uI9rYOgu7XPPQydg9QLjZJ8Znk6nxEBbXyuo+VXy4SJmq779i4jdBpfnh5PKVn
         mwqAZqGOFMHxbN1VNOi8ncau8Aya6tOoerkJK2yvMeLiMKt9WVIkXrsk4q/5F4cHanGu
         nKBoB53gyA2H97iFSreyDVjzLr5zh/DcQMUYGm/0CYpgb6M/eCtGIbwBV7bN3tgyT8wn
         Vfjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746723471; x=1747328271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HjM1dPb8bOv2aM34todpZOhFL53nHTuwDqy427KwNUM=;
        b=Nq+baZZexiWLp6kUmZ1icZz8sKZqjl7sU122vVH88BfcmgnidAGLvJyV6Qhl+1rggB
         77m7sNQ78EgmmMp2xwm7e2C+Y1lCESOCblMKdODPWAQ/y8+u0Spu6JXe9KsUYJQ8/ytp
         Jx9Gix056jz1G48UM9oKvv0HPGdfOBPamGsfscsgW2NMh2Z4eHFTvX/MxKq/gL74nhr2
         60nO27rsDMLamemU60HWQoUE2+C+etX6c6zpkEprLie7F8SGTo/SlkU2Uv9dTdDpWEv8
         lugACk308EMQwCjOFfM74QTn5Q2fkLaIDP9gXkmoReHyPFFBVkUHgYqRAk9ukXbewFLn
         x3Xg==
X-Forwarded-Encrypted: i=1; AJvYcCXdQpOpaHzAbmoikJFfkMITwoCkDF0+xitDYooQaZVgRcVoOM0c/eOx74UaVcP+4sn6xTQS+bQ0N8gUwY0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxX69PoRX+Gi565EmtGuTLZNkSOvi25afY8ZmNO28OULbFu1yPQ
	o2CF3Z9DKded9NBBSTB+rvQBK6d59Bp+p2b5hIJtq9CrFxiygLeowr9HiHrEzvE=
X-Gm-Gg: ASbGncs0wb7dBaXZ/PX6PosBcQZnGnrUiI6nqYjeeTj1XcEgfh4mcsJQ5bfAA9etdWU
	ylqTKhkb8wQIimqIxz3hSdE3CvdgaKysJBJt4B7Y1Wb3ww8+W1s+xmF7uX/61SSo6XkVcRW+wrB
	2BHuLGE7UjsNP0vZEhAmlXXk9vX/WuWb/AgqqmD5QbRmRSXBf2y3dIKlcWkSdkukjjpxnDP4zvA
	vi1+YE1NB8238DLQdvHkROJ6lK5eTFJO5Hq4ZKbVm4lyEYRhVEMe2LC4P3JHUl6ofNZarY+Km6H
	UHyZ5oUcEEhsU/fCf0GWlXvhNpiAmH2Y0O/Y21RfrTXn7B1a3Pf7Ml87ndbj6R6F3j63RA==
X-Google-Smtp-Source: AGHT+IHMbrUheukA+D16FGpiJrayB+4VKaQB981MqKgitHqw8oJKPPYcg4PF2F1slxdbIxpIsyKszA==
X-Received: by 2002:a17:902:ecc6:b0:22f:c19c:810c with SMTP id d9443c01a7336-22fc91a20b3mr722035ad.51.1746723471297;
        Thu, 08 May 2025 09:57:51 -0700 (PDT)
Received: from localhost.localdomain ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7742fedsm1678045ad.91.2025.05.08.09.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 09:57:50 -0700 (PDT)
From: Jeongjun Park <aha310510@gmail.com>
To: akpm@linux-foundation.org
Cc: urezki@gmail.com,
	edumazet@google.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH v6] mm/vmalloc: fix data race in show_numa_info()
Date: Fri,  9 May 2025 01:56:20 +0900
Message-ID: <20250508165620.15321-1-aha310510@gmail.com>
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
v6: Change CONFIG_NUMA to must be check before doing any work related to the counters array.
- Link to v5: https://lore.kernel.org/all/20250508160800.12540-1-aha310510@gmail.com/
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
 mm/vmalloc.c | 63 +++++++++++++++++++++++++++++-----------------------
 1 file changed, 35 insertions(+), 28 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 3ed720a787ec..c1ea9713a1c0 100644
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
+	unsigned int *counters;
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
+			if (IS_ENABLED(CONFIG_NUMA))
+				show_numa_info(m, v, counters);
+
 			seq_putc(m, '\n');
 		}
 		spin_unlock(&vn->busy.lock);
@@ -5023,19 +5035,14 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
 	 * As a final step, dump "unpurged" areas.
 	 */
 	show_purge_info(m);
+	if (IS_ENABLED(CONFIG_NUMA))
+		kfree(counters);
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
