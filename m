Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2092036EC
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 06:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747205021; cv=none; b=qYLwB+l4t4hW7OcKZrRFWG06IPjNuSZ8Huu2dJd57VjhXnBN2auRwtWnMcnSqDhaSc/qCKBJ74gOYC4vo+ULYFbOPkLc9pKIywwvhda0w7R7tD3stv27P7+iH9rkj1KhaU+TM9FFMQPkRtCQAGqpdBfiRNmN8z2gOOoais1E5J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747205021; c=relaxed/simple;
	bh=7RSHYTYY1vXkWnRHaetO5zTLkSzSS1sFy2vz/tAGQDo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Br4hq38Wqs5/jdJQvLqblsQ/MuNkHGn/JaHmeW4fKXc0oWxdl84SG4wul9JSwt6MnWQkMp+F89mNb+KpDXMBTUm0HVcOlge6EK4Wlt4W0ydzeK+S88wf6Pz5z4x8FoY7DXg/IBpiH4CEX197zyLO5UQT3cRHzJHpMgYWxzPp9U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=kA9EM3jb; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="kA9EM3jb"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22e45088d6eso81463735ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 23:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747205018; x=1747809818; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yONrDaNM2oGU1RPbJmb0bt05qkmK93VY4fZWYkh3HDI=;
        b=kA9EM3jbsIfV9gfsm2NyI6o3PZdeGuiEKgZTLjpZNMnMUbCfLrPUZbu3MBIaCO11kn
         AE1Wy3ArQD/MTSVJYZlqhpc4DMsATfMUfK5SUV/foN2egitGMihrw9S1d9xdn1ABpfvz
         fD8ZUtD0PopLm2nBTprOEJg+Fs31fNr6jI0mDWPeDNZaPnfM5PBwSTl6X8ZSS+MQy2l2
         WPV/00y6m0h4Q41OWF/VP0x0Qh2Tz3/bLs1RpbX1F+wv+iZnfG0XcLbCG7L2kyblW5kz
         pYSptE0CWUgBRhjRRLrSNF3G1ItkAvxcNMjR5iwOQ98bg0YYeCkdkZvJIWAjsAQUgJ4F
         hD4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747205018; x=1747809818;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yONrDaNM2oGU1RPbJmb0bt05qkmK93VY4fZWYkh3HDI=;
        b=FOo9yHQCV6o2rf9gFXUD3qN5qQ2biwwNIxOa8SSXlleUZnpv6e5BJ6dejzNKVsD0Sb
         oNS3/wRRKmDP7lm9jv44LYsgtOqF01TcAkFUMHLHUgffg6QXHoNXB59JnhBZj6aA3Glc
         3Ous1qCazp83ph/GzZbO7UGQA/hAZlBgvn30KBYhIAZiGnBJ7Cyl6MSvqRiDBIISvbRy
         mVD3l3Lpw5p603FPBZFIaqwkLpGPQrAkGkzc1eVG0+4I3+rNLNF47HF4FEpDDcsmUWer
         ENhyeCkGNE2oqQ0MvIygXZL3coCDbDpdGSRig77C2UqjeHtaCiAk11OO9hVLmWGpElD6
         GRLg==
X-Forwarded-Encrypted: i=1; AJvYcCXddPt1WiMCxju5Mby6iS/Yd79YfK1IgxR+Bl0iWKcsIGsFuIMHyy02Ays7dV80+z5PFwBcZAFiVF1L3Og=@vger.kernel.org
X-Gm-Message-State: AOJu0YyymwCPDPjAkWueBAx81GwTIjXmMpbdhp6F4CPN7kJrp1Db+358
	U581apSN+nvAfki7pId6/LweDFYRbG/e+9tsFA06yZLL7aILn2qURZRMQ/QDQtM=
X-Gm-Gg: ASbGncsIsh0qUZ4zEV1iEHwe4xHA3K0ul18AZPzG3O0poOf7Sr0Bau4LzcUzL1V+MNj
	4toyctE2pBSIN6mvsOJdWZhpLyw5FDLkopPOwpnR0jv43RBye1J31RJv5mqweNEwRCEhrJRQRUn
	B3RigSRsDZATIUKEeeaLijCMmr4SlXFAZweNKlXUkXxC0QWxmfNoO8QbLDNEFc0/8cDHhkwi9I0
	l6Ill2RrMi12DG2s8WaF+cuC+X0aUuOYMDWZaYIjDc7/v4V5Hun6RTvUkMKVmq9Rtc8nhggt1n0
	8ckXjYKKnu559HGNqlbW9tEpym0RnUdvRdlqNwITDQoxLXFUhijh+VNa0ni7vZpx
X-Google-Smtp-Source: AGHT+IEoClrF6lVQwqc84P3HpmaPMlZK//yuTk+XbXPKwiAjohsYztxOGGMEpufYrZ8rdGMMsjvwEA==
X-Received: by 2002:a17:903:2f85:b0:223:5ca8:5ecb with SMTP id d9443c01a7336-23198143b9bmr30190855ad.42.1747205018359;
        Tue, 13 May 2025 23:43:38 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7544e49sm91978485ad.51.2025.05.13.23.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 23:43:37 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 13 May 2025 23:43:30 -0700
Subject: [PATCH] RISC-V: KVM: Disable instret/cycle for VU mode by default
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-fix_scounteren_vs-v1-1-c1f52af93c79@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAJE7JGgC/x2MQQqAIBAAvxJ7TijDjL4SIaVr7cXCLQmkvycdB
 2YmA2MkZBirDBETMR2hQFtXYPclbCjIFQbZSNWothOeHsP2uMOFEYNJLLxzQy+VsnrVULozYpH
 +5zS/7wdhSXygYwAAAA==
X-Change-ID: 20250513-fix_scounteren_vs-fdd86255c7b7
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535

The KVM virtualizes PMU in RISC-V and disables all counter access except
TM bit by default vi hstateen CSR. There is no benefit in enabling CY/TM
bits in scounteren for the guest user space as it can't be run without
hcounteren anyways.

Allow only TM bit which matches the hcounteren default setting.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 60d684c76c58..873593bfe610 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -146,8 +146,8 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 	if (kvm_riscv_vcpu_alloc_vector_context(vcpu, cntx))
 		return -ENOMEM;
 
-	/* By default, make CY, TM, and IR counters accessible in VU mode */
-	reset_csr->scounteren = 0x7;
+	/* By default, only TM should be accessible in VU mode */
+	reset_csr->scounteren = 0x2;
 
 	/* Setup VCPU timer */
 	kvm_riscv_vcpu_timer_init(vcpu);

---
base-commit: 01f95500a162fca88cefab9ed64ceded5afabc12
change-id: 20250513-fix_scounteren_vs-fdd86255c7b7
--
Regards,
Atish patra

