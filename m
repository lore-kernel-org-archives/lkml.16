Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634CD23C502
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 20:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747946143; cv=none; b=NbtnTjwEVHjAT8Ucml4AvFgjZ3Sb+6Ie3NA9cJv0fKbTw5ju2AqYR1mDfGj5UcE9ZyuuZcwyJOCIgvdBLBXTFTsUlz+s2DSaFvqgwzy3puzYe+781CnajLF/rfALAfYK7abhCdhtPgyNH8kQ7tw+OJjOwnxQdC5oRix3XFTdpi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747946143; c=relaxed/simple;
	bh=LSgyb36sQWDSbDvQ0g/qxWY7gx9lY/2NHbvCnZ4+FcI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gbWhsjTI4f9f86YOUfN6Ug6d8h5x0V4MCLMl7c7CwzibDJgZ57K6EC9LiXOl9r2IpDZ9gEoaY//lsTZTOoCKdMtTzTOF3OoDwWjC0w6ULHfHi7yqe1NzSYl1H5c0V+QwPtZaZJlzNvlbyAT2bdgmyuzHERD/JwvNWgIATZfY69M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=M9aWZq8t; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="M9aWZq8t"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-af6a315b491so6958621a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 13:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747946141; x=1748550941; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6M4N3dwNsXzDfzq+X21m8iWPwOjiKI12kvM05IYIXOY=;
        b=M9aWZq8tsUY49L7xWKdPBnB/eJ0N6KqyQ9tbmKpcDWXZ7nsF5+OcPw/584UItwf9LE
         QpQ6+O7PWJJs6rWsQ1dZjJKRC37YvEsnpPPqNrSNy1MvZ23M1L5yy/oTyIW0c/0HvtHr
         uTtQCTdU52mZWTPbj1TI773F9jguTkt2YCuQG7Q3WKtzsjEzcj+HsfFZJq1RnXQ9FJiS
         93G7y4EmgpzNsgYF92TVyQf6m9Tu6H0juziJmqtmaE9BxzuUhiiqsx0ApyamMYXkta9W
         MdrU705hjsujviju/TzaUmUymsYh8sDXfCaqn7dmtBQCtoAhkSPuvBILXgpQQwRiyi7p
         7UnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747946141; x=1748550941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6M4N3dwNsXzDfzq+X21m8iWPwOjiKI12kvM05IYIXOY=;
        b=bJ2Uvg8qGg1W3Wdgf40Qium856B3G7SXWD4wWIcBzUb4OXvZ2oNykk9/tCAd2d91mD
         w6AyTtsFyW/gtga7ogS79IS8pMo9unD9y5cKXHtCMk9zqOG+7QQxWbpi84gbzRJS30Ih
         j9YImwjzlwzB/Tm4HnRJESDRgp5WkotUreUdOOINHOdCYdRaM3gdV4lL4w/wvIveqd0w
         ZDypoQ6ho1B71NCVRSe3YjFL+aZ469ykiztWc6yZFTFJ9BXPvZbL3F1gnTfdIz3NqoNa
         SjOoxpu09SuRuoDQgppoC+CkxpZM8CfMoMUYmiEmB+mxhUU/Y3mUyVxjykuKl7VK8O5y
         AAOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXb+8tQrUohYmMFiQbvsYGfHz62TNglfAQ5OoC+LZLtroUiUhZ+dYtSKgRHUQE+e6TVS4+2xfskJ3fTgc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9YX0WfxN/A3wnIKWCdcu6MdfbH2Rcf5gjh8XbqLQv5AHfdyHu
	UrrFQ2Mi+Yw14W2Oc9b/uj5Bsu28fQdOsJ1Oc7y/++3pB53KLtPKMF67vrPgVonUrY0=
