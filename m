Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A8122F392;
	Tue,  8 Apr 2025 15:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744126974; cv=none; b=cwqgLPvfJkRNw454td+UkXuWbmvZMwlUP4poeIOeR+DF/N3jG9kWsH8CBZnzNxqEFnc/VAfyj3LvPcLbHUCSSDC4YMm1J4/+A5bm0tUKcyivmuwMBl2iQNBylNjtBODGu69sjc2wzuyMnhM7g1yIK8sYzn5DlxfIV7jMeMBz+8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744126974; c=relaxed/simple;
	bh=aU8QBFtLgQjelJCNVNjdB/oGNPTciJe5rUczc8N4X9s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mrS3ZP69o/IvgFXzswAZ3vKwQXs2YjJ9iEF5mL01YKjiCS2lciJYn5649PKawzsyhoXWiF2J8k20yuhUp9vtSjldNUj8XYSzfwfbosYbZicD5s0NZdtpfBpW/ksvL2OfAywtPNXlpoReWjY5cZzhNgORclR+Heiwq4DORKd7vVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fBMbSPKZ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fBMbSPKZ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso62521875e9.0;
        Tue, 08 Apr 2025 08:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744126971; x=1744731771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9L/RZ+p4NJbk4dcC+rTyDYkbHqicPrFhMjMSCL9eOJA=;
        b=fBMbSPKZsU6bqaPUDQj/qKIqEWULI0Qobq8qgamAIJXZ7G/7i5JMjvsvF88tug39fj
         TUR9HrweKE1YlHESg/pP7XlHlNzTYXcyLAcBqoyUgVk5lGpgUCBTmgwD+YxRofs2rwUr
         0fJ4c3YB8nBaMpkC/v9bOc03Bw0DeGskAbfU3MAbmj05OnDUgOuuWxUOV0Oiy3Lg398c
         LHIR6nplhhxBrbrojunVh/6Zy+KrUOo9HM1ZmZesY8Qqtwr+quilq3ekKxfSnYPbTgYG
         Q5osJuI0uBT47IJ4A3ceYGLY8rzvbkbf5W/KAJB5/9mV4LyOhMm3PzK2Jt+E+dZV99OX
         OUDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744126971; x=1744731771;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9L/RZ+p4NJbk4dcC+rTyDYkbHqicPrFhMjMSCL9eOJA=;
        b=EQ1vvRYt3oaKgyi3nnZqYltEIAFsqriyUE6DxifLjA9ztdoAbIcvY1HGNFjyd4bMJt
         4eaGigWQUt2CPXwahF/hS9s3zFmcfbmbT2C80jFp1zS7EMyWmt58Gp4P3MdA+wQcKYs/
         EdYgvlSBwEyfTOUi1/cPDen25yU1DjVtGMmJTRejWhLEGpYJMQ1wrwn9k90+jUjMjC+z
         sCml+eceeNHuY5D7VghDUloJRuUlfF3R3ppWsQqSY6A+0/C3NJu03DMaWqB34eMbG7dq
         AP+kW8EpBprMYPJFgjLLdtAr2IE70cvkWJBk7hthJ5/Ig+C6ZJLQpwqJ0xPihxBoSIee
         lOYw==
X-Forwarded-Encrypted: i=1; AJvYcCX7kFokBVz0N64fheCmxOr2BIx4u6w9hLmQm04UAj4QvPQ1VEHb68Ldzm9t9D/zCsY9gHSR3VwxvL/V@vger.kernel.org, AJvYcCXgofX4mo5iw18SBiq8QskRSbQeHnNNwH2l5pJL8Z3H5oAFqAQ9pIybEV4FfqE7a5BBMzwaFyt9VH3RmOES@vger.kernel.org
X-Gm-Message-State: AOJu0YzxrnM/ykgPOQ/tj8+cL+rWFQ+T2cIcLgAz7qF1oL0geZMnqDFu
	Gz/rHI6Gi1AjnEYmcIJ8odOQNXRvvyAk2sxaJNn/9GRXLEht2po3
X-Gm-Gg: ASbGncu723Y1IH8OpR3XW/253DpdEilLJiLWZ55O1kEeMhThcWPpp8jBPaQZPuIWc2P
	kTXHkOIOXuDze6DlNmbVeyfTr80KBodeOW0sTOaioTBAch9Bn8+Zs+fRNXdONsjKie6z1KqbPfv
	6Z/GooYpCIQmAUSlSp9VELzHr/q23Qb/a98xQRdjM/NNtjKSW1Ut0+MD+4YqhKHT4v4S+SWbfrG
	TOT+x2fuXR8cgThUiFcL7jyc2Dg/tQe2pjzyntLXKWFU5RzOtmyvXnpR4PPv7kFGlQ8baVLnJyL
	3iKFEjb9RC0xhDYQz8AGy0vjv8v5COm3jrJxC7wqR6aPSg6NfNbsdPWCbQZ+CTr4MuAesWh3VVU
	6YuUu4eE=
X-Google-Smtp-Source: AGHT+IEsYOAvrRYx9U7RkXBzKdYrz1m/zDGUfOXgzDK4kgV+9jgyDCOg9AoAc+QioVKMgn9BFwQyuA==
X-Received: by 2002:a05:600c:1387:b0:43c:f513:9585 with SMTP id 5b1f17b1804b1-43ed0bde88amr180587605e9.13.1744126970824;
        Tue, 08 Apr 2025 08:42:50 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34be2e6sm164476675e9.18.2025.04.08.08.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 08:42:50 -0700 (PDT)
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
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/6] imx8mp: add support for the IMX AIPSTZ bridge
Date: Tue,  8 Apr 2025 11:42:30 -0400
Message-Id: <20250408154236.49421-1-laurentiumihalcea111@gmail.com>
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
Changes in v5:
* merge imx-aipstz.h into imx8mp-aipstz.h. imx-aipstz.h is
currently only used in the DTS so it can't be added as a binding.
* place 'ranges' property just after 'reg' in the binding DT example
as Frank suggested.
* use the  (1 << x) notation for the configuration bits. Previously,
hex values were used which didn't make it very clear that the
configuration options are bits.
* shorten the description of the bridge's AC cells.
* shorten the message of the commit introducing the bridge's binding.
* pick up some more R-b's on patches that remained untouched since V4.
* link to v4: https://lore.kernel.org/lkml/20250401154404.45932-1-laurentiumihalcea111@gmail.com/

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
  dt-bindings: bus: document the IMX AIPSTZ bridge
  dt-bindings: dsp: fsl,dsp: document 'access-controllers' property
  bus: add driver for IMX AIPSTZ bridge
  arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
  arm64: dts: imx8mp: add aipstz-related definitions
  arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'

 .../bindings/bus/fsl,imx8mp-aipstz.yaml       | 104 ++++++++++++++++++
 .../devicetree/bindings/dsp/fsl,dsp.yaml      |   3 +
 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h |  39 +++++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  12 +-
 drivers/bus/Kconfig                           |   6 +
 drivers/bus/Makefile                          |   1 +
 drivers/bus/imx-aipstz.c                      |  92 ++++++++++++++++
 7 files changed, 253 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
 create mode 100644 drivers/bus/imx-aipstz.c

-- 
2.34.1

