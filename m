Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C0028EA52
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 11:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748518396; cv=none; b=Yf+uHCCerCXYvLdGJzIf4+Uk8EQaVHmSb4KldwEFOxbuCrH0fnnlrUZTjPCJ6iqM5zpnuJktsTWy3GJl3w5piEDd4uk4I50iydMzPT97HWCbPOmF+atBUn09wgmvSW+zfz8+QPeK2/JsOp48esXiZHp1dl9AmE7sZuC3OIDO/zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748518396; c=relaxed/simple;
	bh=bhT/vBdY445hdiJGnxyUjZuj2JipKZSpecA8eMwMkO0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qQ8NUMl4N5NBxlPRUWaAxoNCSvehUNJfve68uQfVyz7uSyH1pOe3vJhKdGa/IXrTGnSPM2pjWxQyErn9HMkstpACIOFhDPZQmeDRJV8zOkKwnPumNCXhgzuok5jzgR1CI92lj/1Db7JdZtZMsMoyIP/43ZCIIHrWbmtU+HY7snM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qI75gdiQ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qI75gdiQ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-442f4a3a4d6so5460585e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 04:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748518393; x=1749123193; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YBh51vvyiyhareusQPjv3Jd+V2PWdf2x4DOb/Anfvgk=;
        b=qI75gdiQU9dZxdDIY2zh4VkOCcPNvyAus9RgqyCsuBIVoYoNNHg2gzMZYmc0dXxqR7
         8xFHYDuFwQzBZwBUlYMJQhmqnsZ7rLpMpcO+i8dKHD6S02iYrSMauNn8NKUctPy13GIv
         lkbHVp51V4CeYYQlWev7h6hrnTPo+EBbzAX4pj0DmZmNBSldW5J6YwseVqNK8buft5xE
         jSsgXeuNpmDYyKzTomv6Bh+UyHM2Hz83DNL0nRt3pW4/7CIHdtBJpayjHbnzSeq8ZtHs
         mIoquA6MD0GXC8HQfEGTfDWFZzDjzVPN3mpRdBKkJ8VCfqmDYPaJ7+zXsSR866AoJRZB
         0jRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748518393; x=1749123193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YBh51vvyiyhareusQPjv3Jd+V2PWdf2x4DOb/Anfvgk=;
        b=K0al0YfyAuPW0cJt/Obb3S2kZpBkw2zgtOK6Ls30aOHFZZVcKE7s+wvQIhTZmiMC0/
         uJiChNri7BWBNheD+pRBV0Cb9qMXjtDlf3HzDjlx2WSS1xOz2joMyYPQJCAqKMGSLDx+
         lDwZu/l2Imi661xoTdLZoTee8RzQG2xCz9WV9X1WXvLXLD6IU8VFmZ/doSFt8hg98Zoh
         1kmTT8GKaBMN5jbA8sQF4mq26jpOqdUYtAZgE/04tUAU+sVhMAV1s9I7ZuHVDFnXWXLN
         fF3fd7uv6m8ckAUF+df4Njqq1iROEIaRLHAPB4/Gn3zynoqnQYJK3GbsM35TrrQdByrh
         HmLg==
X-Forwarded-Encrypted: i=1; AJvYcCVyW8EtcaoqvdxPTYDU7sgiyMaSrr2XxEXJPRC1+cJArLkzNirvud9an/OdUiWlfsY/t4SV8FaruRcZiY4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYE5qaGQIQLvkixPLVCMTRGqpq50hC3u7/GFIJ1xV0VBq8CaPU
	yOENsp30DFhDCkqH5L/XJHu+9anGUMPjsvDvhXJPhemHGmBupFlEpFk5wI/E6IP+Kvc=
