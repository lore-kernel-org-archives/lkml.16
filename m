Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0EEA41;
	Sun, 15 Jun 2025 18:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750012612; cv=none; b=D+iZItn5L0XoHyLwJp2+gwvjcR06+/g6pW29kUgToQv7V3COdL+zdlCcLSbo00GS/M5fLBiDeZGEPUCx7FEHJVtQPhARRPz3b+o9yi9RIUzVYuoPpilFn38y+dCUIki0hg77aysayuLGasVscSQsqezro+FMY9EEBDdqdXdImLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750012612; c=relaxed/simple;
	bh=GVxnzsdwetLlEfh+F8j+H/AGPAz9GnUUem3zyGsu4TE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iPa4de/IXmb/k+f7zC/zZFdomvcFboLgvJZJfS8jyUhIbx6a+dTtP7b/zfytvKiLWPJiJ/N/ckPE0qQmqBjtimqvDAikHeqILQCaCr6Yr2OImuYdakTN6T01D29/SKhbuF7GMvppG2dYg85evAYBJSY9BYglMwwMNr/MTuGirC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=z1T33psk; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="z1T33psk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=4w6TUDubicdI6nzFdYUMl9qS6qTSXww2iwVU2tvfOPA=; b=z1T33psksP5oBA5XrfCqO0LxGx
	v04K32h+F9f5is+wIpsUglxpnMblQKs90QnCH4Xo24cdHqM0HJqfHnwjd0wW0klKUV4Ul3DPif9WD
	06ali8aRW7Yj0T+RgSu6poxuH57YXoF6MbF3Zf1MIT8Kw/1zu8fiHN5KYp/P6JCRZZF3R16/noxsY
	hzJYsKyV4EuQ2mIcOx4vxvWxDy+6+tjkZy+GUSBvNE1ipoOCC56XUbVux5iiOEw9big+88QuP2sN8
	xBPkUTbSopTeLfxx4wuzFp2H6uBkrd6qFe73vwj24T/w/QI/R5F4ZgiBm0ZB5Y56lNq4ppwJ3x+8R
	eSE56Hkw==;
Received: from [50.53.25.54] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQsDk-00000002jnW-0m5b;
	Sun, 15 Jun 2025 18:36:44 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Mattia Dongili <malattia@linux.it>,
	platform-driver-x86@vger.kernel.org,
	linux-um@lists.infradead.org,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] sonypi: add depends on HAS_IOPORT
Date: Sun, 15 Jun 2025 11:36:40 -0700
Message-ID: <20250615183642.902070-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The sonypi driver uses inb()/outb() without depending on HAS_IOPORT,
which leads to build errors since kernel v6.13-rc1:
commit 6f043e757445 ("asm-generic/io.h: Remove I/O port accessors
for HAS_IOPORT=n")

Add the HAS_IOPORT dependency to prevent the build errors.

(Found in ARCH=um allmodconfig builds)

In function ‘inb_p’,
    inlined from ‘sonypi_call2’ at ../drivers/char/sonypi.c:651:2:
include/asm-generic/io.h:542:14: error: call to ‘_inb’ declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
  542 | #define _inb _inb
drivers/char/sonypi.c: In function ‘sonypi_call2’:
include/asm-generic/io.h:596:15: error: call to ‘_outb’ declared with attribute error: outb() requires CONFIG_HAS_IOPORT
  596 | #define _outb _outb

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Mattia Dongili <malattia@linux.it>
Cc: platform-driver-x86@vger.kernel.org
Cc: linux-um@lists.infradead.org
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/char/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- lnx-616-rc1.orig/drivers/char/Kconfig
+++ lnx-616-rc1/drivers/char/Kconfig
@@ -237,7 +237,7 @@ config APPLICOM
 
 config SONYPI
 	tristate "Sony Vaio Programmable I/O Control Device support"
-	depends on X86_32 && PCI && INPUT
+	depends on X86_32 && PCI && INPUT && HAS_IOPORT
 	depends on ACPI_EC || !ACPI
 	help
 	  This driver enables access to the Sony Programmable I/O Control
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494 # v6.16-rc1
