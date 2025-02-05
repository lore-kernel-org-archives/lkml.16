Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1815BFC0B
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 14:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738764446; cv=none; b=XKr7YnkPXMaPMmnsi0GhV+nxna7IhxeonllT4G6ic9r2PUTroRP23G1Mugi3mzYIpJ2owar/JvxGHGpZ03BOsOwjpiH5sDIUPG5Q8eIfQG9lbf7sdWWEuJKDyw6+1g6Nu1kmRa72yIqYUwg+o3s2K0Yx/vs3g/6iUbh1YMQjXdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738764446; c=relaxed/simple;
	bh=AXzkEt26v0sftnDbLR8431kLT+0OCOMcnr/tn3NhncI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t1luTuHnVG7kGG9cfI5O6YZUhPNOj8yvsfhGuGEZ0n0vH0w/leeDxWe1o3QhQ6jYRU/wOhDB8hyLtets59nhv++DkJwuKv5R/i69lUSqhdXA3yjG2zlfCBFKa751cAuI80jgXKb/6S1j9/gOZPRHeFLDCmvOSJttImMGRiHcS20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:fa11:c14e:2df5:5273])
	by xavier.telenet-ops.be with cmsmtp
	id 9q7K2E00f3f221S01q7KkZ; Wed, 05 Feb 2025 15:07:20 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tfg3X-0000000FvyS-315G;
	Wed, 05 Feb 2025 15:07:19 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tfg3j-00000006Vpg-3DNG;
	Wed, 05 Feb 2025 15:07:19 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] riscv: defconfig: Disable Renesas SoC support
Date: Wed,  5 Feb 2025 15:07:17 +0100
Message-ID: <e8a2fb273c8c68bd6d526b924b4212f397195b28.1738764211.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Follow-up to commit e36ddf3226864e09 ("riscv: defconfig: Disable RZ/Five
peripheral support") in v6.12-rc1:

  - Disable ARCH_RENESAS, too, as currently RZ/Five is the sole Renesas
    RISC-V SoC,
  - Drop no longer needed explicit disable of USB_XHCI_RCAR, which
    depends on ARCH_RENESAS.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2:
  - Add Reviewed-by.
---
 arch/riscv/configs/defconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 0f7dcbe3c45bb597..3c8e16d71e175e0e 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -26,7 +26,6 @@ CONFIG_EXPERT=y
 # CONFIG_SYSFS_SYSCALL is not set
 CONFIG_PROFILING=y
 CONFIG_ARCH_MICROCHIP=y
-CONFIG_ARCH_RENESAS=y
 CONFIG_ARCH_SIFIVE=y
 CONFIG_ARCH_SOPHGO=y
 CONFIG_ARCH_SPACEMIT=y
@@ -202,7 +201,6 @@ CONFIG_USB=y
 CONFIG_USB_OTG=y
 CONFIG_USB_XHCI_HCD=y
 CONFIG_USB_XHCI_PLATFORM=y
-# CONFIG_USB_XHCI_RCAR is not set
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_EHCI_HCD_PLATFORM=y
 CONFIG_USB_OHCI_HCD=y
-- 
2.43.0

