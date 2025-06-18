Received: from finn.localdomain (finn.gateworks.com [108.161.129.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4507D27E1C6
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 21:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=108.161.129.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750283408; cv=none; b=Lg/MBRnjmsBfn9sHGKlPWGBEmVf7YVKkBVFYFxMZI6c/E1Yaeg2Cp8cvUMTfpd527jkSMYycm5KIN8EIp67D62kELmVm/zccTKOKi6zuOdWa1GCumDHfde0wGd3hsTLoG0WNok8206I5QpvbR05DfVMNk7xB8my42UvaW9h9WlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750283408; c=relaxed/simple;
	bh=u8ZsZoUVbL0NAJtEevhsXeMw+G/e1I3tyTbkcN0BSS4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ibe/oTiW6Y8dBsv8qALUAaGhtDXoWOxmPQfcRL8zCKPpnp3wx8qPy8/cs5qQde3uQVU9WluTaBCDEJD6O5sIIjYxJWL5qMvN1n/l5t70bu+xLtz5macqogxYFuqJd7LHGGelEF6f9bTSSYYF0CJXMEiHbS6xNEEzF7kA52yQhyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com; spf=pass smtp.mailfrom=gateworks.com; arc=none smtp.client-ip=108.161.129.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gateworks.com
Received: from syn-068-189-091-139.biz.spectrum.com ([68.189.91.139] helo=tharvey.pdc.gateworks.com)
	by finn.localdomain with esmtp (Exim 4.95)
	(envelope-from <tharvey@gateworks.com>)
	id 1uS0Dn-007yeJ-J4;
	Wed, 18 Jun 2025 21:21:27 +0000
From: Tim Harvey <tharvey@gateworks.com>
To: Stefano Babic <sbabic@denx.de>,
	Fabio Estevam <festevam@gmail.com>,
	"NXP i.MX U-Boot Team" <uboot-imx@nxp.com>,
	Tim Harvey <tharvey@gateworks.com>,
	Tom Rini <trini@konsulko.com>,
	Marek Vasut <marex@denx.de>,
	u-boot@lists.denx.de
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] add support for gpio-usb-b-connector
Date: Wed, 18 Jun 2025 14:21:18 -0700
Message-Id: <20250618212120.1548575-1-tharvey@gateworks.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linux has a driver for gpio-usb-b-connector that uses a GPIO to
determine host vs peripheral role. This can be useful for USB Type-B
OTG connectors which have an ID pin that is grounded on OTG-to-host
cables and floating on OTG-to-device cables as well as USB power switch
controllers such as the TPS25821 which manages cc pins and has a SINK#
output.

Both scenarios are used for various imx8mp-venice boards.

This series addes support for usb controllers in otg mode
(dr_mode="otg") which have a remote endpoint connector with compatible
'gpio-usb-b-connector' with an id-gpios property.

The first patch adds this capability to the usb_get_dr_mode() function
and the second disables the workarounds used for various imx8mp-venice
boards to default the usb dual-role controllers to host mode. 

Tim Harvey (2):
  usb: common: allow dr_mode to come from gpio-id based usb-connector
  imx8mp-venice: enable USB device mode

 .../dts/imx8mp-venice-gw71xx-2x-u-boot.dtsi   |  5 -
 .../dts/imx8mp-venice-gw72xx-2x-u-boot.dtsi   |  5 -
 .../dts/imx8mp-venice-gw73xx-2x-u-boot.dtsi   |  5 -
 arch/arm/dts/imx8mp-venice-gw74xx-u-boot.dtsi |  5 -
 configs/imx8mp_venice_defconfig               |  7 ++
 drivers/usb/common/common.c                   | 96 ++++++++++++++++++-
 6 files changed, 102 insertions(+), 21 deletions(-)

-- 
2.25.1

