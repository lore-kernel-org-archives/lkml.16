Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com [136.143.184.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A8C220F5B;
	Fri,  9 May 2025 12:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746793957; cv=pass; b=FdFhx9p8eYXfCkxlPJYkB5zAby1mqe9tV34rSjoYbwwKP2M9WOjWpGnphroqL0EtdVUvsSQtebduQh0GeSLcp+qcGuqtzS7qf3TiMRODMHvIfuyYTmiwQq5VGexhhda/lX6xoVlVvn+57Il+n1ajRZqZabiJ868WJ0Zl28Sdk6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746793957; c=relaxed/simple;
	bh=7exv76pE9WTIBhbWeEjyw+QMTLuIi+Vi/oAYAp62DjM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZlhhZQOnpq0KcqujvfVhFXpbIYJ490bqXnSa4oNjqbD6WeaLcyRpTb7pHtKfdkXYx7Hcz+cot6AmlZrOFhqOWsfJK9Wa67qQgtZDoZXaR1SMkiMH+J6/sdA7FTlOrYDsIRPtqiQvg9UN+n1niQogmZeub/Vx3Da75vJEvrY/xvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=Z4vB6UfR; arc=pass smtp.client-ip=136.143.184.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="Z4vB6UfR"
ARC-Seal: i=1; a=rsa-sha256; t=1746793935; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iXsLC+WQyvz1lZEZo4IRKOrulJgxy0rCF5bC9VZcvzT35YlfiLP0Qn65urAvv5/f2XEO1QpfbQ5+2coWPu9/FS5qDo2i4YbJY3tzS11xW74uobj52yfMKFgX4msb4oPb+OkSa+d55qhyuETjjm3czPio2AluABL0Ka4tsD/+tN8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746793935; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ApfxD9/XCiwSS8Ht1mSzUW0TktlTZHS7Rs9rDYQUcjU=; 
	b=O8vzBNpg6vCiKMBeiT0Vdq8tGmaSUOBX35as4HL++IHgOnICN7pw4RsUNTSeZo473+FCKVMpQxJ5wqPVuTgthvyd7Ihe1+N172EwG+HPnEO2Z4TxTGTUUs0+neUeHerkLYZmNbL2BLccvzT7b4M2jobUXka80JeWq3xYaxNXEx0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746793935;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=ApfxD9/XCiwSS8Ht1mSzUW0TktlTZHS7Rs9rDYQUcjU=;
	b=Z4vB6UfRRnGUGTcmemsqqluVBCxUJiCzY8Rxfu2hkB7QwG15RgQ9qnqDKjS+XCcq
	bXUCbPl6TjAvIKVmF359f5urxH5k0z7RNyKjh0oDJfoFab/z385v5c4nzW6wSTbyCsl
	cx/UcS7SXpJjpkKVdejVW/qGSrAmjkWdr1BhinhY=
Received: by mx.zohomail.com with SMTPS id 1746793933666787.5415614720451;
	Fri, 9 May 2025 05:32:13 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 09 May 2025 14:31:41 +0200
Subject: [PATCH 1/3] dt-bindings: arm: rockchip: add RADXA ROCK 5T
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-add-rock5t-v1-1-cff1de74eced@collabora.com>
References: <20250509-add-rock5t-v1-0-cff1de74eced@collabora.com>
In-Reply-To: <20250509-add-rock5t-v1-0-cff1de74eced@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2

The RADXA ROCK 5T is a single board computer aimed at industrial use.
Its design is similar to the ROCK 5B+, but it does away with one of the
USB-C PD inputs, and uses one combination USB3/SATA/PCIe PHY for an
additional second 2.5G PCIe network card instead of USB3.

Link: https://radxa.com/products/rock5/5t/
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 8f324417a3bdb3f5e11b03c86d18df4b6f60a43c..d48522806ce3c36f4531f8d6a999838e9eeb49fe 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -961,6 +961,11 @@ properties:
           - const: radxa,rock-s0
           - const: rockchip,rk3308
 
+      - description: Radxa ROCK 5T
+        items:
+          - const: radxa,rock-5t
+          - const: rockchip,rk3588
+
       - description: Radxa ZERO 3W/3E
         items:
           - enum:

-- 
2.49.0

