Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1FE2EA179
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 15:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751038042; cv=none; b=kzgMNY4txsSbFGKQxFzsj2g/dEsAN/l36dmUI/V9lViq/L4XnzDvjuc1IqpyhSnjKsle7M9I1VT0VXrPZgJNuJuDgq5QhMAgaabDMBidazeFwXdh5GiYmGoW0OA3PDoFBcRzOqbdZ54zU6w4ar+DeP/PzMYjd9k3ShoKlF8gHcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751038042; c=relaxed/simple;
	bh=J/Fe7VsW55nHtlw7aUGllk4ytzTJTWxNR274VqR29BA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nZdXxwTPcqMCTNXDDpQNitcuHTzgdoNpri/3KzDi9vI0PCX4fS1tvSbk3hz/A5C6RiNTdVdmkS+/b7e7YH+9VRBZsu6jAt6CWKFaz657BR2QSaHxY+f2CjPolm1e7fc6lr2mnGUs8qx/Al/gieYnpcJhbJkNyEtHN/9i5LtOBdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=nxbfwm+M; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="nxbfwm+M"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1751038039;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LdOjVT0hxZ4MogGhHL86KxEfuOHrbi5hNR9VAR3J/Ig=;
	b=nxbfwm+MitF8loH1tKwMyCkE2/0eI4R2TRx7llUMTV7XNzavxNSb6A0rfxYWub6ZZL0qU6
	1e8FNAXP7UEHC2hBiEaXGDL/OwOadbujC4CZMsRGW1h7KGakSccQ09eVZTsosSFYcXmToB
	0zOtqoBVWErn8FlWL0/VrQfj7K15hCtFtO0l8hxy5WAPazn5bS65eJ55HfQ1R7U5w609dF
	EmsoJUvk75ryjTlM4jxgouDYd4kg9Qw1HcDtwchMdf+7lk1uGZH/hJICGezP+hAILdgP0s
	IphcZBjlG2TLczXikdeuLi56TczP4jTsmYByiiTTu5I2ZTF0147HXrbtgeGjkw==
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
Subject: [PATCH 4/8] arm64: dts: rockchip: Simplify VOP port definition on rk3328
Date: Fri, 27 Jun 2025 17:16:23 +0200
Message-ID: <20250627152645.740981-5-didi.debian@cknow.org>
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

When there's only 1 endpoint, there is no need for a unit-address and
removing that allows removing of related properties as well.

This fixes the following DTB validation warnings:

  graph node has single child node 'endpoint@0',
  #address-cells/#size-cells are not necessary

Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
---
 arch/arm64/boot/dts/rockchip/rk3328.dtsi | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
index 7d992c3c01ce..6438c969f9d7 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
@@ -731,11 +731,7 @@ vop: vop@ff370000 {
 		status = "disabled";
 
 		vop_out: port {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			vop_out_hdmi: endpoint@0 {
-				reg = <0>;
+			vop_out_hdmi: endpoint {
 				remote-endpoint = <&hdmi_in_vop>;
 			};
 		};
-- 
2.50.0

