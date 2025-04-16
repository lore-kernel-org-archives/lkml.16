Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7C9205518;
	Wed, 16 Apr 2025 01:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744765316; cv=none; b=hk+Ja2eGDkjQTvc0VaFmrDS46kFQ1Az1HfuJPGq8jQ6ZlwQunNVj8dSyQse6Nydo7eF9eg+gZ4yf2s5r/Z6eQ3q5MQzUBbCliHAmsfFKTcH+UGVhHYWktkGzAoYLLmrsdaalMtb+kQ2geOnDu7oBlOBeJA/SWDDpLKPwSuaez4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744765316; c=relaxed/simple;
	bh=2MOzeayWlccfwTqa1FLxEDzAI5cPyKL90aB6hvk5T1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hWk2uHtodY8m+PHkef4KSgqP/HhUhRHROc+VkmEAoS+qS+w5+0EN4pKhRASv1lXQCWszLrukxavqGwDuTa1DSq6jiSFLOoX++N4+rYHdEB60fEanZxbxnscSlvWYZUieMFxQ2JCI9Y6AMgwk9lUaUiBfCy+ow0CoXfYhPxHeT8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m3RE+JVa; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m3RE+JVa"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c0e135e953so644582685a.2;
        Tue, 15 Apr 2025 18:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744765313; x=1745370113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I9rF9Mh0w+Kj+uaO05jBBZXC+GX1PbjeGPNbhu05MfQ=;
        b=m3RE+JVaKi9fXim3VbjtGPfSHMNKyRP7NW8QJG1DFWhbW32s+Jf0K2A4N9f2jsvt4d
         1M0qidSPqd5GCOQGVnrc1u114MNpobgrbCCjM394bEGiu6bAC5nJPyj4s9Lyr9LOXeln
         XZfMxrTIr4xjP6j5PZpXt/PZVd9MdpmiiBp4RgyKarisppR3XthJQ3WSPeNYFB1LrdCs
         CfayOJP87ctDvdJV4bIwu88RtB1Vj/BG31NoNjurRtrLvZd4aWVFNW5Htns8jA31sjK8
         ZaH0aXi7854vYguqPDgSTeBGubkOvlhvHoSh9iruBJuMl+UplTDhK/Cfb49thx6HG3gO
         6AeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744765313; x=1745370113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I9rF9Mh0w+Kj+uaO05jBBZXC+GX1PbjeGPNbhu05MfQ=;
        b=cvtmVHQXnglb+XxP2s1r0e4ntjWJMy656o6Oo16m8I7KFuZotR/sfhdFVZeSPWXt8p
         tkJmdLE3y8YNvOV1M6ilSNpC4W1iofk7RoWw+sQmdebdDcAhd+EnQ63PxPxxa8vh+TKX
         fuIzLpSgguP+9Oc4K3dDsQwn9yTO/FtnSiF/SCq6SjtvcRBoIeOXx+4JIQPIQsvIDhN9
         Z6ezRihPT1qQFKz5CRQvxGkKxt/gIXRFqfkIdqZg1Kx4mvWcRVMYkI/c4UYFLPHWUqK8
         1IebzyhpxCTYblK4Rq/K6Q2CsCkV8btXHPEGlSWYgyrj5YSjY6MGVIrfAdo/TRRpnCyi
         /5kw==
X-Forwarded-Encrypted: i=1; AJvYcCX4LOiv7nnbG9uo9/W+p0Ew7LzxSYxh8KQox5DB3v5wnK77bEfpCDSRkfzYhVxkof+qakxp4Thdl35i@vger.kernel.org, AJvYcCXxu23pxUYl98eLVB6mCAT8GumXFOZm6Ll0m60joOi8s/J26DRQQBDk59C4pfkED6Zw7uOtIOkq+d/A7/Mq@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7DrZMpi3Bi0DeBWw9QXZLwI+tvwJFnHzhEGB75nG/k/zJy228
	wiL8PUG+6Ffjni+UzhBSu0Nf1uNfMcECJt1kuqzSdnkzqstjbcxCN52tWA==
X-Gm-Gg: ASbGncvlJs3I4xaZBCnjfLFCeCoR9icwRfv6sWWYXMmTc+sBRePNZovgZwlL8etEsYS
	B+kXOqaT+x8tDjJls7WqTxntKaLVjwfyBjql1P1+wwmsZc0glK66HkeUvCxe3wP39SCLbBtN28U
	Xoams/E/xyx0HQ+jeXeeBSARiir9OjStyVxzdnFBjoNh90LGCv+z94/k9cPwVniOHUg3XMNhZbZ
	svSxJU6OvGJAmqDhB73hrDOwQ3nfZxDYSsgIXAW48rzdE3sP87keg1/2/NhwjT5nYHfIDGLnZg1
	etMuf/nLyXFpXFppnJVwSJ/nSu6Nx8AdOULAAul6jtCIHuA0eS5Ep1cDo39EX1dtC1EK157fSdE
	G+Kv6VrtUJ7AsJsQ=
X-Google-Smtp-Source: AGHT+IHo8LW4/kQU8vbnG4ZIc93Rt6FiRzzyd/pS66bVb4v5nXdfGqbOemh/k9HlpLvqVxNmTUc+Lw==
X-Received: by 2002:a05:622a:110a:b0:476:afd2:5b60 with SMTP id d75a77b69052e-47ad3a28ed0mr21853591cf.15.1744765313439;
        Tue, 15 Apr 2025 18:01:53 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796edc29ccsm99746291cf.77.2025.04.15.18.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 18:01:52 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Frank.li@nxp.com,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 04/10] arm64: dts: imx8mm-beacon: Set SAI5 MCLK direction to output for HDMI audio
Date: Tue, 15 Apr 2025 20:01:30 -0500
Message-ID: <20250416010141.1785841-4-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250416010141.1785841-1-aford173@gmail.com>
References: <20250416010141.1785841-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HDMI bridge chip fails to generate an audio source due to the SAI5
master clock (MCLK) direction not being set to output. This prevents proper
clocking of the HDMI audio interface.

Add the `fsl,sai-mclk-direction-output` property to the SAI5 node to ensure
the MCLK is driven by the SoC, resolving the HDMI sound issue.

Fixes: 8ad7d14d99f3 ("arm64: dts: imx8mm-beacon: Add HDMI video with sound")
Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  Change commit message, no active changes.

 arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dts b/arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dts
index 97ff1ddd6318..734a75198f06 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dts
@@ -124,6 +124,7 @@ &sai5 {
 	assigned-clock-parents = <&clk IMX8MM_AUDIO_PLL1_OUT>;
 	assigned-clock-rates = <24576000>;
 	#sound-dai-cells = <0>;
+	fsl,sai-mclk-direction-output;
 	status = "okay";
 };
 
-- 
2.48.1

