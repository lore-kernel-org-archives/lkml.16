Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72ECF28E612
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 11:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748518394; cv=none; b=EbZdow7FE0jV/TrmPAAQU+gzcLRLqqQCVgdlB7tAvBFJYaQzIhldKxmGLgfw2loIDTo9kdDzKi5qCEwhduA46NCG7P1luStImIs20yIddsbpdIzSZDofJEDJrDcLGt/qsi7rsOw+kSiWwanZrH70oY+5sRttFF9CrPX3S8h8RZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748518394; c=relaxed/simple;
	bh=0kXgfqs3fyfI9WK4w4EvE8F1GbYyXHS3q4H/r0Lm5Zo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J+7LOP7lyH3dgqAuFsr7zHIrljWyygst26BOycgsRKpC/K8I0WqTcFyorURj/XRHHo31cvOyXpSOHAldu97A5lMssV8iWQkICZ5dbX9UZ7CBid9/leH1kxtD0bFdegVHr5wdrM+KnceW1CKI/skDXBzHoc6971/Dj5GeRrRXUmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mbFxL+1x; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mbFxL+1x"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a3771c0f8cso460871f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 04:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748518390; x=1749123190; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ENKrydK9y6Ncy6QzWlN/lVHecxyLZuFBTl1oby0dHM=;
        b=mbFxL+1x+Te6aGoo7tX4KZmXIgjnXfULFNTZ17T/fLPeaQqGo5sdpRmZvChr2udf8/
         aixxQcHCfCb+8UflpeffXv1RIxWAYARzHllhPnVXptVsF3IB7ktM5MIfefuWo9U8K+ZC
         sFGMXC1yspkIaCcGsSjSTN73UzlWqfAZejPGOpZm2Vvp3tw6+W0cPHhHKPA8BKnD7Pc3
         kIIbMOmpHpywBcHPdmgG1XnfdvHpfN/TgCzy1sPxNJRP4+kiWNh/AD6IcSUjge3dbayA
         xgUC9ZUKTPZYVS2rlDG6/2eLmVO9Y/6ct/a2BNvAA/3flfYgX21W8Oy0R1BfryUZhLdu
         TU3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748518390; x=1749123190;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ENKrydK9y6Ncy6QzWlN/lVHecxyLZuFBTl1oby0dHM=;
        b=Aa+HahLFTlv0fVB6Q49DHl8b2SW75JBYkejMIhulYTIxSLj/TK74Ug9vW6TQUM62af
         WNMI3H42KujyPEB9M8yQayuENBQX2EY5Tw+3sOmInGUwW4w9ELCcE4TYcJKDcx7tAKJ3
         PESQ9D0HWKHBsgyTmGHabN0ERvlWknPz7N37igEDZ7nswaeriRnvvTxUbPoRdzcs5i9D
         7qhGPd1Clv6ThtxjKw5TeyaD0iPWKNxFVp9dWKxK9dQvCekqjIk73Wfxc8jmsQFQQ6TS
         D6uWnxb3P958rTHHH6VRzbSZvLCqft8rLWeQFHZPVg6PbYt2umt6ia6+nS5FTZagQA+g
         FgCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFHewVAJ7ZIYFYIqBzBgNHMyVTwB4oPq43FQljc35z0cgAZC4KQu7YXrq7AE7IP6XE1ujX8EGyxMFer84=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5ZZk79O0E1trBW2z6l1SphPzDnGYLEadaUzUOTlavPkwQiwxm
	RGQkKe+l3h4xLHadZqYsJsUDZh0yibvjHsMRFSrcx4LjE7SwTAURy3DbBc30vddTr4w=
X-Gm-Gg: ASbGnct6PccltijMPSB4AVl9SAFc119jhUF3jr0VOTRV+mW0mOgMlWSWCErGHU9/QxT
	e+oYCJio7KPL/0J7nER3hTy2xMXSz8cMuoOzqhPwSEC+NukTbibuyBZI8/67UY37RFMVB3Z/PTP
	jTSvKFSVvm+2oX8jNpicRQjYY8DGRNqPpvo7hE2xgXKNLtBtnVsNFDBF8IIwPUBa1QyBSaFvMQ7
	CQKuymBy/+6SKDqLiXQzblwnT0n6FsqaDMLFSU8AkKGNJsGIaxxbAbRn6cABfau9YlWsbcwtgzU
	V8k/33Z9QRCfOwTWxTdBz4+vjFWil5PravQde6Z3M9YFBTCJE/5CIJ3EGqpq
X-Google-Smtp-Source: AGHT+IGzW6H/JY6okGMYKiGy1G81BD38MaxIg1/bSFnC+yh1zhWoHrWS5IoXHEN57n42Gztkjj9u+w==
X-Received: by 2002:a05:6000:2011:b0:3a4:eb92:b5eb with SMTP id ffacd0b85a97d-3a4eb92b7damr3548709f8f.50.1748518389701;
        Thu, 29 May 2025 04:33:09 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450cfc3785bsm17443945e9.40.2025.05.29.04.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 04:33:09 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 29 May 2025 12:30:22 +0100
Subject: [PATCH v2 01/11] arm64: sysreg: Update PMSIDR_EL1 description
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-james-perf-feat_spe_eft-v2-1-a01a9baad06a@linaro.org>
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
 kvmarm@lists.linux.dev
X-Mailer: b4 0.14.0

From: Marc Zyngier <maz@kernel.org>

Add the missing SME, ALTCLK, FPF, EFT. CRR and FDS fields.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index bdf044c5d11b..e7a8423500f7 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2226,7 +2226,28 @@ Field	15:0	MINLAT
 EndSysreg
 
 Sysreg	PMSIDR_EL1	3	0	9	9	7
-Res0	63:25
+Res0	63:33
+UnsignedEnum	32	SME
+	0b0	NI
+	0b1	IMP
+EndEnum
+UnsignedEnum	31:28	ALTCLK
+	0b0000	NI
+	0b0001	IMP
+	0b1111	IMPDEF
+EndEnum
+UnsignedEnum	27	FPF
+	0b0	NI
+	0b1	IMP
+EndEnum
+UnsignedEnum	26	EFT
+	0b0	NI
+	0b1	IMP
+EndEnum
+UnsignedEnum	25	CRR
+	0b0	NI
+	0b1	IMP
+EndEnum
 Field	24	PBT
 Field	23:20	FORMAT
 Enum	19:16	COUNTSIZE
@@ -2244,7 +2265,10 @@ Enum	11:8	INTERVAL
 	0b0111	3072
 	0b1000	4096
 EndEnum
-Res0	7
+UnsignedEnum	7	FDS
+	0b0	NI
+	0b1	IMP
+EndEnum
 Field	6	FnE
 Field	5	ERND
 Field	4	LDS

-- 
2.34.1

