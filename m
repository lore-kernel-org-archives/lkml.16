Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1867A19CD1B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 07:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749193983; cv=none; b=pSMbqOKs5T5EbT7fbicAGHJbuCNEAp4V5Ugw/6WemRZPFa+PgIxK+fITR7QOEws4X5hkpoO6tL3/ToJWkPRXKl/RPgiFblrWR0iu6Fr+gj2bCFp1D/hG28laOiKH2nvxkcyPtpX6FGa6+J/ajd33UKHpIWKRaN7ZI6tOSqdYXig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749193983; c=relaxed/simple;
	bh=4r6zRPSR3LbxS1Ho+2QfOEtNzfAtNINQdGpBm0QH5/M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rSHM7bTmOLrO+cUJzyZKGAQJe62FZAkzVCLzVRBd3s+ORnnbqdCTpE4IJ4VvzTFmfDMxV0ugKdI3vx3bc1HfTDjrS1lBmXFjhzQrr5SE0yDoJ+3JWNhrO9UjD0BgALFm61vyCrr+0zDhAQiSdsIjhMz6wPxN8HwPqaI7a0+L6YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=eByKwaoj; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="eByKwaoj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Content-Type:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-To:Resent-Cc:
	Resent-Message-ID:In-Reply-To:References;
	bh=DA8E4EHG0LwuS/1fY1eOBKZGSvbL9Z3cNqNtgWIV6oI=; t=1749193982; x=1750403582; 
	b=eByKwaojfgWx24aDMCoenS3///5chO4apG0JBYlBFk1uutNW4R5cUzv+5WH7TsCe8CyrzsYQGnj
	6qL+FY7xbot4r65rzOWzra/eu6doHjUo+an48FMNYCmpf/DX24W8tfwkx+OBzboh7PaSuAwpkBqhk
	Hv0NWJSLi53ITxWChi2F+XdXEJUjD7qsG//nqCdsZGo8DpmGqrEGkgiL8bZM0GYe/tU1G/4sQPpgv
	T5t/JZ5N2wSXdUg2VHDsfqdsuWlmvNppB4COdc6mP+dEQIfOgV35jlaf+XnoHobYL+i7MDwF6E6/D
	pTA+5zMj1nOOAFhyo7T9Mn1xdwUnRPKSpwyQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1uNRG7-00000007AXn-0Jj3;
	Fri, 06 Jun 2025 09:12:59 +0200
From: Johannes Berg <johannes@sipsolutions.net>
To: linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johannes Berg <johannes.berg@intel.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] drivers: char: SONYPI depends on HAS_IOPORT
Date: Fri,  6 Jun 2025 09:12:56 +0200
Message-ID: <20250606071255.7722-2-johannes@sipsolutions.net>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Johannes Berg <johannes.berg@intel.com>

It already depends on X86_32, but that's also set for ARCH=um.
Recent changes made UML no longer have IO port access since
it's not needed, but this driver uses it. Build it only for
HAS_IOPORT. This is pretty much the same as depending on X86,
but on the off-chance that HAS_IOPORT will ever be optional
on x86 HAS_IOPORT is the real prerequisite.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202506060742.XR3HcxWA-lkp@intel.com/
Signed-off-by: Johannes Berg <johannes.berg@intel.com>
---
 drivers/char/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/Kconfig b/drivers/char/Kconfig
index 8fb33c90482f..36295558dc85 100644
--- a/drivers/char/Kconfig
+++ b/drivers/char/Kconfig
@@ -237,7 +237,7 @@ config APPLICOM
 
 config SONYPI
 	tristate "Sony Vaio Programmable I/O Control Device support"
-	depends on X86_32 && PCI && INPUT
+	depends on X86_32 && PCI && INPUT && HAS_IOPORT
 	depends on ACPI_EC || !ACPI
 	help
 	  This driver enables access to the Sony Programmable I/O Control
-- 
2.49.0

