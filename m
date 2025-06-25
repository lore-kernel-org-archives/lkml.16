Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC45287264
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 23:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750895444; cv=none; b=Exnrhr7OCOSntzdMmnE7owdqghTFJVT6hcEyPlz5ZzxZCQHh4RNM2kuLjxZebPc2Cg8l9zBnwFd+a+dJslOB5OFSDbumaTasxjMz5W8qZUFct1+yE0cyxaks9MhgaE28Q4afip6JGVoYfGGjR4YMXrTv/9abhRBHz25YaGwrPcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750895444; c=relaxed/simple;
	bh=ubcyYSt1tGOBrsYT11xCoGtfsmnsJRE0OnGIA+lpDno=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V4JjxY8i0f4++rCouaymzmkNTz6G+TELuDYifx+a7GaAdsM+R+xaQEY6HZgZ+OUS72vm9s5fNrK4h9SjOZj17+Yd8Au782lk0uzqiLm6WB0agjp1rYmUlisHKIL3XgozjRJl3mI6YH3zYCtEOEU2EqdTdBqnbqdT/qDJmaEwNHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VMzuWt/p; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VMzuWt/p"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a6cdc27438so312550f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 16:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750895441; x=1751500241; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2dzqcetow2B51APDrHAsItbs32I0mVc5EzPsX40H1m0=;
        b=VMzuWt/phLbi1Jl7YV1/tF53EnMnr3Y5sKQn+G4pS3PUpMLflNrIDp6+xRMiZd0bQx
         Zc3UVF64twGTzOQ7hvYGwbPNVUHnzTjmKQrsbLg9bPPVzkpjLdjOhyZ/EvCUK3uj1bS4
         4eVJJfZz+T+kMx0bxgIubN1V3IfVacJhmGL45GlW2wylCv0CUkTQh5+mWHwl82oO3Z33
         ahpFuCs0JMhMkWz5ws46x5c0K1JJACmim9VFBtLOslFG63DWnD4LBa8H0kIr4Dy614oI
         sGdtOu90a97B9qAtxdOZ/z7WJ9aWefy9LyP0YtNsVrsokgxm1xr0+NPB8fpuJVxupU8K
         tguQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750895441; x=1751500241;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2dzqcetow2B51APDrHAsItbs32I0mVc5EzPsX40H1m0=;
        b=spobKDG6HeSTSbqqIz1/XKtgVJeGJusL3CIjxTBNhVAlP1P7JiPAoq7uFCiuhZN191
         pREG43HRjJbZjVKq3SHfnCvMX8DHcNHaAIByconQWuFcrISBgnQCOix2CJeYuzmdOMc0
         D9tJqdA4lmwDRryj2MmW4n+G4GihrKFLAnL72JgQxGYpQUymn1i6ePu9KtuRRl0CsoyJ
         fnKxj80E4ME6XuDTH4LtXfexq/ZwiGpOLE5DSCYlFfqKE1USsS3JicdYDUfI0GzPBsyh
         dxITLDPlzpOsRR/ugd5PY8HZLzlF++tAB6bsTlS48u2LQXXhTX6wEUBATtEPTw46qLY7
         WaJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMjZoxVaIfcttF6qN0hSbpZbgtCr2i2gdir5lbKlKMxn0w/TyPgyqDPJdQBMCzKLEwcXUOdnEmChP3ySo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk/PIhZjJ63mk9Wf6UAWY16bvEgZxA28+n3Mw7Tc4XfDK3Didt
	o5pyRlf17ZTfcCA7sE5+4u2ToSTV7qyrvplLA0XXeKusTh3RwKymqgZ6T4k4Y/Jnit8=
X-Gm-Gg: ASbGncvgu5upqFacIdrBmew/VOrTTMpfESDW3hA7lSnbtZlx2W+5EjNAlHzwgYwJnAc
	WPsMe6Syt9dsaBx/5/3DICdRcpl9ukvDXBrcayxlfnOw/rfHOcVNmzm3JG1NaOZN31cnDk7jr4T
	9kg1PbOqMHUZlF3HchD8F50vH3N9W+yI329o/ZoY4T786pacLx0WpHdtgwxNnNvDq0fPO46C2Yx
	RsU3onJKeHzTbQVthjbaV5LjYrFhRn93wJNyhnX5RdLdRXaJSj7/dI6DKaYwNjpYN6b0lxZoYUu
	RdzdYRY+HHx3FjrLM/ii/sAK+mux2UilLhKlGRmFHvq+VrRsrLI0VQ1PLW5qBcErho+EjRhDObb
	dx4th
X-Google-Smtp-Source: AGHT+IGmAy9KxHvtShO+4udgRgvhXO8cmz7qTC2X55qjEkrvqF77KTVDg46g3zJQDvJYoEntF9fcXQ==
X-Received: by 2002:a5d:4b10:0:b0:3a4:d6ed:8e00 with SMTP id ffacd0b85a97d-3a6ed64251fmr3626972f8f.33.1750895441200;
        Wed, 25 Jun 2025 16:50:41 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7213:c700:1417:1313:3884:915e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e805dc32sm5636300f8f.29.2025.06.25.16.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 16:50:40 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 26 Jun 2025 00:50:30 +0100
Subject: [PATCH 2/3] dt-bindings: mfd: qcom,spmi-pmic: add pm4125 audio
 codec
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250626-pm4125_audio_codec_v1-v1-2-e52933c429a0@linaro.org>
References: <20250626-pm4125_audio_codec_v1-v1-0-e52933c429a0@linaro.org>
In-Reply-To: <20250626-pm4125_audio_codec_v1-v1-0-e52933c429a0@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.2

PM4125 has audio codec hardware block. Add pattern for respecive node
so the devicetree for those blocks can be validated properly.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 078a6886f8b1e9ceb2187e988ce7c9514ff6dc2c..5718cfe7f4c2b696ee2700fafe8dc071c70a6476 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -137,7 +137,9 @@ patternProperties:
 
   "^audio-codec@[0-9a-f]+$":
     type: object
-    $ref: /schemas/sound/qcom,pm8916-wcd-analog-codec.yaml#
+    oneOf:
+      - $ref: /schemas/sound/qcom,pm8916-wcd-analog-codec.yaml#
+      - $ref: /schemas/sound/qcom,pm4125-codec.yaml#
 
   "^battery@[0-9a-f]+$":
     type: object

-- 
2.47.2

