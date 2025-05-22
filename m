Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70C029C322
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940636; cv=none; b=IcDcnG3vjILAuZ7G2vo6DPc+NonADZJ9Fi94LlucmGrqvLuyO4vlSOWwCgIZ00COuUsuvQ1m42jMvmBWrpF+9QaimHdKTTKkc4we6euua759RwDomsm4W37Ymwa3Bw6eOgy28/q8nVP/rL1HjVQdjw6d8Ni0uHKuYvQR4enbt6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940636; c=relaxed/simple;
	bh=15uNoWw1oFmc2RxCK2PSoncmAe9FQepCxYJUbSkoVrQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MHjwzb7J4zRGnRS/oZ/jO3IqRWyg2x/0ReZMekWGPXcph7HeD6XSJh1Ky/jijshGoFeRGheP5uetXbmsBEs1xh2yhuZYqU69Je1Yei0/izk638J7o0S8Q0BlYPY8AvGHBq3rs9p9rBdmNTPqeYU0j3Db3l/7El23yZdKrDAnai8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Jvv0HrfZ; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Jvv0HrfZ"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b13e0471a2dso5445216a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747940632; x=1748545432; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hlpauo+rroktx9kyAnwP3yRkffTzlKUHEtIrSQJtdwQ=;
        b=Jvv0HrfZiLEVmlP0FLF2oJo4pr+TqEaSjswrUwy7iqfS3VKpYHVEFc5OFRnxo9pK/t
         yqgdQfE5z5SQt2yEnvdyzdmY/C0QbZhAysbAsoXgFtIjwJBbFpBntMHAaCN8fR4yukA7
         sPpUf3JIgkuL46DO16eUvi2lMgYAOd2k7cxgAE8Wr6SSGsLNx7hu7ZwAd/78/XebEsPG
         qRT30LBXKpWeO3jHHAtMfntlbMP8mGUOKrjBj4qy8Jinda/RRMS8qHGqdyppZRIK1adw
         QBYGYdDygrX2gUr1TLICAlZ5HNdvKx7qJUGDkUm3oR3Aiu7567zbitNQbRzFo7DnyG8y
         N9mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940632; x=1748545432;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hlpauo+rroktx9kyAnwP3yRkffTzlKUHEtIrSQJtdwQ=;
        b=tHYviEoQIp14AW5nq2uevAFtdKUAxiVfyzFng2282Qlq0oDUqK6Dh1v2TYaHw59yqF
         aDBg48eG0OG3OLcFKENXO0SDRs5EJc3tCTDphqq1D+JhvvnO+xoGhq4v3Axn8B9wvLCl
         0T/RL4wycAYr/5RGPf5Pl/kBCFOCUAPC22LnU+/kprWK94ESiceG3wGEDmzAje6EfTDa
         4F3+OTRYEBNXbbDMovBXI1XkMuwLnwj8vJ6bVWNPQbk5wk4A1hKuHMDAJAa+jrCRZ+hW
         F7Y42StRtZ5WuSDMiH6JYAYZQyw4fGNWw/fQLmP9gI6X04umaAYpO3qL6XonSihTTEFr
         95PA==
X-Forwarded-Encrypted: i=1; AJvYcCWmIWcSgUKCE3BSUJxdMBHhWesDnllqvEmpeJCk282dbJ159xiLX9FRYCba0r1iMqnBcPNCetEYidQQe1g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmZEqDl3JZRWZxPrMPYXE7krukuLO//hKnzEaE5CQUHX88XIk1
	wmMysyjHFDGlVoKLbuQCsnuBogheiVqKzjAZVOf+WU5Jlfl873ufUYwHBFKbtb1j5ro=
