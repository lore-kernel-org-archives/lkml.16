Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCCA275112;
	Thu, 26 Jun 2025 11:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750937639; cv=none; b=Z5pNl0KPTSgaUJkuglEnKRW+wGIb1v4wzZibD1/LzaQhYvsvoQ/+vGLvUuVNr2SytWwyU0Nf6mnE9PC7PA0Ryy3BpQCDKho6y3LtGtukcSy+qxua6kku1nCN+f1BE+Gu8QWt5glpH5R3rri9KCwPLegpydbd56OlIlEVxodj1eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750937639; c=relaxed/simple;
	bh=9T6FEBzW9hV8QM90sSojeQbP0UV+zgUp00hV6CROcxM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Az4I4hOORicotO3x6AEA2bdQ+bcSvXiRlwcqa26pwVdic3Kxdagx6JpPGMZR56iRxuQ45Rj9l72R1Jng/AvgnQrvPlRtx0Mo723orDPR9fN/DQLfF1EwnvwEzUQ3Mfnt9udehjHD7eSuY/oanxm4BjBREmo1q2+0nM6PAnfJf/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fbSYy8ax; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fbSYy8ax"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a503d9ef59so621497f8f.3;
        Thu, 26 Jun 2025 04:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750937636; x=1751542436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gVYbWig3DvbQGiEQJQbX2PUyfhrBtyIo6aspeOy0wig=;
        b=fbSYy8axpOKoWTAATO2y7HcuUBOTeNqshjV2Dsov5+lFSNAQejS+AsO8HsGrMQUxvf
         zxkY/idFwnksIZpRL7gxCaY5s2xPCyEVIrhKC8VfPqwAkyeMJ/Q53Ouj6Xr/uG5QQOnZ
         IQ+Ex1LWcFe8BtObE6+rFUbKbbPXV/oFK4bupnvXHKIGE3yhZ3VVJWgps5pylgAHPcjB
         fO52jdronoI9kIzo/1MzE/3HmzkvHi5wVVAB8eQXWz8PyGoLokKPT8FmTzGAKm1peHVe
         nY/3nEcKqyS9prLIUo6jvFR6RreDdGec6depEtB2DzbmHj4Gy70mdSSfBkG6Dq/ILfd8
         iBtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750937636; x=1751542436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gVYbWig3DvbQGiEQJQbX2PUyfhrBtyIo6aspeOy0wig=;
        b=LdrVKiGgPdnVwOYk1+BpKCdVDgttZ2h64cBE34DWYCn9Io5Uolx9empbAFJDZUtgIQ
         MiC1fYqqsQPcVFE7ckdkYPNO1fac5cwO5a55549GRbwB6iiR0g/JBOO8Ewl7lZBbC/AD
         Tg/Wyxi3BharqQ78/cmj52whEECtaEg7NS0NqQG5UkOC5hnQSypbORkvsWMCXM5nJOwb
         8EHmd4m1doYSQmz9qlWHOjHN4CmgWLAoJDLzqpQFtclW6xGbeCr5tnlApIx5XpNThMQ6
         7Rr34eQBwrgnzxi9Y8L/SIjyVmlDOM3AniTkEm2RGIdKgOcyUx4nuv5XNJrUV1Mf1x7e
         v5MA==
X-Forwarded-Encrypted: i=1; AJvYcCUwgHHD2U0YNKqNb7HhBAOqWeEhQCankNBpm4iVMo74xP2KCssrt94+vKte3a0XX4H3s2J9roRAo/wgv3E=@vger.kernel.org, AJvYcCVnTmmXEklD2bbkyhS+PKYv8bHFLNvkVdxpaQnaYK9jVh4J9cqeLOW3GUzufyayZhDPiz7tLRH7x3cr@vger.kernel.org, AJvYcCWtUp3XIhK2ZDmnWqV0pPx0iaeBYRreQwdQiFHOg5Y8y02ah5hKR4Z3YSeDWMkevqS5JoRCq0EzrMrU@vger.kernel.org, AJvYcCXxi2Aobcp5Pheg3Xqub26C9eCXROCNV/gx9gABkm5dFQB8b55t9ZncQsvO7X5EVOiEfLqIQW0F7s8s3J/b@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi3VRUVNewCb1DWqUG5s2MwnqyRcgpGAPxuA/mc5T8D37iXPXc
	x20eNVXeslgOT2hrMTVH5v1U+WPcP7MrK4Z77ByQ8SRY8MId4eRprhY/
X-Gm-Gg: ASbGnctlt9QgFssDxrDxRLUGeuY812BoCTSKT4gHItJdfIG2oQuJQe4czou5utgmLY4
	ecxseVn2CjpSw6NAsTl8GjtuvymVH7GUiek5KLEkHjBQt4eSbqIKpUJZervQFOUjxFOg1ja4PrE
	RZz+6Ce/U/P6DUvQmjqOiwtOoi7/E6rAxirgXP5exunlPhtk+XMks2eqv00TjgsZO3zLnITtMmO
	0zDq9BaWss2k/nLjmLDCF+ro7d98Su4z39ui663NZyzCQBM0w1RR3V/adkAOtvQ5/CGRMFq0MIM
	/oOAfB3+3ZU98SsJQ+Hi2FN8A/PxBd+0BTBbfpXi74Wo5PwiWBeJJo5/Tcork+ltyYcUbhnsSz9
	x/BbO/F9ZJNTRfBaelocT7J51sEAsQzcZ/RfgJTp0I8setFMW3NMk7dOIWdzUgIc=
X-Google-Smtp-Source: AGHT+IFlv+IjjXeQ6/DPokbyouXNsMTWEa63YzFeQbKkF2o3mj4F8k2NQMIRWsJTuHKkUMxwLMo7ig==
X-Received: by 2002:a5d:5889:0:b0:3a5:8977:e102 with SMTP id ffacd0b85a97d-3a6ed64afaamr6027760f8f.39.1750937636017;
        Thu, 26 Jun 2025 04:33:56 -0700 (PDT)
Received: from skynet.lan (2a02-9142-4580-2e00-0000-0000-0000-0008.red-2a02-914.customerbaf.ipv6.rima-tde.net. [2a02:9142:4580:2e00::8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80f22efsm7071753f8f.46.2025.06.26.04.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 04:33:55 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
Subject: [PATCH 2/3] dt-bindings: hwmon: Add Microchip EMC2101 support
Date: Thu, 26 Jun 2025 13:33:50 +0200
Message-Id: <20250626113351.52873-3-noltari@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250626113351.52873-1-noltari@gmail.com>
References: <20250626113351.52873-1-noltari@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce yaml schema for Microchip emc2101 pwm fan controller with
temperature monitoring.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 .../bindings/hwmon/microchip,emc2101.yaml     | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,emc2101.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/microchip,emc2101.yaml b/Documentation/devicetree/bindings/hwmon/microchip,emc2101.yaml
new file mode 100644
index 000000000000..e73f1f9d43f4
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/microchip,emc2101.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/microchip,emc2101.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip EMC2101 SMBus compliant PWM fan controller
+
+maintainers:
+  - Álvaro Fernández Rojas <noltari@gmail.com>
+
+description:
+  Microchip EMC2101 pwm controller which supports up to 1 fan, 1 internal
+  temperature sensor, 1 external temperature sensor and an 8 entry look
+  up table to create a programmable temperature response.
+
+properties:
+  compatible:
+    enum:
+      - microchip,emc2101
+      - microchip,emc2101-r
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        fan_controller: fan-controller@4c {
+            compatible = "microchip,emc2101";
+            reg = <0x4c>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+        };
+    };
+...
-- 
2.39.5

