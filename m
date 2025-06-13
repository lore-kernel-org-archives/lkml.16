Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E3D25E464
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 06:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749797909; cv=none; b=NUSBQnBYcNyAvzl5hlIGjT0m+8VVbzlH+h5OpnRbBPXbLBLri3MHvvpEVy27RlSLRwVsHkQbQmZWefttngz4kBAn2pu9B6QFaNJyRIGdOQPfRIyWUyMb+JFGjOd5REwbeNcokj07K99Y8M8ZzOC7F3SOPHzE6Jt1wNirFXpCswA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749797909; c=relaxed/simple;
	bh=qTPZRepGLDx8d3DYNhCymSXfQSTRSyyKFvfeW+3S2AA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bx02M7xmZEgt+kvqRikenNIrMN/7K+Ms0TpAPBYPwegS8i+G6lzbJpnpsA3KwcwRHV8w3l21ur45T4Kkdlo9t9yf2BDV/XvvjgTH4tcoV99PvtJDYQdeN9FOINKrmjldUJFlIOkALWlCSIdq/bvHlu5NUq9X6iqW264zv1RyeD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=gtjJGXfp; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="gtjJGXfp"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-31393526d0dso1339141a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 23:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749797907; x=1750402707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x9NuUqyMjDjOZ8RZ5AE6YpvMfKBxH1jx9BmTdXWsOf0=;
        b=gtjJGXfpiXGwTK7oENzX7mCPiRVNvNLhV5Et5pgvxhM9hGwCKqAIVtpeTQbBVEhVTO
         1Gi/YLzkHDo2qMesuleDicqYu7Bmty6Ea64RNsoTsRiSAYvG0QQ4uYKNKwPIYj9nfIAw
         AFkbKbHxC3cesIPsdcznWDyrBHjMKCQVWC+rKdV9tx6WGp0VAYKbwoijBFrzavIViwdi
         1whXwll/rnSaaP/qZGT6CTzTN0k+rsz90FT+FTExMTR2v7FgGCY+MImmxFuz+qAUOlNv
         IicPDTUfuVKrpeT1YK63t78aXPWfJEbX9qaOYV/EYY8anRZw/cJ70zN+uhV27XlN/Wf9
         wLmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749797907; x=1750402707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x9NuUqyMjDjOZ8RZ5AE6YpvMfKBxH1jx9BmTdXWsOf0=;
        b=xOY/bxZPXPImT9XT9sWQjNX7I4JTNSq3+hX02L6JSCkE7iJwpFHQFxJxULXFgdy4ap
         vaQWy7Q9rcbMqN2ngCXUsjKEbMkAAkN9NjnMtrAmNDlmH6cc3Aw4ASHzvr0y4nd1HhPe
         3FmftV9Gd4d02j4666YZMRBFZfShVlcdQKUBw8eO7KVJAB0x+w5O1W5+iU7wsN1F7cbF
         8rVMAqwNg4FSpMDBrA7MjnrDCodD4vgi8jVdZ49jy8YBn5yDxEruhXjxdqB0DCz60bMT
         jSXB7sR9BCzcQrwA7XO94QQ2Gy32DVKNAgrTsJrQbpFPVEhRdl1MWa2OZkh/Dth3gfQa
         0LcA==
X-Forwarded-Encrypted: i=1; AJvYcCXClZdx1ishRKG3XtoTIQTyr6aA8d5oCYDlbzqqLpyJonhYYx/1v6nedJwFpYo2pTCn4gXDfvh3x3r2F3k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyS3VbZcH01YX4/cCM6E8ZG0Q5QTp3PRsHXSWpNS2m0D4WI2Npt
	e8ghRqxq0OYh/GOY9XrXtDaxUemyiNT5KEahuaU3Y0zq69OOKpLXB5xFGiWMP4vYqzY=
