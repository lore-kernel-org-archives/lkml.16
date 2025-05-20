Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4B025CC6C
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 15:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747754478; cv=none; b=ZjC5loczkb20JIF+cs4ZRrpD9R3JFpYzpxjrVQCA7MJLvI7uX2NXhgUM6ul4JCildCYob+mPs8KWobYMUDSj9cCo8TNh6oMrzq2zd+Lx2FfCkbXWb5CInAs8v1za57g5tzqZ7d5iNSwWMRPl5TED+CxC5Sw98KXERweRiiHdqY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747754478; c=relaxed/simple;
	bh=Ac577SF1EdQVGlVaI269T+n4SvgSNPC1N5Hajobt0fM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SCUwE5u7y9VF77HqVQParEZmTI3+/mxcSx+relx69yDhe808JNqoyjkf0R6bI9YM3bjF40j+8UWen5j+2PVqe2rdljhNoy4bV87HlPSf9QqVQ6dOfIZeUbYiluTMjN/R5w3NFWrng18o9qklTkqa2IiOICvpqkUKk/61Jw1WnIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gPbOClgy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gPbOClgy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 135F0C4CEE9;
	Tue, 20 May 2025 15:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747754477;
	bh=Ac577SF1EdQVGlVaI269T+n4SvgSNPC1N5Hajobt0fM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gPbOClgyTtlZIMJZYwGSjVD2G2MK2svN+vfrvfovNWQ8QelZQQLfICrbmBA3E6Gdf
	 NjXsPvJaXaRVeT74MEIOWbvzgirq+82PluCGBARSQNtHx3VOa6hcEvji+9ctj6FVCZ
	 NBhz0CpRY0GaQigQVnraMoIr/x+BpXYvv6LivQt3i8NQ95k8YVg22KDXL1/lo1udme
	 iNOhE7WrRVjbdbQtbQPCozwSPDU+DcyqelOvLgIAreUUz2LtZcVLcyjCe0JCHFcNPN
	 r/OoyvYvD2qX1gneGmmr1F/sWwBTzGFalf2t45L7ipSWbdjyXbxfBVrclmagvHX5ml
	 bWyr8YeqGop2g==
From: Arnd Bergmann <arnd@kernel.org>
To: Dave Hansen <dave.hansen@linux.intel.com>,
	Dan Williams <dan.j.williams@intel.com>
Cc: Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nikolay Borisov <nik.borisov@suse.com>,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 3/3] [RFC] x86/devmem: remove low 1MB hack for x86-64
Date: Tue, 20 May 2025 17:20:30 +0200
Message-Id: <20250520152030.1499670-3-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250520152030.1499670-1-arnd@kernel.org>
References: <20250520152030.1499670-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Traditionally, both reading and mapping anything in the low 1MB area is
allowed on x86, through a series of ugly hacks.  In combination with
features such as memory encryption, this keeps causing trouble and
requires building additional hacks on top.

Chances are that this is only really used for 32-bit machines, as the
usual users of this were dosemu, svgalib or ancient XFree86 versions,
none of which should be used on 64-bit kernels any more.

Remove both the custom devmem_is_allowed() and the custom
xlate_dev_mem_ptr() on 64-bit kernels, and use the normal implementation
based on phys_to_virt() instead for read/write access on the linear
map.

As a result, this makes x86-64 behave more like the other architecture
on /dev/mem, allowing read/write access only on actual system RAM and
only when CONFIG_STRICT_DEVMEM is disabled, while mmap() can be use
on MMIO pages with the normal restrictions.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
Unlike the other two patches in this series, this one is expected to
change the behavior on x86-64 kernels, which has the risk of
regressions, but seems worthwhile to me.

Are there any reasons left for keeping these hacks?
---
 arch/x86/Kconfig          | 3 ++-
 arch/x86/include/asm/io.h | 3 ++-
 arch/x86/mm/init.c        | 4 +++-
 arch/x86/mm/ioremap.c     | 2 ++
 4 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 47a3cd5ffc4f..635328b57e35 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -85,7 +85,7 @@ config X86
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DEBUG_VIRTUAL
 	select ARCH_HAS_DEBUG_VM_PGTABLE	if !X86_PAE
