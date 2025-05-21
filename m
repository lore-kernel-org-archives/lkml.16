Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0449A26772A
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 14:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747836618; cv=none; b=PYWppzKH1azjBgdWytV/duaYi5jrA5EisOWW/EPEabW6tYFOgenkeVm2qIBhODoVoXpY05gK9PtlE93cE49wCHZ+aS6xKQtwfDgUhbLbVgoN8Nz2YxjNBdkHKSlBrBQBI6sGGpz2sCr/8pTO9Ho8Mb3OrglS4XmhLZiqrFy5Hz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747836618; c=relaxed/simple;
	bh=i6TqHVApdFZ7l56C4UPmAvw1wJhv5bQhSJN/7PxnteU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BeWjMMhW93ivqOpjJnrOC6mrb6dVHYYOakfNaDzrHoTTU4jzdoJhIh8FfuLjjhaoib7Mh65XJPSXpHHscHJPBnx5212tXtH62QTBDW4PKZ2IgcylS+h5zlTgbLqIgiMDgkmHVJl/Wbdd3QUtpXP6Tq+K6TWeqE2NhaI3nCzAEyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=pbJl7UpT; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="pbJl7UpT"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ad52dfe06ceso580604066b.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 07:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747836615; x=1748441415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CTkOFfYMZ3y3OldHS+qgsfJuEURwbh9hY6q/q0wMKX0=;
        b=pbJl7UpT5Rkppv8pk6Ihpd7xwOeRTIB/BD60o6HK48rjmYuDuCM4MhocPa1s3rV6YG
         G76/iIu2+3IO3y31qMsSftusVtTWR5K/NoQX7A3SW+xgNiF+6MyVLuB7G2sYcR68URAJ
         ZQnRsFrmUnFkzKnIptRNcEf69kHavFmBsyIe5mMtvkKBTylrW9kG0dyMch5gyD1lKuss
         GeGIPAxIVAcBo0/6cvvwD83yStjYcZgL7paEBqVhpvxFJMVT/hnYCF9jA4PYvoZG3LNr
         wknn+eDM7cRDuqEMzq9ajtOUfggKyYqSPV26nocvG9bnvubPcpK6Lb1ypG3Uh/lJ91FS
         vZmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747836615; x=1748441415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CTkOFfYMZ3y3OldHS+qgsfJuEURwbh9hY6q/q0wMKX0=;
        b=LFpDc6eKbdSvs/CJWHJl+o0pv6neFOEbzdkRnBSdjbvg/TP5149pr/BfCoZxgCiqIX
         /vmFFtOrxJH7IluOmb4gcsZB/G/wRSPepFuR4wDtVqi7Qlo+e+R8FXR0aZKzVcvKToUG
         0zNUYxfoRd8ArY/jG8N1zFnrUU4nXx9KCBgH0GWauDsi129bTUUyZeBlSbkjrPfAJqdW
         KJnlslpgDrKOjAGm7SHcWgWMd1yackgrDNVLV5/uzKsABuYBpm/EFb52wN8Eu4FUROOi
         ppsgx2EuBox2+scjRCT7cSeALtNycSnUqSdXt8ZhbtJAgU7jsSyvqv5c1GqSmbH+95mP
         +19A==
X-Forwarded-Encrypted: i=1; AJvYcCX3vwg3ZOUCDU/ImttTrybHsiCRnsOlEMfCiMyD3Cbpms/EhRE+Vg4ydcEv74ZP15hXx5UyQ1rBvXw3Ftk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgDgqGhI0Ea2aTPsqaDmLKOSExQgXxKRxV58o0MSAu2HO66/XG
	30uyuZpu7zxR5E2G0JzS49YuHzxsnistzDeYcPBSzHGSK1GO02XwkHL0Xa6uvlk6cWE=
X-Gm-Gg: ASbGncvJZqjGbWnSmPKX32GF+UIMSKdlFgruzilWWY6T+qnA56cu+i2PZjz3fiuH9uw
	4TsjkEfegHipKr+NBfTIrNjPSvinx+fjBdpsDSZIFC+eolBVi+JFWTYGK8imLd5wHleT6SeHEXA
	QbsasnmxwvRir8qrhcmhyT76cv2RLWAZ2Qr7WR39d1E2kjScNWyW9T338EMs/ZtSXWTSfk9LoTA
	axJgMPYRO8cv7YAX+tW2tbDzOWFjDWn2a4Y2zYxWWB2SDyBxnBmYHQUVIVwQJrH4V6IPlNv3aVr
	UN0YFj2NXbW0gyctxhgeG+YaxWkSPcC4C2/iQ3lL87e3k/sYqzwUpzr+a5aZtteCo9W/5UmuER4
	CPPSq
X-Google-Smtp-Source: AGHT+IFLlDXtdMoYXukkCC8sPd8xH42J3h4acLeVvcHYzKInEmtzF2VU3mVXe4/z28RFNsO/iS7XoA==
X-Received: by 2002:a17:906:9fc4:b0:ad2:450b:f8df with SMTP id a640c23a62f3a-ad52d468132mr1557492366b.8.1747836615237;
        Wed, 21 May 2025 07:10:15 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d271916sm914552866b.69.2025.05.21.07.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 07:10:14 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	yoshihiro.shimoda.uh@renesas.com,
	kees@kernel.org,
	gustavoars@kernel.org,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	john.madieu.xa@bp.renesas.com,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 05/12] dt-bindings: phy: renesas,usb2-phy: Add renesas,sysc-signals
Date: Wed, 21 May 2025 17:09:36 +0300
Message-ID: <20250521140943.3830195-6-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250521140943.3830195-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250521140943.3830195-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

On the Renesas RZ/G3S SoC, the USB PHY receives a signal from the system
controller that need to be de-asserted/asserted when power is turned
on/off. This signal, called PWRRDY, is controlled through a specific
register in the system controller memory space.

Add the renesas,sysc-signals DT property to describe the relation b/w the
system controller and the USB PHY on the Renesas RZ/G3S. This property
provides a phandle to the system controller, along with the offset within
the system controller memory space that manages the signal and a bitmask
that indicates the specific bits required to control the signal.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- replace renesas,sysc-signal with renesas,sysc-signals for case where
  more than 1 signal should be described with this property
- Geert: due to this I dropped you tag

Changes in v2:
- none; this patch is new

 .../bindings/phy/renesas,usb2-phy.yaml        | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
index 12f8d5d8af55..e1e773cba847 100644
--- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
@@ -86,6 +86,16 @@ properties:
 
   dr_mode: true
 
+  renesas,sysc-signals:
+    description: System controller phandle, specifying the register
+      offset and bitmask associated with a specific system controller signal
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: system controller phandle
+          - description: register offset associated with a signal
+          - description: register bitmask associated with a signal
+
 if:
   properties:
     compatible:
@@ -117,6 +127,18 @@ allOf:
       required:
         - resets
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,usb2-phy-r9a08g045
+    then:
+      required:
+        - renesas,sysc-signals
+    else:
+      properties:
+        renesas,sysc-signals: false
+
 additionalProperties: false
 
 examples:
-- 
2.43.0

