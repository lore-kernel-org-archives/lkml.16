Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F8317BD9
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 12:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750507243; cv=none; b=AMdQvUIMBu6qrPdiWJ80XW8kKJa6RAtcDeMtyMwc3ndmkf6OhMz3hhv/YpQgge0tYUNrNYZ/3PozCHZpIrxWEsdHiylrp5ZYGUZLTt0F7SwhooOxV58HYm5QBSXnmnDvAPAnI7CkRqd0wK1giKSDS9SxQAVMQsV9T/BtcHJOoEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750507243; c=relaxed/simple;
	bh=06b6ZB5lwM/+7QVClkjf63LNjiJ13J1H1t09RZJr+54=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QvLY7Jw5K5iyz9lWGLY7FASBoPpRmNQMqpQ3PZIoFEAvD+Ov5dtgcO36LjmVo3MfCCEhmqgSRLsJWL1nfgh7sWrwxGbv2cTOeQIOQ/59XGZpp61BeYhU47VcJsSWwmwwVw79DTgBnabG6Mn0hggkYbUqcf0oW14U7vwNSTREukU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=a4hVjmb4; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="a4hVjmb4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-e1b5cab7be; t=1750507240;
 bh=ir11YpcbwxWD+w+nzz2s0FsuVrnNjiwPhxkmWuSazqw=;
 b=a4hVjmb4qgrHZyT/Z/dbYlgWi3rqWBQmLoP58Ke/OEUJ/AAFO17k+l2duSjEy9ipM5VuMQ4HR
 KbTXRhboC+bNaQ8Kovnv18qd3/0ThTcLbpYI7x3VIhkby0zJus0gYEAwlgNERdzhXINfoTWjqJi
 gOhMlYWs6KFWjgVaiVt09iKfR1GCtYCwVP0OPCfOJHWmoJFqKOCOqYBc2uAztvwtCAMWs6/8N5z
 YTcDzJXIBzv/cv1hA9/crF5nVEfk6Fesk5k/pVvWVP8GY87sYyIs4ViYL6wkH2M20fzMH9fWuqB
 +earWtnqaJpRwRS61jNJRlX0SiGuI7meBTZhWjeU3Fag==
X-Forward-Email-ID: 685699d9f0bccf4584158851
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
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: Fix pinctrl node names for RK3528
Date: Sat, 21 Jun 2025 11:38:57 +0000
Message-ID: <20250621113859.2146400-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Following warnings can be observed with CHECK_DTBS=y for the RK3528:

  rk3528-pinctrl.dtsi:101.36-105.5: Warning (node_name_chars_strict):
    /pinctrl/fephy/fephym0-led_dpx: Character '_' not recommended in node name
  rk3528-pinctrl.dtsi:108.38-112.5: Warning (node_name_chars_strict):
    /pinctrl/fephy/fephym0-led_link: Character '_' not recommended in node name
  rk3528-pinctrl.dtsi:115.36-119.5: Warning (node_name_chars_strict):
    /pinctrl/fephy/fephym0-led_spd: Character '_' not recommended in node name
  rk3528-pinctrl.dtsi:122.36-126.5: Warning (node_name_chars_strict):
   /pinctrl/fephy/fephym1-led_dpx: Character '_' not recommended in node name
  rk3528-pinctrl.dtsi:129.38-133.5: Warning (node_name_chars_strict):
    /pinctrl/fephy/fephym1-led_link: Character '_' not recommended in node name
  rk3528-pinctrl.dtsi:136.36-140.5: Warning (node_name_chars_strict):
    /pinctrl/fephy/fephym1-led_spd: Character '_' not recommended in node name
  rk3528-pinctrl.dtsi:782.32-790.5: Warning (node_name_chars_strict):
    /pinctrl/rgmii/rgmii-rx_bus2: Character '_' not recommended in node name
  rk3528-pinctrl.dtsi:793.32-801.5: Warning (node_name_chars_strict):
    /pinctrl/rgmii/rgmii-tx_bus2: Character '_' not recommended in node name
  rk3528-pinctrl.dtsi:804.36-810.5: Warning (node_name_chars_strict):
    /pinctrl/rgmii/rgmii-rgmii_clk: Character '_' not recommended in node name
  rk3528-pinctrl.dtsi:813.36-823.5: Warning (node_name_chars_strict):
    /pinctrl/rgmii/rgmii-rgmii_bus: Character '_' not recommended in node name

