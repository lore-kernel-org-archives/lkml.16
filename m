Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80464226CE4
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 12:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751200744; cv=none; b=Ehna1l+h7daWq7P7mYlywqH6BB8ALSa/MBpd7+XWSXiTxW9oek0DKDno04xOYJOlfk0bOd/0/6TR5NJ5wvMFSZRQB8txIJ2kpBwr20l3ZzC3vK3a53FVWgqwUiG+lNY4LA5IrkKWg/pmHyeTM8eiuIIffSlgcPuMOO0oVdcXjHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751200744; c=relaxed/simple;
	bh=nsAfoD3v/HBr6ID5bxFuUM7z5sm2UrulP0r+6b9gb7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pW7S6gLmCLIodZaYQ8FsNOZqi15RTFFeBoLUYt3kZSfdGRJbickdw2vxQiuzkMMXnVB9HTgNfoSOtwFs5HLQtZp30JUQWQJLT0TzYgmstjqBE2nZdUA9vh5JyxFd5O2hFcjQjKomsqUhOtWGTaoPQtwpebg15gnjoFgr6Cj2YnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=GQ4CNfk0; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="GQ4CNfk0"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1751200740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nOCOpdzyJGYo0WmyPHPzo5U4cOQf2vkC3N8qsd5gyAo=;
	b=GQ4CNfk0xYcLdg3QU3SXwDgtJBjFrtjYOnP60c4J65IbFhmbgdnKCiH808hU9zytHkA6cT
	tF1pijGHtg+ob3gSyJ5Ehr8trcQT//uH1wtvJ7VtSBtwp+5l4muHaDGZwlF2waUSLay3um
	ERbafNgcMmplUtgHVNXeOcieTH6IS26Hi0yI8aU82SqTvR3CUyvKAgLw+33Fu1pMxuJ8SM
	sad/A6QKkgijKK3sYl+ymD479c+DSvBr2qgu/G1d8kJhIncalUZ6quNT9DLKVN7RoS5ZHV
	L2ijJLuopUDuvnDtsAjPcasKPa4O4Sidnvhc6Nl3a34aMdG3miwguqRFRVEWKg==
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
Subject: [PATCH v3 10/10] arm64: dts: rockchip: Drop regulator-compatible property on rk3399
Date: Sun, 29 Jun 2025 14:34:51 +0200
Message-ID: <20250629123840.34948-11-didi.debian@cknow.org>
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

The regulator-compatible property has never existed in the
regulator/fcs,fan53555.yaml binding, so drop it.

This fixes the following DTB validation warnings:

  Unevaluated properties are not allowed
  ('regulator-compatible' was unexpected)

Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
---
 arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts   | 2 --
 arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dts | 2 --
 2 files changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts b/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts
index 81c4fcb30f39..352c8efb37e0 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts
@@ -211,7 +211,6 @@ &i2c0 {
 	vdd_cpu_b: syr827@40 {
 		compatible = "silergy,syr827";
 		reg = <0x40>;
-		regulator-compatible = "fan53555-reg";
 		pinctrl-0 = <&vsel1_pin>;
 		regulator-name = "vdd_cpu_b";
 		regulator-min-microvolt = <712500>;
@@ -229,7 +228,6 @@ regulator-state-mem {
 	vdd_gpu: syr828@41 {
 		compatible = "silergy,syr828";
 		reg = <0x41>;
-		regulator-compatible = "fan53555-reg";
 		pinctrl-0 = <&vsel2_pin>;
 		regulator-name = "vdd_gpu";
 		regulator-min-microvolt = <712500>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dts b/arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dts
index 15da5c80d25d..962b8b231c96 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dts
@@ -421,7 +421,6 @@ vdd_cpu_b: regulator@40 {
 		compatible = "silergy,syr827";
 		reg = <0x40>;
 		fcs,suspend-voltage-selector = <1>;
-		regulator-compatible = "fan53555-reg";
 		pinctrl-0 = <&vsel1_gpio>;
 		vsel-gpios = <&gpio1 RK_PC1 GPIO_ACTIVE_HIGH>;
 		regulator-name = "vdd_cpu_b";
@@ -440,7 +439,6 @@ vdd_gpu: regulator@41 {
 		compatible = "silergy,syr828";
 		reg = <0x41>;
 		fcs,suspend-voltage-selector = <1>;
-		regulator-compatible = "fan53555-reg";
 		pinctrl-0 = <&vsel2_gpio>;
 		vsel-gpios = <&gpio1 RK_PB6 GPIO_ACTIVE_HIGH>;
 		regulator-name = "vdd_gpu";
-- 
2.50.0

