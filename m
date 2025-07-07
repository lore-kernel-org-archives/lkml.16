Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02091155757;
	Mon,  7 Jul 2025 06:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751868665; cv=none; b=Sw0Yyn3MpfP2FPz/eDpBEokPpxkUrN+yIxHGFHoTC11b0q90Gsgs1U0zk7MPdmb6pbkkbjqd6FZUw36Z1Swwr3G88YZZfNro2htm2qWBpfWa6j1G1kJl1YY7AumUB81AZFPmKzPR/hfb2Xv17bZA/VWRMNOBOd3kLbViCqDNfO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751868665; c=relaxed/simple;
	bh=mpl7sI6uOe2Ig4ZPT6mFEjdARIf3fcuIbio10UMveow=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aH8nCdcCuhlbeyfVWZS3A29Xo4LFHm/u/WHMJ6ZF2uZbV7PxbMMkYhy/Mj7sv7Qxn4hmCXmlIxy7BlSGuaAMINCguk5rRD/khn2E8lwrMUV+uuwpixMLulDSOHtiGfVepVswr0mB+OWuna1slugGQHDdHjMmQmUIHfRxcTUfaw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Received: from [89.212.21.243] (port=56226 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1uYf4B-00DKr8-07;
	Mon, 07 Jul 2025 08:11:02 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH v2 0/4] Initial PHYTEC i.MX93 overlays
Date: Mon,  7 Jul 2025 08:10:57 +0200
Message-Id: <20250707061101.1194618-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Add initial overlays for the PHYTEC phyCORE-i.MX93 SoM based boards,
that is the phyBOARD-Segin-i.MX93 and phyBOARD-Nash-i.MX93.

Overlay #1:
 - imx93-phycore-rpmsg.dtbo
 - add support for M33 core RPMsg on phyCORE-i.MX93 based boards
 - applicable to both phyBOARD-Nash and phyBOARD-Segin boards

Overlay #2:
 - imx93-phyboard-segin-peb-eval-01.dtbo
 - add support for PHYTEC PEB-EVAL-01 evaluation adapter
 - applicable to phyBOARD-Segin board

Overlay #3:
 - imx93-phyboard-segin-peb-wlbt-05.dtbo
 - add support for PHYTEC PEB-WLBT-05 WLAN/BT adapter
 - applicable to phyBOARD-Segin board

Overlay #4: 
 - imx93-phyboard-nash-peb-wlbt-07.dtbo
 - add support for PHYTEC PEB-WLBT-07 WLAN/BT adapter
 - applicable to phyBOARD-Nash board


Changes in v2:
- reorder reserved memory nodes by address

Link to v1: https://lore.kernel.org/all/20250619063954.1730231-1-primoz.fiser@norik.com/

Primoz Fiser (4):
  arm64: dts: imx93-phycore-som: Add RPMsg overlay
  arm64: dts: imx93-phyboard-segin: Add PEB-EVAL-01 overlay
  arm64: dts: imx93-phyboard-segin: Add PEB-WLBT-05 overlay
  arm64: dts: imx93-phyboard-nash: Add PEB-WLBT-07 overlay

 arch/arm64/boot/dts/freescale/Makefile        | 10 ++
 .../imx93-phyboard-nash-peb-wlbt-07.dtso      | 88 ++++++++++++++++++
 .../imx93-phyboard-segin-peb-eval-01.dtso     | 52 +++++++++++
 .../imx93-phyboard-segin-peb-wlbt-05.dtso     | 93 +++++++++++++++++++
 .../dts/freescale/imx93-phycore-rpmsg.dtso    | 60 ++++++++++++
 5 files changed, 303 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-phyboard-nash-peb-wlbt-07.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-eval-01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-wlbt-05.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-phycore-rpmsg.dtso

-- 
2.34.1

