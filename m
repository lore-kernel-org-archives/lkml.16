Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708D31581E0;
	Thu,  8 May 2025 15:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746717039; cv=none; b=QrmtJAAzTWEpdzUfa1f2YTCIyqBhmuLDONG0D86+5tCTu9WeRqLLIbBXfcULR33f4EBhv1b/RBpwwFrjVkQM4PkmKZwB1T7ziQnxRE9boo67PP1U3njCIwAJYljH8puiIMYz06hk4jUbXojrqAEeJCilugFD0Sk1MR0lDTwDILE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746717039; c=relaxed/simple;
	bh=BGQO6TlxsAja3z31m/k25Ike4Z6HUTkQ4T8z2pgwvnE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GnnzKVK4tOlssTskMA9lkm0k+1R7sJbkBkCIzsCUPYKsuuNzpyahq0VXOw0ceYWHuc/bnY8FewKdr5VLnPqxOyIz391Mh2IVIrIV/e/dkWdLLwcg7/Bkp5TPKhAUUjqcvkHIcJ/qk6o/FDiBcp124EyRNuRMwEiwAbIfRqYj14o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=Ul8fTSX0; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="Ul8fTSX0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Cu38HV34lzCayHauI+Q4uY0+KLHG1UGBvE8v2I6e6Hk=; b=Ul8fTSX0lo2g5HAsF6lFqWqsce
	aKX6PEsf+m/nK6Jf9h4vICEdkciVdubU4iE/9dqQ/lPIYvh+nHKbFchBixwuxsKZ8JSP645LeV9tJ
	O9WrahOBsI/5UN6Psh4jTiv+yK1wrCBWna/CIMuvWnM+ErEOo9Ot7LVFOn7dthuTyizOfAKLFnRrk
	q/phVXswFXIjOFm3q6Oic0+rLpohFVPNVye2T+aPcT8cUDvXHJq5dPOu1EnU+C7M33ciJS0aBNvnC
	wt5/iBRt/UIxT8s0sZNwc9d5+UgQ2akEyI0JdMO+tQ3cPA4GnD0ts42olj88/Wptt9CD8TkC0Qoxp
	Mf4q63EA==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uD2tF-0005fP-5U; Thu, 08 May 2025 17:10:25 +0200
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
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH 3/6] dt-bindings: arm: rockchip: add PX30-Cobra boards from Theobroma Systems
Date: Thu,  8 May 2025 17:09:52 +0200
Message-ID: <20250508150955.1897702-4-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250508150955.1897702-1-heiko@sntech.de>
References: <20250508150955.1897702-1-heiko@sntech.de>
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

