Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B57264629;
	Fri,  6 Jun 2025 06:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749191515; cv=none; b=eC6vg9eBST61ve/KTOWcboaf4HuserEzV0Ylk+lTmeAkMZivswOqZeijxS7wwAk0h6IimbpqxOSlKnyh6u1Ba4IH/Rxm84kgk5AT/CaAnoAhaOY6XsS7b6OoIU969WMIEajinenYCdykB7xvNuA1IkYdwa1zIfLsBGVSgd+bavE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749191515; c=relaxed/simple;
	bh=zRwVKxY/ljPw+PWBx03TIerZJoDRcw2Ws1V9+SjbY18=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RZZmygKMzQ0B9JY8830fbJzKRpiG8MVF3pVFVlZLamndlmbI73Fphns2GQ/DH3rXrZydQHD+MVX63RQvkQUIzPW6AHKNlILo6eYJnXavLgkDDOpdwtJEH3UUPNEJiB5+2gUtHRrbeCIBuTG11vLT+d9D9R5JR3WAH7rAc0+F484=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=tv4TG3un; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="tv4TG3un"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1749191514; x=1780727514;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zRwVKxY/ljPw+PWBx03TIerZJoDRcw2Ws1V9+SjbY18=;
  b=tv4TG3unT8fA0jSX2iIol1BCr3TIXTLd+z+kNWUZapAkMdCbsQ5cXh5F
   6ELPruEvxnQW2aK2CE/qFriWLqQpQUYRM1t0cwEjbj5oQUj/Rzcqn9app
   XpPPIScpG+0GN1uZZBnLUkdlhSMFT1Rx8NMk8TzXczoo6v3LZuJJ2cwxA
   uDRVV2Ol6NzWRFFhTIf9/dybCNTojtzh+YvmMwboi2nMw211aeryY4dvM
   1ZFKEHVTFhHCD26MTknjI4Gco39q2fD1QM3CXnK8nugXzU0lFAT67WiBs
   ra+c/ui6DEuTJO+X+m1cEGY6YDucPwMFJNIl0z1a9vuEAx/oMt1Wqw6xG
   A==;
X-CSE-ConnectionGUID: HiyTZkGJTpSB36KKTlmuzA==
X-CSE-MsgGUID: 3HVan55pQ52EQ1v26Ftyiw==
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; 
   d="scan'208";a="43057989"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Jun 2025 23:31:46 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 5 Jun 2025 23:31:18 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Thu, 5 Jun 2025 23:31:09 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
	<rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
	<jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
	<mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
	<simona@ffwll.ch>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux@armlinux.org.uk>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <ebiggers@google.com>,
	<varshini.rajendran@microchip.com>, <ardb@kernel.org>,
	<martin.petersen@oracle.com>, <mihai.sain@microchip.com>,
	<dharma.b@microchip.com>, <dri-devel@lists.freedesktop.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v6 RESEND 0/4] MIPI DSI Controller support for SAM9X75 series
Date: Fri, 6 Jun 2025 12:00:51 +0530
Message-ID: <20250606063055.224159-1-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This patch series adds support for the Microchip's MIPI DSI Controller
wrapper driver that uses the Synopsys DesignWare MIPI DSI host controller
bridge for SAM9X75 SoC series.

Changelogs are available in respective patches.

Manikandan Muralidharan (4):
  dt-bindings: display: bridge: add sam9x75-mipi-dsi binding
  drm/bridge: add Microchip DSI controller support for sam9x7 SoC series
  MAINTAINERS: add SAM9X7 SoC's Microchip's MIPI DSI host wrapper driver
  ARM: configs: at91: Enable Microchip's MIPI DSI Host Controller
    support

 .../bridge/microchip,sam9x75-mipi-dsi.yaml    | 109 ++++
 MAINTAINERS                                   |   7 +
 arch/arm/configs/at91_dt_defconfig            |   1 +
 drivers/gpu/drm/bridge/Kconfig                |   8 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/dw-mipi-dsi-mchp.c     | 545 ++++++++++++++++++
 6 files changed, 671 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/microchip,sam9x75-mipi-dsi.yaml
 create mode 100644 drivers/gpu/drm/bridge/dw-mipi-dsi-mchp.c

-- 
2.25.1

