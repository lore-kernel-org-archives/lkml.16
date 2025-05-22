Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7761A3148
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 17:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747935670; cv=none; b=kzbxre/ipgetcuBOI4X/mk4ldOr0YkxNOZ6X3BWBkhtQArrbFrdwPrSQveZLZ/U4w17V36CcdZdxKlRPaYvhX4bSoN6eLGoqFHSLFrokgbBTug55Cn0SUNepidwcZkoP4f8/Yh/qtz6JKc7iIvxNm2kJY010QOwdvfMsxSJsu+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747935670; c=relaxed/simple;
	bh=//LaSD19rZpMslVCOgvu/2qzx/PSAgtZ8RYMihcSks4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fe+4SM0r8APOavzfeQoLanhEU00CnuzzyB7vIVr1AhQ1z5iymGLDuXHFa/1W/au9hwjK6uHFnvHY1EzNcQhjyjiNhdut/pGbXHbOQY98ew7PvqcRH24ewY6tYdInzi7rwGgQRE2mwXbvUPdaSUDwwC947oV5HMv+oHTwHb5zZMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ss0JgdDf; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ss0JgdDf"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a3798794d3so2898880f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 10:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747935663; x=1748540463; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0AREwvIMnafR9fBYm24HMP34qjXwZ6Z/MvmlQ3SqUVM=;
        b=Ss0JgdDfIoHyPdluIw3gpnveihujpL0Z50a/1A4RFHdgpGgB8/Pu438TBZK/OlrTfW
         gh+5njs6j6SYRZuiKEY+ll9XppqYii5ZEuxhQ5orYyKWegZiPCDp9WUoBazEHwkCU4Tn
         MZMl4Hd5E8vTPOeHaxOdXNszxaLjOHLaJVbYPCBV/Wmbd2/SNIvwuhYhrS2xQ22HTBMm
         k9k7fFgxVt60lqnmeFPzTy/XZusc0hqBsII38NmEMI3w7ODncYsRPoSPUt9ZQ6jXaOkq
         wbpRvy+f5GFDY5MSIukXBp+MvwbO8JRh//iqLYN163qk9rKoFRdZ9ShLICuEbP6skuMO
         pPXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747935663; x=1748540463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0AREwvIMnafR9fBYm24HMP34qjXwZ6Z/MvmlQ3SqUVM=;
        b=bo2YvVjsL2ofqETGi8u7CiUvacLObi/E7wg5R0/JmCyJyonQNqcRohm16rrS519fPf
         aoIooWzzTKaZtn8xJVcsUcVn81b29cSjLyaJQvONGXDHbxa7lfclGYu+lS2mgeAZiLIp
         6p8AKKl/M8ejj6K1EI7J9lHq4T6EVx+FK1nuppDNgKDwIbkTBxlI5mHeokS/IJzyED+E
         VkRxbvqXYPI8I5ZHaKEDF39CN7wHm23sVGZLgDloJSyVD3eJ+Zd5adLz/Yf7gQETLTPA
         L8LF72PMNu7YFD3XQAIM2VH0uzmi0t3GnIUo33iCC1+ducAgCbvAOSak3BxM/nHFsEfS
         XSjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXByHNuw7a9T0iP+9Iddc1hyC6opy+Bpd34PadMLYLwgGzoWXDTd0sOJwCMEK5kMfyBgOhrH72SKGhR5Xo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxW9ijnPlFkBqRU8lHR+wZNdHR79Y+4YZy7lZ3ONh7hyu7TpJaD
	LVnnxLqxISNnPl+LLgszm4FrEbf6XWTTmBvP75EQUZwFCT2RqJtol29eXIf7Z2+waxQ=
