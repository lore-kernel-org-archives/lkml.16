Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D43B21CC56;
	Wed, 30 Apr 2025 08:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746001767; cv=none; b=C30EKGpgnzEW8qcxdgUlpDgUsO5SPPIM6dnVegu/ILk0Mic/X2RyRB4R8vrLgGFXYDHPnzy53OeAYL2PhxVICrGF6sDH+saJan3XfAVG3vauTDIqGDikZKTd0sFGuN3xsP7TKISwOeg3mN+FIr0RCEndIUCMfSsGPTVY7w6QIlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746001767; c=relaxed/simple;
	bh=7UzvkkUxniBTkynNGdvtJvNdvOBO3RzQWPle773eRZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=haFHSDMfUjGPDP9ZVE+SVgXN7nP/x5kS2U/QGOPKULpN7xIH/D3nufl6CdcX8mhQWIytv9IOY+xrkU54f9GXUenYhsu/Sw6DYUPDJtqbxSA6EAT/E7+FTT/85aw9RgmOxnpg1c4WPbEKYj99s1Y2sUl4oD7xXz2JMYHDT1Of7CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=PPVjllzf; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="PPVjllzf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=+sziV7MF8+jBwSYemNEdogvFX2m4sp7ZLD0VYElL25s=; b=PPVjllzf4GOZ8Kuc/PW/d8MSh7
	TrGmSYLm0P0ko9zBkUBXv+9YehlBs+HOk1tn9e7iXgPAP0GWIi0QG7rxAAgsYt2SbLiLQvwvEl6Nk
	oXYJ5AXHV1F+N5AoEUXeTluJb2HkmRuRGjRgTgqgsKUFT/nK8euPbYsXbpz4Y4wVmV2PmxJdJkqG8
	y4QxjVfJbcgThgKwR6LE2A7I8OVQIxw8gxiMaE096KRW54aqgzL+Vdoo+TIdBIPXle34BMvcBrTGH
	dc9MvV3LTFSQaW1wxYLYQDkmhwgp4NYL8/048dJdlrP9QWE2rdztbrnC6pmxFp+Oe5Z4qeJVph/ge
	DCCK91mA==;
Received: from i53875ba4.versanet.de ([83.135.91.164] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uA2oX-00032E-1q; Wed, 30 Apr 2025 10:29:09 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: neil.armstrong@linaro.org
Cc: quic_jesszhan@quicinc.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	quentin.schulz@cherry.de,
	heiko@sntech.de,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH 2/2] dt-bindings: display: ltk500hd1829: add port property
Date: Wed, 30 Apr 2025 10:28:50 +0200
Message-ID: <20250430082850.244199-3-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250430082850.244199-1-heiko@sntech.de>
References: <20250430082850.244199-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Heiko Stuebner <heiko.stuebner@cherry.de>

The panel can be connected to via graph nodes, so allow the port property.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 .../devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml b/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml
index af9e0ea0e72f..b0e2c82232d3 100644
--- a/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml
+++ b/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml
@@ -22,6 +22,7 @@ properties:
     maxItems: 1
 
   backlight: true
+  port: true
   reset-gpios: true
   iovcc-supply:
     description: regulator that supplies the iovcc voltage
-- 
2.47.2

