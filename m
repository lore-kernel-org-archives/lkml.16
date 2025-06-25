Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0897928727A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 23:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750895444; cv=none; b=Hz8Qth00uOgfGUVa/H8U5drr7AFIgkVKDiTYh1G++sekBQ6t8WXbSX8M6c216L9NAdph20oaAYCXCw95XhsjOn5AwZbt/sJqFFgfvpgkTLGcavS9kq/BxRU6cUVtRmMMlGc5AqlvRwXYUQaB9txo4jQko5a+3X1vfDS3LHIBLT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750895444; c=relaxed/simple;
	bh=Fl+Fcmp8mz0LRfZc8oHYvXZaL4ihlM0sMQO1BXpZYbk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AqbR0CSccbzEDId0BdtW3CwIAKxM0sgMIWenPOWFuxYLqO2iMPalQ8BL8lW7Z67w4gGOriuPp8Y1PXpeaZ5BzZ66RG+f2p2qwhMEiCuXjEJHgdWs71HgMuZDxUvembdQcQBeOLkYF/yBGOMcOGC4ogKxV9nO1VxdzMpB946SuTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ahRrBFt4; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ahRrBFt4"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a5123c1533so179186f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 16:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750895440; x=1751500240; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YGuBjw/4XXCZvZaNsmrF9k0KyGZ7Z9vYK6pokbmxxu4=;
        b=ahRrBFt4ZZcwJa9aSdhOQCHoZhRNkEKXFOUczZ/WcRHzaaDpM1SmTXXfVoWiojdw7w
         2mNhYzvzgzWNBr6cF8SwbcODKFfjDVZ28vjgf5kK8GmoriNhED3043/lqVXZHNO2Df+C
         /jMbtSvNRr7bdUJBdzKxZmeNipmprad6IACET8y38RmsGckKrP0wqO5T3Ds8hFBkxbrE
         BXhBFFAAQ6nP4+iDUrtb9lkrnZfArzE5IXE9JpuxNOpZXQkPrRy5DTxLr1KzUEhtpL21
         NwK10T8+0qRvlNyklju3tzgmGgAHQYl9dV9jbZUrflQrcQdbtQ82+/YTMFGEwC8xrmM1
         gtww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750895440; x=1751500240;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YGuBjw/4XXCZvZaNsmrF9k0KyGZ7Z9vYK6pokbmxxu4=;
        b=SK9XUQ+pV6XQmgYC1EC5dlXWjTUXz7n0vfLVUtIYb0wmqZgNhvKhavu0Y83PMlhIUp
         Z221+vAhaiuzAFEvSyqdYOCNH2b1nF6baUVWbr8ofBQmvuNL1hs/IG3CZk/yWh86PfSR
         c/uSA8S3u4X42kLO5QCYTUZVxKVSvS3+k/4/lRPlYexuEb/tg8TKOxZDZ3hubreaOt1C
         c5rTU06mTmmeYxIJmgFKrR9QQWgDpFHIxkYY1hBwGgzrCXSNcpmwO5zvZQaJrvapu/Tf
         viRQYh8rATa7bGjuHkHxEQWxsh9vRzj2B9JyTfP5uZA1FotHJ42x/3l+0VWo6mr9owtV
         kzHg==
X-Forwarded-Encrypted: i=1; AJvYcCVtX3tM40eZsCrLu5LA2pl2pzmTC2+1MtGerolF90FsPh6XPYtjPv0jo/uZUtEh9KOU38WiszplETsd4A4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy3uh0LbzAvbgI3Qn1qeEFGn/zGwuiZwO7v7db5RpHoLQxQLTq
	MbL5YK5zKO201bBbpx+NLxFRtqCiEL2N0l/Sfa6nuLztaA5938bMAfmdvrucWtNOHyM=
X-Gm-Gg: ASbGncuECFub/Tpm0EUtaphEuSs7zUOODRcOmgoUcnc/toIUw4AS0oTPj+VpAYhAKCa
	2dR1VqaPp76/d2HEpPg36v0GrRMGLuAhncRCOAk3tndJ4jRFLAwmJjYZvxWVmysWmdM4P03AXs7
	k336SJad26LIzffRb7nw19CWHS8USr1cN7TwF6B7X+nau6iJ4SzKy1uW/ilcwk7BiifM20zvMxm
	3Vgfm3D0HpYQpFWZhp72QfTY6SA8Tky/Bc1q+lx/q0nZ48t3LtszHwpemLIUY85hJoIkCzqXSvo
	52Ew9OBIaLfipOEHxpjgXd/LFBRxYP1JiFoHOb7b62tiU/CfB3+6WTGuavTqCuN4X0fmjQ==
