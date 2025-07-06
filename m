Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E94129E0F1;
	Sun,  6 Jul 2025 18:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751827630; cv=none; b=tdg9L5X+bWTJzdWp02CJKoWdzsA4Oq2W0a0oUvISPBMxtpco4WgQRQJhhwbm2ZE453fZziDmwDEZ7COCjjK31GedxiUAcUhIfOqw0CAiAYZJsmZman0qJs7R66MtywBERMNQIqDo9cS+AzCtaNxC3+uS6It0CB3AVK7+SKng5Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751827630; c=relaxed/simple;
	bh=EN4lHThYxhCk5VD08Uuv8dfUg5fUXUvUoPNAOkv20oU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a4gG6OzTQpjSpHTyogF13UuCsDsWesxMA7vhaHrwfOta1PlNoZt0rnbLDF6ynx7UBEL6uSB8TCGYvex2rR2nIcrbLfiqE7qCfu58nO4H40Pa9S/awTfo3heBcGtfBME3uRMr0vuxeOJZPTqhYLrjT7dbLhQsjMvd9Mzoq7mhMiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C5dPbnbi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C5dPbnbi"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 231E6C116B1;
	Sun,  6 Jul 2025 18:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751827630;
	bh=EN4lHThYxhCk5VD08Uuv8dfUg5fUXUvUoPNAOkv20oU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=C5dPbnbioOFxcnD8l/bx7wdEL9qFWuz+cUpeZIlHiQdZvJb/lfrDiZ65CcnZXbPgh
	 hbWopNauAac3EF7Z/skHlFUMZNDhwyucgn7mBBE/Of5G5E00FLBQn+6pBlTBAf/hXD
	 RKbvDv70ilnt4uhQCQ8/2XflsmCzdqN66uhF9ydlOO+qtAwVqOAURwO+pRFD9hTcf9
	 4EJlhCbddrZiTysxrIUUl6k2knwpwe6U0JN9CAU/HowsC21gDLMEoMDhLHnTMGsZCW
	 /fTaff1aaujyush0nUp9f1Nbk2DPr+vRtrm0F7lJZBnEBa2nm/Qtv7JYGhhHX9u07c
	 GWsLJDUaN4/yQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13DD5C83F09;
	Sun,  6 Jul 2025 18:47:10 +0000 (UTC)
From: Frank Li via B4 Relay <devnull+Frank.Li.nxp.com@kernel.org>
Date: Sun, 06 Jul 2025 14:47:03 -0400
Subject: [PATCH 07/11] ARM: dts: lpc4357-myd-lpc4357: add power-supply for
 innolux,at070tn92
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-lpc18xxx_dts-v1-7-7ae8cdfe8d7d@nxp.com>
References: <20250706-lpc18xxx_dts-v1-0-7ae8cdfe8d7d@nxp.com>
In-Reply-To: <20250706-lpc18xxx_dts-v1-0-7ae8cdfe8d7d@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, vz@mleia.com, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751827628; l=832;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=Mj33KBqJ8qYPhYbxScfAHy2wCR1k2Cd/+ykWat59/P0=;
 b=4Oj/Af4XMkSutzkLenURHXGc8DMsWE7llQckfUU1wwfdGDUarn6oCy17H3FQKmVuIweGR9BDU
 8eJZtjwEViFAf12UnwD1ycbElA7uadkpJJB1DWYoAXOSkmgKkfCu9wV
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-Endpoint-Received: by B4 Relay for Frank.Li@nxp.com/20240130 with
 auth_id=121
X-Original-From: Frank Li <Frank.Li@nxp.com>
Reply-To: Frank.Li@nxp.com

From: Frank Li <Frank.Li@nxp.com>

Add power-supply for innolux,at070tn92 to fix below CHECK_DTB warning:
  arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dtb: panel (innolux,at070tn92): 'power-supply' is a required property

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dts b/arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dts
index 22f7dd671c90d56cc4295151583fd4135c8b707b..ca91bb8f6ada6c4c3e74d4d76a2382f667bd2649 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dts
+++ b/arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dts
@@ -63,6 +63,7 @@ led6 {
 
 	panel: panel {
 		compatible = "innolux,at070tn92";
+		power-supply = <&vcc>;
 
 		port {
 			panel_input: endpoint {

-- 
2.34.1


