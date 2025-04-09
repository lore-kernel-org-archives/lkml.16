Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D18276053
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 17:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744218934; cv=none; b=OIcBQtWZUDf8XU0KAYEmRF613HUPWfqYA63nIrYpfhi9VjfGeTHJn5ukblF5rNwC/VwGxCF7NZfnHDT+32d80mBxcucxJ9c15SVkMBpSvh8E9yM8KuDyT1toHD+A73quUgsNwtJZo76qqjFuFUzRX6+GGSDzWAYSrh/rTVtDWOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744218934; c=relaxed/simple;
	bh=Fp6S8WJqulCwlnqokgV0OMxQ7fnCxtcBFX6ZxX0rdl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G9lgaxA4cpsiBSXoPi+rIPT6l4mEuXCVcVBzb0KvlRuyynnn6y+2az5RpP1c8LDP6Lj8CutVZ6aMU/+cYLMYB1E6Y6POe18FxYKm0Y0je+qmlbp/UhBFywdudt3MgugeeLCsNbXxifCLcvl/Twd22cG6q32quY1yE3yNXO5EFZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=Ehb6WSSZ; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Ehb6WSSZ"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-301a4d5156aso6739276a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 10:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744218931; x=1744823731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qFPrlzz/n+RwD8yf+7zZ/+ii8EhBJMcDI7KV/D+3zyI=;
        b=Ehb6WSSZxAKvW/nm6PelwevUp32xnvHLzXce6BihhvAJjN9ZFV8u1072qwrzlXA4P6
         lVmgI9+93jAdDxc8Q7+lWwi1ZguysJhwnvo5m4KQSBTHMCmYLNOTKDBQAtXmxRNnYOBC
         /8QqgOcOyEYd2uX1jcodO6zUDjKJjXepS9l6WD/eQU+tKrefHUCphVUTJh+muaTBdWFq
         /bnvJ8ZFmryTK2XHw5apn4x0NYJzrtqgkNRzVfcaENV5TGsL+p296wCGI+VrSnOa2wEn
         /A7CrqVHI70tHLt4RgqO7Az9tcMbTRMugh6ApDSZb+q7e+nIPMNLeNWBYwcQ0YLaEBo/
         AeEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744218931; x=1744823731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qFPrlzz/n+RwD8yf+7zZ/+ii8EhBJMcDI7KV/D+3zyI=;
        b=aXom1XxqWffJQYyMChPSmfiLktJk52MLzuEAq/Jjwgh3cfWye2XQLXK6KL90R3cVqv
         KoI04RGxNRz3lQCb239nx6DGacWghHcUrGt6qMK66B2Izziou+AwSXPNq0YFj47JEFiR
         LuJKrhltcBVZJwSuXlu+JtFVRAWJMB+1sYLPJVguX9EgqkIRR8Mx7jdiRrglNgDgHgx2
         ceDtzufbtloy+96/TL+md3uNEy6RA7NDm9L1CfhrSztll251TUP54dZ2FDtJyhh513kR
         S3W9+oFFhcdP+CrPfsIcg9hMCerinXN7bWHjQ9KkiCK6PySjrLrohriNGoKaC+XJRWxn
         8ryQ==
X-Forwarded-Encrypted: i=1; AJvYcCVm7ty1RQWrItBmZtVy0QUV1kwkWoJ90K0g8f8RsTNxkJNjN3FEpc0yWSirRfJbmad7vPkvuyUZeZXsw1g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaPWG1z6IshePZqzNx6O+JBSYioxFFoAE2iv5iIc8ecSULJUtv
	2HqTA0NSSBHsgvVtMevRzdrPGZHp8/qNeEQPiIPYKRCUS/2y4exPwkEjNv3ibOk=
