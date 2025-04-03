Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D11424E000
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 11:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743679940; cv=none; b=M612WLabGLp7DsSiRaflPm7LkeooWK6Idy22fqu60ozHIu2lk6lRlPXhNc9H73a4X1KwGp6xUPgZS6+I3tKT0DqWBVIJ0WiyFCdOPxX3YKkzA0C/rTndT+Sc9aCBQkSRvfZsrXXl94ej2gbcQLnMRz2sL7fvHQVZKEEG6d/8tk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743679940; c=relaxed/simple;
	bh=Azh59wZxXw0yOcy654yOp1KBuheFNdxSily/oCO2cqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dy6X6thqLUoHdN3AGuFIndgGoS3OEplAVOypZgchnriAqSXrHWo+Wrkr8qsj0ebDZ0CRJflW4qOgQsBp542ihqPj5wJDQbRDb7eqQtHsNWQmF5lMqdE9LJZ/Aj1E90+iVVde30AMTF4xzZTOgt1oTleC66TIxLXW8h/6Whq3bHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=TcrRN4mY; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="TcrRN4mY"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39973c72e8cso69057f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 04:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1743679936; x=1744284736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v4I41IipITScJpjVRL6TprMAJ/XjTheyblDpzSa8c88=;
        b=TcrRN4mYeUgNsDn/+x9gXg2oR+Oz5B25LI6av3I7R6/E8fY28yeVrv3Xg9pjJZtaO8
         FFQp6GdInoGSj4kqFMpdCXae9zqQuy+P+e5Ru8kGg+oFCq1pb30IpYYTD2L3DJsNvzO0
         Y5Ph69Q7IGlu0dqmx4FZtWQUesRBJoGMDFeVXhVTWyeXGvooTvimCAmDY9vbLQEbBaKL
         mnb0WjJEN/ag9xoP4/jS8FH9SqIYXIC1A44D6mku0LA8EwHLTvDovvx6a4jR3FO5Q4IK
         3iGvWaU5so2DofrVXZT186ByU9IrsI5GO+sstW/qjly4WdSOukdkh6+q1PEBmHPGT7J+
         f7aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743679936; x=1744284736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v4I41IipITScJpjVRL6TprMAJ/XjTheyblDpzSa8c88=;
        b=ixodHLlmNuzxaMmQdxrJPoIUrRkZ1OUgUq1Dy3/i5IuWIKFqy9SGBSKwPumlsqwypw
         8x5fl72NWMVna5pB1lm/2ZsTAX/JbOf2pIx2K/F2f/1HfQZfzD++1IlVTuWHMgHD3Vcu
         MZom6q7D2UoN6BhwJ+mnlVbWkhPJWIasBhqRHYZ4xjWtbfFoG1a2GJaVKXpRfxPuxsy+
         5ZMVtMEeR0asMgknugw5sQU5JSGN1Wdf/LxNcEZFX95kn9i0wIdhY9c7B9NqFvk2Sh+x
         E4HCUlZSEOkxrV0fNTDcfht2KYZkR4qp9t6+2fhp3G+KwdXpdZ/tSgUhD3ABm6otxj7Y
         A35w==
X-Forwarded-Encrypted: i=1; AJvYcCUmCg7VNP7vdVTtjJrFa0AENVe3/vDUgj+iYby8WLSdlW70u1FdHQLLp87BJTwvs7KX+00hjzV4cB7Zz7s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFMKAEXhASSAv81jgP4pgKQyBK0ON/g0XJpsp1YyqoD3cd7A1G
	oLmMeAQELCa6rhCiV/VEvr/v100NUYUEz98FXd/k9QpnBuiiiyX6Da7WbZzLHBU=
