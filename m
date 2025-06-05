Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3984E23E35E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 10:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749120613; cv=none; b=BhhEqPb82B5I7RmdX9D+JuHnEgXrykQGo6R94O+5gTQngNam+twmxnvSaGQs3TTLiVv+aVwQvAd+ItzRhvkstC8LT2hx5LL7Yvj63Qgr17w684D715WZ+Mc0b9Y7JCxNGn1pbZpsQU1jZOA+nbmyaWoaG5ctBhjMwsVbRo/o0uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749120613; c=relaxed/simple;
	bh=D3a8CHQrVLegzkacJWeUjX0eoOkZvAqwfNoehax7vUs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h7Xp1uXlSCSFL03HyH83pT//4sR5m2L331zNn18bv8H/0Ru86r28vvkFU7N6mm7Gkcr15aGtr8xiLyVwOeQYdD7xeCSR53rUTVtj22mHwin2ROSzpsSZQPIHyfy+7OCduDcijEMgiloNaInspZhOEl9BuiXO36Hvp4L5mbNMMtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fYaIrY9v; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fYaIrY9v"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-442eb5d143eso7661895e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 03:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749120609; x=1749725409; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0DK6uM4OCMEufJaM16uRm6cXGr0jOYtB1myNeR7Sl5w=;
        b=fYaIrY9v2avoYb68C3U7hI+EA5ULP/3xdsyx1da8X4VZGU9w8aVjvuB2nWtRLY9nIy
         pkzPIhIFia46/wRXL3nALzno6G6RroMF2btpMPL59GZt7YmudmZu8+1+H6TEFccLqKY8
         iBZ7n+fmbXqxBlFEmnYg63vagUy/U8U8O5YtpUc+/tDEe22bGUJy2Ahe0u8g6xrBAsMZ
         UdTVFdsjDKlHmgMM3fncDJw+yuj9fXmaEx7R6U1e69YvlvYHG+V3DQwM8O872sm3mwjj
         RbejpsWXbS1u7EFvm8rN/bwEuYIOCSkFiHwi6LpYaQGfjFtzzXP2iGF0j0ag3nESApMP
         hb0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749120609; x=1749725409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0DK6uM4OCMEufJaM16uRm6cXGr0jOYtB1myNeR7Sl5w=;
        b=aTYt42vKCdJWdVTxTZgCHxHsqOVx9ZrqC/9GnV7QBvWOfFxHLKxEzkPvdPYeh44Pgn
         MwHPPE78CjFhRc0qzmnnKTzK1wVl5rV/wzYPQrmL0RFvToJJGpErRromxXO7z/8Z/JM+
         IgI07CQt9sOV9Qf0HqnCmbi732KV6g8zzb33yiIbznIcu78JbldYodB2C7TE374FCb5q
         dNStlxXISlVaWHNvsQIzdWNUUvVHDAD4DgM8N/N7oPAQfh9t3zAD+KKooN8emX3Yod8k
         1E2UduwfX1aqnFGld1RN03wOWT2pM5RUroShOR/xhPNCVt/+k/15gCyPxt8NHLKNGnoF
         iqGw==
X-Forwarded-Encrypted: i=1; AJvYcCUPvcUSwBSabmEYosEY3SfkubmD+hYaCIoBhd+zLbQ/TAVvsB7bQJZFGQ3LXRs9P19iDED7eVhSBPxTgCU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu0PbSbAvab/8nlLOKKUIG+1e6q4v5zzcyqdj2aSvbuEpA2ppX
	Ik0HFLW3J0f2p0vkmtH+rDxUg4PAmEiwJ+N/5i6X82dKvpQNGu58UjIn08XR7/EnN2I=
X-Gm-Gg: ASbGncum5Cc2ESXFGBIaBvmtIwuqSAoX9xSkhg+DSY7GNZfnIDGKbe/ppNqZjfroVqC
	hXUrpCOjcUr9sDPwT7qvB9KP9ys6v2BQbFGoiiWMpD9G15nksZISeUHTAW8DCkauvnJs+KMkWhr
	ksZAr2gJ2Lc6dGxFlxOvPG67LTNWF06KbOJgK5I0E/BX0/gcWyQFrVOcOyzx7ENHmzXTXfwsmga
	eBCIdnvcDsa2BjDUh+sgGtQpN9ui0mGr4CvkjZsFt3fHIApV02pI1iKW8K1PMMFNwQhG/ONSdkY
	DNCT6k9VvIsVe9Wo/m89p3EGDdKVzPR4EAjuK88TwfaTBEafwfXeOD1MlZto8Ik5cedCSlw=
