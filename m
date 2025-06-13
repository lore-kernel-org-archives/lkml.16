Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C84259CA5
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 06:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749797891; cv=none; b=ncNlpy3CjSLJhdMMQEMuoltKQP6TAA56eS/ogZ+k3hrxuCbt6lo1gAV7hdQo8gdHRI9RuTaE2K6Jl+e08LAXRHZfMWvVqByw8qUqlHxeH9JabSdmyDtrzAy3CFVKv7znoMiNsJL7dcIw48GHv88tgltpK4V9tOHXbwVxpOQde1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749797891; c=relaxed/simple;
	bh=U71gyvnkFRTjwDI8pxtkBdAEgTm+G+VjYBDnQo+6/v4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KiMrBZ8898OdGnnefWcd9kHvkDLEYm0alFYPd1V3wvxe1ShiKAAzrzxQmP0aA46CJOd7jxGoy90msFVr70QTyBPr2AWbF5FcDLPEWt8Od9gzGQU1ZraCmGdj3J4J6aw9mP+LlA3mSGeQ1cMVtuCSV3cTBxnsLN92sn2hDLA/Ldo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Gbor7Xki; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Gbor7Xki"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3134c67a173so2013710a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 23:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749797889; x=1750402689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3W7Bv8eoCvTNzkNO4nvyVAxgoupNAJKpC3g9nF1nD78=;
        b=Gbor7XkiXs9Wc+6pZB7zFCGRj5+GrjBsPyoYRJpyQfc9HdUW8EegECBHgRcUMLFAxV
         IHsviUyXTb4tq0fKL4+5bTA9O8SGHFWPMoIBOHtbj13rm62djTbHuzJJzKvX0Xj/DoGK
         K9mWcFxMansr3EOzBTwkq8W4eFFkcn5+eYgFwrthEs2+KfMmaYawD9kclxKpRIGz/q6I
         rq70SRY6GDJ/8JFiF070oJX8bKRIcE5RoJMCIokvVhgy3tAgmwADgvsdmOBw/1SCjhCS
         +7f/Vb0sAxzbuC+rDtH5FIC9JU2540X2aH9gVywMraPynSlRIkZM8wjXIB0yTkT4/2EY
         5/iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749797889; x=1750402689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3W7Bv8eoCvTNzkNO4nvyVAxgoupNAJKpC3g9nF1nD78=;
        b=DmmbywjwMaWyfYZzlNHrCb9wcfutJWAJNvTOnT2zNaXLuYgwXh/lTByQqmRtw3jbn8
         LGepNd+ZeRuaSfNMZPYssDthndb+0eRqbyMSd5fa0tNCpxhT+L3dPZxlMWJaFEyEqEmU
         5GpB83g1XWFvElwhRQICONZ54c+BIr8Nn9qCsJXekStgu7fp+0mV7Py1+844IE0U3IZ6
         +lodHui0uIWE67xxOuAmY9JwLFIBHKqNleHKUenvb75mWjO1zYc/ZWuq/IMM6B+7ePnI
         oX65r1/87NwuG6mOZXUjCx+V009sYjrOprqP1zNMyX+8VfPRE9nJHHmCSnBIcQRIMlN3
         2tyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZ/auudPtXiAh8iCu7dm4besZlWfw0qwNyNeja1csWWHHfUtPN3dvKKYKgAU13K9Om4joi2VK77VNfA10=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7wdpHRYdDAwLqDU1Pod/Te9j6eC6++eCIWIGwwn/cMy1M/De1
	U2vnqeIPzs0jXTvspR5ygTkrO5a8DLdLhXCFTJHBk4A5+KGsih40OvtlMgxos1D8cBcpOq3Dra1
	Ea8mxUYE=
X-Gm-Gg: ASbGncsEygQuUa9M9gAyClAVSmR/booqcvCH7doWLqx8nxs0GPFyjgwbppI3zvWq+ny
	ugACYPvDGNb5YcTG9/PuWORdtWKEoeqe2WolONjyOPnfYFNx3mURnBvr7PFFH/k0U2BYNmTeBvc
	thw64y9TbBJJq2F+4fBqpafKmI5sNntHHiN7hIoaUjVHj7w08IiCJNLXwSkNCEgNqJrHX9bjiGv
	6SyBAgSTUKB+Sr24JFWwEckDL3AW8j8yYC3LmGaAJhf+EuHJLuRs1SV6aefP18/60REz5WP8K6K
	aPWghdkxiBkE02UyedZ5bk+PnaMdqlk5ojp73EWevLXKRaxKTzBPtx/Gor1rn4xM7LiLVKCgUpJ
	WgBxUpV5glu9xiepUKhk=
X-Google-Smtp-Source: AGHT+IECSuEdfJ3+vv5ZN/l8SWOjIXMckOPoSZF/gGT301HnuJfIR6kjlfzE08KH38AjoOLcOVtXeQ==
X-Received: by 2002:a17:90b:4c89:b0:311:c970:c9c0 with SMTP id 98e67ed59e1d1-313d9e926f7mr2384987a91.22.1749797888863;
        Thu, 12 Jun 2025 23:58:08 -0700 (PDT)
Received: from localhost.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1b49b7fsm2653022a91.24.2025.06.12.23.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 23:58:08 -0700 (PDT)
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
	Atish Patra <atishp@rivosinc.com>,
	Nutty Liu <liujingqi@lanxincomputing.com>
Subject: [PATCH v2 03/12] RISC-V: KVM: Rename and move kvm_riscv_local_tlb_sanitize()
Date: Fri, 13 Jun 2025 12:27:34 +0530
Message-ID: <20250613065743.737102-4-apatel@ventanamicro.com>
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

