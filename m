Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34C9230BF1
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 13:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746536540; cv=none; b=c1TbxGkY2h3ZYd9CRCkEEtteXsWfYyVkFFmcF7HTb2IpyVyL/lrhY+f90B4Sf0YaopgvBMA3YmUHi28uog/AgJcqq8wRVLYjxDy+Pexvl6i27XXWmiGR0HqIbq6F4rg8k98l/8CbE0Lih51GRMIWP9wRO1My2m+HSQa8FvQeIOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746536540; c=relaxed/simple;
	bh=qoz+Wgd3VMX13u5K7HiRc9FbP5MkFBF3SNSVx3IwBrk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HiTBZbjHGvscOLNCrEyvSQlfdTRByZRwt9DW12bnzqIKahRjJz6RNWEzYyPsl0dDAuOI9tD1rJx8j6a47vBTNkTAlkhw2OvOqrpLzTGJSxK/iMwdRXPPtndEaFYVFykFL20lWvKbSo2AKTNu2Az2k9MJ4CUbV3lLAofdTvPXHwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:ed69:3ad8:f2dc:ba56])
	by baptiste.telenet-ops.be with cmsmtp
	id lp282E00F2coBU201p280g; Tue, 06 May 2025 15:02:08 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uCHvu-00000000qog-1PHp;
	Tue, 06 May 2025 15:02:08 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uCHw0-00000001dbt-1K6z;
	Tue, 06 May 2025 15:02:08 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Andi Shyti <andi.shyti@kernel.org>,
	Pratap Nirujogi <pratap.nirujogi@amd.com>,
	Bin Du <bin.du@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Venkata Narendra Kumar Gutta <vengutta@amd.com>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] i2c: I2C_DESIGNWARE_AMDISP should depend on DRM_AMD_ISP
Date: Tue,  6 May 2025 15:02:06 +0200
Message-ID: <3888f892b8c4d8c8acd17e56581e726ace7f7092.1746536495.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AMD Image Signal Processor I2C functionality is only present on AMD
platforms with ISP support, and its platform device is instantiated by
the AMD ISP driver.  Hence add a dependency on DRM_AMD_ISP, to prevent
asking the user about this driver when configuring a kernel that does
not support the AMD ISP.

Fixes: 63f0545cb1bf0840 ("i2c: amd-isp: Add ISP i2c-designware driver")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/i2c/busses/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 865b760866ef42ba..7c348491e1bbac7c 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -594,6 +594,7 @@ config I2C_DESIGNWARE_PLATFORM
 
 config I2C_DESIGNWARE_AMDISP
 	tristate "Synopsys DesignWare Platform for AMDISP"
+	depends on DRM_AMD_ISP || COMPILE_TEST
 	depends on I2C_DESIGNWARE_CORE
 	help
 	  If you say yes to this option, support will be included for the
-- 
2.43.0

