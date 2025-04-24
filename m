Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F4E1E520C
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 06:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745475725; cv=none; b=LhrS9M65NncCb159IGH0i9JAo2ZqBxWfoWG41SKV4qJqapFeqQ0aMjz2hcunXm8c9tugDODHTrgEliixc75SkkeaySerPWS2pq8lAqC+mtBmhBJkAXXB5QBpu+R4MFjrkuVozZ6kHnFtv4lWjh4P4O1aRifCogfck04Z3E1L2HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745475725; c=relaxed/simple;
	bh=+1wDCnUf6V6waC2u4F0CjceMoJUJQ3m5duPgNX1wMjo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OegYFw8BfFsh5ysGG4OM/++IyzcIVj6iLiOld6ylruEOZworg2ebPQf2vapfhYc6hUVFCsmjBBkJ0+0ZOajC1c+rxqWAdxbb5den1pA47dpoxJhmABfT4tBvn8kecOV0ywN1Nk6eo2CCSwK4tuNRNXlauahmmI2zup3jM8xWAwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=kc1Ik57t; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="kc1Ik57t"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso3984415e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 23:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745475720; x=1746080520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0D3K2ln9Lb+MNQxN4twGUjq+Zn0uEKE9IsRwsBI/jVw=;
        b=kc1Ik57tXUuabpv2UqrZwYPKt7saiONA03ufohvvZop7y9CVcANJv6xw/7HW8l+bJJ
         9tFaJtxRIWg57fOGFoZM/7SNXgS/MRs+dyYjzTDMSs/WvFeL6rJuyCgtuxfdOwoXidpQ
         ZCYHxE3JZWQSW40vUGTdGbzsVYgtVF4ysh51A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745475720; x=1746080520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0D3K2ln9Lb+MNQxN4twGUjq+Zn0uEKE9IsRwsBI/jVw=;
        b=HXtoYKVvhpNaKxbYNsKn6oCU/HhqrbX0GOF9UN5fxsoVPkEXUHTG1Yzv5t5WsmiVrm
         xSKLop+CwRdNClKQL+qBzN1CfoR27PN8GZlkgYY3NKQ75IDzS0k+A9hfFEPEZ9aktyMI
         WAsvWGs/8sKLKTErtpiUKDUSUE7gizgoUnlFIFBHx4utSDHux+PSQdudJ4L0RPlK058K
         wfmnbERp4Y+w4ThAc0bHjzAO0bAbiSjREr+58pYKr3u7/QbW8xPzPdYq6FJNGRG1I8po
         fsXpZsLgNHe3en+FjnFeofYesTzuiKwsMeE3gh4JoMKz2AgyvBIsPheq/TAmyx2XiSFw
         xNyA==
X-Gm-Message-State: AOJu0Yz0Ykps9vLi4Pbgh4QpmfOcVh1C0/7yhXHvSm//sjyZYMqjUws8
	XkS6t6VoQ/iJRHjcA169nWicMBgip6xBR7C2ETTwvTJf6LEAaR4qTpFtK0YGWGGKPu29/G3fUJv
	q
X-Gm-Gg: ASbGncs4QdPz00SI8d6o/xSsUSDQDuyiZ/ouuKEel8A0e1PIacAdFYnvdZGUr3OkqdL
	fbK3eNA1Ue738pN4d12DPzSPSBGR3TH6dLVyuKhVVORrT536RPeSySV+1277OTooFccIusfDsv9
	ajQJ/OkzPsrcC1QS0DsuD37rm9StmzuCHLUhJhyHQXF0CaRXeXSrAFeAbEO6EP0RpAg0wZlth/D
	zBgwpkxkobQRldskHzLgm0fb0IXfBvplvPO6Wu0VBobF4NwDhwEh6sbnFLomdohqLP0zKUlWtyc
	SeawWXgiH35Bln1ZEmQ/MFCa/Cq2/ZKUgjdN5CDV1P88UdFepOZSjxfPMR4Cb7xu7e5SjjzA0Az
	3RILV
