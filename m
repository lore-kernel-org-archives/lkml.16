Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552FB28E17
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 10:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749120618; cv=none; b=IgLMBLO/KQjpN6aecuEYPF3LkoClkEsX/NNnqx1rixsqxVDG/7BLErRUf0FbC+Qwz65hSWMJ4jNGSSuBhQlTVtPLco5Icmmry5UVjURW/+Veq0vaZKT0ZFDd0IQEAW6oidYua8Sv/pTIJ0bnF084I2R56plsw/0zq3lfreJekOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749120618; c=relaxed/simple;
	bh=XeTbgg1YCZhnU/IzLKbCe1re6NeCWvfz3HX4Zc0ZwHU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B+5ql0uAm9McWzbsNB8pbxADfRnIiWSt6q5ncnTI1xoblGYqWf1nRmNvQBVx1NZrzkjtzgODbkkwF6u3s1iKZ4WQYbr/a3ef2GBE39hsAdG3qr26b3J39viNY8sTCN1YfjHSmLa/gJtdNheoKWmp9VmbIHYj5ImGsHF9X44vi6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mt+YqD2W; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mt+YqD2W"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a3798794d3so617456f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 03:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749120613; x=1749725413; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l6klp9EUNzNQb89anQF9S8nNJOTrH6bgf7Ht0lN5b5Y=;
        b=mt+YqD2W7wG3zPxuBuxmlZBTOSl4xgWdqw5Kx/7rWDH+AnU9+HyyMPNUGpUl5ei7Gc
         cHKEGuHJAAapWEdI38+s4wcA/84ZaneXxsepP11WYgHv1VSv0BofutwSAlQfZdYvPI35
         0GSLa9FJcbOrB1y01OaPruMYSlgul5SrQSmjdcwfC5wVPrpJLm3Nu/JIbq/pzIUQa9Y/
         712djwtbUi7OcYS/+NWM9vOWTCk+pFZP3BBhP0hZrHGxurpHBLFX+JZZEXzfWw6ZfeqR
         BYWi8UT1c5aeatFPgfwtLkfTVVJQw0f/JStBeRK9xa19RavK/H0MZWsp14e03g1n5tCY
         gPnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749120613; x=1749725413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l6klp9EUNzNQb89anQF9S8nNJOTrH6bgf7Ht0lN5b5Y=;
        b=sQVGu8855TNCfmQ8D7U9dCQslHIze4qbi4qIixNCyCNQaS8IinrXJGCXa8pvvJyqEL
         NWQV8B9+tbdU4C9We7qlLm+iVgRZb4TKx0e6wZyXEu34TmQxoDl2mZN6y+++8+fyeQzP
         Vmo/eGY2lZmKtBW5k6E5cmoAIao6bTtQ5NDy6HEywBLaM5ZrU+6oz0GneqO4lJSNEjNo
         mc35qRsOVQMiFtc5To6ecwGWZXKO/ZPJRoH0T/aPiHjr+Om79BK9sxiorHH3uSd3g29f
         bf2r9sCZlhqN+12A9zK3E8snVe6f1WPnyl3OWVSVehkGLHPJUupCwTF+fdjREwnSS9mG
         PFpg==
X-Forwarded-Encrypted: i=1; AJvYcCW7Vs6Zp+u5fzhLb11i4vIU2YVpHON9OQLoUOu7iac9Z7jWX2Xij5gm7FsWaQXxb9LDLOpoKra+2db0qlM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfk91XEunj/5FMmmYzTh7H7/RfFK5OMRth6NMQWzUOv5jeTnE6
	HJQW0AFq1S+gmKWVktvIjcjV9sRhTi+BKQkNkhfuLS32UKJ2TOJhTLrRmWIjzwn99kQ=
X-Gm-Gg: ASbGncsGm5Z8VPQiRuGSSmeggm0V9j10tigLAMdfJFrB4MulkbYw4nw3pTPr391uvqa
	NIo3VBsmURYjQIGHcD8Mfna9TkQdPfWBDtjQUTJHWTcjLC4IEBQaq1V339iYIO+XqFZCfyboaEM
	wBSu0HjQx6lldF/OwEQCd/Flz5TCBEqurhyUQ5hlKuz4aXmqjxHt+XV4TGNjYTJbwbCAgBEZIiL
	L/Vb5yc34vuNwfsRQJqlK55KiPREgv575RRBTHHRwbBc3uNgWsrs4LehtBLjVS/P/98ptqm+sM3
	DffdadeyMT/Yxrmx5O9QT87Dl/Yn0XJ7tVzFA+slle7Ccl+4Bnqb2dFp4j95DsRxmKSIH4E=
X-Google-Smtp-Source: AGHT+IH02Sm8uYqylsDIHsGX3ZEWWx30EqeNhSMG+4n8yfcZZZ5mpZsxJSCawBIvfoWGFHbxRM6qAw==
X-Received: by 2002:adf:e38c:0:b0:3a5:2670:e220 with SMTP id ffacd0b85a97d-3a52670e28dmr2309297f8f.32.1749120613386;
        Thu, 05 Jun 2025 03:50:13 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f990cfe3sm20629965e9.23.2025.06.05.03.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 03:50:13 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Jun 2025 11:49:06 +0100
Subject: [PATCH v3 08/10] tools headers UAPI: Sync linux/perf_event.h with
 the kernel sources
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-james-perf-feat_spe_eft-v3-8-71b0c9f98093@linaro.org>
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

To pickup config4 changes.

Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/include/uapi/linux/perf_event.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/include/uapi/linux/perf_event.h b/tools/include/uapi/linux/perf_event.h
index 78a362b80027..0d0ed85ad8cb 100644
--- a/tools/include/uapi/linux/perf_event.h
+++ b/tools/include/uapi/linux/perf_event.h
@@ -382,6 +382,7 @@ enum perf_event_read_format {
 #define PERF_ATTR_SIZE_VER6			120	/* Add: aux_sample_size */
 #define PERF_ATTR_SIZE_VER7			128	/* Add: sig_data */
 #define PERF_ATTR_SIZE_VER8			136	/* Add: config3 */
+#define PERF_ATTR_SIZE_VER9			144	/* add: config4 */
 
 /*
  * 'struct perf_event_attr' contains various attributes that define
@@ -543,6 +544,7 @@ struct perf_event_attr {
 	__u64	sig_data;
 
 	__u64	config3; /* extension of config2 */
+	__u64	config4; /* extension of config3 */
 };
 
 /*

-- 
2.34.1

