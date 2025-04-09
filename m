Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5A21E520E;
	Wed,  9 Apr 2025 20:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231845; cv=none; b=lCYpmejYqJ5/lrYZ+cvMIvET/MTlY5ivCMZQJkLW7oPhUNaGxqihmSzpO8J69YV0cx4WKGN5Q2YQmfHdx/YJgEWhpr4WGwewqQ6x5UycCeynrGnLWcjJoy8x9WhfqznvIbHL4g8NuGb/cIKFukT4VgkOKkMu0sTVAxNVJHxNUss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231845; c=relaxed/simple;
	bh=Wqa2f3x1lOF/ugiGuTwsKbMT387qF5klTG4m2uLqmRE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VIs0tU7YTyjG8uL7Zca5HRTHvIEVbQa8wpfPT13/Rp4sLD8mve0mADzRGCuWvY+pvOMnu5cYvHm/roGEIZFuuJNoyrwzgmuLBPghV3epg+YeEB3JzdJGk0ZTHnLyzptoOcZuYjIc9XlSYcSAN2RRZqIskBBmYAhOPm0GvjFLjvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JlxrWCjW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JlxrWCjW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E8BDC4CEE2;
	Wed,  9 Apr 2025 20:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744231844;
	bh=Wqa2f3x1lOF/ugiGuTwsKbMT387qF5klTG4m2uLqmRE=;
	h=From:To:Cc:Subject:Date:From;
	b=JlxrWCjWuSXOIr6nM9F2Oxh1+hASbgsgKhL3N03TDhBIWDb0P5ZqwMgloDE2m7Mox
	 QDwJvcA8L7pT6pcjdYq1MOJiE6h+w6/yBtG2T9u/i4K8ioUN9/7ISooymsnOhV6HbM
	 jr11ivgHswWJ0bZSufsFUPJdp8VvLthDNqswmlx/rz/BY+z2H7pwG8tkxQnuaG0gAB
	 Yn4et6TZonBYz2wAs8EbncMhIUa5+nsaY+jd9vHl7RCyMqwfEvqYHkOu6p8wosqYn7
	 Y2ivXhzMP0OdJ+5VHd/Zyv5jxhN9dR+uf2Z1f8LgSUJYeBb8XFloX7IW8wORPBN3vj
	 kk7CimkM9D2eQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: rock-pi-4: Fix mmc-pwrseq clock name
Date: Wed,  9 Apr 2025 15:50:39 -0500
Message-ID: <20250409205040.1522754-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The defined name for "mmc-pwrseq-simple" clock is "ext_clock".

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi
index 541dca12bf1a..046dbe329017 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi
@@ -43,7 +43,7 @@ led-0 {
 	sdio_pwrseq: sdio-pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		clocks = <&rk808 1>;
-		clock-names = "lpo";
+		clock-names = "ext_clock";
 		pinctrl-names = "default";
 		pinctrl-0 = <&wifi_enable_h>;
 		reset-gpios = <&gpio0 RK_PB2 GPIO_ACTIVE_LOW>;
-- 
2.47.2

