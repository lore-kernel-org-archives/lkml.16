Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94975522F;
	Wed, 18 Jun 2025 06:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750229566; cv=none; b=IhKvkn7f7NmlsohBUNhjGFUuv19e2BHsoB2XyLKzDup8R2X/bNGlcKGheSP2RUmfkwde5MJuizCak311Qg9cyib4Md6+z91Uu0WRCO/eTXUSl2m2TfuNTrdGvfCfbR198Ui51c0yVVgoU06LrI8wnNZqTX5+ASgRiUyP+Jy2yME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750229566; c=relaxed/simple;
	bh=prDfa/5Zbm9GA9G4tD7ZSeyJ1W+Dn9Epp1t6A1MMNwo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=m4JcscSf7ENVZ2T0xMFd6wlUA2tD7k1ZUD6rjuFuQLSe7nQg/WwbmwVA5ENw5nfBfMdgX111kPkV5qNqgLWyw9COtmGfg6R9RbsDD2okLN5ygdidEcWbGDn9KZuBFIARb2u8FKSYssTlrniVSK74UuNYYtmGE0Ctyd7b57pEvOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RsJipWcl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RsJipWcl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93D2EC4CEED;
	Wed, 18 Jun 2025 06:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750229566;
	bh=prDfa/5Zbm9GA9G4tD7ZSeyJ1W+Dn9Epp1t6A1MMNwo=;
	h=From:To:Cc:Subject:Date:From;
	b=RsJipWcl/kmAXaotjhAwkqCBWa3T3L278I5zdgKs353dwP6Pw1KBECYhtGKFoGoyo
	 kjYOjf4CO3+uh9PD6LnwOkrCHFpIa934p57BAYaoRHZmhaecX6gY4yo+QTLlUGX60S
	 78+5Y0prt7mFWQuheeCvMFq5pzbhFGiTozTnlF0FSCNnIi4JEtVhJx2mx/ouhXc+aY
	 ADgg1pM42jEaoixslcLQSk/627KR9slA79+QE61RUHPasGNDOqgT3BQzo/5i4wNnSh
	 87Gvz5FMhVvl5/LKo02uiNfy9TIstoZzFlIucs59Bz5YzZFqao5Sa8JTcoN2vdii+0
	 HDAnNtmPGyhtg==
From: Michael Walle <mwalle@kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan Brattlof <bb@ti.com>,
	Dhruva Gole <d-gole@ti.com>,
	Andrew Davis <afd@ti.com>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH] arm64: dts: ti: k3-am62p-j722s: fix pinctrl-single size
Date: Wed, 18 Jun 2025 08:52:39 +0200
Message-Id: <20250618065239.1904953-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pinmux registers ends at 0x000f42ac (including). Thus, the size argument
of the pinctrl-single node has to be 0x2b0. Fix it.

This will fix the following error:
pinctrl-single f4000.pinctrl: mux offset out of range: 0x2ac (0x2ac)

Fixes: 29075cc09f43 ("arm64: dts: ti: Introduce AM62P5 family of SoCs")
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
index 17471501df24..17c0949ac1d7 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
@@ -264,7 +264,7 @@ secure_proxy_sa3: mailbox@43600000 {
 
 	main_pmx0: pinctrl@f4000 {
 		compatible = "pinctrl-single";
-		reg = <0x00 0xf4000 0x00 0x2ac>;
+		reg = <0x00 0xf4000 0x00 0x2b0>;
 		#pinctrl-cells = <1>;
 		pinctrl-single,register-width = <32>;
 		pinctrl-single,function-mask = <0xffffffff>;
-- 
2.39.5

