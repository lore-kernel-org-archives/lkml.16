Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB0324633C;
	Sun, 27 Apr 2025 08:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745742355; cv=none; b=BCIQv3/lm/F6nPDFgk9sVwPzfkBzwfZdzJaRYOpFTeeXehZE55nNUWikqsa1vWwuWAw85iycanY2yQ4/WDOpaqAIDsxzltJa1cB2nvLqUkshf6znuCRR4cm1pyX/fe4TGGjxu4kb8uiPGZJrfV6/L+hpg+hK/CT6XX3SIznVx+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745742355; c=relaxed/simple;
	bh=eVqAbRf2LU81j02LwChbq9MHSwHQPr/AP8WU7YYB9Ss=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zi48waVuKe1Bbz+1vl05vkgAyNrNG6qGCLwjf6oLtCbtXe7ZCRyq+PUfSulfNv3AjW8knkcbjLpRTEb417Qc1DlsmW5nrwd0etVFLxA7di0d5ktrDl8nA/iees78nyKXhOhpZ8ICeuQwF+m0EV4n/GIZuwDwI4cmeDdvIj55T58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ePAq7bbn; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ePAq7bbn"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-736c277331eso4550334b3a.1;
        Sun, 27 Apr 2025 01:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745742352; x=1746347152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFIDnjjBixCsqIHSTkUHSF/akN3O0qOzMZ/jw6UNaRw=;
        b=ePAq7bbnt7xFx3ZY94sqoqTkvAXU80W5oAcvjLfBfxEV4x+m+iGkejjr7dbDcoRptQ
         dICBAG2MEbGlYYrEejE4CmwUOosa+BdGehFjoY2cygbDYLxmWTAgbvSuQFBcIv0EQc8U
         7SlmjnN7gnTSH/9HPPGYl0WbXxK4EhW+39IDo9fLGhndstBB0thnx9kcmAU3fw/03A/s
         hRCOnsyphLfga6xWJVYPlVW/b6NHAIzzfsywSHnmmJo/gb/pv5AK1T6aMR3wYdE9l6gk
         IH/zABDvAvHGFsN3+v9UjWoS5DCXw1R3e2IZbS+cDV+XOdkCnkME9SjDbJd0WDggsSse
         tLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745742352; x=1746347152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pFIDnjjBixCsqIHSTkUHSF/akN3O0qOzMZ/jw6UNaRw=;
        b=dsmHV5SgzHl0mWcdg7LF7wiYsXQxQQMzOr+nNTzBI4fUvQXuGNqhyWTp1Q14F/pLhy
         NIfqzzUpfasmu9n1WILRA1hGHXoH8DJ3mcNKzaTaVIjOMlDLrBH8feBI194N+/eUxpdp
         yhJ7FjNme1wFwB1l9SXfhvobahAIMIppd/Ft0c5dx2xRRp88qnJc9nKk/elqmFCwRiKC
         KBDt9wjL40qgHvBe+vB6iNf0byq4q2Iim4wy+S9QRvZYdzG9d6FIrYVSlLDSESxEVy2S
         DtrW5pG7MmFwHgdA3AA+07tqvK5Teqj9cHWYVFNQABPV8O4aRJd5p9leHz0wX137V9A4
         gDuw==
X-Forwarded-Encrypted: i=1; AJvYcCVtaPErhGELnWeK7VFNSgBvj3HZLX0GRdFpT0JSiIdBqQe6A4bRezx++7a1hBL4BSZZlp4GnaTt9dzoAj+O@vger.kernel.org, AJvYcCXDfsinQH8cRWXnHN2qo9JkhWIYmQKewOlpDSKXxaAAPzQRnfJ+/grJQRw0JGkpMva1KH9ZCnWhUtar@vger.kernel.org, AJvYcCXNbmnINrK+OFPhTjTz4arvrfq8hpI3X9M99PdKCU3oWIyk0N9GkLqY1A38FAtVwZjmtjrZntWTcf2V@vger.kernel.org
X-Gm-Message-State: AOJu0YzK2NTlGmMvcwRAUa4Y+yEnta7d/3pnB6U1Sv4s6Tm9we5lYx71
	/eHZF4xkoq7e77zNRZurryXy4e/cMeJCmZcrsUExtEtex4a7xhdU
