Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F172222FF2B;
	Mon,  7 Apr 2025 18:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744049418; cv=pass; b=Gt6QNzJusu1OVhTC+zlZxBbXn0J9YJLm1VsFJ1WDLwEqwUT7NDNx9OgRWWIDd7turD4qNEZTCzwv1WHEY8r1tCpjTsblccnIGi50MDjnhUR0rhFWVDD4HdMJT9wJP5h30byII+LKhlGel5zDOIUKIo+yRvGUO6iiyKiMCHNCsPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744049418; c=relaxed/simple;
	bh=sYVeN+Taygcv4RyY6iF1alZW/OsVucenl8ctzrnt5+U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KdD5bjuTw1eVEu+G0E431mbepnOkOmpkGIBZOIKVq06sU9Dx5G83WOeX0KM/XRzk/56K4NUkajwdYBC39wc0KhE+sa7rBmR/f4YHdHOuVJGjaqASp4reQWV30X+CqQBqt2qhxW/qPolvn/VXIBl+01RKvloCzIAH+it5IciYZ+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=RwpDAbGc; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="RwpDAbGc"
ARC-Seal: i=1; a=rsa-sha256; t=1744049394; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=K6IiAeHqBHlNrWiqQn+3MNldAf/eENA+BvXOKM7nbKf1rlWU+6fUObV15o6Rm6AzFG6GgOEtfu0XIpDc8C0GFToquzvl87oy2p6ABernLurSxNOjQglpzYwNJNglrILRb0r22iJejThpPi1wf3L6VWQrwvwgIWNorUtwpX/WALQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744049394; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=znUavP/BrlHSUj49dkNncKOBHc7iyfaD5tE24M8Y1yg=; 
	b=NXh8bDoXXWwwOExleJ5437igv5RzEKqCGSEovzd4+KtJN2D/EGSY3B8ycbC31KnJP8R8YkF0sSnDU1LdYgNcNJ6Fvs2aqT8u/ZjryWDtOcmiIhNiT7JSoFvJ0mNtUGEg6DeI8DLfYJrFI/8fzjWmZ1zdRTAFQFdx+QFOEdz0D6k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744049394;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=znUavP/BrlHSUj49dkNncKOBHc7iyfaD5tE24M8Y1yg=;
	b=RwpDAbGcZNxlG/P6vQDHPFyHVr7ljwNalyK6/Nd34ZnUbpXUgs6R2H3OfuaWiSLp
	gnHapHdlFh770AYbaJvZTiPxdoNrvOi1rMaW5zbLWhcGZ0JkREGGZ3swN8pMQ6jUzm0
	nJf56irj5oDDC5GLmNZ6ihhSktGDII90JP717cGU=
Received: by mx.zohomail.com with SMTPS id 1744049392553406.29570236196037;
	Mon, 7 Apr 2025 11:09:52 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 07 Apr 2025 20:09:16 +0200
Subject: [PATCH 3/4] arm64: dts: rockchip: add phy suspend quirk to usb on
 rk3576
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-rk3576-sige5-usb-v1-3-67eec166f82f@collabora.com>
References: <20250407-rk3576-sige5-usb-v1-0-67eec166f82f@collabora.com>
In-Reply-To: <20250407-rk3576-sige5-usb-v1-0-67eec166f82f@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Frank Wang <frank.wang@rock-chips.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 kernel@collabora.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2

The dwc3 controllers on RK3576 appear to have some quirky behaviour
relating to runtime power suspension. Specifically, they will cause
SError aborts on register reads in the xhci code when setting the device
role.

Downstream appears to work around this by manually checking for the
rk3576 compatible in the dwc3 core driver, and then setting the
autosuspend delay to 200. This appears to be smaller than what mainline
uses, and I'm not quite sure how that fixes it, but I could also be
reading the code wrong. The important takeaway is that the RK3399 uses
the same codepath.

Looking at RK3399 in mainline then, we see that it has one quirk that
RK3576 doesn't have in its dwc3 controllers: snps,dis_u2_susphy_quirk.

Long story short, adding the snps,dis_u2_susphy_quirk property to
rk3576.dtsi's dwc3 controllers fixes the issue. Quite suspicious that
this is not needed among usb controllers based on dwc3 in other Rockchip
designs, especially other RK35xx ones.

Fixes: 23ec57a32da4 ("arm64: dts: rockchip: add usb related nodes for rk3576")
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index ebb5fc8bb8b1363127b9d3782801c4a79b678a92..71c71f5a2b77c52b251bea16e4deaa4b0109715a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -470,6 +470,7 @@ usb_drd0_dwc3: usb@23000000 {
 			snps,dis-u2-freeclk-exists-quirk;
 			snps,dis-del-phy-power-chg-quirk;
 			snps,dis-tx-ipgap-linecheck-quirk;
+			snps,dis_u2_susphy_quirk;
 			snps,parkmode-disable-hs-quirk;
 			snps,parkmode-disable-ss-quirk;
 			status = "disabled";
@@ -496,6 +497,7 @@ usb_drd1_dwc3: usb@23400000 {
 			snps,dis-del-phy-power-chg-quirk;
 			snps,dis-tx-ipgap-linecheck-quirk;
 			snps,dis_rxdet_inp3_quirk;
+			snps,dis_u2_susphy_quirk;
 			snps,parkmode-disable-hs-quirk;
 			snps,parkmode-disable-ss-quirk;
 			dma-coherent;

-- 
2.49.0

