Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD818217F2E;
	Wed,  5 Feb 2025 22:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738793456; cv=none; b=k+4izdDxxwuoPkLClB63XD60MCWJ5ArLvVf+S40Uws1yOuY9o1dRACpz23ZXQZ4fEXmjWa+X8WkiSwhed/WY/oC8HibPZL6GqsbFt5/bC0rWnf0OHvo8zex3MA/hXx2Q+/++zQzQyO4pqUVsjqwtyVtvEPZLbpY1Hr4cAzwL3Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738793456; c=relaxed/simple;
	bh=KBAQykQ4ZDZEmyMlD0bA/wR0zXcfdnw5uGSkiP6UgNQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kk/UXwVBVGf7DGJIAydBObz6mQlZXL791VP5szF6yRqaX7xp5mipR64tu2l0yig6JpWR+GQX36+Iq6gHQqBUJ4RgVdATbnp9WzQ2EhGJuIPVbfVThFAhy/9xyn22BBm0GinoVFvG7N5OdtsfN0KMBuMuptEfRTZ41U+K1yNq4B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P1aPk5VM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P1aPk5VM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 38A05C4CEF1;
	Wed,  5 Feb 2025 22:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738793456;
	bh=KBAQykQ4ZDZEmyMlD0bA/wR0zXcfdnw5uGSkiP6UgNQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=P1aPk5VMgO9FM7GziHJXiUdBW1aYh2bI4C3MtnEF/P2O0ZSevDFF2eqj8XNq2gbmY
	 tnN2gbvfGErFbwyEYlRhzgq2a2L/q1Pb87GbgiotcFtTTwgX+ba3YIez+ngqH8lVY5
	 hAjm0KCSt4Psq7LUvKvxxsXRkOBr+vkFLCrpgHTuYx/vTNov0H5h9lDksWOG0w8xg6
	 9MhBDA8FBmAePRlnLAB3NZTwchA8BwskyEJF+2JJOyLLdoW2MtLtIdzZ5Jqnq3vEE5
	 AwVmS8FCzXV1vAfGmZJUPnjOGFush6StsvxC7Jcjgi2A7c5LYVsRgCChu9hKPXxBn6
	 xnSlerAyw1CdQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C1E1C02192;
	Wed,  5 Feb 2025 22:10:56 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Wed, 05 Feb 2025 23:10:54 +0100
Subject: [PATCH v5 5/5] MAINTAINERS: Add entries for touchbar display
 driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-adpdrm-v5-5-4e4ec979bbf2@gmail.com>
References: <20250205-adpdrm-v5-0-4e4ec979bbf2@gmail.com>
In-Reply-To: <20250205-adpdrm-v5-0-4e4ec979bbf2@gmail.com>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alyssa Ross <hi@alyssa.is>, Sasha Finkelstein <fnkl.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738793453; l=1420;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=0u4/uYjoe2DaEvjc/SQO9Hc50mMhOj/1inT7JrKfgM4=;
 b=iAMCyaTdmzX1to9BPOpiGdbLwmYaf21Tj+jU8faAlxYBgzUog2CBJHwJlymHwnkcf2pdBVZWX
 brf8vMNRwbmALTFpuP+AeYGeHZYvLNPSfAWlvQkJ+mR5O2b46RC7K0F
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Reply-To: fnkl.kernel@gmail.com

From: Sasha Finkelstein <fnkl.kernel@gmail.com>

Add the MAINTAINERS entries for the driver

Acked-by: Sven Peter <sven@svenpeter.dev>
Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a87ddad78e26f28ffd0f3433560d6db1518f9f95..4ce0d3bcf67910d909ba41261535dcb14a24a7b7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2189,6 +2189,9 @@ F:	Documentation/devicetree/bindings/arm/apple.yaml
 F:	Documentation/devicetree/bindings/arm/apple/*
 F:	Documentation/devicetree/bindings/clock/apple,nco.yaml
 F:	Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
+F:	Documentation/devicetree/bindings/display/apple,h7-display-pipe-mipi.yaml
+F:	Documentation/devicetree/bindings/display/apple,h7-display-pipe.yaml
+F:	Documentation/devicetree/bindings/display/panel/apple,summit.yaml
 F:	Documentation/devicetree/bindings/dma/apple,admac.yaml
 F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/apple,*
@@ -2208,6 +2211,8 @@ F:	drivers/bluetooth/hci_bcm4377.c
 F:	drivers/clk/clk-apple-nco.c
 F:	drivers/cpufreq/apple-soc-cpufreq.c
 F:	drivers/dma/apple-admac.c
+F:	drivers/gpu/drm/adp/
+F:	drivers/gpu/drm/panel/panel-summit.c
 F:	drivers/pmdomain/apple/
 F:	drivers/i2c/busses/i2c-pasemi-core.c
 F:	drivers/i2c/busses/i2c-pasemi-platform.c

-- 
2.48.1


