Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620C2279917;
	Tue,  6 May 2025 10:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746528231; cv=pass; b=H9qcbxqTTbr/COdMJBYkllhRcvB+rFPjw/Sa2G/7cbr+qrBswtn1ZLZxwCXOOQHMtQBpUCjZzXuhmtDABPi1pqUTBBo00P5ZYSRgOsGvQL/TVM6O8YggVymO16eFroZidb5wD1L5JXPNj8kz54axVXQpxIqf1pcBYZLcppFl3s0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746528231; c=relaxed/simple;
	bh=3vneXZif67c5wwKvWFJqG+Y9zy+v5Dq1jaCCZdIC0Bs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p/Owi2DjUFI/S2CP+JLZg6qyKbw4RT5HO1nIlIemGVyMIdj+F/3QAuLT74pROzvWuf86gZmRlk+XWPsLLIeo8tG+of5jOlcgkH8LVvPwDnKD81OCkT8M0S/7b5R4T6qYL/O29UbW6tJGSQ8ZlDnU+qOrypLy9Aj7xUL6Goo+CyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=E2V2wqLH; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="E2V2wqLH"
ARC-Seal: i=1; a=rsa-sha256; t=1746528200; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BGG4TmAnG6+ywnboo774xVV7bpcy3rojy+zvDZ/saM9Q8tw2fZPcINHb+6pWmuClY/X8wEwlWO1wRWPZZ8lfQKaUTPXXbOljgJl3V9y35mP5uidG+elz+QHVR5ruvGZrewQA4Y3QuDsCzbcOWXUc61cAOJuPdmQqAysq58rIDMc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746528200; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zbj7FigzPl1wygMFk3E/KVSAQVl9deVtek5AIIz7Erg=; 
	b=H8l76H9flmzhmYbgRd4g8O9aAiyDK6dxko1ltX9TCtpQEbW2DCH4eCsm8IZVVQRSJxiSJm/13J175j8V3pjMNnH3hLEu9P7OK5KdFGdYiaie2Re4X7bS1+2Grpzp1Da6Ms/j0vjkxQAP8gse4B6acKNAtI+InrhoIT1iUT1OmEQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746528200;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=zbj7FigzPl1wygMFk3E/KVSAQVl9deVtek5AIIz7Erg=;
	b=E2V2wqLHv8RMazfFo3M8f4FOY/Q3bNX7vKjPSp3b7yp5RA97JL5xVaGObdL7XCZy
	YQB/MFtqC912b+FjTxcbCwb3AGcg/PiRf1myucrLT+YCHU2wILWRC5GtSR0iRhmQ6xq
	qaptEZqwiHJkPAY3beDdwn1GkJQWKwqydUy1Oj5g=
Received: by mx.zohomail.com with SMTPS id 1746528198845647.6559446026723;
	Tue, 6 May 2025 03:43:18 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 06 May 2025 12:42:43 +0200
Subject: [PATCH v4 4/5] arm64: dts: rockchip: Enable HDMI audio on Sige5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-rk3576-sai-v4-4-a8b5f5733ceb@collabora.com>
References: <20250506-rk3576-sai-v4-0-a8b5f5733ceb@collabora.com>
In-Reply-To: <20250506-rk3576-sai-v4-0-a8b5f5733ceb@collabora.com>
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

