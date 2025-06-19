Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C6D2472AE;
	Thu, 19 Jun 2025 06:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750315206; cv=none; b=ZV5CBp/aUyqVIb5nTKw3GYuOJHRKspZxkYiXtVi9+XrSO7omTK4VfH10V0BWF1oMcFathxavnsrmRX+OGmrk34nchWv8o1QmTC5c9HtQFQl6VpdapmUT1/4AqlLfwmGQlSJ3DgHkS4aWs6eaAhshpsG/FjZXBqpnkpgILOEPca0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750315206; c=relaxed/simple;
	bh=QdblX/Adz2YehdKa6jPrwXXt8N4R935JXL9kTT6qi6Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pkhmxyh7NFIF3cTD096s1PWtGfwWxJmw2nZ11T1YCFufWJe5EDJyav4QJYv1rm0olOy8LYcPjVR/KJiCiqVfRill59+s7HovHLbhDjOJdYyvZeLbPyawVf+dzpd//BXhHbv5vU3PqumbuoXYJvU6BcNJK9Gh3Kbo/feWmvmmjx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=imlhkyh6; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="imlhkyh6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=edXj2ym4g9lNt0PMawzo8NDuOLySpaifvZv9IBIuZ4c=; b=imlhkyh6MlN+6j4ZWxWlrZKzjZ
	3c/ByYrwNWeH/euhzS8ZV7ZdqSsJb69eSbZyIMvf4qmAeYJJoEJ3efEDqGOXgBd3eE4rWvMxHMj9V
	memxnFohR50BJ2edxFfNTxkyD5rb2HEPFOpw/64XZqzFb0+WpDhXyvSiezP6A2VgZwgTWd3bz42YT
	MD2cXebyCORILG+h5wZfngvfofA5fotzrndyoiZPG1Pm5DPwY8gIoj91tjrgOiCx21Ott8z2nqrW6
	zJoJv9T6q3UOXBBLJxE5Vi41ty8XV+XmkHtiC6CtPPIg+ZsaYhafi3lbv/l1B9V/xcB4iMHjVJzq6
	+9jnbHKw==;
Received: from [89.212.21.243] (port=44058 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1uS8wG-00EVcY-1H;
	Thu, 19 Jun 2025 08:39:55 +0200
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
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Initial PHYTEC i.MX93 overlays
Date: Thu, 19 Jun 2025 08:39:50 +0200
Message-Id: <20250619063954.1730231-1-primoz.fiser@norik.com>
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

