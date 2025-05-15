Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADED2980C0
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747297444; cv=none; b=gyQW+IfFYX7WOcuIZuq6Tvd0qWLbYnkwT1oQzVUp/TtFbN/aTEIfvB7bkPr3ksYptlLv6D5h5Yy0Kc6Eyl8BLvxcB6C1xg1b4yIGiAjWpNxA8blta0bgOTBQBJTPhx8Fp8XAdKPF7JbYEg+DjGuv/nNpGcfnt7I89az0PqUD6ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747297444; c=relaxed/simple;
	bh=LuwM4EryVnBA1GFGBe+YaFxQNitu3P/2ZZZc+pRHzRo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IkPSWjVyEaKpAgmQN27uxbzl3y+e7h4zVjxh3IhFW6HIR62wRxFNUi2PnCNPaqu0nYlaOIJniagwI3NGVRguHSosXorbxBK7YuHxuWy8OHpuRsicHBxexveaOdOFAQjWY1ry59u9Q3PQac4SweShfWLmzrhEgtVG1d7XbyWKHdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=pz/A5MOv; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="pz/A5MOv"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso4511855e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 01:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747297438; x=1747902238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L4S246g4wPo4d+7PdKHFRm08olDhB+ym0CPBTheC+H4=;
        b=pz/A5MOv9k1gzPBf7hwfCmXmcmNZZdQ8mXGvifKVbhGWJnarcNR9RdJcFurXBSY35z
         MfzT2oZdS1UwFseRyRgbytE4sl6JzANqCPQ8Nal4XlgwPDGR3VD4DI438r6uSUzAI275
         evJ6C7AC/oOOnZjzLsna719glovtv6EvZAdu9ffjuvoAk+3BkF3kAFBdR+lv+NZOAfMb
         pCFMXTEFIPTHIiqugCVDUAcLLjuaSwaCwJVvrd9sPrzBPU4hKKX+gPP8bfrzflMe1QHU
         w2iK5bkII8fgXaRWAQZCjBZRiT3tk9ya+V50sTZEZp4ACSG1YiBpiGGBxcWSFj5Tx3zE
         AWjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747297438; x=1747902238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L4S246g4wPo4d+7PdKHFRm08olDhB+ym0CPBTheC+H4=;
        b=w3kECb+86vctXB8bjn4JROVb/ysMU6JyRwD+oh5cAOR6Yb0lv7nUqrV3HU2IJ/vSzR
         jKFZwbudmkMnB84h74PZIkZ4JiPutqe1tlgQXp9neS7tAMR9QUxNg/Cc2JYaW6Z3/GCt
         51l59I3qohwdM4oLF1pM+hKFrOEJ2hKBV9hzhblMkCTO4fQJ3DFTuDhgbIvS6U+64KXA
         D3J0FbtzS/6HipbFGSg7wdbgcEgBBwE3GSNGRxuf0GBp3LeQKVGLeVnNvHpQ6tLhknRQ
         dzDRcsQsSjwKo4Sf/AH4ma1IKVeCldGoxOTIUK+S7Ayogdb5+EeN6ymfitwR85/S9H1d
         CYCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJdOvW4WVPwC5gjXhGqwQllA9HHZuDPPl3J9WZJV0MZvMPZ5PByZ7Q8ESAQ+mMQ3pbdlHmh5qo7dmslxM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw60GXpf6YmqjDIE66LSKfEo8Ap2FGoqnCz4k/gcXvbw4di3Drf
	uxlJMF0vQzbuXX5mJlKQBGp1RBHWKIG82s9BWYWpHUYtJlqGHY/rJZnQW8HUaDY=
X-Gm-Gg: ASbGnctfE7ApvbSY5MTbF96Mwv+kwTI33mi9CEa/v90quFUwkpViSuiG+WVxR4DFtS9
	uqv0nwrqgIGVtTj0MuJ1rFsHgB8tCg/0ovd/svdUFbbOvMPn+Z070kJEjv65HBg2ZpXZZbXigmc
	7Z6+4uu5fG/tFHnmu4OC+0OSuCE16pEXaoNcRvvG22/VlZO1IX/lIh8lYyK/6Dz2Lc8kf9IP+bA
	abdfYm9X1yvqpiPM2kB9u6ABWzCNRaISl0xvn/PSzp7ivvwU9EL0f60kFYQtoFPvltol6svA8m5
	tkv42pgUFgqv+dFN2m2BACBgx2pEgoW5mTjgioe2C3UVVHYHG9c=
X-Google-Smtp-Source: AGHT+IEY/qaTpWPjrGPpTEDfbNO4QGbOP366jxmTDp9n9/JqDA0v7dO/pJplxyWuqhCmMjnDiPy7MA==
X-Received: by 2002:a05:600c:3ba8:b0:439:8c80:6af4 with SMTP id 5b1f17b1804b1-442f2110f24mr58036485e9.19.1747297438529;
        Thu, 15 May 2025 01:23:58 -0700 (PDT)
