Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A565C28F94F
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 11:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748518401; cv=none; b=VSwsO57NUpi/TXzxRK9FDChucsXE4IzUZrp3era7Az8DZzomjQXSj5Bio68fGMLfPStWPQfCY7KM0+XQIY4f/MeljXPqNbVc+avBwQVVW7lFz8F2QzP+RGTAmDaibVY0JbK+ym6OZacHzyGOGEdFQrF1pLqhOh+jkTyXb3dR38o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748518401; c=relaxed/simple;
	bh=3Nke7IrlZt1dIQrrtJZ35wZYJcBpZtgeyy0gHEfYDMk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SjYbMcYH1vTkBhAcQwb6jz9GpoyWlkzQhLeT6b0j5GJ0L+ctLw3PRYiPHbqPgytNdRs0Rqr6Voj68N3SZZEDeftU0BKEgtkbF+p6uoRjyxgwwFlYwBoGlYT7Tc1IEq8PXYLLiOEOA3Win0awyO53tM0qATpdpNjN8XSc3LACNyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KnaaY6Tj; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KnaaY6Tj"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so6608215e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 04:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748518397; x=1749123197; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Nc8ucW60XE4Jn3cBqaPeV8SZm/My/nwOffHN5F4rVM=;
        b=KnaaY6TjR4AICoV2JJrqWG1W0pSC7v+0G8uQtLOhKzoHGidv8xYyDbaIE3NV6ecKIJ
         PIShn1HZ3xXuN5wcngBBy1IqHnBfgyh5iLEpHgz7s/rt5l2Ee3un8kdFSWP7B8R94b8G
         6bkChmSgAgI2Bjzc2/vIOLFvuVcezzx4q4ROlhLkPoWMdxABPA3cMi8f//BXKidjVbmS
         6ciRDuKwzqGkzpDfYKaAGpS0FggZw0jZKAEsE83h/fyyJSrsY+P9xFTC0DRBZgRjIth+
         CfLrKQeyGFHjf45N+X0BkbjHFuvxIZSD6vEBo8XyQ24CGgdUk4ciBpUbWmf+Qv+62Id4
         /69A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748518397; x=1749123197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Nc8ucW60XE4Jn3cBqaPeV8SZm/My/nwOffHN5F4rVM=;
        b=Tuy43dhXy5HLC3jDxKz5DdEUYYe0VCNDSRbzSR+M5AfT8uENUZzt6XpoY7rV6YgOeG
         kYQimTLr835MLDA0/bOCCXfWdxmPp2WrANDyyfYCXfjDWyE2hBTqaJe2QApp4K6lv5V+
         NNRKq5LWJcj0x8/1Ra1HEKf7EFverZ7RIHmDzSoYt0sUM8nlk0S8v/S5MeTBGM8avKwJ
         LwkSt4VN+XXPQLZ9DB1AMT0n8o7QagHj/o4/OEGr7fdaGF5YxddhLSj3RB9zIkp/R87W
         Bnbcz1KswYxKMFLggrKIwnyksA+MQYE37k934FG+Txldw1UaB9C7DZxJhwgV9zePCEni
         fk5A==
X-Forwarded-Encrypted: i=1; AJvYcCVGG9VhdBNg3kcp0zggobKV/GYkdjBnelAGTXi5obLzJNRMuUkcBY8bkWD+iD0zx/8lkQmKIiq4sbWTDdc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwM8jXis4glN+MOtLa9vOg9baxkFrrKLDJ9TaZ1NABX0p6eJO78
	ieYPFAHBL4phUrJ2ZBOb7OfAUoUlS2BqLeYaX9OQvDnCYJsjOsDhdGpAX475UoKq7JA=
X-Gm-Gg: ASbGnct02xXVTGjTJYhNOfxfY9ItDgbl1amqVsI2RD5GSQ46yNnw4nUyoDu+lR9KJ1t
	u0xxtgl5GBqmTKd4eZKzrmnSSga8w2aXb9akM/uxJ+PsWe2HnQx1jXEmtERGluOJxBIKpeYllTK
	aLHgfdUFjO7sBBcE8semiGdzkAxPZFfzqX5LhrhItwZw6ChDpZ3hZ3qiq16v+VNCpvgkYCp/NCa
	wq9WFPnIJV5Jgm/lDurfEAkJs6Zvlwx1Ywd454mXhXuIuv9748ExTyHL2adh4j9T/4oq5px0hGg
	C04YKkqBknU6M8amvb3a2aJGjdfmQycwIACZ7Nnmq0z9Mks6yf2LVhOuV7Hf
X-Google-Smtp-Source: AGHT+IEKUlq+VjysuU7OFlzmN9WWwVOAQRlwZk1C8MZ05ufCqPWjkB/S4hXmEcNWVtw0X6JufGjbcw==
X-Received: by 2002:a05:600c:621b:b0:43c:fffc:786c with SMTP id 5b1f17b1804b1-44fafbf883dmr95464645e9.19.1748518396915;
        Thu, 29 May 2025 04:33:16 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450cfc3785bsm17443945e9.40.2025.05.29.04.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 04:33:16 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 29 May 2025 12:30:27 +0100
Subject: [PATCH v2 06/11] KVM: arm64: Add trap configs for PMSDSFR_EL1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-james-perf-feat_spe_eft-v2-6-a01a9baad06a@linaro.org>
References: <20250529-james-perf-feat_spe_eft-v2-0-a01a9baad06a@linaro.org>
In-Reply-To: <20250529-james-perf-feat_spe_eft-v2-0-a01a9baad06a@linaro.org>
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
 Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

SPE data source filtering (SPE_FEAT_FDS) adds a new register
PMSDSFR_EL1, add the trap configs for it.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/kvm/emulate-nested.c | 1 +
 arch/arm64/kvm/sys_regs.c       | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 0fcfcc0478f9..05d3e6b93ae9 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -1169,6 +1169,7 @@ static const struct encoding_to_trap_config encoding_to_cgt[] __initconst = {
 	SR_TRAP(SYS_PMSIRR_EL1,		CGT_MDCR_TPMS),
 	SR_TRAP(SYS_PMSLATFR_EL1,	CGT_MDCR_TPMS),
 	SR_TRAP(SYS_PMSNEVFR_EL1,	CGT_MDCR_TPMS),
+	SR_TRAP(SYS_PMSDSFR_EL1,	CGT_MDCR_TPMS),
 	SR_TRAP(SYS_TRFCR_EL1,		CGT_MDCR_TTRF),
 	SR_TRAP(SYS_TRBBASER_EL1,	CGT_MDCR_E2TB),
 	SR_TRAP(SYS_TRBLIMITR_EL1,	CGT_MDCR_E2TB),
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 5dde9285afc8..9f544ac7b5a6 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -2956,6 +2956,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ SYS_DESC(SYS_PMBLIMITR_EL1), undef_access },
 	{ SYS_DESC(SYS_PMBPTR_EL1), undef_access },
 	{ SYS_DESC(SYS_PMBSR_EL1), undef_access },
+	{ SYS_DESC(SYS_PMSDSFR_EL1), undef_access },
 	/* PMBIDR_EL1 is not trapped */
 
 	{ PMU_SYS_REG(PMINTENSET_EL1),

-- 
2.34.1

