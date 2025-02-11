Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4701F4E25
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 10:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739271420; cv=none; b=agWT6Th45CC2JNb1oqT5N1sP2wzPmB3QFv2b8lZ8YZqauguAJ3tu53vo/8Mpk4q1CSFK085K5OsGWj1DZd8JfCoK28oxDEmvs3xdr3a2J4mJNgjyEP/3Ve3Gy1sg2hhue1aZzDxi96tXK4AbTjGXkTz22MC0nOAsXTmH+lDt7N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739271420; c=relaxed/simple;
	bh=Sk1EnraX33jOD12eFYI0f9miLPb2YpZFROnsFxZM8ME=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DQrrfcPr55p2LRGmgkk2BvQ4Fz9XYIcmVyoQofvWXVIJc5zII1zET7i75WAGOW3Z2YtCeoTk6WxlH2Dgy9E1j+7UdrfodelDG4O/6m8LjyRdzZGEx145+aw+ZFHnntOiZJxSSzdQgF2AmIm1tdGteDc2nMknQS2O9hQHSr9SqBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:17bb:6a49:a374:e956])
	by laurent.telenet-ops.be with cmsmtp
	id CAwp2E00S2jHCdB01AwpYs; Tue, 11 Feb 2025 11:56:50 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1thnwQ-0000000472R-0LNR;
	Tue, 11 Feb 2025 11:56:49 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1thnwf-0000000G4mq-2Ek4;
	Tue, 11 Feb 2025 11:56:49 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Andy Shevchenko <andy@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] platform: cznic: CZNIC_PLATFORMS should depend on MACH_ARMADA_38X || ARCH_MVEBU
Date: Tue, 11 Feb 2025 11:56:48 +0100
Message-ID: <077bd67861fe0ee246ba967a3406079373122439.1739271346.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CZ.NIC's Turris devices are based on Marvell Armada 385 or 3720 SoCs.
Hence add dependencies on MACH_ARMADA_38X and ARCH_MVEBU, to prevent
asking the user about these drivers when configuring a kernel that
cannot run on an affected CZ.NIC Turris system.

Fixes: 992f1a3d4e88498d ("platform: cznic: Add preliminary support for Turris Omnia MCU")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Drop PPC_P2020 from the dependency list.
---
 drivers/platform/cznic/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/cznic/Kconfig b/drivers/platform/cznic/Kconfig
index 49c383eb67854173..4134325cfcc2b916 100644
--- a/drivers/platform/cznic/Kconfig
+++ b/drivers/platform/cznic/Kconfig
@@ -6,6 +6,7 @@
 
 menuconfig CZNIC_PLATFORMS
 	bool "Platform support for CZ.NIC's Turris hardware"
+	depends on MACH_ARMADA_38X || ARCH_MVEBU || COMPILE_TEST
 	help
 	  Say Y here to be able to choose driver support for CZ.NIC's Turris
 	  devices. This option alone does not add any kernel code.
-- 
2.43.0

