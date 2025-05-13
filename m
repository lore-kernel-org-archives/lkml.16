Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0FE2BE7A6;
	Tue, 13 May 2025 15:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747148585; cv=none; b=cWCouMKEPCImlPEgyH3A4UZGiNwyExC0ptQ+FjG4TUjRvrc7e417VmvJo/HDAU1QX8M9FkfAuham0TrLNXCw2A2scR18laC6uPnInEoIx//SDLelZr/ccln9a7YB2T/VcpmIdbQ6XQWr29SoyRTuwwSbQwlQdcKrI8be7zJaads=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747148585; c=relaxed/simple;
	bh=MzP853kfTzrQLxH3q61RtSYRjD2zGOvdhEiDd1AapCw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LikN2i2BtZ/ysjj8yw5H9oxSPDT2uKgXci35VsUa7PfcT5FWNr0NaWzI3aSgplJx+sUJeLN0Vv91toY4bkCuje8OJhdubb8qfBy8YmSTtIoWahgG3qZOUmpaZbwVMuSteKPEmueZC/Phx8Z0wJMyMKvgQzgI1/P6zwIOy5P4k74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=p62HqCjv; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="p62HqCjv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=fkwdOn5n0SYL4gFgl3/rMnyEKOjKxd4O0ZvjvmC/+0A=; b=p62HqCjvIbL9XCbvEHKv8qdeGu
	HTunAre0nqDOI72blUMU1ky+rJlmewv1XfMvrmqYcAQIFa2EavIvFJ2wNKNZJgj+pcHAesYKgyHhA
	TCc2bqaOOXcWZCQrQfA9n2eUGSrSEXN6VNG4kMxJaUGV7obTdYVDYu7i33uKUV3ZfA3o8vzDCpU1V
	M+6uTybs3s2dTVY1Lzs7H77OEFQR+GpSjM8rwPo0UcVehortM+WCKRk03dOagKoUn2jMeUcX1QHuD
	UN1prPDCHE3yGJX6HNZ0RGWkCBZbNimdp2h4niJxmamh/sgIvC0KGcycQsrl4NJ+2IndJ63Rc4Vhr
	ywQ4Betg==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uEr9c-0008L7-Oq; Tue, 13 May 2025 17:02:48 +0200
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
Subject: [PATCH v2 5/6] dt-bindings: arm: rockchip: add PX30-PP1516 boards from Theobroma Systems
Date: Tue, 13 May 2025 17:02:33 +0200
Message-ID: <20250513150234.2331221-6-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250513150234.2331221-1-heiko@sntech.de>
References: <20250513150234.2331221-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Heiko Stuebner <heiko.stuebner@cherry.de>

PP1516 are Touchscreen devices built around the PX30 SoC and companion
devices to PX30-Cobra, again with multiple display options.

The devices feature an EMMC, OTG port and a 720x1280 display with a
touchscreen and camera

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 6435c724e682..58af37b4d6b8 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1119,6 +1119,14 @@ properties:
           - const: tsd,px30-cobra
           - const: rockchip,px30
 
+      - description: Theobroma Systems PX30-PP1516
+        items:
+          - enum:
+              - tsd,px30-pp1516-ltk050h3146w-a2
+              - tsd,px30-pp1516-ltk050h3148w
+          - const: tsd,px30-pp1516
+          - const: rockchip,px30
+
       - description: Theobroma Systems PX30-uQ7 with Haikou baseboard
         items:
           - const: tsd,px30-ringneck-haikou
-- 
2.47.2

