Received: from ssh248.corpemail.net (ssh248.corpemail.net [210.51.61.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2139D2CCDB
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 02:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.51.61.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744252637; cv=none; b=pL6c8VIkdWJPtV4MNT2QPJh9/vr7tu8ocSvFN8K4kbzU00aHb+hD76HChTAbN1TnjM9MQiEVuRpLivb17g/KIXqFr7nn8kRsaXNJ8Rkb8lrkLtphlkczxXHQVHSHd10p7x3FRxRW449idwnZrHX0me3wb77d0JS4n7rzOMOZkg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744252637; c=relaxed/simple;
	bh=OPdf6KaWZ8dVNNMgR32vZMXO1XsPCJORRyySdRKY5zc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rImkGTG4ES/APR6Jvp8Go6BqptgfhSkcd+HUK21YpZ/CJl7ocVPvrB1hFOvq9VY0VFxZfPtIBOq/F1bznozWamcDss/zw/+nc0y17OKVF6E7bUyRpx9zwJQetWJd/MPc0byxF96NgXaQv3RMeL4pcJ+wvqeFpvh1qdbPTEgjqP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com; spf=pass smtp.mailfrom=inspur.com; arc=none smtp.client-ip=210.51.61.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inspur.com
Received: from jtjnmail201601.home.langchao.com
        by ssh248.corpemail.net ((D)) with ASMTP (SSL) id 202504101036571611;
        Thu, 10 Apr 2025 10:36:57 +0800
Received: from locahost.localdomain.com (10.94.12.92) by
 jtjnmail201601.home.langchao.com (10.100.2.1) with Microsoft SMTP Server id
 15.1.2507.39; Thu, 10 Apr 2025 10:36:56 +0800
From: Charles Han <hanchunchao@inspur.com>
To: <linux@armlinux.org.uk>, <rmk+kernel@armlinux.org.uk>,
	<linus.walleij@linaro.org>, <ardb@kernel.org>, <arnd@arndb.de>,
	<iuyuntao12@huawei.com>, <ruanjinjie@huawei.com>, <ebiggers@google.com>,
	<david@redhat.com>, <masahiroy@kernel.org>, <dave@vasilevsky.ca>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Charles Han <hanchunchao@inspur.com>
Subject: [PATCH] ARM: Remove the repeated word "the" in Kconfig.
Date: Thu, 10 Apr 2025 10:36:52 +0800
Message-ID: <20250410023652.8266-1-hanchunchao@inspur.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
tUid: 20254101036575d9741c2b0f18886574ac4cb902e34fd
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com

Fix "The the" typo in the description.

Signed-off-by: Charles Han <hanchunchao@inspur.com>
---
 arch/arm/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 25ed6f1a7c7a..31004f33dc14 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1505,7 +1505,7 @@ config ARM_ATAG_DTB_COMPAT_CMDLINE_EXTEND
 	bool "Extend with bootloader kernel arguments"
 	help
 	  The command-line arguments provided by the boot loader will be
-	  appended to the the device tree bootargs property.
+	  appended to the device tree bootargs property.
 
 endchoice
 
@@ -1647,7 +1647,7 @@ config DMI
 	  continue to boot on existing non-UEFI platforms.
 
 	  NOTE: This does *NOT* enable or encourage the use of DMI quirks,
-	  i.e., the the practice of identifying the platform via DMI to
+	  i.e., the practice of identifying the platform via DMI to
 	  decide whether certain workarounds for buggy hardware and/or
 	  firmware need to be enabled. This would require the DMI subsystem
 	  to be enabled much earlier than we do on ARM, which is non-trivial.
-- 
2.43.0

