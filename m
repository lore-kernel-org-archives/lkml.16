Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7613290BB8;
	Thu, 10 Apr 2025 19:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744314102; cv=pass; b=CehHigLX82KegcbGJ4749QuKGEzZMgYFIXo64tRTveNJPhlTHzVmqgwucxjnqxgPZkvvXKFhHWyX2ZZP7s6KXd9Q08LtJyy2EvsLHfMvwd5EpvlD4uAgfHYfLDKMMrDTvai/gHCeQqGcLYmsm54i4vbL5ECSu2cDHxKgZUHXVBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744314102; c=relaxed/simple;
	bh=Jb4JAOCWXNnzfq7QBGtZfgtF0X9Ee+WI4DK80WnnVnk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BBE7dGIZe0c66ZY/AY038/27pbmFBGoPb5bnMxnbt33hhJ16m4RexkP5uwm5d//95dq62EFR1xUlecbOktfPGucz+XBsdI0YIxsqvHKKou6TlEmSy4VnNOaXlGwWV+0VdcDzPQqhemHptK1hEohWE5K90zVO2Z+nihqu5mA5D7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=EqGHyRCl; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="EqGHyRCl"
ARC-Seal: i=1; a=rsa-sha256; t=1744314071; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=npW3t2QfyVKFR6PHamSs5iAoGNvnTpEDIUFaHfgHjrhK93bDt1hoyatt/fVm83Fihgmmj8YWOvx4uXYrr2sQ0es9cGRs9xXxX49+oMEuZUgBwW7LMMTkUKPALDuQgdeRhLkzIEOcCkBwltpuA8a8yXO+suUMfyvpRx0klhFgU7k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744314071; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=P0cmV6UZVQw6LGqA8u7XzoRfDgQACF1SmL35zBKp97Q=; 
	b=UxFrFWBta+1rMpAt1o1P3BvHk314sP+7pKveZ29fVTsjITILhHdUylfByeM5TevGU27ayWM5yt+NUTDiMdSIEsObv5DLeXHpPxQ4SoNhLiKKJ+3ZVidaCp/wTMnUn0b5OqzmS0qShQDDK/T9FL50PS2lK025aEHiEnKeb6UPtk8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744314071;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=P0cmV6UZVQw6LGqA8u7XzoRfDgQACF1SmL35zBKp97Q=;
	b=EqGHyRClpjHhzE2crq3wyxq54zEggbGq8YcFa90BYnW3aNEfX6TIuHKoxPayJVuF
	EuCMEB+myYCONIppsHGd9gRuTbPcDY/UhRWvP3HAnTeVuar24UUA25ivKN2joobs2Pa
	3xW5+xel4/3uUdHIlCmiuSftuitEfh6IvUwR9Cqo=
Received: by mx.zohomail.com with SMTPS id 1744314069853161.3440582389277;
	Thu, 10 Apr 2025 12:41:09 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 10 Apr 2025 21:40:02 +0200
Subject: [PATCH v2 10/11] arm64: dts: rockchip: Enable HDMI audio on Sige5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-rk3576-sai-v2-10-c64608346be3@collabora.com>
References: <20250410-rk3576-sai-v2-0-c64608346be3@collabora.com>
In-Reply-To: <20250410-rk3576-sai-v2-0-c64608346be3@collabora.com>
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
index 0979d1e0cee7a18a6bcbd08ed19cc835f2186960..de63b053a06c05e02bfcfa03b96e9fc61de8782d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
@@ -269,6 +269,10 @@ hdmi_out_con: endpoint {
 	};
 };
 
+&hdmi_sound {
+	status = "okay";
+};
+
 &hdptxphy {
 	status = "okay";
 };
@@ -713,6 +717,10 @@ &sai1m0_sdi0
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

