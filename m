Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F466212FB8;
	Mon, 28 Apr 2025 22:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745878527; cv=none; b=g5Z0uBSklOdZkyVSgncSA09LWD4dQ67VHiRR6UrFBwmx16vy+UBxX/SL/ItUojHh0HKw2VEXlcDhLh01Oy2qKa+Vva/k9SwSbbliwnvHI1AiEA3Grdk5LrShAgyS/8jnmHFrVSXi2Fy4m89QzW6fJBQ9z+cUm345lsYhyiIYefU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745878527; c=relaxed/simple;
	bh=Oz3xbPwShQymWEBn63tRxjn/8y/MWrUejEUzseHML9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TU07WDE5MRw9teniLKhMsi1l8cucjsUzJpa41JUTtiaOP1rmzLO3/0IsEnF+M85H94sLqalBPfPrYg1zMMyRxP/4AZWIT89fmnr+JdGh+9iwD6V3chkXRK7sMopaWMV/dGwQQ9hmuuc3pnweITxQQzY0mqXjmTulsWX3VJzBnc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pr9GMkya; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pr9GMkya"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43ed8d32a95so47127905e9.3;
        Mon, 28 Apr 2025 15:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745878524; x=1746483324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9yRDcnN/FYkYJB8jlxcbYNz8bIp4lz5+az9F0kg+ds4=;
        b=Pr9GMkyagLR1dUTGYrtpp3cPBXyK1kbXGNu1E+yjjf6YxzX0hC1yvPSQpkFtYxzSnY
         bPE8Ga9mEyAguZS9lFfgeI68YlxmuiZijX1jPQLRbi8pJ6JfYoa/lRK1rEzbfUK/aPdR
         rL1YjXYtahVR5WtqMiuaX7DGApoYmKG5vt7JeHI+2830hwKwbKL+2ycewUEVx3fYFpu4
         adn8wyK8D73H+8uTAPIGurppkI6KoJnZ/zknTaNmJ2sjwVbfgL7Yql89R5bxnCj0YdGP
         AkzlIgGCNatXWsQuOfm2V+kdLVKbyejtYJs9PICmJ6D65QCWQqCJqPSZHKciJBpT2Hxa
         1rTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745878524; x=1746483324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9yRDcnN/FYkYJB8jlxcbYNz8bIp4lz5+az9F0kg+ds4=;
        b=IANIRvFHw6dBPH/H44zINOpWXDhhjXQpMAXG+BnMNkdfwiDmE06vwHd+8RRmshbSIO
         VKX10xiMi/yuiA2ZZgIZjsGi/guGgBniOocHNrIc4smGnwD21ILqqGmbhf46HzUF4eVG
         j6y7HRhJA+T7iUkRoOqD7N0prBsjPD8FKcPXKIocTRFvzDn4l/u/akODancegGeuq6Pr
         jb+yIb6xVM/29reZGuP3k9vH0jMJyXQbBtQCWPd7JGVgNCp74T/Ky0eAZpVvYElybTmd
         lXiAi5zaVQo0A1O2xlFc5am4btGQn/dmEDmTh3P+PabRjicvas+EJW/EPrdeqfv+iJpr
         Edbw==
X-Forwarded-Encrypted: i=1; AJvYcCUxIZ3iS1ovOp0RGtUbtmz7ZuBsFrH01Fncn7nZqegzxMdLGzQojEQoiJ6ly8E0Tgv98dtP8rUIy2GDwXR4@vger.kernel.org, AJvYcCVvVq6q0GkQQ8DvJsep7/9AdMfsNHzIWLxQEpOdJAbjXOnie3VZsBM938S1BL5lR/37qax9XO95IiQi@vger.kernel.org, AJvYcCXZfvgXN8E2VBNWHp1veoADEXjsH1/gCmxhFMfCo0yiKZhnkpaSrpkDRFc19gjqLjVJR7h4z+1kbQO7@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+bJ8gaEVwB3dYcDT1YmnIpZo//YJr4BHCSxk4+z5zzYhEN+Q5
	3sMRf+iz1dMKdtP1Iebm3ddMbdEXTVByYkh7uxgim9mE+02bhiqi0qSGBE72
