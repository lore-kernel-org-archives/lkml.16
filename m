Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4984C28FA9C
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 11:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748518402; cv=none; b=mDCgr+4f1JRRxXYEk7VaRY2DwvQgoElHxZu3HPHLB8O4ysyNkMUKDg5p3Jw6Myzkgw9jbGX9tuwOaS5er7ewMjmdBtcdewn2goXlW1t+i4PFQ68Xk2yeKTYFe5wSTAUCm2es+KOPmdTjdSDDWrX0+310O4H4dhKQKZFKuWbaVAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748518402; c=relaxed/simple;
	bh=zvP1e+1MWcLi6dFHbap1BiJEf/Gwy+p9o8HThmnNJIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fACNnXH3/JMiUWh8xAw6R8b40kBNMLWrdXo50dO82b6U9wk5SZJa3REZ1bR54fzy/J7Pp/jPZIztj357EwSw89yQ+s/5qa1OcVmiqB+8W/eVq1HzSFFGuxc/BtpfBOvErdwQy6BCMcJGPyJLIFBA/u0SGbMHgQ5OO+Xt/VJNEk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wvVgcuA+; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wvVgcuA+"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cfe574976so6794935e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 04:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748518398; x=1749123198; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Q5mn8xtPi9u9sDm1H7ybxkZxNw4efqIccO1SNVExHM=;
        b=wvVgcuA+BdOAbJAq1FcDO4QE/WkBblcRUu7/mKb7FXqpc+zkCbUIoIAJEuRInY7FNc
         W5yI80pnk5kNbqos8HgaA/+U8wX4bEfDK8ttvmvABPINcOxOgOsedQuZkxxjNKUWuLmA
         AIDn3Ogi1YBNIN1I8YIYp2FaBPYwQeSFqamM2dG31ExILT2upE7hY9nKlz3yep8T8I2m
         Zp45j1wJ8ZfgvVeTP8nA9UfRPx0NHEe7r5N0dvh5aSOi5iDybU1QKbPBom08WGfZicV3
         Raw2RF5x5w6NSJbM1ynY2NI00V0A1wJzx3XQm0suw18zdW/x38F8z7CvRdfU4HcIMcu1
         BCMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748518398; x=1749123198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Q5mn8xtPi9u9sDm1H7ybxkZxNw4efqIccO1SNVExHM=;
        b=Zgq/ciXD1cbQV/DkTDWd6sojm3+xn1iEsIAONZYfukoo25a1f1yCnFdW0l1IkWF4/p
         2XlgJQREGFoMN3jwCIUsk8XTDNNslDeYLswdIDD5OUpM0Ub5YotsoMiMkAb9kJTUjMhl
         7yPVzGX5OwBl5AmKgaKwrbzvfja0mWSXHjiMpkWBM5z6HchqQLiv44S3RZ3DecDmz9vM
         nQO31mYSaGf20wpG1UB/DlelVFSgOa2BkM1wRMmvdpmlZK2b0b6r8pWmhNTPwA/NgH/v
         WN5CrzNHZf6W+jyG7EPQHA9uapducVak7SGtYWJzlu9x8ZavyiG+UpggBOkSEuwpFTe+
         aPgw==
X-Forwarded-Encrypted: i=1; AJvYcCWFPbPyPlHO2RRXxuASn49/v/nG0nNsq/1+nxEwkNagvnyMs6X/fuREQDELy1OQclXZJ3NqLM4F3v9wQy0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6zFb8LbJFA2Y1LosOsmZPuBVhzRSxGO/MPpvSn78xUpkF2eBH
	iF+Qq2BlFzW54TNSAMfDla7StoZYe008SUk6fz3nL4CIxvM9tL3nV2OT68Ti07J3dI8=
X-Gm-Gg: ASbGnct4Ie1MHSvT+8zzOZa+//sffq99dyOSk7dvUFZmC9sbfhWbp7+cA2Gi/zXXnUa
	FnWkrUEJx1u1Wjz46sWllHkEi1iPd3I0FTAh9VbGuTXkMjnXByIapVVGb1x/ZPpvTDX34Ww0DZD
	gMQTAvYPGjzDAo3nvRjxC083Dr5lvxrVhmHo0hv/gkytHrKYO2x4FUbXHZ8RBtYJvMzQkuzKKJc
	vYuada3OvC/zfFubqtc/3djpm2plJYQ9NJRYIphfGZAhXxd+Gp6Bv/NGhPbxuwVFuDpqDeY1oMS
	VYYE4lEK6XfHGUhTXZXUT/l6cefUEpV6DSW/StmJ+tM8wLyX2sSXrj8aHRNhh+TWBGJH50g=
X-Google-Smtp-Source: AGHT+IFacLMgy8Sgufz8crND9drSgOY6qRlCAWckmK5shHNZ9zSnAptuNxdT/H2WMCBvDy1/kfCobg==
X-Received: by 2002:a05:600c:1d8c:b0:43c:e478:889 with SMTP id 5b1f17b1804b1-4506b541d07mr59510265e9.0.1748518398270;
        Thu, 29 May 2025 04:33:18 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450cfc3785bsm17443945e9.40.2025.05.29.04.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 04:33:17 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 29 May 2025 12:30:28 +0100
Subject: [PATCH v2 07/11] perf: Add perf_event_attr::config4
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-james-perf-feat_spe_eft-v2-7-a01a9baad06a@linaro.org>
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

Arm FEAT_SPE_FDS adds the ability to filter on the data source of a
packet using another 64-bits of event filtering control. As the existing
perf_event_attr::configN fields are all used up for SPE PMU, an
additional field is needed. Add a new 'config4' field.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 include/uapi/linux/perf_event.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
index 78a362b80027..0d0ed85ad8cb 100644
--- a/include/uapi/linux/perf_event.h
+++ b/include/uapi/linux/perf_event.h
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

