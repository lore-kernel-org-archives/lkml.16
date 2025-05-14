Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9646B1EB36;
	Wed, 14 May 2025 12:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747224568; cv=none; b=ptBDBDhWJKfvuS1XYnQg5O6QuF7yRUPUWAfiEg3n28JkWiy2dJeCF04I0M1Fx9bvufJOMR4Ll/Z+bVZ/hkuHcg2go5dAW23sjqW9jVgIAEERgF5UOWgsJNCcWQOcG/rZWqUstE24ngg3ix9KB/FlharYekrE90nx7QEvDR+JXBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747224568; c=relaxed/simple;
	bh=CvR8WHWM2jnJoEpIZ5bGL7qBQYCWNZnk21yZqVb2Koo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N045dodjJABLe5bX6TYXusvoyr951haxWDjO74BxuMyHEOiBO8P1IpDP4ykzTDeFH2daK/a0zXvnoyq4rifmxG/21w3ltRs7u6R6k0OvvaKnMGQ1oX3is/v2gWL9zGj7eJ8Nfx1UJH+713IkPABNHaalHYWRlnU6EENC0QIpl34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=DPiNOWET; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="DPiNOWET"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=1ilQCMhL0zZkQUGRLRjUKYJt6Qmtnyc4KrCcRajmp7I=; b=DPiNOWETtn1sbd2qeoYN1GWQ0D
	LX5mUkisZbQ3yZGTlqyA3EVrFC1f/wQGdWcs2tQ3WlATYNABcCxIYZFPzPPf+NFDQ0mx0JrSPKEgQ
	R6Oo+kRrDyvBB5wKJn3fHZvXZYr/WkwWXR32vpfTRCMXcMj99FdHQFxL1Zv2EJvspqwlyS03h24I7
	Idm2rzTknMeoJlnMp2mMYWbhEZx/KimlWm+XclhZHX2l9SNi6dtWGetq6HDLvoOntMWRIm4pZeg4R
	ENOaOIUTlDop3bSIeCBapVKtiSPd8/wom0EYAM+a2DgihgHvxIVt3HkvycwQ6nh0ubHG+A/bgMXyK
	ncZpdBYA==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uFAvJ-0005f9-El; Wed, 14 May 2025 14:09:21 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: quentin.schulz@cherry.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 3/6] dt-bindings: arm: rockchip: add PX30-Cobra boards from Theobroma Systems
Date: Wed, 14 May 2025 14:09:03 +0200
Message-ID: <20250514120906.2412588-4-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250514120906.2412588-1-heiko@sntech.de>
References: <20250514120906.2412588-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Heiko Stuebner <heiko.stuebner@cherry.de>

Cobra are Touchscreen devices built around the PX30 SoC using
a variety of display options.

The devices feature an EMMC, network port, usb host + OTG ports and
a 720x1280 display with a touchscreen.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 650fb833d96e..6435c724e682 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1109,6 +1109,16 @@ properties:
               - rockchip,rv1126
               - rockchip,rv1109
 
+      - description: Theobroma Systems PX30-Cobra
+        items:
+          - enum:
+              - tsd,px30-cobra-ltk050h3146w
+              - tsd,px30-cobra-ltk050h3146w-a2
+              - tsd,px30-cobra-ltk050h3148w
+              - tsd,px30-cobra-ltk500hd1829
+          - const: tsd,px30-cobra
+          - const: rockchip,px30
+
       - description: Theobroma Systems PX30-uQ7 with Haikou baseboard
         items:
           - const: tsd,px30-ringneck-haikou
-- 
2.47.2

