Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B037D22DF9E;
	Tue, 22 Apr 2025 07:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745305558; cv=none; b=ldGyg8BBTkXoqNqQ3owxnqpMGQzgtcLD21/dGmVJyD/a3A2pThSLlIet3mZ8zeZ0wXAlMcUbLfaxMiuD5TAvphlboyiT2ylvNE63p5xV/PNv/4zM0Oiu7o6+2wjePg0ktxpW2JiyzfB/siouDKQii13fVP7Cv/UfrxVP9iDfqb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745305558; c=relaxed/simple;
	bh=UTATp5Vy18bL4XWdu6qCARwaTStSHDvxTPvSI0YaSRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=awddSnDZ5lL+PNtEEDaTr5G6oPfmUPUTwCcaEMK+peKfE8GBwxwQbzzkD8ZAsul/sDQuKFeJKpDDzyOYlU6HsD6ul03u93H7L+xjuG32hdG1jqVmlzxT8iSClgmHWOMY3efQC93G1OcF2QY7oGwlIuv/XUEymRV9LRNxMBi9ZOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=TmYHdidm; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="TmYHdidm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=g3jx9
	mZP84zW4GKnneObG67nUX/ojN2RZWPwZ8uHvVk=; b=TmYHdidmFBzor6Kw4GG0y
	goCqFqufUVMQ5yZt7wJ7cqvzoEHa2A5ZT3fE/p9XfLs9BC7QwRQWBARyLr7QvojH
	Llguvjzmk5+RGTTt84Gd+nDFK8YqRofbuUkvvWX11tpnyPmpHG9bc+k1flv8XdJK
	9p1ehsgcwnUGzM2jd/bXfo=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wCHACaZPwdowMxzBg--.7474S8;
	Tue, 22 Apr 2025 15:05:07 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	hjc@rock-chips.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	dmitry.baryshkov@oss.qualcomm.com,
	knaerzche@gmail.com,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v4 6/7] Revert "ARM: dts: rockchip: drop grf reference from rk3036 hdmi"
Date: Tue, 22 Apr 2025 15:04:45 +0800
Message-ID: <20250422070455.432666-7-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422070455.432666-1-andyshrk@163.com>
References: <20250422070455.432666-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCHACaZPwdowMxzBg--.7474S8
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gry5Kr43uFW8Ary3Kw15Arb_yoWkWFX_tF
	yIg3W5Ka1FkrWYqry8tw4UGwsFywn5GFWrJw1rJr4UGwnYqF4DuFs5GayxAr15Gay2grZ3
	WFZ5Xa1Yyw13WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0Tlk7UUUUU==
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0gU3XmgHOe-cKwADsz

From: Andy Yan <andy.yan@rock-chips.com>

This reverts commit 1580ccb6ed9dc76b8ff3e2d8912e8215c8b0fa6d.

The HSYNC/VSYNC polarity of rk3036 HDMI are controlled by GRF.
Without the polarity configuration in GRF, it can be observed from
the HDMI protocol analyzer that the H/V front/back timing output
by RK3036 HDMI are currently not in line with the specifications.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

(no changes since v2)

Changes in v2:
- First included in this series

 arch/arm/boot/dts/rockchip/rk3036.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/rockchip/rk3036.dtsi b/arch/arm/boot/dts/rockchip/rk3036.dtsi
index 22685cd23a708..95ae815ba56d3 100644
--- a/arch/arm/boot/dts/rockchip/rk3036.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3036.dtsi
@@ -405,6 +405,7 @@ hdmi: hdmi@20034000 {
 		interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru PCLK_HDMI>, <&cru SCLK_LCDC>;
 		clock-names = "pclk", "ref";
+		rockchip,grf = <&grf>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&hdmi_ctl>;
 		#sound-dai-cells = <0>;
-- 
2.43.0

