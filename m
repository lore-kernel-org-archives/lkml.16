Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F5E1DE4C2
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738866230; cv=none; b=JQgL4UvCetxjZdm9OUgNS8mSQ8VB5P/iMnCoyUeT2pi0ASEmTrXR2yzS58WDHcpXsm+95zjPJAJgzC3GRxMmvjDDnCHkhKuWcdaX+YV7ao3nlEPWkjvMMxwTRDTzPYO4WdSPUiDnHCIJ+FK+nfzHPCGC3j7GJwZFxazKnoeJeQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738866230; c=relaxed/simple;
	bh=nV50d2l8sTAqpRlICAUv2Vcnn5FZGi3rfjs5+uF2t8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r11PNbxrknb1ArXh+4IbLUrnwBsJ4MxmEQeqwHwT34hB7nIrDzzKUTw3zimKr/4VvyvTm1JQSuqxlmo1R3llMgUvIkO/+mS4B6ZXS+YEkCJyriyerlPMbji3OOJ/WedVXTfxikaSYTM/48b1sKeAicEDhb8fOOftvLwOYCYWiO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=CqNFplqc; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="CqNFplqc"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso8338295e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 10:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738866226; x=1739471026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/FWF5GVFFYijTs0iTNX9qsUXQnQLDn7QOW15p8JmhQ=;
        b=CqNFplqcfDNf9xAJJlEoNmhYJ5Ue7b/JtovZw32pU24AplLUft3F0LSSS9ZqBwCTwn
         +XxgQVEac97OnhCo4D9B1FQsYXCYXJzvCbW8uHioTAYcMSkBW9IWXM2QBJiPCeFucurx
         3KTTNXOCKq0S5I7yX+rNBxiJ3CT2shlOMY7/KG7E1/3TjLNONIvqmJHV1MWQEyF6cVNy
         9vKS8TyX7yYl6JKj+YPnz0r0XEDFKqY091sEMPo+HHgUdrgNie3YFcipcvFcq0bcHEpc
         zlEMX0hWEz4HRFTdDUGrTd9LrSMq0P/Q+XGrh5BEIcqaUtge55fyzmdPEx2z2iL/vt4m
         nDuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738866226; x=1739471026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X/FWF5GVFFYijTs0iTNX9qsUXQnQLDn7QOW15p8JmhQ=;
        b=Ot6Rz2746wXpZC2VlHHndckrgMjKqVVNv/hcPi6aPW8jMlj4q20rR0D/2A4ugTjjLH
         WpqweEzQ/tkBaJGb94YhjGiiodI86M0hIEjzhsIWRmgk9YHwsi2UCxjcWR8ay1xFI2GS
         sskj7BVHYiinME/MP28OFqyz9K3KfBuMyOsLa4mwu8tQLAt85SxslKFyt+zdlzp0d3wl
         F2C3A98t20jIv14Pi7YbkkwKNVHk6ZV7C8yA+uUgMvodzNCgRmQCLcEfo2at3dgbQZiU
         p1MAuqIhW6XlBDxxk4SfCwi/vdlfhet18EzUuM7LhfSqRuu5NMpZcmjnFso7ui3FzTJM
         oJjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtkufr0ldrxhKKD2mAr35ltGClzQMyBL5+5VM6EIkPcY1NlFqXad/iAszM5vGngCXN4DcBkIzvaFR1U/k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz93NgsXB36F3OJi3uPJEjiWrzB7IjtI/Pq9pmiyy3AZ6HvypFy
	zsxM9qr3X7Bv8YQv7Nf15oZ8v5dfPGQ+tJVOFCW7PgUzKtnr+exEmjhlyI7eQXM=
X-Gm-Gg: ASbGncvMMWHWY/ePYe5JysvsINH6loBVKlxOTHN3HftYXjXNCnfM2B3qIKKoQad94Pb
	e7EZIo6LrcXgRQneV+3Dx9XdSbRdowjQ71bSPH1VzSIRzTBWftQ/m31TlDrSCTKw5Q7McfnprUp
	RMAK4YvB0as58wtzrn+MvHs6+LxBwB0ET3Dry1N/Ms62FE/28o84BSVpKuV0GRYEQ9HUPrnwX4B
	29zp3cIn6ne7nfx808MPDmbBdZzq+QHHk1Gm8i3/3jjtcHrYwXKwRAzkJBX24DVZhctjkV+1ZDP
	9Mw6k9sAU7L29wvw5w==
X-Google-Smtp-Source: AGHT+IFPFWwc8fGqtGIXVNtpOYmBu6OWnd8LThioOVo0HoEt9wKjs1fCD9BbEhP+jFqsl+rjz7Twsg==
X-Received: by 2002:a05:6000:1a8d:b0:38a:418e:bee with SMTP id ffacd0b85a97d-38dc935f488mr7518f8f.42.1738866226191;
        Thu, 06 Feb 2025 10:23:46 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:a0d6:294f:5246:28d4])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4390d94d802sm66111445e9.12.2025.02.06.10.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 10:23:43 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/7] clk: amlogic: axg-audio: use the auxiliary reset driver - take 2
