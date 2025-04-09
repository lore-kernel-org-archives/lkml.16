Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700505D477
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 02:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744166729; cv=none; b=P1ReWhqob9X2V42O0VYnhZHfrijf+Xug2+MrcISVp31DqyZ1LGav9iZvfshLtC/Z3W/WlsCdX7pG2DRc9Xzyybv5ltpUQDOhhQrCPIOZxsDjINJ0t2ORMu2XpX03hbpshvbjCpdFMf++ZsXJzIypkuCZJlnkyz4rMHtmOHZfG+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744166729; c=relaxed/simple;
	bh=jo+6eIvzGalmuDox4QmAUsQ8tTuSsLCdEggb1k8ldE8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n+F1UJ2h5nUAw3ZVgNlfbElPj7vEQNpaJ3+3ZJx7vx4oOoPzosI4S6qcUD4bnIVHfGJDRFoCFpmyzjSTNXZvT+pVIUsB2GHyJzmvyK20MStSufUrMFrWM0VF08JkDMrQpLUZBq0tkHcbsJ371ySzWb/LhEO7U6ytyIrRVGqzJhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=CfWZl/CG; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="CfWZl/CG"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3054ef26da3so5008499a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 19:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744166726; x=1744771526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9nsdNo0PEJwcz9AI9dBxmI9czrIQQTsTouDYT/msKPQ=;
        b=CfWZl/CGR87SYdrZJ+G/MQ24FzJHrpCTda7LDddcq4kt7vAlaewwqQ6SLhUEvX0fPv
         ZEyD4TpsCyyhKjeDyXVh/d1gxRr+AAgY7FoFuXXPyZNC/sSWRU/jO2EQOJg+cSGA6+Dt
         JGIDmyPqImSaM2OSYxNopIuKN8vCZoEWIu0W78hIjOpaONPz6bNDoXhZ2kiZQgCnoRrm
         sT1sq/DiTPKCR3/kINnGRHdc/YEYpwKk0lsc6Rlif1ZMqnS6/dSOA2IBDFHXvQCTbz8x
         u9MtPIU0/unlfckKw1fOiyIOxC5wVMN+b9BMgMjaNR7NRgRgMluIhtFCODj5UaARHQhr
         qyAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744166726; x=1744771526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9nsdNo0PEJwcz9AI9dBxmI9czrIQQTsTouDYT/msKPQ=;
        b=Xufu/9x81sj5EA7DToTBkcJ6eQVQOyYLxJzMXF2KHh/pf74BBUbZZ+WHeEmRuL92Na
         P/u5dbkwO1KV14QNnCUEJL0BEW0Pq42mw8ouuB8WIAn/OdouSH39XTjNT7JPOt7WBNPu
         OtSGmivtmD0OCVXWolMG1Hbww3YfR+cSZX9OHj+3aN1Sq/6txIeNuFW6Is1g8Nauf/Hn
         cgAACLAenoAa8z5ZyQjajdyORRNg2N142Cm4uYRkZ7Z3YDPIKnM+9/hh7tWTu2PG+/B+
         e/nUloeuOnXEbidoSiYfzGlIfYXFZAVcm92AX6eJDVOYPNfEW6mVcXc0J8c/99hhPzJG
         Gm6g==
X-Forwarded-Encrypted: i=1; AJvYcCV0BRQUUcoEwOBDHvH/jKfW/oxPNK2Y8CtAjqPpmqqkkKVD5D62sWmURdP8GpO7/2dqEOpVwOGWm4NutV8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1svbnEsTDDCsA97ZnRqseKd2L8yQVhqncxNhxxKZZND37KBw0
	J5MA1O4pLOWO3xtgEdGHNXt3TuBbCJlPiG1wrvOs5I+qeETZU58HUVq+rgx1EwQ=
X-Gm-Gg: ASbGncsMdoMz6gphyFfudBwPIuqxNpv+Q2Oh6ZWdu3H796HFvo6ip3UtuQeCWFMb7f4
	orxoGMfp2yfjkiufbe+CTSy6o1qIHoIiIwygQQeXwxy96GbMKlSTM5sxXN4BxfjTDn/r953P363
	AcnaogxrX1bfRmSTXJomXmHBUZwDaWoasGBwyBfaNCJAFIF98lJ/Cny7iZPNT/TUvEkVjrH1+ME
	y1deBz9SrHpCromt+ADv7nVqoxdjODnLHjPo7L/hMbxiDfArM8StSscqlQU+vffVydmdLdqc2nz
	I3I9cBJYJopLF3llMLf1myOHifJ5DrllQdL0ec55opvS/UC/Xc8aMjTADnJiZY83lqA=
