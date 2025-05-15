Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506BE298270
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747297444; cv=none; b=ejdntT/UBNjCFijV7XsNh70/YKCULw5Se7mIWNY7t5cx4CRVqB+3MBdqVvM6YQn+ANyCUBiHAuuf5LVxR7DXNbSnBuMLC2xwEoVhS0s8NurhTuFfs/pSb/iSvUDPeLNoKGdJ/iS9dTMdTSYozgohwuI16UFUD46zKRbZM7E8tQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747297444; c=relaxed/simple;
	bh=wG4jSd8CN6FwtzgDKxT0M5vr7EjYV2+jFHLq7+TPn04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YdKDoLORurrJLRKtmE816mRnA61mVRUWRvFgASH1ou+hQzrS8T9G9uPGPtvqJQU4d8qifdrASbq2V/X0AdjOFpz1xdr/EFFUTZkQ0q/TOELlzhyIITcEgEBPmb4Q2WobyQal/+/4eglxhskin5NpTAfNRhv/6Nw+MDxSaxAA9U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=P6rSOHf4; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="P6rSOHf4"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so5035575e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 01:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747297441; x=1747902241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2HRRvwQZR7OY0o40CF4iX42SSRrEHUJjKFBagu/MDOQ=;
        b=P6rSOHf4XFz3hFZ++OLZYVX/IcEe7laXu7/0HmAw5KPJ+fSSEm0nGzYbwvdRFV7nBP
         /UtBknM5XK1darwGv1FKqmIy5tdFQGR7UXv01+95Mgmyw1aMQ8c3kLZHYioKg7ameXwV
         EtRWaXN2dwtx+qJd8OGkVSFyYQ1iHbuGMXE3GDHIOv38BWqrxc8BSS2WTodYs+cPnLZX
         CrD97dg4yiZ5qfxDfW0T8PaLP0cxOAUgRfFaQ53JisImOIs9M8XNgZZJ3nrSCDwj7QO0
         koP5V2EoDO4Me2sWADdLRZYYfV4bKTXvlMS0svFHr+CbBk3tM36mTcrdSy5Dx1WtC8Fl
         /01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747297441; x=1747902241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2HRRvwQZR7OY0o40CF4iX42SSRrEHUJjKFBagu/MDOQ=;
        b=Fla1Hgtfy+ke6igyGEqPpspIW1WIisDih5uLLb+veHIAsFW0WAktYuepNSOtw8Ck2S
         BAGfmCzVvrYEZj0DSe0u/TRiBuHGk4tNvKcCysuHpj60tAftwPeu7jR1ObeWqYvC2tnZ
         fWowCwVKNUQVjkfCbCK1HPAes73JAVwxruAk7Oj7x+4V05/K0Tx7VUYV4zqT6TTPZS7Y
         KR5TrnFgxbfxJOnCt3PJQoAK+L4x4vze4sOCxCJbKRm3yLP3yus8n14peGN1gNAshJDt
         MZSDgg5KKS2hLIZ3DyIkUnljE9rWmKe2SzbI487ShQLvCJBKilHrFFX0FEjpoL9OEv9T
         kfeg==
X-Forwarded-Encrypted: i=1; AJvYcCWfnl+jB/y2u9fO8ZeOq2PoTilHSemOxgZg+z1s/qbCGdoNpwNYcd0goZs3AuiJJXUvEp7yoGFqHc4lTN0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwbZqU9zw6YGVjpNHuHPONBu4f4Uw67MGUF99q8Aom0V0r7SED
	ChCLDxnWRrjOoY72F4l5EIViSDtooUC+Ozzq6EkQWvQjD8P/Y6qojOtR0sIVlrs=
