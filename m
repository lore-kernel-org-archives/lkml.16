Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F355E28C5AA
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 08:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749025154; cv=none; b=NNHTep54dt9A+QA76RPq3gWlxlO/S2KPEHI4AmvmVqvTJonwuwomifm/ksmGi2DORIrzY7Bt+A/8c/ue0o/rxWUZqO/AyEf5r2p0ZbRGHgLWunjoM+VYqGZDSQULygdGrXclXTOeHQz/5UB/7aNKI0rzFl0I/Qv/DFmHDurwAcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749025154; c=relaxed/simple;
	bh=c3ZhkkgovKXxuwS4xu4/Ddch1klTKWepTgclJipCla0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nNYzkN8OfrAjCKZIhHTGBsTvhUkKF+P6pTpNzM5rq244egIAZr86qF6a2YoLmTl8TxgT1Vh07ePmGlpynmE8Ns/S9qoxppSW3hGKLRth81Psmf0gUcFrRljtm8Dand9J042Xk5vzLr6HCb5Gw7EQhpPtNkP8ZSv47y/YT5VLRlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DHOEjb37; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DHOEjb37"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a51043228eso334570f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 01:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749025150; x=1749629950; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zbantlUERPSuY7CGMj3C60FaJaeXJoquFE5NLQDxQ7s=;
        b=DHOEjb37epul/g/03sqeJ8KOoZmYZnbOu7NF+ha2ZbLg/LDyu+4mnAnAu7hhPboneZ
         jHqfYLRYLnoz8TCe+8w3wStz4kg9KBFpVYt9sCF+U60sDPYyM9g8gF6rZHQRkem2xQTh
         dHfTFY146F+1o1+oi6a6FyGITJVlZnxsVyQFXDEuOTMrYdU8CRGZgR9g0KQc0lalGDS1
         cVEQzhY6UuXSrGiiEFtIjaWz2hR5IMd0PT4vEOSS/a/p12JCDS1MSkF3vVynRnP4u+Dg
         Wy+0GFF05/thPGlCmiP4s/4HKsSo66QpfGELufibrPtJ1E2qlCtFZBGeMghluyl+dznE
         bEkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749025150; x=1749629950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zbantlUERPSuY7CGMj3C60FaJaeXJoquFE5NLQDxQ7s=;
        b=eBSQiHcq0WxqbreWb82T/HPspQJ4AGs8N7YlCgpuwv9Dz5JCxgjffr/ljh6pZ1jTXc
         P9aoL4tAyJFAgX3h/v24YtbXYaJ5+1nxX0foxo3CoGrLKvf0+4IQkwcHZCaEyQewEdLW
         IEe3R45L8PwIqRr39dxJknmTqdhpUNhdRMIvylQWGEvybEtnAVikvx7vYgrZD2Ev2v7j
         eHT66en5qPWcr/0oEHyVa6w4/EqU3AqBUbnOnPeiv8/UEhU5uZk2D0roYVwf1FoEG0hx
         jaKdkzHKYXc3OfZZ5utNKj+YxT0+t1IVIG6Xx6NTspciQojdaReWXlfGPwHasny66tVe
         lGzw==
X-Forwarded-Encrypted: i=1; AJvYcCWyaaIlXOnv1GHlKwN+uFNPleufU6RrITiKFR0Wz1+WwJwmDpZDVK+sKvizmEPqdYRCD95Vmn49hdhITQE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGsg4itwdy4yayL4M2D3RHAkaxvCqdtT5VM4zKaw6TGQerh9cJ
	TaAqcTTuMriXyRM5KhsOwdwdCj+ciLeWfgFfleVUdVNMLM3e+YI9Mf+MQzPehjReubI=
X-Gm-Gg: ASbGnctqOyfk7V1UmQiPo7Yl5alyvNunVJAWzbBrUnwAsw2OWN4jRSlpPxby7CqF/xS
	jfd+ivjAit3gpXBOf8mttyxxGM7Q7V2lWHKXlJlJucV+mtjBlDlc07efpa2g4hbbUGd8uT/Ui79
	UiHgM/TpTVqviTZ0zGdYdnMLFKxKsrtx2nfmZK5JfWPT3yjZAg5m8/SzmMYe3PMPGsAY3wS++eJ
	+ebv5VJZLEz7qbQZLzNIiXGIbpqZh9inEYIepNzdYml45IqxBvX2iYYbM4lafRP68kKRIp1t4ac
	tBdaw1P7BXTHoGSVHIP0fZklS7jzVoKqQzY6PKLI0B+nc69741IiHRtuhtO1pJZ7fO+ZetkaeW0
	UqHSlCA/a/zzCbjJRWt8jeA==