X-Gm-Gg: ASbGncsyKAZr3jMzL8uL7jhVQHAVXSptVbuVnY5qOyr9tHEY8864i3gbGG11u2ZZQGT
	Kl3XnjZ3lpgx7ie/q0RdRcXweyo0ep1W1VuhE05SRtl+cEtxgFAPVwPBsV5DkS1dvZ0EJxVNyW2
	f+r8eIMYlc7rA7ikXtuUNppTbc7AhJNQoR+56aeDwPhulHh1hqBV9MySZK2h+nOHGdipuMZDJpv
	qD0di9KQp8pM+a0H0EYbkCdlaH+K6z8yDXzojXm0g5g0zg1MAoirTJXclgA5uqdDazlSFmb5+sG
	uZqIBqqHutuLN8kzm5Ot1v9zfonf+sYQedc/CW9nPCqBbQlczGit+SOAaq9au5fGEExcfA==
X-Google-Smtp-Source: AGHT+IGKpp/jGjOIVUHY8XjuY48OF99YoOra8vEXZ4Ydaxkp7motsd9YRvQ4u8xDNDp2mm41mmFl5g==
X-Received: by 2002:a5d:5f56:0:b0:3a3:6282:693c with SMTP id ffacd0b85a97d-3a362826b2amr22786983f8f.42.1747935662835;
        Thu, 22 May 2025 10:41:02 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7213:c700:6c33:c245:91e5:a9f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f7bae847sm109563195e9.36.2025.05.22.10.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:41:02 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 22 May 2025 18:40:58 +0100
Subject: [PATCH v3 08/12] arm64: dts: qcom: sm4250: add description of
 soundwire and dmic pins
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-rb2_audio_v3-v3-8-9eeb08cab9dc@linaro.org>
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
In-Reply-To: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>, 
 linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2

Adds data and clock pins description (their active state) of
soundwire masters and onboard DMIC.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm4250.dtsi | 62 ++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm4250.dtsi b/arch/arm64/boot/dts/qcom/sm4250.dtsi
index cd8c8e59976e5dc4b48d0e14566cf142895711d5..723391ba9aa21d84ba2dda23932c20bd048fbe80 100644
--- a/arch/arm64/boot/dts/qcom/sm4250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm4250.dtsi
@@ -37,10 +37,36 @@ &cpu7 {
 	compatible = "qcom,kryo240";
 };
 
+&swr0 {
+	pinctrl-0 = <&lpass_tx_swr_active>;
+	pinctrl-names = "default";
+};
+
+&swr1 {
+	pinctrl-0 = <&lpass_rx_swr_active>;
+	pinctrl-names = "default";
+};
+
 &lpass_tlmm {
 	compatible = "qcom,sm4250-lpass-lpi-pinctrl";
 	gpio-ranges = <&lpass_tlmm 0 0 27>;
 
+	lpass_dmic01_active: lpass-dmic01-active-state {
+		clk-pins {
+			pins = "gpio6";
+			function = "dmic01_clk";
+			drive-strength = <8>;
+			output-high;
+		};
+
+		data-pins {
+			pins = "gpio7";
+			function = "dmic01_data";
+			drive-strength = <8>;
+			input-enable;
+		};
+	};
+
 	lpi_i2s2_active: lpi-i2s2-active-state {
 		sck-pins {
 			pins = "gpio10";
@@ -74,4 +100,40 @@ ext-mclk1-pins {
 			output-high;
 		};
 	};
+
+	lpass_tx_swr_active: lpass-tx-swr-active-state {
+		clk-pins {
+			pins = "gpio0";
+			function = "swr_tx_clk";
+			drive-strength = <10>;
+			slew-rate = <3>;
+			bias-disable;
+		};
+
+		data-pins {
+			pins = "gpio1", "gpio2";
+			function = "swr_tx_data";
+			drive-strength = <10>;
+			slew-rate = <3>;
+			bias-bus-hold;
+		};
+	};
+
+	lpass_rx_swr_active: lpass-rx-swr-active-state {
+		clk-pins {
+			pins = "gpio3";
+			function = "swr_rx_clk";
+			drive-strength = <10>;
+			slew-rate = <3>;
+			bias-disable;
+		};
+
+		data-pins {
+			pins = "gpio4", "gpio5";
+			function = "swr_rx_data";
+			drive-strength = <10>;
+			slew-rate = <3>;
+			bias-bus-hold;
+		};
+	};
 };

-- 
2.47.2

