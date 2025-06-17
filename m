Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F12290BA5
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750148414; cv=none; b=lA2ryn2hUt60uUHBwrrk1ig/FkP7sRWrS8P7AoiIOmtxpyL5kEcZ86fu3LVS0QochdXlVtbAjIZeA7bz2WsVAMJ9E5GjfzWgcFUkbvN9v1fQqnqgZM68hV0tuN7BDN/g3UhseDUXu3ZurW6ZlH3gjcICYT2qffe7U+/ohsI1iiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750148414; c=relaxed/simple;
	bh=QcClUm1ZLCCbAPKXN4VamHSf/5X+mE7f+yW0QnLfibc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j9ObiPHqf42/AHsWTfxTRpi+25tltR4TYnTg6Z1xBHOnuCSSrit7YB6dMjQP9hJDbacSki7l+d9IRZGar3Pq45yAW2LuRNpRAcRgiHIAHCF+HtshDMt3ZNC7hR79YYkCTw/8oB0Tnod3Wlms0SbygA0jCWi+RpdGEAaMfF/S8Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Z5GrbODi; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Z5GrbODi"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-313910f392dso4895479a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 01:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750148412; x=1750753212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D8FRIhQ2Woh3xq2iizepqRwoAErGxOnhjCQDU9AZzIY=;
        b=Z5GrbODi1WmDHQ5CqiRF48yObpetmBImXfZromTQZwLuLyVaVCakAJt9VfyS9z7UF5
         P9m+opDF38wUnOlX5HIEJUPmhDgs1OPJiCF88akzNbOl0J2RIJI0SVRiGyarOuRRhZ8P
         etvmclvNRFmJXE5apB+/ayQcnaNY6cF2a2PTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750148412; x=1750753212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D8FRIhQ2Woh3xq2iizepqRwoAErGxOnhjCQDU9AZzIY=;
        b=TwDOqqoS2Dy7CXI+J8r+i0xazZEES3eVEbdckeJ8ek2xifL/bHNrzXhzaf9I4OXusX
         e5N2npRiYApH+eMPWuhOfpTQg4ntDYDnwkjpXrtSum0WWpZNs1ICoMbhoNCK1DGmyses
         B2+bCtMwxPSkvSKuxygylUAMt+T+jOD6VfzigZJGGnSb9HRFRxDoHXcn+eLeiC81ZT+4
         DdpxEiQRyIToiASpGPBY11l6jh44dpn6lUNHVYuS3zSrbi28McUEnLld+witjIluCIBQ
         WxpOmPI2tb25hshxxDMTgrLvzBc7WyF4aUWZdhYLEvvwMJ01G5u78+Em4GgA2+qRqfit
         KDNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUu4uvijp8YXD69Aa3HUU7j0B6NvgeJrSYzhDMGWNoh5QqhwAesGV1CbFnb3XhYCOkS5bcZsOU1Qy9e/fk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzi2T+puYfk29ZT3Rpbv7aWji1N9AAUiFZIA3jpl3WCvEmLit3
	ylc1lje6HfdsN68VDP1R+3B1fdcoXXY/wWuocbTwhNJkiSdx8sIspDfhxuhu0m3ZHA==
X-Gm-Gg: ASbGncuE+r1rR63uvQdovfzgpopgkOTmtgaFULjXpxccU61b9ST+z7ceTLM9p07ASMi
	sF1CE33wW4pMGpowEdVYRJqL/er2b3RUvp88XC5AzLH99CkU3Bsx1yMf+d5omBSbF/weRF97eD/
	EqMPzq375nQDNl2CEZVVT0EXyxkv7mgJIQ4EeV5p/fJn0WqrWCju4FTsWOat9RFshC8gtpgfmAk
	kLbEkyW0PBsd/An5U0yzWTUDPjbP01P/xnWdejFGoLwa8o1I1hAMNbVv8H6npzPjInaiHJGgYgW
	HSF2HPxGnGrJpqHUQtBYv1PbZTXD8TR+M5l+dy9CEW4CCLIOOzdaSVeJHLdQjM9B2RDS3bjA3S5
	Pbqs7
X-Google-Smtp-Source: AGHT+IG3KNV6ixPiJvUtBGaYxn8qmkk4lCQcaXYtEk6THCxE8V+YIcx+EzSCVTlQvmABQC9D1Nc91Q==
X-Received: by 2002:a17:90b:4e84:b0:313:dcf4:37bc with SMTP id 98e67ed59e1d1-313f1dd74acmr15712251a91.34.1750148411484;
        Tue, 17 Jun 2025 01:20:11 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:24a1:2596:1651:13d8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de781f7sm74598885ad.110.2025.06.17.01.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 01:20:11 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH v3 1/6] dt-bindings: HID: i2c-hid: elan: Introduce Elan eKTH8D18
Date: Tue, 17 Jun 2025 16:19:58 +0800
Message-ID: <20250617082004.1653492-2-wenst@chromium.org>
X-Mailer: git-send-email 2.50.0.rc2.692.g299adb8693-goog
In-Reply-To: <20250617082004.1653492-1-wenst@chromium.org>
References: <20250617082004.1653492-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Elan eKTH8D18 touchscreen controller is an I2C HID device with a
longer boot-up time. Power sequence timing wise it is compatible with
the eKTH6A12NAY, with a power-on delay of at least 5ms, 20ms
out-of-reset for I2C ack response, and 150ms out-of-reset for I2C HID
enumeration, both shorter than what the eKTH6A12NAY requires.
Enumeration and subsequent operation follows the I2C HID standard.

Add a compatible string for it with the ekth6a12nay one as a fallback.
No enum was used as it is rare to actually add new entries. These
chips are commonly completely backward compatible, and unless the
power sequencing delays change, there is no real effort being made to
keep track of new parts, which come out constantly.

Also drop the constraints on the I2C address since it's not really
part of the binding.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Reworded commit message
- Dropped the enum for the new compatible string entry
- Dropped constraint on I2C address completely
---
 .../devicetree/bindings/input/elan,ekth6915.yaml     | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
index cb3e1801b0d3..0840e4ab28b7 100644
--- a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
+++ b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
@@ -4,14 +4,14 @@
 $id: http://devicetree.org/schemas/input/elan,ekth6915.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Elan eKTH6915 touchscreen controller
+title: Elan I2C-HID touchscreen controllers
 
 maintainers:
   - Douglas Anderson <dianders@chromium.org>
 
 description:
-  Supports the Elan eKTH6915 touchscreen controller.
-  This touchscreen controller uses the i2c-hid protocol with a reset GPIO.
+  Supports the Elan eKTH6915 and other I2C-HID touchscreen controllers.
+  These touchscreen controller use the i2c-hid protocol with a reset GPIO.
 
 allOf:
   - $ref: /schemas/input/touchscreen/touchscreen.yaml#
@@ -23,12 +23,14 @@ properties:
           - enum:
               - elan,ekth5015m
           - const: elan,ekth6915
+      - items:
+          - const: elan,ekth8d18
+          - const: elan,ekth6a12nay
       - enum:
           - elan,ekth6915
           - elan,ekth6a12nay
 
-  reg:
-    const: 0x10
+  reg: true
 
   interrupts:
     maxItems: 1
-- 
2.50.0.rc2.692.g299adb8693-goog

