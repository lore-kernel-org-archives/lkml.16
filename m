Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE523158218
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 15:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749222195; cv=none; b=BiWRFeVc0A3B5fbYufbi3Cgr3qp3AlYWHQBlQ6ECTfVN5vqWGkMzUyFt2+JlyUrl3h4vHjF0hHUpahMOl9kSVVm2SvRknP98mj614igGYU9aLW6qPPocXG97FmeMgQl+mmTk1cwza1oIfe9Xtnh2eZrECyFWzTE1X9Q3fSWx1so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749222195; c=relaxed/simple;
	bh=7zSaIBi9uiibHWNuWKSeAbF5KYAWL6vX77slfEv5hbA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V17tB0f4ebTEks5atPaxQ9ViGHu3tX5Wjv2sWoVmEQnpZprui1oQF6ZdRqizsmJO1Wt+a1TVGJFXRzdHWBkYmisSXPblwM6WI+PTRfIGkEmOQ41bKArKHEmZxsyKpJ6/BtJJGg1lixRc363L1YxDIwy80ZR/iXV7D+COs7VI8ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XEyjJYcC; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XEyjJYcC"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ad891bb0957so354238266b.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 08:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749222192; x=1749826992; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RCcZVL4U6ihTDzJ3VSPWudzlRqrxb23wPEKhLKoBA2s=;
        b=XEyjJYcCTUYSK6t2VRjMkTZj4v/Fg387qtOZ1N0NIpeHij3ULMSdoqfDpS/OxhfY5X
         crpQrHELA/1N0LZNfPkutklv1QgDvl9qVKupzTTbqV3qppWeWlvMlgnpVGbUvsh/r0Z6
         9FxjgyyAvdgWIHZ8nZWUVP4HhS2aGiCYUJopyRuSbtW2AL/Sueat+vEkJMQJUj1pYGs7
         +KT9zkK9pbIYa2oRgC/fcoaX3ty1JClXJPbGCZ658+dFz0xl+1+3RRgZ5eCkfpVu6NW+
         0WgUcOqLL+sPdZppvBCyH0PQUQOmsMrhy6vQUXcALK+BLb7JpKRCuhFD//QaaRCBX2fY
         di1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749222192; x=1749826992;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RCcZVL4U6ihTDzJ3VSPWudzlRqrxb23wPEKhLKoBA2s=;
        b=Q2p9A0m9pzyM654c0EAJdzkaoDFPe0DejFnqohfkT8ktVCkOIpY/ALKnwtvAKdc9uR
         PmQTqDUW5R6+UcNrD/cQs7nBuyLCoi/yk4hBytPtwOjjNz8B5zQsuCY2yW9hAPl/PkaX
         jD88l+5uZ+JOzuBn1CEUzLolW2zD0ZYU1aeJxtaTSQ9EFZpy4R2GovxdI38NKJPsvtqV
         oD/wEBp2AdFzBWZfzahMSsdYnnVReR908yhaaQ4g6eKnsmEA3oyUvql9qa9mscEX4J6o
         0x8eQoigZIb0DDYlGugF17QwazDETr907skg2q4umfqDslIaQt49emD+pEg99sJ9tGlp
         bSug==
X-Forwarded-Encrypted: i=1; AJvYcCW1g0N2GPcKtTCMYITTrS7Dh7y/+XiF8MuBL1FQcEQGEiz/5iui2ibDHlxziSLukBDts1IaHjcohQx6+m0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPM34NU1NsghRxBc3ljNvP59kj7cG9ro3L4bL5JdIYvEsiFME/
	AxSwQ4cJ9HDVA3782iqstY5NhLW3uKdrSvNtwOBHNkoKWB2G6c9w3k4P0SEQY2e9eBM=
X-Gm-Gg: ASbGncvTRU1mOWvb43kF64P5BhLGwf/Wtm2IERZZbEAomUc/r8+qPtFSuBjt0KeLY3e
	1BrE+EfkqzokT5teNch5tZowbO1uLWath1NHC+U2SJeb9Kabx6WNHe9wx/bRYZPLmHucAKcBVtv
	IhZ+oKRDyN5ZlxIE9UpbseqX8pUpTZEMfOCqvNL76ScXIQdE6KQScoWFK+sPxgWsIcacDfFA0G6
	+n23ecc7+SqgKoD+FQQkBUojGPcSWKwxAMsrGQ232ORNN8A9JZaKQsD42SLpJA3UrcQMQacvH2e
	13I5j9bPTvI/IUuczS93GxzNXZEBX0qQ7tUx4BR0Qhzby26lOr6TfdkfCEwOEYLfzAs22rSpBkZ
	NOpE7FW400GUKWBlh8BSwEcRZdHFTeXPI6FOk/wdz1mhhrQ==
X-Google-Smtp-Source: AGHT+IF9JL8hjME8iUOhCNN7DFMjh4zd0yx4XgWB3wO5GrjhD+ZZ+DAVbctjpCTTiSCGzDKTRCksCg==
X-Received: by 2002:a17:906:c113:b0:ad8:8364:d4ab with SMTP id a640c23a62f3a-ade1aaf4eb4mr352597966b.49.1749222192110;
        Fri, 06 Jun 2025 08:03:12 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc38cf2sm127735066b.121.2025.06.06.08.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 08:03:11 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 06 Jun 2025 16:02:57 +0100
Subject: [PATCH v2 01/17] dt-bindings: firmware: google,gs101-acpm-ipc:
 convert regulators to lowercase
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250606-s2mpg1x-regulators-v2-1-b03feffd2621@linaro.org>
References: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
In-Reply-To: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Using lowercase for the buck and ldo nodenames is preferred, as
evidenced e.g. in [1].

Convert the example here to lowercase before we add any bindings
describing the s2mpg1x regulators that will enforce the spelling.

Link: https://lore.kernel.org/all/20250223-mysterious-infrared-civet-e5bcbf@krzk-bin/ [1]
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
index 9785aac3b5f34955bbfe2718eec48581d050954f..62a3a7dac5bd250a7f216c72f3315cd9632d93e1 100644
--- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -64,7 +64,7 @@ examples:
             interrupts-extended = <&gpa0 6 IRQ_TYPE_LEVEL_LOW>;
 
             regulators {
-                LDO1 {
+                ldo1m {
                     regulator-name = "vdd_ldo1";
                     regulator-min-microvolt = <700000>;
                     regulator-max-microvolt = <1300000>;
@@ -73,7 +73,7 @@ examples:
 
                 // ...
 
-                BUCK1 {
+                buck8m {
                     regulator-name = "vdd_mif";
                     regulator-min-microvolt = <450000>;
                     regulator-max-microvolt = <1300000>;

-- 
2.50.0.rc0.604.gd4ff7b7c86-goog