Rename the affected nodes to fix these warnings.

Fixes: a31fad19ae39 ("arm64: dts: rockchip: Add pinctrl and gpio nodes for RK3528")
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 .../boot/dts/rockchip/rk3528-pinctrl.dtsi     | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528-pinctrl.dtsi b/arch/arm64/boot/dts/rockchip/rk3528-pinctrl.dtsi
index ea051362fb26..59b75c91bbb7 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3528-pinctrl.dtsi
@@ -98,42 +98,42 @@ eth_pins: eth-pins {
 
 	fephy {
 		/omit-if-no-ref/
-		fephym0_led_dpx: fephym0-led_dpx {
+		fephym0_led_dpx: fephym0-led-dpx {
 			rockchip,pins =
 				/* fephy_led_dpx_m0 */
 				<4 RK_PB5 2 &pcfg_pull_none>;
 		};
 
 		/omit-if-no-ref/
-		fephym0_led_link: fephym0-led_link {
+		fephym0_led_link: fephym0-led-link {
 			rockchip,pins =
 				/* fephy_led_link_m0 */
 				<4 RK_PC0 2 &pcfg_pull_none>;
 		};
 
 		/omit-if-no-ref/
-		fephym0_led_spd: fephym0-led_spd {
+		fephym0_led_spd: fephym0-led-spd {
 			rockchip,pins =
 				/* fephy_led_spd_m0 */
 				<4 RK_PB7 2 &pcfg_pull_none>;
 		};
 
 		/omit-if-no-ref/
-		fephym1_led_dpx: fephym1-led_dpx {
+		fephym1_led_dpx: fephym1-led-dpx {
 			rockchip,pins =
 				/* fephy_led_dpx_m1 */
 				<2 RK_PA4 5 &pcfg_pull_none>;
 		};
 
 		/omit-if-no-ref/
-		fephym1_led_link: fephym1-led_link {
+		fephym1_led_link: fephym1-led-link {
 			rockchip,pins =
 				/* fephy_led_link_m1 */
 				<2 RK_PA6 5 &pcfg_pull_none>;
 		};
 
 		/omit-if-no-ref/
-		fephym1_led_spd: fephym1-led_spd {
+		fephym1_led_spd: fephym1-led-spd {
 			rockchip,pins =
 				/* fephy_led_spd_m1 */
 				<2 RK_PA5 5 &pcfg_pull_none>;
@@ -779,7 +779,7 @@ rgmii_miim: rgmii-miim {
 		};
 
 		/omit-if-no-ref/
-		rgmii_rx_bus2: rgmii-rx_bus2 {
+		rgmii_rx_bus2: rgmii-rx-bus2 {
 			rockchip,pins =
 				/* rgmii_rxd0 */
 				<3 RK_PA3 2 &pcfg_pull_none>,
@@ -790,7 +790,7 @@ rgmii_rx_bus2: rgmii-rx_bus2 {
 		};
 
 		/omit-if-no-ref/
-		rgmii_tx_bus2: rgmii-tx_bus2 {
+		rgmii_tx_bus2: rgmii-tx-bus2 {
 			rockchip,pins =
 				/* rgmii_txd0 */
 				<3 RK_PA1 2 &pcfg_pull_none_drv_level_2>,
@@ -801,7 +801,7 @@ rgmii_tx_bus2: rgmii-tx_bus2 {
 		};
 
 		/omit-if-no-ref/
-		rgmii_rgmii_clk: rgmii-rgmii_clk {
+		rgmii_rgmii_clk: rgmii-rgmii-clk {
 			rockchip,pins =
 				/* rgmii_rxclk */
 				<3 RK_PA5 2 &pcfg_pull_none>,
@@ -810,7 +810,7 @@ rgmii_rgmii_clk: rgmii-rgmii_clk {
 		};
 
 		/omit-if-no-ref/
-		rgmii_rgmii_bus: rgmii-rgmii_bus {
+		rgmii_rgmii_bus: rgmii-rgmii-bus {
 			rockchip,pins =
 				/* rgmii_rxd2 */
 				<3 RK_PA7 2 &pcfg_pull_none>,
-- 
2.49.0

