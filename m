Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D39F24BD00
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 11:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743679936; cv=none; b=doZfN0akzh0F5+P7KHq29qSDqU1hxA37rGmvFOGn5tnSEWShc4nais3ErjlY1yUzSbsFBbIZFl1zm83uiV6BM4imAz3Yx2EFY1IGD8hUj19hhlLKPd0OOb0xmMuLznZJTAUxmqhJVXYEyn4sxBeTyLa4vac/tFWXOUeLGb9soKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743679936; c=relaxed/simple;
	bh=+GFvOqrtYIALOn93rXdbiqNBHhDWTrxxaHkH9JUVZDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z/6SNzNNwlk4cXurUkihlwF2+xavKNqxdGQZblx7LypUgpJLliBu3NihWV3Qalz2IImUNQgONxRv9uE4/pP8DsCWyP4Ain4pwQ4l6i+z9dS18OU/heZdeIQ02l6m6i3LuzJLahDMVnaQm+ggeRs6eO41bassJt3wbfG+1hL/fVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=dFhVUUPX; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="dFhVUUPX"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43d16a01deaso792715e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 04:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1743679933; x=1744284733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WBJFdG3z/8VkLDYY4XL1oPtAwDow6ej1t0aXVg/kRKM=;
        b=dFhVUUPX7YI8pZe6UMH/jRIIvPZGFyyY4q/Pkk0tXrS2NI7sA3SFxZzVw/C4APXbKW
         m6PvLmNosQyT0GOSvq5s46NL+Q3992qxQsLcB2U0Nrewt6xUot9rw7X/BLMGjGNh//sB
         bL3vXttoaWwE+09Zc5VZpANxHZL8xJjkpTv5u7I4AL+Z/wcn88UwLpO7rts/J64o75UE
         cfGknoT5dgjVJjFUgWiozKFuWSqvut/vpFDPeKNSus/H4SSHeUWcgYQGTuSmbWHxj0MH
         jPBg8BQJWcFQWVAZ/yFc/iJb+egXEa7khKD9oP3FT68KMHd0uh0s8ClcTliu+EAmuwBI
         ZGXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743679933; x=1744284733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WBJFdG3z/8VkLDYY4XL1oPtAwDow6ej1t0aXVg/kRKM=;
        b=NqJxNz4armfvzwkmyxvjJyMWQmZ+qzobL1vgo7KcYD2Tzrqc/5n57l/LYQoQVwFUEf
         IE+VaqQslcrgtmP9qxN8yK/rPMLAnswfxEBRIvaSWiAecqS+NTweL8lCLVG1zGTi2HFO
         t2dRXvYqXYwvS38+cYKw599XXl1HCEQ41/WCPE1qptupmB8dGrvP6X1E643ssI6nmhys
         at/gf1nstnbziZc4wQZT0xWSP2vT+7oheJTSHdwKr3HLb1zwAK+VJW7OeI5hl0CRLH5k
         T0FjYJveNA/SHkBftLXWLuPeS2k06/sDUYBORptWv4XBnkawI1NlTTwxW7uHbhn1zdtc
         vFLg==
X-Forwarded-Encrypted: i=1; AJvYcCXlrGR1pSMnTysusFH89KQawhkxVudkj7DZW+ZKcPQbkHdab2XENgzBjKw5JwxCYpn9qf/oKdLeuSvoBsw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqpHVFMwci3910GSOaLtE9LjVsu0F85CUtVDAfuWVhpNc9+DaU
	KLzDFIiz7Nn4t6y7rLucw/BOFrCFFINAyKLfBikjJTUCDvyC3Pqu41msZOn76ND/jwnvelFqbBe
	i
X-Gm-Gg: ASbGncun8J+LpETqZgdQKZcIRRWgtCp/weN45j1+lzQUAfXe4I/w5Gp5NsHnh4jtrR3
	Nt1ss5bxkh/BzcLvfnkvXl9QsCXl111y0qUOMUbp1UfIwzntTUQ5SmbmEmulcAFqC+Ie+fcMMqT
	DdNedfkyPstcLGSSyx70y2vQxdPtVJ8FBx3Xdu5oSzqXhsrLSpqm78ncv+kwNR0pwnCjC2iJYaC
	ni9DEgdY91RlChJDFzRiZEPBPEO57cgyR+tWm/Dsj0Au0hh/IJo7buIgwoRXL3SqUNta/NrVCeS
	UncZLjtB0xvAJgVgEJRjx4zugF3BBYHKrjhQDASN0OBsH3BzE/Sd4z5/I70s25iV2MqOTPpG/mL
	Jog==
X-Google-Smtp-Source: AGHT+IEmT1nc0GRaKk4V5Lw6Y+h94knU+oKxuBtmIqWaoagUJp23E2laTFWN8HrLfDImIKVCRKrM7g==
X-Received: by 2002:a05:600c:3510:b0:43b:c825:6cde with SMTP id 5b1f17b1804b1-43ea93540demr38321015e9.3.1743679933409;
        Thu, 03 Apr 2025 04:32:13 -0700 (PDT)
