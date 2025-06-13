Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B3B25B2E7
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 06:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749797895; cv=none; b=nUoCnVJvGjhFMiot1TUV/fXstDrXLgkSnDROgkFa/s2/D/wPDYp7CxjD49uWlAzNXNNzm/DT95zczOfCs6FD7RgBe+srA1ZVJ79CVkjtk/TH6BdGjYl3MMd5l2Oyu3SxwetVgTf6e8AatOq1LvCfN6hsU8WH1FPTs58U6kR7SAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749797895; c=relaxed/simple;
	bh=UNJDgyGRwKsBGAVSWW07IY+xb3iaC5t5L0oSJfwXEpY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O8yViMuhgEPbd/MNqa8w5GSLGWuTSGO75uEVS957bKz6erpi3liK5mj+9O0wDQsNvL1L+dFgLCWIJEX18ibxlHAwEiTF/9yobdXkRNdtUXUBevPu5oCEt9PNyLH0a6252fZUK+XkAm/i6xuh8vhaXJ3zqdn3TqQVfJXUqs6flok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Y2IrjyvL; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Y2IrjyvL"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3137c20213cso2170379a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 23:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749797894; x=1750402694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0APR23xoSpRoPrmHOoIW/fZKPHEwlO7VgBzBq3Nrcg8=;
        b=Y2IrjyvLyVi2V1jMJivm9rU6tHvy6jPoplagXWPOrX5fTmas/jOUA6m6Ax5Ho+5XZ4
         D8O6GIhi3ID0M42TA8PS0oqM4xm/SAWKoZxum2WV4ZDtv5W68fR5oVCdPEFiA8VOaUXR
         jbtXi94reH1k1AWlRY6rHSi2ECuUDEI0iBdJRXPM77PGGSNoQ/76OxopKxGtI5TnHcBG
         vw6tpwGpTgATIDbzI55386IBcZ3uvJ4nQ6HEbZoH9ooUE9zPBTYMck/8W3qvyrmhezhK
         JnvNhRM3G1TNTOWGjzrxWdgYjahy8M0xMmujwt4pZp9K6b7fsuQ4RmnvG9yfuHQbFux2
         RpcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749797894; x=1750402694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0APR23xoSpRoPrmHOoIW/fZKPHEwlO7VgBzBq3Nrcg8=;
        b=s4tvL/qJonkZQgi+o7S6KzvqaFJ0HS2mgvocejDiY4MC/XXHFMUucBfE3mk3tKQiYz
         22o0BuB4qc3GTW2uNlUUXHfH0f3sEEy+kdfYY+J/HUKjjQ4PMZ33CSksZTnijysMPchv
         PiyW4TeX2EuHY6MR01O0Fb06eN66znCx3unHHvMx1hQKSlRniM7SHcHqStQT/ecg9yhn
         iEHMcm0D+VyDcBrqOP+GXFv0LUBvCUZdHs67LFdb+CT++RTiLLybHfpy3/JeyalBh0hD
         IifEwAxvSyrCsFA6vhXfmPTV1Gb4VZBB8tQH/0JnOzBc9VhzSzFXhj3oiGwishrXvuNY
         uFoA==
X-Forwarded-Encrypted: i=1; AJvYcCUYBsVp5TAD6/i0HvrAeuFP8IOiG3t1KMqfhCvajz+XfJM/qjB384fRSQfTaC5lbHwOhOMbJ9fwVGIZ8D4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDHb7Z5Lu+uHdf8Q2ESad/Iw+UuGZn5vZeWw4LujNhmb/Pw9ey
	QDJc2xVzceLk5TOHe/9XNoQPCtem565VrNmcALiq3RoYRWff8jJsqHEhd9CjfgF7GgY=
X-Gm-Gg: ASbGncvJOoQiKdf5FSzofZiv169JumuTJ/NYjTKR9ECHLWzwdrB6Hnmjyw/FsWxSPCJ
	mn1e3gadHEOKA2eq6JA9qZlVEKEBu6PjwEbwac/DIyP4jC9RN3hvHpYnA1bIvmS1ojipcopSIqO
	6yIPrTG4ERJtYs9ONUrJCxlp3fPGwc/kE629MCV2rVzpByfnrJSNOi8517nDUbVkCmNCP7X+7bB
	I/DopTO6js9l6bJMVGwMKyfb6yUvJm15OGAGidwgM21XKfszaDkbH4aojLCCu8AqqFyJhApc2Yu
	aoxgYVcL5kJ14AU7wXl2dV/VNK+ax1pPN0uJBFtAzcAl6im75ruQkmQTjUnFMmJl8pH33mqS6iG
	1b8nVwgbHlW8Sz237ztE=
X-Google-Smtp-Source: AGHT+IF4XmbWIExFu1mlduKfiNfTLu/tQXyVfpn87Q8JCh/3y9agaf4v394uxNt/X9mcs0VMw2lIeA==
X-Received: by 2002:a17:90b:5212:b0:312:25dd:1c99 with SMTP id 98e67ed59e1d1-313d9e92702mr2795609a91.19.1749797893528;
        Thu, 12 Jun 2025 23:58:13 -0700 (PDT)
