Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163591DED56;
	Sat,  3 May 2025 09:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746265333; cv=none; b=h7iA6o/H/2/ifqnVvRHTi0G2FqZ5DueilGQrv9mfoDn21TMo3k5PQEO+xdQpysfhGWqJNErjTPEcyxc5v1uF04ZlsJUEgm+MNbuvdp81l4lPtb/fTSlJg6bitjVRFvs+RqERTUeDyHKWM4TrFyK3ie+naxIC0XcO7PCHO0xA01w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746265333; c=relaxed/simple;
	bh=PgdqQJzcv++pDXkLbFdX5fPWU7bzSr2iF7bRL5S973A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MM5MP0ORRSIOY3iEkfb0+tF30lzDZbsLcse5mBFUgIawb88vI6OB8mOd9+M0+lkDqzOUFjnRQhZ2qY5F185kcLuJI+/Cs6g/+SZlswanT6t/w8vUJZ+pkHMfRE7XPpJY1ALcBdhliMjsteRjC2mhfMWWXnzR6h78xgozLp+pbA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YJ8M/idH; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YJ8M/idH"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac6ed4ab410so450596766b.1;
        Sat, 03 May 2025 02:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746265330; x=1746870130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GQIWia6L0Jg178d0XFCtM6bTApJzcTaWvyUuVorr3lk=;
        b=YJ8M/idHAmTfq3kskuuVL4RczfwA2ueMAE9XeUYh6uvkfZ09ULcRI+j7qz8cBU3d4x
         5D6JwdiKBIH6qVc6+xN01xnnIIiv4Z3gc91CpC++o508yeV3z8iyfmKjB+AZm4VG1s8q
         Vmj/Ru5L2fSkJpEB46HV4GuYjTDb8/pEZfnKhGuyBbK9UudV+LT8rRfns4WmNu2ZPkBH
         5/rbOsqNN6Sg7E9GjdwroYbR52Xt5QlJbucKOB+o8O/LM2MeG6RhCHuZDNcfqbBFeuEQ
         BCaT4Q73IW2Teani3Zcx2+AhCCbOA+NprEs721wJxGoLd4dVStUPnQacyZkLd01TrylN
         43HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746265330; x=1746870130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GQIWia6L0Jg178d0XFCtM6bTApJzcTaWvyUuVorr3lk=;
        b=eyN+aDwWBoFL4RcxQjEONasEoEf9GDCUHjOyQWcfYl/J+R7ifcwEV8Y60IhYjP/Wq/
         Sgd7/iJG8LPZ1IDJneXFS/fLcnrMLJklyPabau+DRPZJNWl45YudMwh7uMxJFbQo3wmv
         cW29z6VvRymzmvVJucii9Y1taopBOc5QR4Vjo8pFKxwAowVll3JeYJ9WsD77LePf8VZH
         4P2MtH1kc8MA78nf17qEkSY2aMIVTMGRVf4mpq84VzsN1WhtOVYxAcki2UPkupWSPuvZ
         vXFLuTfRfCw8mQejMDR7egiH3RV7Z9DF6NxUi5wadIns4VTvfr8eJHVM2uKp9KU7KRAU
         956g==
X-Forwarded-Encrypted: i=1; AJvYcCUk/0fJT3LQT/QF58I0MvWQh8eFqPFxnlgoTTMqnysIY2Ftn/Nf7i7aGNVej7g9KMLgsiIkFRFucVZi@vger.kernel.org, AJvYcCWHm2jeP5WEjr6bxS+MQf2p/Rhl74rsRYzyu1HWnQ/VxfaM/2onzDnpc02QmuTrYx3sJNjsvep3YS8E7SDp@vger.kernel.org
X-Gm-Message-State: AOJu0YyvQa+VuKLGhjNL9FIWnE9fpsbjSD+pKXsvctT5YpgG6kFOs9Be
	Cksx1qBlRPQ0QhRHd7BIO6m3v9pW1jOL1P+iMAjzjANwUGfvsjL5
X-Gm-Gg: ASbGncuAclqemYfBThL1DjSfh5dV/DLgezeu4nP097zf8JX4bgxstMYu5JRRy7WVLNd
	BI2apVWGI37xhnMjg8aOdnRn2/pekonVpsetE9CNbHxvevW1EayWohDHSaCkMgRtQ/zEpIO58/r
	UBsebEnt2g/FyDpsi1yCasFzBz6BbezZS9hV8LYAcTvf98MmXNbbXfz3lcfNURb1KfSj3m8vvb3
	I8DaKJwVDTxL+2NRO0b/i0rH3/jLmn4FV8Q2uhIUrYpzWqY+mCYP3XACvDLQZUTSEz3oWannRQg
	64p5K7m9xqiL95j1IDW/T7QRbwCPOEXL
X-Google-Smtp-Source: AGHT+IEWVZdeRIEcQe/WQcAQSf3Fxjah27t1YDOGSRy6oh5d/Kd4cFjWpAzj/YQqTbYJYVpYyudOnQ==
X-Received: by 2002:a17:906:c144:b0:ac2:7f28:684e with SMTP id a640c23a62f3a-ad1a4896e37mr42380366b.6.1746265330130;
        Sat, 03 May 2025 02:42:10 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad18950e3ecsm169103966b.160.2025.05.03.02.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 02:42:09 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] dt-bindings: display: panel: Document Renesas R69328 based DSI panel
Date: Sat,  3 May 2025 12:41:48 +0300
Message-ID: <20250503094149.29201-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250503094149.29201-1-clamor95@gmail.com>
References: <20250503094149.29201-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

R69328 is liquid crystal driver for high-definition amorphous silicon
(a-Si) panels and is ideal for tablets and smartphones.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/panel/renesas,r69328.yaml         | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/renesas,r69328.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/renesas,r69328.yaml b/Documentation/devicetree/bindings/display/panel/renesas,r69328.yaml
new file mode 100644
index 000000000000..e062619e71f8
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/renesas,r69328.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/renesas,r69328.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas R69328 based DSI Display Panel
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+description:
+  The Renesas R69328 is a generic DSI Panel IC used to control LCD panels.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+            # JDI DX12D100VM0EAA 4.7" WXGA TFT LCD panel
+          - jdi,dx12d100vm0eaa
+      - const: renesas,r69328
+
+  reg:
+    maxItems: 1
+
+  vdd-supply:
+    description: Regulator for main power supply.
+
+  vddio-supply:
+    description: Regulator for 1.8V IO power supply.
+
+  backlight: true
+
+  reset-gpios: true
+  port: true
+
+required:
+  - compatible
+  - port
+  - backlight
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@1 {
+            compatible = "jdi,dx12d100vm0eaa", "renesas,r69328";
+            reg = <1>;
+
+            reset-gpios = <&gpio 176 GPIO_ACTIVE_LOW>;
+
+            vdd-supply = <&vdd_3v0_lcd>;
+            vddio-supply = <&vdd_1v8_io>;
+
+            backlight = <&backlight>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi_out>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.48.1

