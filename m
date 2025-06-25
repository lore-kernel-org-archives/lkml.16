Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BB129B201;
	Wed, 25 Jun 2025 10:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750846148; cv=none; b=KFaF2n3mxPec7+LmbKjT+trqAOy7ma5+46fbt9Gp24HVC7VIULc/vnwKGI7o0RRwEj85JlAPD6JUwF9AxjSwown0XqzB9ingLd8v2RPyOhxN784NWDst8hO2oLT00zj/gNTKz2nB0fYuL5MLXB7hJRoBRwbvliBSHXwYUaA8dbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750846148; c=relaxed/simple;
	bh=hjJkA7oFAzYjbGdayYCi8BOgbIBdaazZmbsyFQXc0kY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LiDstuh3SGN57WhQHxRlf+AmdyVVW7aIj/P39uZMKy9n1lWjkFbjDkJeC1XpuS2/3MV+BUdEob5wx1l3Dm341X8VxgZ4D3g8AtLbemYKp+h0whegXNtdS3qm2tyFZEvDgXUNmS/VXchkwDnyVJlVt1Ei2W+McNjgpwVh04OEoUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=QynfdMMn; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="QynfdMMn"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 7B3822609A;
	Wed, 25 Jun 2025 12:09:03 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XcpVnPu1ntrc; Wed, 25 Jun 2025 12:09:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750846142; bh=hjJkA7oFAzYjbGdayYCi8BOgbIBdaazZmbsyFQXc0kY=;
	h=From:Subject:Date:To:Cc;
	b=QynfdMMnnEWy4LmP7h1NpFYQrOzNGFg1/fo6ZNn4qEf20zeqqvWJBv4iMzIVis1kb
	 GJnhaXYAKTJMXQPlSe2B4xhXsemJcq8BD3DngaWNnIvIm2N+6ZgrVEOS9uYf9T8p7v
	 YYCPW1DedeCSBrPJFxzsox822OldWStBce41QWxxzBbNh9c4qUjRks3LfWQUlWKoPA
	 5pTUXXRQ0spIsbmdLNM8q92SnSk7TiEgzrhrgTT68k10rkxyW0XIBbvAwBxNE96Nlh
	 HgaORMf5We0K/BpkrPGLy/gM8K3dnj4BvyBkqS6VLdMkeL+R2FlRdPIokZfxLZaT4p
	 1u5fI67164E2A==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v2 0/2] Support for Synaptics TDDI series panels
Date: Wed, 25 Jun 2025 15:38:43 +0530
Message-Id: <20250625-panel-synaptics-tddi-v2-0-7a62ab1d13c7@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKvKW2gC/22NywqDMBBFf0Vm3SlJfNKV/1FcRJPoQEkkE6Qi/
 ntTu+3yHLjnHsA2kmV4FAdEuxFT8BnUrYBp0X62SCYzKKFqUasSV+3tC3n3ek00MSZjCMUoxtK
 J1nWygjxdo3X0vrLPIfNCnELcr5dNfu0v2Ej1P7hJFGjc2OlK1a5tpt4QxxDSPcQZhvM8Px6Hq
 eC6AAAA
X-Change-ID: 20250523-panel-synaptics-tddi-0b0b3f07f814
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750846137; l=1665;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=hjJkA7oFAzYjbGdayYCi8BOgbIBdaazZmbsyFQXc0kY=;
 b=i47/lAM2LOwTqd49rCoZONdX2gAZm0z02eIyQHO9e7Ku0i6I9GGwZ+aCUYFzqBAt8o0edpRAi
 ngKaUTKfOnmBfID9AqR/VbE+Q/tRawWGDvgRJQWKbYgBAAhqGGoblk1
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Synaptics' Touch and Display Driver Integration (TDDI) technology [1]
employs a single chip for both touchscreen and display capabilities.
Such designs reportedly help reducing costs and power consumption.

Although the touchscreens, which are powered by Synaptics'
Register-Mapped Interface 4 (RMI4) touch protocol via I2C or SPI have
driver support in the kernel, the MIPI DSI display panels don't.

This series introduces a rudimentary driver for controlling said display
panels, which supports TD4101 and TD4300 panels.

[1] https://www.synaptics.com/technology/display-integration

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Changes in v2:
- fixed various dt_binding_check errors (conor)
- did s/tddi_update_brightness/tddi_update_status
- added check for panel enable in tddi_update_status()
- used backlight_get_brightness() in appropriate places
- Link to v1: https://lore.kernel.org/r/20250612-panel-synaptics-tddi-v1-0-dfb8a425f76c@disroot.org

---
Kaustabh Chakraborty (2):
      dt-bindings: display: panel: document Synaptics TDDI panel driver
      drm: panel: add support for Synaptics TDDI series DSI panels

 .../display/panel/synaptics,td4300-panel.yaml      |  89 +++++++
 drivers/gpu/drm/panel/Kconfig                      |  11 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-synaptics-tddi.c       | 288 +++++++++++++++++++++
 4 files changed, 389 insertions(+)
---
base-commit: 1b152eeca84a02bdb648f16b82ef3394007a9dcf
change-id: 20250523-panel-synaptics-tddi-0b0b3f07f814

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>

