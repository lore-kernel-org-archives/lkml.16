Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B82720F081
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 22:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747608898; cv=none; b=LR0jPwArUib7Q6qQbCfK9dtxejo7aWsfHjjolho3uVZ8Ye221R5EEOTClyqkb2GJoiHbPn1WNV5h1htaHRU21DB2woRbz20BL4v5fjIIQw3R8AHZwW3a/CcqGOmscskGG/d/OEHNy8zYJkSWiH7hW4NgIDOw9wFVarHAet91AAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747608898; c=relaxed/simple;
	bh=5xNEayYhyeRricRaOR9dYUoG+JuOgb7LBOyiMiflnPs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y4kxyQLSwmqzVYJxTavj5MPTpyDyfiNK8jZtMw2rpwt5IILKHZIPUoJbZIckr9406IoOTj7A8HCTgyU2fTme8tTux+eHtqCOPS5n1EtfQfN+Csobil3/ceBcqnYHTLJ2zuk9ZhOMs7AOHrcH6mornTIdEOHGxLhnPsMeyFnRs5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=p5IwGKwb; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="p5IwGKwb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1747608894; bh=L371iAHTquiamr1qOBIkRG8ZfA4URTmo9Yt5n9upXbQ=;
 b=p5IwGKwbGCHiv8GaoV/2RWVTNCbPrDdpUb4iIZg2BOlIWVL5I/nJnu4gzdTe2VWGRi/+wJ1qA
 FkJTM+9G4LhCpEbo/CL11Wxujb+ZZF02j4z3wa74ha0bsQC8KXon+u8ckC7+mRKf9D/EPB4MVpW
 L3ssAfsh4tziOBX+VG5udiupm6Z5NWXOXe0ieBDx9+DukhdhZ59/AO83q3C1q4i8PnGvIyAlsdQ
 4JFl35XevbwsGDNi9mNUed+hZucvcA6UyohxR2rho9z+xS1NY9aag4t3ER1KnmjFXhOt+26eanM
 TezCBynrsQgsOeKzyAszGHdZEx5pPk6rklH0tMyQy8rw==
X-Forward-Email-ID: 682a6536db63046e3392f2dd
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.0.3
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: rockchip: Enable GPU on Radxa E20C
Date: Sun, 18 May 2025 22:54:13 +0000
Message-ID: <20250518225418.682182-4-jonas@kwiboo.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250518225418.682182-1-jonas@kwiboo.se>
References: <20250518225418.682182-1-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the Mali-450 MP2 GPU on the Radxa E20C.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
index 9f6ccd9dd1f7..e4333674a0ec 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
@@ -198,6 +198,11 @@ &gmac1 {
 	status = "okay";
 };
 
+&gpu {
+	mali-supply = <&vdd_logic>;
+	status = "okay";
+};
+
 &i2c1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c1m0_xfer>;
-- 
2.49.0

