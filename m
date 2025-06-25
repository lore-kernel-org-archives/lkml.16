Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423F828935A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843149; cv=none; b=b+b+JtgNpC59hCxXP1jy6BHtKWguJGLhK+eCdOEVYOobo+erX3RBMJIA69PyhLu+X1QOukV5/3pHSb57WgXSNHCp+8tyZokCMgubnfGS+qWW7xUo3FBHzkaP5CKJmVTZtrHMcKAWyr7Qul7eu0CMhRGN14ntS4E4XHsO/jjkNzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843149; c=relaxed/simple;
	bh=kDQYj27AP04wPxwCw2z133BqhOfJY86iBEamyEFYjMo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NPvqfivA7qGZMBBe3KX9uKYZaEYz1P41t7X6vnAJDLt5YzDHTchFp+uxzJlZkteuManXGeMX12+tVE3e4FiplIF8eFDsKK05HLJr00CAuv6X0euTULVBAERhsAR5JtlMjgW53lJWE0o+fI8nn6eYXIR6pgSGnibTWJo8YdXLiLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=a/+BI7Yo; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="a/+BI7Yo"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6077dea37easo11881304a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 02:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843145; x=1751447945; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/9uDu/IV5VbpmOP/ke1cMJdOAkM3pQ+53aaRNS0oGnc=;
        b=a/+BI7Yo3mTfZFUEn0bqdhsuIDxJybEtdJ7YWwPMKIjXnEKBcO+Dek1ZnewsSArkXb
         jy1bBWEQy9kO5r2WmTAj/ZFD0i5YaGU/1kTtThlnN5loOpm/q8NENk9zlPFe7NuMh7O5
         f3V9kH6gy9hCS1LRH4zsduyW9/mLlgGnb+7ejzfyP92WVkYp/u7D0xmClL4xW0cv43wF
         fY7nVS3o1V5p4t3cA1BwmiZEF0qCxPFrvxfMlWtGjpvMZmCLj0ZoePvXqt145Xhn5hpA
         jzEn2k4gJYTSN0TIMo4+KZVNW/+QSXuGmFY2rkDW78WV+PDG54jaX6iSnOO5wljlDkwJ
         w0dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843145; x=1751447945;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/9uDu/IV5VbpmOP/ke1cMJdOAkM3pQ+53aaRNS0oGnc=;
        b=G2nwKm/+dPXTIuHjiSHWQqf1kIji0VuT+IQi1K8kX0oBCle7ZK9m8NzCQXaRkUtqg4
         ewnljciXDKDNEd3EFsHdVy2lgepTvZ/PfUPqfR511gkcaWMRnp0n8w6mXlcn8c+yPqlA
         3ypVYmRp287iHU1Oy5GQ8tBo0q6qgeBlr3X/eBPV3KNsJvizoWJVF9ynPL/7NT6ujiY1
         /BgDDpS0T4sgDHjNgXENwineLDvyPoV0ifTN+RyKu29zxubSSjyUvCLfxTAgKFmx2v9T
         jTyzmM8BIKWc8uxQgwEHoJljS3ecxgrEkDrMyvgTDwKKIBtd1DcE6Qwq42/ZxLcJbam4
         Je6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWinZ0EDcArplKymN2V3EUtZzM9m8hfdabjN401Wy49qDzFtCb8KL5Es3F7CMeHKFjwOMOEAVLkmkkdvyk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJwDmGrPx+YkQsC+HA2VtBK/Bg7/mTiVJM5jp08/MSRXwkkPv0
	bc4OjREaFUdxGBWkqqCbqjrfE6yOdr1q59j1MYERhNixyfWwsYsFWmLm9fPld59MHH4=
