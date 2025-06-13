Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7285C193079;
	Fri, 13 Jun 2025 13:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749822176; cv=none; b=eh8TLvUbUwf7+Fu2W1+hKEGg35k+JX30RewihcoeE70903A+vI3y8XFdxsx5Dmx+4mlTwT6CYn1tJeikqK04tch3EMrkEnkCn9bIdRIt4OD1n6aRWP8T0ldP9iZ/V/J2gw4zOPkJdiJ0a46JO+TOIRnTQWTQWf3QgUi2DpjK//U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749822176; c=relaxed/simple;
	bh=TOEaZuzSUXd+sIGSfBcee2w8UJ6mBNvvMs4YAMDgnM8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rQ1SMKPJ2KmEGvh/q15q1fC5Vxwc7OKU6itByT7lBplnE/WDIJk2J7QtFdXtslWN0s5GpgNF2jqpml5qTb2WZfcjyflTbTMZWNr666hDwugjujYkyNyyBmbkBFv4D+8EA74JquQ2XworZyE2mwsgd3W31vM/GYb2Okh5Cv4X/D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJ+WlqzL; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJ+WlqzL"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-747fba9f962so1895633b3a.0;
        Fri, 13 Jun 2025 06:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749822175; x=1750426975; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F+Al+rcEeVomzlpH7id5dsEDyu2Wr5Mn2KS1+UwiDXo=;
        b=LJ+WlqzLtmEv/6SKQRQ2s1rVwPp/LWnQhth6hhvCHB2rTHg932f8nPqqUU1PFgaV+e
         /GUGYl/fi/hhb9FBGTfpW06hFnxNRDjr7Pcm59PEGpqJR9nczpyWmGouSkzzS6BIMBhc
         4aVFAC+RFI0TQcA1d+DqC3c1ZUY0pW25SEjuxD9yh8KSb6vC40FLrCMaVd8Q1gKGmlRG
         t/KYqJCdnQ1B2/NRK1aN5uJtYSobWYUQywwHlJIJkl8yIzVSLeQAEwgYIGlxy152J1TU
         zZrIASkyE0U21YrJeGWjNzel43iR+5uwLJVI2u9pq64ZykjhgvuUcU9k01JVewAVbNhf
         2N9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749822175; x=1750426975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F+Al+rcEeVomzlpH7id5dsEDyu2Wr5Mn2KS1+UwiDXo=;
        b=gAg+lrD1Hna3InFJIoxsBMCvFl5zNN1PifrbltOlgN/6q07PXailSMEtSncw1hc+MR
         dC+EN+T61k0001URpU6nJ71HWMWMCIft7doJLhn+UMOSKc5J9PQU2Zm1im5C8BYup1ho
         hxxzYHbVmBhyeKBbpAL1r5Ip4/abrciDNpQsJHWChXSjca0o/uiXuYIkNjjpkzfC+Bnu
         9/eKVow8mpONK1GMFQC/msV6Vvs1sYt2XlYvysw+kg8hm9V9+NzsMEPmFysPKleRvTdJ
         IzY13HvVjnTz74K2GaGIr7Wh93s8aNsJFeqzriJFOZe3Mub8F5mBJg7PPr62C0gAKmrG
         LTng==
X-Forwarded-Encrypted: i=1; AJvYcCWLoav7S2/MnywIt2C86pYd6hGLDhN+LxMh1tt9NTVWO/ySDjBOG53OEg55zFZpiHKCuUEjqaVkhMhFa1d5@vger.kernel.org, AJvYcCXzJkhaQzX6e1d5ahnZmfRomRmcGQaHtZl9rSrIzXUTu2zR/6GZtdVJYKC7Q6mlsXYkghNKAwK3UazF@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx+WdhxYWai/1BicycJxf697qZnbDjCm0D669TfJQcpXAHPraZ
	tTtjqtPwNCviqNfx266KrUYRIdw1n87jSA5JpfyrziQiowaLiWlctiqt
X-Gm-Gg: ASbGnctPWaG7julZw2DHvVoKZxOU/4R+IU/gbbYdpS17Tpx4CETZfNjhKpq9wWxr0o6
	ngChyxc/FOhq7cRxKrZOda6IjWYvwRTZoyl4tzTBcFlhEoBv2WLigY+Ndkrys6o3rOttJ9K4hFY
	PpjahmhoVNbjQ5Mi4AC8horFEVbh8HfaJfMYof9PEx0QdZUI2coI9ApMG/5s+2Uh3mD+jmrolUt
	smrndezMNnXu4pZuTLVd140n5olQd645xRCmvkPVrXJGbWG1vcF+Uobx/+fCV42pffZEHFddEaV
	o4XiJQzyVciSC+SHehXfCfR+G/T9bKMmB3P5IGrt99kOhft8BpuYBO4zhkX4huxF8A3CmGGRQGx
	7WxYTSPF/7QGkqajlu1Ai
X-Google-Smtp-Source: AGHT+IF+3O9dHtKLsjzYloFYOj0EW9oeTtJ8k/2nzKdctgjYkG5BELXu+krmEMvJIrs8/+n3+N5sIw==
X-Received: by 2002:a05:6a00:8b08:b0:742:b9d2:dc8f with SMTP id d2e1a72fcca58-748982ba345mr653458b3a.1.1749822174528;
        Fri, 13 Jun 2025 06:42:54 -0700 (PDT)
Received: from joaog-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900b2d8asm1605826b3a.132.2025.06.13.06.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 06:42:54 -0700 (PDT)
From: =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
Date: Fri, 13 Jun 2025 10:42:38 -0300
Subject: [PATCH v4 1/3] dt-bindings: hwmon: amc6821: Add cooling levels
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250613-b4-amc6821-cooling-device-support-v4-1-a8fc063c55de@toradex.com>
References: <20250613-b4-amc6821-cooling-device-support-v4-0-a8fc063c55de@toradex.com>
In-Reply-To: <20250613-b4-amc6821-cooling-device-support-v4-0-a8fc063c55de@toradex.com>
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
v4: Unchanged
v3: https://lore.kernel.org/lkml/20250612-b4-amc6821-cooling-device-support-v3-0-360681a7652c@toradex.com/
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