X-Google-Smtp-Source: AGHT+IEpDjYIrpImqHE+8RAtmzTF+CgQ1xyNtUnwpicY1ay2kJ/QqhSHjsjJ1ZptkucOZFRnPfleOg==
X-Received: by 2002:a05:6000:2204:b0:3a3:6a9a:5ebf with SMTP id ffacd0b85a97d-3a6ed61033dmr3619620f8f.20.1750895440230;
        Wed, 25 Jun 2025 16:50:40 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7213:c700:1417:1313:3884:915e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e805dc32sm5636300f8f.29.2025.06.25.16.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 16:50:39 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 26 Jun 2025 00:50:29 +0100
Subject: [PATCH 1/3] dt-bindings: sound: add bindings for pm4125 audio
 codec
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250626-pm4125_audio_codec_v1-v1-1-e52933c429a0@linaro.org>
References: <20250626-pm4125_audio_codec_v1-v1-0-e52933c429a0@linaro.org>
In-Reply-To: <20250626-pm4125_audio_codec_v1-v1-0-e52933c429a0@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.2

The audio codec IC is found on Qualcomm PM4125/PM2250 PMIC.
It has TX and RX soundwire slave devices hence two files
are added.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 .../bindings/sound/qcom,pm4125-codec.yaml          | 147 +++++++++++++++++++++
 .../devicetree/bindings/sound/qcom,pm4125-sdw.yaml |  86 ++++++++++++
 2 files changed, 233 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,pm4125-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,pm4125-codec.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..1b6ce8d4397b4c1c048899bd2cc4d02318cc46c9
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,pm4125-codec.yaml
@@ -0,0 +1,147 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,pm4125-codec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm PM4125 Audio Codec
+
+maintainers:
+  - Alexey Klimov <alexey.klimov@linaro.org>
+
+description:
+  The audio codec IC found on Qualcomm PM4125/PM2250 PMIC.
+  It has RX and TX Soundwire slave devices.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,pm4125-codec
+
+  reg:
+    description:
+      Specifies the SPMI base address for the audio codec peripherals. The
+      address space contains reset register needed to power-on the codec.
+    maxItems: 1
+
+  reg-names:
+    maxItems: 1
+
+  vdd-io-supply:
+    description: A reference to the 1.8V I/O supply
+
+  vdd-cp-supply:
+    description: A reference to the charge pump I/O supply
+
+  vdd-mic-bias-supply:
+    description: A reference to the 3.3V mic bias supply
+
+  vdd-pa-vpos-supply:
+    description: A reference to the PA VPOS supply
+
+  qcom,tx-device:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: A reference to Soundwire tx device phandle
+
+  qcom,rx-device:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: A reference to Soundwire rx device phandle
+
+  qcom,micbias1-microvolt:
+    description: micbias1 voltage
+    minimum: 1800000
+    maximum: 2850000
+
+  qcom,micbias2-microvolt:
+    description: micbias2 voltage
+    minimum: 1800000
+    maximum: 2850000
+
+  qcom,micbias3-microvolt:
+    description: micbias3 voltage
+    minimum: 1800000
+    maximum: 2850000
+
+  qcom,mbhc-buttons-vthreshold-microvolt:
+    description:
+      Array of 8 Voltage threshold values corresponding to headset
+      button0 - button7
+    minItems: 8
+    maxItems: 8
+
+  '#sound-dai-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - vdd-io-supply
+  - vdd-cp-supply
+  - vdd-mic-bias-supply
+  - vdd-pa-vpos-supply
+  - qcom,tx-device
+  - qcom,rx-device
+  - qcom,micbias1-microvolt
+  - qcom,micbias2-microvolt
+  - qcom,micbias3-microvolt
+  - "#sound-dai-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/spmi/spmi.h>
+
+    spmi {
+        #address-cells = <2>;
+        #size-cells = <0>;
+
+        pmic@0 {
+            compatible = "qcom,pm8916", "qcom,spmi-pmic";
+            reg = <0x0 SPMI_USID>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            audio-codec@f000 {
+                compatible = "qcom,pm4125-codec";
+                reg = <0xf000>;
+                vdd-io-supply = <&pm4125_l15>;
+                vdd-cp-supply = <&pm4125_s4>;
+                vdd-pa-vpos-supply = <&pm4125_s4>;
+                vdd-mic-bias-supply = <&pm4125_l22>;
+                qcom,micbias1-microvolt = <1800000>;
+                qcom,micbias2-microvolt = <1800000>;
+                qcom,micbias3-microvolt = <1800000>;
+                qcom,rx-device = <&pm4125_rx>;
+                qcom,tx-device = <&pm4125_tx>;
+                #sound-dai-cells = <1>;
+            };
+        };
+    };
+
+    /* ... */
+
+    soundwire@a610000 {
+        reg = <0x0a610000 0x2000>;
+        #address-cells = <2>;
+        #size-cells = <0>;
+        pm4125_rx: audio-codec@0,4 {
+            compatible = "sdw20217010c00";
+            reg = <0 4>;
+            qcom,rx-port-mapping = <1 3>;
+        };
+    };
+
+    soundwire@a740000 {
+        reg = <0x0a740000 0x2000>;
+        #address-cells = <2>;
+        #size-cells = <0>;
+        pm4125_tx: audio-codec@0,3 {
+            compatible = "sdw20217010c00";
+            reg = <0 3>;
+            qcom,tx-port-mapping = <1 1>;
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/sound/qcom,pm4125-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,pm4125-sdw.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..7241d2ab5dcf4a0d5f25a75acb33a335f93d3b5e
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,pm4125-sdw.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,pm4125-sdw.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SoundWire Slave devices on PM4125/PM2250 PMIC audio codec.
+
+maintainers:
+  - Alexey Klimov <alexey.klimov@linaro.org>
+
+description: |
+  The audio codec IC found on Qualcomm PM4125/PM2250 PMICs.
+  It has RX and TX Soundwire slave devices. This bindings is for the
+  slave devices.
+
+properties:
+  compatible:
+    const: sdw20217010c00
+
+  reg:
+    maxItems: 1
+
+  qcom,tx-port-mapping:
+    description: |
+      Specifies static port mapping between device and host tx ports.
+      In the order of the device port index which are adc1_port, adc23_port,
+      dmic03_mbhc_port, dmic46_port.
+      Supports maximum 2 tx soundwire ports.
+
+      PM4125 TX Port 1 (ADC1,2 & DMIC0 & MBHC)    <=> SWR0 Port 1
+      PM4125 TX Port 2 (ADC1 & DMIC0,1,2 & MBHC)  <=> SWR0 Port 2
+
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 2
+    maxItems: 2
+    items:
+      enum: [1, 2, 3, 4]
+
+  qcom,rx-port-mapping:
+    description: |
+      Specifies static port mapping between device and host rx ports.
+      In the order of device port index which are hph_port, clsh_port,
+      comp_port, lo_port, dsd port.
+      Supports maximum 2 rx soundwire ports.
+
+      PM4125 RX Port 1 (HPH_L/R)       <==>    SWR1 Port 1 (HPH_L/R)
+      PM4125 RX Port 2 (COMP_L/R)      <==>    SWR1 Port 3 (COMP_L/R)
+
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 2
+    maxItems: 2
+    items:
+      enum: [1, 2, 3, 4, 5]
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    soundwire@a610000 {
+        reg = <0x0a610000 0x2000>;
+        #address-cells = <2>;
+        #size-cells = <0>;
+        pm4125_rx: codec@0,1 {
+            compatible = "sdw20217010c00";
+            reg = <0 1>;
+            qcom,rx-port-mapping = <1 3>;
+        };
+    };
+
+    soundwire@a740000 {
+        reg = <0x0a740000 0x2000>;
+        #address-cells = <2>;
+        #size-cells = <0>;
+        pm4125_tx: codec@0,1 {
+            compatible = "sdw20217010c00";
+            reg = <0 1>;
+            qcom,tx-port-mapping = <1 1>;
+        };
+    };
+
+...

-- 
2.47.2

