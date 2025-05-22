Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7251A3156
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 17:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747935663; cv=none; b=Jk95nOk3F+TOzGoAQZMHZHS9xj3CVQRf16FVumbQUU+x6vWPfE45IwxRFXPDNxiaNXqy7rDZ3L0nha8orrht16WAntEEa/y+ahAtX6mkXhluFxyt8BmjaH6MIIim9TpojP4eJRB3ZGgqzArUabLQTuEFAdk8dHAsTGdiaK4lQAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747935663; c=relaxed/simple;
	bh=aSSdjHrrQmluhjdKxBq1rycaxTM3YZu9EjkuFLbPokc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UQuOrO2/t6hUzbNzyiE/A+0ju8b+jbS/Ul1kmXXiCDfj49bpbQOkobNctvr0MyZcxv58Db/NZJ2AUE+L06TLZctvLtPUP3OhNDiP48WcZ6pYidmKiCwRj4rvVQkxqrNi6CWWdz04Y+t/7Lq+fUqWS/Judg44XvqleJjwCQLKeZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RrAwFJTM; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RrAwFJTM"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43edb40f357so70011495e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 10:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747935658; x=1748540458; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rug7xCiRe21CglTuJ62KRbiGHO52dyiYXtq9MKbjX2U=;
        b=RrAwFJTMQLocOma6E9sQmzbbIAxNgpCghY4qbNMVZz9kuabuOKd/c90NApiTYIArgx
         +kr01kzZMFtydwrFVsn9gdp037xDLrJ++0CA+rX10bHRpPPkcf+sBH+fRQr+axOSWOra
         S4BP/ydc94WSRqVXtjPtFlWY7f11EN1y2Ot3Ifehl0vD+qkj+3jwXj7j8BxqEPhfgi6S
         gM14EDdgb8pvwYEYsNciqtcIwvKuRpL2KWuxYP7JgQ3pOKTFCsuHtxY/NuxJKtlaYy+C
         /s89KhRxFu2HvtAperhHs38z/AuJ4qp/KgzgJ8V78102pCSCmMOBnu6NL6mc+skprQfV
         kxQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747935658; x=1748540458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rug7xCiRe21CglTuJ62KRbiGHO52dyiYXtq9MKbjX2U=;
        b=phUZv9doY0GOCLZSdtJbti7ju6qJ7oY5G3sLri1ll74ydx9zcSaRBPTm2Cp4gIQyGu
         tBhI94Jk4AuknoaVNn6GMqodnVb9qpwzZs56RMSsUH+stIGJsdDPaBGqtsuPBRhjPMqA
         DcBPAL3NvaAL56/BJO4APhH1LFcAVeAoIsbUvBGHmoS+1ltImkyoFv7Y6DONRr6300Vp
         FW+jk1IN8UFOaliCA/2d2BaOAjtl5FX5N4DTqs0XbWqtVUQ5zMSid6OOLF3gIxKzK35O
         AJ+j5vTRZceSXWJUW9mr42scXZjh8w1+3b/txYZgYqxtlqWFgTE0YmkblQn7AXTPTU80
         xdyw==
X-Forwarded-Encrypted: i=1; AJvYcCWg0KbFaBi/Bdf3/wbBqe4Yi2cfe7yUPvswgIFQ/xm4FCnjWztbFaihLfzW0ABU99Zd9/8LvwA17xaxqnk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/MjbQFOWEfMFjZAwZm5Bvu1ZEAbj2BkoyZGMYd64k8nGnql20
	OvVnx7+SOM8VfMg0P+HglDPfOV4EWZF8Zw58tk3eFAeihNelDq/u5yZEpQNOwjP1VdQ=
X-Gm-Gg: ASbGncuyaRa6K/1EzcnmJY2FQqP1zs3IJH6noXy1DgZooMQeawZH80RDJhfqvqkEQyx
	q7OqAffa290I1FERVWBjjTfBsJRvYFEkMdm7Bpo8RN99Qfsbd04GMromPg82O5dQ22wL/H65hui
	Q5/0846HHko0jrZPkUrocl2zrfoXaE6cr/zbWXr4L6SX77uA6EkB4HakuzWreJDYtji7u0Kkm4l
	HJi1pc7yk0beJTkXkeeBqehbGfS2N+3PtCrtqKZvNHVvcIJsTOJaeJ8GHYzyf/ax60TxNB8EW6/
	ea4/deFUsR6B/sxWCkLVgcXdvyOQ3jjl5DrTlzkNHrp0OT4S7U9isvrwupI=
X-Google-Smtp-Source: AGHT+IEQ6/iKMVU24aJMoLqOXxLbhZL7C0KXFrDMArF8ok4GGZf8FXJBiXkIhzqyqj4QCOms+GXpzA==
X-Received: by 2002:a05:600c:5305:b0:43c:fceb:91a with SMTP id 5b1f17b1804b1-442fd62733amr247120525e9.11.1747935658292;
        Thu, 22 May 2025 10:40:58 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7213:c700:6c33:c245:91e5:a9f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f7bae847sm109563195e9.36.2025.05.22.10.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:40:57 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 22 May 2025 18:40:54 +0100
Subject: [PATCH v3 04/12] ASoC: codecs: lpass-rx-macro: add sm6115
 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-rb2_audio_v3-v3-4-9eeb08cab9dc@linaro.org>
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

Add rxmacro compatible for sm6115.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 sound/soc/codecs/lpass-rx-macro.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 45a6b83808b277344f17d35a70cd1e3bb89cbaea..3ce7ad758df9fb0b7845a1dfef46cdf0ecf3b8c8 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -3946,7 +3946,9 @@ static const struct of_device_id rx_macro_dt_match[] = {
 	{
 		.compatible = "qcom,sc7280-lpass-rx-macro",
 		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
-
+	}, {
+		.compatible = "qcom,sm6115-lpass-rx-macro",
+		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
 	}, {
 		.compatible = "qcom,sm8250-lpass-rx-macro",
 		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,

-- 
2.47.2

