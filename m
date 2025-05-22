Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E5329C328
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940636; cv=none; b=kreiarBCjR6QtsY99aV3WZBVV//Vsj2EhsYgLBqW1OAMl3ZVU7k/on5fZv4N73kMe60mwnvrwlcqKQwvvRlBSj6se1HS+YQ7tn9Isczya+AiREZu79w821WiAk6Jk+GOvt+Qhw7tEaSglxyiw+MTL0av/D13+pjuB4s2pPAlni4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940636; c=relaxed/simple;
	bh=UtTdmWX6U4vkBHMHrjueL7kq6ik9nHTWYO5el8M7IAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G8gIVNhYVh8s5onms6lklZXAGiHhPcP8odwKL53aAoydV1GXq+xaeARicERcoMVvrqHCEEqX9r4AIKFoM5pKkvEHZ7y2GMC9+K2thzDBd68h90eLvf+yy9TH1zSkNc1VBjTiSgFyHC5SPEXUgQ8bLZ2JodmNPTM2U5jKUzrF5dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=gJgCx5uw; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="gJgCx5uw"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-231fd67a9aeso1774575ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747940633; x=1748545433; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DF8qwdvQiSR8ZsqVN4u28RN14jUMJY3Pi0vpFa2D75A=;
        b=gJgCx5uwiIEOFpuFRJaDH8ctpfF6q2d3WdGgGIct8A+LC4q2W8P/qj4qUQex3YjOPm
         cygfnlZpERJpy0UY3v9wsnB/dY5iZczltJw3exry2nvzAnHEzawwciPRhwwOJ4OmRi4w
         z0Pw6BpdeeqbrgZtlroWYbXvsz/d+2qsz/8XQP1EFNFkOhtopfm1k8SFIBJL+QFGIiTz
         kmLRF1nwwZ5pE0uL6Rz/R0Ogi4Dw7yn8ByL/81jyyru2Cnq2W9FeHGRGLhGyAIpdFqGK
         bx82k4SG9+ivx6jzm/SJmewZbUOjL+HLE7j1hEvsB8j5P8KWa1rYV6GjD8ZXngsr0rIW
         04GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940633; x=1748545433;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DF8qwdvQiSR8ZsqVN4u28RN14jUMJY3Pi0vpFa2D75A=;
        b=uCO/dVG+48E60mfZmtOYaX5hK7M1vM0vs7ebGmuhFkE6JlyiX2zLa3vvqPrEyUPBwe
         bGsGhQHuORJUdFweA0XnRNds/6y5V8j/QYV9e9fouebfUM5N/0Bgz3iKqCJLfkjeXLRz
         arFSu8DwgpsmhIEhlMZT+kGy7rUP97XYNIVhikqf4LoDFqO1mQiz34Li0nCSBqrFQISe
         uvPphA1LpzGIHA6bxT0C7elOlQv0zb7EbxmfT7crjVh4qk23iaYE9itoR/T62gyize99
         pcIaXdWffnTLJhEOVFsfs0b2ZdFJv3J5VkXfa/WgGwuE1gEeVz60PieOBiTLSMHBa9/Z
         rYhg==
X-Forwarded-Encrypted: i=1; AJvYcCU5whjDqqQYeOdTelM/x+GSCfsPx+TLWtpYeXPGaRyCjJsUmTfo4sHe7U+lgMUz0XCK/ZvfJ3jK4OOOvcs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAUX0HhCj0E192qn+Vj8JPVOwe6w3+/c87V5aftIYJqhJBAvXH
	mVd9Dg5jTWQrdrS1ZO+9vZG1nkZkPGLs14uL86j9e9/zdnkopowgQOSbSGi0atx2ePY=
X-Gm-Gg: ASbGnctB7fLdBrarCrTL0/sjaJE9QZ8ZWuM8k1bb7m7cEZ57iSmIVQHCUoA4Wzgf2bx
	tUz2NgCTW4eMNt/EaTo9yGk1ZFwZajTaC2eeER11fyuuKoK7Aj12CsyHu5STQRmdyTeqhKY/Nny
	2kiuF4ivNRwz0IhBf4vmc9mWqpWSedWH+32B4npHLaL6m200VtQXuq5jiCtdORtwCEKwAetk97V
	SmlEXeEiMGjnk47jSDZY4AT3c4pexEB9FWw2rH1yIbceOloVOkAIvGlD+IVQZv5EQEMjce9ja+/
	KoznUI0ww6CQSPGsaNFJANlWRPq4DKz9B7NEb0WUfrUYtRVgZnlsWaOBTJN56nh5
X-Google-Smtp-Source: AGHT+IFOp5NbQAetfcmDIrzFN/H7GeRjVktpIXFM9JpmrYmqufWq4+kFSWRLQINNJ6B0dpiY8ak3gg==
X-Received: by 2002:a17:902:e78b:b0:231:7fbc:19f3 with SMTP id d9443c01a7336-233f0680998mr8028135ad.12.1747940633282;
        Thu, 22 May 2025 12:03:53 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e9736esm111879155ad.149.2025.05.22.12.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:03:53 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 22 May 2025 12:03:42 -0700