X-Gm-Gg: ASbGncuCYlAZh7QhQgCB7CypfjMVBGFG2PZV6I5GulOACAkU19Ieehrqkmu8KdjNU0r
	6deofxSvgjugLfb1bTBLIOZ59h8wiWdkXuI65ekvNTLpImupsqLydPlWStlB6HGHsPBKH1VVW+H
	CR+f/II2IzUyVcmHvbtOjIfLi1KM6RN1jhGcu3soXLRwI8hjV6gsddM/IxMwvez27lJqPt2BJ1J
	RD6nRaAKwYzFP2jY2qlffTSNbJQ4UUM7htYiO5U9+ONrPmWYrzBg8CjCf2ij+1CAgDTm2yxKlNM
	gnr6EX7ZrNnWxtazQqUTEFqYeDjk6j4tgnh4pnfGSb/AOKC9HanKj+ucVgq0XA==
X-Google-Smtp-Source: AGHT+IEl4xkkhRV/6rqGgqq8GhxlIIH1Zsk+aKdZ8qLIk9sfmfbfHiVPZ4lcOrwQMJaY11G/EM+wbA==
X-Received: by 2002:a05:600c:3f0f:b0:43d:fa58:8378 with SMTP id 5b1f17b1804b1-442f9714e8amr13194375e9.33.1747297440668;
        Thu, 15 May 2025 01:24:00 -0700 (PDT)
Received: from carbon-x1.. ([91.197.138.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f395166fsm59310785e9.18.2025.05.15.01.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:23:59 -0700 (PDT)
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
	Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v7 14/14] RISC-V: KVM: add support for SBI_FWFT_MISALIGNED_DELEG
Date: Thu, 15 May 2025 10:22:15 +0200
Message-ID: <20250515082217.433227-15-cleger@rivosinc.com>
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

SBI_FWFT_MISALIGNED_DELEG needs hedeleg to be modified to delegate
misaligned load/store exceptions. Save and restore it during CPU
load/put.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_sbi_fwft.c | 41 ++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
index b0f66c7bf010..6770c043bbcb 100644
--- a/arch/riscv/kvm/vcpu_sbi_fwft.c
+++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
@@ -14,6 +14,8 @@
 #include <asm/kvm_vcpu_sbi.h>
 #include <asm/kvm_vcpu_sbi_fwft.h>
 
+#define MIS_DELEG (BIT_ULL(EXC_LOAD_MISALIGNED) | BIT_ULL(EXC_STORE_MISALIGNED))
+
 struct kvm_sbi_fwft_feature {
 	/**
 	 * @id: Feature ID
@@ -68,7 +70,46 @@ static bool kvm_fwft_is_defined_feature(enum sbi_fwft_feature_t feature)
 	return false;
 }
 
+static bool kvm_sbi_fwft_misaligned_delegation_supported(struct kvm_vcpu *vcpu)
+{
+	return misaligned_traps_can_delegate();
+}
+
+static long kvm_sbi_fwft_set_misaligned_delegation(struct kvm_vcpu *vcpu,
+					struct kvm_sbi_fwft_config *conf,
+					unsigned long value)
+{
+	struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
+
+	if (value == 1) {
+		cfg->hedeleg |= MIS_DELEG;
+		csr_set(CSR_HEDELEG, MIS_DELEG);
+	} else if (value == 0) {
+		cfg->hedeleg &= ~MIS_DELEG;
+		csr_clear(CSR_HEDELEG, MIS_DELEG);
+	} else {
+		return SBI_ERR_INVALID_PARAM;
+	}
+
+	return SBI_SUCCESS;
+}
+
+static long kvm_sbi_fwft_get_misaligned_delegation(struct kvm_vcpu *vcpu,
+					struct kvm_sbi_fwft_config *conf,
+					unsigned long *value)
+{
+	*value = (csr_read(CSR_HEDELEG) & MIS_DELEG) == MIS_DELEG;
+
+	return SBI_SUCCESS;
+}
+
 static const struct kvm_sbi_fwft_feature features[] = {
+	{
+		.id = SBI_FWFT_MISALIGNED_EXC_DELEG,
+		.supported = kvm_sbi_fwft_misaligned_delegation_supported,
+		.set = kvm_sbi_fwft_set_misaligned_delegation,
+		.get = kvm_sbi_fwft_get_misaligned_delegation,
+	},
 };
 
 static struct kvm_sbi_fwft_config *
-- 
2.49.0

