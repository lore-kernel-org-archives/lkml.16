Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C850B20CCC3;
	Tue,  1 Apr 2025 15:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743522350; cv=none; b=g4YB96Oh5n6wnC9iW854OgRtPX1La75bm/Bm9faSVlntPzsmM1gAleJ7Mw2EGwoStASZa0UX4awboFBSDdwa6eZi8MBm3K/QXU5sH2ZWS87Yz6/2YXey/V9b+eMli05Wi7cCGHF1eLV2kGCPjhyX3OxWu2B1ve0GttRjRxEi9k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743522350; c=relaxed/simple;
	bh=IZl+SfnZiNB3eblr5+5BUK4KuET7Fyh/voPaywYEQW8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HU1R9N/P1ahyJeA68Mzdem/bKRXNS/CPWNgsZhCVnUmGjqJuUkvSxXR0Jjwult9hSY2mCRpfdwhwsENHmm2CXWdTE6lnsJsnoXFx4LfzMPPOF8FYpVZwVJ0Ytm2nu0GUXYAvYkgSqf1Qcy3ixzJD/8WlT6XlV+FkhLZLENP2FlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZTXwPAHN; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZTXwPAHN"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so35253035e9.1;
        Tue, 01 Apr 2025 08:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743522347; x=1744127147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T5ThBuRpKnHRPY4PmL9t1IknVwrvZgD4qu/gh0Vq+Tc=;
        b=ZTXwPAHNWCWiABJqVlcPSPvU1y8g3HqD/ywLLxwEaxglrlRdvY8Mk77eROSCBKunUU
         b17OUcfH6X0cwH6Jd1rDoWwQJu5Z9uNo0PP6VpE88Kd5l1H2MYx8lCBxK1efzqlh9k8u
         Qq+m+3lGOKwEmR6ZW62tURQdzo4dG3wTYCEYmfxf3kySR2pDHFh0eZa9USPh4uYPd1Fh
         gjixjCt11uCWbkW3oeVX0etAxwLQVdII0aMgYDMjyYp6lrL/1WAxgJbvFdepYmHAStvG
         12FPggEZHgwft3sBM0Z5OAfMcGhKp3fjPV/awkEgeoKT+V3phZXEzMJ02bLzX8TczJLi
         xWQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743522347; x=1744127147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T5ThBuRpKnHRPY4PmL9t1IknVwrvZgD4qu/gh0Vq+Tc=;
        b=FO2CsMdTEdJPSlZ8FD+rnMmK/BE8vNeByx+nNsS1QRolkj49zReJif6AQ3KlqhZoGg
         5Jt4hEEl87OBL0TmQIJUDf5op63EQZBjVg3g2beWAZbf7abApiLDXv/Pc9tScxvbA/Qt
         lZfr4rDochoSj/FXZ/doCdZwhQd5+pA7gV/76cR8oStcQrEPKdKVGjjS1qUy2nmNT9XW
         UP0RtRuSF0ZELe0SHWFEboljkSQZx0egI3bchThetcCUKzaX75uigEjsPBcO8LURTTQf
         FVxKuy79PZN5m+GMEZLkdHqYNEOJF6/zNNSFT1xGVOJV33oGE2aeX3ZkKj0taffw5uHE
         b/bQ==
X-Forwarded-Encrypted: i=1; AJvYcCUa6TH+sUu4GPtCn+AuXhlH8n9cnSJzISgpxPCUyLlkw19OVgxGo3QytFlo8s1SrqkQu2RDSvj2D92o@vger.kernel.org, AJvYcCWfGL2IpKek3Av1vOuF4IBRnMgKtPM/Q5LsgSYm5QK0rAI2qFVkQGL/It/dToD0QQWMQ9lpzKmNIcIoZ9ON@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd7oaepMtLrYkpPMbOvAAX9pu89QWB5syXmknmentrz26aBUoK
	rWm1EPKSkPCWRQd7m+KprCNB66ZPi7YNhVPyQigSngePfVpWnHgV