-	select ARCH_HAS_DEVMEM_IS_ALLOWED
+	select ARCH_HAS_DEVMEM_IS_ALLOWED	if !X86_64
 	select ARCH_HAS_DMA_OPS			if GART_IOMMU || XEN
 	select ARCH_HAS_EARLY_DEBUG		if KGDB
 	select ARCH_HAS_ELF_RANDOMIZE
@@ -180,6 +180,7 @@ config X86
 	select GENERIC_IRQ_PROBE
 	select GENERIC_IRQ_RESERVATION_MODE
 	select GENERIC_IRQ_SHOW
+	select GENERIC_LIB_DEVMEM_IS_ALLOWED	if X86_64
 	select GENERIC_PENDING_IRQ		if SMP
 	select GENERIC_SMP_IDLE_THREAD
 	select GENERIC_TIME_VSYSCALL
diff --git a/arch/x86/include/asm/io.h b/arch/x86/include/asm/io.h
index 367d45755f85..c1ecca34f28d 100644
--- a/arch/x86/include/asm/io.h
+++ b/arch/x86/include/asm/io.h
@@ -285,11 +285,12 @@ BUILDIO(l, u32)
 #define outsw outsw
 #define outsl outsl
 
+#ifdef CONFIG_X86_32
 extern void *xlate_dev_mem_ptr(phys_addr_t phys);
 extern void unxlate_dev_mem_ptr(phys_addr_t phys, void *addr);
-
 #define xlate_dev_mem_ptr xlate_dev_mem_ptr
 #define unxlate_dev_mem_ptr unxlate_dev_mem_ptr
+#endif
 
 extern int ioremap_change_attr(unsigned long vaddr, unsigned long size,
 				enum page_cache_mode pcm);
diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
index aa56d9ac0b8f..16d0f242f0de 100644
--- a/arch/x86/mm/init.c
+++ b/arch/x86/mm/init.c
@@ -856,11 +856,12 @@ void __init poking_init(void)
 	pte_unmap_unlock(ptep, ptl);
 }
 
+#ifdef CONFIG_X86_32
 /*
  * devmem_is_allowed() checks to see if /dev/mem access to a certain address
  * is valid. The argument is a physical page number.
  *
- * On x86, access has to be given to the first megabyte of RAM because that
+ * On x86-32, access has to be given to the first megabyte of RAM because that
  * area traditionally contains BIOS code and data regions used by X, dosemu,
  * and similar apps. Since they map the entire memory range, the whole range
  * must be allowed (for mapping), but any areas that would otherwise be
@@ -897,6 +898,7 @@ int devmem_is_allowed(unsigned long pagenr)
 
 	return 1;
 }
+#endif
 
 void free_init_pages(const char *what, unsigned long begin, unsigned long end)
 {
diff --git a/arch/x86/mm/ioremap.c b/arch/x86/mm/ioremap.c
index 11b4ea7d7fa5..1e51d1c245bf 100644
--- a/arch/x86/mm/ioremap.c
+++ b/arch/x86/mm/ioremap.c
@@ -509,6 +509,7 @@ void *arch_memremap_wb(phys_addr_t phys_addr, size_t size, unsigned long flags)
 	return (void __force *)ioremap_encrypted(phys_addr, size);
 }
 
+#ifdef CONFIG_X86_32
 /*
  * Convert a physical pointer to a virtual kernel pointer for /dev/mem
  * access
@@ -533,6 +534,7 @@ void unxlate_dev_mem_ptr(phys_addr_t phys, void *addr)
 {
 	memunmap((void *)((unsigned long)addr & PAGE_MASK));
 }
+#endif
 
 #ifdef CONFIG_AMD_MEM_ENCRYPT
 /*
-- 
2.39.5

