Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9041519B0
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752501; cv=none; b=gDK0DLnjabDZZlspaegATiKIpNHWokkzQna5edR+wGXUbAyRO3h6/higzCtfN6EWoFYQord/KkqgYro/4cejzYiwo0x0iBniq6Gr2CPZCPj1f63nHFhmOgtMu2xnYfHBBk8Fvsu7NBFqofGQ2Gt8JpR9nv0/ICxdCbXzUvSZ1Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752501; c=relaxed/simple;
	bh=XAv2F6rZggC3RV6gEZwdwlKzuO/JSBK7MdaOwRP/3wY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bkTjMss7tWv6UEI/y2K8vBVRrkOf7Rp5YIIl5SyDs9HYQlE3qzMm9dalbBDVVH10TaVZofVXr2hudh36djO8ISRU3MOyDwGGKoaRSH2t3RngHFmKVJFCNRV4CzSbWKLQYU9s6WLBwb9CEGkt24iPw6rqT1WUtIQDS2eLA/LF5X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:c448:5c9f:5d50:ad45])
	by xavier.telenet-ops.be with cmsmtp
	id 9moF2E00H5P95W301moFZG; Wed, 05 Feb 2025 11:48:16 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tfcwt-0000000Fsrk-2vbp;
	Wed, 05 Feb 2025 11:48:15 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tfcx5-00000006NjC-37Sa;
	Wed, 05 Feb 2025 11:48:15 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Andy Shevchenko <andy@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH resend] platform: cznic: CZNIC_PLATFORMS should depend on MACH_ARMADA_38X || ARCH_MVEBU || PPC_P2020
Date: Wed,  5 Feb 2025 11:48:14 +0100
Message-ID: <021800db3f75e31bff96842c7d7e9ee840fe3e7a.1738752438.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CZ.NIC's Turris devices are based on Marvell Armada 385 or 3720, or on
Freescale P2020 SoCs.  Hence add dependencies on MACH_ARMADA_38X,
ARCH_MVEBU, and PPC_P2020, to prevent asking the user about these
drivers when configuring a kernel that cannot run on any CZ.NIC Turris
system.

Fixes: 992f1a3d4e88498d ("platform: cznic: Add preliminary support for Turris Omnia MCU")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Perhaps the dependency on PPC_P2020 should be dropped?
---
 drivers/platform/cznic/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/cznic/Kconfig b/drivers/platform/cznic/Kconfig
index 49c383eb67854173..bf4bd7f00e32de09 100644
--- a/drivers/platform/cznic/Kconfig
+++ b/drivers/platform/cznic/Kconfig
@@ -6,6 +6,7 @@
 
 menuconfig CZNIC_PLATFORMS
 	bool "Platform support for CZ.NIC's Turris hardware"
+	depends on MACH_ARMADA_38X || ARCH_MVEBU || PPC_P2020 || COMPILE_TEST
 	help
 	  Say Y here to be able to choose driver support for CZ.NIC's Turris
 	  devices. This option alone does not add any kernel code.
-- 
2.43.0

