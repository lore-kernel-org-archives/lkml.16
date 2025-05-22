Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAF323C4F7
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 20:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747946143; cv=none; b=kY5PmC3D0IjQX7EUJY8wY1f+gNryc4M2vZZcqBzYd0SWqegiqdHJOf27F+7HpEIqGqfloygcdDzvPxo84k+Yl46o9b7OPqowLURBQ0cm9x8TcCZTaR2kVj04GV1uk1A8B0W9cjOjCkMQi4dZJJ1V3k5HYC6muM+vt/dltI1mW+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747946143; c=relaxed/simple;
	bh=Kfu3qjguXcD15PsXrkFssgDsTb4P7cLTlIpPbs5OhkA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hMyZzz/LOPruP4N7j4697qlCfM4IaviElZThtlOyYBFH9ODeySR0qnEFd33stXhBxHrmCuPj5aacsq3ph1koFT2jyZHKDNah9/2jdOtkqI0hVuUyklY1n245JRw27bCyzs1hVm7MyyPAVTg01QDwN5GG2cDhuWwjLdT2EIac6Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=EmodXX6G; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="EmodXX6G"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3081fe5987eso7034172a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 13:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747946141; x=1748550941; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VtEdIrem9+Yu9wt2wQL5f6sWXSENwBasckRwFklDCAs=;
        b=EmodXX6GOsjziBt63toFQYDVo+ze5Gs8xvGtwStneRItik17ii+Zm+0u5XfDznzJDl
         4T+gDJKRf4zacs1SJ0wsLl4qNYcUfgSMmeR2WRUTo2QJxnK+RS89gchZBPMiR2wf3Gxa
         X5IgK/BwKzm+A9zjs4TwQWbwc/yJviG8j9RWStmPADYyl/fjiEcklZgcs0qBgf5kebEK
         0QfuUc/H/gbtkSyRGAKkt344UGqxY4ek24fkcLOIIOleMk4uy90q+749kqz/W0BDaxlu
         MErYTa6WYFCwvLzs3quUtARKP73ntj/Dy75VHh5Hpx4/KJMVqOUzXjjMH0NhyoXX3kd8
         ACtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747946141; x=1748550941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VtEdIrem9+Yu9wt2wQL5f6sWXSENwBasckRwFklDCAs=;
        b=B+8et83MVd/+P56JDCUmUTpfR4u5NCnmAQ8T0PeS5wL2Gx2TJF6bKiTc8YIoKaHXIo
         9jMANJImiWo7YMM8oypi69Mxa7gAW9piJcqkGrZ328lMfiI7btIBtZfo2t3neO8dLsyn
         4r+e/+jovBRHPmZPJT6E/DiiBCvTyEihS2kskz8/6rBFCcpkzV5wamb5jBZVpb6w0GNQ
         yaCZdDmOkT1SEuJKUVY0JSFW36uZyoqGdrjlaI2ON9DB0oGPx+dq+khfJhEl9cIjXuyz
         W64ZERmJQ4daQ+HQQa8qnQ7pNmsMN4LoZAdZc7ytSDbPkByaATA2g6JyFW7f0v8M4/HQ
         ZIOA==
X-Forwarded-Encrypted: i=1; AJvYcCUKWUt7BGvvHV05mL2muzYJ17S5zctRiDOWDLIl4jAjFm2s68JgLtF6ux36+Aqn1q9Wj/mj9pkJ0rFw4pc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKmpXtUGoZCJlBc95s+ALS+Rl+51AN5X41LOmhRMcgW7bKIhz/
	3IbP/LsQLhtXq2WuS31k0d4uwqpoFiIsiQsmo+qJUgBMsKj5sVTQuMcDl4DHTmESc9jusrH6F3K
	5W3/D
X-Gm-Gg: ASbGncsGuRC83soETn/ffEYPmH7d9e7JGZnO1tTRQT6c8slnozYijaJlIWLKBXTHKgH
	MbHBX8wrPz/3EO1TpysNIGpOWFjCyg315GquYLBpddruYsR07GpxwvBD0/5yig+/qsPRZEEcF9E
	w7keMbx6nLA62EyYT/UkOji1NTYBUMpBkEGqGG87Hs74FbaxIKSFQpZK3hl+88zYONT2s08pASL
	h8B0nYz/7mtp1ZA3UtQ+nPfamre5q6G8iOFVcPhhk5ffKDWDZ4KK7dXQ85u5oPf8chM1Z6KcSZS
	l3kkUnCV0L3sKKJ0J/ktOE/GKh19ua5XoItHizAKDb86STOEPSGvONmNk4TDDGy4
X-Google-Smtp-Source: AGHT+IGqDOgucStiU9mIVygqIjkW9gQFkzXHNqcolrSvYh0x1SWTXJ0keMr/XGvbvYLot1jB1dLQqg==
X-Received: by 2002:a17:90b:3dc7:b0:310:8d73:d9d9 with SMTP id 98e67ed59e1d1-3108d73da51mr15859023a91.18.1747946141494;
        Thu, 22 May 2025 13:35:41 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365b229csm5932754a91.10.2025.05.22.13.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 13:35:41 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 22 May 2025 13:35:29 -0700
Subject: [PATCH v2 5/5] RISC-V: KVM: Remove the boot time enabling of
 hstateen bits
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-kvm_lazy_enable_stateen-v2-5-b7a84991f1c4@rivosinc.com>
References: <20250522-kvm_lazy_enable_stateen-v2-0-b7a84991f1c4@rivosinc.com>
In-Reply-To: <20250522-kvm_lazy_enable_stateen-v2-0-b7a84991f1c4@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535

All the existing hstateen bits can be enabled at runtime upon
first access now. Remove the default enabling at bootime now.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 02635bac91f1..aa8f7f67646a 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -562,16 +562,6 @@ static void kvm_riscv_vcpu_setup_config(struct kvm_vcpu *vcpu)
 	    !riscv_isa_extension_available(isa, SVADE))
 		cfg->henvcfg |= ENVCFG_ADUE;
 
-	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN)) {
-		cfg->hstateen0 |= SMSTATEEN0_HSENVCFG;
-		if (riscv_isa_extension_available(isa, SSAIA))
-			cfg->hstateen0 |= SMSTATEEN0_AIA_IMSIC |
-					  SMSTATEEN0_AIA |
-					  SMSTATEEN0_AIA_ISEL;
-		if (riscv_isa_extension_available(isa, SMSTATEEN))
-			cfg->hstateen0 |= SMSTATEEN0_SSTATEEN0;
-	}
-
 	cfg->hedeleg = KVM_HEDELEG_DEFAULT;
 	if (vcpu->guest_debug)
 		cfg->hedeleg &= ~BIT(EXC_BREAKPOINT);

-- 
2.43.0