X-Gm-Gg: ASbGnctmS5Ggm1+8myOVX3QxGq8fiMJuWLypavlxEL0LZNfQ8pFQG2PF3qQSbEabWLb
	hmNQDUs7jfSFNDJNMPDjFEUdhnYnBOVqebLjB5DigA51N5Q0pdU321obiXpG5R8aGR/UGAjol/7
	9J1l+1NLoXB7XrKTPDtF7Qpll3PF31wF8bCqO4fqN9qyek7IGqKKmmbaQyroYC6HzY2MM6r2+vL
	LB0FiBXbl2IYyX5bHDYIZdkeO/XfIfl0Qk014/179bF6olQ512j4j3JI0ZwwgoKv6V+i5g9Clr+
	I1D+zkuMDKGI6y10rYmHAR0f8IhZG3A71dqSzCOy64bF2WjRTG+/+V5MRIR1izztdt2MTNbDrOx
	1ZnJOlUKGMEmcWkAJfoY=
X-Google-Smtp-Source: AGHT+IE8a5t2vAc7uHbhW52m189RNr8N2yqc2jJGrHdRdfFv50kYLOdkbxH34MMXUkyP4JTNM1l//w==
X-Received: by 2002:a17:90b:2686:b0:313:db0b:75d8 with SMTP id 98e67ed59e1d1-313db0b77acmr2060784a91.32.1749797906744;
        Thu, 12 Jun 2025 23:58:26 -0700 (PDT)
Received: from localhost.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1b49b7fsm2653022a91.24.2025.06.12.23.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 23:58:26 -0700 (PDT)
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
Subject: [PATCH v2 07/12] RISC-V: KVM: Use ncsr_xyz() in kvm_riscv_vcpu_trap_redirect()
Date: Fri, 13 Jun 2025 12:27:38 +0530
Message-ID: <20250613065743.737102-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613065743.737102-1-apatel@ventanamicro.com>
References: <20250613065743.737102-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The H-extension CSRs accessed by kvm_riscv_vcpu_trap_redirect() will
trap when KVM RISC-V is running as Guest/VM hence remove these traps
by using ncsr_xyz() instead of csr_xyz().

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_exit.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 6e0c18412795..85c43c83e3b9 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -9,6 +9,7 @@
 #include <linux/kvm_host.h>
 #include <asm/csr.h>
 #include <asm/insn-def.h>
+#include <asm/kvm_nacl.h>
 
 static int gstage_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			     struct kvm_cpu_trap *trap)
@@ -135,7 +136,7 @@ unsigned long kvm_riscv_vcpu_unpriv_read(struct kvm_vcpu *vcpu,
 void kvm_riscv_vcpu_trap_redirect(struct kvm_vcpu *vcpu,
 				  struct kvm_cpu_trap *trap)
 {
-	unsigned long vsstatus = csr_read(CSR_VSSTATUS);
+	unsigned long vsstatus = ncsr_read(CSR_VSSTATUS);
 
 	/* Change Guest SSTATUS.SPP bit */
 	vsstatus &= ~SR_SPP;
@@ -151,15 +152,15 @@ void kvm_riscv_vcpu_trap_redirect(struct kvm_vcpu *vcpu,
 	vsstatus &= ~SR_SIE;
 
 	/* Update Guest SSTATUS */
-	csr_write(CSR_VSSTATUS, vsstatus);
+	ncsr_write(CSR_VSSTATUS, vsstatus);
 
 	/* Update Guest SCAUSE, STVAL, and SEPC */
-	csr_write(CSR_VSCAUSE, trap->scause);
-	csr_write(CSR_VSTVAL, trap->stval);
-	csr_write(CSR_VSEPC, trap->sepc);
+	ncsr_write(CSR_VSCAUSE, trap->scause);
+	ncsr_write(CSR_VSTVAL, trap->stval);
+	ncsr_write(CSR_VSEPC, trap->sepc);
 
 	/* Set Guest PC to Guest exception vector */
-	vcpu->arch.guest_context.sepc = csr_read(CSR_VSTVEC);
+	vcpu->arch.guest_context.sepc = ncsr_read(CSR_VSTVEC);
 
 	/* Set Guest privilege mode to supervisor */
 	vcpu->arch.guest_context.sstatus |= SR_SPP;
-- 
2.43.0

