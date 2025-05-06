Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EF015575C
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 08:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746519937; cv=none; b=pJXeL/wqmloWy/VDko770pz+MCEY9+jnvRh2qEz8qSNEWwoCy0PujafG1ok/Rh0NSOrkogsU9vwazfwfs1UDKBcltTeQ6/brkr/LcDj0ToNgagJgsrKw8T4dBVmYGbtK79Sn1UESzy6+V6Y6Dd4VRACb+Q68oX+hPbbzdcw2Ip4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746519937; c=relaxed/simple;
	bh=I1P8tPM/iuy3ZNgzDHuDSRma6a/vqKGPF3HLeCtKKSM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BJugSjfwQgq+tyjOCoO6f3rNN5rwB0nSIJddymTm/cJYdu1rxXn8XVt1ZsXoTew8tGtS6AHca0F0oozJBL4Mn/4wuWb5xuRP5hfT07thynIzSUxmpWm43o04IMU9n3OAtjE7AoWEfRrPXO3wyP2hev4drWRLgA5He8dc95bmi7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iaWtLX1I; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iaWtLX1I"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-736c277331eso5804266b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 01:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746519935; x=1747124735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TFFttdtCDEZCyNTJvWqYSjw8T9NidMPynxT2P6ADGEY=;
        b=iaWtLX1Itq+G7YDWEwKa/EgWASNziIZlVHpO2tBwGJs6km2S5x+PUFRt2NKKqtCfR/
         8VgH7rChdBM5QSriJj9Pb9i8ykjXRfLdQrLgkc0rDtVqC8tueQxhwVf7rkCwco5nEu6H
         SLR3OiahP/x2gObctZh+cct+nA6+aDtPEWRKRKJfx1U5+uGiLfgwD6qXTFi94w8lyNGN
         nZQPhxcYcP0eEFTPDXKQFm7vHILXlLjtOsA9Chdet3Rn3KuK97KloARzk5BPrnJc4O0N
         4Pz7xw6iSDw3/w5xxmqhspW9Za0Y+U6n9L+xMmWbIJtNPFGNVMkPMXf7qdPAlFaEzIGT
         4pSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746519935; x=1747124735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TFFttdtCDEZCyNTJvWqYSjw8T9NidMPynxT2P6ADGEY=;
        b=ehnt5w1Sk1U6IsQCNuLToE+gS60BjUeZg6fD0K5d/KEVFiPeGnuJN+gpNY77cDztF1
         QVhuA/4f6sqXOV60aD9gGlSh0f00aYjJwkZtg5IclHpRnIQrUmTjas+nv+0plcTf3oX2
         FKFXsvzmMWWC42d9BGHhPAFKbLZq9cGAK5TW8EpmXPiXz0qy8MfGcVuOueHYjeU50hMs
         G2vgTlFW7U5LVNq3qhR6+dKjTW5Z6WMUR4cwIV1VlnXroZcTcYTQbNJo5RhJ0BK7CEbM
         J+Bkdg9kP49vf/PJlHCT7GotzizG0iCsReO8tcj52ZRjnou5FgZ17pW8MS5SWWU8ZDh6
         cMKg==
X-Forwarded-Encrypted: i=1; AJvYcCW8lJucYZL88Zkbnb6tsZhWqPyEl4GOHnU4938so6XPqGJXJbTMFzSqU2K6q/z+Az4EaC+glQaL6CU1ezc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9stiV7Gj0zfgCchgo18hVLFdWwSWl2Ld4pl6w/TraUSEdvqj0
	Sw8P3ro+0b+jJZdWcIAQGCXtdSr1KsKemd5KKGYZouGkebxQs16V
X-Gm-Gg: ASbGnctv4strXqpP0N3Fuelm3+xid77hk4EBSsT8If2RR2UVrDIA5n94Gh4WonMjw9Z
	fElMXu5vEpDHXOYbZkUFrju8EJQovbs5v+jyNoifY8uCsK6hjkZit/rNazgYg9y/i5k+okFtu58
	v8ZUDCaRVvcs/VSkDm90TPwm4QzHfcKzOmuX/T2IjiOsajbShjnP+xwVxwM6Kmc++kbLub0sCoz
	AUdZFSpTXFDs5Srq9dBR6RhXxjTEu31Csc2I3NAgOL0Ov5qQ7hMmPCQirlFcK71hpNp2mhRJAmq
	ebjUIMqAU4iy4O8zPxpQIOsJls+ig1+f+tzVSud0ASWbyjHzKuZ8yuC7jGtza0InE8ANtQ==
X-Google-Smtp-Source: AGHT+IFqpuETaQnwTGTEmS5W7RR74OY3ecaKXVFMfCX78LqX+oJkQ8BmrW1I6LpLRP6E5qbObcC5dg==
X-Received: by 2002:a05:6a21:6da3:b0:1f3:323e:3743 with SMTP id adf61e73a8af0-2116fa3a73bmr3548319637.12.1746519934852;
        Tue, 06 May 2025 01:25:34 -0700 (PDT)
Received: from localhost.localdomain ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3920f6dsm6904412a12.10.2025.05.06.01.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 01:25:34 -0700 (PDT)
From: Jeongjun Park <aha310510@gmail.com>
To: akpm@linux-foundation.org
Cc: urezki@gmail.com,
	edumazet@google.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH v2] mm/vmalloc: fix data race in show_numa_info()
Date: Tue,  6 May 2025 17:25:19 +0900
Message-ID: <20250506082520.84153-1-aha310510@gmail.com>
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
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
v2: Refactoring some functions and fix patch as per Eric Dumazet suggestion
- Link to v1: https://lore.kernel.org/all/20250505171948.24410-1-aha310510@gmail.com/
---
 mm/vmalloc.c | 50 +++++++++++++++++++++++++-------------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 3ed720a787ec..a5e795346141 100644
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
@@ -5013,7 +5017,10 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
 			if (is_vmalloc_addr(v->pages))
 				seq_puts(m, " vpages");
 
-			show_numa_info(m, v);
+			if (!(v->flags & VM_UNINITIALIZED) &&
+						IS_ENABLED(CONFIG_NUMA))
+				show_numa_info(m, v);
+
 			seq_putc(m, '\n');
 		}
 		spin_unlock(&vn->busy.lock);
@@ -5028,14 +5035,7 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
 
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
