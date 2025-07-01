Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258721D618E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 15:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751383983; cv=none; b=mzstRi8cihSkZVf7sLZ3sc2wYoI/JQSiAITYLwdlPZeIPm2s0MP65smeVFJzMMMVrMWheec+ZVAeqpGn24WZSrxGuR/8mHzwL/kSlYOcDL0ZH2qwJ1GrTEDOJfHZ5jXTOQz8aOS7ZjDedCSmuM4C94urjjtZ0/cbtOTHl+ph81w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751383983; c=relaxed/simple;
	bh=vdTeF/m84YT/Y3csd4U3ldiSvdJObzaAHVoYx1TRjzE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JVzSyU3boYC9PiZOyZWoyGWt7XHGg43Mgelr9+m5YobVmZ67Ivu8jyvXgTBkoFR6p0mKeA6SyDhT6mliA0ZtbLq1ci5aWj7IDPVs+qmIeOfGbAlDcFsqjuJMsz/aO4t9HXWX7PGP05Dyr4RdeIyBpXhl8yKbhXdY+xIaCSzwD6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y/G+ht0/; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y/G+ht0/"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so41227175e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 08:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751383979; x=1751988779; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BwP1GAWiDk39SfGOihsNEaC+24qtW3947zs4uYy6dh4=;
        b=y/G+ht0/7776Gst8ajj/j4rB/oZfTOcqoZ5lYvwlRpeza9V41ONyiEU97bxnnEG/tc
         hWSBBb6UWpmW1kWLV6Iv7UJLnVHlnL3MqqJhsSdFX8Kyao1XTpH6ndtsgsBsMM+qiZaJ
         sxzHI7WtJDauG3ntTRYE1FpQU6sknQ+1IxSIIXIDOlCQY2WaIJ4CVoR4szCUC8prnkZB
         iB6Ly4lDKG9eJlVOs0AIdW8DXdGRCg7AP8F3ROTEKv+zOyzRn4dY+QQvpJz2USTK3k/W
         +Mi59Qi9saU7zmtR8tA1aoehs3I5l0+AnQRcy607bHTDCLiyyADAFKw5YvT49UEc00oZ
         Q6Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751383979; x=1751988779;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BwP1GAWiDk39SfGOihsNEaC+24qtW3947zs4uYy6dh4=;
        b=s+T4QAo8lSOPhAGpABCQJpbshG8LW3VcRMKQ7y6AcXxYyLN2XAjGxBoW9thkwkwYML
         sfw/rzjpUTm1VjSgdOSDylxFt4QPOhmJ28MBGLpmLcNwsjbs6dBOv70oCAnfwgBkUezP
         CWraKoWlzXb2QLZaL29AAs4RLLJLm/sBocN8jZmrzXzaEBw5g9HUW2tstLUV+lmz9wuK
         2PypXmAZxDcKpo4Q1yhbhvzklf8QrHT8YqxD3fZquTlnY/WWjhnThHMuAys2AxO0yq6q
         jUrurEMFrDU3JXvhI4cgbSj5LjZuNaFm+Qt0QW+VMIk5YUS8foEXulthLFkyHFmv2U5v
         0NFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVy0tnhuNNODc9w5qtcZFCebw6pOWTVmGVTYdlGLNMV6Im7s1xQXUglR+gjLSqWEg6wBtksliM9xuadldI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwA3zmQ6HHy2WF+QEvzGc+hTy0I4k/NNS2xe1Xf0YLZlgF8or7
	wP0YpwlBgfkR9Cy19/Gm2i/Lf8TYiHJKOnAQOWzcg2kNwCvhX7TjN+dukSEM6uWIqs0=
X-Gm-Gg: ASbGncuXkdrHHsElGp7XwoqgNGRqbExw6kE41AHmhYLYEXhWf3quEzWQpxck/Tw15Q7
	j1Khe3LZrfz9AaDR19T36E2HQzQACBsk1hyJgCbFt+zO4SosdfNFJ+ymGJDUVJ8rNrfjtPHy97z
	8oRdWKm3l/jaDIJXoTT6PHaIpLjM+EmnaGebAXFw1+I5ZtrbASErpA3YdxLoY9H+CoHUzF2qLtB
	0e5TDAcWAY+V/T6WTL7YLWlW47a72yGKP1/zaCJNY2Eq/qAimO+bwNTflbF1pqHQ9AuLw2K71Bh
	5n+hH5VVfD4Ek8cZwlb8p9pw3NBjLvQTnKk95fgizMKY+QtVSJqERMPVfsceBfW8itjTVXY=
X-Google-Smtp-Source: AGHT+IHBcNPypFwgfB92PgKhi+9On3myyxGnEdMTs6aSK6qgav8gtvbdSNFdxrarSqsinHbJfbzW6A==
X-Received: by 2002:a05:600c:4f02:b0:43b:c857:e9d7 with SMTP id 5b1f17b1804b1-45422f35f0fmr28544995e9.5.1751383979349;
        Tue, 01 Jul 2025 08:32:59 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c80b5a3sm13435002f8f.40.2025.07.01.08.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 08:32:58 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 01 Jul 2025 16:31:57 +0100
Subject: [PATCH 1/3] perf: arm_spe: Add barrier before enabling profiling
 buffer
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-james-spe-vm-interface-v1-1-52a2cd223d00@linaro.org>
References: <20250701-james-spe-vm-interface-v1-0-52a2cd223d00@linaro.org>
In-Reply-To: <20250701-james-spe-vm-interface-v1-0-52a2cd223d00@linaro.org>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Alexandru Elisei <Alexandru.Elisei@arm.com>, 
 Anshuman Khandual <Anshuman.Khandual@arm.com>, 
 Rob Herring <Rob.Herring@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>, 
 Robin Murphy <Robin.Murphy@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

DEN0154 states that PMBPTR_EL1 must not be modified while the profiling
buffer is enabled. Ensure that enabling the buffer comes after setting
PMBPTR_EL1 by inserting an isb().

This only applies to guests for now, but in future versions of the
architecture the PE will be allowed to behave in the same way.

Fixes: d5d9696b0380 ("drivers/perf: Add support for ARMv8.2 Statistical Profiling Extension")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/perf/arm_spe_pmu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index 3efed8839a4e..6235ca7ecd48 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -537,6 +537,7 @@ static void arm_spe_perf_aux_output_begin(struct perf_output_handle *handle,
 	limit += (u64)buf->base;
 	base = (u64)buf->base + PERF_IDX2OFF(handle->head, buf);
 	write_sysreg_s(base, SYS_PMBPTR_EL1);
+	isb();
 
 out_write_limit:
 	write_sysreg_s(limit, SYS_PMBLIMITR_EL1);

-- 
2.34.1