X-Google-Smtp-Source: AGHT+IEMnMgPmMwhkgUv59GGxhpUw6FqG/2zeQOKCFcAARbwyxtAv4UBiJATzShvTS7Iehn9wMKRrg==
X-Received: by 2002:a05:600c:3510:b0:441:c5ee:cdb4 with SMTP id 5b1f17b1804b1-451f0b188b0mr5846925e9.4.1749025150206;
        Wed, 04 Jun 2025 01:19:10 -0700 (PDT)
Received: from [172.16.23.13] (adsl-84-227-104-5.adslplus.ch. [84.227.104.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d80065e0sm198301215e9.29.2025.06.04.01.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 01:19:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 04 Jun 2025 10:18:25 +0200
Subject: [PATCH 5/6] dt-bindings: power: supply: summit,smb347: Add missing
 power-supply ref
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-dt-bindings-psy-monitored-battery-v1-5-7f755ff75218@linaro.org>
References: <20250604-dt-bindings-psy-monitored-battery-v1-0-7f755ff75218@linaro.org>
In-Reply-To: <20250604-dt-bindings-psy-monitored-battery-v1-0-7f755ff75218@linaro.org>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Jakob Hauser <jahau@rocketmail.com>, David Heidelberg <david@ixit.cz>, 
 Dmitry Osipenko <digetx@gmail.com>, Tobias Schrammm <t.schramm@manjaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1272;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=c3ZhkkgovKXxuwS4xu4/Ddch1klTKWepTgclJipCla0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoQAFvgu177p43lpImNcls6Ad3F9pYIhqEV+Xnq
 xlN4h+o3jmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEABbwAKCRDBN2bmhouD
 13D/D/4jbwgQpcLMKS5ZuxOM26GW9d2BXw1v9VRfgGFRTPNWPC/E/IuzkyWbjclrSRCtOyV//r4
 FYzHDNOJmeVO4FEhozs0JI0xQaafc0tj2/SYFqkqMnYgXmKMWVxHCGYr5YQQ1tGhy8u9AwNnIRr
 9JGnYQB6L/0ep7oWrm7K4+Fs10ePIvaGTYPfEezN7BupOQuZHrWTdapLcCVVAmdmgEKzzQ/D6Ho
 64E4K1auoc26VB/DT/DMwpzIoAYkWRBetTM1wyrV4i5GCEzfyTKX2fCTXT2HIZuKUC/zcGh582t
 Qp1RPo2E5+Sn8MiIorfWTBsqi0fJA3bc2n1SYxkvSoblm+RLzSgSaFZhA4CAyXMTdbXQmHJWn/s
 p+QpkPR6O/1a0hf8Z48mnc/fw20w1b/zk6B3hU9qimBozs/jpQPQ9Hc9I8C1LTfQhokdghbQJi9
 g3TtkKoZTe+4bgvjuj4EMsb34aEVzRMDSFpN6Wh+qD3WqUdBIfheZBevEJ1vCZGki/0zvkcIM57
 SEmbPhGW4Nk/7SyEn7ySB2MCwODcEweZt0a6saJxQpRsnJcO+PfXG62wiXmUZmVUDWsnHkbsFhf
 pS+QY55iy6l3i5lL2G6bMHWC3yNDj2w6Z61jMlxTRxDpMD33YtwNezxv+fVwWf2642nUZnZaUr/
 lavpvvszyOueHnA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Reference the common power supply schema to bring the definition of
monitored-battery property.  Drop also the obvious description because
it is duplicating what is in power-supply.yaml.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/power/supply/summit,smb347-charger.yaml      | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/supply/summit,smb347-charger.yaml b/Documentation/devicetree/bindings/power/supply/summit,smb347-charger.yaml
index 2d552becbfe6cb08c72f2a5584bdddc67443a2e4..65ed92bb05f30f91e24978d3261c7f29e4233e2b 100644
--- a/Documentation/devicetree/bindings/power/supply/summit,smb347-charger.yaml
+++ b/Documentation/devicetree/bindings/power/supply/summit,smb347-charger.yaml
@@ -23,9 +23,7 @@ properties:
   interrupts:
     maxItems: 1
 
-  monitored-battery:
-    description: phandle to the battery node
-    $ref: /schemas/types.yaml#/definitions/phandle
+  monitored-battery: true
 
   summit,enable-usb-charging:
     type: boolean
@@ -94,6 +92,7 @@ properties:
     unevaluatedProperties: false
 
 allOf:
+  - $ref: power-supply.yaml#
   - if:
       properties:
         compatible:

-- 
2.45.2

