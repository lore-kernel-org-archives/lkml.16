Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F99289814
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940630; cv=none; b=QjTmVfzjpp6fy43P9OjbLh/HEPyjNDklr7qrFxq9SBA2TwsZcm9EK6cfudDDXiBLm+YGoZam5TxNEjy5s4HPROXUlV0oVFLl4drVvdYt+R2B8IV34j5VWA5jab+n2hAPXL2zL+mjUMmyem2dNtAk654ucf4AB1fL1asuaUFTMdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940630; c=relaxed/simple;
	bh=rbEY388+vf1xBc6RFqGTgB4Goxixu7Il6QwVlf57D/w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S/aaW9lNzPLflvu6CeUSnDGbAnht7jkVJzyvx4HEn7Vxs7Sz5ibn0WdUiIPRa+3m9hU5CF6QKtgS6qAlQvAU3dh/yiCnUSkkQ5nOiZvHbj/nBlHiZZY46KSPpqUSI3udFgQ3LmZb0aUYzZPcteO2nyRCG67mWwC1CvE1pTsVOyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=AsiODRO8; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="AsiODRO8"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2322bace4ceso47538425ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747940627; x=1748545427; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MgSYDCFyOFl1ODnG5fRD1TrPKu6WyFc6mOzCNie7R+g=;
        b=AsiODRO8H2rBIh6sLO7S049C/CObiWyhOO0hyOr/g2gnv0rzr7bbLSWn1z9yVSksKX
         kYmlQ66TcsIIq93jgFZnwnKd8DlEBUQhSyzhEs3aV6KzgZceYRHJtFyiQwSj9gXafJ2V
         gUQ2LranTDclUq99NUqsTo1hKhQ19PUa9/kpq8yW30OeXkOEjWVTyiQC8K4gX0Ds6L+A
         MbJVDMfvYp0boysfv7DokZY1RBejnkEzdrckejpvOkkrPLDb54tA2J5EBXLtwXPg1psp
         I/bsc9iG78DhfvNa3xfLqSEuPt/GS4a1iwUoxJfua1hUMI+NAl5nsBEwpYMiy6eUrAGB
         tgbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940627; x=1748545427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MgSYDCFyOFl1ODnG5fRD1TrPKu6WyFc6mOzCNie7R+g=;
        b=Dm9UOlU9EL4RRV3+ubw/W4iEkT5sFIY7yRYTKDv0aWoxpj7WKTyRDgus2uBhn3Jl2q
         4NkdwEcfjvvwT3yavyJ08QCS4mHSIAB6mWjK/moxl9+9Id1Qa5v9OAVEqnjF8BKF+QxM
         eBd4k2AWlY8oeW6OppbepZBv7e6Qa80F+3xUmnVeFEtazXAk8quylcP9+gaenz6Jj3Sr
         imc8TEdJJGEW7MRqXjfudMIY4r46MNckfSRm2+tnDi6zgvk/rWtuSF67C0Vv4UXrd7WP
         +haHf33ojeiyVJi9s9ilSI/jZxZglkk1HfsQXvwQFiaiCAY3rh6BTgLXdrLL2RrLv5NW
         XRGA==
X-Forwarded-Encrypted: i=1; AJvYcCW0SUjVeZsu4t2TV2u1HRf7SSqCFj1IqWx+uKRXnpFle8yuL25L9U3uQM0gb0NBxQN9k9oAsskvnpieCVI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNErYvUFVKKi1wrfeW6EzXVaMsfzpAp9YKT07AdPwFeLI7t2nH
	ajar/3bObq5G0pcRMTh+KsqHwXjEcY6LvSsGv8KRgZSmcVRnauyBTWVKMYZOdJXcty0=
X-Gm-Gg: ASbGncty/HuokqhcW11uHtIYqv8rHEVxVU5gRIP2zQ8Bw9mUhrOB/nd5U/OOs8JLhbA
	ndlHWGhGJQbJwg0kOCfn0ZqmZKImcs9HDfVaJkZHCalvHqcHr4+S6zIx5RR3pPsxZhDqlpEhhtk
	/WRfh0+W/vVNy3l8lRaxqKUfQi8bEvIgcqill0QqOhdhoUVwSenP+79XBfNxE2VR5cx3s6shIaA
	VEZ+9XZTq1o5HRp5NJvG5D0cXTbK33nDC92c0hOXRIMFuzD7ouz3wPmOsIhvztDYk8tYafpTSze
	6CHCXthGGFSbDPPwV+Byd0/gpXZNjqaT7RNaJHKXLY6F2Tu7C7ez8zXQlOzeWHIF
X-Google-Smtp-Source: AGHT+IGs856eL1BrViuwG7Snet4kjwTZqseUJx/cN/TovXlD6rlR9pixORAh5bRSKluNwVXzmFHaxw==
X-Received: by 2002:a17:903:2301:b0:22e:364b:4f3e with SMTP id d9443c01a7336-231d4562cc5mr379326455ad.49.1747940627664;
        Thu, 22 May 2025 12:03:47 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e9736esm111879155ad.149.2025.05.22.12.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:03:47 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 22 May 2025 12:03:37 -0700
Subject: [PATCH v3 3/9] RISC-V: KVM: Add support for Raw event v2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-pmu_event_info-v3-3-f7bba7fd9cfe@rivosinc.com>
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

SBI v3.0 introuced a new raw event type v2 for wider mhpmeventX
programming. Add the support in kvm for that.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_pmu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 78ac3216a54d..15d71a7b75ba 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -60,6 +60,7 @@ static u32 kvm_pmu_get_perf_event_type(unsigned long eidx)
 		type = PERF_TYPE_HW_CACHE;
 		break;
 	case SBI_PMU_EVENT_TYPE_RAW:
+	case SBI_PMU_EVENT_TYPE_RAW_V2:
 	case SBI_PMU_EVENT_TYPE_FW:
 		type = PERF_TYPE_RAW;
 		break;
@@ -128,6 +129,9 @@ static u64 kvm_pmu_get_perf_event_config(unsigned long eidx, uint64_t evt_data)
 	case SBI_PMU_EVENT_TYPE_RAW:
 		config = evt_data & RISCV_PMU_RAW_EVENT_MASK;
 		break;
+	case SBI_PMU_EVENT_TYPE_RAW_V2:
+		config = evt_data & RISCV_PMU_RAW_EVENT_V2_MASK;
+		break;
 	case SBI_PMU_EVENT_TYPE_FW:
 		if (ecode < SBI_PMU_FW_MAX)
 			config = (1ULL << 63) | ecode;

-- 
2.43.0

