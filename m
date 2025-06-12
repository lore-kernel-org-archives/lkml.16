Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F428DF49;
	Thu, 12 Jun 2025 14:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749739727; cv=none; b=MJY5qGjcrXkQtckFq4tR0itH5kov/L827uTXpS7U2PnXtelpg9fCmChvFJRGvxkdxpMgdmh/5ilYIXkFQK55/oSr163To4tBJRujet9nJnICRlMTWGPbhmyvmP4pEM0+DTrLI7c1TedEBHXOxJpHF5XK/hYClQO0y7Zr/Q74QYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749739727; c=relaxed/simple;
	bh=kgCWCtFdri3esltkaVO3k5udDgP7TdzXf8myfDMfKO0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VcC77nN0AoLz45fq2EH4Y+7oAPxQg7vYBxU2TYisqqktZ9/wtBApfCgHCMOj2MUZwFFZqEhOREssrX85a7Z57N38eydvqen+rQUuJl/wjQ8LabDj3BietZYcABb5cnCvRZsjfax4xq18lH5T6EFxuZ6zj6WvbC01nCRGeDwXUmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=VXQ0RaMO; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="VXQ0RaMO"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id D5BFF25FD8;
	Thu, 12 Jun 2025 16:40:03 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D0I0sQscU69L; Thu, 12 Jun 2025 16:40:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1749739203; bh=kgCWCtFdri3esltkaVO3k5udDgP7TdzXf8myfDMfKO0=;
	h=From:Subject:Date:To:Cc;
	b=VXQ0RaMOVgPSkTnZsqrBGEwGYdnCNeYJ57cZWusWn+VCedxGRB+eOe4M7hEZgyVZb
	 io72nq5m+2V3Nr4Ab3qzIud9z5EaccXAAKJ/Mja8+rGopprEL3zTX8FtCPGHTVp0zJ
	 J5Vq19EdfzNG1ZQf1azMqeVjtJoeqP9HmC/IzdroG1SPnOfi03L6cPHyPXeWlMZM7G
	 XcwLdAq9gKsmzgNSM+KEsSDaCZrZaFhW9RyHHKHOkjBGJMKBdhZc95pqTbUaLbr13M
	 AAstUmBWLk+LWbOnCdUZMryr9ypb9H14OXvziRio3jdJkMibe8tmlV3M+ZrXiMXLpm
	 sHtGGvqJ3XVTQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH 0/2] Support for Synaptics TDDI series panels
Date: Thu, 12 Jun 2025 20:09:39 +0530
Message-Id: <20250612-panel-synaptics-tddi-v1-0-dfb8a425f76c@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKvmSmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUyNj3YLEvNQc3eLKvMSCkszkYt2SlJRMXYMkgyTjNAPzNAtDEyWg1oK
 i1LTMCrCx0bG1tQAmEp4yZgAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749739197; l=1328;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=kgCWCtFdri3esltkaVO3k5udDgP7TdzXf8myfDMfKO0=;
 b=NvDmcVt9Cyid6fOiJp/Xqyeew53Mwq032aYZSHo1xiCWCdMGd5GC5QrHIogK4r2eBjNyQzObI
 FjMEdXSNz38AqeizorhTnDgYMIdvDQFE0AqbxIkqzfGe7/th0xFZSVx
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
Kaustabh Chakraborty (2):
      dt-bindings: display: panel: document Synaptics TDDI panel driver
      drm: panel: add support for Synaptics TDDI series DSI panels

 .../bindings/display/panel/synaptics,tddi.yaml     |  92 +++++++
 drivers/gpu/drm/panel/Kconfig                      |  11 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-synaptics-tddi.c       | 284 +++++++++++++++++++++
 4 files changed, 388 insertions(+)
---
base-commit: 0bb71d301869446810a0b13d3da290bd455d7c78
change-id: 20250523-panel-synaptics-tddi-0b0b3f07f814

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>