The kvm_riscv_local_tlb_sanitize() deals with sanitizing current
VMID related TLB mappings when a VCPU is moved from one host CPU
to another.

Let's move kvm_riscv_local_tlb_sanitize() to VMID management
sources and rename it to kvm_riscv_gstage_vmid_sanitize().

Reviewed-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Nutty Liu<liujingqi@lanxincomputing.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_host.h |  3 +--
 arch/riscv/kvm/tlb.c              | 23 -----------------------
 arch/riscv/kvm/vcpu.c             |  4 ++--
 arch/riscv/kvm/vmid.c             | 23 +++++++++++++++++++++++
 4 files changed, 26 insertions(+), 27 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 9a617bf5363d..8aa705ac75a5 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -331,8 +331,6 @@ void kvm_riscv_local_hfence_vvma_gva(unsigned long vmid,
 				     unsigned long order);
 void kvm_riscv_local_hfence_vvma_all(unsigned long vmid);
 
-void kvm_riscv_local_tlb_sanitize(struct kvm_vcpu *vcpu);
-
 void kvm_riscv_fence_i_process(struct kvm_vcpu *vcpu);
 void kvm_riscv_hfence_gvma_vmid_all_process(struct kvm_vcpu *vcpu);
 void kvm_riscv_hfence_vvma_all_process(struct kvm_vcpu *vcpu);
@@ -380,6 +378,7 @@ unsigned long kvm_riscv_gstage_vmid_bits(void);
 int kvm_riscv_gstage_vmid_init(struct kvm *kvm);
 bool kvm_riscv_gstage_vmid_ver_changed(struct kvm_vmid *vmid);
 void kvm_riscv_gstage_vmid_update(struct kvm_vcpu *vcpu);
+void kvm_riscv_gstage_vmid_sanitize(struct kvm_vcpu *vcpu);
 
 int kvm_riscv_setup_default_irq_routing(struct kvm *kvm, u32 lines);
 
diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
index 2f91ea5f8493..b3461bfd9756 100644
--- a/arch/riscv/kvm/tlb.c
+++ b/arch/riscv/kvm/tlb.c
@@ -156,29 +156,6 @@ void kvm_riscv_local_hfence_vvma_all(unsigned long vmid)
 	csr_write(CSR_HGATP, hgatp);
 }
 
-void kvm_riscv_local_tlb_sanitize(struct kvm_vcpu *vcpu)
-{
-	unsigned long vmid;
-
-	if (!kvm_riscv_gstage_vmid_bits() ||
-	    vcpu->arch.last_exit_cpu == vcpu->cpu)
-		return;
-
-	/*
-	 * On RISC-V platforms with hardware VMID support, we share same
-	 * VMID for all VCPUs of a particular Guest/VM. This means we might
-	 * have stale G-stage TLB entries on the current Host CPU due to
-	 * some other VCPU of the same Guest which ran previously on the
-	 * current Host CPU.
-	 *
-	 * To cleanup stale TLB entries, we simply flush all G-stage TLB
-	 * entries by VMID whenever underlying Host CPU changes for a VCPU.
-	 */
-
-	vmid = READ_ONCE(vcpu->kvm->arch.vmid.vmid);
-	kvm_riscv_local_hfence_gvma_vmid_all(vmid);
-}
-
 void kvm_riscv_fence_i_process(struct kvm_vcpu *vcpu)
 {
 	kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_FENCE_I_RCVD);
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index f9fb3dbbe0c3..a2dd4161e5a4 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -962,12 +962,12 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		}
 
 		/*
-		 * Cleanup stale TLB enteries
+		 * Sanitize VMID mappings cached (TLB) on current CPU
 		 *
 		 * Note: This should be done after G-stage VMID has been
 		 * updated using kvm_riscv_gstage_vmid_ver_changed()
 		 */
-		kvm_riscv_local_tlb_sanitize(vcpu);
+		kvm_riscv_gstage_vmid_sanitize(vcpu);
 
 		trace_kvm_entry(vcpu);
 
diff --git a/arch/riscv/kvm/vmid.c b/arch/riscv/kvm/vmid.c
index ddc98714ce8e..92c01255f86f 100644
--- a/arch/riscv/kvm/vmid.c
+++ b/arch/riscv/kvm/vmid.c
@@ -122,3 +122,26 @@ void kvm_riscv_gstage_vmid_update(struct kvm_vcpu *vcpu)
 	kvm_for_each_vcpu(i, v, vcpu->kvm)
 		kvm_make_request(KVM_REQ_UPDATE_HGATP, v);
 }
+
+void kvm_riscv_gstage_vmid_sanitize(struct kvm_vcpu *vcpu)
+{
+	unsigned long vmid;
+
+	if (!kvm_riscv_gstage_vmid_bits() ||
+	    vcpu->arch.last_exit_cpu == vcpu->cpu)
+		return;
+
+	/*
+	 * On RISC-V platforms with hardware VMID support, we share same
+	 * VMID for all VCPUs of a particular Guest/VM. This means we might
+	 * have stale G-stage TLB entries on the current Host CPU due to
+	 * some other VCPU of the same Guest which ran previously on the
+	 * current Host CPU.
+	 *
+	 * To cleanup stale TLB entries, we simply flush all G-stage TLB
+	 * entries by VMID whenever underlying Host CPU changes for a VCPU.
+	 */
+
+	vmid = READ_ONCE(vcpu->kvm->arch.vmid.vmid);
+	kvm_riscv_local_hfence_gvma_vmid_all(vmid);
+}
-- 
2.43.0