Date: Thu,  6 Feb 2025 19:23:17 +0100
Message-ID: <20250206-aux-device-create-helper-v2-7-fa6a0f326527@baylibre.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250206-aux-device-create-helper-v2-0-fa6a0f326527@baylibre.com>
References: <20250206-aux-device-create-helper-v2-0-fa6a0f326527@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5924; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=PbrzrWR160CDTRwBAVf6FavVZYakvRgUuUnwzkJYQt8=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnpPrPVTVuWbsfmdKU3lPHHMpUgwx9aqJtnzkX2
 4Jo4NjtLiaJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ6T6zwAKCRDm/A8cN/La
 hXPPD/9nSvI5m4n7b33Jqf3PGpwL6Fj4tSieLIiPuPqeC7uPEmwcOirgLEY1mIy6NIlj8kx6pHt
 QzZFHoCymBXeq3b9qIsBsmOXPSxQ9r84itAQFTfC3L8WVRKkkguRdP6mPiW5MLZ2GiHzPMV7uP4
 qK6GX2u7FcdtPmJSRMZ53IC7dGuyEDa4MQBfeoq1dopJ5cJP6ln9KGT+MuPx3ZOcHSiaSJy8N7E
 xAR+0UkfrBzXNnGoIVHlm0lFjRfSJM7ivdIJZL+8e5j9kN4CrtfqMXlMiJUr6LtovkQPNQiapJl
 tun1aikweFqNot4nAlnMKZSoUv+zBMa3tlFwWi7yUGsxQTESRBk699KrwYO2D1OtQJoi+cwhWpc
 1rtHmokxPL0XAiZ1bJi2YkvG2qWlVwkun2kTXXPrTLOpx6uMeBC2lJlNO85ObSQ4wxR5vNOAM4U
 vIYlS8bPgLFRVRhJr3ihGfMJkgmEZJSUcYxc3ADe006DBcI6lAIi1mfAuKSFM0cVGGPAf/jSiEd
 aUDL3f+yjd2poXSuNPzJ3lYITlOnURPp/aqkfztiE4z8C5cOs7x9JGouceOr7R4h/9DWBU9crER
 Am840kk0llNhkDw5HlNttPDDQNQlGnSR0leJ+EikzV+vV11RYYkvnc0IdrcW09XHD/wbtBIJroG CQp8n2ZiK81Be3A==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp; fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
Content-Transfer-Encoding: 8bit

Remove the implementation of the reset driver in axg audio
clock driver and migrate to the one provided by reset framework
on the auxiliary bus.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---

 There has been a discussion about the use on imply here.
 After re-reading the documentation I've decided to stick with
 imply in this version:

 > This is useful e.g. with multiple drivers that want to indicate their
 > ability to hook into a secondary subsystem while allowing the user to
 > configure that subsystem out without also having to unset these drivers.

 IMO, this is a pretty accurate description of the use case in this change.

 The pitfall mentioned in the doc does not apply as there is not link error
 regardless of the config of RESET_MESON_AUX.

 I also think this is more readeable and maintainable than a bunch of
 'default CONFIG_FOO if CONFIG_FOO' for CONFIG_RESET_MESON_AUX. This approach
 also would have several pitfall, such as picking the value of the first config
 set or the config of RESET_MESON_AUX staying to 'n' if CONFIG_FOO is turned on
 with menuconfig.
 
 drivers/clk/meson/Kconfig     |   2 +-
 drivers/clk/meson/axg-audio.c | 114 +++++-------------------------------------
 2 files changed, 14 insertions(+), 102 deletions(-)

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index be2e3a5f83363b07cdcec2601acf15780ff24892..7cb21fc223b063cb93812643f02f192343981ed8 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -106,7 +106,7 @@ config COMMON_CLK_AXG_AUDIO
 	select COMMON_CLK_MESON_SCLK_DIV
 	select COMMON_CLK_MESON_CLKC_UTILS
 	select REGMAP_MMIO
-	select RESET_CONTROLLER
+	imply RESET_MESON_AUX
 	help
 	  Support for the audio clock controller on AmLogic A113D devices,
 	  aka axg, Say Y if you want audio subsystem to work.
diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
index 9df627b142f89788966ede0262aaaf39e13f0b49..172d3e8157d2e9a6f3cdc4ed7bea89791824493a 100644
--- a/drivers/clk/meson/axg-audio.c
+++ b/drivers/clk/meson/axg-audio.c
@@ -4,6 +4,7 @@
  * Author: Jerome Brunet <jbrunet@baylibre.com>
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/init.h>
@@ -12,7 +13,6 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
-#include <linux/reset-controller.h>
 #include <linux/slab.h>
 
 #include "meson-clkc-utils.h"
@@ -1678,84 +1678,6 @@ static struct clk_regmap *const sm1_clk_regmaps[] = {
 	&sm1_earcrx_dmac_clk,
 };
 
