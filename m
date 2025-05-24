Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DA9A19CC2E;
	Sat, 24 May 2025 06:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748068985; cv=none; b=F/qVh+KNnjPus6frTNFd+lmsNIBaUilhR78mbP5aRB6EbycsrObjcvOSQ3AN5gx/Bk+J5p2eTAxbHY4fsP+XL5NBvPiu6CNyDkLmldQq4XyoMU1uchGushqeVl07Pps5gG9iU5Qm2Dbi7aLjsj2wqxAIUYyqJIQpbVfMIOJWdnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748068985; c=relaxed/simple;
	bh=uJCcD9HVKdqpqwdsVg4SoUNHizVryPdT4BwMKZ7bEe8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QCPyew0t7RWOGw4IyIQo8RttRjVQdUZdzs+9H81JTkOQOJPIBIvd5hw5FJ5OsBVq7yGFKrwlzOyI4bBxV07kBHd4/vazoZ0yyUdsmrvcyQVt1HBLVWmUOfLcvIXOZv/6Ml+sZPmek9AmvMxnSOuvTkuVTBXlPW1kgv3MJ7VnulQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=cMe/ffu5; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="cMe/ffu5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=ar
	CTxWkxoome3w7a3ccnEM8xcNeg4k8tZ3kNoscptrA=; b=cMe/ffu5PN+rSuxnd1
	+mF5AG+OJtHeItwHb1FSiW2GHfPM99zCChxW5HDZf0YnJAr0/I4Gxm4ONuRSDNja
	aZI2p957VVkEcXWzKCo1DfATx6jiTOYdQxBZNjyWkIb2pA99TLkISoJKr3fnI0M6
	ZAyiJbvWPgGamPmDpQ8GblA60=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wDnP5FQajFozJwcDg--.25687S2;
	Sat, 24 May 2025 14:42:28 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: krzk+dt@kernel.org,
	robh@kernel.org,
	sebastian.reichel@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	conor+dt@kernel.org,
	jbx6244@gmail.com,
	Andy Yan <andyshrk@163.com>
Subject: [PATCH 1/2] arm64: dts: rockchip: Add cd-gpios for sdcard detect on Cool Pi CM5
Date: Sat, 24 May 2025 14:42:12 +0800
Message-ID: <20250524064223.5741-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnP5FQajFozJwcDg--.25687S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruFWftw1UtFWkurykXryrZwb_yoWfCrb_t3
	W2ga1UJF4rJr9xG348ta4kGw43G34qkrn7Ww45ZF4kAF9xta9rJayrKaySqF1qkFy2kr4f
	JrWrXF18Gw1akjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRJrcfUUUUUU==
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkApXXmgxZwZf6gAAse

cd-gpios is used for sdcard detects for sdmmc.

Fixes: 791c154c3982 ("arm64: dts: rockchip: Add support for rk3588 based board Cool Pi CM5 EVB")
Signed-off-by: Andy Yan <andyshrk@163.com>
---

 arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5.dtsi
index cc37f082adea..b07543315f87 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5.dtsi
@@ -321,6 +321,7 @@ &sdmmc {
 	bus-width = <4>;
 	cap-mmc-highspeed;
 	cap-sd-highspeed;
+	cd-gpios = <&gpio0 RK_PA4 GPIO_ACTIVE_LOW>;
 	disable-wp;
 	max-frequency = <150000000>;
 	no-sdio;
-- 
2.43.0

base-commit: 1800b5d1cbd1027cce0136267c2b703f81b0af42
branch: linux-rockchip-next

