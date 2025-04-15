Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD78205ADB;
	Tue, 15 Apr 2025 02:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744685158; cv=none; b=e+8q5o2wTz6zp2BpVdtmTnM7XAfsK6orkPskjOUyi8t0LNDd0wkqJK9cgrp1sSI6EatRbwk17ik7lcsk0qkPbd74ICx/ak1mRVAScL8B5sKpRnb2AOyyb1s29nRDOxdrp9qsg9zD/KWxVNyGNjmhhrC0aaGv+GExN6YEjN/PIi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744685158; c=relaxed/simple;
	bh=eNT2DnaFtau75otXvoSolGN5m1XSsI2mM3CYJJA0yaE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hzA2cNBCTYUZe65JhSryIRS2GnO6JDMLlSvM3mxEk6QcaIGxoG5xg8iUGC0EW4sTu6KKIgPSUO3nlR4Fvo8WTPLhVjevyjD0lV0RmOUjINdzCYyTUbICaDPfe3xNlj/E4GJxK2Rpp279JpMe9akmtOEDuYsRqcAe+ClrAjvgPVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=caNP6SHe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="caNP6SHe"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3364BC4CEFD;
	Tue, 15 Apr 2025 02:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744685158;
	bh=eNT2DnaFtau75otXvoSolGN5m1XSsI2mM3CYJJA0yaE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=caNP6SHesjBv9W8pk7XtNpw0ohOioGZ+mdNkqa4qtGPF9db3jjJKrm49BQU7qjqDS
	 cvkBrQS9NcBf45axdnFHKcLBL83dx8qJuG+3NzLsWbB5aSym7JsCyOfnDv7voSNbP3
	 YU6eZiqkJpwk11T3yfK+JpdI7T25GTWrwOWYWpMJiwQrMwCwDYimjyP1KQFbTtLlli
	 G/Dio0DVgBi4NREH6fwHR55G750UpRW6JWI4U/t7QhQ54KCY9E32BADfwQ3er3sMk2
	 ZPQbiwD+22rv/jjb3R2yrCM4PisAE57F3pGFq2VF3KK5oNdSfF5UEJ4gu8RtD7tDYo
	 syuxRO6PsFdCA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25514C369BC;
	Tue, 15 Apr 2025 02:45:58 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Tue, 15 Apr 2025 10:45:30 +0800
Subject: [PATCH v3 7/7] arm64: dts: amlogic: S4: Add clk-measure controller
 node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-clk-measure-v3-7-9b8551dd33b4@amlogic.com>
References: <20250415-clk-measure-v3-0-9b8551dd33b4@amlogic.com>
In-Reply-To: <20250415-clk-measure-v3-0-9b8551dd33b4@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744685155; l=824;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=A6JIk28+NZPU2Eh+mMPRGxQPj1l3aQ0UYp+1TpAudD4=;
 b=X1Y5uuDxGW5jE7qTJI6N3V35nAflYKrcp+V2LQetx3I7xN7FJz/iQVMpKRESAiGNPuMPSeQhJ
 YEBjd2Ixq4YCik4Xi8I0Xk8zBt94QEqzZ7a6GdEQDu993zCLwiOYDS5
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
Reply-To: chuan.liu@amlogic.com

From: Chuan Liu <chuan.liu@amlogic.com>

Add the clk-measure controller node for S4 SoC family.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 957577d986c0..9d99ed2994df 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -629,6 +629,11 @@ internal_ephy: ethernet-phy@8 {
 				};
 			};
 
+			clk_msr: clock-measure@48000 {
+				compatible = "amlogic,s4-clk-measure";
+				reg = <0x0 0x48000 0x0 0x1c>;
+			};
+
 			spicc0: spi@50000 {
 				compatible = "amlogic,meson-g12a-spicc";
 				reg = <0x0 0x50000 0x0 0x44>;

-- 
2.42.0


