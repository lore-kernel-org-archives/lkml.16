Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C813522083
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 04:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745208873; cv=none; b=QHCHPAr/dNFXVVNMFYivYXnvycsAKWq3X9E44Df+dvjKHj08w7x6KxbbHRRT3J83kRFrw6chWDM+ShXizsZ1THxEMnuz0rqmZRi7Pf7TC7ZoXN7lKka7IpbcBSJNhPzr6lF5ZF9eZAK/gcc6hletZFt1rR1AQX0XW3aKHQ1gf9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745208873; c=relaxed/simple;
	bh=FJ0rCQCRvqOos5DTeDKk2LxjFHpHWbBSaVdD8DqlEVs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PU6iOapxHwF3ctVjROIDjYFPqDxsVWL2E0zQCjwWiusX1fLAQhHTi8QVOPv/ku7pqWm6Xzq7Bua2oQ1UykpFvpQf11oA5Jc6YaaLfXhGa+kC5vKOpcEIzHgvqLru0SQ+tpxQI06kvm/P5AFvIu9+OOrTj0zKejA1Yf5KZG8ej30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4ZgsRP4LTmzQwNt;
	Mon, 21 Apr 2025 12:13:05 +0800 (CST)
Received: from kwepemd100011.china.huawei.com (unknown [7.221.188.204])
	by mail.maildlp.com (Postfix) with ESMTPS id 160CE180B49;
	Mon, 21 Apr 2025 12:14:27 +0800 (CST)
Received: from M910t.huawei.com (10.110.54.157) by
 kwepemd100011.china.huawei.com (7.221.188.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 21 Apr 2025 12:14:26 +0800
From: Changbin Du <changbin.du@huawei.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>
CC: "H. Peter Anvin" <hpa@zytor.com>, <linux-kernel@vger.kernel.org>, Changbin
 Du <changbin.du@huawei.com>
Subject: [PATCH] x86: remove orphan header file e820.h
Date: Mon, 21 Apr 2025 12:14:19 +0800
Message-ID: <20250421041419.3167094-1-changbin.du@huawei.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemd100011.china.huawei.com (7.221.188.204)

The header arch/x86/include/uapi/asm/e820.h isn't used by any source file any
more. The e820 related items are defined in arch/x86/include/asm/e820/types.h.
So clean it up.

Signed-off-by: Changbin Du <changbin.du@huawei.com>
---
 arch/x86/include/uapi/asm/e820.h | 82 --------------------------------
 1 file changed, 82 deletions(-)
 delete mode 100644 arch/x86/include/uapi/asm/e820.h

diff --git a/arch/x86/include/uapi/asm/e820.h b/arch/x86/include/uapi/asm/e820.h
deleted file mode 100644
index 55bc66867156..000000000000
--- a/arch/x86/include/uapi/asm/e820.h
+++ /dev/null
@@ -1,82 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-#ifndef _UAPI_ASM_X86_E820_H
-#define _UAPI_ASM_X86_E820_H
-#define E820MAP	0x2d0		/* our map */
-#define E820MAX	128		/* number of entries in E820MAP */
-
-/*
- * Legacy E820 BIOS limits us to 128 (E820MAX) nodes due to the
- * constrained space in the zeropage.  If we have more nodes than
- * that, and if we've booted off EFI firmware, then the EFI tables
- * passed us from the EFI firmware can list more nodes.  Size our
- * internal memory map tables to have room for these additional
- * nodes, based on up to three entries per node for which the
- * kernel was built: MAX_NUMNODES == (1 << CONFIG_NODES_SHIFT),
- * plus E820MAX, allowing space for the possible duplicate E820
- * entries that might need room in the same arrays, prior to the
- * call to sanitize_e820_map() to remove duplicates.  The allowance
- * of three memory map entries per node is "enough" entries for
- * the initial hardware platform motivating this mechanism to make
- * use of additional EFI map entries.  Future platforms may want
- * to allow more than three entries per node or otherwise refine
- * this size.
- */
-
-#ifndef __KERNEL__
-#define E820_X_MAX E820MAX
-#endif
-
-#define E820NR	0x1e8		/* # entries in E820MAP */
-
-#define E820_RAM	1
-#define E820_RESERVED	2
-#define E820_ACPI	3
-#define E820_NVS	4
-#define E820_UNUSABLE	5
-#define E820_PMEM	7
-
-/*
- * This is a non-standardized way to represent ADR or NVDIMM regions that
- * persist over a reboot.  The kernel will ignore their special capabilities
- * unless the CONFIG_X86_PMEM_LEGACY option is set.
- *
- * ( Note that older platforms also used 6 for the same type of memory,
- *   but newer versions switched to 12 as 6 was assigned differently.  Some
- *   time they will learn... )
- */
-#define E820_PRAM	12
-
-/*
- * reserved RAM used by kernel itself
- * if CONFIG_INTEL_TXT is enabled, memory of this type will be
- * included in the S3 integrity calculation and so should not include
- * any memory that BIOS might alter over the S3 transition
- */
-#define E820_RESERVED_KERN        128
-
-#ifndef __ASSEMBLER__
-#include <linux/types.h>
-struct e820entry {
-	__u64 addr;	/* start of memory segment */
-	__u64 size;	/* size of memory segment */
-	__u32 type;	/* type of memory segment */
-} __attribute__((packed));
-
-struct e820map {
-	__u32 nr_map;
-	struct e820entry map[E820_X_MAX];
-};
-
-#define ISA_START_ADDRESS	0xa0000
-#define ISA_END_ADDRESS		0x100000
-
-#define BIOS_BEGIN		0x000a0000
-#define BIOS_END		0x00100000
-
-#define BIOS_ROM_BASE		0xffe00000
-#define BIOS_ROM_END		0xffffffff
-
-#endif /* __ASSEMBLER__ */
-
-
-#endif /* _UAPI_ASM_X86_E820_H */
-- 
2.43.0