X-Gm-Gg: ASbGncs5Dn5s5gaADWN874Y8C22gfL8n53/nqbm8HzJcRSuiIPbnC9vljxtS19OlJJE
	r9Z8pr8AYJ14jYUaIuKCmWH+MAjIJ5TcpJ5sbGVUIEgLyaI3zxW7X63ZngawZw9ZYO0nmFTYrVQ
	OnRtzGUHJmQcRiZ3MK1pmJ9s/rnG7Zxgeigqn/36zQNm0DaaL5KPneiMd28ZZQEQ8bZtHB93AY7
	bsTn5BBX1Aea/k1rHObl2WFAvas4ez9+pVA4cbhx/YYbsDRd/I6zMnFcxsQTXYxdV+J2sWGv7Cm
	HLxnDHSrzWKBpXIs6EgPtR7ly8j0bPzDAqeJv7Wh5+IDvJtv41QzlJkfO5dPACEV1gJRt6JfnIz
	bRDVpDjl42N+Z+qrmNA7+ZsBRmvy3aM5H
X-Google-Smtp-Source: AGHT+IEiwLuBEMrKG5klw3CrOC5eGRdldVU8lXLohlCG0bQdDMTOk2vu9M5XhJ4WsqHgxQZeCAj68Q==
X-Received: by 2002:a05:6402:26d1:b0:601:d77f:47d9 with SMTP id 4fb4d7f45d1cf-60c4d31714amr1534762a12.5.1750843145518;
        Wed, 25 Jun 2025 02:19:05 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c2f196f84sm2194802a12.14.2025.06.25.02.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:19:05 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:18:56 +0200
Subject: [PATCH 1/4] regulator: dt-bindings: qcom,rpmh: Add PM7550
 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-pm7550-pmr735b-rpmh-regs-v1-1-cab8ef2e5c92@fairphone.com>
References: <20250625-pm7550-pmr735b-rpmh-regs-v1-0-cab8ef2e5c92@fairphone.com>
In-Reply-To: <20250625-pm7550-pmr735b-rpmh-regs-v1-0-cab8ef2e5c92@fairphone.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843144; l=2084;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=kDQYj27AP04wPxwCw2z133BqhOfJY86iBEamyEFYjMo=;
 b=nPsWkKEZcFEwELUedXaDX8Mec7BYlcARiIA9hL6RwFy7FXpUar01Wo2yo8tG7MQ4ry7EgVg3a
 8R6WNv0B1QmC4Z+pQQCnoRnT36jbYY1LCQ0LqDgrs/sEwKYviJh8Bzg
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the PM7550 compatible for the regulators in the PMIC found with the
SM7635 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/regulator/qcom,rpmh-regulator.yaml     | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
index 3a5a0a6cf5cc7090f3e09850e9a13b7e6eeac68e..3dd150e5dad897eeb46e13dce5bb2726fdb90627 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
@@ -40,6 +40,7 @@ description: |
       For PM660, smps1 - smps6, ldo1 - ldo3, ldo5 - ldo19
       For PM660L, smps1 - smps3, smps5, ldo1 - ldo8, bob
       For PM7325, smps1 - smps8, ldo1 - ldo19
+      For PM7550, smps1 - smps6, ldo1 - ldo23, bob
       For PM8005, smps1 - smps4
       For PM8009, smps1 - smps2, ldo1 - ldo7
       For PM8010, ldo1 - ldo7
@@ -66,6 +67,7 @@ properties:
       - qcom,pm660-rpmh-regulators
       - qcom,pm660l-rpmh-regulators
       - qcom,pm7325-rpmh-regulators
+      - qcom,pm7550-rpmh-regulators
       - qcom,pm8005-rpmh-regulators
       - qcom,pm8009-rpmh-regulators
       - qcom,pm8009-1-rpmh-regulators
@@ -218,6 +220,25 @@ allOf:
         "^vdd-l[358]-supply$": true
         "^vdd-s[1-8]-supply$": true
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,pm7550-rpmh-regulators
+    then:
+      properties:
+        vdd-bob-supply:
+          description: BOB regulator parent supply phandle.
+        vdd-l2-l3-supply: true
+        vdd-l4-l5-supply: true
+        vdd-l9-l10-supply: true
+        vdd-l12-l14-supply: true
+        vdd-l13-l16-supply: true
+        vdd-l15-l17-l18-l19-l20-l21-l22-l23-supply: true
+      patternProperties:
+        "^vdd-l(1|[6-8]|11)-supply$": true
+        "^vdd-s[1-6]-supply$": true
+
   - if:
       properties:
         compatible:

-- 
2.50.0

