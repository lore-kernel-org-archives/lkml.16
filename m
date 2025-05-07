Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF72E1DE4F1
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 14:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746627969; cv=none; b=EvHwz1qg52Udqy8tJWA/6x5kAdw62EhtWb8W1TEnx4keUHV3kgJ4FrP/bUrgdy9WCk73BwYdnaruaSGOmMGTaTd2LCi05VEqn60SsKslyVKpr4fMq/AvGBGsOiaPIORTdyG3IUGpzT3E8iuQPikkuzPy4xDsehprl+zVgAotNXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746627969; c=relaxed/simple;
	bh=uzKNY28SSnkKn4YMEMZqfikiQgW8+/Kp4A8TVVlRYtA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o9fpVgApQ37RCxOntocAbh37yn8v/+bZK7Kla3tFl2sgNxXdWX9IVjgTpo+PoydfGVYgDISIrMhvwTDEqr0jxvKtckGO9vDrYO6qSo1t1A3VKr38swqzaWzTfYaU4eMV83dKkOmtQBqKIOdc6QhGZN6sNNXfWacY0RXr0auNxZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=en3UDPAi; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="en3UDPAi"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2241053582dso109813885ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 07:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746627967; x=1747232767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DfDvqNWUgnTKgZEGOobujF8QcJeWaiSm2X8u9wdEE6A=;
        b=en3UDPAiQsPv40Chc3EkxgFo5B9BziJU/1jRqHjqbpIArQ6SkrNbZSGMAAUefsEBSL
         BGoc1BM7m50Gf0Mu8AaH0A+qjAujSzR5DYdQwl5rOcFkBl9+Ym2fvG6cIGfSaMamTM6S
         oj6t+GvE4YCLI+VC3nu4NGFiihKt/eyZ1wycC7HEfYh3RnHUOCRsOihP/u+iiMAtAhab
         2SataPyrRd7XGOCj3wbcfGKZMV2uG0zA54BiovhxSsjjWdhXbGZx8nlJUUBaKUWE7DUi
         jYZurL7rUL16psrlndhXJ3ZVda0Kjfep3PVDClQaLQ3p0c6l+HQdV74ZC6clfh+aqa+l
         R9hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746627967; x=1747232767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DfDvqNWUgnTKgZEGOobujF8QcJeWaiSm2X8u9wdEE6A=;
        b=nMf0mYHDitbLDEjdxHfEUHkJMqYtI0SlCgj2bLJeUVyI8wdNylDU0pS6Lb67XObN95
         mTzB3KGgS6FeXuvjEERllHKQZczegn6cpVmeIpxdoxovhBAqipCJ+y86SAMWlaVytLE5
         pakUNt+03z6S6Fv9CF77PI/Xs19LTPTDo+Oymb5KMBiVHshdHzjflLuQCavzTvXmp8Xx
         DupgI6Dv/JFy/rs052ZM3QfLTy9FlA67fzRI7Ttyi+8fXb5ORh+wSp0XWN/gwQLFULu/
         Stv9e5u8IQJy3EJXR0ygbsmXIW6c4yzuivFFLMftDEZbeCc/jmsTZAuJjy+zagPF87Sy
         tFZw==
X-Forwarded-Encrypted: i=1; AJvYcCW6/zefOywG0SfU+JJ8Kyag1BNnVztAxeRD6bZzIOJTJRHN8fG7j0uj0j/6iHfuHprAd0MbnnwkzkGil7A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSaYPJkFwmjsw0g667UdYqU4tXv0lu5pB8/3yNzw5tDhMqq23G
	2nOyH+TXTAc3bMNBPZNS2ifD0WCyW8uixkzJjf4omBLd0JWEjE+v
X-Gm-Gg: ASbGncvGUshKtJ7u0yPWBlveNSTL1phlZs0H8DDWS5i89R+ZJFIeFr+VSBY8TNbTdJ0
	eJmzFUdEykHriHpy6zbx4Oq7xmTilntUp7KZC8xIPuIO5PQIpygKzYihs3/XY0Rp1DQQk/ATnuo
	RgzQ9z7/DDgDSNLeoDv9DH87IH7c6F597HviR802lwOsvv2Wr+XuWFx1cz2aqpQXdYtLoHqVrgp
	JeN9qgflYeGnPUQ3gOsg2CqXmQWsThV7igOVKp1do4dDPlSnum5xr7ToJzSuu9UkFV/SS/4+Qd4
	ium7UJvw7XORlzUaTpcj8Tg0ft+8MD9y53CMQ6LHSFsRYRPx0JB1hL1bgCwr14ctq8g2lg==
X-Google-Smtp-Source: AGHT+IHZT6Prp6If8dZzt9++LXCmyzXz1LsZDEZXWGSEVWaBx4q4ta2zgtzs3NhGgAjwx+FdsJP7fw==
X-Received: by 2002:a17:902:cec4:b0:21f:564:80a4 with SMTP id d9443c01a7336-22e5ede6eecmr55082985ad.33.1746627967008;
        Wed, 07 May 2025 07:26:07 -0700 (PDT)
Received: from localhost.localdomain ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e5369bea0sm26031595ad.117.2025.05.07.07.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 07:26:06 -0700 (PDT)
From: Jeongjun Park <aha310510@gmail.com>
To: akpm@linux-foundation.org,
	urezki@gmail.com
