Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EAE27B509
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 11:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746531759; cv=none; b=oH8O9LfJRHrWBediWFkx4jsxfnjYob2zWGVdw6yTHuwX+mWGyFwItSLeE5P0+YzeiJSvMrNb3BTIQfnc3bAPzxXNbhxCrnH/n1+upnZY7rBE1m5kr+aRxWySUkxc92Oro9h1e1NW1hzhI5vRjSjTNWp7MdX7mFSq7nbRLXfb8Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746531759; c=relaxed/simple;
	bh=ypJv34hSI/cyQpZHsVl/I2dLtP+yiW11q72mGd7TSV0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FqIYrQqYbcsOvYBXLPAPbigBWT3zILlpQF8IrfzwPO8b1i8FtLY++AZciOgdG5GQKA7QUdcHxC/OmWS3kK3uqGa14PgPbf2IrASGacY7TDBD4fCXDpSdRAimA9hf5PP3Kgje4EBUV/IzYei9O8uE2BAU4vCB6ssXd8tFolPJKRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rsCyurtt; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rsCyurtt"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so4115480f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 04:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746531755; x=1747136555; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tr/eVzoQ45Dz9ymRgXeR+QCkRn1x7wE6DVCL1MblI/0=;
        b=rsCyurttQ5kSBQQcqSDZ8BYa2JIZ+gjt+UKSiPUM3XnnCRWOntnZLLKe/MRqs0Fy0J
         4H7+wKTjTkIIvg0WB+cpeaiieh6EtKG9e0A3YqSLlWb5JXMzfrPuZJCtygWy/FJmZRXR
         OPw0FcAgV2wm1aQmXzFAzFXQe2fDyAWIR9eC6IlSWAB5nj94HcflMPn24MZtnmWufQh1
         Te1QZ0Yw96iY4HPqFOSeAuzQEi7tbRi+b1oBEA8WrvfT8KXqfbnJQrllTxjZgc18KXml
         Y6tsv9/vXBKR0O3EWw/2JnvMk+EFU9Ym+MEjHgK5lRJK94oaB8/nzbAXlPXHDSRsLza6
         JmJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746531755; x=1747136555;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tr/eVzoQ45Dz9ymRgXeR+QCkRn1x7wE6DVCL1MblI/0=;
        b=O7LY18FFXzelUHcaWn1X4J1+6P41KnbmwbMfz2H6reG9S03tnEa0sPabsRXUSYyJ1e
         hgw00R/7E7xdnSUzSyclmmYN3L7C66qIx+HA+H2EjsCnHqm2FdkV2vHrjmYcFPDoPeqT
         33d2XOIzIsy4Kz6KcxRKNr6cy/azbtk1DLV+f82ZS/BwhH0Ur0P4Og+t87XMPPNA+u3d
         XCRm5iK3C/N7gVDY7PWrge0pw/qr7h/r5tVWVXkQ0tx9IkpMpiW9C6Elcpzjq21PWF6/
         F61uHO9av0ydc9dx3VmZcm4qOnEKA0YRDdxz4wU3q1NDvzS7SlAV7sdA3OUXpiiG2eXg
         96PQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJTmpUXMBTxizikmBFTp9jfllwumOBBkjJAwaQbU3XcwDcKCQmJMHNsHfyy35TfLXi3RR9DzRWAbEwDz8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhycJt511vHwr3bsKYEMvLzw1+9xWo7+j2BcmUlXDj28PGYleq
	aHIIvvVTGBnoL9F7UrCb/YtL6IeYfim2f4rxW8JfGQiM5VIK46gdNeRfoqAzDUE=
X-Gm-Gg: ASbGncv19rRMcg7YXqKQwhnPnZTP3a+nwcsLe9CvgUnaBmWA4MLkNg0cZghXOTEiJTO
	CXiPALXi3PY14HtQTxSs6OliXuVvFIC62P+Kejy0Eyq7wMlZ37TS9VVjBni/0uru7YEyK8mGEC6
	kV0Q5Wy4joDJe2+iL9hrv8OdQEwwYrzgWUjB0N7PiXgliY59a4zgdo42A1VqxPqTgP4gYl5IY9i
	m87HSpNBlnsbDkcxavUU+YTNcW6Cm1HhYwB+P0SSGxIiuoDT+/vc54VGvBjFNNGefujoNvucaYM
	TiMfc9OtwEsVacvtPGsiCfM0/B/7BEHz1H5sxSnue/iXB98=
X-Google-Smtp-Source: AGHT+IEH2+KTPzukEfAEMWWhxbAHT6NzJ/G9YGCnXDbFPk9R2A+Wr+4SDydWQzAME6RiQhm5jVhrhw==
X-Received: by 2002:a05:6000:1787:b0:39e:cbe3:881 with SMTP id ffacd0b85a97d-3a0ac0cb3afmr1864277f8f.12.1746531755089;
        Tue, 06 May 2025 04:42:35 -0700 (PDT)
Received: from ho-tower-lan.lan ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae344esm13198473f8f.25.2025.05.06.04.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 04:42:34 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 06 May 2025 12:41:34 +0100
Subject: [PATCH 02/10] perf: arm_spe: Support FEAT_SPEv1p4 filters
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-james-perf-feat_spe_eft-v1-2-dd480e8e4851@linaro.org>
References: <20250506-james-perf-feat_spe_eft-v1-0-dd480e8e4851@linaro.org>
In-Reply-To: <20250506-james-perf-feat_spe_eft-v1-0-dd480e8e4851@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, leo.yan@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, James Clark <james.clark@linaro.org>, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev
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

