Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6830211711
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 06:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749104138; cv=none; b=Wdt/bn9ez3LecINyIX9cyreLg/kQsjHbQ7Xi76gsiuHB4/UAzBdjlHbcaIZ1OrYexi5DwUlc08KDr/QGYPkW9pJvCnw97N+1CPqJyPZLeqMzrNhDaxoPm1eAw/1U5agPWcJRFBEA76IccDSXg1V6lo7qKcxr6lzuNfMDg2WwESE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749104138; c=relaxed/simple;
	bh=vyBV2F4KyvtMk4LF2UAhi7qqpyH1rZyaYbpSJb6E0Qk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D9fIPLT/HpRIFxHSSLFknwFIVhv/UmF4JChTDxIIS2vgiXAErY8cYpI8sHXXcqzG/BQB/R327FQ+H1MosDnXp7mk6Sp2I2knVA2N6srd7oTPKJ/E6TH0iW9ta6WWOJzyouQo7Gx+nFRiaChxIeYPtEqllg9Auv5dQsIuDFfxSMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=iZdk4X4m; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="iZdk4X4m"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b26d7ddbfd7so718435a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 23:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749104136; x=1749708936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PBw4EHffUTV31O6B+TCgyeA+gw4sP4Qg6j7rVTIEdxU=;
        b=iZdk4X4m5u2KioQUq6G/a/rYk1gh/N94aLc1P44UURo44p1doVGMqCtfD6uII6sjfs
         3M1Xrls/bX0eudl4bnRwhM2KB8BvQxvwRRClXdvFKeZbP8GzV9xymMuxspxKX444Zcbr
         9/Lu945kVntppYO7Bortsn2X6wZjCXbe3mBZHTOgJFgaq/65z/teVA4YbTwOObM9SSX3
         +y6B7UoniFS2WB173CIP2jepTGaDFGghc+UfWx/msGlx1p96iDkMab1TxpygclD2jgMx
         ebmQ7A4Wkjh9c9AyTxbCZPLcZlkjQNye8wQppoyG19GsasRi5LQyFTPf0eXfVhG+OLq4
         NJfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749104136; x=1749708936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PBw4EHffUTV31O6B+TCgyeA+gw4sP4Qg6j7rVTIEdxU=;
        b=V9X3CbiSOKrHqGDWZnWRX8yBZEegTlrAiMGeuwQpVCkTVchppwoWYbA37y7LJIXYbp
         6bPOMlonU27ViWugc3OQ/wJEaEuj4wotdFd/SWJUACrl2G5emLFo/uWLI7AJnSNyPzu3
         U7/6etrD3y5DxYewLjdM1+gW5GZ03LFDbmxWQY8kCGTpxRVLzzBy2/nqL3J8tnXBaF7P
         krXtGkCQVFUm/hEBuzTL6KcQvpjwNtVASSAfgtNNgxICPWlhxicfYmPXaKRENKQbWujn
         qdkWfZ0mK6P9QYYT9POkXwCjg7quTogriy+T/pk+b1asKzkkJ7OAzZUD8mzJM1AYMJlr
         Gmwg==
X-Forwarded-Encrypted: i=1; AJvYcCWDhW3E4tF8QAZlyGGc+6j7g1w1KPQNhsB1mRPlLzLxyXfdrrzKYtKtAIQsqOJKsAcWnxmLI7XFzBF9cEw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyY0xNljzTBulgtR1ZqyziB5yo64vcGGHvTPw2fdCjwifndJbwL
	06QrP09SqHHig4KajtadaXmUqQ79a/d7HHSn45FS0+1/BDMl94zc44HecrkgPXQwnDI=