Cc: edumazet@google.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH v3] mm/vmalloc: fix data race in show_numa_info()
Date: Wed,  7 May 2025 23:25:52 +0900
Message-ID: <20250507142552.9446-1-aha310510@gmail.com>
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
 new_sync_read fs/read_write.c:489 [inline]
 vfs_read+0x5b4/0x740 fs/read_write.c:570
 ksys_read+0xbe/0x190 fs/read_write.c:713
 __do_sys_read fs/read_write.c:722 [inline]
 __se_sys_read fs/read_write.c:720 [inline]
 __x64_sys_read+0x41/0x50 fs/read_write.c:720
 x64_sys_call+0x1729/0x1fd0 arch/x86/include/generated/asm/syscalls_64.h:1
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xa6/0x1b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

write to 0xffff88800971fe30 of 4 bytes by task 8287 on cpu 1:
 show_numa_info mm/vmalloc.c:4934 [inline]
 vmalloc_info_show+0x38f/0x7e0 mm/vmalloc.c:5016
 seq_read_iter+0x373/0xb40 fs/seq_file.c:230
 proc_reg_read_iter+0x11e/0x170 fs/proc/inode.c:299
 new_sync_read fs/read_write.c:489 [inline]
 vfs_read+0x5b4/0x740 fs/read_write.c:570
 ksys_read+0xbe/0x190 fs/read_write.c:713
 __do_sys_read fs/read_write.c:722 [inline]
 __se_sys_read fs/read_write.c:720 [inline]
 __x64_sys_read+0x41/0x50 fs/read_write.c:720
 x64_sys_call+0x1729/0x1fd0 arch/x86/include/generated/asm/syscalls_64.h:1
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xa6/0x1b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

value changed: 0x0000008f -> 0x00000000
==================================================================

According to this report, there is a read/write data-race because m->private
is accessible to multiple CPUs. To fix this, instead of allocating the heap
in proc_vmalloc_init() and passing the heap address to m->private,
show_numa_info() should allocate the heap.

One thing to note is that show_numa_info() is called in a critical section
of a spinlock, so it must be allocated on the heap with GFP_ATOMIC flag.

Fixes: a47a126ad5ea ("vmallocinfo: add NUMA information")
Suggested-by: Eric Dumazet <edumazet@google.com>
Suggested-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
v3: Following Uladzislau Rezki's suggestion, we check v->flags beforehand
	to avoid printing uninitialized members of vm_struct.
- Link to v2: https://lore.kernel.org/all/20250506082520.84153-1-aha310510@gmail.com/
v2: Refactoring some functions and fix patch as per Eric Dumazet suggestion
- Link to v1: https://lore.kernel.org/all/20250505171948.24410-1-aha310510@gmail.com/
---
 mm/vmalloc.c | 51 ++++++++++++++++++++++++++-------------------------
 1 file changed, 26 insertions(+), 25 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 3ed720a787ec..9139025e20e5 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -4914,28 +4914,32 @@ bool vmalloc_dump_obj(void *object)
 #endif
 
 #ifdef CONFIG_PROC_FS
+
+/*
+ * Print number of pages allocated on each memory node.
+ *
+ * This function can only be called if CONFIG_NUMA is enabled
+ * and VM_UNINITIALIZED bit in v->flags is disabled.
+ */
 static void show_numa_info(struct seq_file *m, struct vm_struct *v)
 {
-	if (IS_ENABLED(CONFIG_NUMA)) {
-		unsigned int nr, *counters = m->private;
-		unsigned int step = 1U << vm_area_page_order(v);
+	unsigned int nr, *counters;
+	unsigned int step = 1U << vm_area_page_order(v);
 
-		if (!counters)
-			return;
+	counters = kcalloc(nr_node_ids, sizeof(unsigned int), GFP_ATOMIC);
+	if (!counters)
+		return;
 
-		if (v->flags & VM_UNINITIALIZED)
-			return;
-		/* Pair with smp_wmb() in clear_vm_uninitialized_flag() */
-		smp_rmb();
+	/* Pair with smp_wmb() in clear_vm_uninitialized_flag() */
+	smp_rmb();
 
-		memset(counters, 0, nr_node_ids * sizeof(unsigned int));
+	for (nr = 0; nr < v->nr_pages; nr += step)
+		counters[page_to_nid(v->pages[nr])] += step;
+	for_each_node_state(nr, N_HIGH_MEMORY)
+		if (counters[nr])
+			seq_printf(m, " N%u=%u", nr, counters[nr]);
 
-		for (nr = 0; nr < v->nr_pages; nr += step)
-			counters[page_to_nid(v->pages[nr])] += step;
-		for_each_node_state(nr, N_HIGH_MEMORY)
-			if (counters[nr])
-				seq_printf(m, " N%u=%u", nr, counters[nr]);
-	}
+	kfree(counters);
 }
 
 static void show_purge_info(struct seq_file *m)
@@ -4979,6 +4983,8 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
 			}
 
 			v = va->vm;
+			if (v->flags & VM_UNINITIALIZED)
+				continue;
 
 			seq_printf(m, "0x%pK-0x%pK %7ld",
 				v->addr, v->addr + v->size, v->size);
@@ -5013,7 +5019,9 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
 			if (is_vmalloc_addr(v->pages))
 				seq_puts(m, " vpages");
 
-			show_numa_info(m, v);
+			if (IS_ENABLED(CONFIG_NUMA))
+				show_numa_info(m, v);
+
 			seq_putc(m, '\n');
 		}
 		spin_unlock(&vn->busy.lock);
@@ -5028,14 +5036,7 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
 
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
