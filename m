Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506BD19F40A;
	Sun,  6 Jul 2025 18:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751827630; cv=none; b=l67JpG4a2BrGUoxexjBNsQ1gKGrHRPGajomBVPzuBs7G1QqF4xbqnH9e0x3XQxdkR27xwLxARIvwud3yWqJvCw6f613Qy0XNuAn5yQ/FsnFwUJmsCLTrtXCbwWobs+shLYxD6rpBoQWwuZX0ZGHy9M7rADFmRsW1qhLKn0MS+ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751827630; c=relaxed/simple;
	bh=4Go0MW1lNueOVC6gmf+7/91l89KKwhKe4dlIKHzP6fQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AMIgtKpKzGavM9cMjzC6tHa/13N9apBHLKe8ScNrYnyjMdGQP0gXmt0jTGgg+52jpiun4Z/uxJpSc8AJLNHs5VB+3cCs1JrT8DlpHK2tYvlRt4ESfyBkzoWlQP4q2E1LltuvS8evzI0q3FSujDbWobk1/Nugd768XKZp44M1ccg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aSklsBqX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aSklsBqX"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DF877C4CEF3;
	Sun,  6 Jul 2025 18:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751827629;
	bh=4Go0MW1lNueOVC6gmf+7/91l89KKwhKe4dlIKHzP6fQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aSklsBqXQOIXwZacbLeEwMgBXOGVUj5t8h9mHHdOq+YBIDV9jvUz4uDJ4G42TnUd0
	 GapSCPEo/A6f1sXrJCBDNs+iyeXY8bkpeadf+Y8LOSIwjWEJ6Jq560HFWXbAKLuSL1
	 fb/pC7QKjZs3qVsgIhNJZxr04bQpGeiRAB2pNLzb3AFsGN0MmD4ZB0unXVNfql5U0t
	 YiZouDQTphVrKqVWshnWJyKLjSpgED1IRQ5oNTDOHRoC6fu3NMMCHiLG+Ci+guNdTU
	 h35FmaDrpIYEPJiQ+UoQvYFuGWUnczLsh8N5nsDFe17fDyoRdu3hj/UOi0JmuQRj43
	 uyzh+lhnMEG5g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE1D6C83F03;
	Sun,  6 Jul 2025 18:47:09 +0000 (UTC)
From: Frank Li via B4 Relay <devnull+Frank.Li.nxp.com@kernel.org>
Date: Sun, 06 Jul 2025 14:46:57 -0400
Subject: [PATCH 01/11] ARM: dts: lpc18xx: rename node name flash-controller
 to spi
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-lpc18xxx_dts-v1-1-7ae8cdfe8d7d@nxp.com>
References: <20250706-lpc18xxx_dts-v1-0-7ae8cdfe8d7d@nxp.com>
In-Reply-To: <20250706-lpc18xxx_dts-v1-0-7ae8cdfe8d7d@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, vz@mleia.com, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751827628; l=1063;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=6m2OSalDvDTCfCB99DCue/9d4bd3iaqflWbmUZP2bls=;
 b=rLn7PQwT/q0/86RMYLYAyz21Paf2qNzYr0Awx+18IxDv+lT+Z7/NDdAVYe/1Ny03d8O3hDaM5
 Z+UzuUf74cjAyS1ABs2+UZqZpriLfW3MgoT0Fe7cZk6mHJbfrZF9ERv
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-Endpoint-Received: by B4 Relay for Frank.Li@nxp.com/20240130 with
 auth_id=121
X-Original-From: Frank Li <Frank.Li@nxp.com>
Reply-To: Frank.Li@nxp.com

From: Frank Li <Frank.Li@nxp.com>

Anyway it is SPI controller although intent to connect qspi flash.

Rename node name flash-controller to spi to fix below CHECK_DTB warning:
  arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: flash-controller@40003000 (nxp,lpc1773-spifi): $nodename:0: 'flash-controller@40003000' does not match '^spi(@.*|-([0-9]|[1-9][0-9]+))?$

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi
index 6dd73290f0c6392a407e5115551cbbeaf654f94f..e17298e89eebf4fc7e3f135dd4a20e563db48ed3 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi
+++ b/arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi
@@ -100,7 +100,7 @@ dmac: dma-controller@40002000 {
 			memcpy-bus-width = <32>;
 		};
 
-		spifi: flash-controller@40003000 {
+		spifi: spi@40003000 {
 			compatible = "nxp,lpc1773-spifi";
 			reg = <0x40003000 0x1000>, <0x14000000 0x4000000>;
 			reg-names = "spifi", "flash";

-- 
2.34.1