X-Gm-Gg: ASbGncvk0pf7BwiG404QwUr9xjyqV724mI7v8uRjx8nom3t3plxA6E/YUHb0FlpvT+t
	Ho4qxO8gIDkk1pScOK6YD/XWmkKqhPW8DGcv+NrWMfgX1n0RJTCJImVbBPyv5qiyXs8bDOu29pc
	cPTI2I0C5WFlFrCB2UP3SC/Bcq6RHLcRHkAEv4U8qO0g6qvQQyDjWb+Mvvy7TTY1/T06kanbsYJ
	8OgUlIRo0NHL3YhOPo6t7AjguNDf/ksoLj5no8Ja4EdueYstXtBa7N5Im0gTg9nh01wzVEqu04u
	i1A4gZicZsJaHGmfcurNXkZin0HMImvt0pSk4jvGpZ4LhSr6red9QLA7LxShXAtt
X-Google-Smtp-Source: AGHT+IEPv0Jsk9/CNfphfSQDZY9W54shdTdCOSDBaPAfZ6W//0FD3oLt9iY0h2MagdZeDpunR5yq+Q==
X-Received: by 2002:a17:902:e54e:b0:22e:4b74:5f67 with SMTP id d9443c01a7336-231de376f05mr364633155ad.31.1747946140619;
        Thu, 22 May 2025 13:35:40 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365b229csm5932754a91.10.2025.05.22.13.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 13:35:40 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 22 May 2025 13:35:28 -0700
Subject: [PATCH v2 4/5] RISC-V: KVM: Enable envcfg and sstateen bits lazily
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-kvm_lazy_enable_stateen-v2-4-b7a84991f1c4@rivosinc.com>
References: <20250522-kvm_lazy_enable_stateen-v2-0-b7a84991f1c4@rivosinc.com>
In-Reply-To: <20250522-kvm_lazy_enable_stateen-v2-0-b7a84991f1c4@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535

SENVCFG and SSTATEEN CSRs are controlled by HSENVCFG(62) and
SSTATEEN0(63) bits in hstateen. Enable them lazily at runtime
instead of bootime.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_insn.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index ef4fcb641f1c..6f2bba7533cf 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -265,9 +265,37 @@ int kvm_riscv_vcpu_hstateen_lazy_enable(struct kvm_vcpu *vcpu, unsigned int csr_
 	return KVM_INSN_CONTINUE_SAME_SEPC;
 }
 
+static int kvm_riscv_vcpu_hstateen_enable_senvcfg(struct kvm_vcpu *vcpu,
+						  unsigned int csr_num,
+						  unsigned long *val,
+						  unsigned long new_val,
+						  unsigned long wr_mask)
+{
+	return kvm_riscv_vcpu_hstateen_lazy_enable(vcpu, csr_num, SMSTATEEN0_HSENVCFG);
+}
+
+static int kvm_riscv_vcpu_hstateen_enable_stateen(struct kvm_vcpu *vcpu,
+						  unsigned int csr_num,
+						  unsigned long *val,
+						  unsigned long new_val,
+						  unsigned long wr_mask)
+{
+	const unsigned long *isa = vcpu->arch.isa;
+
+	if (riscv_isa_extension_available(isa, SMSTATEEN))
+		return kvm_riscv_vcpu_hstateen_lazy_enable(vcpu, csr_num, SMSTATEEN0_SSTATEEN0);
+	else
+		return KVM_INSN_EXIT_TO_USER_SPACE;
+}
+
+#define KVM_RISCV_VCPU_STATEEN_CSR_FUNCS \
+{ .base = CSR_SENVCFG,    .count = 1, .func = kvm_riscv_vcpu_hstateen_enable_senvcfg }, \
+{ .base = CSR_SSTATEEN0,  .count = 1, .func = kvm_riscv_vcpu_hstateen_enable_stateen },\
+
 static const struct csr_func csr_funcs[] = {
 	KVM_RISCV_VCPU_AIA_CSR_FUNCS
 	KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS
+	KVM_RISCV_VCPU_STATEEN_CSR_FUNCS
 	{ .base = CSR_SEED, .count = 1, .func = seed_csr_rmw },
 #ifdef CONFIG_32BIT
 	KVM_RISCV_VCPU_AIA_CSR_32BIT_FUNCS

-- 
2.43.0

