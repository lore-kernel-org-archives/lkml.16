Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6B21F8EFF
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 14:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747320779; cv=none; b=Hb23s87TzbmYHLRaH07Ywqujn7hRqveq9PJvbbabCQoJXComZHF0PU9fakjttF+l9MRPP0XHxBuyXPQ840ZuxZG7LZ0P7Uovfn3TOa63xSg2xiHl62ZMFq9bJMkQOBsNQp3WvDaJ1A/iAGM0JF1aPsRg3KIhyvgCFl7u9jeRcD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747320779; c=relaxed/simple;
	bh=hFaYWBEBY0HzajektsAiaj35JqVI8lq3iUn/Da+pW+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U0ykAxbgkgcKWKEnsSDE9tU4Udb3CPkKWdfgNTTPF13n2QJySO99vM2YEoKyGaW6gK+H8RTrifmnQldvv/HEy5guJivduyzkWVOlt8U7xSzsuQk+mRsGEMMyfA3iTTqubSfn0nK+IASqCdql/dgDw9jexgm3lCz4R0qIq/Qkw9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=CdVgUHc3; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="CdVgUHc3"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a35c339e95so25807f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 07:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747320776; x=1747925576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uIZgXNME8r0sE5ooEmr0L318UA8GXpBZxCC2zWvfkBI=;
        b=CdVgUHc3aPOJF8xa2T1P0zm2lOtqGRscU610DflboK02fU8+FCpTXYVWQMZ4jTwECk
         Yh7dIhJOcbmDuxXmskmHQ8H168jUADlpXvAUxCkzdvlRyrRRM65C3yzi7k7B8OuCjhTt
         NoRjtDILSXD7mbJEtEqMwLsriS/llg0uXR872qPkp5Tp0m4hcVvx3YX2UK9NDeCV6epv
         WYzb4vM8OPSTTikniTjgSogL+alNphqQqJkf6ZPId1cJj9yIPZCeS4Gz+zHAekwGdo43
         pfsxN2+cC1nc4Ztk/f82jQTs7KcnuX69agHJQcwKW7s0QAb+C1OSRe87rBM8FfNxk4t0
         fF3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747320776; x=1747925576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uIZgXNME8r0sE5ooEmr0L318UA8GXpBZxCC2zWvfkBI=;
        b=T6rbpbZ1Hehpm4/rCEQyTg4Bm9opAGAS/bFKM2KiO0Ht60+zVP5DVFYlvZE2pTSu/7
         Es2v5B8i6h8LW+pTJ6EHHZP3UVzqm8vvJ76EX42HDEm/+FGE/EAWjqR+clejT2hFJdiB
         1B/aClVWZVxjJH1OHLVJRFnyU9rBT99jHrr2Ald6j9wMjpKKJE0Vod5eYDpSN1hWVdQ4
         k1QyazPTDy3zQw9I+drxHw9hv0FFK66SDK0TPQXEo4BnAFfv+eRiEZBRBZL2OiISGdZ4
         Ptff+kIGOAo+hUHn8Gv06ScnaSghw33liC9KBjDazzLd9Oox1adyU0uuR+Xj6f8lR1Dn
         3Myg==
X-Forwarded-Encrypted: i=1; AJvYcCVq4aDLqhB0BKGUQrBgV9cA7NhwT7nncxdH6x8c3ES1plqr0oeZWw/3ThddNSyrfPQZReBJotgMUYVNxJk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVY/MqtHay/kB9f6V67mKryfseTgb5LX8GY3K2F1uQrw03UdNB
	h4wHBalmla7yKUYYRgU/HzTWhGbzK803vpnOu5ZY1gFHXkF+73JjMGZT9ugnL/fG4Uo=
X-Gm-Gg: ASbGncu/CYQ6+a1Y3HiNh4Dxvh1XM0e6BkJrNoj143CbICcOOgiFMWaUeXFtoC/0Fae
	q2Ow5FsG4MmTt6L1ScH5HZZqffZQgC/zTVrUSYyNR6DOJ8p3hUfJG4jTHpC9PPzZHREmphE9vSp
	Q8AHfOuPCula3pyHTo7973+klqv+J3Qwy7tLNUV/FYQySVBBzEKwOqG7b87szpPYAyiFS3uE3Pu
	/kqaRynqkmBSZ7Mof1FKzhk2LXuQBPXVclwcPEHfRFPE/pk1sC8G6V8Zv6hB6PREl1Ov7t3+w2E
	ok26v1Lw8FmsnnVkTfcJSpjP8eytMjrKKWRehCZQIB7+iCfaCQkH2QtQ
