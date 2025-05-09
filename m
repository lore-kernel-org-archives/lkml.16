Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF34D2620CB
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 20:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746822256; cv=none; b=mGpMUdrvez/CQqpZRs6S/VYm/59GYH307F6oXqtTdzd4vH2MeWDYqpEp16ueJ36gxCE3ks2mgVqCn0OynYnLm9/aYgU+rhYVsg4Qqmf2jkbCHkZFFM39cR3234ct18GfIBXerCCzMND2p4/QOIqvrTFeJLf4Q5x1MSBjLo9cR+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746822256; c=relaxed/simple;
	bh=1rOf5eV/GqxjoNeqfnZ5nSOruhLljUTw0xr6U1V8wUo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UifdrYfXbNGKqp1RzjH28uqFxBrMLgNoqKyarXnaBcDwHJzY4IDprxOKX1izGtZZxaXtd/0/PAMl8s6P6XX2NcraIKBdwceBDM9uD/msfdWCLZEAKR5Q/ucHC/OeJYGvutIDlwNF0KP3IofCQBq1u9ZlJQFkd1QQu1eCD5iTIc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=e7S7OzB9; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="e7S7OzB9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-e1b5cab7be; t=1746822252;
 bh=ox/S3wEHdX6LK40h/zbAQGRFc9coOf0nkAtFa2lcQHo=;
 b=e7S7OzB95EMPDTZ1kAY09B2RJ4XZcLWGi/v2XybiPyFYHVHoGL07dKz85f0q0liG4S91x7AIy
 N1iyvykXKoP90+KRyuOLYJkFtRhBGobERdXILcaU9C70tfZxyiiyO3vRs+JnCFQnJADY7MGJ6Wb
 8hsBzG3GInz/VL9MR4Ip6+syvjjKg4fT7fwOEra7Av9OGRdNf1Nb+EAV0ITCdsSUN+lD2RlhNpd
 /yHQgOLs3KLrEBtwOuk4cBj/j1Bntdwwihn9YLus+pF5AoZgNdaLaPXnjIkOqskgAfNhuFizuaL
 6OvurS5Ed/7pyZIMYyZSt/oni+SAiXHMxmwgHgfoC44A==
X-Forward-Email-ID: 681e6468b323f1ffafd05d60
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.0.2
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
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v3 0/2] rockchip: Enable Ethernet controller on Radxa E20C
Date: Fri,  9 May 2025 20:23:56 +0000
Message-ID: <20250509202402.260038-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Rockchip RK3528 has two Ethernet controllers, one 100/10 MAC to be
used with the integrated PHY and a second 1000/100/10 MAC to be used
with an external Ethernet PHY.

This series add device tree nodes for the Ethernet controllers found in
RK3528 and enable the LAN interface on Radxa E20C.

This include a gmac0 node for the 100/10 MAC and its related integrated
PHY node that only have recived limited testing. I have no board that
expose an Ethernet port for the gmac0 and the integrated PHY. However,
the PHY can be identified on addr 0x2 as 0044.1400 and in vendor kernel
this relate to the Rockchip RK630 PHY. A proper PHY driver will be
needed to support any real use of gmac0.

Changes in v3:
- Rebase on top of latest mmind/for-next

Changes in v2:
- Split from the "Add GMAC support for RK3528" driver series [1]
- Add ethernet-phy@2 for the integrated PHY
- Rebase on top of the "Support I2C controllers in RK3528" series [2]

[1] https://lore.kernel.org/r/20250309232622.1498084-1-jonas@kwiboo.se
[2] https://lore.kernel.org/r/20250309070603.35254-1-ziyao@disroot.org

Jonas Karlman (2):
  arm64: dts: rockchip: Add GMAC nodes for RK3528
  arm64: dts: rockchip: Enable Ethernet controller on Radxa E20C

 .../boot/dts/rockchip/rk3528-radxa-e20c.dts   |  30 +++++
 arch/arm64/boot/dts/rockchip/rk3528.dtsi      | 105 ++++++++++++++++++
 2 files changed, 135 insertions(+)

-- 
2.49.0

