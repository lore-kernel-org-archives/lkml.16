Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D79C2750EE
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 21:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746481183; cv=none; b=VgWAhun12RRNjZgnEhuSbA6H/dFFZewi2kAQ0fwUv6E77qImO0ijiebrcXbRPdMIpBUzOc/lQGOYiluOVCk0hJ2t5aJLjOppO0Kwjr0BS7Q2Wi7Siaz4AZ2G9o14PRpeiK1bwt3OJ7UMO9nEzBIKqc5/LwsXVuDP8rB18nSvBm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746481183; c=relaxed/simple;
	bh=Pilds4nP9as2uF+L6ux+DctIi0+jR0fPhf8pONUM1gk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=neidJnctNsYvhdGeRxGFPg3dSVJho7LBnDZ76FGHpubNcIfVEzkYnsZhBLb9lAxBmUTBcBlyKUkSbjPpLPaOtBqzQGLTcbJzKs49xEEMJ3/N1mMx+0E/z4F82YwcCHPsFCJ18woKck5SEHai4/U4P1oet3JI6rjumRho3boY5cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=J8gGG4nM; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="J8gGG4nM"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22401f4d35aso58349605ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 14:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746481180; x=1747085980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AS5RZ2dErdCUnakbj1eEwsrgZNqL04KOmjC/MeeOuAI=;
        b=J8gGG4nMH/dUDO6KMjXr7gli7Q6hrv3mRaBQBIegxdPdDqEAtr72Lhy9QfTweVzjYg
         SqD8ErLRBdKwIe/zDIwogG7cUFAs0zLynT2TXvmsEHhsltIevC74kcq39xanMVGEydMD
         JqfbvTGtM0lIAMzZQ1eA4ZuLZxbg0d5ek29WzQGN1dpBx0i7SKi0oFdQgtblx+giwZtr
         Cskf5gexY3MTgFxPqOi5974BNsSHd4s+v0QGR3eREwYmdkkv9toKtC9TXVlRF7F1Qez8
         XzuAI4tFBTNU694UV8wuiMLF/O8BP+haTBgqiE+0aLeT32RiHvh8Cti/BEKJlAKSbd9S
         e2fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746481180; x=1747085980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AS5RZ2dErdCUnakbj1eEwsrgZNqL04KOmjC/MeeOuAI=;
        b=mlEKGyiohX+oGYHIOsD4n3CO2qtz3NDBo0Cd04pqulPQAk5SJsuNh7ZQ3rt49Lf11w
         4u0qWSHyVMZxVzTCFHOIJ9A1M/gBA12OuvPrsPDZHCkQYUehqRs8tjMVLJ1sNOywJeGy
         oGDwRvcovrMMx6Jkx1CAupxNL6ZssZBGgSpQhNaE/bfLWiNZ63uWbz32nGJgnB0z3581
         q80WU4jwlkA7yahMhHlxZQZO4Wm4qFxVaT+YUKWSnLwrROOHvis1TbR4pHSX9SBOEuNb
         zzg38geV+oXqf1BYEG7/frniUw+PPpTXXMT+vu5XuNdJ8D1Yhd05n94Yd7te5lwGCeJD
         XcuA==
X-Forwarded-Encrypted: i=1; AJvYcCUfKtBssN8ddYvINaRwYRho79Cxd5OzkxoeZduqPpl/AR9LijEdHYPK+w01KvcCqL6nbwVmorRIzI5Ba64=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOKVaToYL62Sv1i6SRVgNdPoBwg+VY3bv0vsQLO1yNbtGN8okt
	ZgQtWZV0FxMdMrlhirTG3FCo9p+E+fZWDHZCJUAuLm3YdSU6ut5cojUhWnrgMdc=
X-Gm-Gg: ASbGnctDA341xlg05HyRKqLcrM2aKpFgHCcGCV+TaL8M4G5VYUOBdfBxbCBYOn72AE1
	IG570hOpB6OFLsKqqlYCW2w+gidaiBniw8NXHT9scY6MYRbmcN+LA5XMaa57XQ3wCnhaBVkpvXN
	Z8apzBR7Bd7TywRpTiA/vDvnZHy26/dUoXGa+OJkthlNaPXx8GrqvryBldNu0xoo+OUDih/V1RU
	MJcstnzfCO0BQB4sPwgQDS7hiZcxcy/ssRRrlc9JpS9vLyuMWQXRuxSUtZFm8fmlXtV2Z2c2YSE
	KzOrE7RpOGaccI7TXb1HBHagWELmkpris65eIF4Aczlon+LKHCGUCQ==
X-Google-Smtp-Source: AGHT+IF0cdGfyegYWS2h3g8K1ylrRO9RH/TBuX+Z6nJcjOdwQsA79eqmv6Tj/3cv8UZxiuHtVwsgFA==
X-Received: by 2002:a17:903:22c7:b0:225:abd2:5e39 with SMTP id d9443c01a7336-22e3633a6abmr7949715ad.30.1746481180682;
        Mon, 05 May 2025 14:39:40 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058df12d8sm7388599b3a.78.2025.05.05.14.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 14:39:40 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 05 May 2025 14:39:30 -0700
Subject: [PATCH 5/5] RISC-V: KVM: Remove the boot time enabling of hstateen
 bits
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-kvm_lazy_enable_stateen-v1-5-3bfc4008373c@rivosinc.com>
References: <20250505-kvm_lazy_enable_stateen-v1-0-3bfc4008373c@rivosinc.com>
In-Reply-To: <20250505-kvm_lazy_enable_stateen-v1-0-3bfc4008373c@rivosinc.com>
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
index 60d684c76c58..0aaa9e0e4a01 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -560,16 +560,6 @@ static void kvm_riscv_vcpu_setup_config(struct kvm_vcpu *vcpu)
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

