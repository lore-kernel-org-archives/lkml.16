Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C713023BCFD;
	Tue, 10 Jun 2025 16:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749571348; cv=none; b=mqlR+LM7Hk9H1pcBiM3HVtm1OCjI/wfSleLZRnP3rZGZOhJxykPVQDuaVpQfOAIpZZXzlT/8u6l4p73nQU7mEmMm7c/0MijSkGpN4bMD2m8v+LWi3vC+3+OhFTkNUbEmD6N2Ql1Ij3fmw7drFbhs6+PUH6S8tplzQHdMrCSPr9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749571348; c=relaxed/simple;
	bh=jtozxlDlFArb33Vwn4r3NVMWeWlV1gMBeUBT/QzmsQA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pzbqYNReStG6ezBWl31AbBo4lrj7hLfI9oXuEX+rpcG8rXNBqY8ZgynlFaAnHvQGQD0EQ527bvzWnA9i9dht+GDL/8yhRGDPj82HAgLf1ca8Senx1IJ2/xiCvH/lzBhPNSzbxTtV5EIHLM09kN0RpQQxUUmR9ONT4h+4cUtz2Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GkjirbJy; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GkjirbJy"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a50956e5d3so4681869f8f.1;
        Tue, 10 Jun 2025 09:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749571345; x=1750176145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gu5G8CnhO94dSAWaShWe9FJyZsw97QYskm73IppyfbE=;
        b=GkjirbJyD6euaFBTXWD/oxDiyUWx6BNV5+aZASPdU+fXcclvBM87hhzltL3P5DDJmA
         M6OvOpw8/97la6u9odP69R3OH2xXTi0eMxIiTu1aDaPlVYQCT9v13qlHOClxDUEZWWTz
         g92aZcIXryAMeyq5ANoZAeJFTJ24DA7EeiRhIpbcSbWtqQrw6X9iOVRYpSTezHqMrmMB
         au2XSMxNmHsJimsW9spZUinEUlNhKLnVE1onSib6G5Gmp0Ow0Ob8nrcf+r4reZd2Rroy
         sUyQyfsMEEVya3mTiQA6VKc1JBuorkhE3df8Jha/uZMBxHx4l1yyuah6VSjoIFQzJL+H
         ad4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571345; x=1750176145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gu5G8CnhO94dSAWaShWe9FJyZsw97QYskm73IppyfbE=;
        b=AmLrIxgwx1P1IJ8Is2+zxbrzI752u872SWc8sLc63+vlSRFJPksSoWzGV+ptazGFZk
         rD7LtPxW3JeCJjMtC5lpU/Gu7LZeJ4ZLuO8TQTKLP9h0s6uPPbz3OpMSSY9k75T9fLis
         AzYNAw0vP0oS6r1GTNnNNx7T2LpEe5XtnrXlZMF5jodxe63jMT58ddyItJANv+/10X8x
         yx93BFRZjJjzhMAqbhDKvMnQpnn3oly1rxIXP0OHWV30B9uj8cdixqQ3RcsDqkWS0wx5
         DXPx2y2Az8zQKIrwQxvqVFdmonNVvqzSH4no6Ua/Vr+l7bt0/qD90+J4mFaZiZeFW0hp
         7zhw==
X-Forwarded-Encrypted: i=1; AJvYcCVijyaR773KsonhQJm1J1fUAOnVyQhdCq9bCtBMO+k+UOXViL3ErxKt00xmTP6fnbFgZwy1nhz4Fjyq@vger.kernel.org, AJvYcCWz8mCNfx3dL3GJ/s63OZuyuZ1l9f8dhno88wltkybu1G/Uupezn1/HQWe3Q5jDJoY2CjZXbFvCn/f0qnR+@vger.kernel.org
X-Gm-Message-State: AOJu0YwIqK80X6y5tmo9iP59kN7RV0mkvg8qPOqgJB+BZUQ256bZco9Q
	0zrScCIyVQtIlCM9ktPOLwi9P7CMP33gHdwFWCO5zXuDMGersVU1bIzP
X-Gm-Gg: ASbGncvERBhnx93bFItCnbJga2ZHaGuBYFEfEDL1vReKYJOvZMpQz4v28jsSnM1YPhG
	LWCSr5axVbegjFYazBcPLGpHERLQUVOwqicN5rpvaJwA6OSklCEmP/Yj2LdATzehY68+X/3iQ35
	GjAc2hLpvvAnzAJqifQNdK3tMnhZI2d4gqispKLeiR5+SbYK5/DhGGd5uHRHEPs4w8SpuwzcO84
	dHNzK0QkOwDMkmricnfqXDptS6ClZNo0xlzJXo5HTASyxerrq/wI3IR3x7BLyx2lFFlahp/anyg
	0Jx1XsP+4P4e6v64qfKPe/vpDV289ZH5+ghXd4KmEBIC92IXKsajUf8xt1UXLqfTrRJ556g6uVe
	4AEPuCGW0ea8biHQwOugQ+zg=
X-Google-Smtp-Source: AGHT+IE40dc98wMFPx4uPCgW5ShheukO7bwqGFEpXjw3tHAaGruG35TyY17fMDbCmkoqNX7lS0vi5w==
X-Received: by 2002:a05:6000:26ca:b0:3a5:2949:6c38 with SMTP id ffacd0b85a97d-3a5522ddd75mr2710478f8f.52.1749571344655;
        Tue, 10 Jun 2025 09:02:24 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229e009sm13017806f8f.16.2025.06.10.09.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:02:24 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 2/6] dt-bindings: dsp: fsl,dsp: document 'access-controllers' property
Date: Tue, 10 Jun 2025 12:01:48 -0400
Message-Id: <20250610160152.1113930-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
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