Received: from localhost.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1b49b7fsm2653022a91.24.2025.06.12.23.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 23:58:13 -0700 (PDT)
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
Subject: [PATCH v2 04/12] RISC-V: KVM: Replace KVM_REQ_HFENCE_GVMA_VMID_ALL with KVM_REQ_TLB_FLUSH
Date: Fri, 13 Jun 2025 12:27:35 +0530
Message-ID: <20250613065743.737102-5-apatel@ventanamicro.com>
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

The KVM_REQ_HFENCE_GVMA_VMID_ALL is same as KVM_REQ_TLB_FLUSH so
to avoid confusion let's replace KVM_REQ_HFENCE_GVMA_VMID_ALL with
KVM_REQ_TLB_FLUSH. Also, rename kvm_riscv_hfence_gvma_vmid_all_process()
to kvm_riscv_tlb_flush_process().

Reviewed-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_host.h | 4 ++--
 arch/riscv/kvm/tlb.c              | 8 ++++----
 arch/riscv/kvm/vcpu.c             | 8 ++------
 3 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 8aa705ac75a5..ff1f76d6f177 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -37,7 +37,6 @@
 #define KVM_REQ_UPDATE_HGATP		KVM_ARCH_REQ(2)
 #define KVM_REQ_FENCE_I			\
 	KVM_ARCH_REQ_FLAGS(3, KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
-#define KVM_REQ_HFENCE_GVMA_VMID_ALL	KVM_REQ_TLB_FLUSH
 #define KVM_REQ_HFENCE_VVMA_ALL		\
 	KVM_ARCH_REQ_FLAGS(4, KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
 #define KVM_REQ_HFENCE			\
@@ -331,8 +330,9 @@ void kvm_riscv_local_hfence_vvma_gva(unsigned long vmid,
 				     unsigned long order);
 void kvm_riscv_local_hfence_vvma_all(unsigned long vmid);
 
+void kvm_riscv_tlb_flush_process(struct kvm_vcpu *vcpu);
+
 void kvm_riscv_fence_i_process(struct kvm_vcpu *vcpu);
-void kvm_riscv_hfence_gvma_vmid_all_process(struct kvm_vcpu *vcpu);
 void kvm_riscv_hfence_vvma_all_process(struct kvm_vcpu *vcpu);
 void kvm_riscv_hfence_process(struct kvm_vcpu *vcpu);
 
diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
index b3461bfd9756..da98ca801d31 100644
--- a/arch/riscv/kvm/tlb.c
+++ b/arch/riscv/kvm/tlb.c
@@ -162,7 +162,7 @@ void kvm_riscv_fence_i_process(struct kvm_vcpu *vcpu)
 	local_flush_icache_all();
 }
 
-void kvm_riscv_hfence_gvma_vmid_all_process(struct kvm_vcpu *vcpu)
+void kvm_riscv_tlb_flush_process(struct kvm_vcpu *vcpu)
 {
 	struct kvm_vmid *v = &vcpu->kvm->arch.vmid;
 	unsigned long vmid = READ_ONCE(v->vmid);
@@ -342,14 +342,14 @@ void kvm_riscv_hfence_gvma_vmid_gpa(struct kvm *kvm,
 	data.size = gpsz;
 	data.order = order;
 	make_xfence_request(kvm, hbase, hmask, KVM_REQ_HFENCE,
-			    KVM_REQ_HFENCE_GVMA_VMID_ALL, &data);
+			    KVM_REQ_TLB_FLUSH, &data);
 }
 
 void kvm_riscv_hfence_gvma_vmid_all(struct kvm *kvm,
 				    unsigned long hbase, unsigned long hmask)
 {
-	make_xfence_request(kvm, hbase, hmask, KVM_REQ_HFENCE_GVMA_VMID_ALL,
-			    KVM_REQ_HFENCE_GVMA_VMID_ALL, NULL);
+	make_xfence_request(kvm, hbase, hmask, KVM_REQ_TLB_FLUSH,
+			    KVM_REQ_TLB_FLUSH, NULL);
 }
 
 void kvm_riscv_hfence_vvma_asid_gva(struct kvm *kvm,
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index a2dd4161e5a4..6eb11c913b13 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -721,12 +721,8 @@ static void kvm_riscv_check_vcpu_requests(struct kvm_vcpu *vcpu)
 		if (kvm_check_request(KVM_REQ_FENCE_I, vcpu))
 			kvm_riscv_fence_i_process(vcpu);
 
-		/*
-		 * The generic KVM_REQ_TLB_FLUSH is same as
-		 * KVM_REQ_HFENCE_GVMA_VMID_ALL
-		 */
-		if (kvm_check_request(KVM_REQ_HFENCE_GVMA_VMID_ALL, vcpu))
-			kvm_riscv_hfence_gvma_vmid_all_process(vcpu);
+		if (kvm_check_request(KVM_REQ_TLB_FLUSH, vcpu))
+			kvm_riscv_tlb_flush_process(vcpu);
 
 		if (kvm_check_request(KVM_REQ_HFENCE_VVMA_ALL, vcpu))
 			kvm_riscv_hfence_vvma_all_process(vcpu);
-- 
2.43.0

