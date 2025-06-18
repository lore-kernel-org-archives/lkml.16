Received: from finn.localdomain (finn.gateworks.com [108.161.129.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56A927F00E
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 21:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=108.161.129.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750283411; cv=none; b=ANxgqd/Pxt7fJ0B3mIHRuR3b63y3Wsn5Ux69a1HY+1FxkgAAy3BZqeKAsrthpne83WQbqLxLPZ4ZPuvDoFTVoOf9ndwl0l9PkcigaKsTAAK0F8e7M6BTtAE2CpYS6gPYA8hdeQ0sSAKX9IAPf/5Ah6FtxH+4TdvwnWbQN3T5srI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750283411; c=relaxed/simple;
	bh=dtSUcDXA9gLdrVobI3l+4mncrd5DHqbn5H1MnslcNw4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TNVKZ4R96YW+ohmcRaHQIM8GnDRt2KDGaxxyHhl0SOEG6uBo1KGHcL4uXhUz/urgPjb9NARplxWWVhVnM8xuo4hZ4y5O96roqEXYiK87n/eN1dhbOBwWdnFNYygqtJLognWgn4XGi2G0P2AzCq7OpEUxVMepQ1oM2nPwTWWNjU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com; spf=pass smtp.mailfrom=gateworks.com; arc=none smtp.client-ip=108.161.129.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gateworks.com
Received: from syn-068-189-091-139.biz.spectrum.com ([68.189.91.139] helo=tharvey.pdc.gateworks.com)
	by finn.localdomain with esmtp (Exim 4.95)
	(envelope-from <tharvey@gateworks.com>)
	id 1uS0Do-007yeJ-UB;
	Wed, 18 Jun 2025 21:21:29 +0000
From: Tim Harvey <tharvey@gateworks.com>
To: Stefano Babic <sbabic@denx.de>,
	Fabio Estevam <festevam@gmail.com>,
	"NXP i.MX U-Boot Team" <uboot-imx@nxp.com>,
	Tim Harvey <tharvey@gateworks.com>,
	Tom Rini <trini@konsulko.com>,
	Marek Vasut <marex@denx.de>,
	u-boot@lists.denx.de
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] imx8mp-venice: enable USB device mode
Date: Wed, 18 Jun 2025 14:21:20 -0700
Message-Id: <20250618212120.1548575-3-tharvey@gateworks.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250618212120.1548575-1-tharvey@gateworks.com>
References: <20250618212120.1548575-1-tharvey@gateworks.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that we can determine device role via a usb-connector ID pin,
remove the host-only mode dt override and enable additional USB
device mode support.

Signed-off-by: Tim Harvey <tharvey@gateworks.com>
---
 arch/arm/dts/imx8mp-venice-gw71xx-2x-u-boot.dtsi | 5 -----
 arch/arm/dts/imx8mp-venice-gw72xx-2x-u-boot.dtsi | 5 -----
 arch/arm/dts/imx8mp-venice-gw73xx-2x-u-boot.dtsi | 5 -----
 arch/arm/dts/imx8mp-venice-gw74xx-u-boot.dtsi    | 5 -----
 configs/imx8mp_venice_defconfig                  | 7 +++++++
 5 files changed, 7 insertions(+), 20 deletions(-)

diff --git a/arch/arm/dts/imx8mp-venice-gw71xx-2x-u-boot.dtsi b/arch/arm/dts/imx8mp-venice-gw71xx-2x-u-boot.dtsi
index a291b7abab62..c1d21e51c4e6 100644
--- a/arch/arm/dts/imx8mp-venice-gw71xx-2x-u-boot.dtsi
+++ b/arch/arm/dts/imx8mp-venice-gw71xx-2x-u-boot.dtsi
@@ -54,8 +54,3 @@
 		line-name = "pci_wdis#";
 	};
 };
