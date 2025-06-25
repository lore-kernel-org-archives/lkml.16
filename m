Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1439C2D877F
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843150; cv=none; b=fsfur4YCwNlofsULIuyLLGNGDsg7Bi54ZFMkDWUVw1MgxDVkvTo70JT8J1YZarYjaZggG4yjWBi7uBllPkGSZOEa1qKWElt0H4binJ8OBG5sM5L5QsvrBzW1uvm/sh7BZQk0gwhYRpKabaMNeWcjMVnwHUFYn/dASszBrdpvqjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843150; c=relaxed/simple;
	bh=LRhM5EQe/E8dZLiWtrnYUcrxAzx0edYLOp2wjvSBccs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mZ4eVYDoeLgbt9ZCYm02tLrNDCANKWMeUwOftrY4bWMQdy5p5G/4TgWbv0vkr1PMMeaoeRW/QuXbRvDZaG4g70KphsISt+7teAiuQJiOf+dMoDVp1mMw3w7pGm7xEH9jj5R7Kt21fA53vKQObmJt4kwwCYH/XTwDX31RoprJFlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=EFdLpWdc; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="EFdLpWdc"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-60707b740a6so9622966a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 02:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843146; x=1751447946; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6XuaCq04YCRg7wjyDUukj74YYgdGBG6ruc7T9PeJYas=;
        b=EFdLpWdcjkS9sXj9WlVFkplYvAoKmn/0ut9M5AtGR8uT9e3jnCLHR91QPrfmlEkA5Z
         mXr3eyHJEIS7vqoRabMsDs9OvYY4K4068hWilz/AnBf9ZwxT5gGR+KEJtrtGTuCMvEj3
         55o6cJ9Rrqe2iBvdjNLfvJNPdZDJWKDt+0reHMh+pwne0Qvyd2aV+Uww97E4utbhZXht
         MHtPtcuZP4hDezWkYhV1Z/QEyhfsDoAx817KT6J+F1OuEcSvJck0x6zSftbYorP2MxSy
         ozp4L5sEp2jFafs0ohUMAn+bMT20MRO0XW3dUszKWO9W32jikbbMY0ftxM5bpGjJObQn
         I2gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843146; x=1751447946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6XuaCq04YCRg7wjyDUukj74YYgdGBG6ruc7T9PeJYas=;
        b=AHlDZvZEyQYMd+S+JVk+WwA11cvB6WGMtUGDqaUOJjRDKhvN/KMQivu82T4HnsXAXH
         KU8xWWg64IyZMtTZXOEJXoTr3csPVWgnqkny3ngDByoADwu29XMyi66cjFplddK52Ubq
         t9p0eP4Fsojqckj7AD+oTqdv7ylkpt/V21mzzMAALgAhZP6unsQgF/aeBmsPRkIe9Sv5
         p+vqd6/R//U82wNBg+mf/6blkslnKx5Ps7e8LKJrB2v/69CBDE1rgRKIe3CwkPZN/PVL
         eD86rrVKGMEnEw+/0eprEK4ADJHwbiePX185Lcb24Jr4zHcbk4mQByKE6iMuBN2tt68a
         i/4w==
X-Forwarded-Encrypted: i=1; AJvYcCVzt4j54RF1CjNttLVF24TaRM9hxfFDEwmU4FJtsUsOfVQcfdu0XnVidUFu21kyr67e1UkCdvl9IasIu4s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKMoT+vUTHduHRwWIQ8qCZiUKYKpw4pdp2ZDkkNu3aqbRNwOLR
	FYYSffj7WvDFDTSjIRnnBO3McYFZER0QoC+R8SYK8i4d1LZBT0E4fjXi4MRA4nyp6sA=
X-Gm-Gg: ASbGncuvuLWRJNSCYuI3VDFlIUmDN15vZoKJ6yTt/s1pOG83TPBn/1zEc8AhC6FttiZ
	VRylBgs9dEY0nQA/uLx4SPdUuGWX/s7U368R+I1YCsV1LmsAAY2bDRzNJQ+FWDTrMpjnjcRe3Qb
	Rz1ikNNzEyE6Yy9eK5IJjH3k5uevckQYS/nM6x7baFm95/kLb/7udw4HUZ/LWFDhRDQn762jqhG
	6E/aGxR/UE1YZ7wHUOVpclJhMSQiGOpthEKDVz1jAd7Bj9965dxxIysvnYS0jaKYOXuZ5YiPFQE
	xk+5jSaYQKu5S1F3tBdq8wxhOJKl8VS7q5p1mnztjGSPEjl5yPqibkYHAKLQr1yxLi4NRTUADB2
	0gJDbYG+OpwcYnKDNQ2k9OwAlWoyyeiLD
X-Google-Smtp-Source: AGHT+IERhYechcJvF+Dtv7X6Aq+Z+zOtEoXFGIE0yuBjIdgHsZfdoDBQmurBw1t4QoxOXWDqVUWvmA==
X-Received: by 2002:a05:6402:5113:b0:609:b476:4d95 with SMTP id 4fb4d7f45d1cf-60c4dbb777amr1362134a12.15.1750843146418;
        Wed, 25 Jun 2025 02:19:06 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c2f196f84sm2194802a12.14.2025.06.25.02.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:19:05 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:18:57 +0200
Subject: [PATCH 2/4] regulator: dt-bindings: qcom,rpmh: Add PMR735B
 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-pm7550-pmr735b-rpmh-regs-v1-2-cab8ef2e5c92@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843144; l=1759;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=LRhM5EQe/E8dZLiWtrnYUcrxAzx0edYLOp2wjvSBccs=;
 b=T2Cmu1rQmNai2kvf9Wexy8yxt+NdIB2/JptwBzJUgrUFzMh+lMU3PXkc1dQkXO6/+plndKa8R
 fU5rQREmE0BD0clUOSCdMIZdEC4uUIBzNje/q3oRWogqE1v5vxcChGL
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the PMR735B compatible for the regulators in the PMIC found with the
SM7635 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../devicetree/bindings/regulator/qcom,rpmh-regulator.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
index 3dd150e5dad897eeb46e13dce5bb2726fdb90627..4c5b0629aa3e622579b54a226785139a0b986079 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
@@ -54,6 +54,7 @@ description: |
       For PMI8998, bob
       For PMC8380, smps1 - smps8, ldo1 - lodo3
       For PMR735A, smps1 - smps3, ldo1 - ldo7
+      For PMR735B, ldo1 - ldo12
       For PMX55, smps1 - smps7, ldo1 - ldo16
       For PMX65, smps1 - smps8, ldo1 - ldo21
       For PMX75, smps1 - smps10, ldo1 - ldo21
@@ -89,6 +90,7 @@ properties:
       - qcom,pmm8155au-rpmh-regulators
       - qcom,pmm8654au-rpmh-regulators
       - qcom,pmr735a-rpmh-regulators
+      - qcom,pmr735b-rpmh-regulators
       - qcom,pmx55-rpmh-regulators
       - qcom,pmx65-rpmh-regulators
       - qcom,pmx75-rpmh-regulators
@@ -445,6 +447,18 @@ allOf:
       patternProperties:
         "^vdd-s[1-3]-supply$": true
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,pmr735b-rpmh-regulators
+    then:
+      properties:
+        vdd-l1-l2-supply: true
+        vdd-l7-l8-supply: true
+      patternProperties:
+        "^vdd-l([3-6]|9|1[0-2])-supply$": true
+
   - if:
       properties:
         compatible:

-- 
2.50.0