X-Gm-Gg: ASbGncuNjWkHG66bKM41NpByZCOmelmCiwih32xU7U7dUC7kmw3/ZNaWKZuo+wQ2muW
	LzSfw2Y6RL5qM+SGJulrP5kwePFPYjgBNGP/tP+jrKOlbKlDhtyDX3bk48i4ZRD2InLaXOlgylD
	ZLYyb/XaJz6mnPfQI+e5R9MO/7ZqVV2B8khLtURRXyyo6Jxava80wtSKl9OZatenjAO73msrxYU
	G5qF5R1xmoLHCZlTsO4QA1ZrQgTVjzc4bLZ02IgzzrgS1pMPY7ZSPTl450JXDawXswP+tRYlHz0
	fLiCVM+Qb2yEskixNt2g1d0eZiUGLea9G4kiHEmoEF3k+DH8rKVCMrgjmgfoN9Y=
X-Google-Smtp-Source: AGHT+IHRP9hWpUntdSIJBZZcXEjgmEnfTQCM+e2p6uXonIEb6B+dADlcAwWwWKuA1sQVweJt1rEmuQ==
X-Received: by 2002:a17:90b:1d4f:b0:2f9:c56b:6ec8 with SMTP id 98e67ed59e1d1-306dbbae06bmr6262426a91.10.1744218930725;
        Wed, 09 Apr 2025 10:15:30 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df400ab7sm1721650a91.47.2025.04.09.10.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 10:15:30 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] riscv: module: Optimize PLT/GOT entry counting
Date: Wed,  9 Apr 2025 10:14:51 -0700
Message-ID: <20250409171526.862481-3-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250409171526.862481-1-samuel.holland@sifive.com>
References: <20250409171526.862481-1-samuel.holland@sifive.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

perf reports that 99.63% of the cycles from `modprobe amdgpu` are spent
inside module_frob_arch_sections(). This is because amdgpu.ko contains
about 300000 relocations in its .rela.text section, and the algorithm in
count_max_entries() takes quadratic time.

