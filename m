Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD39120CCE6;
	Tue,  1 Apr 2025 15:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743522354; cv=none; b=BNDanIIzDKPOnWdT1Cd3xLb08f5fYb8gaGFUAPIa1eGjGJ43i5nCgXSYjDJzEK1ClxyrkiR8ANqULu7nWU5/LxVu9vshVmDUP2HTVRzwL0eqkD3FoaX8Uizq59VJwwsE6yDIPL+FyNbzDmEz3CJLLmNBTgnQMBQQ2cpi8cCKA0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743522354; c=relaxed/simple;
	bh=jtozxlDlFArb33Vwn4r3NVMWeWlV1gMBeUBT/QzmsQA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kWoGVFuuVTh6O3yZJsOvZi9iSJzwhZsz8vD1J6KZ+E2E2K/d7A8fTikjkEycgUfdY5QxzRzGaSHDAoOisfikh7m4x+UL5Y3deMLbNIpQTnJp6kKbLjeT6J/wTM3p0Pa7ppiwxlIIAkOQB6Z6z6mZlB7F8KLqxMuSPACxe4t3EGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RBoetPbq; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RBoetPbq"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cfb6e9031so51800925e9.0;
        Tue, 01 Apr 2025 08:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743522351; x=1744127151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gu5G8CnhO94dSAWaShWe9FJyZsw97QYskm73IppyfbE=;
        b=RBoetPbqjL3UIS9Px12IGv4xi+DDsD+0NzOQic6HS14IuiEo3/dsIJiJ3urS/EnO4B
         vHnIaUPK59Ez2/cPeVIp8fV8EbR5zlbODqTNY6uVRan98kUTsqcEIdQXh2Uz7LbCMrvL
         i2QzN03rFR3zMHiL4Qw2sdoWRz1ZV15qfLgnThu4tv3D8Z47ehl1GX+FJEKQtwLQii4G
         5pe7ZQ3fAIC0RMCiJ61OLBb2bey0uaqK25QUb8esbsFxVSR71uNsVZXObyiV4p/V9K4o
         vrpWaBSg01MqQ+yN4KOS9qfR6Oht4gQq44hY40Lz3qHkIxxwVhGBzlRUczk+yVRqDkzC
         8tSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743522351; x=1744127151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gu5G8CnhO94dSAWaShWe9FJyZsw97QYskm73IppyfbE=;
        b=FBL5t3Tuc43bmJEGJ4t3O/53ACATYhT6ymvB55KkVy/ri7xrNDw0NVxCEo+mvsqm9a
         fGrSpcGkRfzA8JR7N44BABw/03Z0ol/TV5303wm1NlSuxHIx4nwapIOEa8nVbjxuPVjv
         jgRjWC83lgV5Dsgcsu4nu4N0MSGDeQ4Bb2AVdqKZsnczlR4ZYez3axKNF4aYo0q8z9mh
         /qYbjHK2AQeKOPdVE8f8NAZnyw7GQHr5DCgv7/61y63QE8tTfEqrvyL6WRUznP6K1C55
         ICFXpIkWTYzhROnVtsFlpB2xbz3W2wCpaooj5yfBxmvPTmA8NfPgBZHUDLPR9sLTAVV/
         EvVA==
X-Forwarded-Encrypted: i=1; AJvYcCULMhDiOvUPYCOzW6i4UK24eNbpUNKdtNnDTWTOloDQP8xp4Kk8dbQE2H4hG2AYVCwgdlBbWdJ/IXJ6@vger.kernel.org, AJvYcCUMBkVb+y2fFIllIsZ0CdmbqOJHsrf+ExAImJIBXHErrMD5ynDuWuxYo2YqaDjO/Ro8w3RYHQd/XNt+o/d8@vger.kernel.org
X-Gm-Message-State: AOJu0YxOZqMh4um48gf2Ige7+fjqVwzs4oRViq0PcelqeRRkrBRtkkKm
	MRyqro2Gch3c9cbINFzx+TIOgaISB0xO/cEN2IzVK5XQceO/dwo7
X-Gm-Gg: ASbGnctwabjbxsdaGHwm8LSlpQpbOEdqtFeiK2qfQh1+jiUJQABSDkAeg8ia5xjHSUb
	XWwBT8+ZolCaR/LrkT7kMjOoH3BhhnmyfHIZ99khb07ezkO21aev7cV0Ptj5/Zu7WiUKjR1W6pR
	9M3RtvRv/HE3kdpt8AswubYVAJfqWEONzE1DHBPYbMWtmEshDYmn51yQxlggZEf3U01V7E7A+PI
	HHAiwdSltfoir+ihUZtoBNhL1wKKOaFclTLaeb1cShCwYyk76YbsTdBFrfftFrZ5yHNhgabbEJk
	RPVsK7ydLbc1I9oc5pmP2KewaPilMHjiv8GvKaBguSlIHzglIgitCKD6cSIZRaFvLLbvQdhyNAH
	e0dT9ZzQ=
X-Google-Smtp-Source: AGHT+IHGjpv3EKCnHFF5eKJe9tjoaQRXwwsvagQBmS5kvWyHdixkP+Aak1uOZaWLdm7A5+xOdO8cRw==
X-Received: by 2002:a05:600c:310c:b0:43c:f575:e305 with SMTP id 5b1f17b1804b1-43db6227bb7mr114695995e9.8.1743522350993;
        Tue, 01 Apr 2025 08:45:50 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8ff042bcsm158795735e9.28.2025.04.01.08.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 08:45:50 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/6] dt-bindings: dsp: fsl,dsp: document 'access-controllers' property
Date: Tue,  1 Apr 2025 11:44:00 -0400
Message-Id: <20250401154404.45932-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250401154404.45932-1-laurentiumihalcea111@gmail.com>
References: <20250401154404.45932-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Some DSP instances may have their access to certain peripherals
conditioned by a bus access controller such as the one from the
AIPSTZ bridge.

Add the optional 'access-controllers' property, which may be used
in such cases.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/dsp/fsl,dsp.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
index b8693e4b4b0d..e610b7636a08 100644
--- a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
+++ b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
@@ -91,6 +91,9 @@ properties:
       - const: runstall
       - const: softreset
 
+  access-controllers:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.34.1

