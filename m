Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36192264622;
	Mon, 10 Feb 2025 22:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739227527; cv=none; b=kJLHwlst0o2C6fLNCz8duOTQYET+ZK36cXC1TRHggnMuf+jFzb4EiaWyWitppIL8HclWwi6CIbUruCWH6qIn0oZ2//OJBbGgXQAWWM1QsZythd+BKlSsTSO9y6Yvtvlgh4JUJURE6d+vhu5x5IrOxDDcx/t+Krn2IeETCsNPCmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739227527; c=relaxed/simple;
	bh=Fk1CFlse0fOzf7hyLwkoZOv8fJZ86dz0i7DYgJbGnDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LuzpiGT/fCP63DmwoaiZgrFxJmum5UN7YnRYua8ZnUEvr3Yg5zeY5CZ6Q1SHAFddBRO7UZ0BwcqcdyWcqfgSGF23/0V7/na+VetFQfx4IIJSkpBtKdJULYzlcaPKc3pPHfqFgs9XjCb6kXPEoSPvO7ORq+Ck2EYH9+l/QFHc6T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=OGU+K4gX; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="OGU+K4gX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gScTzSF5SmDK0ItX+9bERNg9WxTsYpnT5wGwYZDdZ9I=; b=OGU+K4gXc4OYnHKaCeOf6ysMgf
	Q87X0X2NqmHUBWPIFyTVk7vRZ0/bvMO9BvnRqUku4PeXIKWB9R5w/GotaxosFd1ALBlHvXPUdLt3K
	yhfYkUokK311vI0MWiS9f2TMnOE5KRrjgJTP0ez2np1cxuzQqruU1Ufvd1WGubRT4qQX3iqv4chTo
	x//pfL+BrW41oQLCLtNU9sXTybqAeGSrutZlikkfKgAGVMQdHGGC10Bjtjf86x6FSI4F7Y+c7AfyU
	x1qaDdMErFccNXBcxzQxEhtehsPXTY+O5VPrKN8SQqwrHqMIOGplHEr5wQmNZSG9q4V8sz17ePWwg
	0PYVYFiw==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thcWp-0008Re-TU; Mon, 10 Feb 2025 23:45:23 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: srinivas.kandagatla@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	detlev.casanova@collabora.com,
	sebastian.reichel@collabora.com,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH RESEND v2 3/6] dt-bindings: nvmem: rockchip,otp: add missing limits for clock-names
Date: Mon, 10 Feb 2025 23:45:07 +0100
Message-ID: <20250210224510.1194963-4-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210224510.1194963-1-heiko@sntech.de>
References: <20250210224510.1194963-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clocks property correctly declares minItems and maxItems for its
variants, but clock-names does not. Both properties are always used
together, so should declare the same limits.

Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml b/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
index a44d44b32809..3201ff8f9334 100644
--- a/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
+++ b/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
@@ -62,6 +62,8 @@ allOf:
       properties:
         clocks:
           maxItems: 3
+        clock-names:
+          maxItems: 3
         resets:
           maxItems: 1
         reset-names:
@@ -78,6 +80,8 @@ allOf:
       properties:
         clocks:
           minItems: 4
+        clock-names:
+          minItems: 4
         resets:
           minItems: 3
         reset-names:
-- 
2.47.2

