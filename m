Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC0B18FDA5
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 14:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738766534; cv=none; b=og9HQ0JVRm8DV6VFqDR5rqFVepD9QasHnKgfJbdsuhoUimEITfvAvDsu3Zmuav3iggbyCFCHNiKyrO+236H9w3bIUW7Ne4a/rp/TeIFt+8vMJF+atkB/um+Jm60cJS111aEcHOZW4ziAqViVXCZFwiGkeYO4rTId3R6kh5QwIhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738766534; c=relaxed/simple;
	bh=LIAew11mhguTF2BX4IO3e9boWaQIZ0S/uz3h7V4gidE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lZpXtvpFEHNwbGgkYZif049CN0aSVvMRcLHKVOM1X/z0LaebWR3gN120nAW9vvDuK9jnLRjE9gxRopVG4RNIYYqDnypKNuuUI+VPoccleWj2VIVg7SRKiRZb/8ydgT59cesyQ7HpNwPYvEgZGTJChw235ky1i04P/6wZiqBWd/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:fa11:c14e:2df5:5273])
	by michel.telenet-ops.be with cmsmtp
	id 9qi72E00h3f221S06qi7MH; Wed, 05 Feb 2025 15:42:10 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tfgbD-0000000FwWi-36dR;
	Wed, 05 Feb 2025 15:42:07 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tfgbP-00000006bUL-3Iq0;
	Wed, 05 Feb 2025 15:42:07 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Arnd Bergmann <arnd@arndb.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Mark Brown <broonie@kernel.org>
Cc: soc@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH resend] firmware: imx: IMX_SCMI_MISC_DRV should depend on ARCH_MXC
Date: Wed,  5 Feb 2025 15:41:43 +0100
Message-ID: <9638976432d8dfcb0c4df9d454b661f9022a2d7b.1738766259.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The i.MX System Controller Management Interface firmware is only present
on Freescale i.MX SoCs.  Hence add a dependency on ARCH_MXC, to prevent
asking the user about this driver when configuring a kernel without
Freescale i.MX platform support.

Fixes: 514b2262ade48a05 ("firmware: arm_scmi: Fix i.MX build dependency")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/firmware/imx/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/imx/Kconfig b/drivers/firmware/imx/Kconfig
index 907cd149c40a8b5f..c964f4924359fcd3 100644
--- a/drivers/firmware/imx/Kconfig
+++ b/drivers/firmware/imx/Kconfig
@@ -25,6 +25,7 @@ config IMX_SCU
 
 config IMX_SCMI_MISC_DRV
 	tristate "IMX SCMI MISC Protocol driver"
+	depends on ARCH_MXC || COMPILE_TEST
 	default y if ARCH_MXC
 	help
 	  The System Controller Management Interface firmware (SCMI FW) is
-- 
2.43.0