X-Gm-Gg: ASbGncuuUZQVARtt9KmRORJPN3Wm4loLJMsyMs38kR4DiTKMla32Y4I+gOXa663h9Ti
	bJVcdDV2Fop/GSfTa1dob5027aDA5M25BnwuMKD8Ef2g+4jMDpFeyLaZ8REH1/z43iS9Cgem/k9
	QcDN0mnst5Zdvs8R/RB0VlLkQFNHr1AT+oEZwOtMMSEtAZMF1dTUE+QtKX0aR2qIs4KUAjeKGr1
	DXDVTiPtNm1Kc1tKlKLDXKm6eVcmhoHIgs+Hrx4qfD4cCPY+/qPv+qbjB8zY/0o1c/sCf2SFZJA
	841V+tInpuKDMB5SmCls0VXNyTNdGaTpab2MSJo2Ji5AyxNfgVkFiA==
X-Google-Smtp-Source: AGHT+IEE9tESNitS340243NR75TTRy3mJOc1Opl+pT6NC9QcFHEBSD+U1fuYWl2jRI5ij6l5EOhyeA==
X-Received: by 2002:a05:6a20:3d24:b0:1f3:26ae:7792 with SMTP id adf61e73a8af0-2045b5f6042mr9104900637.18.1745742351816;
        Sun, 27 Apr 2025 01:25:51 -0700 (PDT)
Received: from localhost.localdomain ([14.171.43.210])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e2549f570sm5900852b3a.0.2025.04.27.01.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 01:25:51 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: andy@kernel.org
Cc: geert@linux-m68k.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	christophe.jaillet@wanadoo.fr,
	corbet@lwn.net,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Nam Tran <trannamatk@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v8 1/5] =?UTF-8?q?dt-bindings:=20auxdisplay:=20add=20TI=20?= =?UTF-8?q?LP5812=204=C3=973=20Matrix=20RGB=20LED=20Driver?=
Date: Sun, 27 Apr 2025 15:24:43 +0700
Message-Id: <20250427082447.138359-2-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250427082447.138359-1-trannamatk@gmail.com>
References: <20250427082447.138359-1-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The LP5812 is a 4×3 RGB LED driver with an autonomous animation engine
and time-cross-multiplexing (TCM) support for up to 12 LEDs.
It supports both analog (256 levels) and PWM (8-bit) dimming,
including exponential PWM for smooth brightness control.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nam Tran <trannamatk@gmail.com>
---
 .../bindings/auxdisplay/ti,lp5812.yaml        | 46 +++++++++++++++++++
 MAINTAINERS                                   |  6 +++
 2 files changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/auxdisplay/ti,lp5812.yaml

diff --git a/Documentation/devicetree/bindings/auxdisplay/ti,lp5812.yaml b/Documentation/devicetree/bindings/auxdisplay/ti,lp5812.yaml
new file mode 100644
index 000000000000..fb94a6336e16
--- /dev/null
+++ b/Documentation/devicetree/bindings/auxdisplay/ti,lp5812.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/auxdisplay/ti,lp5812.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI LP5812 4×3 Matrix RGB LED Driver with Autonomous Control
+
+maintainers:
+  - Nam Tran <trannamatk@gmail.com>
+
+description: |
+  The LP5812 is an I2C LED Driver that can support LED matrix 4x3.
+  For more product information please see the link below:
+  https://www.ti.com/product/LP5812#tech-docs
+
+properties:
+  compatible:
+    const: ti,lp5812
+
+  reg:
+    maxItems: 1
+
+  vcc-supply:
+    description: Regulator providing power to the 'VCC' pin.
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
+        led-controller@1b {
+            compatible = "ti,lp5812";
+            reg = <0x1b>;
+            vcc-supply = <&vdd_3v3_reg>;
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 7940ddd91196..241c5441e239 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24016,6 +24016,12 @@ S:	Supported
 F:	Documentation/devicetree/bindings/iio/dac/ti,dac7612.yaml
 F:	drivers/iio/dac/ti-dac7612.c
 
+TEXAS INSTRUMENTS' LP5812 4X3 MATRIX LED DRIVER
+M:	Nam Tran <trannamatk@gmail.com>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/auxdisplay/ti,lp5812.yaml
+
 TEXAS INSTRUMENTS' LB8864 LED BACKLIGHT DRIVER
 M:	Alexander Sverdlin <alexander.sverdlin@siemens.com>
 L:	linux-leds@vger.kernel.org
-- 
2.25.1