X-Gm-Gg: ASbGncuoLrkgYJnOk+RF0lgan4aZBGX8saGuEfmmjbEIalFbxwMP0Sos697ScRH9DDY
	LfsXBBrFsEsaolEMOQ/Y6d9vqvRj1X0UwWo/JtJeFXNfsnurRiQEQPo2C8nfRoWzbHkhpE9B22m
	v4lXj3fCXyw5gtwtFZw83jw/ocoWNp5ZEmeb8r99kr0qhbS/q/gBvcH9SXO+sIjT+84vh8tc1EU
	2FhpV792ZXxBhNhLs+MC8/KYcPMA3Bc5u7JhJ30G6/EhkXOJQpUY5qkeUZvHIRmQWauBZjaHHhg
	XvzlhUn8dmS25cklX7xDnz2ZRZ/rjU+3GO2w27OENAxuspo2RqZasZdSYhFXEojr3woIYK4Xo3X
	sCP3mgVcu2jKcjbnxA5bH+xCq4Ts=
X-Google-Smtp-Source: AGHT+IFD6i36g3dYe1k+gDLGsx1D0hcp/ZxtNU3y3iDfAyRruAl8oD12KxZBz84WYVYtRaZXIXAJqw==
X-Received: by 2002:a17:90b:3ec7:b0:311:9c9a:58da with SMTP id 98e67ed59e1d1-3130cd12ba3mr8390187a91.8.1749104135972;
        Wed, 04 Jun 2025 23:15:35 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3132c0bedc7sm716026a91.49.2025.06.04.23.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 23:15:35 -0700 (PDT)
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
Subject: [PATCH 08/13] RISC-V: KVM: Implement kvm_arch_flush_remote_tlbs_range()
Date: Thu,  5 Jun 2025 11:44:53 +0530
Message-ID: <20250605061458.196003-9-apatel@ventanamicro.com>
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

The kvm_arch_flush_remote_tlbs_range() expected by KVM core can be
easily implemented for RISC-V using kvm_riscv_hfence_gvma_vmid_gpa()
hence provide it.

Also with kvm_arch_flush_remote_tlbs_range() available for RISC-V, the
mmu_wp_memory_region() can happily use kvm_flush_remote_tlbs_memslot()
instead of kvm_flush_remote_tlbs().

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_host.h | 2 ++
 arch/riscv/kvm/mmu.c              | 2 +-
 arch/riscv/kvm/tlb.c              | 8 ++++++++
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index afaf25f2c5ab..b9e241c46209 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -42,6 +42,8 @@
 	KVM_ARCH_REQ_FLAGS(5, KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
 #define KVM_REQ_STEAL_UPDATE		KVM_ARCH_REQ(6)
 
+#define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS_RANGE
+
 #define KVM_HEDELEG_DEFAULT		(BIT(EXC_INST_MISALIGNED) | \
 					 BIT(EXC_BREAKPOINT)      | \
 					 BIT(EXC_SYSCALL)         | \
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index d4eb1999b794..834d855b0478 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -342,7 +342,7 @@ static void gstage_wp_memory_region(struct kvm *kvm, int slot)
 	spin_lock(&kvm->mmu_lock);
 	gstage_wp_range(kvm, start, end);
 	spin_unlock(&kvm->mmu_lock);
-	kvm_flush_remote_tlbs(kvm);
+	kvm_flush_remote_tlbs_memslot(kvm, memslot);
 }
 
 int kvm_riscv_gstage_ioremap(struct kvm *kvm, gpa_t gpa,
diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
index da98ca801d31..f46a27658c2e 100644
--- a/arch/riscv/kvm/tlb.c
+++ b/arch/riscv/kvm/tlb.c
@@ -403,3 +403,11 @@ void kvm_riscv_hfence_vvma_all(struct kvm *kvm,
 	make_xfence_request(kvm, hbase, hmask, KVM_REQ_HFENCE_VVMA_ALL,
 			    KVM_REQ_HFENCE_VVMA_ALL, NULL);
 }
+
+int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm, gfn_t gfn, u64 nr_pages)
+{
+	kvm_riscv_hfence_gvma_vmid_gpa(kvm, -1UL, 0,
+				       gfn << PAGE_SHIFT, nr_pages << PAGE_SHIFT,
+				       PAGE_SHIFT);
+	return 0;
+}
-- 
2.43.0

