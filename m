Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86B920E00B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 06:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749104134; cv=none; b=Bk1VsLMGm7r7As1BX51xnFqyOfZGvvw8z1kg8e190jNg3iltwUL2Vio+niFz3X1Vdwx+FHqFXQ3lAvAXZbMbAWbtPvE+F8R5PIGJ+sziTch0nGR8/ZxD9civ8pwsSOnHE+1n/gOa0qrGbPU50P9CTQjz19V4EnPUP3KskTiv4xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749104134; c=relaxed/simple;
	bh=vt95taIBAE6xHdLS/+LEWFyOT14BvSlPFxy5vZtFS28=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OcwVWF75e1AaX0rz0D/PqYucpjBDNLXEAkMeDruQQA6mx2GeuvKMGCETT0QwsB1iBZClIqPUKYvacaX+nKNMBNMX+mQcaVVHiZdMa+Wsz5Muyv3LOWpOdLzPFrq66JFizljf1WN3jPRX9dUQGxD7IVj+kbH4AP4UrfVWP7szsN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Ylf3eFcf; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Ylf3eFcf"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-312a62055d0so651550a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 23:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749104132; x=1749708932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=297HQlUGPdF+XZ67B7Ks8toSmyeODGGOfBIq41lD5gM=;
        b=Ylf3eFcfpnwCoYDdQCw8fmtYL6IHSxyfO7JtwA0xf0h0Re07jV+2ps1edN4QR2zaZM
         SWyld5q1sBej93iRQfKFyAazCSzorUvC2khIyUf49HzcOnimINKp9aCmUsorRQWt42sK
         WHbjdVi1gPurDHfEhFPUNERSY1nPHMkAmhT5F+gzEEfpkRVSM+77EIDP+uMVAsAmHbFa
         NFkXcLdAhjEToMyAA3fJEx8JHLL9AOS2/W9p7im00Lo/jGrboL4v73rfWGQBvUDa0TA0
         2TVJyfsQ3ktM+a0EgSyb7abta1QaNJeLyyQeY0XqwC4XjFxsbvzR2H69wSH/QCdsTQDU
         lbYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749104132; x=1749708932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=297HQlUGPdF+XZ67B7Ks8toSmyeODGGOfBIq41lD5gM=;
        b=V3KqJ+fBmabWotEtvjXBoI2QFpxRsqQNrZb3R37ChtPczd4gvRsQ62axKgwtSTL2PA
         zpUHwLDySrL9M6w+JoLS1JEuhbeMm+TdgR0UaxXLP5PYPWkitDQgBsSQCySRdM9K75/r
         7AHdSGd+3HsQslS2g2+1J/MhXKJgJNB6xdsEGd0kSDQBcpvZdsQA/QBvkqX/Md0Uo5Hn
         68am+w/VVf48Vvnam32yzKydTdaB98FrgUcaxM/TC9JDy1CB+Fqxx8dDomGjxL7Qf3Lh
         c2aUspEeeTXqyxiGnS1qrwSd6TX4ZRN/UM564bK2o2jqxkPeCRaDTI3Sjea1Flx9WtCk
         G5EA==
X-Forwarded-Encrypted: i=1; AJvYcCWjNVxBN218xjiuiyYy2w9RRKXt0i14GN8+VNkjTt18svC+0SWRe0vXq8na0viWygGCi3m3vtNPg02z/Q0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+dn8+7aqhTR0FmHfbU5BomBMj3FVuNLVuNZw7DWbG86uzaqyb
	9EoBXoLOHQxrRkJf5gpx3vJ0XdaqSsocIwYIeP+nFGTrwpWdFhA70VFt+J7Hymiqcmk=
X-Gm-Gg: ASbGnct8+1r70Q5BEoqF7tLtwqlRuC01n2aYIlHtV/Xtvd6AK+fYsN2SoKnfgnsHEXA
	SrL9uEddLVK0/XLrFohmBHVcvIPJ52HKlQRC0fXWyJSG8PU/nzkIMmdayPRmdZgdSXhP404PAfK
	LuqjtZ8dwNpaUrQ3z3nGocmFtfdh2nTI/lkhU73fVqCDZGTi9WRIdq1ykwE2+7MOq3hc0VXyweh
	/8qFtDwNNcwD7aGxhG1tdj9BcdsvkyaSvtayPKFk3qfBIF9J62HyBF5dE9gKHoz9MUiY3ncEmF3
	Nlcfizgf3tCfJgRQZ0mMwRL3v/7IeQTVWv0dxzFhCxhTez5M5C/vYP4mFQWmHT78zhNUAkrh6/c
	h+HwPFQ==
X-Google-Smtp-Source: AGHT+IGaQDp4t9Rc9PacdM1BZZoSLCIgCU7kc4zabKe3J73B2NovkDFU1CUL1ahoIxkagRn4o+A2cg==
X-Received: by 2002:a17:90b:2641:b0:311:9c1f:8516 with SMTP id 98e67ed59e1d1-3130cd2c648mr8923161a91.15.1749104132103;
        Wed, 04 Jun 2025 23:15:32 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3132c0bedc7sm716026a91.49.2025.06.04.23.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 23:15:31 -0700 (PDT)
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
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 07/13] RISC-V: KVM: Don't flush TLB in gstage_set_pte() when PTE is unchanged
Date: Thu,  5 Jun 2025 11:44:52 +0530
Message-ID: <20250605061458.196003-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250605061458.196003-1-apatel@ventanamicro.com>
References: <20250605061458.196003-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The gstage_set_pte() should flush remote TLB only when a leaf PTE
changes so that unnecessary remote TLB flushes can be avoided.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/mmu.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 1087ea74567b..d4eb1999b794 100644
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
-- 
2.43.0

