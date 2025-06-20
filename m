Received: from pf-012.whm.fr-par.scw.cloud (pf-012.whm.fr-par.scw.cloud [51.159.173.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5BE1E47B7;
	Fri, 20 Jun 2025 14:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.173.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750429676; cv=none; b=HBbsoDLnuwhhDg9oiKcFLxCacT69oMEYIvBVZPlFxFxsEdwSdpc2Lbt/0zjzNNuh0YqKr1PDIJWee79JbbDxoVXyv0PlhTTg8AMpbhGayS6svGDnQ/zD3E2FtIQVPXhVdsdB8bTA3/W8LKxSyo08nbS179GPhU8jv7rl5jL+yiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750429676; c=relaxed/simple;
	bh=E8Plfmdgq+6cfcuVqI3CT/7JUjKbKcYEKI5VFigoooQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pKPlEUCM2xY10KjHOmmBjy4IAlWdaxeV5y9/0bWrUu495csf3kGMqfgV1U+u2VFGgSyvtEfI0Eau0Wu7v8aFbTG0vTHOTnXHPogDRyArfCrc3KqW3A/S8hmfOYSj+fUE7qWuMcXKyHJ0hbRY2zIYs7iqz3ePR8x+87cKunDrDsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cyber.gouv.fr; spf=pass smtp.mailfrom=oss.cyber.gouv.fr; dkim=pass (2048-bit key) header.d=oss.cyber.gouv.fr header.i=@oss.cyber.gouv.fr header.b=aWTkQErB; arc=none smtp.client-ip=51.159.173.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cyber.gouv.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cyber.gouv.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oss.cyber.gouv.fr header.i=@oss.cyber.gouv.fr header.b="aWTkQErB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=oss.cyber.gouv.fr; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0rsZWx+4JUDSAaqG2b4ZgDsynw5G2Gsxxx00bsx043I=; b=aWTkQErBolZRqk+F0wSvZ4NH3q
	38tFF81DsQDeWA4kuJabfhUG28xB17CVwQLjprdJ8BkwK4carGQIhla14DB2afqsWyAeZ2087VjIa
	mvj15H1nKIIic4iluUJMKb/gNa42vvPs/ZeWOoluTwpoXhw/Z2oZbbljK9zRw9MaaLz6tLpyIn1Uy
	U38AehgKnZpaSb6LgxNO7JhyZG6NfeB8YDTOoOI/o8wXVuoVfXVoPdgo/JyqFabJmP4w+Dsi9jLfM
	iP4CJO2hSUbffGU7ITrvyZ1WADgvW905Zyd8tUXmzILPUOyrTFSse1jHBSYiTvzxvUQlVliPaD3Nj
	CZ7UgA4w==;
Received: from laubervilliers-658-1-215-187.w90-63.abo.wanadoo.fr ([90.63.246.187]:43571 helo=[10.224.8.110])
	by pf-012.whm.fr-par.scw.cloud with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <nicolas.bouchinet@oss.cyber.gouv.fr>)
	id 1uScih-00000007rNQ-1ges;
	Fri, 20 Jun 2025 16:27:52 +0200
From: nicolas.bouchinet@oss.cyber.gouv.fr
Date: Fri, 20 Jun 2025 16:27:19 +0200
Subject: [RFC PATCH 4/4] usb: core: Add Kconfig option to compile usb
 authorization
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-usb_authentication-v1-4-0d92261a5779@ssi.gouv.fr>
References: <20250620-usb_authentication-v1-0-0d92261a5779@ssi.gouv.fr>
In-Reply-To: <20250620-usb_authentication-v1-0-0d92261a5779@ssi.gouv.fr>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, 
 Kannappan R <r.kannappan@intel.com>, 
 Sabyrzhan Tasbolatov <snovitoll@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Stefan Eichenberger <stefan.eichenberger@toradex.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Pawel Laszczak <pawell@cadence.com>, 
 Ma Ke <make_ruc2021@163.com>, Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 Luc Bonnafoux <luc.bonnafoux@ssi.gouv.fr>, 
 Luc Bonnafoux <luc.bonnafoux@oss.cyber.gouv.fr>, 
 Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
X-Mailer: b4 0.14.2
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - pf-012.whm.fr-par.scw.cloud
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - oss.cyber.gouv.fr
X-Get-Message-Sender-Via: pf-012.whm.fr-par.scw.cloud: authenticated_id: nicolas.bouchinet@oss.cyber.gouv.fr
X-Authenticated-Sender: pf-012.whm.fr-par.scw.cloud: nicolas.bouchinet@oss.cyber.gouv.fr
X-Source: 
X-Source-Args: 
X-Source-Dir: 

From: Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>

This enables the usb authentication protocol implementation.

Co-developed-by: Luc Bonnafoux <luc.bonnafoux@ssi.gouv.fr>
Signed-off-by: Luc Bonnafoux <luc.bonnafoux@ssi.gouv.fr>
Signed-off-by: Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>
---
 drivers/usb/core/Kconfig  | 8 ++++++++
 drivers/usb/core/Makefile | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/usb/core/Kconfig b/drivers/usb/core/Kconfig
index 58e3ca7e479392112f656384c664efc36bb1151a..07ba67137b7fe16ecb1e993a51dbbfd4dd3ada88 100644
--- a/drivers/usb/core/Kconfig
+++ b/drivers/usb/core/Kconfig
@@ -143,3 +143,11 @@ config USB_DEFAULT_AUTHORIZATION_MODE
 	  ACPI selecting value 2 is analogous to selecting value 0.
 
 	  If unsure, keep the default value.
+
+config USB_AUTHENTICATION
+	bool "Enable USB authentication function"
+	default n
+	depends on USB
+	help
+		Enables the USB Authentication function. This activates the
+		hook points in the USB stack.
diff --git a/drivers/usb/core/Makefile b/drivers/usb/core/Makefile
index ac006abd13b3ad8362dc7baa115124c11eaafc84..7ba1a89cf3de7a398889eee1820f2bfbbc4280f5 100644
--- a/drivers/usb/core/Makefile
+++ b/drivers/usb/core/Makefile
@@ -8,6 +8,10 @@ usbcore-y += config.o file.o buffer.o sysfs.o endpoint.o
 usbcore-y += devio.o notify.o generic.o quirks.o devices.o
 usbcore-y += phy.o port.o
 
+ifdef CONFIG_USB_AUTHENTICATION
+usbcore-y += authent.o authent_netlink.o
+endif
+
 usbcore-$(CONFIG_OF)		+= of.o
 usbcore-$(CONFIG_USB_PCI)		+= hcd-pci.o
 usbcore-$(CONFIG_ACPI)		+= usb-acpi.o

-- 
2.50.0

