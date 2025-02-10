Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0881425A32D;
	Mon, 10 Feb 2025 22:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739227206; cv=none; b=egm7mgaZoa4pLSRPLNMGWMyHCXZeW5Z7bWaeIcKw6/enTCEAWN8NkkDaKAULvRhNKIVaYxb2y8gwNw53cgVcQoB6yY0L22JeG+ut9KZsGm+RQyF4l062YGrLM+fqmyrhuJcQWtd5hh8dr37C+hiiEa2cKlFQEZYGnPUO539E9xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739227206; c=relaxed/simple;
	bh=Fk1CFlse0fOzf7hyLwkoZOv8fJZ86dz0i7DYgJbGnDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XS+yGi3A6pe8H8HJQUwNdCSlYGbdGJKg/h9SgkBt6tIYu5qWPtWJ2yLV8vHmkT3Cg4SVH+DedJE3wDCU9qKGdmCdpxgVUavPiAGa2R9VKj0og8Lo6Gjvr4rc3J4S3GBt8Is0FpDKHtlFhtHq2ThZfytB6yPEli5mkvMr9Q+VMbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=oJ0JHXkE; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="oJ0JHXkE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gScTzSF5SmDK0ItX+9bERNg9WxTsYpnT5wGwYZDdZ9I=; b=oJ0JHXkE7TVR/IUDGFwKNeI/sD
	mG4q1HpllgYfpklOgYi3M8OvVd8odOMeYCCpTRlnppuqFvdkL9ULod0fQgCrcaxQRBOPTmEzRkgyr
	uEKAUcyu/cijniZStr8pCC9+1RwkdK9niCffAZnbBPAKVYw3KUoi6mHqqatbe+DAZfNw70St5M9b8
	8Kum7Gj3oYJsbm96A4286h/Qp3t4O+foRoxYDzD1LhTatDDyKAea2xAa9KG9G8X90+sK0tFegrIfv
	xt5GXGoxCUaAMhr6XozoL/RpaZ4vlHrmBbyrKGXNX6mc/QEqHWGUapkVW2KbQIAhouVuMUYv1BZGr
	laD9CE1w==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thcKc-0008Cw-Uu; Mon, 10 Feb 2025 23:32:47 +0100
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
Subject: [PATCH v2 3/6] dt-bindings: nvmem: rockchip,otp: add missing limits for clock-names
Date: Mon, 10 Feb 2025 23:32:16 +0100
Message-ID: <20250210223219.1193346-11-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210223219.1193346-1-heiko@sntech.de>
References: <20250210223219.1193346-1-heiko@sntech.de>
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

