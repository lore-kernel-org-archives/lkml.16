Received: from smtp-190c.mail.infomaniak.ch (smtp-190c.mail.infomaniak.ch [185.125.25.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B29823BF80
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 16:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.25.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749572560; cv=none; b=cvIChlwxx0YKfhpePGNDCqKczaN4J6yyOimp5BoKN4VRuQaCD3OegjU84zyQNUiLRN0cFVwBat7Tn97fvu8v0JzCy4taBiGvvTqeQw0UUiyAOhkP8eKBRrvDRmH3c8L0p0iMWC43dGb8ykW2gs5CCpyAdFfWV2XgTtwSohC4s1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749572560; c=relaxed/simple;
	bh=S1CZQL9yLFo7vAjiA0W61DE9KKz4owbMyL0PhUtF8Pg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YX+KdDw8aD7k4EyywkXAUL0XQLS2i0Bv/efqCfYLL1JuTMoDiNlUu8XTaoM4b6OrsoU1LMsTa3tcHA7HrxUvG/PWWwAsgJphT3Et5Toh3ij0jW8wMdONApdzj0K7suQIIhwDh8rhoAjVM4GrrP5MnE/+CiJlc4mE5U/5i4xOS74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; arc=none smtp.client-ip=185.125.25.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4bGvFx5FGwzn6h;
	Tue, 10 Jun 2025 18:22:29 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4bGvFt5ldhzLd;
	Tue, 10 Jun 2025 18:22:26 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Subject: [PATCH v2 0/3] arm64: dts: rockchip: support camera module on
 Haikou Video Demo on PX30 Ringneck
Date: Tue, 10 Jun 2025 18:22:15 +0200
Message-Id: <20250610-ringneck-haikou-video-demo-cam-v2-0-de1bf87e0732@cherry.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALdbSGgC/42NQQ6CMBAAv0J6dk1bLIon/2E4YLtLNwRqWm0kh
 L9beYHHmcPMKhJGxiSu1SoiZk4c5gL6UAnr+3lAYFdYaKmNNKqByPMwox3B9zyGN2R2GMDhFMD
 2E5y0bC6GHmdqSZTIMyLxZx/cu8Ke0yvEZf9l9bN/p7MCBUSka9XIujV0sx5jXI4ORbdt2xdgf
 yQVzAAAAA==
X-Change-ID: 20250516-ringneck-haikou-video-demo-cam-420685fb7f9f
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha

The first patch is fixing dtc warnings related to the ISP on PX30.
Sadly there's still one due to there only be one port in PX30's ISP and
still address-cells and size-cells properties set. The "issue" is that
there are actually two ports (see binding) so we shouldn't really remove
it, but the binding requires a bus-type property (either parallel or
bt656 mode) for the port@1, which we cannot know from the SoC PoV.

The secibd patch adds a label to the port@0 of the ISP to make it easier
to add an endpoint to it from a board DTS(I).

The third patch adds support for the camera module found on Haikou
Video Demo adapter with PX30 Ringneck.

This adapter is also used with RK3588 Tiger, but there's currently no
camera stack at all on RK3588, and RK3399 Puma, but:
 - 19.2MHz is not achievable exactly, so need to patch the driver to
   support 24MHz for example, this will come later,
 - The camera clk is on an IO domain at 1.8V but configured at boot at
   3.3V, and until the IO domain is properly configured, the camera
   won't receive a clock. Based on the probe order, it is possible (and
   empirically very likely) that the camera won't be detected at all.
   A Linux kernel solution was attempted multiple times in the past,
   c.f.
   https://lore.kernel.org/linux-gpio/20230904115816.1237684-1-s.hauer@pengutronix.de/
   https://lore.kernel.org/lkml/20220802095252.2486591-1-foss+kernel@0leil.net/
   We'll need to figure something out this time as I won't be able to
   upstream camera support without it :)

To test, install libcamera on Debian Bookworm (or more recent I guess;
libcamera-ipa libcamera-tools) and add a file at
/usr/share/libcamera/ipa/rkisp1/ov5675.yaml whose content is (remove one
leading whitespace):

 # SPDX-License-Identifier: CC0-1.0
 %YAML 1.1
 ---
 version: 1
 algorithms:
   - Agc:
   - Awb:
   - BlackLevelCorrection:
   - ColorProcessing:
 ...

then call

qcam -platform eglfs -c /base/i2c@ff190000/camera@36

While this is running, control the focus lens driver with (via v4l-utils
Debian package):

v4l2-ctl -d /dev/v4l-subdev5 -c focus_absolute=150

and change the focus_absolute value to see the lens moving and the focus
change.

I'll try to have a look at libcamera's config file so I can send a
proper one to the project instead of this dummy one.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Changes in v2:
- added patch 1 (fix dtc warnings for endpoint in ISP port@0 node)
- added patch 2 (label to port@0 ISP node),
- used phandle to port@0 ISP node, removed reg and @0 suffix to
  endpoint,
- Link to v1: https://lore.kernel.org/r/20250516-ringneck-haikou-video-demo-cam-v1-1-fff23160395f@cherry.de

---
Quentin Schulz (3):
      arm64: dts: rockchip: fix endpoint dtc warning for PX30 ISP
      arm64: dts: rockchip: px30: add label to first port of ISP
      arm64: dts: rockchip: support camera module on Haikou Video Demo on PX30 Ringneck

 arch/arm64/boot/dts/rockchip/px30-evb.dts          |  3 +-
 arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi      |  3 +-
 .../rockchip/px30-ringneck-haikou-video-demo.dtso  | 53 ++++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/px30.dtsi             |  4 +-
 4 files changed, 56 insertions(+), 7 deletions(-)
---
base-commit: 8a7f81861ba3226f9cd6fc1cd34d7d62ff8951c0
change-id: 20250516-ringneck-haikou-video-demo-cam-420685fb7f9f

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>

