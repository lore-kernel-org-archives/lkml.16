Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6166E1D5AB5
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 16:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750525125; cv=none; b=JQ28vXuUUNIJPuzpaCklaBpQSsFAMI6VcMISFQ0eJWQGubfH2WUlO+S+Zb4+OpDbOpajlMR4aHb464v1MxzmdD4f0a4Azlwtwrx3ayJdZb5gyjb83fYCRJ/JdUAHCT1dLKq8OCIbn+rZKIaLS/3DhjNlaGPG0UQxlSAVsoeZlbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750525125; c=relaxed/simple;
	bh=MYt2MM/R1BIsqZYsFpNLDqolMhT71IOw7GSie+ikohU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hREQxi++iyy5H65e3eFGWmzRr2Di2ZiuupGOMlLgWAu31D0e1ba6RW/KwG5Cu5eTai/GkZCjPNV3OX/obmZE/Fm+f0xs2fwOv0d6ejWXOA1qs+O/3/eFNkMGdQzPnOtBk6OVVSmcf72zobTlbnHASHv1Ur052GBKTege7R7zsL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=FFK8NHgQ; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="FFK8NHgQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-e1b5cab7be; t=1750525121;
 bh=4cuZR2OeJH9U0xo9iqQwKBOuSBnLCscDjqcJkUSqVlk=;
 b=FFK8NHgQ31ekNfm4u/gEMUnu+arZHGBeICnZcwormlTzeGgUHp7RTxHAvi65fQ/oyahysMyU7
 Bev4WfdhxEihd3Y8MGixvmFNbxfCufUssYi/d9dKX+jVNCFwez0BKGJW6Grs5jFZFu/W7+9yH+r
 TisXaNByNgCgHrj61053DTz1Euh/0GQwrZo297nb94//7V5efIjbZ5DMH3wCzGW4O2LJdGnhXQU
 1ztZa+K/4e3BT9mti8+a+rE+sghTc5JvMDdKkK4W5ONj/FKJ+DdHc7ZxufjQP2yqIDdE82NrgR0
 dEPMKsTBkMhTleSOnLi717gqMEiNa39EVp2WVZpwEGlA==
X-Forward-Email-ID: 6856e4be9932e6905b7c425e
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
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
Subject: [PATCH] arm64: dts: rockchip: Fix eMMC HS200 mode on Radxa E20C
Date: Sat, 21 Jun 2025 16:58:30 +0000
Message-ID: <20250621165832.2226160-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

eMMC HS200 mode (1.8V I/O) is supported by the MMC host controller on
RK3528 and works with the optional on-board eMMC module on Radxa E20C.

Be explicit about HS200 support in the device tree for Radxa E20C.

Fixes: 3a01b5f14a8a ("arm64: dts: rockchip: Enable onboard eMMC on Radxa E20C")
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
This also help assist boot firmware that consume Linux device tree's to
use HS200 mode when booting from eMMC, see [1] for a related U-Boot fix.

[1] https://source.denx.de/u-boot/u-boot/-/commit/f8cb3fde935ed003ad1d7cf6a06d59586fe65cd5
---
 arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
index e4333674a0ec..12eec2c1db22 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
@@ -283,6 +283,7 @@ &saradc {
 &sdhci {
 	bus-width = <8>;
 	cap-mmc-highspeed;
+	mmc-hs200-1_8v;
 	no-sd;
 	no-sdio;
 	non-removable;
-- 
2.49.0

