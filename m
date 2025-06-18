Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE01D2E54C3
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 11:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750246572; cv=none; b=uCTbO9c/+5iiyL+fhT2uUBjPG0J4yKL5aMnvBLP5hNo42GYqhNcznE2QziH45XsDv/rbkgryLWAd4BNRYd33wRiJ7kAawdQZzgGyYJxYCSOQZdElAowTkTb8OfxQplqgFI6EKc5TjsTjERrvNghvRFNnfLPJFyPXSBL4yAUy5S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750246572; c=relaxed/simple;
	bh=Tt/vawDYZjRbm2u92sK4nUF168I+VRBgzlUXAX+PzHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nC3G6PHTNgTomQBI2/3ZsReH+GqLy2HGa3eYcEBbtSVp9iG2xjIc1YMsD2qHb1ixqMmXxBZk2OpNcNnSf18fP8GWMGx+ULWZj/Qc2bDk7m1OCfcAZMep1sfR0JhCpRSsh1u0bXX5s2w06QH4CwrWYdwq0GIuUsyVqFI4T0s0Umw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=bHDqBI3/; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="bHDqBI3/"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b31d489a76dso150595a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 04:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750246570; x=1750851370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ernJHGr8wUUltKH2OhtBcW3LIbI4jpB3xEJEU1yumiA=;
        b=bHDqBI3/PWOj7OXSVPzXvwS7SPoaJQK5RH8Zse+fTrPR+8WqbemX+ffo5io9sz/fQT
         ndWr3cT+1XY5wCXuI0zdIinvJ7Jrqkr/BUZgKZeJhThOf5G/ioTleTg37BSheTEMdrrY
         f+sqYkYHnYSZyKo54BmSPIK/C2iZAgoPj152CPD1a0sKETReSO9ouwc5pz+S6BGYiJGB
         rE4SC0XYyGOeqahW6T9eoWcmeGlLvAwUna23BwZQi6biKeJTB0IWEcrLyRT5aDSdybon
         zj8cPZyJg3NIP89d1Hl0mrFBEM2/VvoUxOSr0P/Wfn4WM10CqjnpwRvx9q+qGnPzSUEG
         UA2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750246570; x=1750851370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ernJHGr8wUUltKH2OhtBcW3LIbI4jpB3xEJEU1yumiA=;
        b=egWvKEPKhDZtA09V3ECZyXhnVrO/awOvgFvDLxg1Jfbpr9e+cWPSoMBcrRoOvuk5mI
         bL25/JybzNspRpVM4BG6O1BGkZJ0flvtTtlB2Ut+Eovprq/n6FOHbRTHW1pXy0dl7wk2
         z+sbJea2gM2ZKW6L4jFOubFYUEvNj3J/Q22KeQKvuVN55NZrIiN6rkIMyq0vkFxj+tr6
         og8J2AO3p1VINHfsP8PW3ABA6Hl3McBZwi8pGEftPwXzokIMfKzeV6sPtH0KTWtJz2uv
         t3DYWFRJe+hTdk0aDpZ2oCOkacFKCa8iHsrL/w1MH+5FeG0WPuV4DgoAS+2NqFp6SaTA
         xlqA==
X-Forwarded-Encrypted: i=1; AJvYcCW+NTvb/K+8057HR+Uyfyc0HPgiNo408c/QsVlX0rdZmSH07V7jU32yr1AcDOr4xGFBIFGsUt80AOUbvrs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0Zp2X9U8qQGEagNt4pgCm3a84o1gUd2rCaUjo+wGrOsXgVrZz
	s2usQ3KXY0+jLxKS+28g+sMbqq23xLxUfIEiI1I001j2ot39AzzK1QBjD4ahYbunoqs=
X-Gm-Gg: ASbGncuUbY1aZOeiK9iZy71HV/c1Kki2fhfhE68uafks+7EEGidiF7QQVzyc3IuwxtO
	+Emq11EqHqvi4/83wNy77s9WDCmNpD5Z66jTbhDH1XQQTeBUM/8yVd4ppzPiTNEEo1pjJpi0Ne2
	ZCwZYK34NsLNi1fgLxaJaf719OLa9v7oJq9NofK6xSbOu1dQ3y78dkOSEsupAucymK7aGO3Qqw5
	sL2vRBtiJnjSA9xWxiudwIbjwoojDzX+IzNGKTs9Dd2ZyhRijS6rEOXWnQuWMEWsSI/1PLSCyUo
	xefbNe8VezjCz7RltZfpw1ht/4/6+IfZSwPl3ShbpUQYwAbesXmoGIeKWMed72BN8msNhaYSyp3
	tC2Z0PkYB4wGtnj5U5L+o722WpB8G
X-Google-Smtp-Source: AGHT+IED2oGexk/JFxqAVuWpL/++/t8pIqk6FimHQhJH+vt07+Mbc0bPBQs0X+EavqGGcAYnWQlaQw==
X-Received: by 2002:a17:90b:1a87:b0:311:abba:53c0 with SMTP id 98e67ed59e1d1-313f1c03004mr26620231a91.9.1750246569846;
        Wed, 18 Jun 2025 04:36:09 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237c57c63efsm9112475ad.172.2025.06.18.04.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 04:36:08 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v3 05/12] RISC-V: KVM: Don't flush TLB when PTE is unchanged
Date: Wed, 18 Jun 2025 17:05:25 +0530
Message-ID: <20250618113532.471448-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618113532.471448-1-apatel@ventanamicro.com>
References: <20250618113532.471448-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The gstage_set_pte() and gstage_op_pte() should flush TLB only when
a leaf PTE changes so that unnecessary TLB flushes can be avoided.

Reviewed-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/mmu.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 1087ea74567b..29f1bd853a66 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -167,9 +167,11 @@ static int gstage_set_pte(struct kvm *kvm, u32 level,
 		ptep = &next_ptep[gstage_pte_index(addr, current_level)];
 	}
 
-	set_pte(ptep, *new_pte);
-	if (gstage_pte_leaf(ptep))
-		gstage_remote_tlb_flush(kvm, current_level, addr);
+	if (pte_val(*ptep) != pte_val(*new_pte)) {
+		set_pte(ptep, *new_pte);
+		if (gstage_pte_leaf(ptep))
+			gstage_remote_tlb_flush(kvm, current_level, addr);
+	}
 
 	return 0;
 }
@@ -229,7 +231,7 @@ static void gstage_op_pte(struct kvm *kvm, gpa_t addr,
 			  pte_t *ptep, u32 ptep_level, enum gstage_op op)
 {
 	int i, ret;
-	pte_t *next_ptep;
+	pte_t old_pte, *next_ptep;
 	u32 next_ptep_level;
 	unsigned long next_page_size, page_size;
 
@@ -258,11 +260,13 @@ static void gstage_op_pte(struct kvm *kvm, gpa_t addr,
 		if (op == GSTAGE_OP_CLEAR)
 			put_page(virt_to_page(next_ptep));
 	} else {
+		old_pte = *ptep;
 		if (op == GSTAGE_OP_CLEAR)
 			set_pte(ptep, __pte(0));
 		else if (op == GSTAGE_OP_WP)
 			set_pte(ptep, __pte(pte_val(ptep_get(ptep)) & ~_PAGE_WRITE));
-		gstage_remote_tlb_flush(kvm, ptep_level, addr);
+		if (pte_val(*ptep) != pte_val(old_pte))
+			gstage_remote_tlb_flush(kvm, ptep_level, addr);
 	}
 }
 
-- 
2.43.0

