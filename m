Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64A222B8D9;
	Tue,  3 Jun 2025 11:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748951181; cv=none; b=B8bSlYwLZKtW5B0POQCiuzFHZlLVmhPU8XJ6cenmGsoV3TggNadrjMVkJE8RSw1+N2A3Rqvkipi0MaDAa6I+J8FrVRVVu42vITzhrdFfDba8NjFEbfbx3ysGxxeqn51hPvGiMv0wZG3Xwx1s9BIkZ8oP2WeCfbUVwTx50ZWfjUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748951181; c=relaxed/simple;
	bh=xCoto2OrpPTlJuUMmQwlmkRuFJs15zgzsOoO0ItvU3A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cXjee120ZrxHoX6pYrp0bt3Mo6JfwFXwyRfujJKeY5/ciCtkXIPcArQMmX5AXCaOWWKDn/baWUOD9GTcnRcgAyKatQhTbWqCkxp7/7r5fJ4Y4L9Pb/6uAewWQCYb54fdVWxLjXcNL29Hya/7mzC4TPyA88mK4P9QhKjzcLDAy9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ehDnEHRS; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ehDnEHRS"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-747fc77ba9eso571571b3a.0;
        Tue, 03 Jun 2025 04:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748951178; x=1749555978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bXngrH4M5sooQS887LacgOZZPsUjYWZ3tkABH9RYKv4=;
        b=ehDnEHRSiuAquMPqd1Rr7aEv5IK/iW50MBVS5lf/rx4sIQjizDp+uW4Yk7E+8MDi2H
         AyRkuTcnFNH0ccnW9Sz5Fj8LN4sTlMZSEwS2JJCamznCmALnkwDkHDnm93DMNf0HwPtU
         JpLtLlLsKJ0AQ8BSkrT48EKztHpDzHP9HNY79rh/nXLRsYnxWN6Ib2nhLh7PaQaZIJ79
         y9wC2AqU/7YFmS3rEcKeU1FeZPIfyKUwzgqqYjRNIFuPn9bmJV1iBldjZpoHuq58uAGK
         W6k+T7bboob6C0il7/8/p6+8F+X622eygo30LL9Xdxta2dxLnSXPFYyQx1+r52yEIEAj
         GkGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748951178; x=1749555978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bXngrH4M5sooQS887LacgOZZPsUjYWZ3tkABH9RYKv4=;
        b=u5jq7U/MKROaxM+f4hxCpqVNc/seUfxpHP6S/ShZPSJH+ZFr9mM1KCT5pqHc4/v8y6
         tmLKUuuUk6nzmipW3WzorGZZL9vfMCg4/b0dNAydyu1FPF08frdvSSnJuRlBxHnxfSol
         Si+tQWR68eAxv9puZDDE9hTC65RntSgoWE0g1BEWNs7Y9qeyVCyo1StgOjLzueiP+Ms7
         rT7pSaz2U4n8IEvAz9joSkZ9mKFtDjAeEmMYu5//V0+Btg4mcwV5Da/J5M/fKZ/GgbaB
         hEKAKFHCmVK4M4T6IasuvLvZQ+Jq633pTjr2RELNqohUuED4xgk/09/A6RgN4RLor4BI
         GTgw==
X-Forwarded-Encrypted: i=1; AJvYcCWyU+DZD+AwclhacHg4+VmwkkcpEU/g/4GsFJAvqvdqGEDT+bvthT4JVCVhRkEuwsDhCGqHMeQRvS2l@vger.kernel.org, AJvYcCXr7h3bwmBulsVaBmw0HT3bV6kRXJ39K/6NI5YWrsNpEXXwu6Im778zI9AJZ6d0Hpqe3Rfbtnt2UjZ1yLFK@vger.kernel.org
X-Gm-Message-State: AOJu0YzMH8V5bm0fclaIntyTG3ASmMFfPnguBRWLCar64ogJMPCAttxP
	tI2jQYH6DuT7Wq9ea87awWdPH1AZqaauqntweZP9mhtoBAz1uwR0Nv1f
X-Gm-Gg: ASbGncvTbVYIJ/devnY2pLpESLAfYZkdqcBwAmAb2X0aOmu0jcZdkiJkJxzuce3+4vD
	r+e0pKsA2esUs3Lj2SdrFYFJqlY0hc/ScMImOK3U+13SoA/OSyBZgb6pNmOUA5o7+hyry/Q31Nm
	3GSOxFu0XLLG7RJX+FGx8URvjpAgKJsIWAErM1uAbeoQI1iMe0ZgkHjIe75P6Q3npKOfnnGwumI
	kcETb+ZKFx0hxshagRw2YXJm+e6DlEhvcxo+T30FJPrXpeKfSbV6iM8tPf58++THG34kkOdQkLN
	t7VUL8QuI8XUwxTWp5J83rJLyvJg0lm1ZuBlnFomOfwwuGrxkwhj+lU8o6pCPAC0rsifkvAU9Tl
	Xrdy8eofEd4h4Hb7Pa0+Z
X-Google-Smtp-Source: AGHT+IGTYMISjrmni77jIQXj5aPQuZhQq/kj5WBbIC6gXzV4ESB88YOwR3rO1W/qby3kYxOL56IJtQ==
X-Received: by 2002:a05:6a20:7285:b0:1f5:9961:c44 with SMTP id adf61e73a8af0-21ad95261fdmr26301044637.3.1748951177977;
        Tue, 03 Jun 2025 04:46:17 -0700 (PDT)
Received: from joaog-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afeadbb8sm9446459b3a.66.2025.06.03.04.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 04:46:17 -0700 (PDT)
From: =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
Date: Tue, 03 Jun 2025 08:44:54 -0300
Subject: [PATCH v2 1/3] dt-bindings: hwmon: amc6821: Add cooling levels
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250603-b4-amc6821-cooling-device-support-v2-1-74943c889a2d@toradex.com>
References: <20250603-b4-amc6821-cooling-device-support-v2-0-74943c889a2d@toradex.com>
In-Reply-To: <20250603-b4-amc6821-cooling-device-support-v2-0-74943c889a2d@toradex.com>
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
v2: Unchanged
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

