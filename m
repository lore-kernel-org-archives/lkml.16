Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E58829B776
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843103; cv=none; b=A3sRzArssmMV3sVrs1uH371uYUrp+H/8a1Kx8oK3rvbVwiqVTNOFnIUEMQ63MRlJrwdiZ+bFDgZQeFb7TaWJHvq1VJitTh9x4IO3SxLdSm3469pyIHsrYw4+r9CHaVEQuE0HTThbXfR+YrJ1DXoOlg8Ka4yT7phPTXr/SssV/Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843103; c=relaxed/simple;
	bh=sSmNKlCCE/hYQS1Jt6CmnYrp1DfkuQdAFvrOaZ47sRM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IsfLohMhgPZmEA5igcjBebaI3rOOLlW+CiEHb24JrVfxynp7JeP/SI1C6x2PNhFxGS1mm4ocwf52qbYuqkBW91TtHD3V0WXbgcHgkSVTxt1LuSlumYGOmfPrO8RI7U6vJsb4I57ZUD7M1IsNpDS6h+/U7QuDZwTJ/efsthbvgF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=BhyqMgDr; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="BhyqMgDr"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-60867565fb5so2460941a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 02:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843098; x=1751447898; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TwBID1vXAAf3T3W0EWW5L2l4FPlZyUrP4RIEpnyDcSE=;
        b=BhyqMgDrb25kfEYbrTlforw2e8wQkPfSCGBUhthr3Ap0KLQvDHGsAGo2PLfudNqw1m
         ZYsp5/y9ztV5a0zmBRTPCMaMdphUvVOlcdMIzYREUSyM8P4gprrQ1etRmYsEq1yqvdML
         4CH0KPVhdgGR9EaRGxgXURK9cVNxa0TTK+jFUXPq7YITw2sygpLcNrGWMx09aJX8s1DI
         MfYZevV9nMOyijbtd9gl+Ppj+j/W4ybirIzsHdupcyX+f7CpO5TrJZxqb8uIMoeASxvA
         o0THv3iibcswFhfWLJX+wt+wR81FC9mLclumeDxYF4uk2fwHwrDoj/ClCEeEIr7ThxK+
         vxOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843098; x=1751447898;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TwBID1vXAAf3T3W0EWW5L2l4FPlZyUrP4RIEpnyDcSE=;
        b=rZjdYakG4FZqrbqsYe8OTgZ55w0RV4qrAX6p8J1bwJYm9YG7fPDP58ste+g2gmKNGS
         HBW1urzX4MjnNs39HYRKlIGYeyOYFBRSKn/MWphOEFpQiJM0GwISaXicvmmtPkb8mo01
         Uqo/HB5kNlGpIAbDAhMlR9U20UCmrscmIYsLliVQ4We0aJ+dXuUEDSixQJ4SztjGevpv
         06HfMWloLQkqrcA0a7M4wb+eg5wH+qtV0OTmFM1QE14C1jmPGMAUwASEVnWa4HcZ3KvF
         wv6Txj38CoeiylScfizjmaMCsX0h480C1hWsNRqsDyfrIZwie+FQMQSuUfPqSXcxadT8
         vfrA==
X-Forwarded-Encrypted: i=1; AJvYcCUTgEv5ITX31gdWv//tknR6Xv74FleLUI2hUChTK9SeLoam2vwe18RGy2V6E8hSPYwCxvjZj7zhqkkQLSc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/6y7muKWoohwyflFy6oX05B7dhmkvjNdffTjGSdmr2GEecT58
	o9TonP0OWW/hIeB8hfktgKvnuOjTHLPG+gPZKhghKbsa5XrRE0fxIW93zcKs7oj6QD0=
X-Gm-Gg: ASbGncu8abzZGoantrTlKwVOeOvIRLlMMwKklB4eC4+xkfW6mlJP/Dl3USjqc0mog8K
	yGS5Kmo1fkEo9sZHhxCN0xTiNLWZpON2AwYaY9ZbwCSRLilb13vK0LyVejRbqDLqelikvvGEkBG
	KVfe96yoz8MAECmyGxHMVwDKa8X6xWQa0uwCtLaP/W/WuM0kUXjgMHLKM5VXRuaZ/8FRVquUOA8
	wID3XORUXFevbMupdFg7Q8aw9m4Uy486VJ4tlofM81jFH6vRKh1Z1UTEnD9HHoV91RkTSlAUIuv
	arrHwzOGq+MPPDKGey1AtZ0/J3Eh/x7oaTK6gC2ehj7sPXNYpIgmkwMyoUWPPHRwXYIW/d7YI94
	Y1cWvMllokFVSt0mQE9fEjEIEQ38d7VSP
X-Google-Smtp-Source: AGHT+IGXwkSlAKfNfKxCHo2TaSnK4jfPfpaJp+4WHyqX+8p7y3/Ix0pLmryFCKMcp13ni53P6h1WDA==
X-Received: by 2002:a17:906:7956:b0:ac3:3e40:e183 with SMTP id a640c23a62f3a-ae0bebe96dbmr228885766b.3.1750843098321;
        Wed, 25 Jun 2025 02:18:18 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054209c85sm1009952366b.160.2025.06.25.02.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:18:18 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:18:04 +0200
Subject: [PATCH 3/4] pinctrl: qcom: spmi: Add PMIV0104
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-pmiv0104-v1-3-68d287c4b630@fairphone.com>
References: <20250625-sm7635-pmiv0104-v1-0-68d287c4b630@fairphone.com>
In-Reply-To: <20250625-sm7635-pmiv0104-v1-0-68d287c4b630@fairphone.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843094; l=1029;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=sSmNKlCCE/hYQS1Jt6CmnYrp1DfkuQdAFvrOaZ47sRM=;
 b=Wtzgl8AnylHE/Muz8JMpkBz/7QkNO1Nv4Q+it2k8m7CLdbsR8TK5aaFR+PNYbiVtqFwEyV+Rc
 tDIWDZ0Wk59Bn4ywu31W34TFp4IabNCSPn3e1d2Cucs3b4xsLJNi5dg
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

PMIV0104 is a PMIC, featuring 10 GPIOs. Describe it.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index bc082bfb52ef480941e1804f1142496e1db6413a..40de5554c771d0c034a458fb4d5e8876473b391c 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1244,6 +1244,7 @@ static const struct of_device_id pmic_gpio_of_match[] = {
 	{ .compatible = "qcom,pmi8994-gpio", .data = (void *) 10 },
 	{ .compatible = "qcom,pmi8998-gpio", .data = (void *) 14 },
 	{ .compatible = "qcom,pmih0108-gpio", .data = (void *) 18 },
+	{ .compatible = "qcom,pmiv0104-gpio", .data = (void *) 10 },
 	{ .compatible = "qcom,pmk8350-gpio", .data = (void *) 4 },
 	{ .compatible = "qcom,pmk8550-gpio", .data = (void *) 6 },
 	{ .compatible = "qcom,pmm8155au-gpio", .data = (void *) 10 },

-- 
2.50.0