X-Gm-Gg: ASbGncvwl8IzQoJxbwsmvwjuF1hPCaavN4LPdwb6h/A24KM+Y2U2U23XqsY1AEe8qKh
	1AoPFBdQKNH5Z5jP4UuCG74BeKrk/YZi1N3jbBH6uQekRwly7NBo5vvYXRTTlEN5OBCuYFPpNAG
	Qq+KEXfVfftQXs0RaJd3xNfmUNfOWRy5A43u/1x65yMej2toZUvQHyV+DFlz0uT0iQULR7znzAC
	Inw6Thmt43ES10/iYLI2S5WET9YIp/g3K9gs8WTBqwe092yiMtSK3YIsdNjDByBhTdFe1UayKzc
	uU5JAPwySWLUnWKSsyA69UiCGbJKjJdiVN0cDx/T15Url/YlszBm4PDoAOOQfebq
X-Google-Smtp-Source: AGHT+IFokfHrS0cqFKUDrcGnm0bjUiSThIlPHjvO9RTk66q9cyYFiPgwK1o9zc41Z294fx1ovdpLTA==
X-Received: by 2002:a17:903:1aec:b0:22d:e57a:27a2 with SMTP id d9443c01a7336-231de36bb6bmr358484745ad.23.1747940632165;
        Thu, 22 May 2025 12:03:52 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e9736esm111879155ad.149.2025.05.22.12.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:03:51 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 22 May 2025 12:03:41 -0700
Subject: [PATCH v3 7/9] RISC-V: KVM: Use the new gpa range validate helper
 function
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-pmu_event_info-v3-7-f7bba7fd9cfe@rivosinc.com>
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

Remove the duplicate code and use the new helper function to validate
the shared memory gpa address.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_pmu.c     | 5 +----
 arch/riscv/kvm/vcpu_sbi_sta.c | 6 ++----
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 15d71a7b75ba..163bd4403fd0 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -409,8 +409,6 @@ int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsigned long s
 	int snapshot_area_size = sizeof(struct riscv_pmu_snapshot_data);
 	int sbiret = 0;
 	gpa_t saddr;
-	unsigned long hva;
-	bool writable;
 
 	if (!kvpmu || flags) {
 		sbiret = SBI_ERR_INVALID_PARAM;
@@ -432,8 +430,7 @@ int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsigned long s
 		goto out;
 	}
 
-	hva = kvm_vcpu_gfn_to_hva_prot(vcpu, saddr >> PAGE_SHIFT, &writable);
-	if (kvm_is_error_hva(hva) || !writable) {
+	if (kvm_vcpu_validate_gpa_range(vcpu, saddr, PAGE_SIZE, true)) {
 		sbiret = SBI_ERR_INVALID_ADDRESS;
 		goto out;
 	}
diff --git a/arch/riscv/kvm/vcpu_sbi_sta.c b/arch/riscv/kvm/vcpu_sbi_sta.c
index 5f35427114c1..67dfb613df6a 100644
--- a/arch/riscv/kvm/vcpu_sbi_sta.c
+++ b/arch/riscv/kvm/vcpu_sbi_sta.c
@@ -85,8 +85,6 @@ static int kvm_sbi_sta_steal_time_set_shmem(struct kvm_vcpu *vcpu)
 	unsigned long shmem_phys_hi = cp->a1;
 	u32 flags = cp->a2;
 	struct sbi_sta_struct zero_sta = {0};
-	unsigned long hva;
-	bool writable;
 	gpa_t shmem;
 	int ret;
 
@@ -111,8 +109,8 @@ static int kvm_sbi_sta_steal_time_set_shmem(struct kvm_vcpu *vcpu)
 			return SBI_ERR_INVALID_ADDRESS;
 	}
 
-	hva = kvm_vcpu_gfn_to_hva_prot(vcpu, shmem >> PAGE_SHIFT, &writable);
-	if (kvm_is_error_hva(hva) || !writable)
+	/* The spec requires the shmem to be 64-byte aligned. */
+	if (kvm_vcpu_validate_gpa_range(vcpu, shmem, 64, true))
 		return SBI_ERR_INVALID_ADDRESS;
 
 	ret = kvm_vcpu_write_guest(vcpu, shmem, &zero_sta, sizeof(zero_sta));

-- 
2.43.0

