Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6AA22F3AB
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 16:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748276132; cv=none; b=nBm+POIq+KTPZtVRJg8jOZ48CwNEXLAcDMBn3rNqeFfPiyw1Wmsxgw8kbKzgz4A7WU363tLAEL98+v82f+cRqeygyJzmqMfqBDA5Q6/kKBu98kIG0ksNyMeDkY8CZMNVVMRyLRcBighVylEhkIq5Z0kkAovkYulsjhJf1IiJz5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748276132; c=relaxed/simple;
	bh=MFBeKmhAhNCeSEYunv9WJ5f1eCCOILDRuQ1f9ACG3qk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R+lbFmMYm7wBvM5T7THSMw3h2VbfnS4Ls8nAsAixprjR/cmUFGkFUpAV8kU5llCGYXruHdZw0aeHUDpE/RvK21bicT1HVR3pBhmaGKQQQ618BQX1FbpKZsUg/ItF/o8uY/LZHYVbZjXLpwHE5Ejx6S1kuVXEGdZxVnKZbGTJr8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=EaOgnIe2; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="EaOgnIe2"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1748276116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JafaCAGJGUzONesEsTwK7Fp4cbryqbnxv96ud7slC/o=;
	b=EaOgnIe2JbKBWXb5SWzSwqUTKqR+L7PNAjxIqpGlvjgLDlj1hbA82saH6+gN5BHl8vxVHk
	rUFh/sJ9pdxYXskigNRqSi1k4727NOLgFWp6QkuVLkn8AKOIq6MRUf+t8I3ZheJKrLeOQh
	852T8FRJzmP4VsY2PMGScf1V1HSO8obJzvFlflc3QzZUekB2jKjSrzWD58LEObJ1HEimlS
	OouE/t5t7CZwR/mESHouvXUoF3zRMXaT5QrwbZqpomC4xbTqB7QT6+lt6yoNwncQWUeE3V
	GuaUGnpp/b8C78+IrXOA2C/4bPfub3KWCC8IQZLNqLibLt90ew0y7C08B2J4Mw==
From: Diederik de Haas <didi.debian@cknow.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Dragan Simic <dsimic@manjaro.org>,
	Maximilian Weigand <mweigand@mweigand.net>,
	Marek Kraus <gamiee@pine64.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <didi.debian@cknow.org>,
	hrdl <git@hrdl.eu>,
	phantomas <phantomas@phantomas.xyz>
Subject: [PATCH] arm64: dts: rockchip: Fix cover detection on PineNote
Date: Mon, 26 May 2025 18:14:47 +0200
Message-ID: <20250526161506.139028-1-didi.debian@cknow.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The SW_MACHINE_COVER switch event was added to input event codes to
detect the removal of the back cover of the N900.
But on the PineNote its purpose is to detect when the front cover gets
closed, just like when a laptop lid is closed. Therefore SW_LID is the
appropriate linux code and not SW_MACHINE_COVER.

Reported-by: hrdl <git@hrdl.eu>
Helped-by: phantomas <phantomas@phantomas.xyz>
Link: https://lore.kernel.org/r/270f27c9-afd6-171d-7dce-fe1d71dd8f9a@wizzup.org/
Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
---
 arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi b/arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi
index 3613661417b2..5c6f8cc401c9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi
@@ -55,7 +55,7 @@ switch-cover {
 			label = "cover";
 			gpios = <&gpio0 RK_PC7 GPIO_ACTIVE_LOW>;
 			linux,input-type = <EV_SW>;
-			linux,code = <SW_MACHINE_COVER>;
+			linux,code = <SW_LID>;
 			linux,can-disable;
 			wakeup-event-action = <EV_ACT_DEASSERTED>;
 			wakeup-source;
-- 
2.49.0

