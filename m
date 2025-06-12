Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656432BCF43;
	Thu, 12 Jun 2025 17:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749749319; cv=none; b=isylcyxIkGLTScOtfQfTY8FBogLawKfc8OrxFZXe+D1JwRTnRAzs5HG9ilaVgbatdHeJvauXBs7U6oTAxTbT8b9M4va1iVVz92F2dVC/9rRqSyHM7uvHmx+uLJg1fVAlW5F9ov0D28aC8B/MELIS8zS/PGDOqKy9T2hd5gx77QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749749319; c=relaxed/simple;
	bh=qy4+z2eCuvdAfpj6qu9T8tb+o+Geo1ztE//E6KOquBo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gCguPGEtRqx1od01mIKppwa31oOPbBHPFeWkQOEDsE/qSJIQJc0nq6cnmYh21bf4CNCUpXVWgIHPZVMjCBhndcemnGnIptBRqslbDE87iQvNMR427FVw5onFuMuGHJl1Uua2nbfi94KwzUmt/o7HpOSEUxPBTkc1q402SkxFpyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=grIWrtXa; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="grIWrtXa"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-236377f00easo17580555ad.1;
        Thu, 12 Jun 2025 10:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749749316; x=1750354116; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XwCNlpfzkn7qDRn/apDNuOvaF0oDSDJcpIEjdVQwiCY=;
        b=grIWrtXa5TacbBSpoJOC52fW3qDsJoMjwmFSfDY0huQBHpjz5wSYD86HuoNjWvhY2Z
         kNP3IMcEeiFyYfSv8qd1LgMYc1Gta7q5EoHvaYzymcY1MGzvmEcuImuAzUqF28HA+bnn
         ElXlTCMkof/UAbLHq5BXWxO9nE/Y37k2XyatR/AU43FR4qEbKIjpNZwRuIXFqFbIg1t8
         nz7quEBvRZbPtiIDaW+LUc6A3AXmp9MxFFOld01glu1yGNaEtIx/2hoaPIl49becEWMP
         1uCDZw8KIKKcx9TBOV+KO14o+w9GBTuj8ig4HCc9w2UxBgooctqsYeJNlu1BRnB2aytX
         4qFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749749316; x=1750354116;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XwCNlpfzkn7qDRn/apDNuOvaF0oDSDJcpIEjdVQwiCY=;
        b=KThje05Wl1Bm5rkcVAx/q1d2WOB7LmfIFhL0rIv5Y20jPsMgPxrzrzPfTLuiPAo2y1
         n4wL7kZO6EBqabAccqOiHQyRRqq/ZOuYaxpenpN4Xkv1Fk+wWsbYVtm0QnMwgTkPyOXb
         X1n4ILFVZKSLOIjY2tj9Qc8ZS5kuebhiQpYhFCsfolx9Po9fwRvcklLaa9QN4kgf/TLr
         RFRpMEDm/FK/pnoAhwG+yhSc8etwPL0EwCFWJh1zAYa+1jdqhiWVF8vWZ43QCIspFn8l
         JQWsakuccyWvpmLg4D4Iw9d7PGFjXeiDnd6NsBqHWNdewOS5nNixjP3EmW5JjbPjlUWr
         W1gg==
X-Forwarded-Encrypted: i=1; AJvYcCUGfQUO+1bXyujEyn3/ev/aZ1nRNsfOoui/2/wdo2xnAlxqu+y9kyyjyXas41wfUzxQ9lRVIciZNdtR4mei@vger.kernel.org, AJvYcCWKu+lkaUq0jffUsePG8y9pMu2nWaRmmxcoStZLiAPhvvFCbSxcL5aBsrwmOp4gF/F5QzMx6X3hUjL7@vger.kernel.org
X-Gm-Message-State: AOJu0YzD4RMEezN0UMsa0C3/UoM9eR6kTUoAytStdfWtg6fQ7DOXKVvQ
	Kw1U5rfmO28CN2Hvg2hU5gKvROZsoy3eKvhvs7Qgnkq7Puhl20eb6EDO
X-Gm-Gg: ASbGnctKeLz1nTEn93unocPPPl5ePrJFs8UQV9hsOFXeIzzwu3fyVIicGgtW3OvQIkq
	WB0Vnu+uqZ2qZoXm70fq58X1Q0hgR4EoWXUkt0qrB8KTEetf48W0ev2ObQ5TckKiuB6NKfp2LrJ
	I0jMR7kuAm8nK5kjG6aWKDlmF5cNltKmWeEXshkmQvsLKpLX2RFkywMuOx66+zAtLQuJt3LCYi6
	wucE0e+y2XYHxq2o+nqfKcvfCkUHJn5QDJvScDqXFe1sf+bmJRnynEPXOGKTP2x9FkFxYi3zrOu
	l0i5sk/coKipJmGnMYLq404WPR+emNtyqOUusVR5kIdLNVPhhbkwzYxUsUYI1MSimz2IP2oZMmL
	UhrCinuj1vKHqYRgYKJNuwEm0gLxtjFg=
X-Google-Smtp-Source: AGHT+IFlAK50X5FiPH2h1K9p8IuwqbMs7eXfq8Y0Ooa1zUmgLBMKxjTUsrwf/O1nZUJBwM7rLrDIqA==
X-Received: by 2002:a17:903:1b26:b0:235:eefe:68f4 with SMTP id d9443c01a7336-2364ca49931mr57691425ad.29.1749749316556;
        Thu, 12 Jun 2025 10:28:36 -0700 (PDT)
Received: from joaog-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fd6362e28sm1665891a12.66.2025.06.12.10.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 10:28:36 -0700 (PDT)
From: =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
Date: Thu, 12 Jun 2025 14:28:08 -0300
Subject: [PATCH v3 1/3] dt-bindings: hwmon: amc6821: Add cooling levels
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250612-b4-amc6821-cooling-device-support-v3-1-360681a7652c@toradex.com>
References: <20250612-b4-amc6821-cooling-device-support-v3-0-360681a7652c@toradex.com>
In-Reply-To: <20250612-b4-amc6821-cooling-device-support-v3-0-360681a7652c@toradex.com>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Farouk Bouabid <farouk.bouabid@cherry.de>, 
 Quentin Schulz <quentin.schulz@cherry.de>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>
X-Mailer: b4 0.14.2

From: João Paulo Gonçalves <joao.goncalves@toradex.com>

The fan can be used as a cooling device, add a description of the
`cooling-levels` property and restrict the maximum value to 255, which
is the highest PWM duty cycle supported by the AMC6821 fan controller.

Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
---
v3: Unchanged
v2: https://lore.kernel.org/lkml/20250603-b4-amc6821-cooling-device-support-v2-0-74943c889a2d@toradex.com/
v1: https://lore.kernel.org/lkml/20250530-b4-v1-amc6821-cooling-device-support-b4-v1-0-7bb98496c969@toradex.com/
---
 Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml b/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml
index 9ca7356760a74b1ab5e6c5a4966ba30f050a1eed..eb00756988be158b104642707d96e371930c9fd7 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml
@@ -32,6 +32,12 @@ properties:
     $ref: fan-common.yaml#
     unevaluatedProperties: false
 
+    properties:
+      cooling-levels:
+        description: PWM duty cycle values corresponding to thermal cooling states.
+        items:
+          maximum: 255
+
   "#pwm-cells":
     const: 2
     description: |

-- 
2.43.0

