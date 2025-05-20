Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6982550BB
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 15:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747754471; cv=none; b=qBVbh80KtNVBtDcO1JAtzOFda+kbiGnCKhcgWS+cpI6BQNa/nLx9sFEuIJABUopaYa3GFHI3BfFU5RA66N/pnhOjOYaV+GvvqgkMVmbOP3UInIl/TiHB0FgEs/VlGdtPimxT/kXTG+USPNtpRA0/X2ky5CdEE8JHXZVCNDhNFJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747754471; c=relaxed/simple;
	bh=ZfsdTk+Ho+Z49WcvlwFmwrLt4R5MI4XFAsuFHvj1YxI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dUzddLCPhr0yDaE7wAyjM4j5XOn6t9Achc+52FkWFqZ12koZZlte2iXEh0Ssg8ePdgvI4l3hqAq16u+TrUp3JRk13Tw1j8wkHjq0GbwQRqmkRSeDB8jFcZUzr2hIyB+M8S0Ezing3BzcbURvobbJgAUXwobK2yxoArc+SIZA8So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VEHvaygW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VEHvaygW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0199C4CEE9;
	Tue, 20 May 2025 15:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747754471;
	bh=ZfsdTk+Ho+Z49WcvlwFmwrLt4R5MI4XFAsuFHvj1YxI=;
	h=From:To:Cc:Subject:Date:From;
	b=VEHvaygWDiO0ZDm/602mqe+EYJrkqRLLdOJ3e2r+QdvQIWtcGHuPOR2yRym4di+Zc
	 x18lC3RpW6wkX3ohaLm09g3ZPd0iutaMQT2nSi0hmS8hoSaIy6Dhvd7r8i+uP2mfi1
	 F/R2NTwr3igyI4Fxa65QnrPgTGC6u3t8BTyKQR6Wm9xLjAVO9iiXSjw3z5ougziUcl
	 2ovrJe2MbQcXasm7j2wciYgSCriiW+6yg7BclJwpANuCznjdLufdYnGfyq32GQ4Rfq
	 5HC5Eh2KpSNhl+M58SvdCniVoQTa1PQVL9HxUeFDGprbqUPYhH+i6R0QBP6CzIVHDj
	 gI+MfIEylnosw==
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
Subject: [PATCH 1/3] x86/devmem: move range_is_allowed() to drivers/char/mem.c
Date: Tue, 20 May 2025 17:20:28 +0200
Message-Id: <20250520152030.1499670-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The global inline function in include/linux/io.h causes problems
because of the unfortunate naming that is too generic, and because
it reintroduces a dependency on the PAGE_SIZE definition that should
not exist in this header file.

Something I had not seen during the earlier review is how the
x86 phys_mem_access_prot_allowed() is called directly after the
generic check for range_is_allowed(), so checking it again actually
has no effect at all, and the definition can be made local to
drivers/char/mem.c with no other caller.

Fixes: 1b3f2bd04d90 ("x86/devmem: Remove duplicate range_is_allowed() definition")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/x86/mm/pat/memtype.c |  3 ---
 drivers/char/mem.c        | 18 ++++++++++++++++++
 include/linux/io.h        | 21 ---------------------
 3 files changed, 18 insertions(+), 24 deletions(-)

diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memtype.c
index 2e7923844afe..fe24b8d2dc4b 100644
--- a/arch/x86/mm/pat/memtype.c
+++ b/arch/x86/mm/pat/memtype.c
@@ -789,9 +789,6 @@ int phys_mem_access_prot_allowed(struct file *file, unsigned long pfn,
 	if (!pat_enabled())
 		return 1;
 
-	if (!range_is_allowed(pfn, size))
-		return 0;
-
 	if (file->f_flags & O_DSYNC)
 		pcm = _PAGE_CACHE_MODE_UC_MINUS;
 
diff --git a/drivers/char/mem.c b/drivers/char/mem.c
index 2a483369e255..85f963ce3b2d 100644
--- a/drivers/char/mem.c
+++ b/drivers/char/mem.c
@@ -347,6 +347,24 @@ static const struct vm_operations_struct mmap_mem_ops = {
 #endif
 };
 
+static int range_is_allowed(unsigned long pfn, unsigned long size)
+{
+	u64 from = ((u64)pfn) << PAGE_SHIFT;
+	u64 to = from + size;
+	u64 cursor = from;
+
+	if (!IS_ENABLED(CONFIG_STRICT_DEVMEM))
+		return 1;
+
+	while (cursor < to) {
+		if (!devmem_is_allowed(pfn))
+			return 0;
+		cursor += PAGE_SIZE;
+		pfn++;
+	}
+	return 1;
+}
+
 static int mmap_mem(struct file *file, struct vm_area_struct *vma)
 {
 	size_t size = vma->vm_end - vma->vm_start;
diff --git a/include/linux/io.h b/include/linux/io.h
index 28a238217aa6..8c0a8e8b6066 100644
--- a/include/linux/io.h
+++ b/include/linux/io.h
@@ -164,25 +164,4 @@ static inline void arch_io_free_memtype_wc(resource_size_t base,
 int devm_arch_io_reserve_memtype_wc(struct device *dev, resource_size_t start,
 				    resource_size_t size);
 
-#ifdef CONFIG_STRICT_DEVMEM
-static inline int range_is_allowed(unsigned long pfn, unsigned long size)
-{
-	u64 from = ((u64)pfn) << PAGE_SHIFT;
-	u64 to = from + size;
-	u64 cursor = from;
-
-	while (cursor < to) {
-		if (!devmem_is_allowed(pfn))
-			return 0;
-		cursor += PAGE_SIZE;
-		pfn++;
-	}
-	return 1;
-}
-#else
-static inline int range_is_allowed(unsigned long pfn, unsigned long size)
-{
-	return 1;
-}
-#endif
 #endif /* _LINUX_IO_H */
-- 
2.39.5