X-Google-Smtp-Source: AGHT+IHymxJmFKpLmwrZam+TMOOI/0cy/ciCsXy9MSaKz4V/Z0qmORSIolFTEtnoiInGOXnttK5eTQ==
X-Received: by 2002:a05:600c:c092:b0:43d:186d:a4bf with SMTP id 5b1f17b1804b1-4409c399b9amr7368115e9.0.1745475720552;
        Wed, 23 Apr 2025 23:22:00 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2bf8dbsm7243435e9.35.2025.04.23.23.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 23:22:00 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v12 01/19] dt-bindings: clock: imx8mm: add VIDEO_PLL clocks
Date: Thu, 24 Apr 2025 08:21:31 +0200
Message-ID: <20250424062154.2999219-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unlike audio_pll1 and audio_pll2, there is no video_pll2. Further, the
name used in the RM is video_pll. So, let's add the IMX8MM_VIDEO_PLL[_*]
definitions to be consistent with the RM and avoid misunderstandings.

The IMX8MM_VIDEO_PLL1* constants have not been removed to ensure
backward compatibility of the patch.

No functional changes intended.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

(no changes since v6)

Changes in v6:
- Add 'Acked-by' tag of Krzysztof Kozlowski

Changes in v5:
- New

 include/dt-bindings/clock/imx8mm-clock.h | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/include/dt-bindings/clock/imx8mm-clock.h b/include/dt-bindings/clock/imx8mm-clock.h
index 1f768b2eeb1a..102d8a6cdb55 100644
--- a/include/dt-bindings/clock/imx8mm-clock.h
+++ b/include/dt-bindings/clock/imx8mm-clock.h
@@ -16,7 +16,8 @@
 #define IMX8MM_CLK_EXT4				7
 #define IMX8MM_AUDIO_PLL1_REF_SEL		8
 #define IMX8MM_AUDIO_PLL2_REF_SEL		9
-#define IMX8MM_VIDEO_PLL1_REF_SEL		10
+#define IMX8MM_VIDEO_PLL_REF_SEL		10
+#define IMX8MM_VIDEO_PLL1_REF_SEL		IMX8MM_VIDEO_PLL_REF_SEL
 #define IMX8MM_DRAM_PLL_REF_SEL			11
 #define IMX8MM_GPU_PLL_REF_SEL			12
 #define IMX8MM_VPU_PLL_REF_SEL			13
@@ -26,7 +27,8 @@
 #define IMX8MM_SYS_PLL3_REF_SEL			17
 #define IMX8MM_AUDIO_PLL1			18
 #define IMX8MM_AUDIO_PLL2			19
-#define IMX8MM_VIDEO_PLL1			20
+#define IMX8MM_VIDEO_PLL			20
+#define IMX8MM_VIDEO_PLL1			IMX8MM_VIDEO_PLL
 #define IMX8MM_DRAM_PLL				21
 #define IMX8MM_GPU_PLL				22
 #define IMX8MM_VPU_PLL				23
@@ -36,7 +38,8 @@
 #define IMX8MM_SYS_PLL3				27
 #define IMX8MM_AUDIO_PLL1_BYPASS		28
 #define IMX8MM_AUDIO_PLL2_BYPASS		29
-#define IMX8MM_VIDEO_PLL1_BYPASS		30
+#define IMX8MM_VIDEO_PLL_BYPASS			30
+#define IMX8MM_VIDEO_PLL1_BYPASS		IMX8MM_VIDEO_PLL_BYPASS
 #define IMX8MM_DRAM_PLL_BYPASS			31
 #define IMX8MM_GPU_PLL_BYPASS			32
 #define IMX8MM_VPU_PLL_BYPASS			33
@@ -46,7 +49,8 @@
 #define IMX8MM_SYS_PLL3_BYPASS			37
 #define IMX8MM_AUDIO_PLL1_OUT			38
 #define IMX8MM_AUDIO_PLL2_OUT			39
-#define IMX8MM_VIDEO_PLL1_OUT			40
+#define IMX8MM_VIDEO_PLL_OUT			40
+#define IMX8MM_VIDEO_PLL1_OUT			IMX8MM_VIDEO_PLL_OUT
 #define IMX8MM_DRAM_PLL_OUT			41
 #define IMX8MM_GPU_PLL_OUT			42
 #define IMX8MM_VPU_PLL_OUT			43
-- 
2.43.0

