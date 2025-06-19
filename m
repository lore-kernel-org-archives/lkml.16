Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EDA23CB;
	Thu, 19 Jun 2025 18:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750358245; cv=pass; b=Ek5mXnhOilashVHHfQud5BIy8Al6xAJz+TEFnM0PSB6kymro3kAG8Af133t0RAOwXEQzpMBBCkuXvR5AfKhQu47/siMeBD6Ctk6yjzNvXP9PSuC3+CxJHdYhjSV2CJwFWq16UfjEG0SmpjNmtdzCzID9pt/wF/Iw35pWF85G9nc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750358245; c=relaxed/simple;
	bh=XNBzWlxMTRyuBHZBLMpzxvpsNdFqkNLkqiOFp1Z7t4I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hpyTBDLg6qlIk1s4ilRMX1j6v9zRuy0zCzWdbFw0TTi87Kbtnj+evH3LcIQYUNmk3Oxzn7nB2FxKYMDoeVLrqu3sGgfmRbCvKVtvIEvs9DcTFRA2LPqkwbT/JCD552bbNdUilQRzutE/upm/z07a0p0NKWuZ35r7Y+jxBYqbTQw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=WYxBeqPm; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="WYxBeqPm"
ARC-Seal: i=1; a=rsa-sha256; t=1750358210; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JwIQrCkcAhboJiUhmHNXqk1Abj0FB9b72iTycYEzv6iMwQikYK3OFSXfbg2YredFGKXhMeGf8FbKhXoGCTnRgkBdg2WD4YJKTOvL54bn40SRfyIKVFSXWx2jOIOItyyR40bczKH6y147DJT+KYuGsISiyAkU9bMYCQuLmvAffQQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750358210; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zMABvQfM1H6QX+dC9DoPW5FbqUymEExjF608nnNcYUM=; 
	b=AutKEsMeTbgpA4OBNfe3izr7pTkKxKUvVUD9WjGIqg0QxIHjIon8X5ASe8Kvxbf1UN8/CW/0zNaLg1Pnqj7OovMvvb2ZABVgXdMPOEf51wJ7vzETAjJO5wW/wt+JnWndHtRp1fnPVnEMH5WLq3KNw6OeXnluRhJc0jSG+b4unvU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750358210;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=zMABvQfM1H6QX+dC9DoPW5FbqUymEExjF608nnNcYUM=;
	b=WYxBeqPmXY/kpAneKHGolqwG3qYcEe6Qzc8BRRidh+hMqn3FweDshYP4B6sZvcHl
	v5hGhumGLwn89DAkZNkuBL6Rn1EFmyAk2jerlVtcS8Xu310/oRUEmLYHCory/UG6K1c
	lVa1xqUK8J2ociffXmdWx+eQjJ0czxLdEBzLYKB8=
Received: by mx.zohomail.com with SMTPS id 1750358207480287.08214886347105;
	Thu, 19 Jun 2025 11:36:47 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH v5 0/2] RK3576 USB Enablement
Date: Thu, 19 Jun 2025 20:36:35 +0200
Message-Id: <20250619-rk3576-sige5-usb-v5-0-9069a7e750e1@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALNYVGgC/23QTW7DIBAF4KtYrEvFP3ZWvUfVBZAhQU1MC46VK
 vLdOyWLVC1iNaD3zRM3UqEkqGQ33EiBNdWUZxz000DC0c0HoGmPMxFMaCbFSMu71NbQmg6g6aV
 6KiTjTDgAFxzB2EeBmK6NfH27zwU+Lygv90viXQUa8vmclt0ww3WhTTd8Ij+BY6pLLl+t0spbo
 r0rZv9vXzll1FiAwI2Jo4gvIZ9OzufinnFFA1fxQPB0EIHIXnunJNNReugh8jfSayIRGScftTN
 chdBtoh6I4ayDKEQs2GjthP8R+F9k27ZvLAT/wbQBAAA=
X-Change-ID: 20250328-rk3576-sige5-usb-230102aeeaca
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Frank Wang <frank.wang@rock-chips.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Alexey Charkov <alchark@gmail.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2

This series is the result of what I thought would be a quick 10 minute
job, but turned out to be more like 3 days of pain, suffering, and
confusion. This should be expected with USB Type C though.

The first patch in the series extends the inno usb2 PHY driver to fiddle
with some GRF flags in that driver when the PHY is connected to a USB
Type C port. Without this change, devices on USB-C simply don't
enumerate at all, as the state machine gets stuck waiting for vbus to go
low or something along those lines.

An alternate way to implement this would've been a vendor property in
the PHY binding which is then checked for in the driver and needs to be
present in all rockchip inno u2phy instances that happen to be connected
to a USB Type C connector. This is what downstream does, for example.

Patch 2 adds the USB related nodes, including associated regulators and
Type C controllers, to the Sige5 tree.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
Changes in v5:
- drop orientation handling patches, as this needs a proper solution in
  dwc3
- remove redundant property_enabled checks on svbus flags in otg_sm_work
- Link to v4: https://lore.kernel.org/r/20250610-rk3576-sige5-usb-v4-0-7e7f779619c1@collabora.com

Changes in v4:
- Rebase onto v6.16-rc1, no other changes
- Link to v3: https://lore.kernel.org/r/20250507-rk3576-sige5-usb-v3-0-89bf5a614ccf@collabora.com

Changes in v3:
- Drop the utmi clock patch. This was always a speculative fix for a
  problem I could no longer reproduce, and it doesn't conform to the
  binding, as Robo-rob correctly caught.
- Link to v2: https://lore.kernel.org/r/20250505-rk3576-sige5-usb-v2-0-d5ba4305f3be@collabora.com

Changes in v2:
- Rebased onto next-20250505
- Drop the u2susphy quirk, as I can no longer reproduce the original
  problem with various amounts of ripping up the DT and changing the
  config. Yeah I'm not super hyped about this now being a heisenbug
  either.
- Drop the bindings patch, as Rob showed me there's a way to do this
  without extending the bindings
- Rewrite the usb 2 phy driver patch to no longer walk an OF graph from
  PHY to connector, but instead first find the USB controller that uses
  this PHY, and then use the USB controller's existing graph connection
  to the usb connector.
- Adjust the Sige5 DTS patch to now have two port connections from the
  USB connector to the drd0 USB controller, one for high-speed aka
  USB2, one for super-speed aka USB3, ordered as per its binding.
- Add a patch for rk3576.dtsi to reference u2phy1 as a clock in the drd1
  controller.
- Add two patches to fix USB Type-C super speed in reverse orientation.
- Link to v1: https://lore.kernel.org/r/20250407-rk3576-sige5-usb-v1-0-67eec166f82f@collabora.com

---
Nicolas Frattaroli (2):
      phy: rockchip: inno-usb2: add soft vbusvalid control
      arm64: dts: rockchip: enable USB on Sige5

 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 160 +++++++++++++++++++++
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c      | 108 +++++++++++++-
 2 files changed, 264 insertions(+), 4 deletions(-)
---
base-commit: 1d07605c859ee3f483f07acd461452d9e505c58c
change-id: 20250328-rk3576-sige5-usb-230102aeeaca

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

