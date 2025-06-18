Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D71F210FB;
	Wed, 18 Jun 2025 09:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750237653; cv=none; b=AGyKJ8tAqv6te01V6IA2aUtD0Wgj7N7xbvC3jqR5KHuYupx8UsBNumTMiuzMm7s0A+dska11P2ttkRYZCpWNdr8x/Vx1la6i7+KUJiA+b5ILNuOiKMn+fzp0Hn50EpwJbGQ4GAF2PtRNbmNJWcjmg8dPyc/lP3RDfLbeq7ijGp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750237653; c=relaxed/simple;
	bh=Mewybbtg4tGrzCWqNUg4G/7zv5ffcJGfE57Fi5US1cw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qyc39zMRAxIiRqlam7V7Tbo8Mx47kIRRuAYdr9DrFRfn7o+A6VrxanjpICePO4vP6cT0BzcMn0/4CP7jkm2FAuhz8gRrd0MV2d8X2KjIrb9kSEHvoqYYTxpIYEtB+4W6c2MhNhtFbJRJsqk3wo8c/CkSeAPkHyRKZZ2+NeopUO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZlawaGk8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZlawaGk8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D81DC4CEE7;
	Wed, 18 Jun 2025 09:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750237652;
	bh=Mewybbtg4tGrzCWqNUg4G/7zv5ffcJGfE57Fi5US1cw=;
	h=From:To:Cc:Subject:Date:From;
	b=ZlawaGk8wiRL0yI3g7KpUNuVnnOmwWkNKipVx5+AIEwzspLR0aEiAv8dZ4FBACFZR
	 6hNyEVHFAxfG4wI6Kz6yOvmrMbAql7QOFvOQ4qFHyHdfSZr+DPloDVK1aqai6IobCY
	 Q0SLemwPN4H7JFulVSnyppqnJbHGH5Vu8L8HnuZ0SxBtObs5L0P3wSbtMa9LxJopFw
	 j+IQA6F88ffu6F974nOKOzSfAucFaL7PkEQ1R2y3wzG4Ogqank1xbA5lP+Rg/9hAfL
	 VTNWh1XT2q3/jKEK8r6tLl65jmvMkKXrd7jKq9TuYcygog5Y8rY+NBzqMzyFiyiN5f
	 3xQFc7LbW8k6g==
From: Michael Walle <mwalle@kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH] arm64: dts: ti: k3-j722s-main: Add audio-refclk0 node
Date: Wed, 18 Jun 2025 11:07:24 +0200
Message-Id: <20250618090724.1917731-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the node for the AUDIO_EXT_REFCLK0 clock output.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
index f6aca9fad25d..38c9a47a4838 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
@@ -430,6 +430,15 @@ serdes_ln_ctrl: mux-controller@4080 {
 				<0x10 0x3>; /* SERDES1 lane0 select */
 	};
 
+	audio_refclk0: clock@82e0 {
+		compatible = "ti,am62-audio-refclk";
+		reg = <0x82e0 0x4>;
+		clocks = <&k3_clks 157 0>;
+		assigned-clocks = <&k3_clks 157 0>;
+		assigned-clock-parents = <&k3_clks 157 15>;
+		#clock-cells = <0>;
+	};
+
 	audio_refclk1: clock@82e4 {
 		compatible = "ti,am62-audio-refclk";
 		reg = <0x82e4 0x4>;
-- 
2.39.5