Received: from carbon-x1.. ([91.197.138.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f395166fsm59310785e9.18.2025.05.15.01.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:23:57 -0700 (PDT)
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
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v7 12/14] RISC-V: KVM: add SBI extension reset callback
Date: Thu, 15 May 2025 10:22:13 +0200
Message-ID: <20250515082217.433227-13-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515082217.433227-1-cleger@rivosinc.com>
References: <20250515082217.433227-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently, only the STA extension needed a reset function but that's
going to be the case for FWFT as well. Add a reset callback that can be
implemented by SBI extensions.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_host.h     |  1 -
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  2 ++
 arch/riscv/kvm/vcpu.c                 |  2 +-
 arch/riscv/kvm/vcpu_sbi.c             | 24 ++++++++++++++++++++++++
 arch/riscv/kvm/vcpu_sbi_sta.c         |  3 ++-
 5 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 0e9c2fab6378..4fa02e082142 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -407,7 +407,6 @@ void __kvm_riscv_vcpu_power_on(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_power_on(struct kvm_vcpu *vcpu);
 bool kvm_riscv_vcpu_stopped(struct kvm_vcpu *vcpu);
 
-void kvm_riscv_vcpu_sbi_sta_reset(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_record_steal_time(struct kvm_vcpu *vcpu);
 
 #endif /* __RISCV_KVM_HOST_H__ */
diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index bcb90757b149..cb68b3a57c8f 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -57,6 +57,7 @@ struct kvm_vcpu_sbi_extension {
 	 */
 	int (*init)(struct kvm_vcpu *vcpu);
 	void (*deinit)(struct kvm_vcpu *vcpu);
+	void (*reset)(struct kvm_vcpu *vcpu);
 };
 
 void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run);
@@ -78,6 +79,7 @@ bool riscv_vcpu_supports_sbi_ext(struct kvm_vcpu *vcpu, int idx);
 int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run);
 void kvm_riscv_vcpu_sbi_init(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_sbi_deinit(struct kvm_vcpu *vcpu);
+void kvm_riscv_vcpu_sbi_reset(struct kvm_vcpu *vcpu);
 
 int kvm_riscv_vcpu_get_reg_sbi_sta(struct kvm_vcpu *vcpu, unsigned long reg_num,
 				   unsigned long *reg_val);
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 2259717e3b89..ec9f44545cea 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -96,7 +96,7 @@ static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
 	vcpu->arch.hfence_tail = 0;
 	memset(vcpu->arch.hfence_queue, 0, sizeof(vcpu->arch.hfence_queue));
 
-	kvm_riscv_vcpu_sbi_sta_reset(vcpu);
+	kvm_riscv_vcpu_sbi_reset(vcpu);
 
 	/* Reset the guest CSRs for hotplug usecase */
 	if (loaded)
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index 3139f171c20f..50be079b5528 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -536,3 +536,27 @@ void kvm_riscv_vcpu_sbi_deinit(struct kvm_vcpu *vcpu)
 		ext->deinit(vcpu);
 	}
 }
+
+void kvm_riscv_vcpu_sbi_reset(struct kvm_vcpu *vcpu)
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
+		if (scontext->ext_status[idx] != KVM_RISCV_SBI_EXT_STATUS_ENABLED ||
+		    !ext->reset)
+			continue;
+
+		ext->reset(vcpu);
+	}
+}
+
diff --git a/arch/riscv/kvm/vcpu_sbi_sta.c b/arch/riscv/kvm/vcpu_sbi_sta.c
index 5f35427114c1..cc6cb7c8f0e4 100644
--- a/arch/riscv/kvm/vcpu_sbi_sta.c
+++ b/arch/riscv/kvm/vcpu_sbi_sta.c
@@ -16,7 +16,7 @@
 #include <asm/sbi.h>
 #include <asm/uaccess.h>
 
-void kvm_riscv_vcpu_sbi_sta_reset(struct kvm_vcpu *vcpu)
+static void kvm_riscv_vcpu_sbi_sta_reset(struct kvm_vcpu *vcpu)
 {
 	vcpu->arch.sta.shmem = INVALID_GPA;
 	vcpu->arch.sta.last_steal = 0;
@@ -156,6 +156,7 @@ const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_sta = {
 	.extid_end = SBI_EXT_STA,
 	.handler = kvm_sbi_ext_sta_handler,
 	.probe = kvm_sbi_ext_sta_probe,
+	.reset = kvm_riscv_vcpu_sbi_sta_reset,
 };
 
 int kvm_riscv_vcpu_get_reg_sbi_sta(struct kvm_vcpu *vcpu,
-- 
2.49.0