X-Gm-Gg: ASbGncstMGENTrB9ZgKW/ixPhR5tPoGor+a5r8hIjOXpBvRwYPxqPW8/tYb7Ov2H97S
	0ZYD4SJwMuRYSzyTffsoAgN3y5mC3KtvJltEswW2AU6mf64LaBy6GmNyqDuxYwXequGLsjClYaB
	IstwF9PbzZgsIZbm9w3HAHPP9a/PgQ4W5AmsRZ1EphrSMOenpuw8XoNQBuufsHR0xo2CWD7TMRR
	RxpY+rYUG8JgViomQ7+9UlsBbZl33r14rrUi605/hWQfvBz0JS+4fbDYuL5ljRWbmhj5n42KY9q
	HSfJEXNG+3ipYLRY7bPSQ2VzeOXFYrn10WSKbt+yZNSNdbcfasZkyEjxK4OC2wQCWg==
X-Google-Smtp-Source: AGHT+IFcfjUAazBvWsvxB4iOm3Qwr7AKfC90MAdlbooYDMW4zhf+gtTiyMNS5aMj8QaOtq4t1JNx2Q==
X-Received: by 2002:a05:600c:1e27:b0:43d:2313:7b49 with SMTP id 5b1f17b1804b1-441ac8eb188mr7586015e9.12.1745878523601;
        Mon, 28 Apr 2025 15:15:23 -0700 (PDT)
Received: from tempest2.110.lan (xt27dd.stansat.pl. [83.243.39.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a53870f9sm135901085e9.33.2025.04.28.15.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 15:15:23 -0700 (PDT)
From: Pawel Dembicki <paweldembicki@gmail.com>
To: linux-hwmon@vger.kernel.org
Cc: Pawel Dembicki <paweldembicki@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg KH <gregkh@linuxfoundation.org>,
	Shen Lichuan <shenlichuan@vivo.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Charles Hsu <ythsu0511@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 5/5] dt-bindings: hwmon: Add bindings for mpq8785 driver
Date: Tue, 29 Apr 2025 00:13:35 +0200
Message-ID: <20250428221420.2077697-6-paweldembicki@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250428221420.2077697-1-paweldembicki@gmail.com>
References: <20250428221420.2077697-1-paweldembicki@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree bindings for Monolithic Power Systems MPQ8785, MPM82504
and MPM3695 PMBus-compliant voltage regulators.

These bindings also documents the optional "voltage-scale-loop" property.

Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>
---
 .../bindings/hwmon/pmbus/mps,mpq8785.yaml     | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
new file mode 100644
index 000000000000..e2a3958a61fa
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/hwmon/pmbus/mps,mpq8785.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+allOf:
+  - $ref: /schemas/i2c/i2c-device.yaml#
+
+title: Monolithic Power Systems Multiphase Voltage Regulators with PMBus
+
+maintainers:
+  - Charles Hsu <ythsu0511@gmail.com>
+
+description: |
+  Monolithic Power Systems digital multiphase voltage regulators with PMBus.
+
+properties:
+  compatible:
+    enum:
+      - mps,mpq8785
+      - mps,mpm82504
+      - mps,mpm3695-10
+
+  reg:
+    maxItems: 1
+
+  voltage-scale-loop:
+    description:
+      Voltage scale factor for the VOUT_SCALE_LOOP register.
+      Value expressed in mili-units (1/1000th of a unit).
+      The simplest way to calculate it is
+      VOUT_SCALE_LOOP = VFB / VOUT * 1000
+    $ref: /schemas/types.yaml#/definitions/uint32
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
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      pmic@30 {
+        compatible = "mps,mpm82504";
+        reg = <0x30>;
+        voltage-scale-loop = <600>;
+      };
+    };
-- 
2.43.0

