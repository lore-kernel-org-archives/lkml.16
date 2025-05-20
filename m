Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FA82528FD
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 21:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747774882; cv=none; b=RFzlSP2F1h25iciqPRmGVENotmR+DJ9WG0wX5UG+LVYEf6VhEL0cDM8vycayY/m5HJc7f2ZeANivTgd5Ybnc7T3f8AH/Yi24LFmZMol7FHcm46tXftWrCm5EHUSWrez+a0YEd68hyDSlQ6xcYIkOYnki/INaWDi4Wqy1eWzp2Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747774882; c=relaxed/simple;
	bh=MNb997VY29duTYbBSnjPo0xjIEdAwYnJg6KevBR2KJk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uhx5c2287dXmgUND1lScTbtU57FaRJo0rk5b8b32AuoicA2hsAP5EWckvZnbqP6hIBgXs1aHkVoyS33noL0vZrT/6C4oyhrnIa16D+oGgziM398MxSX6dSRNzQEXsApSYsLyff7mldm7i7VjEkyEMh7sVljn9Ll9E92AhQ7fGH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=v7eAYllx; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="v7eAYllx"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2d522f699bcso2104305fac.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747774878; x=1748379678; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1AHx1N9kF4xQ7AtLhfpX6F3+VzX1t8msVEo+Vi5+ENw=;
        b=v7eAYllx0ujUgJqAy9LVHphZOanWxQSdhGhUqK+mslOznSk1qMITa8caP9qw9nW0fj
         WRIGal/UYWPzPNOpFX424JASq3NkhzQ3ywARdcsGkgmk6ENtyNb/s6Q328jtf++B+2Uq
         7SxZwVdwPCDZCH+IielplsVYf/YaQFdW16En/hfJnDFaPpTTKWEZ/8X8UxkmQvFQARtO
         On1EHSdlKaEW9YUYHG7PR4OIoy576hqzmKMvvhnTAoidT33EUOK4ZcDugISZIZoy5laU
         p5T5y7CAyhT/aIbGrhI7TumgP5cRmwUEuZ2seS3vNF7RQpzmBnJPVPSts0L3N33v7y7o
         GZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747774878; x=1748379678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1AHx1N9kF4xQ7AtLhfpX6F3+VzX1t8msVEo+Vi5+ENw=;
        b=nLTkpz71SyoHf8H3uYW3ZWJuMql+dLz4u6Ctruc+ifPH4E2DabGDAb6Gpqu3BSFhlr
         5l2eb03b5h63kq45ZYBcO7HW2qyGnkS/QHbgJnlrQwiq03tNL+NT6sfZap6fAvv4p6ix
         squLte4Y5odMYxBCE/WMGWultSw3cn6y2ojdzH1pPNplFJvRFodXcHewCqi/1U7SS38V
         dvPh1loj//fU85BX96ei+pxEDD978odK3haCmO0O3Qw4c4We4+7tyIZiEp+IYIICS1km
         61249QfX8GB2GG0OauuZ9HqBvcBDqWQYmyOZjQKwnJP4c99ppAsrKn2Xv6lNNpykt67a
         4J8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXKQieOqnQcP8XfaKpSKLtLvYNzqw7IvlVI+G0HYQLCM37zF9JOtyE5NRGYyv5n7s2ogVmqgLoIPzFAiQo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjEcdl3KGFm1a10bnJJi9APL2cpgsAfZMHycsNd6ek2sJRQdA1
	Cx8GNmvSnQHD7vFp5qQU9eqWr8jPBgcGdCeawJarFoRqrHuCmA3KwpCJZkQ4qmbtoSM=
X-Gm-Gg: ASbGncvGWHlN2FXESG40gIqon9Eadw1RhsjrcGtldbHX77FtvTHgqUd5vIr9E3Vih4H
	YivARa9jJ7Cia7Az74CTssPWWh2clKZsqKXygbWMcC3t9VJvT3qf2pkxsQbvNbUkT2olX50LgNB
	LoM6bcYTNMrc78yZIgR1WIDwyEyW37lYp4A6+DH15b1oSo//ZHg+NPFi7S5IRRZ938ZqjfdBqlw
	ZVE1FUDdhrdyvwbWfxxaaGX0uNDyrr5Smxh7KyhF/pQoGi3E5cFj0v+HXg4tvldTPGfwBbJYBkL
	1aIEObG1s1ZW+FMUuzOK38VNxycbfMbIrdFWExHp7HhCsZBDHCvvtBWfwjuK1ReAF8s=
