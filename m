Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604A7257AE7
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 21:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739223383; cv=none; b=Qrw1iLPIFS3Xpp5lBzTfnJO6S/ohgqwRuvzCvwNQHOJvuJQ3APq+FPETCKk13sZDt6gvCjTr5FuTF6Eg4MWMVyeeMxIdkAG4daHmAiLHZPIJW4Wb7lVZVwh1+8OR1jw20zzecR0gvIoIWp+6bZG90jC5lOXP67cZEbPPqE8Y9W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739223383; c=relaxed/simple;
	bh=tnKzbqMMp5HHjfXQnWoloF0osdhVoD6R7LW0XEkdLdc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Oblia/Rr1n4sesdT9a8IMMio+n6QE1fNEBLYmv9j8gbdUUq4QgQjvsrXm/+NUQmk5DyGzlqTn4i2G+he/Pw74vAErAUBJtNv6FmQmRpLVPd5D8qai5jyzd+Oyk9HEIvEpgY2cBnRGXFpsIf9DE+O2/DWZmoMiPNRI3daQ8Goymg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=ZbKzi5mK; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ZbKzi5mK"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-439307d83f0so15375415e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 13:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739223379; x=1739828179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fzMhLGWSVmu+B6UkQbjgF0/C3X18++BVbDb7RHWPhdM=;
        b=ZbKzi5mKr3OqmP2fjZJZs0xISpdic60V0Goq7gXYDzq7x1m1+j7C7+ygrqVb4TDhof
         EoK/pKg7ro07rRFPay68q+MGMgSPQDKjKoqpnjVwB2+c34nGoNmD9b00bdlkIEziQJuS
         Ku5poqJQAQEwHIWBjNppV7Vc58imjMTf8Lu7yGX8KoNVyA5jeHwSn1VJ+okk+O5Lma1U
         amJS9OMQBgWAfEj7PTjmetanUxMjAtWsBYUSzQRcNz4rLhe+hN9xOXvRca1Vmpigu5nd
         nn+QnSwpLNCuhUQ+rrlI5rp0dGHgxYMleHKJ30MmU3hWE0jE+bSUwu8vRKUscaDEEh4O
         Pw6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739223379; x=1739828179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fzMhLGWSVmu+B6UkQbjgF0/C3X18++BVbDb7RHWPhdM=;
        b=RLComAX/eDTxFoRj4wGIEHz5KZnA2ISmlWmPyQaBIVcBRn1/0UT4dT8eWBPbyuKpgA
         j0u8jwkLqiHqBtCq8M7AwWTK7OA6w15Yab8joY8oSQ4NssCJMIz9CaN21xrhq4B+UMYr
         mz9m9/4YdAX6v/Fhn2p3i6nZUBaPmeh/3BY10k04/OMzSoxxtq9BA/rPstgx4VzarI+1
         PeWnf5KGYOKsR8L2IhpOnvKlBmKMn3LlqU1PHUyJbghe7Uf7m5+pAE7AMwCpCcr2cq1S
         IokiE25rPcdIAnJADjTpf1jRiKO/LGxIYzBVSOx522U8G3LhximqWCGfGRIHhhtPlR6y
         mC1g==
X-Forwarded-Encrypted: i=1; AJvYcCVTjvIvmKgjeJ7u0uu0XO8Tk7lO0FVhQ+wmuaBxPPeK0ir1ny35iJ3Zco5JGvfG+ZT6uGwVqDsgVqNYfts=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrnlPdS4bM6fmoc/i/YLQDEb3S3plbEkiRxwYpslXEjnt9usIk
	yl9IzvJSWWp/Ng+3LOj1WurRroBc9xelRC7MXSSZFV15jeUtgC6wY5qvglI21aU=
X-Gm-Gg: ASbGncukY4xfPCHciZU7z4S7E6M7nEiUEE4iXXhvS2T/R9PLFpPAT00w8E4HRZGdb65
	7XN31Dve2Myo1WUzIF+0gc8Iqt44VOx7MikfiOQu3R8TvZnQTJioy6remBeIYfeaeYRXlBtefBP
	HuDCIJmvKURs3QUET5XVBOlt+Z863/BsgV1pfLXi3SuxZ05hmEODUdYV9zc9AHsCDxIq08gFZz7
	DSeEVvvFVRcsihkKyXoRyzsKeMh3BRstAqug/vgMbAVzycAQFZdk/OMbygwS2UeFaDTphwE9oQL
	XrJO8sY0AjFsKT0Y
