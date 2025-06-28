Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBED25A2DA
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 14:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751122178; cv=none; b=aLF2EJwf8ZlzfaIJwTTjEA/NXCA1BcQFpPTNxlzisKCEP7zsBsckPkAi09z94HRbvD9V28Ak4QDAONA8SZT56QbHOvHxGCKzSt2q7UdZb7t/MUkyKSrkUwJLjixVA1N5t12tFEXXVVBBSJ/527ZZl0D0UPA19l1MScqc+30VvCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751122178; c=relaxed/simple;
	bh=rF0nR+ZGjjWrOatx6EGJOUBzErZKLCLRQjJyAMPB9s0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fdtdzTMjZ8iVzPZ04t/Vk9uy2LVOStZ/4Imfbp5ZfsghSHJ3MMmG/MQhIsn7E8cH791douxhQCHcJC7rYUJ+yDKPusJLsOPlqgXejJOhSGYjMOD3iL0N37jY7pw814yxp/URGVAUmfurTxYtzEXwKI1QP00oI339dXYUX9Iw0pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=nR6MuKU4; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="nR6MuKU4"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1751122174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kTB3zWm7oNw70pUsCc6ZoGv3uOF6aJxYArBzhguuOPM=;
	b=nR6MuKU47bJA67UcLFEOguwkqzi5gzBos23kl/TG+n7+70Qkd28gpAvRifR3rwpUsaUUte
	NK8x9Vnsklc68AFCDmCgEk8/0KWGFKRhY7w/7ZeOAgpjWAg53BO0D+zFYw/bJcgY0m3lQU
	A4luaI+6HJEywR+/Kf/WY07cArCNShjWkMaYTNGVt/mdNTHIcJg3xnREQeBQAE1beLjd84
	dbmcNX7WI5s1fCcMQ55bQLtU0ZUL+PAw5wX8NQ90ET0RaqaHeeCe+e6ksVFLusvDok5Q6H
	aw1Yc+gDwKd4EPYfF8l2YmWM6XWcIiNRUxN7OXBukPhtlaUIssjLaDgHnkLmRQ==
From: Diederik de Haas <didi.debian@cknow.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Dragan Simic <dsimic@manjaro.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Johan Jonker <jbx6244@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH v2 09/10] arm64: dts: rockchip: Drop unneeded address+size-cells on px30
Date: Sat, 28 Jun 2025 16:32:43 +0200
Message-ID: <20250628144915.839338-10-didi.debian@cknow.org>
In-Reply-To: <20250628144915.839338-1-didi.debian@cknow.org>
References: <20250628144915.839338-1-didi.debian@cknow.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On nodes with compatible "rockchip,px30-usb2phy-grf", the #address-cells
and #size-cells are required and consequently their child nodes should
have unit addresses. That is not the case for the px30-pmugrf and
px30-grf nodes, so remove them there.

This fixes the following DTB validation warnings:

  unnecessary #address-cells/#size-cells without "ranges",
  "dma-ranges" or child "reg" property

Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
---
 arch/arm64/boot/dts/rockchip/px30.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
index 5034ad8019a8..46f64cd33b9b 100644
--- a/arch/arm64/boot/dts/rockchip/px30.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
@@ -351,8 +351,6 @@ power-domain@PX30_PD_GPU {
 	pmugrf: syscon@ff010000 {
 		compatible = "rockchip,px30-pmugrf", "syscon", "simple-mfd";
 		reg = <0x0 0xff010000 0x0 0x1000>;
-		#address-cells = <1>;
-		#size-cells = <1>;
 
 		pmu_io_domains: io-domains {
 			compatible = "rockchip,px30-pmu-io-voltage-domain";
@@ -453,8 +451,6 @@ gic: interrupt-controller@ff131000 {
 	grf: syscon@ff140000 {
 		compatible = "rockchip,px30-grf", "syscon", "simple-mfd";
 		reg = <0x0 0xff140000 0x0 0x1000>;
-		#address-cells = <1>;
-		#size-cells = <1>;
 
 		io_domains: io-domains {
 			compatible = "rockchip,px30-io-voltage-domain";
-- 
2.50.0

