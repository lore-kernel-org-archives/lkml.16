Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7827825A347
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 17:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746465611; cv=none; b=fgQetDmEuE96o0yjmFdPU5BA52YtshkPcOyYKJGmy+KA3Pfr6ot6sntjKs8ujnYufoBSQL9im5qiDYpJrq/1SdcnmihzcfkMvFJiUAZ2kgm6d+fGzxoNgxAofqpBWLeUOUHubRt7YdIS/l9K/vddkcefegArK9RVDjfMh+O/TQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746465611; c=relaxed/simple;
	bh=qaF208KaS71fJgnG8VLo/PfXaJXOPFVO/o9jqS4Cv/8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cndcbloh2EaISRlBqnDNskvsQ1FQR+f7/G8VQhz3/RolpCkLQf7EsRLQHewbM/73FbG84fWfp+0TBsGbtM2HBIkFm4AKG54VYx8rcBWUpvGoZI1JdCaSj0kLPN39+TUWd5nokY9cP0xI8TxHHscWW40Tu3uJeW6O24HAH81eOuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YY4nE/yP; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YY4nE/yP"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b061a775ac3so4439449a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 10:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746465609; x=1747070409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mQLHWcdfFkuiv5N/+v6WJKhCdy1asd1QaZJCrWGTx7s=;
        b=YY4nE/yPbYg84+Skwf3SS9G9QzK/ulU+28flQB2hC2fbdGt/tN/r32Kar4jVPFmygp
         Zr7RuJPARBMFe454N/lxWTBtxYVndlCjF+FCAwKr+495uo2LYOBeszP6FMisPh9PsvG0
         SivIY/dz2fByNJKG7hKvWctyEHF4Er9fE7moxm+QEyT/z8at8hbIcql2RsUVyHDW3cx+
         jFsCBHUu9DPg1QC28ymfg4pXq4iVq38bkq/0NwXJymmUTfdpAuG/iNLBi3zcBol61qjV
         p/ZxMziVCMBwdgLXFhwfkdC3oyQJfb48yTt7mIF+UUYXlUTMh7f7NLFl1tP9hclQa6OZ
         ELNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746465609; x=1747070409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mQLHWcdfFkuiv5N/+v6WJKhCdy1asd1QaZJCrWGTx7s=;
        b=IzLjwMmLatfOa/qSL8Mp60WEcBiGKlTO4S7p7YhCjSbdTUNLBgXBKSd6XqXS+ntwEZ
         OOANQqo4e64pzJuhHk7eZJFWQdisMfpLzz6bHxmKoKbAoY6GztE1gCGjVIIILRxiV6ed
         sc5dxtyHf1PdoAuPbqnvt9yCEle0btjaP5PvNit9aN3NKhzNXtuO3QMOa8CSVTtMrVhA
         t02YeE9OM6Z0JDpu2bq3idpLukxFW0hEJqwyir9ZM5/1QAZviIDcxXyoQdVp850xj36Q
         BVimOnanqxQofNdVCStHW5nP59PKoxrzzQTz4qeNWLtIYAxlETc3vTOuJvUonwd67PDh
         8s5A==
X-Forwarded-Encrypted: i=1; AJvYcCViGpq6Q8I5DARRVRiEwPEpEn6krBP8yAiPodBR4ggAQyvY/MvyBr9xj1WZT6QCP7P9NJOiavwOJE9Qo00=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCUCrmEznQ3+bSEiOw5eyKnZYt4YQGgqTmUDw/XX4CYnTIdkk8
	vKK/n2DCnFBV5uR6H9kkF4r6fT7bcrWVvJdE46BjmcUoqfllyqJg3frCDnLhccE=
X-Gm-Gg: ASbGncvum4osNnqjMQ9wIO1gXwS7QQGlqsY8f/476XNNftZVZ+IVpFpK9C/RXOR/pYR
	N8Xx8ZKcuR2+m8N4jAqhrxKdk06WZGPNNEFsA3rSnL0W6suZaGm/R1qbIqNa9JUJWqTtySg0Lg4
	RRqIIx85ET/EhLDoGrmupTCV/Zi53NTsNX0arCrKBaNmFEwU5TmNHMoh8sbkGtCSnTYEwnzzBHI
	stY+97LTlPhksMnORuwJR6Mzxfw2ilpgTC0rI3Ba3uNojIla7S0qiyBJZ8sb846ydWpQWhPoWDM
	VpzQlMEglqcLebDVdWUsv/aieW34BmpZGaMJ/zVcbr5uaTbmQITKBwblcvqNGbkIj7xbng==
X-Google-Smtp-Source: AGHT+IFecyZtj1dy4XazVt9jUD0w3fTT/mj3hzCNHgmZ5240nXoOG80I/i5Z9bsDWP2gD84a3DekPQ==
X-Received: by 2002:a05:6a21:4a4c:b0:1f5:9330:29fe with SMTP id adf61e73a8af0-20e96607fb1mr10733132637.17.1746465608523;
        Mon, 05 May 2025 10:20:08 -0700 (PDT)
Received: from localhost.localdomain ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3b7bbd0sm4858306a12.37.2025.05.05.10.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 10:20:08 -0700 (PDT)
From: Jeongjun Park <aha310510@gmail.com>
To: akpm@linux-foundation.org
Cc: urezki@gmail.com,
	edumazet@google.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH] mm/vmalloc: fix data race in show_numa_info()
Date: Tue,  6 May 2025 02:19:48 +0900
Message-ID: <20250505171948.24410-1-aha310510@gmail.com>
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

Reported by Kernel Concurrency Sanitizer on:
CPU: 1 UID: 0 PID: 8287 Comm: syz.0.411 Not tainted 6.15.0-rc4-00256-g95d3481af6dc-dirty #1 PREEMPT(voluntary) 
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1 04/01/2014
==================================================================

There is a read/write data-race in counter[]. This seems to be happening
because only read memory barriers are currently applied, so we need to
modify the write operation to counters[] to be handled atomically.

Fixes: a47a126ad5ea ("vmallocinfo: add NUMA information")
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
 mm/vmalloc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 3ed720a787ec..d93fa535bc21 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -4917,7 +4917,8 @@ bool vmalloc_dump_obj(void *object)
 static void show_numa_info(struct seq_file *m, struct vm_struct *v)
 {
 	if (IS_ENABLED(CONFIG_NUMA)) {
-		unsigned int nr, *counters = m->private;
+		atomic_t *counters = m->private;
+		unsigned int nr;
 		unsigned int step = 1U << vm_area_page_order(v);
 
 		if (!counters)
@@ -4931,10 +4932,10 @@ static void show_numa_info(struct seq_file *m, struct vm_struct *v)
 		memset(counters, 0, nr_node_ids * sizeof(unsigned int));
 
 		for (nr = 0; nr < v->nr_pages; nr += step)
-			counters[page_to_nid(v->pages[nr])] += step;
+			atomic_add(step, &counters[page_to_nid(v->pages[nr])]);
 		for_each_node_state(nr, N_HIGH_MEMORY)
-			if (counters[nr])
-				seq_printf(m, " N%u=%u", nr, counters[nr]);
+			if (atomic_read(&counters[nr]))
+				seq_printf(m, " N%u=%u", nr, atomic_read(&counters[nr]));
 	}
 }
 
--
