Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F75F9C0;
	Tue, 20 May 2025 02:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747709310; cv=none; b=Nw1ejIR46RE2RIOvT3xNeqI8C6+58VooPFdv5UIBJeOSGPBsEXc5rR2RmWGwvsASXSYFA7yom0gF3dT87oOgxI3oPkkPmDruS+1WneGxD36jZrPgdklWxOY3BhQr58zZAvgEgbA0/Hwp2JJdUPqNNxta4oxuK2BI+TuUZqvkbrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747709310; c=relaxed/simple;
	bh=PoYrk+6NO68MjRsQXH7DOwNo14txmmSJU/mwEZN0MW4=;
	h=From:To:Cc:Subject:Date:Message-Id; b=bfivv3Ji2XYsoT8UZ7Rh+ek3W2/gvyp3yOCqIgnsAvp+IJExQKmD82O46+ZXg/k6qt2OFs0UQL2Hi8aUJCdx6/7spzTci0e/kYEXz4ujgCP2965v0kXXx0oXJnvVwKJwPyNhuk+gybEOmEXSdmZtGjI9ASjAyUXmWVOkkzJZt44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=PuAV6mm5; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="PuAV6mm5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1747709271;
	bh=IKcs6b0AA5ZZBJLb1JtJdqM/QeWUh0JfrB8WikrPpnA=;
	h=From:To:Subject:Date:Message-Id;
	b=PuAV6mm5X/JY3ZDDk0ytabAZ89H/kOdALBfBr0kT2gezwZJ8S+B4bp11elzRVzZYW
	 7a/w9ex0GZiRHRaV4AfkY13CXxGmCt+smqzRf61XeFCuLyrEWowCfl8xAfY69NXm/z
	 Jv69N7u94Ujk+LufljC+YmrNI7YDe3At9ocKcSFM=
X-QQ-mid: zesmtpgz1t1747709270tfc1b7ec2
X-QQ-Originating-IP: KB9lR9nSthPiIc+Nf/1GP2Tikw3ty9gNZQUC/A0vEPg=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 20 May 2025 10:47:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2345042519657141149
From: Chaoyi Chen <kernel@airkyi.com>
To: Sandy Huang <hjc@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Dragan Simic <dsimic@manjaro.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/2] Convert Rockchip CDN DP binding to yaml
Date: Tue, 20 May 2025 10:47:16 +0800
Message-Id: <20250520024718.142-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: MXqQCeYgv6iWgu6Tw/V2CwFeBnemR/+xhhFr/Gx32H5dkS9ijvkCt+Qc
	AhlrxbMEmphmkWB4ImAdRf2eTwe59AZo5eBQ8uIQKGCYSkqd1Gln6jWUqxVbIHR/6a2Kitm
	HL+tRbMj2wZFK5dgWmFoIz6b0Av9G2wfN50yQNWcaVXMoOuf1DH3QojK0lX7Iz3YP44ptkq
	VqENmj8fd8hHzFzyB11ian4tnjSuBmSs82eh8jglRnrlhkhr+Bx/viJMz0VpfkpXdkT7ddO
	k6eWWd3YGH3sqvCA/e6f5SRSlYBTyPNYX9uMRwBGILfvrVrdYW8nKCRRNClpcJ9yrhu2Vp3
	j+26zp5R2UYv3ylA4ou45Ndm7OEENGC0460j3CblMfOQ/oKbLqimG4mYXJLE9HoKAR7PJ+Y
	wGBwXqOlZ3XB4vE/uZZ5zi6yXmLjk+CaW+dnVAKl5seC5Mqj+CzQtScQX+xbBX1nIsDZlqr
	ORAbpWIU7MbzdkadUgjZAVGtHUE1UhZA+9a/N6hzIXvHjH48xeILq6I5HAgncT6XJvA4LEH
	PgAbpXwuiZ4qqbK9sEYZdwWpuyCA5h6AE/as5uGVtNqGKjY3HgjneJI723QdApiB7/hbIf2
	BmI6q48aZxo4Ch1JBhRyx0VXyTwBfEO7ihaXY6jTCskGrZK0lGXgRlwKQHVJtHVV2kRgw/e
	SqtkQGPo6k5sFW0DarDo/uE155dKNk8Xulk3nnKxwR8nHH4dO4MGO7gGyTdXbr9thOsTzN4
	sed+lKXYWuUOeryzl9Gcv3TGlaR6X26byd4KKLoNCKU5U4tdyoIgTUj6tQDCX43RvlWNPEB
	nyMerF5IwrMx83IwiBoyHsqG8EbuuioaphOzIy17V3cZzcc3/G5AXRgNwTqVKt0mtPXPRDG
	OFAmz2H9UuvGWJs1d+V8w3Q29gjME3BkpALCjJcoHrhcLj5OSJgaLr2JmuRKmdRQhO+xztp
	KMLUyl0je5acZTF5w6EFeBzwgCMLRqkSRTaHcl9lbLdo3zLHKTwNB4qq8
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

This series convert cdn-dp-rockchip.txt to yaml.

PATCH 1 try to improve coding style on the existing rk3399 cdn-dp
node.
PATCH 2 try to convert cdn-dp-rockchip.txt to yaml. It changed the
constraints for the phys and extcon properties.

Both of them add new port@1 node that represents the CDN DP output to
keep the same style as the other display interfaces.

Changes in v5:
- Link to V4: https://lore.kernel.org/all/20250519012632.94-1-kernel@airkyi.com/
- Fix constraints on extcon and phys
- Add commit about changes to extcon and phys
- Add "#sound-dai-cells" to required properties

Changes in v4:
- Link to V3: https://lore.kernel.org/all/20250513011904.102-1-kernel@airkyi.com/
- Add commit about port@1 node

Changes in v3:
- Link to V2: https://lore.kernel.org/all/20250509070247.868-1-kernel@airkyi.com/
- Add more description about phy/extcon
- Fix some coding style

Changes in v2:
- Link to V1: https://lore.kernel.org/all/20250508064304.670-1-kernel@airkyi.com/
- Rename binding file name to match compatible
- Add more description about grf/phy/extcon
- Fix coding style

Chaoyi Chen (2):
  arm64: dts: rockchip: Improve coding style for rk3399 cdn_dp
  dt-bindings: display: rockchip: Convert cdn-dp-rockchip.txt to yaml

 .../display/rockchip/cdn-dp-rockchip.txt      |  74 --------
 .../rockchip/rockchip,rk3399-cdn-dp.yaml      | 168 ++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi |  10 +-
 3 files changed, 177 insertions(+), 75 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/rockchip/cdn-dp-rockchip.txt
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,rk3399-cdn-dp.yaml

--
2.49.0


