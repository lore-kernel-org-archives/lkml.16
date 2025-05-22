Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41FE29B219
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940633; cv=none; b=ooEpxd8W95VoBFKzVauoZ86hrx08fKYq0OT8WZ6Gmaj4Ej3Ws1Zq3UBgbhnHFzaN0jgyJsfr1i8Z+lo93Oo0nz+AIJJx+GY3EPUdYUPmFoapxudqhNR/xuNCk9mug5T++U8z+jyPk4QL0Ft29vkJxDZeuEkyeooad/DV9yLi74Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940633; c=relaxed/simple;
	bh=Ty1W0taSmzUHkELzUxGMfb+RxYmgPja/Am3sZkteGZQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h2eCFtDSzHlR4DhEw858WiT1EJpeA7SylyIpucnxZrbukjpy8leWSytzYdv7zk0MHhhjPhkm1vV1q0gEYP2PuPG9mkJpxE3dVfQ95sJprL488YZPZaBkpzhtBL7Olnpz95mTcXtdxuaVUlSu52gZ0Y7d1NEVP/ES6WUYRXXvAlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=smORANQo; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="smORANQo"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2320d06b728so46162035ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747940631; x=1748545431; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vZzBI2/8zxd6TBktJeo9hVnWnoPSXGrqMFkDVMKCuo8=;
        b=smORANQojjDNT7Kdq/AI/RG3vh94JHZcxgEm42nIVhhO7C8NkECpvqPD41lRuNiote
         LvttFFVfv9YTdB94FpGFPhn/1VnfzJlNvhNaVJDQWqwT2aaH+SbDQJsTeOMil29H+jGO
         BJezZrElHD3/eiz6Zs7JkTDP+rbqJ1ye8Dh07BcgyPsmWh4BAd3HcnnSM0sm3jodH2N5
         hNkySnun8Vap8oAsb+kSiYamzgeQaSdOU+SbXfu++0cEiJY+R8AfNAP5VNCGOOWLnKRm
         WRhoZmUwQES88Cl8irIi1LakFDirhVL+CKW3ZoQ3Uj2Pr/WQeYQeio1++3Y9JZLBE9jU
         1lAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940631; x=1748545431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vZzBI2/8zxd6TBktJeo9hVnWnoPSXGrqMFkDVMKCuo8=;
        b=dVvaN8odh6JdjTN4wc694ya1XAwCFx3+S5eHNowuCkpI7ixvhW1c9kVyyzX/ftpF1Y
         6062yZbtd79l/A5Q7lhNBtP+iZukvT7RM5osxi+9ovWRJAR+z5Xosd0uFZbk/b5VS9e7
         7B6xvyQ8sxrb0WFH0T7LGyjYzOU8Lc7KdlpLbbNoUo+uFAWgwi3RcJtDJglXBHEHuq3Y
         cFFDAqH34Qj7drrUvDSm6WjB0ztbMlU5hQq06pqaF4UU7/HDYM3nZ4G+LZPNdO2zOsX2
         VZhUS7XQDx8mCcVKI06LmOrAUKyI+zUWMKxAnZC3lnIT6Y0r1aOkQuXuixKI9w31Rpco
         PnSg==
X-Forwarded-Encrypted: i=1; AJvYcCXv+4bdLFV9bGeNz/+50mofdNHVLBtoz+ZUn1lqYqwlJvdz1fUFlP3PxopiHzbwiq+f82l4FrXc7xqvE80=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxkoqjsahljrh/Wr34a5YReqhR/GgLVTerik1W8eoBxQjZmlp4L
	xOqkozgVXob/TSMnFtzaun4lronvP6sB4P+oeZiJs5JqlTwAdTQmj6FwpqEqOd8bI+E=
