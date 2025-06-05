Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B639157A6B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 06:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749104115; cv=none; b=HJnbQLujV+ji7Nt9c87VGGMFEj7t88bZPBv8aGk91elV4CSltTJwV0j5mjkrD9Zvu05nGZtBrVYTvzJuCDveekZiEyJcDmkx8uHM70LA9s+OeW+/DENTNZ/hqOtUg3Agp5zK4aVOCfk5G1lA+xE6ldMJ4g3ezq0bvCpmSRfUoHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749104115; c=relaxed/simple;
	bh=woPsQAQ8aD5eXj0e0btcPjRxg9lkePKpxbumcqyxfL8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=teVChwLZlsJ0tgMJmLgsD31o43UzwvQDAqUL/qnvD0hY8YuinAzZiisX9oXzZyaCs26yDEtX4mYSFOuoHtLeMkF+yQJXWkiCXDDbvJsolLSYhg4uI9NOiX+jB/LvipXH/Ccxp/o+skJzXUwe87uP3ZSF7zlYjiVfnyifl8VkzqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=HQMiZLzv; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="HQMiZLzv"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-306bf444ba2so566845a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 23:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749104113; x=1749708913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z6EY1voNzcSK9ojB16bH1YicliuGIt5A/zH/wdqEteM=;
        b=HQMiZLzvOlXsupNKAvH/OVWXXbToYao3hUldDJs2IBQHuAXs/Fuq0Wq2rh/V1pAHit
         fRP9hBEEEhe/C74RlQurjfnuPIc3v002vt/sbaLHJH+UKGv7LvqZJ1bloFoASdg1A+ym
         inQ3uVXUIOpm8/ue9KFyFwuwSv9sDdBV5OJmImXt3/HL1br1SVpWZcR+U10vW5kLbVfX
         biFqiBN2mn3ndborCkXGERy5oCpWIiZNcdu9BYVrYdFEjuCnYtQpp0pIhAMPiMA+jZFd
         lvz8F0v5GOQzrikSq1IRQdyrlnA+cEs5E6SscWW+boIxqF7l9o1INaoeosUCvjXCL0ov
         ODiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749104113; x=1749708913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z6EY1voNzcSK9ojB16bH1YicliuGIt5A/zH/wdqEteM=;
        b=YX0OapScpex1UWAkmptbqeODcREd2RBx773cot9OIyc8TxKEMl7jWsCI824bdR0j4Y
         BXMcARj6QNGNG59eywTDn5a6A6SVszgd9QgTO/x1E2wQ/hyL7YjOCFnoUBdem9bFmYeT
         /0jpVKYdOGU49LZr1uAqYfrMAnP/3sWs32+Xf5YZyzu18NDXDogn1Mpvd7hdEygR6CJX
         2BdnNrHeSBxARnxiFuKeyHbsskanCpdLrpZpI4fUIzpuh+bTQdTZ3xlh8eyI1B9hkOvn
         jAqJGpZG18gVm4Kj6YfnODzc0PhFH0cE9MnlNWxPT2tm1F46g3cQeYp1q6BvepOZUG4Z
         CiNw==
X-Forwarded-Encrypted: i=1; AJvYcCX/WUQ+Lq+p9JpwZBB0VsnbldMHCOJdV2d9ngcjzMx8GiQK2zlTWH13tJU0Yqkkgaf//rLUT/MEHIItI3w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx8Sm6nK767mlxDR5vqsiYhbfX5LtI/v9eJK9C42RyKTx49TE7
	MCm8gvjLoYKaD8g0ta1yxAiQ54XCU7hKbGthge/Q/kB4QCWGG4g/u0Oa28TcH15hFus=
X-Gm-Gg: ASbGncuOfjOciTmjx1vgEuZcnKns6sg/dODWRJRqvusg6sPUU6FQiDyMdap1hrwvjr8
	z6S2AkGXmi8h/CGpW+cdNeIQsNYj9fVPZmIekagbAxdHFX5CIZecVqWFXvs1UtCGPNY8ob5KCrF
	3VtMmfcCVy4YJS0IMD2HEuwC0pl9tib25jo1/vNJOfCwGFHd25WEp8oCWMZqZGqVS/0pakPn4ql
	DF6/yCGUiMftOm9n09P3WUo7+fcwlsI8djyHDz9Q0QBc2CjAR9KSzMgBDYs2V5HTalNLbkLRUC4
	HrRb9yZRJ+PeBEX2Tr4wIbZzWIbf15TiHEbFZbM84iotgito+mRRXJrOMFPs4DBEIxyIgjDpvr4
	+hCZn6fFQY7YV0ORo
X-Google-Smtp-Source: AGHT+IFFxi4gniZBsMh1uNNeEYBLb4/KPrhz9tn6tI1ZmsRYmgudY+gvcTjARMukQYkeSUEQVSE1LA==
X-Received: by 2002:a17:90b:164b:b0:312:959:dc42 with SMTP id 98e67ed59e1d1-3130cd15a69mr8793286a91.11.1749104113144;
        Wed, 04 Jun 2025 23:15:13 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3132c0bedc7sm716026a91.49.2025.06.04.23.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 23:15:12 -0700 (PDT)
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
Subject: [PATCH 02/13] RISC-V: KVM: Don't treat SBI HFENCE calls as NOPs
Date: Thu,  5 Jun 2025 11:44:47 +0530
Message-ID: <20250605061458.196003-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250605061458.196003-1-apatel@ventanamicro.com>
References: <20250605061458.196003-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The SBI specification clearly states that SBI HFENCE calls should
return SBI_ERR_NOT_SUPPORTED when one of the target hart doesn’t
support hypervisor extension (aka nested virtualization in-case
of KVM RISC-V).

Fixes: c7fa3c48de86 ("RISC-V: KVM: Treat SBI HFENCE calls as NOPs")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_sbi_replace.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_sbi_replace.c b/arch/riscv/kvm/vcpu_sbi_replace.c
index 9752d2ffff68..b17fad091bab 100644
--- a/arch/riscv/kvm/vcpu_sbi_replace.c
+++ b/arch/riscv/kvm/vcpu_sbi_replace.c
@@ -127,9 +127,9 @@ static int kvm_sbi_ext_rfence_handler(struct kvm_vcpu *vcpu, struct kvm_run *run
 	case SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA_ASID:
 		/*
 		 * Until nested virtualization is implemented, the
-		 * SBI HFENCE calls should be treated as NOPs
+		 * SBI HFENCE calls should return not supported
+		 * hence fallthrough.
 		 */
-		break;
 	default:
 		retdata->err_val = SBI_ERR_NOT_SUPPORTED;
 	}
-- 
2.43.0