X-Google-Smtp-Source: AGHT+IGy6O2tOnw9TErwlciOBkx2moBTrgZcoot58P13AHHzScWNRRUCcYrPv0m2LluesoiEnXCjmQ==
X-Received: by 2002:a5d:5f4d:0:b0:3a3:55b4:1abb with SMTP id ffacd0b85a97d-3a35c84c356mr10937f8f.12.1747320775665;
        Thu, 15 May 2025 07:52:55 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:59f5:9ec:79d9:ffc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35573f32bsm1842946f8f.17.2025.05.15.07.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 07:52:55 -0700 (PDT)
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
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v3 2/2] RISC-V: KVM: add KVM_CAP_RISCV_USERSPACE_SBI
Date: Thu, 15 May 2025 16:37:26 +0200
Message-ID: <20250515143723.2450630-6-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515143723.2450630-4-rkrcmar@ventanamicro.com>
References: <20250515143723.2450630-4-rkrcmar@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The new capability allows userspace to implement SBI extensions that KVM
does not handle.  This allows userspace to implement any SBI ecall as
userspace already has the ability to disable acceleration of selected
SBI extensions.

This is a VM capability, because userspace will most likely want to have
the same behavior for all VCPUs.  We can easily make it both a VCPU and
a VM capability if there is demand in the future.

Signed-off-by: Radim Krčmář <rkrcmar@ventanamicro.com>
---
v3: new
---
 Documentation/virt/kvm/api.rst    | 11 +++++++++++
 arch/riscv/include/asm/kvm_host.h |  3 +++
 arch/riscv/kvm/vcpu_sbi.c         | 10 ++++++++--
 arch/riscv/kvm/vm.c               |  5 +++++
 include/uapi/linux/kvm.h          |  1 +
 5 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index e107694fb41f..c9d627d13a5e 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -8507,6 +8507,17 @@ given VM.
 When this capability is enabled, KVM resets the VCPU when setting
 MP_STATE_INIT_RECEIVED through IOCTL.  The original MP_STATE is preserved.
 
+7.44 KVM_CAP_RISCV_USERSPACE_SBI
+--------------------------------
+
+:Architectures: riscv
+:Type: VM
+:Parameters: None
+:Returns: 0 on success, -EINVAL if arg[0] is not zero
+
+When this capability is enabled, KVM forwards ecalls from disabled or unknown
+SBI extensions to userspace.
+
 8. Other capabilities.
 ======================
 
diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 85cfebc32e4c..6f17cd923889 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -122,6 +122,9 @@ struct kvm_arch {
 
 	/* KVM_CAP_RISCV_MP_STATE_RESET */
 	bool mp_state_reset;
+
+	/* KVM_CAP_RISCV_USERSPACE_SBI */
+	bool userspace_sbi;
 };
 
 struct kvm_cpu_trap {
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index 31fd3cc98d66..6d4a55d276cb 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -471,8 +471,14 @@ int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run)
 #endif
 		ret = sbi_ext->handler(vcpu, run, &sbi_ret);
 	} else {
-		/* Return error for unsupported SBI calls */
-		cp->a0 = SBI_ERR_NOT_SUPPORTED;
+		if (vcpu->kvm->arch.userspace_sbi) {
+			next_sepc = false;
+			ret = 0;
+			kvm_riscv_vcpu_sbi_forward(vcpu, run);
+		} else {
+			/* Return error for unsupported SBI calls */
+			cp->a0 = SBI_ERR_NOT_SUPPORTED;
+		}
 		goto ecall_done;
 	}
 
diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
index b27ec8f96697..0b6378b83955 100644
--- a/arch/riscv/kvm/vm.c
+++ b/arch/riscv/kvm/vm.c
@@ -217,6 +217,11 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm, struct kvm_enable_cap *cap)
 			return -EINVAL;
 		kvm->arch.mp_state_reset = true;
 		return 0;
+	case KVM_CAP_RISCV_USERSPACE_SBI:
+		if (cap->flags)
+			return -EINVAL;
+		kvm->arch.userspace_sbi = true;
+		return 0;
 	default:
 		return -EINVAL;
 	}
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 454b7d4a0448..f5796c5b8dae 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -931,6 +931,7 @@ struct kvm_enable_cap {
 #define KVM_CAP_X86_GUEST_MODE 238
 #define KVM_CAP_ARM_WRITABLE_IMP_ID_REGS 239
 #define KVM_CAP_RISCV_MP_STATE_RESET 240
+#define KVM_CAP_RISCV_USERSPACE_SBI 241
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
-- 
2.49.0