X-Google-Smtp-Source: AGHT+IFLGZtI/XCiZ2AL0Lvh6GdIpSXkAOPiu5RbDBnTMtlfSsuznoWsv8v3/hpYMe1aXDhC1J+4Bg==
X-Received: by 2002:a17:90b:2e8e:b0:2fe:9e6c:add9 with SMTP id 98e67ed59e1d1-306dbbc41afmr2426502a91.18.1744166726572;
        Tue, 08 Apr 2025 19:45:26 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df401ac8sm175285a91.45.2025.04.08.19.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 19:45:26 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: module: Optimize PLT/GOT entry counting
Date: Tue,  8 Apr 2025 19:45:16 -0700
Message-ID: <20250409024519.454828-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.0
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
total execution time by 99.57%. First, sort the relocations so duplicate
entries are adjacent. Second, reduce the number of relocations that must
be sorted by filtering to only relocations that need PLT/GOT entries, as
done in commit d4e0340919fb ("arm64/module: Optimize module load time by
optimizing PLT counting").

Unlike the arm64 code, here the filtering and sorting is done in a
scratch buffer, because the HI20 relocation search optimization in
apply_relocate_add() depends on the original order of the relocations.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/kernel/module-sections.c | 66 +++++++++++++++++++++++++----
 1 file changed, 57 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/kernel/module-sections.c b/arch/riscv/kernel/module-sections.c
index e264e59e596e..91d4f0fbd0af 100644
--- a/arch/riscv/kernel/module-sections.c
+++ b/arch/riscv/kernel/module-sections.c
@@ -9,6 +9,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/moduleloader.h>
+#include <linux/sort.h>
 
 unsigned long module_emit_got_entry(struct module *mod, unsigned long val)
 {
@@ -55,19 +56,27 @@ unsigned long module_emit_plt_entry(struct module *mod, unsigned long val)
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
 
 static void count_max_entries(Elf_Rela *relas, int num,
@@ -87,11 +96,33 @@ static void count_max_entries(Elf_Rela *relas, int num,
 	}
 }
 
+static bool rela_needs_plt_got(const Elf_Rela *rela)
+{
+	unsigned int type = ELF_R_TYPE(rela->r_info);
+
+	return type == R_RISCV_CALL_PLT || type == R_RISCV_GOT_HI20;
+}
+
+/* Copy PLT and GOT relas to the scratch array. */
+static unsigned int partition_plt_got_relas(const Elf_Rela *relas, Elf_Rela *scratch,
+					    unsigned int num_rela)
+{
+	int j = 0;
+
+	for (int i = 0; i < num_rela; i++)
+		if (rela_needs_plt_got(&relas[i]))
+			scratch[j++] = relas[i];
+
+	return j;
+}
+
 int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
 			      char *secstrings, struct module *mod)
 {
 	unsigned int num_plts = 0;
 	unsigned int num_gots = 0;
+	Elf_Rela *scratch = NULL;
+	size_t scratch_size = 0;
 	int i;
 
 	/*
@@ -132,9 +163,26 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
 		if (!(dst_sec->sh_flags & SHF_EXECINSTR))
 			continue;
 
-		count_max_entries(relas, num_rela, &num_plts, &num_gots);
+		/*
+		 * apply_relocate_add() relies on HI20 and LO12 relocation pairs being
+		 * close together, so sort a copy of the section to avoid interfering.
+		 */
+		if (sechdrs[i].sh_size > scratch_size) {
+			scratch_size = sechdrs[i].sh_size;
+			scratch = kvrealloc(scratch, scratch_size, GFP_KERNEL);
+			if (!scratch)
+				return -ENOMEM;
+		}
+
+		/* sort relocations requiring a PLT or GOT entry so duplicates are adjacent */
+		num_rela = partition_plt_got_relas(relas, scratch, num_rela);
+		sort(scratch, num_rela, sizeof(Elf_Rela), cmp_rela, NULL);
+		count_max_entries(scratch, num_rela, &num_plts, &num_gots);
 	}
 
+	if (scratch)
+		kvfree(scratch);
+
 	mod->arch.plt.shdr->sh_type = SHT_NOBITS;
 	mod->arch.plt.shdr->sh_flags = SHF_EXECINSTR | SHF_ALLOC;
 	mod->arch.plt.shdr->sh_addralign = L1_CACHE_BYTES;
-- 
2.47.0

