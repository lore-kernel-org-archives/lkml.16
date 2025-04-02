Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51AC61E7C02;
	Wed,  2 Apr 2025 12:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743597163; cv=none; b=H6WoqilB5ieapz6gtRLc/Yc7lbEdcjU8GFRtV6QrZ81W/sYjPWz7h9y1wFPMciublm/5FQtrLr0QBN89OObMgSO66RgspM8ydsM9iwePshYuiPwNYl24prlwWWQnayyalV/W0IWgG6DDZHzc2Od84J2BNV7Mz0Vpftw8zATkV7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743597163; c=relaxed/simple;
	bh=UTATp5Vy18bL4XWdu6qCARwaTStSHDvxTPvSI0YaSRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HF+PGMtMnHoVZ8fHDFW7eXoaZyaJFea62qr9cpeb9Cg87A+B8nJJSLT7tMEh2duBeVREskQyx9pvpMm2GzZdPaiYuSwK1l6fNC7V7yWziTVGyZ9e/SHCCsXdYpdmU50CwAiCEFA3HtESQZfV621AHBsGVuRGpG6AzJUZdfwiJVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=k5MNf0c0; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="k5MNf0c0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=g3jx9
	mZP84zW4GKnneObG67nUX/ojN2RZWPwZ8uHvVk=; b=k5MNf0c0yOQ3sb37A0N3O
	v5SekZwbRQDWEyzuVS8p8n/70pO3xrDjvdOBJOIKUjwqu4DCQ5KJDsTFDi5JBDgz
	wOck6gWjtbCpBzXqGkjTW+25I5SRYSXy9LXF4UgBf3GCVY3EA9PKZTcrftg9JxW6
	08pn4WtwXXq+o0QUga2UqU=
Received: from ProDesk.. (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgDnd405Lu1nJwOJBA--.36321S8;
	Wed, 02 Apr 2025 20:32:03 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	hjc@rock-chips.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	dmitry.baryshkov@oss.qualcomm.com,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v3 6/7] Revert "ARM: dts: rockchip: drop grf reference from rk3036 hdmi"
Date: Wed,  2 Apr 2025 20:31:40 +0800
Message-ID: <20250402123150.238234-7-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250402123150.238234-1-andyshrk@163.com>
References: <20250402123150.238234-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgDnd405Lu1nJwOJBA--.36321S8
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gry5Kr43uFW8Ary3Kw15Arb_yoWkWFX_tF
	yIg3W5Ka1FkrWYqry8tw4UGwsFywn5GFWrJw1rJr4UGwnYqF4DuFs5GayxAr15Gay2grZ3
	WFZ5Xa1Yyw13WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0aYLDUUUUU==
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0gUjXmftK+o5lQABsM

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

