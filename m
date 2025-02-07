Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAEE23C8B6
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 15:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738943809; cv=none; b=awdfjmia6Ww8/OIG2dGWFWhyEYKKYqDnf0cxvItQ9vJqTWMJkce12aqK0kBFd5q7PzMTeOrs7NbNodrajDf9SkBMsgLkMWNqGpRZ2XntP86XptT7UKUu/s6oRVkfUf3dm1CwoZa88wcYbxpU/Wv6gwMUalintVF/8TGjezJf8xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738943809; c=relaxed/simple;
	bh=gLGpUaEfuGzvyJ3L21mz+M8nf5rblyz9ev0wDFYPZyI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZmG0rar+k39Gx/A5/7ew5JY1TC+kNjBML2O/jD+X910GzRJVjeGjbbG4vs1uF58tBuV4Pr2yIe1XgN2PZ1W0wLVhRbQuUprQ7eQvEV7rGWPnrLaSfboNM1sogudlzVSGteC9nQ6OMuUV/Iby3V1PRzPsE9vDSVCEj7cGUqqH1p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ihy3DfOL; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ihy3DfOL"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38dcb33cba1so417433f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 07:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738943806; x=1739548606; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xDJPIIRI6GLKY+Zyqq8NOfeinTkGodpwbMUhAI5OLLM=;
        b=Ihy3DfOLCh1y9Xl1mXequJLBtSBEU4kY3c9UIelBcyl7ZGlJ5V+2ZOrcQYxFXKpxj0
         08OOmGOoGAxEz5G2Xtk0DgkpnQ6KJHJ5qwkXupL/rugcxtn6NxaGEL00kFmVNgO9lD6N
         PNDTMX4sbF/zz5IorFx0QA66PglPLbM3F+btWa6AN0K0E2vJg+8l47OsMLY7q0A/erbt
         +fdk17zZqtMcZA/0larGtsjiSQGv4nsFrpQEAGnWyW7RcDVj/Ad7Ohac5CHK+/rYw0tV
         GaHzSf4G7qdE4JbrY/QVFKq7svO9V0Z/WNonHZhwCfRuNUM1PHWxSu+dUhFhNY03uhqw
         QY7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738943806; x=1739548606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xDJPIIRI6GLKY+Zyqq8NOfeinTkGodpwbMUhAI5OLLM=;
        b=EAL3e55/2YSFBeJZxQI0j9+2Kv36J8zQJc4pY7Yc4+wNVKCAWe7NElgQkkGOy1yU7h
         4tIttAryenQw1aIgReM4C5YJsqaWnwYo1/3Be6Fhx1N/G3PsKzu7t/Srwc79JITxKMzf
         faH4Q6r0JErbciMLy40NHa0uwMeGmMSETbdpVbNjMLWZjRTooTMu568z7ixWRbfi6Z/r
         JoMKLTYpne+Df7FU1vwphgrZtqdU78KMtYn45qocZ2w71kysglsIzCa4/qzYBaWUMs9+
         JPtNDn12bRzOTuev/Zvu8ZBaMl+WQyuhg5A5fmpK0us1j9N4f/OMQwyQelFF800FJB9I
         UxEA==
X-Forwarded-Encrypted: i=1; AJvYcCXcr9FrHCwakVBW5CsD6xD55TmE8oLuaqJGFTVFR79NRATxFEAAcoKipIn407ITolpr9uNSVtcjgRF5QsY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsph7JFZSNQpcgjiQDFQ10YXnqvxzOOfGHaM6ZyjFvx7PnrpyN
	ebgKEzdDODjV8ALwJDQAj8J4+lPYL76R6Z1wIFotaNjrAiZ3ME/lK2O7mQHiIl8=
X-Gm-Gg: ASbGnctYjIQNpG7vnrjet/q07A5YFT3+0VKKdOz2OKl2qSF9dZhj2A8AVPvSszXmRnY
	5xEhi13Am35bOm6nZxrasUOe79bweyUvKfEQd9vpxfGqgp7Z7bMsv91hF2DpnhgURfG00LkI1oY
	m3KwXoZ08ucKSMF12vvKso5n7cAz0ABoP24MRY/Dcy670/AjZI00q6hPF9s4hyd8tNTwWsbZ499
	IOPMDVXOvp1zqXCp39GBlOonAwHxWvS46N0YOx4xX9uAD4/clduEB/IsPypfSTT5PnA3AlJR8rC
	+rQOwY79W9gQjCCif23BWbFUhGTl/cAdA+xGmOfQWNloLHMOnVBF5ElGBW9dnRHbBeQy5vg=
X-Google-Smtp-Source: AGHT+IHnKFv0qsVS5sklaHz1Yd7IBiDcXh/yMTaA/ZuLIr7eWFDaCoBMx4syf1mCNT3/xbSNPX0bQw==
X-Received: by 2002:a5d:6dab:0:b0:38d:c600:ad30 with SMTP id ffacd0b85a97d-38dc937461dmr3251623f8f.40.1738943806441;
        Fri, 07 Feb 2025 07:56:46 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc09fc2d9sm4197507f8f.6.2025.02.07.07.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:56:46 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 07 Feb 2025 15:56:43 +0000
Subject: [PATCH v4 1/4] arm64: dts: exynos: gs101: add SRAM node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-gs101-acpm-dt-v4-1-230ba8663a2d@linaro.org>
References: <20250207-gs101-acpm-dt-v4-0-230ba8663a2d@linaro.org>
In-Reply-To: <20250207-gs101-acpm-dt-v4-0-230ba8663a2d@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 peter.griffin@linaro.org, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738943805; l=979;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=gLGpUaEfuGzvyJ3L21mz+M8nf5rblyz9ev0wDFYPZyI=;
 b=W+YHCJGY2GIXCUKGut3Wfq+1GKcVPMtY2lKeBH1krh5h4o/lXoE38WAw1arV4/Dsph/OOfBF0
 hjqR38r5uj9A+fc2ySsi4yNFJXljZTKwquPyuW0/YhFHH+hN/sGvmuM
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

SRAM is used by the ACPM protocol to retrieve the ACPM channels
information, which includes the TX/RX rings among other channel
configuration data. Add the SRAM node.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index c5335dd59dfe..798ed7b4c4c6 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -269,6 +269,14 @@ bldr_log_hist_reserved: bldr-log-hist-reserved@fd900000 {
 		};
 	};
 
+	apm_sram: sram@2039000 {
+		compatible = "mmio-sram";
+		reg = <0x0 0x2039000 0x40000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x0 0x2039000 0x40000>;
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 		#address-cells = <1>;

-- 
2.48.1.502.g6dc24dfdaf-goog