Received: from localhost (cst2-173-141.cust.vodafone.cz. [31.30.173.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec3429f67sm16500145e9.7.2025.04.03.04.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 04:32:13 -0700 (PDT)
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
Subject: [PATCH 2/5] KVM: RISC-V: refactor sbi reset request
Date: Thu,  3 Apr 2025 13:25:21 +0200
Message-ID: <20250403112522.1566629-5-rkrcmar@ventanamicro.com>
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

The same code is used twice and SBI reset sets only two variables.

Signed-off-by: Radim Krčmář <rkrcmar@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  2 ++
 arch/riscv/kvm/vcpu_sbi.c             | 12 ++++++++++++
 arch/riscv/kvm/vcpu_sbi_hsm.c         | 13 +------------
 arch/riscv/kvm/vcpu_sbi_system.c      | 10 +---------
 4 files changed, 16 insertions(+), 21 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index 4ed6203cdd30..aaaa81355276 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -55,6 +55,8 @@ void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run);
 void kvm_riscv_vcpu_sbi_system_reset(struct kvm_vcpu *vcpu,
 				     struct kvm_run *run,
 				     u32 type, u64 flags);
+void kvm_riscv_vcpu_sbi_request_reset(struct kvm_vcpu *vcpu,
+                                      unsigned long pc, unsigned long a1);
 int kvm_riscv_vcpu_sbi_return(struct kvm_vcpu *vcpu, struct kvm_run *run);
 int kvm_riscv_vcpu_set_reg_sbi_ext(struct kvm_vcpu *vcpu,
 				   const struct kvm_one_reg *reg);
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index d1c83a77735e..f58368f7df1d 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -156,6 +156,18 @@ void kvm_riscv_vcpu_sbi_system_reset(struct kvm_vcpu *vcpu,
 	run->exit_reason = KVM_EXIT_SYSTEM_EVENT;
 }
 
+void kvm_riscv_vcpu_sbi_request_reset(struct kvm_vcpu *vcpu,
+                                      unsigned long pc, unsigned long a1)
+{
+	spin_lock(&vcpu->arch.reset_cntx_lock);
+	vcpu->arch.guest_reset_context.sepc = pc;
+	vcpu->arch.guest_reset_context.a0 = vcpu->vcpu_id;
+	vcpu->arch.guest_reset_context.a1 = a1;
+	spin_unlock(&vcpu->arch.reset_cntx_lock);
+
+	kvm_make_request(KVM_REQ_VCPU_RESET, vcpu);
+}
+
 int kvm_riscv_vcpu_sbi_return(struct kvm_vcpu *vcpu, struct kvm_run *run)
 {
 	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
diff --git a/arch/riscv/kvm/vcpu_sbi_hsm.c b/arch/riscv/kvm/vcpu_sbi_hsm.c
index 3070bb31745d..f26207f84bab 100644
--- a/arch/riscv/kvm/vcpu_sbi_hsm.c
+++ b/arch/riscv/kvm/vcpu_sbi_hsm.c
@@ -15,7 +15,6 @@
 
 static int kvm_sbi_hsm_vcpu_start(struct kvm_vcpu *vcpu)
 {
-	struct kvm_cpu_context *reset_cntx;
 	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
 	struct kvm_vcpu *target_vcpu;
 	unsigned long target_vcpuid = cp->a0;
@@ -32,17 +31,7 @@ static int kvm_sbi_hsm_vcpu_start(struct kvm_vcpu *vcpu)
 		goto out;
 	}
 
-	spin_lock(&target_vcpu->arch.reset_cntx_lock);
-	reset_cntx = &target_vcpu->arch.guest_reset_context;
-	/* start address */
-	reset_cntx->sepc = cp->a1;
-	/* target vcpu id to start */
-	reset_cntx->a0 = target_vcpuid;
-	/* private data passed from kernel */
-	reset_cntx->a1 = cp->a2;
-	spin_unlock(&target_vcpu->arch.reset_cntx_lock);
-
-	kvm_make_request(KVM_REQ_VCPU_RESET, target_vcpu);
+	kvm_riscv_vcpu_sbi_request_reset(target_vcpu, cp->a1, cp->a2);
 
 	__kvm_riscv_vcpu_power_on(target_vcpu);
 
diff --git a/arch/riscv/kvm/vcpu_sbi_system.c b/arch/riscv/kvm/vcpu_sbi_system.c
index bc0ebba89003..359be90b0fc5 100644
--- a/arch/riscv/kvm/vcpu_sbi_system.c
+++ b/arch/riscv/kvm/vcpu_sbi_system.c
@@ -13,7 +13,6 @@ static int kvm_sbi_ext_susp_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 				    struct kvm_vcpu_sbi_return *retdata)
 {
 	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
-	struct kvm_cpu_context *reset_cntx;
 	unsigned long funcid = cp->a6;
 	unsigned long hva, i;
 	struct kvm_vcpu *tmp;
@@ -45,14 +44,7 @@ static int kvm_sbi_ext_susp_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			}
 		}
 
-		spin_lock(&vcpu->arch.reset_cntx_lock);
-		reset_cntx = &vcpu->arch.guest_reset_context;
-		reset_cntx->sepc = cp->a1;
-		reset_cntx->a0 = vcpu->vcpu_id;
-		reset_cntx->a1 = cp->a2;
-		spin_unlock(&vcpu->arch.reset_cntx_lock);
-
-		kvm_make_request(KVM_REQ_VCPU_RESET, vcpu);
+		kvm_riscv_vcpu_sbi_request_reset(vcpu, cp->a1, cp->a2);
 
 		/* userspace provides the suspend implementation */
 		kvm_riscv_vcpu_sbi_forward(vcpu, run);
-- 
2.48.1