Apply two optimizations from the arm64 code, which together reduce the
total execution time by 99.58%. First, sort the relocations so duplicate
entries are adjacent. Second, reduce the number of relocations that must
be sorted by filtering to only relocations that need PLT/GOT entries, as
done in commit d4e0340919fb ("arm64/module: Optimize module load time by
optimizing PLT counting").

Unlike the arm64 code, here the filtering and sorting is done in a
scratch buffer, because the HI20 relocation search optimization in
apply_relocate_add() depends on the original order of the relocations.
This allows accumulating PLT/GOT relocations across sections so sorting
and counting is only done once per module.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - Include R_RISCV_PLT32 relocations when computing the PLT size
 - Accumulate PLT/GOT relocations across relocation sections

 arch/riscv/kernel/module-sections.c | 81 +++++++++++++++++++++++------
 1 file changed, 65 insertions(+), 16 deletions(-)

diff --git a/arch/riscv/kernel/module-sections.c b/arch/riscv/kernel/module-sections.c
index 91d0b355ceef..75551ac6504c 100644
--- a/arch/riscv/kernel/module-sections.c
+++ b/arch/riscv/kernel/module-sections.c
@@ -9,6 +9,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/moduleloader.h>
+#include <linux/sort.h>
 
 unsigned long module_emit_got_entry(struct module *mod, unsigned long val)
 {
@@ -55,44 +56,70 @@ unsigned long module_emit_plt_entry(struct module *mod, unsigned long val)
 	return (unsigned long)&plt[i];
 }
 
-static int is_rela_equal(const Elf_Rela *x, const Elf_Rela *y)
+#define cmp_3way(a, b)	((a) < (b) ? -1 : (a) > (b))
+
+static int cmp_rela(const void *a, const void *b)
 {
-	return x->r_info == y->r_info && x->r_addend == y->r_addend;
+	const Elf_Rela *x = a, *y = b;
+	int i;
+
+	/* sort by type, symbol index and addend */
+	i = cmp_3way(x->r_info, y->r_info);
+	if (i == 0)
+		i = cmp_3way(x->r_addend, y->r_addend);
+	return i;
 }
 
 static bool duplicate_rela(const Elf_Rela *rela, int idx)
 {
-	int i;
-	for (i = 0; i < idx; i++) {
-		if (is_rela_equal(&rela[i], &rela[idx]))
-			return true;
-	}
-	return false;
+	/*
+	 * Entries are sorted by type, symbol index and addend. That means
+	 * that, if a duplicate entry exists, it must be in the preceding slot.
+	 */
+	return idx > 0 && cmp_rela(rela + idx, rela + idx - 1) == 0;
 }
 
-static void count_max_entries(Elf_Rela *relas, int num,
+static void count_max_entries(const Elf_Rela *relas, size_t num,
 			      unsigned int *plts, unsigned int *gots)
 {
-	for (int i = 0; i < num; i++) {
+	for (size_t i = 0; i < num; i++) {
+		if (duplicate_rela(relas, i))
+			continue;
+
 		switch (ELF_R_TYPE(relas[i].r_info)) {
 		case R_RISCV_CALL_PLT:
 		case R_RISCV_PLT32:
-			if (!duplicate_rela(relas, i))
-				(*plts)++;
+			(*plts)++;
 			break;
 		case R_RISCV_GOT_HI20:
-			if (!duplicate_rela(relas, i))
-				(*gots)++;
+			(*gots)++;
 			break;
+		default:
+			unreachable();
 		}
 	}
 }
 
+static bool rela_needs_plt_got_entry(const Elf_Rela *rela)
+{
+	switch (ELF_R_TYPE(rela->r_info)) {
+	case R_RISCV_CALL_PLT:
+	case R_RISCV_GOT_HI20:
+	case R_RISCV_PLT32:
+		return true;
+	default:
+		return false;
+	}
+}
+
 int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
 			      char *secstrings, struct module *mod)
 {
+	size_t num_scratch_relas = 0;
 	unsigned int num_plts = 0;
 	unsigned int num_gots = 0;
+	Elf_Rela *scratch = NULL;
+	size_t scratch_size = 0;
 	int i;
 
 	/*
@@ -122,9 +149,10 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
 
 	/* Calculate the maxinum number of entries */
 	for (i = 0; i < ehdr->e_shnum; i++) {
+		size_t num_relas = sechdrs[i].sh_size / sizeof(Elf_Rela);
 		Elf_Rela *relas = (void *)ehdr + sechdrs[i].sh_offset;
-		int num_rela = sechdrs[i].sh_size / sizeof(Elf_Rela);
 		Elf_Shdr *dst_sec = sechdrs + sechdrs[i].sh_info;
+		size_t scratch_size_needed;
 
 		if (sechdrs[i].sh_type != SHT_RELA)
 			continue;
@@ -133,7 +161,28 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
 		if (!(dst_sec->sh_flags & SHF_EXECINSTR))
 			continue;
 
-		count_max_entries(relas, num_rela, &num_plts, &num_gots);
+		/*
+		 * apply_relocate_add() relies on HI20 and LO12 relocation pairs being
+		 * close together, so sort a copy of the section to avoid interfering.
+		 */
+		scratch_size_needed = (num_scratch_relas + num_relas) * sizeof(*scratch);
+		if (scratch_size_needed > scratch_size) {
+			scratch_size = scratch_size_needed;
+			scratch = kvrealloc(scratch, scratch_size, GFP_KERNEL);
+			if (!scratch)
+				return -ENOMEM;
+		}
+
+		for (size_t j = 0; j < num_relas; j++)
+			if (rela_needs_plt_got_entry(&relas[j]))
+				scratch[num_scratch_relas++] = relas[j];
+	}
+
+	if (scratch) {
+		/* sort the accumulated PLT/GOT relocations so duplicates are adjacent */
+		sort(scratch, num_scratch_relas, sizeof(*scratch), cmp_rela, NULL);
+		count_max_entries(scratch, num_scratch_relas, &num_plts, &num_gots);
+		kvfree(scratch);
 	}
 
 	mod->arch.plt.shdr->sh_type = SHT_NOBITS;
-- 
2.47.0

