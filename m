Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF877290084
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 11:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748518405; cv=none; b=oGiY3PHcEmFpyLYII4JPtST7Iy0maD+wMJc0rCQXmQrAN6UdZYovpBwLJcUso8umgb1YUn6TkNRyQK0VpoMstru49nG16oCedvD1PPW0evt8FHYwmB6zBUfJKIqzd9Z1X/yMmCK842kVG4+kRsKRsFc6nxiDw9S90DkssXfY8+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748518405; c=relaxed/simple;
	bh=luGNkoeE8UlMJRKbxQ1WFt67Ydxa/TXTNRQ7E6/zPH8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SrWzZ/w4e5oeedzwXEgx9mLhYsZuZ/yVma5UOCda702M938tUgpQ7yWeO0OZyhWrLtumyymAvzWnTI+DyMjo7O1KAIzd8wd/1wQN+IeiT40aPtVggoluWOa6qClZwu5ENOL/IShK077YOcRmbCJKqrI7MR/OT7x5JoSIIc2fM5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rjFHV2j4; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rjFHV2j4"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-450ce3a2dd5so6681555e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 04:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748518401; x=1749123201; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TtNy8TV2Q7tdQ7rYLolUVZZNcwM6dcUvbileCfs7vIE=;
        b=rjFHV2j4uVy3MQgfdfvTMCHm8VuLc588kKmVuvvKKi+z8wC/D6yf+icdyojhvpQEeV
         PCulage6GBERJhvl3c9ujwirVDKsLHf1yyN4tn8y3sljY1wsYbuEOR7I33qkWBqcF6ll
         wxApjPpuRLgjdhHLKn2M+N9I04vmo9ajjDWTiUcFoVxUepCR5yVkwQU+PiK3hC8hwu9B
         9Rcvi7eRaZwfN+J7y1w3T/3Rcs31sKoulU+hxLAZ/30xd9symOF/+kOwYkIyR8Vs6L69
         SPNgBJb4TRYn6oItDc1Rjep+qL+1BEYFNq47lkh3A6ff+cLf2JrxDayNTYOzAC5RD+MW
         iUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748518401; x=1749123201;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TtNy8TV2Q7tdQ7rYLolUVZZNcwM6dcUvbileCfs7vIE=;
        b=piskOmyiRsyFERi6Z4kXg9br6DQOpjf1ZgI99Nf4E1A01W+F1HZ5B35Y/OnoULoKKH
         hRjxQgBfvLGdv8OONvrNvL1WaOyZADacCn07Mv3w2DMsberLpQEoi5DuibhFhQseBIkI
         IzpjvB6iyPTJYahDTV/jSwdZSuCYFs8tjfztfgxTh9jHuMDjGnShxPoQBXlpZLH4keYW
         8PJShfSONKax567iuB90usqKTJ3s6ckW1GZGZ/Gvs199FVCBol18ZtH9BaQeQrbye5B4
         1inO1OJ9jqLpjB6WUg2XmGbsmUBu6OO5BA97VjA4RoyJvLVad7oFhJz3bxo8J5+hUo9c
         i0+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWKe4XMh07JfwmNDlQ52riXoMrVRIdY8jxbuMrJm5ZZHFIdGdS5dHH44D5gRng803yJQ1rLpwN51Z7BZ+w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXaB9p8Gn8AkzIU8MGvWAQRNPV1+y2p6lHHPhKTvw+xp5Sxcc0
	9Ir5L/OoQixnqrACskPB5dBk5HBOSvFenNH6ikRpQPfZ7W3EAp15PktG17/mJ6f2LAU=
X-Gm-Gg: ASbGncuOrV67LJTgp3lwANyYipoR1p+MaWcX4/CBbHy2+RD+e1/ILYvfs5t//WVr9dr
	jcjG2TPvhXr17I0pPGEarV9vBuBa1py1YB9fGwb+EyhkeFqyf3d9iOJ5x307gc4mjXdFsc8HdZx
	6X5b5jwwsy9fc4oMe+C9e5oBOGGmGynKqbWFrN+zxjWjDdfZYsrUXbFoyYeYFzkyNH8dMHOTkrw
	5FcPFII2RWarhnD25NXl7myzD3uCPlOWwgqHPaGS5SZdql/s21C8WNvHli8fnvXsEXE7G+ecjqg
	hK4U9krulzXtFTHCEDw5rorKBEsiVeBJ74A1brM/dej+M50D9BW9Ko68Ce3B
X-Google-Smtp-Source: AGHT+IHrXdHKaLMm+1yIpS3FqW954SUKKGaokrQq0Fw7uhbVyrwkEnNO9Y6DJeAGvxM0rmC8BWFyjw==
X-Received: by 2002:a05:600c:8411:b0:43c:fe15:41cb with SMTP id 5b1f17b1804b1-44c91fbb039mr231750785e9.15.1748518401174;
        Thu, 29 May 2025 04:33:21 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450cfc3785bsm17443945e9.40.2025.05.29.04.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 04:33:20 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 29 May 2025 12:30:30 +0100
Subject: [PATCH v2 09/11] tools headers UAPI: Sync linux/perf_event.h with
 the kernel sources
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-james-perf-feat_spe_eft-v2-9-a01a9baad06a@linaro.org>
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

To pickup config4 changes.

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

