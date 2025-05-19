Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDED224895
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747649988; cv=none; b=PZodeKFARGAgUMtuUdMfytn3xfqEmdOTvJhM9T1IMa2m/0g5C7qCAWSvNNTKicWSV6n5Mj9oG8KhCH92e0wUYB2T8KCGC67NKud10Acf0yEVhS66gosKrCdKT/fEeig9Y/Cq0hBFvWhouwycrScmN8uyajcOSCD7H/vHP9wnp1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747649988; c=relaxed/simple;
	bh=LsyKHnwpEbns7jzfi+FQZ9QQQAf1sr4UtXWWOQVFYsE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dOI2GW2gT6Xe6OFDj3MTQ9yuefWZfAOfC9/PKB2GmpUJtR6KPeXAj/CyyYQNux05H8xTYzzi1Nrlymd289j4WztCzfVK55Kw2uoFyjGYwE6rQn5u3g2ESVaAoMgUobEUevahjF+/jay/BiyNhfZgBAAw0Kp1ysXfogO58UmuSi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=MP4oFvrm; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="MP4oFvrm"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1747649974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=W1wlPPM5KG2GsI5tQAqWvz/yuAg+jLg5ME+Tda7BDFs=;
	b=MP4oFvrmt8llfsRowSYmUNDPerHWjDpbUMCGw219WbVmd0TkKZ2EDCoVYddfy+B92fTLhN
	w46Cl0hEy9M+Y9DOxPwUfdmEK6DaoYHEWJJcfqp1gwZOszhFeL3Xr1cKkyfBk6sAq4hAo6
	0dQ+P1BSupP7mYic6TOVRNAn0vmjW2dEzrrC0i7sfQ1i1dHU6/8+07BHYdYQh555cJaHDb
	Mnywst/LcHty78ryXVQW4J6ewx35mwQUBUANEJtB+uWqkOg/agKiDIp6xGPONYRFJt/XPH
	5EiSv/z0LkCi6/ahSnB6l8yZFeh36cXcTVFixIQYbjBRY5LgJfPuYcIymp0P1A==
From: Diederik de Haas <didi.debian@cknow.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH] arm64: dts: rockchip: Drop assigned-clock* from cpu nodes on rk3588
Date: Mon, 19 May 2025 12:18:28 +0200
Message-ID: <20250519101909.62754-1-didi.debian@cknow.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The assigned-clocks and assigned-clock-rates properties were moved from
the scmi_clk node onto cpu nodes in commit
87810bda8a84 ("arm64: dts: rockchip: Fix SCMI assigned clocks on rk3588s")

During review of v1 of that patch set, the following comment was made:

  why aren't you using OPP tables to define CPU frequencies.
  Assigned-clocks looks like a temporary hack because you haven't
  done proper OPP tables.

Some time later, proper OPP tables for rk3588 were added in commit
276856db91b4 ("arm64: dts: rockchip: Add OPP data for CPU cores on RK3588")

So this 'temporary hack' is no longer needed.
Dropping it fixes the following dtb validation issues:

  cpu@0: Unevaluated properties are not allowed
    ('assigned-clock-rates', 'assigned-clocks' were unexpected)
  cpu@400: Unevaluated properties are not allowed
    ('assigned-clock-rates', 'assigned-clocks' were unexpected)
  cpu@600: Unevaluated properties are not allowed
    ('assigned-clock-rates', 'assigned-clocks' were unexpected)

Link: https://lore.kernel.org/linux-rockchip/CAL_JsqL_EogoKOQ1xwU75=rJSC4o7yV3Jej4vadtacX2Pt3-hw@mail.gmail.com/
Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 548677de9a53..70f03e68ba55 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -96,8 +96,6 @@ cpu_l0: cpu@0 {
 			enable-method = "psci";
 			capacity-dmips-mhz = <530>;
 			clocks = <&scmi_clk SCMI_CLK_CPUL>;
-			assigned-clocks = <&scmi_clk SCMI_CLK_CPUL>;
-			assigned-clock-rates = <816000000>;
 			cpu-idle-states = <&CPU_SLEEP>;
 			i-cache-size = <32768>;
 			i-cache-line-size = <64>;
@@ -174,8 +172,6 @@ cpu_b0: cpu@400 {
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
 			clocks = <&scmi_clk SCMI_CLK_CPUB01>;
-			assigned-clocks = <&scmi_clk SCMI_CLK_CPUB01>;
-			assigned-clock-rates = <816000000>;
 			cpu-idle-states = <&CPU_SLEEP>;
 			i-cache-size = <65536>;
 			i-cache-line-size = <64>;
@@ -214,8 +210,6 @@ cpu_b2: cpu@600 {
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
 			clocks = <&scmi_clk SCMI_CLK_CPUB23>;
-			assigned-clocks = <&scmi_clk SCMI_CLK_CPUB23>;
-			assigned-clock-rates = <816000000>;
 			cpu-idle-states = <&CPU_SLEEP>;
 			i-cache-size = <65536>;
 			i-cache-line-size = <64>;
-- 
2.49.0