X-Google-Smtp-Source: AGHT+IEdxZi1LVbl9euup4c2vHOS8bchWH6uTAT2rIkrBK2DWGVQXoH4pwkPsigJnMZZocj6TvzXjg==
X-Received: by 2002:a5d:6d0e:0:b0:38d:b34a:679 with SMTP id ffacd0b85a97d-38dc9373577mr10353065f8f.37.1739223379602;
        Mon, 10 Feb 2025 13:36:19 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394376118esm47541515e9.40.2025.02.10.13.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 13:36:18 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 12/15] RISC-V: KVM: add SBI extension init()/deinit() functions
Date: Mon, 10 Feb 2025 22:35:45 +0100
Message-ID: <20250210213549.1867704-13-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210213549.1867704-1-cleger@rivosinc.com>
References: <20250210213549.1867704-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The FWFT SBI extension will need to dynamically allocate memory and do
init time specific initialization. Add an init/deinit callbacks that
allows to do so.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  9 ++++++++
 arch/riscv/kvm/vcpu.c                 |  2 ++
 arch/riscv/kvm/vcpu_sbi.c             | 30 +++++++++++++++++++++++++++
 3 files changed, 41 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index 4ed6203cdd30..bcb90757b149 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -49,6 +49,14 @@ struct kvm_vcpu_sbi_extension {
 
 	/* Extension specific probe function */
 	unsigned long (*probe)(struct kvm_vcpu *vcpu);
+
+	/*
+	 * Init/deinit function called once during VCPU init/destroy. These
+	 * might be use if the SBI extensions need to allocate or do specific
+	 * init time only configuration.
+	 */
+	int (*init)(struct kvm_vcpu *vcpu);
+	void (*deinit)(struct kvm_vcpu *vcpu);
 };
 
 void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run);
@@ -69,6 +77,7 @@ const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(
 bool riscv_vcpu_supports_sbi_ext(struct kvm_vcpu *vcpu, int idx);
 int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run);
 void kvm_riscv_vcpu_sbi_init(struct kvm_vcpu *vcpu);
+void kvm_riscv_vcpu_sbi_deinit(struct kvm_vcpu *vcpu);
 
 int kvm_riscv_vcpu_get_reg_sbi_sta(struct kvm_vcpu *vcpu, unsigned long reg_num,
 				   unsigned long *reg_val);
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 60d684c76c58..877bcc85c067 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -185,6 +185,8 @@ void kvm_arch_vcpu_postcreate(struct kvm_vcpu *vcpu)
 
 void kvm_arch_vcpu_destroy(struct kvm_vcpu *vcpu)
 {
+	kvm_riscv_vcpu_sbi_deinit(vcpu);
+
 	/* Cleanup VCPU AIA context */
 	kvm_riscv_vcpu_aia_deinit(vcpu);
 
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index d1c83a77735e..44f551143498 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -505,8 +505,38 @@ void kvm_riscv_vcpu_sbi_init(struct kvm_vcpu *vcpu)
 			continue;
 		}
 
+		if (!ext->default_disabled && ext->init &&
+		    ext->init(vcpu) != 0) {
+			    scontext->ext_status[idx] =
+				    KVM_RISCV_SBI_EXT_STATUS_UNAVAILABLE;
+			    continue;
+		}
+
 		scontext->ext_status[idx] = ext->default_disabled ?
 					KVM_RISCV_SBI_EXT_STATUS_DISABLED :
 					KVM_RISCV_SBI_EXT_STATUS_ENABLED;
 	}
 }
+
+void kvm_riscv_vcpu_sbi_deinit(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu_sbi_context *scontext = &vcpu->arch.sbi_context;
+	const struct kvm_riscv_sbi_extension_entry *entry;
+	const struct kvm_vcpu_sbi_extension *ext;
+	int idx, i;
+
+	for (i = 0; i < ARRAY_SIZE(sbi_ext); i++) {
+		entry = &sbi_ext[i];
+		ext = entry->ext_ptr;
+		idx = entry->ext_idx;
+
+		if (idx < 0 || idx >= ARRAY_SIZE(scontext->ext_status))
+			continue;
+
+		if (scontext->ext_status[idx] == KVM_RISCV_SBI_EXT_STATUS_UNAVAILABLE ||
+		    !ext->deinit)
+			continue;
+
+		ext->deinit(vcpu);
+	}
+}
-- 
2.47.2

