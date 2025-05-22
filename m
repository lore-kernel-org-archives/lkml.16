Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A80119D8A8
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 17:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747935658; cv=none; b=PTjRqqESijsxVelAkmWTqyPQMBY7+PMprsIa+KvFq9s5Jg8rUVlX4ZtiqATztz5p41dSVtKTTrWS2JjbQ7QyHth3bilKdAzjLMPFL8K18Zj9T2fWWQtygcPMiE0VY0tMAX8HElfcmOwCYjC/usTKvIMeS3R5DdtOZUnltr21Vwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747935658; c=relaxed/simple;
	bh=Gx8rat0F5gGYg4tYeBd9EDyzRXpBbhu3rhNTcZhiZH0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OFItlZKXh5gggyqlDopVBTSe4GOI3bdX17ul4svRYs5ZIPjpA8M6ObKTkVpwq4aITt566YEdHyYfvfGQ+uZGF8jBrH2G4ACGZXBdZOJKlWzqqKSd2/igEa0yEvtJrjRxfI7hbR409NrhRcT+NSsZs2dY8QB/7vmty4L7oS0tuC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rOe4Hinx; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rOe4Hinx"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-442e9c00bf4so61597445e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 10:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747935654; x=1748540454; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7NPUIJScbl2wo5u3vE+t7s0/ylzAg/M0wI+ubRZFTc8=;
        b=rOe4HinxoTlFgGf5eDTyYcj/Zuzhla5daG70e3i2i+QZ0KOUt65ainVzvnAEyAr57l
         /CO8JRKS7MBZwQARq4iT3IySEJ1ZqyLq/xGhAm6HPTKjx/u2ZpuXVMb6vVNQ13M1dnDi
         Cowk2iTizfOC7e7UVGXvxj764kH0wqvXNLLarjzsnZOr/RX5uDkhA26VYCM/DgVo9X+8
         LspNm4zF2mS4kd1li+F545nX9ZUBvCoacCxcPWxYH1gtdFv9yCQc0s6ZwYolHCZsK9b8
         A7M+uZqTpmBfggPXXDRa7hRKhjEvTUwDq33clwvWIXiVyNpmRnF5pqjIwqgNLPR1ZR9m
         HkNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747935654; x=1748540454;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7NPUIJScbl2wo5u3vE+t7s0/ylzAg/M0wI+ubRZFTc8=;
        b=e+AisF3O6ZOK/4X1UdIQ1cpgEwjpwcgYsAeXQPY063EmBUmx7+fB4iqjdOYO4NVkmu
         lBee/Dh8WjV3NcFHcYcieWhHMfNsvhOfl94ObDuoQcupZ4JlBKDcMlfvYQAmSfnSFsAb
         2KIpLh238Gia3hZQoIJmLzhU6iZmzGt/rnYreuyh0AKmd1aEv70qEFoPH40/9En7MYXG
         sTEwZ7tqd2mc+mrT8X5WZ6+NU7f2tEGivpUD+OjyEKsNO/hIMqavvKtjpm/s0tvgDQcr
         4Ogd5RWufDbRlIZSlmIDitWOyYucgorgND65Lpc4BI4gme+trp2EeUSkrbrJvddwBLfo
         lqKA==
X-Forwarded-Encrypted: i=1; AJvYcCXtnamJRGhq0wtvnMQqSskG2wXVFGcGMFzulEmasp07wED3tHNHAxqpnIK2GmGzwQIVlf+B+uB1kYFZmKs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzN4jDykCGmhMM6xamGEtfBvoOHOX8taDtutLyzw8hq7JUG89wk
	cldlXm+E1C6HnIDXPoM9ojpg3d8RvO7LZz2O/Xpru2yp0eVcyLRKuYXYIZRu0e5ww5A=
X-Gm-Gg: ASbGncuGdgLd2vqxh16wvh0QobF7vNMl7Bwzj5HysKFzwp50fUMDrE3rNASzbuSUY+t
	l0MCoSe4ctjE5J2BXwnppL6lBpWRfxLJJ4iFgHljmD3nx1vMg9lNv38x/ST+6xILeemmJJPv3il
	m3Bci3/ykwnXrv/0rTdkckzQ3b3yZrSPf/g1u/lTAq/mQCuKck575GPDWyHBpix8oqeZuJ5Pwz+
	E2p+dlwZgXKrUhgtNLA9Z24lx895F0srRmsk7zOoPFvYwguxk/ylue4k4H4nT4DLS3WS0D4mlTG
	Myjf+32lYGMQ4MGJrRKiLjJ+/ylw/P6jv7yr0i6LODzp0zk08VSujl3ik5M=