X-Gm-Gg: ASbGncvdrDibgcSSuEJ4+z56nvIBBtTe9KKveM2NjEsxUPdg6/GeTbKjrZw/TPwpEn3
	I8PfGO8J6UFiz4q1nD4aGbMS/nWRJiyzZ6qtZoKUHUW8ghBNHiEWBGgvZ3XAF4dRcAqQc25d5py
	gN+Hc0KJxfaePft0oc4gHf5JkJkMInAG9miRFdQBzaZju7ToBY5U/H3dULC3Ect65WE4EHKewC5
	2n4Xuc9y6LPFOUxNjXNmbBWuinCrumNgHUi8tq31YTIcuIsOgTVSnCqAnd8/w5MIxt1y89DvQ55
	qDPnUqTpzFCz+Eb4nC/1W/BD4d/yHeuhVH/Y6bVHxeV1uRyvK9M494o9phya/YRgvndIEkqJsxO
	EXQ==
X-Google-Smtp-Source: AGHT+IG37Xf9B62VUcljGsX2nc8emFPUfOIiPgop6kaEA0XU1nktX/EDvfLlLGCqE6Qni7LwKqU1Ng==
X-Received: by 2002:a5d:59ad:0:b0:39c:1258:17d5 with SMTP id ffacd0b85a97d-39c2483abcfmr3137958f8f.14.1743679935688;
        Thu, 03 Apr 2025 04:32:15 -0700 (PDT)