X-Gm-Gg: ASbGncsHV3VzCpaIsaCu39U92rab/pdRnN5R0pq6W1py+HU0y39ucBFLRF7Pe5RyDJQ
	8GVJ3xJ89H++KwNQ5UwBxtT9N5S3U2ZJ59fygz4SxeapH1dtnri0oTU5DMoHDQwTwe/+hxvqODl
	o8fdLNMLilOmulROn/llC054aUTLF6/ERH//TavjiYWeDwt9EHlUwBRheN742yeJADmxyM5Ia53
	BP10R+ylEF6O1OrQBCd4ue2QajNISrYVlgOlYiAr3jXE3L8D1g8u3khEMj1mMwuSwY0vRa2hZge
	eE1iqCN+5TrHnqf0ykr4rbhr7v9pxiaKJElQp25qpzQnla5aXhq0dI52XB0yFgJ5LnHDozWo/vC
	G3l5/QXA=
X-Google-Smtp-Source: AGHT+IFKiVxzUU2B9RPhqEV6JDP87B+NzuBTFyeKmjre2c1ZpVECp9TuSc269NxnKveemRjQQW/DLw==
X-Received: by 2002:a05:600c:285:b0:43b:bfa7:c7d with SMTP id 5b1f17b1804b1-43eb055b4b9mr3423905e9.2.1743522346657;
        Tue, 01 Apr 2025 08:45:46 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8ff042bcsm158795735e9.28.2025.04.01.08.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 08:45:46 -0700 (PDT)
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
Subject: [PATCH v4 0/6] imx8mp: add support for the IMX AIPSTZ bridge
Date: Tue,  1 Apr 2025 11:43:58 -0400
Message-Id: <20250401154404.45932-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The AIPSTZ bridge offers some security-related configurations which can
be used to restrict master access to certain peripherals on the bridge.

Normally, this could be done from a secure environment such as ATF before
Linux boots but the configuration of AIPSTZ5 is lost each time the power
domain is powered off and then powered on. Because of this, it has to be
configured each time the power domain is turned on and before any master
tries to access the peripherals (e.g: AP, CM7, DSP, on i.MX8MP).

The child-parent relationship between the bridge and its peripherals
should guarantee that the bridge is configured before the AP attempts
to access the IPs.

Other masters should use the 'access-controllers' property to enforce
a dependency between their device and the bridge device (see the DSP,
for example).

The initial version of the series can be found at [1]. The new version
should provide better management of the device dependencies.

[1]: https://lore.kernel.org/linux-arm-kernel/20241119130726.2761726-1-daniel.baluta@nxp.com/

---
Changes in v4:
* AIPS5 node now only contains a single memory region: that of the AC
(just like in V2). 'reg-names' property is dropped.
* AIPS5 node now uses 'ranges' property to restrict the size of the bus
(1:1 mapping)
* change the number of AC cells from 0 to 3
* add binding headers
* link to v3: https://lore.kernel.org/lkml/20250324162556.30972-1-laurentiumihalcea111@gmail.com/

Changes in v3:
* make '#address-cells' and '#size-cells' constants and equal to 1 in the 
binding. The bus is 32-bit.
* add child node in the example DT snippet.
* the 'aips5' DT node now contains 2 memory regions: that of the
peripherals accessible via this bridge and that of the access controller.
* link to v2: https://lore.kernel.org/lkml/20250226165314.34205-1-laurentiumihalcea111@gmail.com/

Changes in v2:
* adress Frank Li's comments
* pick up some A-b/R-b's
* don't use "simple-bus" as the second compatible. As per Krzysztof's
comment, AIPSTZ is not a "simple-bus".
* link to v1: https://lore.kernel.org/lkml/20250221191909.31874-1-laurentiumihalcea111@gmail.com/
---

Laurentiu Mihalcea (6):
  dt-bindings: bus: add documentation for the IMX AIPSTZ bridge
  dt-bindings: dsp: fsl,dsp: document 'access-controllers' property
  bus: add driver for IMX AIPSTZ bridge
  arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
  arm64: dts: imx8mp: add aipstz master ID definitions
  arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'

 .../bindings/bus/fsl,imx8mp-aipstz.yaml       | 104 ++++++++++++++++++
 .../devicetree/bindings/dsp/fsl,dsp.yaml      |   3 +
 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h |  25 +++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  12 +-
 drivers/bus/Kconfig                           |   6 +
 drivers/bus/Makefile                          |   1 +
 drivers/bus/imx-aipstz.c                      |  92 ++++++++++++++++
 include/dt-bindings/bus/imx-aipstz.h          |  25 +++++
 8 files changed, 264 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
 create mode 100644 drivers/bus/imx-aipstz.c
 create mode 100644 include/dt-bindings/bus/imx-aipstz.h

-- 
2.34.1

