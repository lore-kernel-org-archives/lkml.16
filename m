Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B85B222F167;
	Tue, 22 Apr 2025 07:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745305559; cv=none; b=fyRmA7GD54MBOjnU9k9F67Yv/BEwiFH06Wwc4gy8sxGIEA+QeCwFsB5sjyZ6QMBY1OJGElctRwSVQ0Dl1iYwbJnWtvGQwBCvIrzYcIdvYRNqh+R3Zc412vFnCnnAOdEpWM39ntAQMhwNb7TYYi33zfHtgeh0p93f/m95WMsPg/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745305559; c=relaxed/simple;
	bh=J/FkQ+SkHYYoPQcELkb+tIcpNOe26kLfqD3rb2wWEoo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=byzQk4l51Wjhj7DcYZ4uExRDY9RVnmYRP+7I6KAa6vOY3alBi5p4py8SdyrEtsCxJxXnf1La657O9wmomvmCF4lBQVovow8n1Betv7dvVQZcARtjuztdWL7DuBqXU0MufOij2j9ibmqPPLhBK/rfIJSKQ+EvEMJXSDyf43g46I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=MZbk7Du3; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="MZbk7Du3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=XjB5C
	GDy56iSBUj/onMIQC1Fw0WRXap96Du59NyDvPE=; b=MZbk7Du3gtEV5vLWjmBNY
	hsZc/cwJS+v9t32PHJApD9sVnR0wss09/U+/niBUCeRPpZ3VEdi++Dvv919EJI5C
	Em0X7GOFmp42yWgVwF6DBqrWTp71Uxx4Vbco7Cpb5g+vmG6Nj+VLxx2tVLEijMuC
	PlPJKQGwT7OKsUX6edM43A=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wCHACaZPwdowMxzBg--.7474S7;
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
Subject: [PATCH v4 5/7] ARM: dts: rockchip: Add ref clk for hdmi
Date: Tue, 22 Apr 2025 15:04:44 +0800
Message-ID: <20250422070455.432666-6-andyshrk@163.com>
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
X-CM-TRANSID:_____wCHACaZPwdowMxzBg--.7474S7
X-Coremail-Antispam: 1Uf129KBjvdXoWrKF1xJw4kAFWfZry3tw4xWFg_yoWDWFX_t3
	WIgw15GF4fGrZIq34Dtr4UW39F9w4fC397XrnYqr4UJF9aqr4UXF4kGayIyry5Jay2g3sx
	CFZ5Xw4aya1agjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0Ta0PUUUUU==
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0gU3XmgHOe-cKwACsy

From: Andy Yan <andy.yan@rock-chips.com>

The RK3036 HDMI DDC bus requires it's PHY's reference clock to be
enabled first before normal DDC communication can be carried out.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

(no changes since v1)

 arch/arm/boot/dts/rockchip/rk3036.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/rockchip/rk3036.dtsi b/arch/arm/boot/dts/rockchip/rk3036.dtsi
index 6039a0908af1c..22685cd23a708 100644
--- a/arch/arm/boot/dts/rockchip/rk3036.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3036.dtsi
@@ -403,8 +403,8 @@ hdmi: hdmi@20034000 {
 		compatible = "rockchip,rk3036-inno-hdmi";
 		reg = <0x20034000 0x4000>;
 		interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cru  PCLK_HDMI>;
-		clock-names = "pclk";
+		clocks = <&cru PCLK_HDMI>, <&cru SCLK_LCDC>;
+		clock-names = "pclk", "ref";
 		pinctrl-names = "default";
 		pinctrl-0 = <&hdmi_ctl>;
 		#sound-dai-cells = <0>;
-- 
2.43.0

