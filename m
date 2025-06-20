Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C1E128ECEA
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 14:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750429560; cv=none; b=Daxnm+Gr7gJUBiUSjoZIxW1eN8RQE5vGOf6kIsx47NPG/uh5oci0/hGx56ckFKUeUtJXkAK4XEullDaB7RAvFWRB7W0mRTxGU1pYVzAJVcccT65QOFlTbFn5DUx+HsVN+ZyyyNZrPFLwrRYhVK166tf+S9um5hl9eeIQ25u0ZYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750429560; c=relaxed/simple;
	bh=Wz43VhyzXLI3tkq4wLJNxYA/MiOsTk6gwhnynaD+T64=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BOitL2/Xzyb8CV9aY02ydQpUtBsVDZFbTOIKDTt7JgveUg8diX3rXYJSrwkWLhoL7SqPqgssVMxOWfTL/c41jreAeby0YNtNg+bDp+Rst17lcPb8CjZLLzUGZF1U+Dw3uAQI+1mR/GDCzcpoGxRM4L1rq10VRv6QgK7tT19bieA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=dFWf2DLR; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="dFWf2DLR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=F+
	s4TZGtiHn5gpEh51Yl96vuZmpTgHkH1W8sWQddU3s=; b=dFWf2DLRaIijy++jwd
	36zibg8Z5ji2gJZOvEbNwPjeztztb1GgARlbb8Y6CX/f76JYMua+RhifnSZ7hlFF
	rNkP2+FqpJAcH/4ueVMzeGCCI9y+pqHpSYSv4w0/bSxPFtTlweuLP9TJHucGYkCp
	QUuQr0oZ/ffAqAOFTlhXsbSR8=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgAH_Q0yb1VoK7KqAA--.17605S4;
	Fri, 20 Jun 2025 22:25:04 +0800 (CST)
From: David Wang <00107082@163.com>
To: akpm@linux-foundation.org,
	urezki@gmail.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	harry.yoo@oracle.com,
	kent.overstreet@linux.dev,
	surenb@google.com,
	David Wang <00107082@163.com>,
	kernel test robot <oliver.sang@intel.com>
Subject: [PATCH] lib/test_vmalloc.c: demote vmalloc_test_init to late_initcall
Date: Fri, 20 Jun 2025 22:24:48 +0800
Message-Id: <20250620142448.653645-1-00107082@163.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <202506181351.bba867dd-lkp@intel.com>
References: <202506181351.bba867dd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgAH_Q0yb1VoK7KqAA--.17605S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxWF1kZw4DCrWruF1fGFy8Zrb_yoW5ZF17pF
	WUXr1UKrZ5Jr1xGr4UAry8X3W8tayDAa1DGw13Xr9YvF1UKw47Xrn7tr48Zrn0yFWkuF43
	tr4vya18KF1UKaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pREzuJUUUUU=
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/xtbBkBpyqmhVbwsGZwAAsq

Commit 2d76e79315e4 ("lib/test_vmalloc.c: allow built-in execution")
enable test_vmalloc module to be built into kernel directly, but
vmalloc_test_init depends on alloc_tag module via alloc_tag_top_users().

When a kernel build with following config:

CONFIG_TEST_VMALLOC=y
CONFIG_MEM_ALLOC_PROFILING=y
CONFIG_MEM_ALLOC_PROFILING_ENABLED_BY_DEFAULT=y
CONFIG_MEM_ALLOC_PROFILING_DEBUG=y

If vmalloc_test_init() run before alloc_tag_init(), memory
failure tests would invoke alloc_tag_top_users() which is not
ready to use and cause kernel BUG:

 [  135.116045] BUG: kernel NULL pointer dereference, address: 0000000000000030
 [  135.116063] #PF: supervisor read access in kernel mode
 [  135.116074] #PF: error_code(0x0000) - not-present page
 [  135.116085] PGD 0 P4D 0
 [  135.116094] Oops: Oops: 0000 [#1] SMP NOPTI
 [  135.116123] Tainted: [E]=UNSIGNED_MODULE
 [  135.116132] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
 [  135.116148] RIP: 0010:down_read_trylock+0x1d/0x80
 [  135.116188] RSP: 0000:ffffb5e481a9b8f8 EFLAGS: 00010246
 [  135.116200] RAX: ffff93dc8a5ac700 RBX: 0000000000000030 RCX: 8000000000000007
 [  135.116214] RDX: 0000000000000001 RSI: 000000000000000a RDI: ffffffff93d2e733
 [  135.116228] RBP: ffffb5e481a9b9a0 R08: 0000000000000000 R09: 0000000000000003
 [  135.116241] R10: ffffb5e481a9b860 R11: ffffffff94ec6328 R12: ffffb5e481a9b9b0
 [  135.116255] R13: 0000000000000003 R14: 0000000000000001 R15: ffffffff94e0c580
 [  135.116271] FS:  00007fd41947e540(0000) GS:ffff93dd6654a000(0000) knlGS:0000000000000000
 [  135.116286] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
 [  135.116298] CR2: 0000000000000030 CR3: 00000001099f8000 CR4: 0000000000350ef0
 [  135.116314] Call Trace:
 [  135.116321]  <TASK>
 [  135.116328]  codetag_trylock_module_list+0x9/0x20
 [  135.116342]  alloc_tag_top_users+0x153/0x1b0
 [  135.116354]  ? srso_return_thunk+0x5/0x5f
 [  135.116365]  ? _printk+0x57/0x80
 [  135.116378]  __show_mem+0xeb/0x210
 [  135.116394]  ? dump_header+0x2ce/0x3e0
 [  135.116405]  dump_header+0x2ce/0x3e0

Demote vmalloc_test_init to late_initcall can make sure alloc_tag
module got initialized before test_vmalloc module.

Link: https://lore.kernel.org/lkml/20250620100258.595495-1-00107082@163.com/
Reported-by: kernel test robot <oliver.sang@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202506181351.bba867dd-lkp@intel.com
Fixes: 2d76e79315e4 ("lib/test_vmalloc.c: allow built-in execution")
Signed-off-by: David Wang <00107082@163.com>
---
 lib/test_vmalloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/test_vmalloc.c b/lib/test_vmalloc.c
index 1b0b59549aaf..5af009df56ad 100644
--- a/lib/test_vmalloc.c
+++ b/lib/test_vmalloc.c
@@ -598,7 +598,7 @@ static int __init vmalloc_test_init(void)
 	return IS_BUILTIN(CONFIG_TEST_VMALLOC) ? 0:-EAGAIN;
 }
 
-module_init(vmalloc_test_init)
+late_initcall(vmalloc_test_init)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Uladzislau Rezki");
-- 
2.39.2

