Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECE42206B6;
	Mon,  7 Apr 2025 18:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744049411; cv=pass; b=fWk/6Uu42Xx0zGwnAa8yf+HFjZjTL7JqIoyi5thgeMa8rW14/MXE4wZcqtJakY6yprRMJ9ztcb8nLrCo0NCNCzBRo0NC8pWyZDUyIbumlLcJLS0NRVn6HhKBo2G3wycJqFiJdtYF1tgpIOdblD5w6VpHxoEo7y8qAOLvdkNsp0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744049411; c=relaxed/simple;
	bh=w+f7Lr7WyqYv3iH7mWqMTgKQhvPiitOPImCoN/8GPoA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=m+uE5/W/56vtY5tIBqgDH2Eaj/+as8tPGtiCtI1vBE0GwLcMG15E3uAZ9HRzgbjXFuNPRHV6NfNsDVf2Pmi64kSh1ZpEIJJEcwN2vlE9w4rWYXMldAnz3VBOUqYR2SP7AcsrRT2vgXnR4nGgEcj7noIx8SEUdygEN1KGyn4MaM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=aMYIGLxL; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="aMYIGLxL"
ARC-Seal: i=1; a=rsa-sha256; t=1744049382; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MA29WiSaM/qGw8Ez5IWEq+k0N2YAnfiNfAhPgQHriNRPs3EL3yjtKFFtGwEbVGsyo3QmNx0TTr8siu2V121Ox4gfxO8Lnz60I6ZI+pK7jPSNwtlEgfVtFnXaWFk+dJilbETEQ2Ob1jpwG7IHHKL2QDQlRQoXjvn6yDoyRnv6ZJg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744049382; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=i7yUmtcPXYs5jDz4UO9uvLqV1/UD2ocMo6ScIwBAIPA=; 
	b=MzysafK93/6rHCj0cYFISDahwz2lsGydQU5sYBwQBuLQo1Vo5UbN0PHoTIAojVuGMDnLH4JwQGsJTHWxImSERg5GqWGlb92nJBrpiq2dBZAgGYrsnzbx4O9KySgYEqT2zhzGULJUEEnDicmtAfNE0Bz/atsW4cR9xR91i+0DD1o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744049382;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=i7yUmtcPXYs5jDz4UO9uvLqV1/UD2ocMo6ScIwBAIPA=;
	b=aMYIGLxLmuS8LHedJmkzvIWJCZ21bwD1Ms9cqEuChNGK7MNfmvOdJdPQv40ImOev
	8fmXjtvGPgf649q2yQnwB1xLrMnC7pBaYu2E1ujWsCSSP/jWjJvjs2LJQihe4UEsQy5
	FJ0aXsuuj/ukpo4MjOIU6/YUezwv01Ach2y1GsSo=
Received: by mx.zohomail.com with SMTPS id 1744049380397611.0260384445199;
	Mon, 7 Apr 2025 11:09:40 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH 0/4] RK3576 USB Enablement
Date: Mon, 07 Apr 2025 20:09:13 +0200
Message-Id: <20250407-rk3576-sige5-usb-v1-0-67eec166f82f@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMkU9GcC/yXMywqDQAyF4VcZsm7KXBhbfJXiYpxGG4raJioF8
 d076PI7cP4NlIRJoTYbCK2sPI0F7mIgv9LYE/KzGLz10QZ/R3mHeKtQuaeIi7bog3XWJ6KUE5T
 bR6jj35F8NKeFvkspz+cIbVLCPA0Dz7VZq6uLKNlBs+9/rj/QuI8AAAA=
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

The first patch in the series extends the inno usb2 PHY binding in order
for us to be able to do what the second patch in the series does, which
is fiddle with some GRF flags in that driver when the PHY is connected
to a USB Type C port. Without this change, devices on USB-C simply don't
enumerate at all, as the state machine gets stuck waiting for vbus to go
low or something along those lines.

An alternate way to implement this would've been a vendor property in
the PHY binding which is then checked for in the driver and needs to be
present in all rockchip inno u2phy instances that happen to be connected
to a USB Type C connector. This is what downstream does, for example.

Patch 3 was really lovely to run into and needed a good amount of
sleuthing. I'm still certain this is "the wrong" fix, as it simply keeps
the PHY on, but it's a fix nonetheless, and one which has precedent,
namely in the RK3399. If someone is on a hunt to save milliamps in the
future, they might want to invest the time to come up with a less
sledgehammer sized solution for this problem, e.g. by disabling power
management until the controller is fully initialised.

Patch 4 adds the USB related nodes, including associated regulators and
Type C controllers, to the Sige5 tree.

As it stands, superspeed on the Sige 5's Type C port is still finnicky;
after a full day of debugging I still can't figure out why superspeed
only works in one cable orientation. I did a thorough pick through the
usbdp PHY driver, comparing it with what downstream has, etc. etc.
Because everything to do with testing Type-C ultimately comes down to
narrowing down the search space of non-compliant devices and
non-compliant cables to where you can sort of guess at the bug, it's a
huge time investment to debug this, and I'd rather submit the series
as-is right now for review and maybe some additional insight and testing
from someone with a wider variety of USB Type C cables and devices.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
Nicolas Frattaroli (4):
      dt-bindings: phy: rockchip,inno-usb2phy: add port property
      phy: rockchip: inno-usb2: add soft vbusvalid control
      arm64: dts: rockchip: add phy suspend quirk to usb on rk3576
      arm64: dts: rockchip: enable USB on Sige5

 .../bindings/phy/rockchip,inno-usb2phy.yaml        |   5 +
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 153 +++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           |   2 +
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c      |  78 ++++++++++-
 4 files changed, 234 insertions(+), 4 deletions(-)
---
base-commit: 64e9fdfc89a76fed38d8ddeed72d42ec71957ed9
change-id: 20250328-rk3576-sige5-usb-230102aeeaca

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

