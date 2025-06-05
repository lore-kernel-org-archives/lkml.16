Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE23223710
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 10:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749120608; cv=none; b=TKwwUxc14awI7B4XECCwDpQ7kzDgWAkIRy+ine4betNLBuntdPV5Yduz70PbHuc/mT7ZvDASubFQLP+yon2nAr/wlOxHxeF1cFH6vbJOcmTC5hfSFgOB7lRJtfrv2GNH7rn+iS8+E8FOIk/yjaxfz/G5vyhOheE8STypyWiGXoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749120608; c=relaxed/simple;
	bh=J8OmP1gsaCmehSiWudGGqnPNvN5TiSXtYIKG2wZEIRY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rkbr2qR598Z3Gu0gvGwyjboF70H0Hhm60O9G0yfiEenooFVaeo2BnbUp5wN2GOov1plW1Cv258eXChiN+a37ajAx9dZDptwz8jCOrD/ES3E8MhwWTD14xHq66Wdka2Lf5eEzAh2Fgx+/eb/3qKnNC4jGBRESPNFo5yqaftxSsUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oylu+lcu; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oylu+lcu"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a375888297so549509f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 03:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749120605; x=1749725405; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WHbW2UQ+G7ko5zDPsKOZEBPKiZAxVSAKWEGcyVL84GY=;
        b=oylu+lcujNh9LN8lb6a3fZhcLN/3mDWF+mDXigoXH7kii0tvUBTV9o9EjbdnPUdfxW
         3e35u0z4lgqonLPK1O3ixfHIOUjbgczJ10RLuhA2BRqpkUH4+6HYrsVJoJfD1ry3wr9t
         2QsBzbTcU6ZNgS2SgMAqZSop1zDP/O9mQ3BsDQcOcqwd5AroSD65o4lnBqSZtn3d5ESX
         QAzliOI7P0mJ+D2Qmr4XbvX68+deojYJzxIr0zzrZ/YbwTxiKWSkWn9BBlCsHODd748R
         8A1X4WyLZmAHv3aJ7eOhiy1AAg+TD+OHY8rXQeg+A54tgLHbKLxQJwIyE8v/9k4YB8Y5
         KSUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749120605; x=1749725405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WHbW2UQ+G7ko5zDPsKOZEBPKiZAxVSAKWEGcyVL84GY=;
        b=VUItiovJvFYmanOajbut2+Qs9z+cY3tlOFv7uhrjumITSTrZG4ID+Cx2md37lpWP32
         O3pZcLXTlcE/bF/TyYSHftBtUfRN67F2nyyclNSjQ8mMwU4iQYgUtGFxE8CQZX2fE4v3
         Ie02IFgZKoDCQVtiwt2pGohyQcQQLSiWHfkR73bM8uWjDI3toUH8LIQdXzzeL/yDeU+o
         Y8q64zskom64y97qsp0D4lrmcXEik6OCgkbO0aQY0ay7JHSdJ/ywrdGnShP/0tgFajLe
         zOemN32w5U+GHsFFwmtMSV1ICezCw/DIdZAQCP4F8qQ20Ym6laJsHdsIOC5HphmeqJEa
         Ufrw==
X-Forwarded-Encrypted: i=1; AJvYcCV88s1iYDn6aj4Zc8/yxCIITbLJHdBm9zvZVCVP7ZvJduii/5ZaV2SiQFs9IL38xdqO6nQ30gRLAZ5J87M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8cuZ+ZAr+gT3IKcsmczKs7PkKpq+fwjUNeT6v8IDYhjeCGq9s
	YgDOCJBSqBkVtDjlX0l2b0dAa5TXN8T9MZMk7EnnNhrsyK3XKPFov/yVhlu+7f3V4g0=
X-Gm-Gg: ASbGncsKBKDGSejcL6iHFB5aw6NELbfYBxBAR+aXg15Rss4R70pVobqeUbTVV6uPM32
	Eti+S7j9S96vEAGwfHZCA3TekJ5u72HRKSay1exuU3FG3GA2X1hQ0BHQGwxSKbSK7t6UGYKYWlc
	dHH/DZ0OAo6MoiPtEatGA8Hb2t0NJgmLEhtnZKYXXVntVGOt77+O37nxeGe+RVp4b84tVDtYgM1
	xWL/sagWZrYuoW7k+uzwlPmrD3te8LMqBOevpbZlE80HbY/MrXwpX9uDYmJkl8ErkKMFHCVMZ4B
	LJ+0JNqdd46XdaVBSiQXX9gDwUXPmVWSFPwi6ou4p9SPd/dO3M7trAPMLf3E
X-Google-Smtp-Source: AGHT+IFRWzZEtfMJIm7ANoPCr8nsDJf/OxJ3jlNOmnbV1HMLW3JnGbA0M2qGF1W+QvYQi0862CiYjA==
X-Received: by 2002:a05:6000:2485:b0:3a4:f70d:aff0 with SMTP id ffacd0b85a97d-3a526ddadedmr2646825f8f.14.1749120605010;
        Thu, 05 Jun 2025 03:50:05 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f990cfe3sm20629965e9.23.2025.06.05.03.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 03:50:04 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Jun 2025 11:49:00 +0100
Subject: [PATCH v3 02/10] perf: arm_spe: Support FEAT_SPEv1p4 filters
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-james-perf-feat_spe_eft-v3-2-71b0c9f98093@linaro.org>
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
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/include/asm/sysreg.h | 7 +++++++
 drivers/perf/arm_spe_pmu.c      | 5 ++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index f1bb0d10c39a..880090df3efc 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -358,6 +358,13 @@
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