-struct axg_audio_reset_data {
-	struct reset_controller_dev rstc;
-	struct regmap *map;
-	unsigned int offset;
-};
-
-static void axg_audio_reset_reg_and_bit(struct axg_audio_reset_data *rst,
-					unsigned long id,
-					unsigned int *reg,
-					unsigned int *bit)
-{
-	unsigned int stride = regmap_get_reg_stride(rst->map);
-
-	*reg = (id / (stride * BITS_PER_BYTE)) * stride;
-	*reg += rst->offset;
-	*bit = id % (stride * BITS_PER_BYTE);
-}
-
-static int axg_audio_reset_update(struct reset_controller_dev *rcdev,
-				unsigned long id, bool assert)
-{
-	struct axg_audio_reset_data *rst =
-		container_of(rcdev, struct axg_audio_reset_data, rstc);
-	unsigned int offset, bit;
-
-	axg_audio_reset_reg_and_bit(rst, id, &offset, &bit);
-
-	regmap_update_bits(rst->map, offset, BIT(bit),
-			assert ? BIT(bit) : 0);
-
-	return 0;
-}
-
-static int axg_audio_reset_status(struct reset_controller_dev *rcdev,
-				unsigned long id)
-{
-	struct axg_audio_reset_data *rst =
-		container_of(rcdev, struct axg_audio_reset_data, rstc);
-	unsigned int val, offset, bit;
-
-	axg_audio_reset_reg_and_bit(rst, id, &offset, &bit);
-
-	regmap_read(rst->map, offset, &val);
-
-	return !!(val & BIT(bit));
-}
-
-static int axg_audio_reset_assert(struct reset_controller_dev *rcdev,
-				unsigned long id)
-{
-	return axg_audio_reset_update(rcdev, id, true);
-}
-
-static int axg_audio_reset_deassert(struct reset_controller_dev *rcdev,
-				unsigned long id)
-{
-	return axg_audio_reset_update(rcdev, id, false);
-}
-
-static int axg_audio_reset_toggle(struct reset_controller_dev *rcdev,
-				unsigned long id)
-{
-	int ret;
-
-	ret = axg_audio_reset_assert(rcdev, id);
-	if (ret)
-		return ret;
-
-	return axg_audio_reset_deassert(rcdev, id);
-}
-
-static const struct reset_control_ops axg_audio_rstc_ops = {
-	.assert = axg_audio_reset_assert,
-	.deassert = axg_audio_reset_deassert,
-	.reset = axg_audio_reset_toggle,
-	.status = axg_audio_reset_status,
-};
-
 static struct regmap_config axg_audio_regmap_cfg = {
 	.reg_bits	= 32,
 	.val_bits	= 32,
@@ -1766,8 +1688,7 @@ struct audioclk_data {
 	struct clk_regmap *const *regmap_clks;
 	unsigned int regmap_clk_num;
 	struct meson_clk_hw_data hw_clks;
-	unsigned int reset_offset;
-	unsigned int reset_num;
+	const char *rst_drvname;
 	unsigned int max_register;
 };
 
@@ -1775,7 +1696,7 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	const struct audioclk_data *data;
-	struct axg_audio_reset_data *rst;
+	struct auxiliary_device *auxdev;
 	struct regmap *map;
 	void __iomem *regs;
 	struct clk_hw *hw;
@@ -1834,22 +1755,15 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	/* Stop here if there is no reset */
-	if (!data->reset_num)
-		return 0;
-
-	rst = devm_kzalloc(dev, sizeof(*rst), GFP_KERNEL);
-	if (!rst)
-		return -ENOMEM;
-
-	rst->map = map;
-	rst->offset = data->reset_offset;
-	rst->rstc.nr_resets = data->reset_num;
-	rst->rstc.ops = &axg_audio_rstc_ops;
-	rst->rstc.of_node = dev->of_node;
-	rst->rstc.owner = THIS_MODULE;
+	/* Register auxiliary reset driver when applicable */
+	if (data->rst_drvname) {
+		auxdev = devm_auxiliary_device_create(dev, dev->driver->name,
+						      data->rst_drvname, NULL, 0);
+		if (IS_ERR(auxdev))
+			return PTR_ERR(auxdev);
+	}
 
-	return devm_reset_controller_register(dev, &rst->rstc);
+	return 0;
 }
 
 static const struct audioclk_data axg_audioclk_data = {
@@ -1869,8 +1783,7 @@ static const struct audioclk_data g12a_audioclk_data = {
 		.hws = g12a_audio_hw_clks,
 		.num = ARRAY_SIZE(g12a_audio_hw_clks),
 	},
-	.reset_offset = AUDIO_SW_RESET,
-	.reset_num = 26,
+	.rst_drvname = "rst-g12a",
 	.max_register = AUDIO_CLK_SPDIFOUT_B_CTRL,
 };
 
@@ -1881,8 +1794,7 @@ static const struct audioclk_data sm1_audioclk_data = {
 		.hws = sm1_audio_hw_clks,
 		.num = ARRAY_SIZE(sm1_audio_hw_clks),
 	},
-	.reset_offset = AUDIO_SM1_SW_RESET0,
-	.reset_num = 39,
+	.rst_drvname = "rst-sm1",
 	.max_register = AUDIO_EARCRX_DMAC_CLK_CTRL,
 };
 

-- 
2.45.2

