Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B642BDC1D;
	Wed, 11 Jun 2025 20:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749673839; cv=none; b=m4DsbVCLKu/r1eAkxSAjh80MIYR+nouvl3YnDtj7lwTV2vzGls20OcvNeyQH6jL4UX6P0xsdxJluGtWZde6yTxpX8WD4euIVVtLrRY2lYz2Fp+80AMmz4x4Okbo1JMHkE4ctWBtEomcuIY1oFD7TNaJBGAK4UjESt4LCq7/pQak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749673839; c=relaxed/simple;
	bh=T6MQUq+5csmPuEPWpE+uUchnp4jTFEZuMy7pJ1JdciM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BY5QXFNv+B8uG2c0kkaMZD4h30vL4q0ZgfoqBncbsw6kDmChJYXzyYvVsc/UYTCTR9NrBRT9ByGGN+Nua7dxLlx0Ph9yvucLjuqrr995BOHZdidNwjA5UIGhp7ToiyclQ+QcdxOJpo06gObySvB3noxaRHSL7askDWMtr17cqho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S5GCgIDd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S5GCgIDd"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8BF47C4CEF1;
	Wed, 11 Jun 2025 20:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749673835;
	bh=T6MQUq+5csmPuEPWpE+uUchnp4jTFEZuMy7pJ1JdciM=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=S5GCgIDdqwW5uQvwOOOGjyKNhlM4xrU3CjO6NpVsLLJEFaUU/LVQwWmgXGpQ4NCPb
	 eQzXs45T4jXhXz/6TRTtnK61ELFNCMd5lLNkhwBlKpzXYeWmEflM1paUlzXujeqzFx
	 BhrhzyQiOuQdAxwFmJHrI9FUXRk3HPSitfphnUoQexG83Js3tXMWYU+z8pFxDyHmt+
	 Ev9cc1NSwlLRl+Hj6k6LClzwF9uhkVd7LbIpEO46Yvm9kweX9kXYk3q20IssQ0Y5FL
	 46TzQJya+ay0U9NTUe5yuTrOwz6D0xOHbolrhtIR6DOmbJ9gsdEJNNooq+v/3SLrX4
	 CQd0AUnzcu2iw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ECEEC7113E;
	Wed, 11 Jun 2025 20:30:35 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Date: Wed, 11 Jun 2025 22:30:31 +0200
Subject: [PATCH] arm64: dts: apple: t8103: Fix PCIe BCM4377 nodename
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-arm64_dts_apple_wifi-v1-1-fb959d8e1eb4@jannau.net>
X-B4-Tracking: v=1; b=H4sIAGbnSWgC/x3MTQqAIBBA4avErBMaM4OuEiGSUw30IxoVhHdPW
 n6L916IFJgidMULgS6OfOwZWBYwLnafSbDLBlnJptKIwoZNK+POaKz3K5mbJxZOYSNRtbImDTn
 1gSZ+/m0/pPQBKqY7WGYAAAA=
X-Change-ID: 20250611-arm64_dts_apple_wifi-d415214723e6
To: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Kettenis <kettenis@openbsd.org>, 
 Marc Zyngier <maz@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1444; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=wHLTjbA+ZQtpL0eNy1zcPArF/Oix96dlxYfH46ebBpY=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhgzP51kRH8Mu3v4jEB23riR0deCkgE6+c2cMvr65PcVSe
 0ccb9X0jlIWBjEuBlkxRZYk7ZcdDKtrFGNqH4TBzGFlAhnCwMUpABMJ2MzIcLts4jqju75O01+L
 W7AzLZr3XaNW7reybOvtzn/v4/9UeDP8D1O7tNy9eNnCJpMtf/9daq65scqR77nMzOoP0rJxOVf
 4GQE=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Endpoint-Received: by B4 Relay for j@jannau.net/yk2024 with auth_id=264
X-Original-From: Janne Grunau <j@jannau.net>
Reply-To: j@jannau.net

From: Janne Grunau <j@jannau.net>

Fix the following `make dtbs_check` warnings for all t8103 based devices:

arch/arm64/boot/dts/apple/t8103-j274.dtb: network@0,0: $nodename:0: 'network@0,0' does not match '^wifi(@.*)?$'
        from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
arch/arm64/boot/dts/apple/t8103-j274.dtb: network@0,0: Unevaluated properties are not allowed ('local-mac-address' was unexpected)
        from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#

Fixes: bf2c05b619ff ("arm64: dts: apple: t8103: Expose PCI node for the WiFi MAC address")
Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t8103-jxxx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
index 8e82231acab59ca0bffdcecfb6681f59661fcd96..0c8206156bfefda8a32c869787b2e0c8e67a9d17 100644
--- a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
@@ -71,7 +71,7 @@ hpm1: usb-pd@3f {
  */
 &port00 {
 	bus-range = <1 1>;
-	wifi0: network@0,0 {
+	wifi0: wifi@0,0 {
 		compatible = "pci14e4,4425";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
 		/* To be filled by the loader */

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250611-arm64_dts_apple_wifi-d415214723e6

Best regards,
-- 
Janne Grunau <j@jannau.net>


