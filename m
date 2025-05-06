Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BB827CCF9
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 11:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746531767; cv=none; b=RiKueWKCPICAnqQNPRP/+p16ld45FBr2Nax+Wb6H1cTwk4q+D7GCph29nOaFGHHT8OoO844xXTR5/QFAIypXxv1wxPXaPFcMKHKPZ4cqThhN5xkSd/gAikouDF0+jiZ5hu8wx2OrNsiAtuN2KkB4P9btDwdbuPkp6sqObHHqFkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746531767; c=relaxed/simple;
	bh=8OmkHkCGDObescNOkagm9A47Swwu3NytmSXnqZHoHGA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hq+Lw9Icy1vNY1KJdlK56VVQFOXBSPDiYgvurXzfMlfQ5YkopdnMNHFm95KlJWGhpwsCRdmi0MJvZQ9vgtCKSpu0mQsyPCZCF9jXwP/r5J43T1k8Ru7J/KrWbk3ziMld8dVR1pvinhPerwg/Bq7fXuvdjJ9VoRT0wIxySSyeHY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TBuZ8Uyx; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TBuZ8Uyx"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso5935441f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 04:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746531763; x=1747136563; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gfK4D8WXXHfk2zwldWwUzY+IJqnsgpS7YeB5hPDSAiU=;
        b=TBuZ8Uyx7arDpv7h3pSq+sMHhJoH3aHoOUQBmrp5wr3IuvoGb41tap7KUYcTALTu0e
         s4V4FC2vY2xDFHpRulSYfIlB+Xc26fq1soeNjaIzofgGCipD+1xwIatkDJJ/aA+FdxsX
         GpLZmbTheiYMtZy+WiY5CYqlYJFEM+Y1yJtygAgV7vgTBBZ6ny+Vk7h00hlmbFlI6sQU
         ETZDe/cXBdDEQ4XlsFqlIdiYVSRlh6fXsNDqoeNRLcfIXKkY1PLMH3HKWYXd+/a7JIkm
         nCuCTLfHFNHPXrKa93wM9hsCkMVd2vL8OTgFOlGuliGxkIvJUkJw1bk2XcXsuNTIF5qB
         +Wfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746531763; x=1747136563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gfK4D8WXXHfk2zwldWwUzY+IJqnsgpS7YeB5hPDSAiU=;
        b=hAVSNXrZWv/6EIkDungRZyFn77s8Z3vXgmuHAZw7hG3FBQydR8CvGId5m6aeoeZqUn
         5LIN30gWwQOMvWcdaqEqNAammLto5WBz1VLsYi2EkXbOFaMdomd3bzMIRWJVETsPeBeU
         VzvpZIFcO28ZB+qvzyL1Dc/8jKTMCg0Ew7kpFXNsm5xJ4GP6UW1aQS3OEU6VliVaXDy5
         rM2XMdXn2PtV2/14+OoGBqAQZ/yRkgCH7yeG8act3ZCxWVV7a2m73E89e+Cc7IEo24C/
         1j1fiIJGAQdB27DlE4SjrcV8AIqGWtueH0W8la5HZ0TeyNNEDTW4kVMUGnkfeqXzmFIi
         zO3A==
X-Forwarded-Encrypted: i=1; AJvYcCXtpYp0PPTtpVcwk+vALKV6B/6hRjAwICMbgMuKn/87Vgck0G7TxPW7FwUs7apH+GRSp1/KHegX7ciGgAc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAMgnrsXWdXgGzrLUC+ZfXz0GLD4gNfS3eF3hilJNAC1tuzh9F
	xiER48neu8Y2SGNHgc2edgDl6xxxk7KCmcS9fnara4qMMC9SqtfeBLLob2sB1G0=
X-Gm-Gg: ASbGncua8LV9gZpRG7kGmzh82oJnYCvTItmZIU6LOhX6k+1G/2NvOWmFiCXbebD8IRu
	p2i3n1mib/r9RI3qo14nfrOJUeRHDL1z7oC9Hv87efiFozdNSZWN/2FSQg+or89YLAljr+hBDXK
	OCm7mMUUQNKZFwsW2LHAPIOt9RWcoxeQQnYuj060b+MuV866EsYY3Md7uZL8jbdxIXZy/grb660
	wAvzs3RJfLPZPpR2eSDjzqLS+KOR6fN0GnL4eyq4MgjdEcFLW57rNZD/mBXWoMJxqB2Zr56LlRj
	deiM7vq8j91cn41PW6lF5NXYTjfsnpkpOPEZIsFnqYIR6iKXaDlH3s/cIA==
X-Google-Smtp-Source: AGHT+IFxzoHVTs85nB/2QCYX1+sgmEItPPt1ggabHpBdb5kgred/4/pK2CDSumpwJgEYOUOvr/4oog==
X-Received: by 2002:a05:6000:2407:b0:3a0:82d1:f3c2 with SMTP id ffacd0b85a97d-3a0ac0cb13fmr2410966f8f.10.1746531763203;
        Tue, 06 May 2025 04:42:43 -0700 (PDT)
Received: from ho-tower-lan.lan ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae344esm13198473f8f.25.2025.05.06.04.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 04:42:42 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 06 May 2025 12:41:40 +0100
Subject: [PATCH 08/10] tools headers UAPI: Sync linux/perf_event.h with the
 kernel sources
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-james-perf-feat_spe_eft-v1-8-dd480e8e4851@linaro.org>
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

To pickup config4 changes.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/include/uapi/linux/perf_event.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/include/uapi/linux/perf_event.h b/tools/include/uapi/linux/perf_event.h
index 5fc753c23734..c7c2b1d4ad28 100644
--- a/tools/include/uapi/linux/perf_event.h
+++ b/tools/include/uapi/linux/perf_event.h
@@ -379,6 +379,7 @@ enum perf_event_read_format {
 #define PERF_ATTR_SIZE_VER6	120	/* add: aux_sample_size */
 #define PERF_ATTR_SIZE_VER7	128	/* add: sig_data */
 #define PERF_ATTR_SIZE_VER8	136	/* add: config3 */
+#define PERF_ATTR_SIZE_VER9	144	/* add: config4 */
 
 /*
  * Hardware event_id to monitor via a performance monitoring event:
@@ -533,6 +534,7 @@ struct perf_event_attr {
 	__u64	sig_data;
 
 	__u64	config3; /* extension of config2 */
+	__u64	config4; /* extension of config3 */
 };
 
 /*

-- 
2.34.1