X-Google-Smtp-Source: AGHT+IGGhVpRpV0KK+9csxjRQAa7427Mshc5zMSpLcRZ9lrj8a5WqdPgOzbFmkpOpGEFcPdmgHYleQ==
X-Received: by 2002:a05:600c:c8c:b0:442:f4a3:b5ec with SMTP id 5b1f17b1804b1-442fefd5f8dmr271581325e9.4.1747935654432;
        Thu, 22 May 2025 10:40:54 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7213:c700:6c33:c245:91e5:a9f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f7bae847sm109563195e9.36.2025.05.22.10.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:40:53 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v3 00/12] qrb4210-rb2: add wsa audio playback and capture
 support
Date: Thu, 22 May 2025 18:40:50 +0100
Message-Id: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKJhL2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUyMj3aIko/jE0pTM/PgyY920tERDo5TkZDNDEwsloJaCotS0zAqwcdG
 xtbUAU/wbnV4AAAA=
X-Change-ID: 20250522-rb2_audio_v3-ffa12dcc6148
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
 Srinivas Kandagatla <srini@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2

Rebased, updated, re-tested. This implements the playback support via the
following path: RX1 from DSP is connected to rxmacro which communicates
with wcd codec using soundwire. This goes into AUX input of wcd. Wcd codec
outputs analog audio into wsa8815 amplifier. Capturing works through vamacro
using one onboard DMIC which is directly connected to vamacro codec.

Changes since v2:
-- dropped [PATCH v2 08/14] dt-bindings: arm: qcom-soc: extend pattern matching
to support qcom,wsa881x and replaced with new one;
-- dropped [PATCH v2 14/14] ASoC: qcom: sm8250: force single channel via RX_1 output for qrb4210
-- reordered as suggested by Krzysztof;
-- updates to wsa881x-common.h registers descriptions and corresponding updates
to wsa881x-common.c (Konrad);
-- sorted subnodes in DT alphabetically as suggested by Konrad;
-- wsa881x bindings updates (as suggested by Krzysztof);
-- ASoC: dt-bindings: qcom: Add SM6115 LPASS rxmacro and vamacro codecs
is still present;
-- added "qcom,wsa8810" compatible to wsa881x-i2c.c;
-- wsa881x is still present in wsa881x_probe_common();

Second version:
https://lore.kernel.org/linux-arm-msm/20241212004727.2903846-1-alexey.klimov@linaro.org/

First version:
https://lore.kernel.org/linux-sound/20241101053154.497550-1-alexey.klimov@linaro.org/

---
Alexey Klimov (12):
      ASoC: dt-bindings: qcom: Add SM6115 LPASS rxmacro and vamacro codecs
      dt-bindings: arm: qcom-soc: ignore "wsa" from being selected as SoC component
      ASoC: dt-bindings: qcom,wsa881x: extend description to analog mode
      ASoC: codecs: lpass-rx-macro: add sm6115 compatible
      ASoC: codecs: wsa881x: split into common and soundwire drivers
      ASoC: codecs: add wsa881x-i2c amplifier codec driver
      arm64: dts: qcom: sm6115: add LPASS devices
      arm64: dts: qcom: sm4250: add description of soundwire and dmic pins
      arm64: dts: qcom: qrb4210-rb2: add wcd937x codec support
      arm64: dts: qcom: qrb4210-rb2: enable wsa881x amplifier
      arm64: dts: qcom: qrb4210-rb2: add WSA audio playback support
      arm64: dts: qcom: qrb4210-rb2: add VA capture support

 .../devicetree/bindings/arm/qcom-soc.yaml          |    2 +-
 .../bindings/sound/qcom,lpass-rx-macro.yaml        |   19 +
 .../bindings/sound/qcom,lpass-va-macro.yaml        |   22 +-
 .../devicetree/bindings/sound/qcom,wsa881x.yaml    |   66 +-
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts           |  113 ++
 arch/arm64/boot/dts/qcom/sm4250.dtsi               |   62 +
 arch/arm64/boot/dts/qcom/sm6115.dtsi               |  132 ++
 sound/soc/codecs/Kconfig                           |   15 +
 sound/soc/codecs/Makefile                          |    4 +
 sound/soc/codecs/lpass-rx-macro.c                  |    4 +-
 sound/soc/codecs/wsa881x-common.c                  |  193 +++
 sound/soc/codecs/wsa881x-common.h                  |  478 +++++++
 sound/soc/codecs/wsa881x-i2c.c                     | 1353 ++++++++++++++++++++
 sound/soc/codecs/wsa881x.c                         |  493 +------
 14 files changed, 2459 insertions(+), 497 deletions(-)
---
base-commit: 7bac2c97af4078d7a627500c9bcdd5b033f97718
change-id: 20250522-rb2_audio_v3-ffa12dcc6148

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

