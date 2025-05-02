Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEA324469A;
	Fri,  2 May 2025 11:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746183881; cv=pass; b=MqdV2lNQMoyheDzQmesLxRVSuL3yDweZeLXk0TtotSksvJlvMtzv76wbSiktvpk4uIvk2tAOINZFKlGE649FAmmuGmWcAKZWXt7UVm0jHGAqgDAUyqbce9wfT+rQG/6H8xbldBPkppAvN+hwjawOQfYNtIuQC6+E8Vfdwaau5Yo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746183881; c=relaxed/simple;
	bh=3vneXZif67c5wwKvWFJqG+Y9zy+v5Dq1jaCCZdIC0Bs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WCqtCTn+wHOWp8qMz9+YXxo4zET/7ADcXaUWtu0rCxxrQSZbn5JAdvnWeakICFzqZublgjLnP83/WhgBOqYjOHICli/cO8cDE3xvaZZRaijy14l15JNt4mjneWmKFq9Sm12X4IOwvsH057Ev1kioTZ9WSOe8rKD1Ev1SitYwHGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=gygcTHvE; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="gygcTHvE"
ARC-Seal: i=1; a=rsa-sha256; t=1746183851; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Firwafq0j1ONHU2WQ6sz/w5ywGvhFJB9I1Nrlk5pdY67vzizfxLx0MVECcUQDnNG6eMGtoFTiEUpCX+WdZAiHBNwxGek0AS8YNLDPowTfPT6qnv73GVMCvYQtd2SB+WbT228shn7IKUJEW5bBZ/opIrSImFXrW3V5TRs6Y3lb2M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746183851; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zbj7FigzPl1wygMFk3E/KVSAQVl9deVtek5AIIz7Erg=; 
	b=SvtoPE9wGb00Vf5guYqrBi4X0RvgD/qIQzrOTiLmdPy3lzgJkHMZNRJxjqUS3V5D8Xkc+uEIup/3WkO1pisVobz8Z2Ov+i+BtuYwr10/rVSxvSeThmvclX7vYjfsOGQ+tWxn40T8a1/Flt0DdBtk/xzR9magJNu+sIulaeabCPM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746183851;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=zbj7FigzPl1wygMFk3E/KVSAQVl9deVtek5AIIz7Erg=;
	b=gygcTHvEcRxZ//ZvJegjuvP+oP1sff7jkPu8Xf9cUr0mSWWwczUTMBFoXHBYvhuR
	9+lzyaPzr53+ERdGmA0yArATwcY59iI7AqJQHRoSLpEx+VeNmil9QLsRcjKVfq/k+EK
	DirX2ENGDHjhf+t+pVfUz2ddj5ygmMgwka/jMzC8=
Received: by mx.zohomail.com with SMTPS id 1746183848446280.1735690979417;
	Fri, 2 May 2025 04:04:08 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 02 May 2025 13:03:14 +0200
Subject: [PATCH v3 08/10] arm64: dts: rockchip: Enable HDMI audio on Sige5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-rk3576-sai-v3-8-376cef19dd7c@collabora.com>
References: <20250502-rk3576-sai-v3-0-376cef19dd7c@collabora.com>
In-Reply-To: <20250502-rk3576-sai-v3-0-376cef19dd7c@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Sugar Zhang <sugar.zhang@rock-chips.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2

With the hdmi_sound node added to the base RK3576 SoC tree, we can now
enable it on the Sige5 SBC.

Do this, and also enable the corresponding SAI6 audio controller node.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
index 2c991ad974a95fe1995a8d15eaba3e7b07d4dfb6..b09e789c75c47fec7cf7e9810ab0dcca32d9404a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
@@ -275,6 +275,10 @@ hdmi_out_con: endpoint {
 	};
 };
 
+&hdmi_sound {
+	status = "okay";
+};
+
 &hdptxphy {
 	status = "okay";
 };
@@ -736,6 +740,10 @@ &sai1m0_sdi0
 	status = "okay";
 };
 
+&sai6 {
+	status = "okay";
+};
+
 &sdhci {
 	bus-width = <8>;
 	full-pwr-cycle-in-suspend;

-- 
2.49.0