Subject: [PATCH v3 8/9] RISC-V: KVM: Implement get event info function
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-pmu_event_info-v3-8-f7bba7fd9cfe@rivosinc.com>
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

The new get_event_info funciton allows the guest to query the presence
of multiple events with single SBI call. Currently, the perf driver
in linux guest invokes it for all the standard SBI PMU events. Support
the SBI function implementation in KVM as well.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_vcpu_pmu.h |  3 ++
 arch/riscv/kvm/vcpu_pmu.c             | 66 +++++++++++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu_sbi_pmu.c         |  3 ++
 3 files changed, 72 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
index 1d85b6617508..9a930afc8f57 100644
--- a/arch/riscv/include/asm/kvm_vcpu_pmu.h
+++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
@@ -98,6 +98,9 @@ void kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu);
 int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsigned long saddr_low,
 				      unsigned long saddr_high, unsigned long flags,
 				      struct kvm_vcpu_sbi_return *retdata);
+int kvm_riscv_vcpu_pmu_event_info(struct kvm_vcpu *vcpu, unsigned long saddr_low,
+				  unsigned long saddr_high, unsigned long num_events,
+				  unsigned long flags, struct kvm_vcpu_sbi_return *retdata);
 void kvm_riscv_vcpu_pmu_deinit(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu);
 
diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 163bd4403fd0..70a6bdfc42f5 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -453,6 +453,72 @@ int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsigned long s
 	return 0;
 }
 
+int kvm_riscv_vcpu_pmu_event_info(struct kvm_vcpu *vcpu, unsigned long saddr_low,
+				  unsigned long saddr_high, unsigned long num_events,
+				  unsigned long flags, struct kvm_vcpu_sbi_return *retdata)
+{
+	struct riscv_pmu_event_info *einfo;
+	int shmem_size = num_events * sizeof(*einfo);
+	gpa_t shmem;
+	u32 eidx, etype;
+	u64 econfig;
+	int ret;
+
+	if (flags != 0 || (saddr_low & (SZ_16 - 1))) {
+		ret = SBI_ERR_INVALID_PARAM;
+		goto out;
+	}
+
+	shmem = saddr_low;
+	if (saddr_high != 0) {
+		if (IS_ENABLED(CONFIG_32BIT)) {
+			shmem |= ((gpa_t)saddr_high << 32);
+		} else {
+			ret = SBI_ERR_INVALID_ADDRESS;
+			goto out;
+		}
+	}
+
+	if (kvm_vcpu_validate_gpa_range(vcpu, shmem, shmem_size, true)) {
+		ret = SBI_ERR_INVALID_ADDRESS;
+		goto out;
+	}
+
+	einfo = kzalloc(shmem_size, GFP_KERNEL);
+	if (!einfo)
+		return -ENOMEM;
+
+	ret = kvm_vcpu_read_guest(vcpu, shmem, einfo, shmem_size);
+	if (ret) {
+		ret = SBI_ERR_FAILURE;
+		goto free_mem;
+	}
+
+	for (int i = 0; i < num_events; i++) {
+		eidx = einfo[i].event_idx;
+		etype = kvm_pmu_get_perf_event_type(eidx);
+		econfig = kvm_pmu_get_perf_event_config(eidx, einfo[i].event_data);
+		ret = riscv_pmu_get_event_info(etype, econfig, NULL);
+		if (ret > 0)
+			einfo[i].output = 1;
+		else
+			einfo[i].output = 0;
+	}
+
+	kvm_vcpu_write_guest(vcpu, shmem, einfo, shmem_size);
+	if (ret) {
+		ret = SBI_ERR_FAILURE;
+		goto free_mem;
+	}
+
+free_mem:
+	kfree(einfo);
+out:
+	retdata->err_val = ret;
+
+	return 0;
+}
+
 int kvm_riscv_vcpu_pmu_num_ctrs(struct kvm_vcpu *vcpu,
 				struct kvm_vcpu_sbi_return *retdata)
 {
diff --git a/arch/riscv/kvm/vcpu_sbi_pmu.c b/arch/riscv/kvm/vcpu_sbi_pmu.c
index e4be34e03e83..a020d979d179 100644
--- a/arch/riscv/kvm/vcpu_sbi_pmu.c
+++ b/arch/riscv/kvm/vcpu_sbi_pmu.c
@@ -73,6 +73,9 @@ static int kvm_sbi_ext_pmu_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	case SBI_EXT_PMU_SNAPSHOT_SET_SHMEM:
 		ret = kvm_riscv_vcpu_pmu_snapshot_set_shmem(vcpu, cp->a0, cp->a1, cp->a2, retdata);
 		break;
+	case SBI_EXT_PMU_EVENT_GET_INFO:
+		ret = kvm_riscv_vcpu_pmu_event_info(vcpu, cp->a0, cp->a1, cp->a2, cp->a3, retdata);
+		break;
 	default:
 		retdata->err_val = SBI_ERR_NOT_SUPPORTED;
 	}

-- 
2.43.0

