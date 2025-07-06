Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD171459FA;
	Sun,  6 Jul 2025 18:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751827630; cv=none; b=gW2w/Mevla4+0VacCqrbXPb8RwEfuB82a3pQM5b5AoeVqCs/c79WWabJlgopfmoxmkgMBt/U2Jostbxqa/xyqOZIG1Jjmp/FXQWMd3cR1zvVvqlrAYvLJ+JAbra7IPU30bebqc8VLoaSZKEoDfBcLTYge2eKt82LLhp9BVfAY1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751827630; c=relaxed/simple;
	bh=GxyZ76W6YsSH+nEuKRIDiaUia7mvng8ubzru+ZlvBhM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fOexIVux1dHhEjFw8lQqtOkPlLHBq/l9/KnbYk9zpQftVPsEPD5jssQ59kTCZfCBuwyLuoCtqmZTkmdmZ7UlObS6xqE3DjFyBDihZk7IzpqcihuQVlZxwuzm7gvebQgMjz9qRpsWoglhWunzOLwlCwfMuyOyoEjxVDbe4YfmV50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ObYzMobi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ObYzMobi"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EE454C4CEF4;
	Sun,  6 Jul 2025 18:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751827630;
	bh=GxyZ76W6YsSH+nEuKRIDiaUia7mvng8ubzru+ZlvBhM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ObYzMobiVGq4GzSc6MzgkZiGl4N+eRaW5XMAxGmYQAAH+elZr7/+hwVjg8+63/1F/
	 h8RtIldsBhmHTcQvtuF4qA38mvppC7REBjXMFY8JHizkGPiZM7AVS8e3zSc921BFn1
	 TpZVEImXo9k4h7WqVMz3z7lDvDZ8CWNuA8AJIuP22YzQcTuKc24vnBABGc60Cqxidd
	 pfTSD8BshCj3WlDJ28V0WVteCGLJs+m7jdkiEaOV2Q4tFefOeEfaE8oZde6xLDfOfY
	 KW6EZq9XTOZkJAOW5PBQ3p1kvD2laEKKBJZVMlnynp9dOjLkwPDxU/5D56rJT5LlhB
	 nhmNRK5BAIGLw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2816C83F0F;
	Sun,  6 Jul 2025 18:47:09 +0000 (UTC)
From: Frank Li via B4 Relay <devnull+Frank.Li.nxp.com@kernel.org>
Date: Sun, 06 Jul 2025 14:47:00 -0400
Subject: [PATCH 04/11] ARM: dts: lpc18xx: swap clock-names bic and cui
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-lpc18xxx_dts-v1-4-7ae8cdfe8d7d@nxp.com>
References: <20250706-lpc18xxx_dts-v1-0-7ae8cdfe8d7d@nxp.com>
In-Reply-To: <20250706-lpc18xxx_dts-v1-0-7ae8cdfe8d7d@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, vz@mleia.com, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751827628; l=1266;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=UCsVuTJJb65oR4iDCkRHol36phtuS4BFYwUlRuaLl5E=;
 b=8tTDLVmaoeE+iXXsG2lnWevRaVivwYKePo3fWG6ADYnm7xCFTZ/mI/z+/WPC0lF9Qwv64tDDu
 3B2UYDsW8G6CMaArGFZdDqIT9Kmjv41kJrt6LOo2ZrJAF8GqPhoRR0g
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-Endpoint-Received: by B4 Relay for Frank.Li@nxp.com/20240130 with
 auth_id=121
X-Original-From: Frank Li <Frank.Li@nxp.com>
Reply-To: Frank.Li@nxp.com

From: Frank Li <Frank.Li@nxp.com>

Swap clock-names bic and cui to fix below CHECK_DTB warnings:

/home/lizhi/source/linux-upstream-pci/arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dtb: mmc@40004000 (snps,dw-mshc): clock-names:0: 'biu' was expected
	from schema $id: http://devicetree.org/schemas/mmc/synopsys-dw-mshc.yaml#
/home/lizhi/source/linux-upstream-pci/arch/arm/boot/dts/nxp/lpc/lpc4357-ea4357-devkit.dtb: mmc@40004000 (snps,dw-mshc): clock-names:1: 'ciu' was expected

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi
index 80da477bae3d9dc45f0dcdedc275ac2ff09032bf..0be2486f07173c47bdc9d298a11ac9347f81cf02 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi
+++ b/arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi
@@ -115,8 +115,8 @@ mmcsd: mmc@40004000 {
 			compatible = "snps,dw-mshc";
 			reg = <0x40004000 0x1000>;
 			interrupts = <6>;
-			clocks = <&ccu2 CLK_SDIO>, <&ccu1 CLK_CPU_SDIO>;
-			clock-names = "ciu", "biu";
+			clocks = <&ccu1 CLK_CPU_SDIO>, <&ccu2 CLK_SDIO>;
+			clock-names = "biu", "ciu";
 			resets = <&rgu 20>;
 			status = "disabled";
 		};

-- 
2.34.1