-
-/* gpio-usb-con not supported yet in U-Boot so make this a host for now */
-&usb_dwc3_0 {
-	dr_mode = "host";
-};
diff --git a/arch/arm/dts/imx8mp-venice-gw72xx-2x-u-boot.dtsi b/arch/arm/dts/imx8mp-venice-gw72xx-2x-u-boot.dtsi
index bdf5370fcdf6..9f6d05fdae0c 100644
--- a/arch/arm/dts/imx8mp-venice-gw72xx-2x-u-boot.dtsi
+++ b/arch/arm/dts/imx8mp-venice-gw72xx-2x-u-boot.dtsi
@@ -89,8 +89,3 @@
 		line-name = "pci_wdis#";
 	};
 };
-
-/* gpio-usb-con not supported yet in U-Boot so make this a host for now */
-&usb_dwc3_0 {
-	dr_mode = "host";
-};
diff --git a/arch/arm/dts/imx8mp-venice-gw73xx-2x-u-boot.dtsi b/arch/arm/dts/imx8mp-venice-gw73xx-2x-u-boot.dtsi
index 7e6f66bd9dd9..3b23802e9a7d 100644
--- a/arch/arm/dts/imx8mp-venice-gw73xx-2x-u-boot.dtsi
+++ b/arch/arm/dts/imx8mp-venice-gw73xx-2x-u-boot.dtsi
@@ -95,8 +95,3 @@
 		line-name = "pci_wdis#";
 	};
 };
-
-/* gpio-usb-con not supported yet in U-Boot so make this a host for now */
-&usb_dwc3_0 {
-	dr_mode = "host";
-};
diff --git a/arch/arm/dts/imx8mp-venice-gw74xx-u-boot.dtsi b/arch/arm/dts/imx8mp-venice-gw74xx-u-boot.dtsi
index 95f5f15e742a..a82ce5a19788 100644
--- a/arch/arm/dts/imx8mp-venice-gw74xx-u-boot.dtsi
+++ b/arch/arm/dts/imx8mp-venice-gw74xx-u-boot.dtsi
@@ -250,8 +250,3 @@
 &wdog1 {
 	bootph-pre-ram;
 };
-
-/* gpio-usb-con not supported yet in U-Boot so make this a host for now */
-&usb_dwc3_0 {
-	dr_mode = "host";
-};
diff --git a/configs/imx8mp_venice_defconfig b/configs/imx8mp_venice_defconfig
index 158ce4327488..2c9c6e5564fc 100644
--- a/configs/imx8mp_venice_defconfig
+++ b/configs/imx8mp_venice_defconfig
@@ -70,6 +70,7 @@ CONFIG_CMD_I2C=y
 CONFIG_CMD_MMC=y
 CONFIG_CMD_PCI=y
 CONFIG_CMD_USB=y
+CONFIG_CMD_USB_MASS_STORAGE=y
 CONFIG_CMD_CAT=y
 CONFIG_CMD_SETEXPR_FMT=y
 CONFIG_CMD_XXD=y
@@ -163,6 +164,7 @@ CONFIG_IMX_TMU=y
 # CONFIG_TPM_V1 is not set
 CONFIG_TPM2_TIS_SPI=y
 CONFIG_USB=y
+CONFIG_DM_USB_GADGET=y
 CONFIG_USB_XHCI_HCD=y
 CONFIG_USB_XHCI_DWC3=y
 CONFIG_USB_XHCI_DWC3_OF_SIMPLE=y
@@ -178,6 +180,11 @@ CONFIG_USB_ETHER_LAN78XX=y
 CONFIG_USB_ETHER_MCS7830=y
 CONFIG_USB_ETHER_RTL8152=y
 CONFIG_USB_ETHER_SMSC95XX=y
+CONFIG_USB_GADGET=y
+CONFIG_USB_GADGET_MANUFACTURER="Gateworks"
+CONFIG_USB_GADGET_VENDOR_NUM=0x0525
+CONFIG_USB_GADGET_PRODUCT_NUM=0xa4a5
+CONFIG_USB_GADGET_DOWNLOAD=y
 CONFIG_IMX_WATCHDOG=y
 CONFIG_TPM=y
 # CONFIG_SPL_SHA512 is not set
-- 
2.25.1

