Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17329289354;
	Wed,  7 May 2025 13:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746623279; cv=pass; b=c5RTlcq6xu/CIBXau/YCDGMvaUJVfGKGMRnhQMtiO3ai0grcLmJwT7amCNsSUTYqqtuLo1Z+tQbzLbwsyDth2NY6h1Z6M2/k7AubJErHsbClgnWpyxmevS14fcFrDwH005LgYi77iucxe0SxG/csJd1fn4v/gyHp0E2McuucHNk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746623279; c=relaxed/simple;
	bh=8bPpg0g//poqSPSOET3TWXud8G1e7PDUSMlZlFjOHss=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DZQBN6z+2oZ7prXp2SNLPTOfRs+WX+r13Bd6qvUfMKcmVVO0R21/RK6TZTWFaQORaID3dCRHcKZNI/AzjWoNV6kqpOp17MQRzyM5dHgpku55mNEtgo2yRr2M536cIFODNhHqbfxdzKnBMBpUITqZ8DOHAwFZq/y3AysFJNFE/i0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=VdbAlsUq; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="VdbAlsUq"
ARC-Seal: i=1; a=rsa-sha256; t=1746623256; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IwY3ykgOwrUBvSTJwZdmILe5IqO4URVw9dkB2xU4v+4rhcPRqmT84NtSPjrmXEtztJHAJHIK46UGPui1ogE/3kuN0MnU7aBL7UoDqsmA3h+FLSw+ayFbGJ8H+K6A0FIGr8rxGs/XRe21JrhIOL+vhoC2RfGxdCZJfHo6ugPyFds=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746623256; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Ois1Fd82wI7ofzgzDY4Ae0abXH2Pnyq9b6BQ8TCglMI=; 
	b=KrstOi4qwmaZZ+K5Te0WYXuHPNWUQGLl4/C+7ss3YK1RC2eCBQ95SZOMy/uTSRenZIF2q+MuxExNhPsqjrwsTsFYyfLss0Gd+A5TnKZr2XPtxwbt/nDCYhT7dCXQwnEttPK6Hc5FRel4YOZLrXRa9uLrBNXtefLh61hy1cCxW5o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746623256;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=Ois1Fd82wI7ofzgzDY4Ae0abXH2Pnyq9b6BQ8TCglMI=;
	b=VdbAlsUqLQqJPN55PYHT1PEtZLlOQHPl8IsmrUTn1mfbqfqtMTpX2pkD807EPQDn
	gLawO6JVWXjV9Bxo+BaWuKAFhDh7sb2rwIU+3LsnqswpkcyPIpIwCB2UNhTfMANZAgy
	4peyfXdApkdX7wpO4UVHKQGqQH3VtuO+DRQljd0Y=
Received: by mx.zohomail.com with SMTPS id 1746623254340277.28883250107697;
	Wed, 7 May 2025 06:07:34 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH v3 0/4] RK3576 USB Enablement
Date: Wed, 07 May 2025 15:07:20 +0200
Message-Id: <20250507-rk3576-sige5-usb-v3-0-89bf5a614ccf@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAhbG2gC/23OQQ6CMBAF0KuQrh1TWgrElfcwLtoyQCNQbYFgC
 He3loWJmln9Nv/NrMSjM+jJKVmJw9l4Y4cQ+CEhupVDg2CqkAmjTFDOSnA3LoocvGlQwOQVME5
 TyiSi1JKE2t1hbZZIXq57dviYgjzuj0RJj6Bt35vxlAy4jBD1MORdaI0frXvGk+Y0NuJ/Rovf7
 XMKFPICUad5XpesPmvbdVJZJ49hRQRn9kHC/EFYQCqhZMapqLnCb2TbtheP66iFKgEAAA==
X-Change-ID: 20250328-rk3576-sige5-usb-230102aeeaca
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Frank Wang <frank.wang@rock-chips.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 kernel@collabora.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
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

Patch 2 and 3 allow Super Speed in reverse orientation on USB Type-C
connectors to work, but I am not entirely confident in the solution I
arrived at.

Patch 4 adds the USB related nodes, including associated regulators and
Type C controllers, to the Sige5 tree.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
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
Nicolas Frattaroli (4):
      phy: rockchip: inno-usb2: add soft vbusvalid control
      phy: rockchip: usbdp: move orientation handling further down
      phy: rockchip: usbdp: reset USB3 and reinit on orientation switch
      arm64: dts: rockchip: enable USB on Sige5

 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 160 +++++++++++++++++++++
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c      | 113 ++++++++++++++-
 drivers/phy/rockchip/phy-rockchip-usbdp.c          | 154 +++++++++++++-------
 3 files changed, 373 insertions(+), 54 deletions(-)
---
base-commit: 214464d4c3491d4eb2c0e9d1310d7f60c408b94b
change-id: 20250328-rk3576-sige5-usb-230102aeeaca

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

