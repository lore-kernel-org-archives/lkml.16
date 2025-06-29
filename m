Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9523D2264AF
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 12:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751200743; cv=none; b=G4deSzzibnh86flR8F/+xLV3nXVCCppoOs8cxu3uxetYSpvlC7h9pkL6OqDmMN8KygXz05khH/W2sUSVa61oTFuH/rK+M8CVHWMu5BpCJwY5ymvGkmFPfEpubeIRP+dtYdy0adQ6M8XCSamh0mJ2YTtzdMw80IeOdlDvCL6WVAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751200743; c=relaxed/simple;
	bh=rF0nR+ZGjjWrOatx6EGJOUBzErZKLCLRQjJyAMPB9s0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IAhv97A6Zl0urE965Qp33FZwRPZ3cB2zxpIzZLnv4FukK0OCDYu5QadIhfOl+dr63Abc25mJWJQYdSSygbtqmK+hNaUh5JUo7iepcXGff1K/vHuMHajQDuPqFYWB3OvZBesYTBjO4ImSPWQm9i+EEoSeIVRfwQbpoj5g+j3Qr/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=cerCUDLV; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="cerCUDLV"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1751200739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kTB3zWm7oNw70pUsCc6ZoGv3uOF6aJxYArBzhguuOPM=;
	b=cerCUDLV4y09ANz1AxbiKp9t527+KDGSHIeyAKh5ZXzyAhuafj3hpVAJB6ivgTV2op8xql
	KJeHKoKltLqluqk/2IsoPnJO03ufCEgIkox3ggQTqewdXct1C+eLhDecVIxCc5aMOymQ1w
	0Ycigjz8tBcblX2Wf7HuK97s2sGlRBEJIt0JX2cNAW0PohrigjVTJ8Ya4F+X+tUhWbQ0Z1
	VhCWzEeoj0nUXCRXAUl/sYfsK42bKJATgHDnOTPn8vcMsxEfA11cBbPCyx1WBFfNSLOtx8
	8Z3hFQLWDOYrQIpOq/zMKwZwXSLFOCOxajLik4sbHb+4DjxWVRsMsFwARaNeww==
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
Subject: [PATCH v3 09/10] arm64: dts: rockchip: Drop unneeded address+size-cells on px30
Date: Sun, 29 Jun 2025 14:34:50 +0200
Message-ID: <20250629123840.34948-10-didi.debian@cknow.org>
In-Reply-To: <20250629123840.34948-1-didi.debian@cknow.org>
References: <20250629123840.34948-1-didi.debian@cknow.org>
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

