Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D7D319CC2E;
	Sat, 24 May 2025 06:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748068991; cv=none; b=smecsTo01PeA1e1eUY+FKZ6y1zcuSlI9gWfsMUxtHt7kVkfGfx/ZQL6tKewFC0UoWnx2znnLi0Xx8VFkFP5lxBhkAnMZnKWFTnE9tPZ6LjqysMr8dxPntmoF81aKhwDVKGSAVo45oOGM7zjwsilOd3sq7yduL3Bx+gxN2FByB3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748068991; c=relaxed/simple;
	bh=FEGWpr7J0cnPGHE+iH6UOaEAt0ljArD32+S2Jk28/ho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SWpkHnrSkecnSV3BRWmNL3F3VPxOaxpQQjoUYOteF4EW7hdvQPmctJb2MEbED+2yX10JwhXZS+fOfX3T+vkaViWLBlL+gvzvG5vQBWzYx7oFtW1cQCggC/eBMAWv2uV4G2sAnHcxFUoffdcfWVheZKl8OO8QJ3pQmRiSDwpcDWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=GlizN76d; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="GlizN76d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=K9
	4uErRWjEUyXOyg5fbrWZP1TgB7IwZ5oGejAumKAz0=; b=GlizN76d3+A2be+zwH
	EopVGB249nrOSvwm6AVc1JAw2d9w8CC1lnEEBScPjcgf1wbWxuvBbpexkaamlW8S
	YsPq6YHHoG5SFbdSedHIGWauVC1T34NZ1aqEJDHiLXOCl8L8TxDFPMTzxIMchuJW
	1JsHz/o7YIkTgQsAWsf/69dkY=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wDnP5FQajFozJwcDg--.25687S3;
	Sat, 24 May 2025 14:42:29 +0800 (CST)
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
Subject: [PATCH 2/2] arm64: dts: rockchip: Add cd-gpios for sdcard detect on Cool Pi 4B
Date: Sat, 24 May 2025 14:42:13 +0800
Message-ID: <20250524064223.5741-2-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250524064223.5741-1-andyshrk@163.com>
References: <20250524064223.5741-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnP5FQajFozJwcDg--.25687S3
X-Coremail-Antispam: 1Uf129KBjvdXoWruFWftw1ruFWUtryDWr1Utrb_yoWfArg_KF
	y7WF15JF4fJr9xX3s5ta4UGa17G34vkr4xX3yYyas5JFnIqanxJayrKay2ga4DCFWakr4x
	JrW5XF4UJw1akjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRKzVb7UUUUU==
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqB5XXmgxaZMW0AAAsa

cd-gpios is used for sdcard detects for sdmmc.

Fixes: 3f5d336d64d6 ("arm64: dts: rockchip: Add support for rk3588s based board Cool Pi 4B")
Signed-off-by: Andy Yan <andyshrk@163.com>
---

 arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts b/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts
index 8b717c4017a4..b2947b36fada 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts
@@ -474,6 +474,7 @@ &sdmmc {
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

