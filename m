Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12132E719A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 11:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750246582; cv=none; b=aLHDPtVFf9tQ5F9oldCDwRAO3we8hO3kx5XKqi9Fo6QJ8izpF4gpz23dVv4LGeu+lv0lmr6VxFhm0nDZIBzyLtcfdAt7MdZaXwj4y3T1+MJO4ayOjQJLUMQhAps77j1IPpKoC5465JlWN97UP34qtJ96cYTm3mfIX+F62n3SCgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750246582; c=relaxed/simple;
	bh=EZamgmfz28ULCJxJqXiePT3VU1t7zAHa6emh76/UPUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oMcdB4nPFrEHTqG7pgHyvVrQ5ompp2DeR1VoEHOdGu9k3wzj+3wBO1ORGQZRLeUvG3uOZRtrxMJ1iaVqe2a0bAFm/0u9/lqNjofSI1QB5bCk55iqiKMRx0RoSq/03lbI+8JX1q/V9gqptvS6yKeAQ0h8KOoZHbJPDuxugC7r3OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=GBn0/9aU; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="GBn0/9aU"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2366e5e4dbaso5709515ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 04:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750246580; x=1750851380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/YNO98LyRrwhUY0pfR89F0hA4+0elQu2+nOXauL2xzw=;
        b=GBn0/9aUONA8oT3b8SrFD571mvT512gttq7S/8kH7Q9aQtwy+VuJbdj7pbEnFuMbSV
         TZ9tNObfV80f1oNuT1L1zG8TQ1O/o8UT+q7MUEpAnXrvzlMYyygIBDbIZsjaY9JJCd+6
         D+/+C5I0QktErtjh5srxyvkXuCbUkh5dU/R9z0pg/KfwBifCpH3iMqZSBHbuhe57OYcX
         B7HEeSvEgnEH1emm98tUUHSwuOa9o1zvTLuWk8xdYloe1slslOE+sSaGZvHCZOM53uMc
         KJ2OnjJdTVGJbhXUjzUQMZ7qwi5DtEDmpK+e8qJ6JaD7FzO0XOSBVHLcu+QVNRyhC8BM
         dhuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750246580; x=1750851380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/YNO98LyRrwhUY0pfR89F0hA4+0elQu2+nOXauL2xzw=;
        b=MhuNlfVQlV4iH6Q9iSiIuIzIh8vOYR4BFZP8YY+dwVPj/YO2uL/lAtNOr2myoVRQTf
         jz92iKpKEBIuzNF+NEecPm2sE5Gl1JaZ2FPQ/es8lwf7fh3Left8/V/9MZ+IlQCGD2JQ
         rXvHWHCPqac5jO+3W7sa72S/ahX4qdDFulHxs7VnXISmQuHVmr0wPA+q0TwbgReuvyLk
         8goGXNlsczrTyWu7kHNkR3s8EFWIa6wgRBPSPdPZuBuyTZuZRq4rotBNTPlWa+z6Z96Y
         vGh2ftQsdAnCXjNsLELQhL9bg8tcv2MaXb4w13uxQYP0PZpXW1FFqbGEJDHmO0kTNGds
         9psg==
X-Forwarded-Encrypted: i=1; AJvYcCUhKYCpCKTM1N+Q/CtpRWsfTZk/iPFHZIXCYJBc9iFYl4qmzSeKm6N+2jd/pWwxxNm1LpGpGoobAxktFC0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFAegtUBcwfrMInKu6CiJlQXp0OtGPXC90BjrUpu3KAJTR+D8o
	LX3j/zE2sL0twHi+V+x5KSwGYIlhTuzAkOFTWxKfDJyOKYiyd969gHhLHsBMcrZlBlI=
X-Gm-Gg: ASbGncsKgjwIzNpG2AyuU5ZkoN8y2h0+s0jWpUA4KzVntHY/h8RLzSRa3YqRFXFNhoC
	wHffbRaM31llLd0Q4zTf2wB2X1Hj8bnhjEuBOTaktVMo3NwzuRxbtiyy5UPZQ226gMOM+U6OJrL
	9SldcqtbwBcSyzYNeqjviad5Hk3yaLpI9+Zkk06zCq/SebmTwc/NOWWMBbXSLPjSq2hCQjv1wrE
	g7SB29+SpoyzQFzPzTrjOiYf6N/Yhz7CiFts1DExnTk1lFuiS9OvH7r44mYNJGbARuCD2ImCLYH
	0xjRv6yPYkJQcZWHFNlhblFlS5XYgLMhWL05j1FYsD6R+0Bz4nt8AGlArhvCwlXsbFm83E6POjI
	9v5F6Rs19PXtyfoRpqw==
X-Google-Smtp-Source: AGHT+IGvNMzA4JkJB3Lqq8VqvqJDedOuU5j6cPnr0JPK19aiVhzcYh8cLYvVgF2E++GIf5MLnFvaZw==
X-Received: by 2002:a17:902:ccc8:b0:221:89e6:ccb6 with SMTP id d9443c01a7336-237c210feedmr34862225ad.25.1750246580053;
        Wed, 18 Jun 2025 04:36:20 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237c57c63efsm9112475ad.172.2025.06.18.04.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 04:36:19 -0700 (PDT)
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
Subject: [PATCH v3 07/12] RISC-V: KVM: Use ncsr_xyz() in kvm_riscv_vcpu_trap_redirect()
Date: Wed, 18 Jun 2025 17:05:27 +0530
Message-ID: <20250618113532.471448-8-apatel@ventanamicro.com>
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

The H-extension CSRs accessed by kvm_riscv_vcpu_trap_redirect() will
trap when KVM RISC-V is running as Guest/VM hence remove these traps
by using ncsr_xyz() instead of csr_xyz().

Reviewed-by: Atish Patra <atishp@rivosinc.com>
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

