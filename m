Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B418C25D8F7
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 15:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747754474; cv=none; b=ApIkaCwSeMVQT13CX+M6JzjNMtSvmgB9f/HO0G6T5mpM8DOLtspOuM4N/JeJNS2KBznPb5NnfakdEhaTv6PY+hndkcOsyRDCQqpsVbXgZ/ybZK4cgP0UIFBu6L0Szeb2Ke++dv2NoKDvG+pmEMTgXNDcyUU/UpONqZ1eEbQvdVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747754474; c=relaxed/simple;
	bh=6rNvaO0/ixsyVQC9lgTV46IHW9a6PNAOsbt76FA6yiI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AYVL1y00t4WODQ5KmTDVIXCBIJse2lalIOeAn2oZTXShsn6WBcjEqVqNtEJP3H1AW4XA1X/Ih2lYKtzP7yBUeHXeye2J2VoxPeFp62jm0jUP4O1dpDpQVn/8P2OtWzmYc8BdBAbqeM8otspKzor3gFbwisUSftohv1JXC2lW4Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dx39u6XA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dx39u6XA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1B36C4CEE9;
	Tue, 20 May 2025 15:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747754474;
	bh=6rNvaO0/ixsyVQC9lgTV46IHW9a6PNAOsbt76FA6yiI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Dx39u6XAkATU2OaKSH89ZPRfZOJV5zSIqgbC2n1gmB/EbOb/A7Gg9MZXAoyXk1Lo5
	 lT4nfFJY+hMcQ/PwFtHEgKthi6CooWFm7eHNsrqQjYD3WIVFZacxIsifhvI2GaaSwm
	 RhYwcKirXCKDwOwzif6PxpFZX95yVIt2nqt3mqKmB/ugGCcENrDqIL2MqNafhdNcNW
	 VyOgeOMV9+MHkxI1VyAG+kcEWAqlIeCWkNqxGlVPNquxkDVkDC9N9CYT/lL2hy6Bgf
	 vSMmKav+KRu8FW80ys+L0fbfoPGCqUmT3gXgTlLreck57M9g3SlOsaq+3M0/4AsuBs
	 cw1M4Mksuhd+w==
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
Subject: [PATCH 2/3] x86/devmem: remove phys_mem_access_prot_allowed()
Date: Tue, 20 May 2025 17:20:29 +0200
Message-Id: <20250520152030.1499670-2-arnd@kernel.org>
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

phys_mem_access_prot_allowed() was originally a workaround for
certain 32-bit CPUs, but after commit 1886297ce0c8 ("x86/mm/pat:
Fix BUG_ON() in mmap_mem() on QEMU/i386"), it no longer does anything
special as the only remaining bit now is the same logic that follows in
phys_mem_access_prot(), mapping everything as normal memory except when
either O_DSYNC is set or the address is highmem.

Just remove the thing entirely.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/x86/mm/pat/memtype.c | 15 ---------------
 drivers/char/mem.c        | 10 ----------
 include/linux/pgtable.h   |  2 --
 3 files changed, 27 deletions(-)

diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memtype.c
index fe24b8d2dc4b..fec14f1f53a6 100644
--- a/arch/x86/mm/pat/memtype.c
+++ b/arch/x86/mm/pat/memtype.c
@@ -781,21 +781,6 @@ static inline void pgprot_set_cachemode(pgprot_t *prot, enum page_cache_mode pcm
 			 cachemode2protval(pcm));
 }
 
-int phys_mem_access_prot_allowed(struct file *file, unsigned long pfn,
-				unsigned long size, pgprot_t *vma_prot)
-{
-	enum page_cache_mode pcm = _PAGE_CACHE_MODE_WB;
-
-	if (!pat_enabled())
-		return 1;
-
-	if (file->f_flags & O_DSYNC)
-		pcm = _PAGE_CACHE_MODE_UC_MINUS;
-
-	pgprot_set_cachemode(vma_prot, pcm);
-	return 1;
-}
-
 /*
  * Change the memory type for the physical address range in kernel identity
  * mapping space if that range is a part of identity map.
diff --git a/drivers/char/mem.c b/drivers/char/mem.c
index 85f963ce3b2d..30a5c0e0542a 100644
--- a/drivers/char/mem.c
+++ b/drivers/char/mem.c
@@ -256,12 +256,6 @@ static ssize_t write_mem(struct file *file, const char __user *buf,
 	return written;
 }
 
-int __weak phys_mem_access_prot_allowed(struct file *file,
-	unsigned long pfn, unsigned long size, pgprot_t *vma_prot)
-{
-	return 1;
-}
-
 #ifndef __HAVE_PHYS_MEM_ACCESS_PROT
 
 /*
@@ -387,10 +381,6 @@ static int mmap_mem(struct file *file, struct vm_area_struct *vma)
 	if (!range_is_allowed(vma->vm_pgoff, size))
 		return -EPERM;
 
-	if (!phys_mem_access_prot_allowed(file, vma->vm_pgoff, size,
-						&vma->vm_page_prot))
-		return -EINVAL;
-
 	vma->vm_page_prot = phys_mem_access_prot(file, vma->vm_pgoff,
 						 size,
 						 vma->vm_page_prot);
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index adbebe2c6ce4..15b5a6b0943f 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1764,8 +1764,6 @@ static inline int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
 #endif
 
 struct file;
-int phys_mem_access_prot_allowed(struct file *file, unsigned long pfn,
-			unsigned long size, pgprot_t *vma_prot);
 
 #ifndef CONFIG_X86_ESPFIX64
 static inline void init_espfix_bsp(void) { }
-- 
2.39.5