X-Gm-Gg: ASbGncuDkPFuScYl6qCXnsrmXqpQwSsqfJ0FvyoobtEX4HDejQ+GT74f+grGNo5LC+j
	RlSHrfDmFGyMZ/D6ObxdvsJY1KD6rZ0nEz43h6FyV3XB5UFeXZBsXa1wlSwZkmrKrPa+dSx5aDr
	oFeBN9Ar08x7b5ObN8XZfm5lNHawz38D1aYppPGhQQDLgwDNP3SQvyqAKzvFwxjgMu3efCC/k1W
	BTFh408v0bxK0c73p9mT5x0wN5ldixdPFd+VU1lFHt8FthGbB5Q9GWlS30vbQKsuKJSkZIrC5pC
	Q+060ZitR9HRoqav0UIjKQ0VP74zE1N80GFY08/W2iUjbr/SeeEdDu1HBgFi
X-Google-Smtp-Source: AGHT+IEtrMK0+qCLgw3Q1exhgAhuym8fUYhFgSSn+IhOQ2msA1tWH3EQ6muEHr0G05oi7CZJdKSgdw==
X-Received: by 2002:a05:600c:4f0e:b0:442:f861:3536 with SMTP id 5b1f17b1804b1-450ce83c85bmr27386615e9.7.1748518392610;
        Thu, 29 May 2025 04:33:12 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450cfc3785bsm17443945e9.40.2025.05.29.04.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 04:33:12 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 29 May 2025 12:30:24 +0100
Subject: [PATCH v2 03/11] perf: arm_spe: Support FEAT_SPEv1p4 filters
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-james-perf-feat_spe_eft-v2-3-a01a9baad06a@linaro.org>
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
 kvmarm@lists.linux.dev, Leo Yan <leo.yan@arm.com>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

FEAT_SPEv1p4 (optional from Armv8.8) adds some new filter bits, so
remove them from the previous version's RES0 bits using
PMSEVFR_EL1_RES0_V1P4_EXCL. It also makes some previously available bits
unavailable again, so add those back using PMSEVFR_EL1_RES0_V1P4_INCL.
E.g:

  E[30], bit [30]
  When FEAT_SPEv1p4 is _not_ implemented ...

FEAT_SPE_V1P3 has the same filters as V1P2 so explicitly add it to the
switch.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/include/asm/sysreg.h | 7 +++++++
 drivers/perf/arm_spe_pmu.c      | 5 ++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index 2639d3633073..e24042e914a4 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -354,6 +354,13 @@
 	(PMSEVFR_EL1_RES0_IMP & ~(BIT_ULL(18) | BIT_ULL(17) | BIT_ULL(11)))
 #define PMSEVFR_EL1_RES0_V1P2	\
 	(PMSEVFR_EL1_RES0_V1P1 & ~BIT_ULL(6))
+#define PMSEVFR_EL1_RES0_V1P4_EXCL \
+	(BIT_ULL(2) | BIT_ULL(4) | GENMASK_ULL(10, 8) | GENMASK_ULL(23, 19))
+#define PMSEVFR_EL1_RES0_V1P4_INCL \
+	(GENMASK_ULL(31, 26))
+#define PMSEVFR_EL1_RES0_V1P4	\
+	(PMSEVFR_EL1_RES0_V1P4_INCL | \
+	(PMSEVFR_EL1_RES0_V1P2 & ~PMSEVFR_EL1_RES0_V1P4_EXCL))
 
 /* Buffer error reporting */
 #define PMBSR_EL1_FAULT_FSC_SHIFT	PMBSR_EL1_MSS_SHIFT
diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index 3efed8839a4e..d9f6d229dce8 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -701,9 +701,12 @@ static u64 arm_spe_pmsevfr_res0(u16 pmsver)
 	case ID_AA64DFR0_EL1_PMSVer_V1P1:
 		return PMSEVFR_EL1_RES0_V1P1;
 	case ID_AA64DFR0_EL1_PMSVer_V1P2:
+	case ID_AA64DFR0_EL1_PMSVer_V1P3:
+		return PMSEVFR_EL1_RES0_V1P2;
+	case ID_AA64DFR0_EL1_PMSVer_V1P4:
 	/* Return the highest version we support in default */
 	default:
-		return PMSEVFR_EL1_RES0_V1P2;
+		return PMSEVFR_EL1_RES0_V1P4;
 	}
 }
 

-- 
2.34.1

