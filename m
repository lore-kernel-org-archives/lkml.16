Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C981728C5C8
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744292511; cv=none; b=jrq+XNae6xQlYa9eNAHkkohp8l1RDRLaKW/9kRgizW1utafmfGfsVTOx3bVr78loIKWJeUK97SPF9eaLuCSfmdsQv6XdE9ryU01Ab3k0U84hXfE7h7hL90DdXXfBnxyw8Y3FJ9MUSSr2WHKByHNZCmCWg3LdKv8xGLwJ711mrEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744292511; c=relaxed/simple;
	bh=N4MtpQRBVB+U9+XwdsBV8OoaO5bJmSMiovkcXVy1Y8M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Xx7MC3AvCbYwfhPYqlCDSASo2ColBqrE2i/IE6B/pe+4Upv/KuViRA5AAd7Od9aQkP7Jqh1Ed0xzTrj0dE1FzootaZqJrv6dLOuAJlksXDMlMgGedj4jDqoNwK+tG6/oLoQeNxmWBhUytBXAitx/7ocKSF3CYCCRUpyTRIgCKFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HSvtvoze; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HSvtvoze"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43d3b211d0eso10748825e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 06:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744292508; x=1744897308; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pfhvtPh90PyQrqwseeYAemYLSGq1dbH+1FaY8eo5bSo=;
        b=HSvtvozeMV8Z3dDkb4TLnuueFSa8Vo3ZzejIjdBL1yJxpUf80cOeolUF56jFKzMsyv
         3B2z3lkRGTXcZ63ayEWeHgV7UKh9R2XhEjShzqOWmVwVl9+er25QizVR1gxuBkBQqKyU
         RXqLq4aP3VyTBms210t9FhMVWxLK+PiNaqVtcPaFGyzFyYqo7+65FSRrgBV/SV9KKoUp
         DBSDghi1RYkWAddfcCy8dK1QJ3Prlcg+8Ux7mHK94/kjx0BYQ3WAo7kZk1fX7SQGLOm5
         voTOgD8rjwUv7xFBJqsx+x1waCSO7HTBWodFOwT25xwoBE32EeR8U9gkwOywcPg/mX6t
         EPRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744292508; x=1744897308;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pfhvtPh90PyQrqwseeYAemYLSGq1dbH+1FaY8eo5bSo=;
        b=I8gQ3jq940JeepBz8mxKMJ18ViY004KFreHwyj6dLaXmXuyMZwsdZ6p/MKQzC8VcE3
         RnLLgkkRCJZNKF/sbigzKYvdlBiLZsQeIZew+aGblk11/mb0L5Ruau94u0ezl9uhWYcT
         LAvcZetj+Hwj/3qn1qR8ZajHsSubeJy7mSY7G7KLDbyhzULmBkCFjOnZi2Hj9XB5qEbL
         l+uOB98Ys3V9tmCFsSLCh22rJy2bJ+hW92VKXtuBPp1dC+RNYyhuZX3Su+0GxTYyhCg4
         GypH8LyQ3Xy/LQUW0E4eAEB78H4hLUVCVOyFxhIWAOrBsdewZk6/7hIjG8hiE9JMugkr
         Ezsg==
X-Forwarded-Encrypted: i=1; AJvYcCVe3Kq2gbItd4EKY/9uC4TLBV62O+LnIGYtPU44aXq/lDCkyfmVawjUixYjY2bTK5bjWYLn3L0nSxVfWA0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyArkyPp63IFaZac9oM9BeW6sgHxHyZ/d5+IQ426gNELM9cpiRj
	ShJzWCqRomdkxUoFtoOsZ+u0hbl/HL4zrhymKByrjeXLiyM8Q/SUIuBh8OI9Pzb+lSu2Jg==
X-Google-Smtp-Source: AGHT+IEHgsALtbsBtlCh5VUUbOKjAbYRqEioBxZdA2XTwAKO+rsn9gwbhSvj8B86/s9ydc4ad/YnzBYc
X-Received: from wmbh13.prod.google.com ([2002:a05:600c:a10d:b0:43d:9f1:31a9])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:14b:b0:43d:174:2668
 with SMTP id 5b1f17b1804b1-43f3630500dmr3554455e9.0.1744292508427; Thu, 10
 Apr 2025 06:41:48 -0700 (PDT)
Date: Thu, 10 Apr 2025 15:41:22 +0200
In-Reply-To: <20250410134117.3713574-13-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250410134117.3713574-13-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4518; i=ardb@kernel.org;
 h=from:subject; bh=vBaHbEMhT1iu9JGCBB53txIntdweeE+e86SJD43lhWg=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIf37qZY3swVe9d7f39V0K/TExkdV8mZTc9VL75dvrJS35
 k7yvXuso5SFQYyDQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAEyE+wkjw7vHDXxpKdeStydN
 q1gV6xifuuJoEMctwQ8r8hmzWedEejD84dhQPq3Is2pH4/15LBJ8DRdux156liTt+2L2Tf9q7b3 x7AA=
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250410134117.3713574-17-ardb+git@google.com>
Subject: [PATCH v4 04/11] x86/boot: Drop RIP_REL_REF() uses from early mapping code
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: x86@kernel.org, mingo@kernel.org, linux-kernel@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Dionna Amalie Glaze <dionnaglaze@google.com>, Kevin Loughlin <kevinloughlin@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Now that __startup_64() is built using -fPIC, RIP_REL_REF() has become a
NOP and can be removed. Only some occurrences of rip_rel_ptr() will
remain, to explicitly take the address of certain global structures in
the 1:1 mapping of memory.

