Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6746A2475E3
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 10:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749120616; cv=none; b=YB5ggo11b6en9DBfU+TnN7JKCQ7HdRpWoO+PE9wmueuI5BASi+ydIZ3+w7Mv+suDAqYfukVUCA5SarBap/FC2BcEs1odoxrMUrPhQMd9tnwQ6305/DBUcgC6JHj+F7I9jzG5Tinf8lBeVdfsWRUSeOAOgWRvlvobon7cyktKll4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749120616; c=relaxed/simple;
	bh=luIKfiwgtXeAFEj50ve3W9I2lyEw3hMNW0iXhyMCu40=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mxy0PyC6c1G1eFhhzeFdnepPTFsKyGPHKl0reBYCqsC5BHBwtIki27UT5/lMbctu3nMphxtPDMrrr1blXnCTCDBVKmj1eByruKy2do18SuhzuWQHpPv1mjf4Q93qHsVY0+s+QRlQSDEGpvUsqUMGpYVKr37Ko5pBrnlDlI0peb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bm1uz5sT; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bm1uz5sT"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45024721cbdso6936745e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 03:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749120611; x=1749725411; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j9Rue6bPIg/trhgv/sEGIp6PJe+iLR+ZUbz2D5vC1ck=;
        b=bm1uz5sTq5EtoddzpljyGMCVBbC8YHEXXfgxedMh6EoEUnpmCJY52Tvch0iBi7H2kD
         Th5876eqIO8iv6P+uYzhV4wZXF2f3wUDBqXXE8ExzkA4U2PUo1nUfukEsOTS4whH3khD
         wCx9XSoMrV074tRvOwjNgREfbDYPehTCRnD8Nu65gSOmHq3kyLjlmI+zcC+6KPq03ZZG
         4UZj+DmtO7y7YjWKxdhetq4IwTVUBtfdWk1ZMHNyedeoPR1MhiVFdfYPmESBNJQJmfFl
         BEGleil1/7EaXr867vVzgKO1xOPdf+qZr1+lmE/BHBLl4CPyNSvOGtUUx+YOdhJZoPVU
         DVlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749120611; x=1749725411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j9Rue6bPIg/trhgv/sEGIp6PJe+iLR+ZUbz2D5vC1ck=;
        b=F2eU17nkkamnW9nMNUPpch9/LpOfkUm/FmwzJqRLAf+3zuwssMzMpisORgenRPw8Gf
         Qei8unEgInFsI6OwB8DH04JuIJvKjeSlmaGyYywKNbZk5ChFtP2pQAgbrAwKsG62Ozxx
         0x1jkR+lvox4YQ5oYsMCZDovSvPg3h7JRA07gV7UDp63Uk4X3HcmEdaUXLdyDM99kly2
         sdP3Fa/e4g4FL1Je+3+qAPNlSJOKdR3kWpqS7ypBE2FFJlQd4EQn/fs3GzhoWJ6VAfpm
         hnmjDnK3Slz+NjejETKCZRRlovzatdNnjdfUVWS+U6g8YYk1Cn+KQK0kN62+gajEupUo
         cb+g==
X-Forwarded-Encrypted: i=1; AJvYcCWIK3k3SQ6iBuiMYRwljgY5311Tes7fCq8z8XdkLCN2WRslwS3RwwgYxTyOSOlW3uHZO+7N7Ot0W+szs/g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxUwlMnWTRgcWGaeF5mZZqfCqtoAsNJw6fdS4bihPLuxog0jy8
	sIci9hEqJy/gfkOOlc74EGlzoNi36TDQpgqoW5f725C9/DZjF+oOFxzUu8h6viQvXe8=
X-Gm-Gg: ASbGncu+shGRRPLPCd0TW7svdfb/SjCV3dNQiqsv3okKxzdpfnI1SUZ+0OZPcsV05bO
	sqWiWWasgSmGoqKN1Hy5iazn4bbF9rDasWyPg12OmcEUKbMdbYA2cu4CltT7CGl8LWw7Z8aoTRP
	aWdz1MxzGKO6kKlrZ7/+O2DpNuw+OWSDeaLfuPO9ZFRNWQxJLD6QrfBO2Ix/6lFefXKCfwgpy35
	oCTuTcS6WrLa1QfX/kPaGwarFUTdLO8YEu6cbbehy7oJExdw+JcGiufpN/Ib2Skd6PLVHQYVs8H
	LvFHx6rmqRQYsJeDpskTZZNJin4KDbxmSzxQeQMZX5hl9143iUy51nWKgkAn
X-Google-Smtp-Source: AGHT+IGgu16RRFx+Y09hUhjKjxwfPfRayhA9cKQUsDuzGVsP3y8rnAFwlUH2ULqYWuFyxL3gPk8m4w==
X-Received: by 2002:a05:6000:2389:b0:3a4:deb9:8964 with SMTP id ffacd0b85a97d-3a51d91f899mr5503049f8f.17.1749120610702;
        Thu, 05 Jun 2025 03:50:10 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f990cfe3sm20629965e9.23.2025.06.05.03.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 03:50:10 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Jun 2025 11:49:04 +0100
Subject: [PATCH v3 06/10] perf: Add perf_event_attr::config4
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-james-perf-feat_spe_eft-v3-6-71b0c9f98093@linaro.org>
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

Arm FEAT_SPE_FDS adds the ability to filter on the data source of a
packet using another 64-bits of event filtering control. As the existing
perf_event_attr::configN fields are all used up for SPE PMU, an
additional field is needed. Add a new 'config4' field.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
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

