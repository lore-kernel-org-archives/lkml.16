Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB8E2EA748
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 15:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751038053; cv=none; b=Ehmoy93opOkY11DPCfB5VsZyWBpCgXNN8bTDtyhleqIC+gJWKx8Fpb0FQsLHrn6Iv7NFsxG04uM/Q3BGEXpmr/z/Q04qcs+7R4UkshTT+3OsoOalspm/wAtO1OCUv9sagRC+oBZn+ofauV+soC0YHY97zkOenp1yS5Rr1ua4Uqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751038053; c=relaxed/simple;
	bh=rF0nR+ZGjjWrOatx6EGJOUBzErZKLCLRQjJyAMPB9s0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LftsFqUqaoQYc5UumNUE2bQHNCPfCBEg45cEYXomDM4VIOE4PM+7Jz2f/jqrRQdZUD5ogoBNwxf59zLhzQqR+B52p5pKyojk+OmNMqxKdptQ0i7ZEIIfIKHc6Spbl7Rp+eSRCYgICHvPgXl+Ku5AElULar+VwA3EsF1eVTO5vwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=zegeCMgF; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="zegeCMgF"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1751038049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kTB3zWm7oNw70pUsCc6ZoGv3uOF6aJxYArBzhguuOPM=;
	b=zegeCMgFHauTH2R35p0c8FdzreJQoK2TMRMP6hi3anjcv8GpCS6qMdBWFFaLXstfjX0EOI
	iiTijoKhrp2Ncd6fiVlgYOAotL3KOt/Z7WocZJtEC4/Wv9w/kmzZMRypDaJAri9LSiz2Jm
	05jEn1GeNLpnl7E1SBvvu/xUE0qOGEvPcSFONs+uK2LwPa4XeU3ex0i3K2Mtpv1uufy08s
	TkCAX01yTzsz15pK676T/bEljGqzGCn3H80/WlzWBYATv9tjQuWFGrOz9MVr5R8O0rbnUU
	1s+77xKVKcOvZQkocwL2eZ5HkwvXraoSJ/Y+323RDVzu/+I9p1sdnX46xop7Xg==
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
Subject: [PATCH 7/8] arm64: dts: rockchip: Drop unneeded address+size-cells on px30
Date: Fri, 27 Jun 2025 17:16:26 +0200
Message-ID: <20250627152645.740981-8-didi.debian@cknow.org>
In-Reply-To: <20250627152645.740981-1-didi.debian@cknow.org>
References: <20250627152645.740981-1-didi.debian@cknow.org>
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