X-Gm-Gg: ASbGncvRAusB506WqCQ2H3FNv+8dWFUrLlPHZrCpv+/qXQ/e3Ov87tfwop9ZoOaN0Qf
	fSoaoj5GyPKI8JX45wNxe6CJYz/lbqQN3qsoTABszQeDxrytYEJ3umwJJhtGLHNF0/ZhjaTYDb/
	7EI+9IDOlJbjMW9I/lJrZ/fvkcWyVBth5/ij6DFcpOeva5QPPd92uBUQRh3tAS1jqJ3jQsHP/4q
	D1Q/moq0ASBD6AtyhfxtXZyvH31ttHkNQczyxYCNyz6qkVwe9Ik+gFdKL/SEpoiQ2qlzDwWH7Vi
	N/Mkf9syKMFRIfhhD8Ur5fPL8NOxQMxvZesP2ICz82oy5FbX09hvBFnJ7Mse0BRf
X-Google-Smtp-Source: AGHT+IEr79nTwwFBEJoxFRK5RNwqD1jq2SDcjYk7D0rQW6WwVVGL0IpJIiwt2oBQtuzcW3AhD+odEw==
X-Received: by 2002:a17:903:94f:b0:22c:3609:97ed with SMTP id d9443c01a7336-231d43d9bccmr330946415ad.30.1747940631058;
        Thu, 22 May 2025 12:03:51 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e9736esm111879155ad.149.2025.05.22.12.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:03:50 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 22 May 2025 12:03:40 -0700
Subject: [PATCH v3 6/9] KVM: Add a helper function to validate vcpu gpa
 range
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-pmu_event_info-v3-6-f7bba7fd9cfe@rivosinc.com>
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
In-Reply-To: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535

The arch specific code may need to validate a gpa range if it is a shared
memory between the host and the guest. Currently, there are few places
where it is used in RISC-V implementation. Given the nature of the function
it may be used for other architectures. Hence, a common helper function
is added.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 include/linux/kvm_host.h |  2 ++
 virt/kvm/kvm_main.c      | 21 +++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 291d49b9bf05..adda61cc4072 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1383,6 +1383,8 @@ static inline int kvm_vcpu_map_readonly(struct kvm_vcpu *vcpu, gpa_t gpa,
 
 unsigned long kvm_vcpu_gfn_to_hva(struct kvm_vcpu *vcpu, gfn_t gfn);
 unsigned long kvm_vcpu_gfn_to_hva_prot(struct kvm_vcpu *vcpu, gfn_t gfn, bool *writable);
+int kvm_vcpu_validate_gpa_range(struct kvm_vcpu *vcpu, gpa_t gpa, unsigned long len,
+				bool write_access);
 int kvm_vcpu_read_guest_page(struct kvm_vcpu *vcpu, gfn_t gfn, void *data, int offset,
 			     int len);
 int kvm_vcpu_read_guest_atomic(struct kvm_vcpu *vcpu, gpa_t gpa, void *data,
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index e85b33a92624..3f52f5571fa6 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3301,6 +3301,27 @@ int kvm_vcpu_write_guest(struct kvm_vcpu *vcpu, gpa_t gpa, const void *data,
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_write_guest);
 
+int kvm_vcpu_validate_gpa_range(struct kvm_vcpu *vcpu, gpa_t gpa, unsigned long len,
+				bool write_access)
+{
+	gfn_t gfn = gpa >> PAGE_SHIFT;
+	int seg;
+	int offset = offset_in_page(gpa);
+	bool writable = false;
+	unsigned long hva;
+
+	while ((seg = next_segment(len, offset)) != 0) {
+		hva = kvm_vcpu_gfn_to_hva_prot(vcpu, gfn, &writable);
+		if (kvm_is_error_hva(hva) || (writable ^ write_access))
+			return -EPERM;
+		offset = 0;
+		len -= seg;
+		++gfn;
+	}
+	return 0;
+}
+EXPORT_SYMBOL_GPL(kvm_vcpu_validate_gpa_range);
+
 static int __kvm_gfn_to_hva_cache_init(struct kvm_memslots *slots,
 				       struct gfn_to_hva_cache *ghc,
 				       gpa_t gpa, unsigned long len)

-- 
2.43.0