X-Google-Smtp-Source: AGHT+IE1xUkgbFQC35Y0QlpuBNk/KGJh9mJSWSstsMo6EMLXlxglnHtNEPMvXcGpOG0aLqcmyYuNcw==
X-Received: by 2002:a05:6871:4e82:b0:2d4:c55b:199a with SMTP id 586e51a60fabf-2e3c836ad78mr9977999fac.18.1747774878651;
        Tue, 20 May 2025 14:01:18 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:d77b:6acc:2ad1:8ff])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2e3c0b2e1a7sm2348470fac.48.2025.05.20.14.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 14:01:18 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 20 May 2025 16:00:45 -0500
Subject: [PATCH 2/3] dt-bindings: pwm: adi,axi-pwmgen: add external clock
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-pwm-axi-pwmgen-add-external-clock-v1-2-6cd63cc001c8@baylibre.com>
References: <20250520-pwm-axi-pwmgen-add-external-clock-v1-0-6cd63cc001c8@baylibre.com>
In-Reply-To: <20250520-pwm-axi-pwmgen-add-external-clock-v1-0-6cd63cc001c8@baylibre.com>
To: Michael Hennerich <michael.hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2239; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=MNb997VY29duTYbBSnjPo0xjIEdAwYnJg6KevBR2KJk=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoLO2PpGPGzaFtijjrIrK2whRmAsYzrmMYRTHdz
 Qnt2RGu0laJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaCztjwAKCRDCzCAB/wGP
 wGlqB/9qdtBuXL9f7pR4TQ9l8Xk5M/oD9co95D/ekxp3EZ/YS4c9MiCwA6UslD5WSfEBbWSK3L1
 j9CJDV7A0PdO6b4M2KK/Af/BoMC4QiaoSqcqgfwKGSpDfW5CA08/7kyZ9ZkmqnF1NBJ00tr12lu
 B7Vym7rS7ZTZvyYmOwX6670IeV9dsTBP/pF6XLcRSbleiL9SpGl2TTjgIM+m8OC24NcDMd33AGo
 XU80Dv7yaRBOK6r2Hrkqqh50lYJfXLs/TDNUt7zBaEK2msYeW83ZasSXcm8W8v+0LtY7t+IKnVD
 NZU832t2I5jatD9Qck1y685jQuTdG1NIncQiWAhmItJ7Gzh5
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Add external clock to the schema.

The AXI PWMGEN IP block has a compile option ASYNC_CLK_EN that allows
the use of an external clock for the PWM output separate from the AXI
clock that runs the peripheral.

In these cases, we should specify both clocks in the device tree. The
intention here is that if you specify both clocks, then you include the
clock-names property and if you don't have an external clock, then you
omit the clock-names property.

There can't be more than one allOf: in the top level of the schema, so
it is stolen from $ref since it isn't needed there and used for the
more typical case of the if statement (even though technically it isn't
needed there either at this time).

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 .../devicetree/bindings/pwm/adi,axi-pwmgen.yaml    | 26 ++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pwm/adi,axi-pwmgen.yaml b/Documentation/devicetree/bindings/pwm/adi,axi-pwmgen.yaml
index bc44381692054f647a160a6573dae4cff2ee3f31..90f702a5cd80bd7d62e2436b2eed44314ab4fd53 100644
--- a/Documentation/devicetree/bindings/pwm/adi,axi-pwmgen.yaml
+++ b/Documentation/devicetree/bindings/pwm/adi,axi-pwmgen.yaml
@@ -16,8 +16,7 @@ description:
 
   https://analogdevicesinc.github.io/hdl/library/axi_pwm_gen/index.html
 
-allOf:
-  - $ref: pwm.yaml#
+$ref: pwm.yaml#
 
 properties:
   compatible:
@@ -30,7 +29,13 @@ properties:
     const: 3
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: axi
+      - const: ext
 
 required:
   - reg
@@ -38,11 +43,24 @@ required:
 
 unevaluatedProperties: false
 
+allOf:
+  - if:
+      required: [clock-names]
+    then:
+      properties:
+        clocks:
+          minItems: 2
+    else:
+      properties:
+        clocks:
+          maxItems: 1
+
 examples:
   - |
     pwm@44b00000 {
         compatible = "adi,axi-pwmgen-2.00.a";
         reg = <0x44b00000 0x1000>;
-        clocks = <&spi_clk>;
+        clocks = <&fpga_clk>, <&spi_clk>;
+        clock-names = "axi", "ext";
         #pwm-cells = <3>;
     };

-- 
2.43.0

