Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C184C26E16A;
	Fri,  9 May 2025 06:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746773621; cv=none; b=jKFK7HWKtOX8zzSDIV10PAV0gXyDjqdov/oEcmhv481jltGbUg2mAr2Yg1IDrhiSKQZRjsHKKpP3PpFO0HekNyioAbF8wvqv4UuD80bXp7+76pvFQG4nG8H91/vsFQhFYmSGcEfibSAJyY4ax9FjMHuDuJLGu28O07YIS2uAXD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746773621; c=relaxed/simple;
	bh=cv3RfpeMQ4Ck7UgZdFcV3vI06Yt1aRSptGNgot++bps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RmXkGrG/j+ppMda7DvJJmnyho9d0OXW5372+tP2By8W39DBYQwhlH62SE6KDT+F7BFC+ffmJhPDRxt2J+ioRDJlW/j4u2uYY670ImAzGXCbANQkRaM00j8d1uZ62e5cm4QHhwGdBnLttWmFT7eZyUnPLo5srJHVL+Gn4aNdRFa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NoiDDEoV; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NoiDDEoV"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so12949455e9.0;
        Thu, 08 May 2025 23:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746773618; x=1747378418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5LurdoLz7UweJ6Wmwk4qfD4FsF/JhV+fB9edgA8f4OU=;
        b=NoiDDEoVPfmfgozPVyBOTisCjYRqUX2puPamj63wl2vYX4cyo29oHIfi1ADxE7Wi1S
         bU5CTlTvwMhBytMfoB/epEEoa+iirr9eI/w2dQBJP+bSZeKwQIlGiOlACRW+gueb0mwb
         582JhIXy23Mn7f1IyWK0G6rMXrzC7qUI2+MuK4d12/wFUEVw8JZ3cZPFft4JYhINi9Ii
         UuCYrBSvqrvH/0CfuTl1dNAvfhraD2+PXLDMrk+YvlJsSIRh+FcogtxT0Xf6jIcTslkq
         gGoa/sjaf/wSU4uMU3LNcTSGIHJabkUtEy6w/kjKLJcsqWBtjEgAy+Yb2c4EOdJZ3YUl
         5jjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746773618; x=1747378418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5LurdoLz7UweJ6Wmwk4qfD4FsF/JhV+fB9edgA8f4OU=;
        b=kIWGxYxEtfZ0pGXGOo1zvmcvQXHfRWnyEj9xAP9cTx0Zvpi6Lyi8MrHGk/+1H74ZMr
         TtK87iDL6QI8VjmS8FxcrLrg0P1J5cBJ+QRtt7uTYJA/O2wSvxZykPtDiF6BsLq0aoJF
         9H9ND13fOl5dkEbO6Vh/jbpjntg5iKjOqKU3LTNyLxCGNenn1bfEwj1U3Dz0rwsnsIih
         k6zBzfWIMv0Qpj88sbAW5x29fYb2rJnylgDd4Y5DQYHBpnxlIzhw9kyfSRVhDs0sgie/
         O2wI4EkFfmO3jEjQ3oWOWvK5BwDN7yvS17PHohMfdFKQZPIGPCyHs5Ez3Inbx0rVITFb
         W+xw==
X-Forwarded-Encrypted: i=1; AJvYcCULmmughZFLCRzDF9KRCI1USm7lKIC0lR4Cu8drsiZsgoPUvOm6R/VZdOo/3MWVrMSK1oKxSVqVE3Nxx/IQ@vger.kernel.org, AJvYcCWrlbE2XlZRw7VqUlehAVcTY56zgMRbL7BjcFx5RSpkJegi//j5YLa7z640HdfvOjSB89CEmzRFC+qY@vger.kernel.org, AJvYcCXsXeRzwY0YumZtgDJvHzDz5AxqIOWyifP6/2pbif7hmCsOODtiBFhoeeTGSaBz39efhNHpYRZZj28W@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8PXVt3QQYg292Zth/pusxS1GAX5ldbATqWvkDjeX1xY9z/57P
	tnFtvs5FlswElzyYaHZjShFLdmSAKpF09XXj9HQw9bKRwqB0AOhtM6pAshy1
X-Gm-Gg: ASbGnctNJtmJLti10NhQG3atXk0GFpGLqdUUTjbpr01dWVYKHK7G/MEFWCTc05jtYg9
	c3B4DLTv3F6bFHK1ZLGkYx1ujK2Sej+kEGtYPsTk/YVUhWo8s7I0eFbvxhUTv+hU5R5bSEzxY4D
	5FBYe5cn5m/BWS+y/vjq+jRG24pMNmBrGUxGNnFeA6EKCljDKjJ8XxPmi1M3Rqbe0iNb62R4oJZ
	9ls94p1bUQyzc7DRavJVhi2I0QYJj+eUH5dYIInsJ24Zco4lVyxdtfDTG2Z/ylHLh44o3SP5xiS
	bENLrNg5NozQpt1KcryQ0G64zgBZy5fxj7+FlHEhceSXZ5iJ2RlJMq/8uOe7Hv2Z3A==
