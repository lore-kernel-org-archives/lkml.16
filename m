Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E361419E819;
	Tue, 15 Apr 2025 17:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744737663; cv=none; b=pPQP2js0dRsVTrZhuGjp0jvSJ7ve5uqdpxBAZJ0EjW1nYTooPwyDdmhZo+FxSP6u+yjI1QeMHFOjwMAeD4jNE4tj5TRGuGAJk43ILhtLth9cuW0ZNsAZdEWHJmGT7KRHOxBpm8DEgrzZwTM1eZhlxw8Z0Tn11/0h/VAJ1/BduIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744737663; c=relaxed/simple;
	bh=0fGCIqu/Bwscnu03galgqtMBYdQgXx11Gd/hfh74P7I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iGqeWd0GuRv4SDoXIxUpEOWQlo9+s3rpgoi6WUBpz8TnQF+qvA6BVmzT4CscbiAvmAVjLd+PHndAVe6nrmSdIaz/mUS/zL193Cz5FjLgtp36RgLNmZpjBoHIFzGz34LsbwSIKv1BjHR/mIW1JJ0wZD/K+S0/GR4lNOI3jsBb66s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DMP1cqAP; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DMP1cqAP"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39c266c2dd5so5239573f8f.3;
        Tue, 15 Apr 2025 10:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744737660; x=1745342460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P0Q86oVQ46NQHKuW2S4ZLX3AYJvbuMfsPslyKj8yJSA=;
        b=DMP1cqAPmvC8VFVWwF5dTOpD6vooSYg2+jrJCCHFrKqC9yG8+Y6hGqXMGvEI2fC1vy
         EMSnrVYkMP/kkw3Hd2jLk+pcMmEYyhZxhf94GLkTiMW1WBuXjaf9R0dZUdchzDOKi6ES
         JQckaI880OB2zjV/8ecaTJ233yXGWYauuW7f1dyt9pjXm6IWgjVJ1saOC08hcWFnnwZS
         bq4NynCxKBLHYOZWHm8beMMY8E8enKblbPBmTFkDjvGlA9GUd+f5gDW/U6lpi9AdgAiV
         BExx5FU/Oj9MND3BK21bvkIM1N5DdA4L8fZVw/vNajJFQpQh1O2V6OO6SNpcucXqn9Wy
         4oPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744737660; x=1745342460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P0Q86oVQ46NQHKuW2S4ZLX3AYJvbuMfsPslyKj8yJSA=;
        b=NtAZUnql9TWMDu/aeR+7j+SA2FqfdEZ1LEowMeIPu/5y79fVtZ6Z4Ctl+AvaoK2O7H
         k8hxdWVmi15XKOYWrXWHU43rHlvRyx0R+5VdSZQJr6BNyoCQ6vj8duqg690j/3D41V7B
         wCZnXGmdT3gDcOmvR3YIhTE9DjQOE5bQdB7zjPNR7ryfq8nWw2mMnd02eA6ZM90Xjx5E
         u47JpCibsbJWvSA0zIyWALdbERIF3f0wGL3+3FRNJpQmpV1LsuohVXKJrZCujr2eiD37
         Cso2mGebHz7L/Fqik0Gk6LaOAPSCddfoOidI8PypuEE6pATgxUkm85ONIYSq4/WxZj62
         v0LQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwrhglbbIMxhxg5dX1Wh6wBUIZfm3SVhk4PvgVecA8jy+WEfjusneHmfPiTnUs6yHn90SekKDYcMU2zld8@vger.kernel.org, AJvYcCWB+JGf88KxzNfZPqiRgUiJipC/qIN/jAbOCKEge8y7G7uX8nXKUhyaVw45Zs2VkZadKFWOfzdhN7h8@vger.kernel.org
X-Gm-Message-State: AOJu0YyCu8tfV6V7x00ITcOSJNtAco6xpnca85sJ6XJLO/1BEWJwuPi4
	dcBAS9BVER3JrTExVinz+CcnuNjZit335v2/aqSLKbr1rW6tMA1C
X-Gm-Gg: ASbGncu7kRj6iIhXJvPYoSEvKUVltPVl5EQ701deOeBoWenIxoLMbeKG+khtBPDdHG2
	uQ0cT1uhY2vrAfg2RLGi9yWpe3QWtorLDOp/6HQOtjmuDaZf7UHD7j9c4K+YsPLlPqJWCwZ1hM6
	XPp7WgbJVPAyzdQirKW0tMwPCFVTZIoXZEL3TRwN0xeNrNMyoIR7LizJqk+XfptIU5B56/UNW+f
	bwuCii8wTs1/rBb/LuTEx3CP2H9pxUR7ZWLtAGHadBIgW3bXL8JEh3MsyZLSDRZLXXDPezFrsW+
	bLFF+p2H8JDcD5lnw4AHj3PP0MXwhwxDJyRctr/Q8giYQ/4xfPqDB7ey3ReFQH4goNAPDERj6mT
	7BRg=
X-Google-Smtp-Source: AGHT+IFveTd1X/FP8Y+9djpXDnJifllwkbUHPK6roLTIdhPqtEzLH3suojD3NXCb7qJOyhKvVVigCg==
X-Received: by 2002:a5d:5985:0:b0:39e:cbd2:986b with SMTP id ffacd0b85a97d-39ee2729edcmr254216f8f.7.1744737659862;
        Tue, 15 Apr 2025 10:20:59 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae963f4asm14987714f8f.16.2025.04.15.10.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 10:20:59 -0700 (PDT)
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
Subject: [PATCH v6 0/6] imx8mp: add support for the IMX AIPSTZ bridge
Date: Tue, 15 Apr 2025 13:19:13 -0400
Message-Id: <20250415171919.5623-1-laurentiumihalcea111@gmail.com>
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
Changes in v6:
* drop the 'IMX8MP_AIPSTZ_HIFI4_T_RW_PL' macro. Its whole point was to
help with making the DTS more readable but if it makes it look worse
then there's no point in keeping it.
* use consumer ID as first AC cell and consumer type as the second cell.
Better to go with a format that more people are used to as long as it
still makes sense.
* pick up Rob's R-b
* link to v5: https://lore.kernel.org/lkml/20250408154236.49421-1-laurentiumihalcea111@gmail.com/

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
 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h |  33 ++++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  16 ++-
 drivers/bus/Kconfig                           |   6 +
 drivers/bus/Makefile                          |   1 +
 drivers/bus/imx-aipstz.c                      |  92 ++++++++++++++++
 7 files changed, 251 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
 create mode 100644 drivers/bus/imx-aipstz.c

-- 
2.34.1