Received: from localhost (cst2-173-141.cust.vodafone.cz. [31.30.173.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d6b1sm1575928f8f.62.2025.04.03.04.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 04:32:14 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: kvm-riscv@lists.infradead.org
Cc: kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>
Subject: [PATCH 4/5] KVM: RISC-V: reset VCPU state when becoming runnable
Date: Thu,  3 Apr 2025 13:25:23 +0200
Message-ID: <20250403112522.1566629-7-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
References: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Beware, this patch is "breaking" the userspace interface, because it
fixes a KVM/QEMU bug where the boot VCPU is not being reset by KVM.

The VCPU reset paths are inconsistent right now.  KVM resets VCPUs that
are brought up by KVM-accelerated SBI calls, but does nothing for VCPUs
brought up through ioctls.

We need to perform a KVM reset even when the VCPU is started through an
ioctl.  This patch is one of the ways we can achieve it.

Assume that userspace has no business setting the post-reset state.
KVM is de-facto the SBI implementation, as the SBI HSM acceleration
cannot be disabled and userspace cannot control the reset state, so KVM
should be in full control of the post-reset state.

Do not reset the pc and a1 registers, because SBI reset is expected to
provide them and KVM has no idea what these registers should be -- only
the userspace knows where it put the data.

An important consideration is resume.  Userspace might want to start
with non-reset state.  Check ran_atleast_once to allow this, because
KVM-SBI HSM creates some VCPUs as STOPPED.

The drawback is that userspace can still start the boot VCPU with an
incorrect reset state, because there is no way to distinguish a freshly
reset new VCPU on the KVM side (userspace might set some values by
mistake) from a restored VCPU (userspace must set all values).

The advantage of this solution is that it fixes current QEMU and makes
some sense with the assumption that KVM implements SBI HSM.
I do not like it too much, so I'd be in favor of a different solution if
we can still afford to drop support for current userspaces.

For a cleaner solution, we should add interfaces to perform the KVM-SBI
reset request on userspace demand.  I think it would also be much better
if userspace was in control of the post-reset state.

Signed-off-by: Radim Krčmář <rkrcmar@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_host.h     |  1 +
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  3 +++
 arch/riscv/kvm/vcpu.c                 |  9 +++++++++
 arch/riscv/kvm/vcpu_sbi.c             | 21 +++++++++++++++++++--
 4 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 0c8c9c05af91..9bbf8c4a286b 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -195,6 +195,7 @@ struct kvm_vcpu_smstateen_csr {
 
 struct kvm_vcpu_reset_state {
 	spinlock_t lock;
+	bool active;
 	unsigned long pc;
 	unsigned long a1;
 };
diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index aaaa81355276..2c334a87e02a 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -57,6 +57,9 @@ void kvm_riscv_vcpu_sbi_system_reset(struct kvm_vcpu *vcpu,
 				     u32 type, u64 flags);
 void kvm_riscv_vcpu_sbi_request_reset(struct kvm_vcpu *vcpu,
                                       unsigned long pc, unsigned long a1);
+void __kvm_riscv_vcpu_set_reset_state(struct kvm_vcpu *vcpu,
+                                      unsigned long pc, unsigned long a1);
+void kvm_riscv_vcpu_sbi_request_reset_from_userspace(struct kvm_vcpu *vcpu);
 int kvm_riscv_vcpu_sbi_return(struct kvm_vcpu *vcpu, struct kvm_run *run);
 int kvm_riscv_vcpu_set_reg_sbi_ext(struct kvm_vcpu *vcpu,
 				   const struct kvm_one_reg *reg);
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index b8485c1c1ce4..4578863a39e3 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -58,6 +58,11 @@ static void kvm_riscv_vcpu_context_reset(struct kvm_vcpu *vcpu)
 	struct kvm_vcpu_reset_state *reset_state = &vcpu->arch.reset_state;
 	void *vector_datap = cntx->vector.datap;
 
+	spin_lock(&reset_state->lock);
+	if (!reset_state->active)
+		__kvm_riscv_vcpu_set_reset_state(vcpu, cntx->sepc, cntx->a1);
+	spin_unlock(&reset_state->lock);
+
 	memset(cntx, 0, sizeof(*cntx));
 	memset(csr, 0, sizeof(*csr));
 
@@ -520,6 +525,10 @@ int kvm_arch_vcpu_ioctl_set_mpstate(struct kvm_vcpu *vcpu,
 
 	switch (mp_state->mp_state) {
 	case KVM_MP_STATE_RUNNABLE:
+		if (riscv_vcpu_supports_sbi_ext(vcpu, KVM_RISCV_SBI_EXT_HSM) &&
+				vcpu->arch.ran_atleast_once &&
+				kvm_riscv_vcpu_stopped(vcpu))
+			kvm_riscv_vcpu_sbi_request_reset_from_userspace(vcpu);
 		WRITE_ONCE(vcpu->arch.mp_state, *mp_state);
 		break;
 	case KVM_MP_STATE_STOPPED:
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index 3d7955e05cc3..77f9f0bd3842 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -156,12 +156,29 @@ void kvm_riscv_vcpu_sbi_system_reset(struct kvm_vcpu *vcpu,
 	run->exit_reason = KVM_EXIT_SYSTEM_EVENT;
 }
 
+/* must be called with held vcpu->arch.reset_state.lock */
+void __kvm_riscv_vcpu_set_reset_state(struct kvm_vcpu *vcpu,
+                                      unsigned long pc, unsigned long a1)
+{
+	vcpu->arch.reset_state.active = true;
+	vcpu->arch.reset_state.pc = pc;
+	vcpu->arch.reset_state.a1 = a1;
+}
+
 void kvm_riscv_vcpu_sbi_request_reset(struct kvm_vcpu *vcpu,
                                       unsigned long pc, unsigned long a1)
 {
 	spin_lock(&vcpu->arch.reset_state.lock);
-	vcpu->arch.reset_state.pc = pc;
-	vcpu->arch.reset_state.a1 = a1;
+	__kvm_riscv_vcpu_set_reset_state(vcpu, pc, a1);
+	spin_unlock(&vcpu->arch.reset_state.lock);
+
+	kvm_make_request(KVM_REQ_VCPU_RESET, vcpu);
+}
+
+void kvm_riscv_vcpu_sbi_request_reset_from_userspace(struct kvm_vcpu *vcpu)
+{
+	spin_lock(&vcpu->arch.reset_state.lock);
+	vcpu->arch.reset_state.active = false;
 	spin_unlock(&vcpu->arch.reset_state.lock);
 
 	kvm_make_request(KVM_REQ_VCPU_RESET, vcpu);
-- 
2.48.1