X-Google-Smtp-Source: AGHT+IERkckyKlmXuZnRf0VVS6j7vxJGHp2mD1teeEiyOIji9PfSnSJn4PQPjqXigCXmZZsyuvuPGQ==
X-Received: by 2002:a05:600c:34d5:b0:441:d438:4ea5 with SMTP id 5b1f17b1804b1-442d6dd24d3mr12441735e9.20.1746773617423;
        Thu, 08 May 2025 23:53:37 -0700 (PDT)
Received: from tempest2.110.lan (xt27dd.stansat.pl. [83.243.39.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67d5c2asm19276315e9.1.2025.05.08.23.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 23:53:37 -0700 (PDT)
From: Pawel Dembicki <paweldembicki@gmail.com>
To: linux-hwmon@vger.kernel.org
Cc: Pawel Dembicki <paweldembicki@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Noah Wang <noahwang.wang@outlook.com>,
	Michal Simek <michal.simek@amd.com>,
	Fabio Estevam <festevam@gmail.com>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	Grant Peltier <grantpeltier93@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Shen Lichuan <shenlichuan@vivo.com>,
	Charles Hsu <ythsu0511@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 5/5] dt-bindings: hwmon: Add bindings for mpq8785 driver
Date: Fri,  9 May 2025 08:51:09 +0200
Message-ID: <20250509065237.2392692-6-paweldembicki@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250509065237.2392692-1-paweldembicki@gmail.com>
References: <20250509065237.2392692-1-paweldembicki@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree bindings for Monolithic Power Systems MPQ8785, MPM82504
and MPM3695 PMBus-compliant voltage regulators.

These bindings also documents the optional
"mps,vout-fb-divider-ratio-permille" property.

---
v2:
  - remove mps,mpq8785 from trivial-devices.yaml
  - fix alphabetical order
  - rename voltage-scale-loop to mps,vout-fb-divider-ratio-permille
  - add mps,vout-fb-divider-ratio-permille min and max values
  - rewrite mps,vout-fb-divider-ratio-permille description

Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>
---
 .../bindings/hwmon/pmbus/mps,mpq8785.yaml     | 88 +++++++++++++++++++
 .../devicetree/bindings/trivial-devices.yaml  |  2 -
 2 files changed, 88 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
new file mode 100644
index 000000000000..3c61f5484326
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/pmbus/mps,mpq8785.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Monolithic Power Systems Multiphase Voltage Regulators with PMBus
+
+maintainers:
+  - Charles Hsu <ythsu0511@gmail.com>
+
+description:
+  Monolithic Power Systems digital multiphase voltage regulators with PMBus.
+
+properties:
+  compatible:
+    enum:
+      - mps,mpm3695
+      - mps,mpm3695-25
+      - mps,mpm82504
+      - mps,mpq8785
+
+  reg:
+    maxItems: 1
+
+  mps,vout-fb-divider-ratio-permille:
+    description:
+      The feedback resistor divider ratio, expressed in permille
+      (Vfb / Vout * 1000). This value is written to the PMBUS_VOUT_SCALE_LOOP
+      register and is required for correct output voltage presentation.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          const: mps,mpq8785
+    then:
+      properties:
+        mps,vout-fb-divider-ratio-permille:
+          maximum: 2047
+
+  - if:
+      properties:
+        compatible:
+          const: mps,mpm82504
+    then:
+      properties:
+        mps,vout-fb-divider-ratio-permille:
+          maximum: 1023
+
+  - if:
+      properties:
+        compatible:
+          const: mps,mpm3695
+    then:
+      properties:
+        mps,vout-fb-divider-ratio-permille:
+          maximum: 1023
+
+  - if:
+      properties:
+        compatible:
+          const: mps,mpm3695-25
+    then:
+      properties:
+        mps,vout-fb-divider-ratio-permille:
+          maximum: 4095
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
+        mps,vout-fb-divider-ratio-permille = <600>;
+      };
+    };
diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 8da408107e55..7c1c0cc29655 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -293,8 +293,6 @@ properties:
           - mps,mp5990
             # Monolithic Power Systems Inc. digital step-down converter mp9941
           - mps,mp9941
-            # Monolithic Power Systems Inc. synchronous step-down converter mpq8785
-          - mps,mpq8785
             # Temperature sensor with integrated fan control
           - national,lm63
             # Serial Interface ACPI-Compatible Microprocessor System Hardware Monitor
-- 
2.43.0

