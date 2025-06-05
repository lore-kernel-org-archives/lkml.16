Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC251465A5
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 06:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749104115; cv=none; b=TOl2YsEVMc4Q3Pbp9a5s3OdWCht+eebL05muOpoV2Gc3hkxVmBpxuezCL6CX+qUH4sVAnLz947KbCmbcplR+KYM2b5unIyxiABm7c900ba42dB99Co30zX8ihydOuqyCAnBAkWEK4dKU+Y5B8H5k6HstsWIR+NeJ5YE1kg1+5uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749104115; c=relaxed/simple;
	bh=nvXXcrrM+yiGZgmItj7EWeNmKUo3VFTr1hB5yq1cosQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n4bHsjpgtA3AjtDWp2W7Fm8Pq5KM3ELNYqYJQrztFTmxwfzVMCr60kaKpNCEUSpQJZR58soD0wpUpt+6EikmG9i6WOc0b4DCth+auucGCp4oMRzg4CP5IommNZxlF+618FkoiUHZV3ACcq0qEJlNgLZWJthkQr/T9OuuziznvW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=l4bA4+qY; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="l4bA4+qY"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-311ef4fb43dso501200a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 23:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749104109; x=1749708909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/Iwx8NoDTniX1jxmQ6HvQXY8SuCaJi4qXxXEsxBkb4=;
        b=l4bA4+qYBkwW6/PsdkIoOtg04m4GEWjerAWvd/U5a8ct16ijZy4+nhfiUDe7nGnMOj
         SYIBdcjK+DQoAynNcSIDM7W9/OeuF7/P0Uvt+y8OAbqNqAJBx7+QOtUXFkFnuc+KMXz7
         e/aLxlwJ163TIYO1dHQGrV2oDXar1el+1uGxB05akjDGi0d2SCg4035RHAJh5ZfcNsZl
         BdTfK/3P+vtKuARLYICveMfPH++Uu3v6pm8K8/UQQ5eRHTlzfSb++j89En1T2PGA6ZNT
         cY30MyrmU3AS14zJNnJrY/dNZm4mpwY47U6x21SubIhz8fse7gpVHgNLSdiHttUsm1jG
         thUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749104109; x=1749708909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m/Iwx8NoDTniX1jxmQ6HvQXY8SuCaJi4qXxXEsxBkb4=;
        b=w39N9PmcszbZRcvqxZUXh6GquKyurSuSNyklUOX08zaosg8bxCpZO2PjYPpozYDMhe
         IsKSwS6ZBAIQCRntH2ziVFicktajvlom7r/u0/wE3PQCX5l0W3uXghI5XwuxWpPSlZnw
         LS2+6AWh7AJZ9kNWfX1+qtGfmqDtOa3kklaxVEk2alRe8AmzXMIgz3Qwvu9jBh6owoHa
         44Alf1b9Ud8JbVq1N9KvAy83v8XbX9bi9Kol5UsWiNVbkXDqjaponOYU4C37z3v+7Clt
         okSm76cpIU03DkmfLhrNxaRcWX1x2aX85TND9GtALLGYBt33Qs4PgO9DcDHSoy33YbkE
         CUqg==
X-Forwarded-Encrypted: i=1; AJvYcCXn11NY4t2tSDplKFBqdesTtpMAMKA1vwukdMLQfcMAXvmKuq9wVFJ5/zwjZR0DPf3UC/jA+0Cj1E24bzg=@vger.kernel.org
X-Gm-Message-State: AOJu0YysA0qtK5iU+nk9y0J0vQLtQqCFRC2puC3V/9CbwtjtklGhEU9B
	dlVpRst53WHxq2UGty/vNhuRUpJQxTH6Qvf3EK3CwBcZ4S6rSxTdL8raZeRMURn5NXk=
X-Gm-Gg: ASbGnctd5jy37E1z1iAOSoEAfC84V0/E/0M68oCmi9lrBY4wLnzGr6ySigIHrghWPVp
	v8w3G7avBcBj3uOlisgKgzquEzhbWwdXEjPXeAhAKRaM90K3BelfCMnbtb6KFyvXp5Ccstd1XfY
	O+2/KNnEZM4i4E/N2FdRxFy7bnVDlJJDhsF4N/l39ddhBoG9tArGzJ4VEan47bo5Th3FaBkmCeZ
	kJv3C0XhIIR4M1TwGsJ4zJQq5Hc575pTV9XrmGLe9YBbw/YaJHcewPUsyJzVmsdHam3HOv/plU8
	f/U7MSJL2v2ipsroijKaOB415/Qf+9wexoRi34BiUlNgn/N7XP3XWhUyHCR7m36Bt2ouTVwbrwg
	MC2cwcXY+zScEayjf
X-Google-Smtp-Source: AGHT+IE5uPZLOAhVuqWaFE8UdeKOXIRbJ0H8KWIVX2JV+WCepOe45QIRWAIT5GZJ2vN2n4ZWB/B3YQ==
X-Received: by 2002:a17:90b:4ccb:b0:312:f0d0:bc4 with SMTP id 98e67ed59e1d1-3130ccf5055mr7616893a91.5.1749104109337;
        Wed, 04 Jun 2025 23:15:09 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3132c0bedc7sm716026a91.49.2025.06.04.23.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 23:15:08 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 01/13] RISC-V: KVM: Fix the size parameter check in SBI SFENCE calls
Date: Thu,  5 Jun 2025 11:44:46 +0530
Message-ID: <20250605061458.196003-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250605061458.196003-1-apatel@ventanamicro.com>
References: <20250605061458.196003-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As-per the SBI specification, an SBI remote fence operation applies
to the entire address space if either:
1) start_addr and size are both 0
2) size is equal to 2^XLEN-1

From the above, only #1 is checked by SBI SFENCE calls so fix the
size parameter check in SBI SFENCE calls to cover #2 as well.

Fixes: 13acfec2dbcc ("RISC-V: KVM: Add remote HFENCE functions based on VCPU requests")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_sbi_replace.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_sbi_replace.c b/arch/riscv/kvm/vcpu_sbi_replace.c
index 5fbf3f94f1e8..9752d2ffff68 100644
--- a/arch/riscv/kvm/vcpu_sbi_replace.c
+++ b/arch/riscv/kvm/vcpu_sbi_replace.c
@@ -103,7 +103,7 @@ static int kvm_sbi_ext_rfence_handler(struct kvm_vcpu *vcpu, struct kvm_run *run
 		kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_FENCE_I_SENT);
 		break;
 	case SBI_EXT_RFENCE_REMOTE_SFENCE_VMA:
-		if (cp->a2 == 0 && cp->a3 == 0)
+		if ((cp->a2 == 0 && cp->a3 == 0) || cp->a3 == -1UL)
 			kvm_riscv_hfence_vvma_all(vcpu->kvm, hbase, hmask);
 		else
 			kvm_riscv_hfence_vvma_gva(vcpu->kvm, hbase, hmask,
@@ -111,7 +111,7 @@ static int kvm_sbi_ext_rfence_handler(struct kvm_vcpu *vcpu, struct kvm_run *run
 		kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_HFENCE_VVMA_SENT);
 		break;
 	case SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID:
-		if (cp->a2 == 0 && cp->a3 == 0)
+		if ((cp->a2 == 0 && cp->a3 == 0) || cp->a3 == -1UL)
 			kvm_riscv_hfence_vvma_asid_all(vcpu->kvm,
 						       hbase, hmask, cp->a4);
 		else
-- 
2.43.0