X-Google-Smtp-Source: AGHT+IHW1X+WENRurUa43xQ9bej2IvG2qfN9i4ZVKvWxfljVS3ufqAHPvcXy1cLSRDDK8lgBUz9YNg==
X-Received: by 2002:a05:600c:a089:b0:43d:45a:8fbb with SMTP id 5b1f17b1804b1-451f0b0c598mr53918705e9.22.1749120609367;
        Thu, 05 Jun 2025 03:50:09 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f990cfe3sm20629965e9.23.2025.06.05.03.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 03:50:08 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Jun 2025 11:49:03 +0100
Subject: [PATCH v3 05/10] KVM: arm64: Add trap configs for PMSDSFR_EL1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-james-perf-feat_spe_eft-v3-5-71b0c9f98093@linaro.org>
References: <20250605-james-perf-feat_spe_eft-v3-0-71b0c9f98093@linaro.org>
In-Reply-To: <20250605-james-perf-feat_spe_eft-v3-0-71b0c9f98093@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, leo.yan@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

SPE data source filtering (SPE_FEAT_FDS) adds a new register
PMSDSFR_EL1, add the trap configs for it. PMSNEVFR_EL1 was also missing
its VNCR offset so add it along with PMSDSFR_EL1.

Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/include/asm/vncr_mapping.h | 2 ++
 arch/arm64/kvm/emulate-nested.c       | 1 +
 arch/arm64/kvm/sys_regs.c             | 1 +
 3 files changed, 4 insertions(+)

diff --git a/arch/arm64/include/asm/vncr_mapping.h b/arch/arm64/include/asm/vncr_mapping.h
index 6f556e993644..dba0e58a5fac 100644
--- a/arch/arm64/include/asm/vncr_mapping.h
+++ b/arch/arm64/include/asm/vncr_mapping.h
@@ -92,6 +92,8 @@
 #define VNCR_PMSICR_EL1         0x838
 #define VNCR_PMSIRR_EL1         0x840
 #define VNCR_PMSLATFR_EL1       0x848
+#define VNCR_PMSNEVFR_EL1       0x850
+#define VNCR_PMSDSFR_EL1        0x858
 #define VNCR_TRFCR_EL1          0x880
 #define VNCR_MPAM1_EL1          0x900
 #define VNCR_MPAMHCR_EL2        0x930
diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 3a384e9660b8..60bd8b7f0e5b 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -1174,6 +1174,7 @@ static const struct encoding_to_trap_config encoding_to_cgt[] __initconst = {
 	SR_TRAP(SYS_PMSIRR_EL1,		CGT_MDCR_TPMS),
 	SR_TRAP(SYS_PMSLATFR_EL1,	CGT_MDCR_TPMS),
 	SR_TRAP(SYS_PMSNEVFR_EL1,	CGT_MDCR_TPMS),
+	SR_TRAP(SYS_PMSDSFR_EL1,	CGT_MDCR_TPMS),
 	SR_TRAP(SYS_TRFCR_EL1,		CGT_MDCR_TTRF),
 	SR_TRAP(SYS_TRBBASER_EL1,	CGT_MDCR_E2TB),
 	SR_TRAP(SYS_TRBLIMITR_EL1,	CGT_MDCR_E2TB),
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index a6cf2888d150..4a88ba15c7df 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -3008,6 +3008,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ SYS_DESC(SYS_PMBLIMITR_EL1), undef_access },
 	{ SYS_DESC(SYS_PMBPTR_EL1), undef_access },
 	{ SYS_DESC(SYS_PMBSR_EL1), undef_access },
+	{ SYS_DESC(SYS_PMSDSFR_EL1), undef_access },
 	/* PMBIDR_EL1 is not trapped */
 
 	{ PMU_SYS_REG(PMINTENSET_EL1),

-- 
2.34.1

