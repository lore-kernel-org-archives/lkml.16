Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F65322DF9E
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 10:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747995766; cv=none; b=Kym4kVnhfJIulbFfDPQUYr1IuYlMmvj34Aku9naBG1vjBCSdr2xkn8O2sRHseC0928geHU9WCz0OxRqx64PCY93TrgYhAw5nSV6+hFB8MjdRb4NoHyYoj48K0YVxukwR9cgt3hDwzE7xuFilgerB3rk2kI2XBsq/ZpUIhGzteX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747995766; c=relaxed/simple;
	bh=LuwM4EryVnBA1GFGBe+YaFxQNitu3P/2ZZZc+pRHzRo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TtNSAxx1Oe6Y+91S0V3NdbQBuqH7AdOQHaMyBAxF9dc1Gq3sgtY7wYQd57/kTfKweoJTRKvxDALKjtKkDn641D/inbaCJbPgzhsYXaoscT+Yn6HHKx4Nz5NnckoQXJuCP8AwIA10pRAlURFCfgHOz9CyqQtjs69SUV1wbsHo/yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Q0BQNQUP; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Q0BQNQUP"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7399838db7fso692494b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 03:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747995764; x=1748600564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L4S246g4wPo4d+7PdKHFRm08olDhB+ym0CPBTheC+H4=;
        b=Q0BQNQUPyusy+nFDHKp5S5dQHXS7tAR8A+eJqS9bwitXo0QZjKCFGfYXigXg8lELKP
         yWHqRkr4Z8cK3v1JbM75hCz5htDQ0FxaJsvQFTdFc3p+TNRjS/83dHik4LMibRl+K+y1
         ywvyEcH8vQTgxF90wjCZoz07L4/eVixZQSPRdq6YHvuRXoID87t0Q/fODysC4Fhd/u60
         D/ahhtj7NuPqFwVAwGhjHGfgA96EqQvP8KMVYu/gLNQhPGwKj/lwe17nhLwwfASYKjL5
         H6Gxi2L4XOm9qxnt3wuwr65/s44X3MDULbgC9Z4A4Y+fbpPmLlVo2+X3yYDq6iXLXJgJ
         zDhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747995764; x=1748600564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L4S246g4wPo4d+7PdKHFRm08olDhB+ym0CPBTheC+H4=;
        b=O5T7XMOdSUkh+rwasYdiJeXcm+q7mW0gdcduzHiv9e4AUXrORdGwP6IqsyPAxgsc+m
         rq0RTEHiPxAkawgWnhghYpFo8q3cLQ9Jw4EvBDbVJ0iRa7LMK7wSqu06ERhQP+e9/Jsa
         kM1vnJmBgCo8JGm6BsI2RZYwXucc4ghCxVc+Y2L/ws5VjYVYcPg/DYlYtYZkU8hDIjHr
         kbk7oqCCynEjbVdkqiH4yKBIPvFZNuKRbB0/i0XNddlYiGx8gmw/3n88Jjk+nESn4BU5
         ADOv+cqpSy/n5t63Q4WntQ9qXlOjAyVwjQmm3jOd80a5OeKwiPLogzaMNVVrcX2UtdV0
         m6HQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCUa/DeReCM+hxYWzvypcZQ9OHXX6IU+b3nDI6mKrwcdgCaVKB3+LyngmtaWQRaLo6vkk+MhJstuaHr/A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoFWweTr3WUvT5s88++3yjcyULxJgqbni3aZsSuuow0X/5nthh
	MJwsj4XkwyTnaE4u7wl04nq8XdWreOKj4ZLPiM3JhNLPEzQheJsRT2Qh9vm3RrKTtAQ=
X-Gm-Gg: ASbGncsRjv+9aKODPAL9vEKiynygfCuFz4maer7Mra1Xd7IGxEq5tkFsBbjO9DP1SZq
	UwBXqyDEDApqzPL1YyThnJJZqjJSmAeJqDk83vN1FFfU04Xl10BnZHfxLGSyeo+QvqFOvK6iP+0
	02UrBbRfv9HGiOXtrdFc6E9lF8zIck99nUjXlR0hB6YeWI1CVcHdvzY5WA/0Edc+LLHsrzJXtHb
	Etr778K9PeqfDXgLPBEozu2wBM54/maeaQBVNwEDoZdbIlO5OY9fOVnqVJlyLyXlNo1ltah5wal
	gk6Dpda6RQCzC3gLIMqXwK6opiyTnPvj9Tersgr6YmgqSlMIA/Rs
X-Google-Smtp-Source: AGHT+IH4SSMbmRg5K8o/IXBgX0ZJOEsXjczbFsjn2WjtC7mUPVoS61DQQViAkHrByQ5hjbixI+FQmw==
X-Received: by 2002:a05:6a00:9294:b0:740:6f6:7338 with SMTP id d2e1a72fcca58-745ecdc83c5mr3906723b3a.3.1747995764468;
        Fri, 23 May 2025 03:22:44 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9829ce8sm12466688b3a.118.2025.05.23.03.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 03:22:43 -0700 (PDT)
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
	Charlie Jenkins <charlie@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v8 12/14] RISC-V: KVM: add SBI extension reset callback
Date: Fri, 23 May 2025 12:19:29 +0200
Message-ID: <20250523101932.1594077-13-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523101932.1594077-1-cleger@rivosinc.com>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
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