While at it, update the code comment to describe why this is needed.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/boot/startup/map_kernel.c | 41 ++++++++++----------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/arch/x86/boot/startup/map_kernel.c b/arch/x86/boot/startup/map_kernel.c
index 5f1b7e0ba26e..0eac3f17dbd3 100644
--- a/arch/x86/boot/startup/map_kernel.c
+++ b/arch/x86/boot/startup/map_kernel.c
@@ -26,12 +26,12 @@ static inline bool check_la57_support(void)
 	if (!(native_read_cr4() & X86_CR4_LA57))
 		return false;
 
-	RIP_REL_REF(__pgtable_l5_enabled)	= 1;
-	RIP_REL_REF(pgdir_shift)		= 48;
-	RIP_REL_REF(ptrs_per_p4d)		= 512;
-	RIP_REL_REF(page_offset_base)		= __PAGE_OFFSET_BASE_L5;
-	RIP_REL_REF(vmalloc_base)		= __VMALLOC_BASE_L5;
-	RIP_REL_REF(vmemmap_base)		= __VMEMMAP_BASE_L5;
+	__pgtable_l5_enabled	= 1;
+	pgdir_shift		= 48;
+	ptrs_per_p4d		= 512;
+	page_offset_base	= __PAGE_OFFSET_BASE_L5;
+	vmalloc_base		= __VMALLOC_BASE_L5;
+	vmemmap_base		= __VMEMMAP_BASE_L5;
 
 	return true;
 }
@@ -81,12 +81,14 @@ static unsigned long __head sme_postprocess_startup(struct boot_params *bp,
 	return sme_get_me_mask();
 }
 
-/* Code in __startup_64() can be relocated during execution, but the compiler
- * doesn't have to generate PC-relative relocations when accessing globals from
- * that function. Clang actually does not generate them, which leads to
- * boot-time crashes. To work around this problem, every global pointer must
- * be accessed using RIP_REL_REF(). Kernel virtual addresses can be determined
- * by subtracting p2v_offset from the RIP-relative address.
+/*
+ * This code is compiled using PIC codegen because it will execute from the
+ * early 1:1 mapping of memory, which deviates from the mapping expected by the
+ * linker. Due to this deviation, taking the address of a global variable will
+ * produce an ambiguous result when using the plain & operator.  Instead,
+ * rip_rel_ptr() must be used, which will return the RIP-relative address in
+ * the 1:1 mapping of memory. Kernel virtual addresses can be determined by
+ * subtracting p2v_offset from the RIP-relative address.
  */
 unsigned long __head __startup_64(unsigned long p2v_offset,
 				  struct boot_params *bp)
@@ -113,8 +115,7 @@ unsigned long __head __startup_64(unsigned long p2v_offset,
 	 * Compute the delta between the address I am compiled to run at
 	 * and the address I am actually running at.
 	 */
-	load_delta = __START_KERNEL_map + p2v_offset;
-	RIP_REL_REF(phys_base) = load_delta;
+	phys_base = load_delta = __START_KERNEL_map + p2v_offset;
 
 	/* Is the address not 2M aligned? */
 	if (load_delta & ~PMD_MASK)
@@ -138,11 +139,11 @@ unsigned long __head __startup_64(unsigned long p2v_offset,
 		pgd[pgd_index(__START_KERNEL_map)] = (pgdval_t)p4d | _PAGE_TABLE;
 	}
 
-	RIP_REL_REF(level3_kernel_pgt)[PTRS_PER_PUD - 2].pud += load_delta;
-	RIP_REL_REF(level3_kernel_pgt)[PTRS_PER_PUD - 1].pud += load_delta;
+	level3_kernel_pgt[PTRS_PER_PUD - 2].pud += load_delta;
+	level3_kernel_pgt[PTRS_PER_PUD - 1].pud += load_delta;
 
 	for (i = FIXMAP_PMD_TOP; i > FIXMAP_PMD_TOP - FIXMAP_PMD_NUM; i--)
-		RIP_REL_REF(level2_fixmap_pgt)[i].pmd += load_delta;
+		level2_fixmap_pgt[i].pmd += load_delta;
 
 	/*
 	 * Set up the identity mapping for the switchover.  These
@@ -153,12 +154,12 @@ unsigned long __head __startup_64(unsigned long p2v_offset,
 
 	pud = &early_pgts[0]->pmd;
 	pmd = &early_pgts[1]->pmd;
-	RIP_REL_REF(next_early_pgt) = 2;
+	next_early_pgt = 2;
 
 	pgtable_flags = _KERNPG_TABLE_NOENC + sme_get_me_mask();
 
 	if (la57) {
-		p4d = &early_pgts[RIP_REL_REF(next_early_pgt)++]->pmd;
+		p4d = &early_pgts[next_early_pgt++]->pmd;
 
 		i = (physaddr >> PGDIR_SHIFT) % PTRS_PER_PGD;
 		pgd[i + 0] = (pgdval_t)p4d + pgtable_flags;
@@ -179,7 +180,7 @@ unsigned long __head __startup_64(unsigned long p2v_offset,
 
 	pmd_entry = __PAGE_KERNEL_LARGE_EXEC & ~_PAGE_GLOBAL;
 	/* Filter out unsupported __PAGE_KERNEL_* bits: */
-	pmd_entry &= RIP_REL_REF(__supported_pte_mask);
+	pmd_entry &= __supported_pte_mask;
 	pmd_entry += sme_get_me_mask();
 	pmd_entry +=  physaddr;
 
-- 
2.49.0.504.g3bcea36a83-goog

