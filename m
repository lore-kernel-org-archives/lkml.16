Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D7C022AE49;
	Tue, 22 Apr 2025 07:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745305557; cv=none; b=vAZ1fmhnCVZdyapYiiaB1h1KISr2aYsJAHWoU5xC8hdkP21FeUtwZRt6Ajmh9G+4O/JBGBVIGcy1g5IdVCY40BQphtxGkWsr1LTBNq/28Dg0IF8PaSjfDTy4jM8E7hu5iTOO/Q30c8w8ZdgKwPFnqmB1jq5v/aTd8LV4rTufYcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745305557; c=relaxed/simple;
	bh=lHPcC6roTWI6j5MuLnP9MGdLrR/C3X98BMj/TCy80J0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fnrH386NkF74u3/ePj0osSNjJX6mhbgUk1vzLMq85GSY97roDW5Z2c9M3JPjyXhluvNMJww/6VC5ElPWv/7BdnCOcQdoz+YJpagb9obdRSX7YvqzL9KkBYt278qwp+TUfz3y1fpX+AIZVhs3TK7EgC02tB/dJUe9TRO6elNgmoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=cy05G8sW; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="cy05G8sW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=SNu0F
	4yGXjEea7fLM5tg1tfl9TwC9mxjxgn2oB/nJL4=; b=cy05G8sWi7XSUH8ptoiyZ
	2KmiAYxmn2B39ZaZDFI1DeJIY6uUHj/MM83SRC1CuX2cf0cboEqENBXp3FQCbdsU
	lQOLLHf3fZUD9yWkdxiiNKVXA2reU/EAO63jzn5OoNj9gH7AZcuIKxi3A6bE9hT+
	5T6cZgMeDjmst9baHtVqG0=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wCHACaZPwdowMxzBg--.7474S3;
	Tue, 22 Apr 2025 15:05:03 +0800 (CST)
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
Subject: [PATCH v4 1/7] dt-bindings: display: rockchip,inno-hdmi: Fix Document of RK3036 compatible
Date: Tue, 22 Apr 2025 15:04:40 +0800
Message-ID: <20250422070455.432666-2-andyshrk@163.com>
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
X-CM-TRANSID:_____wCHACaZPwdowMxzBg--.7474S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw45GrW5ur4xJFyrWF45Wrg_yoW8Ar4Dpa
	93C3WkXr1xur1UX34Dtr18CrWkta4kAa1YkFy2q3W8Gr1j9a1DKa1agr4DZay3ArsrAa9F
	vFsFgry8A34SvrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j0388UUUUU=
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkBE3XmgHPY1Z9wAAsZ

From: Andy Yan <andy.yan@rock-chips.com>

The RK3036 HDMI DDC bus requires it's PHY's reference clock to be enabled
first before normal DDC communication can be carried out.

Therefore, both RK3036 and RK3128 HDMI require two identical clocks.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

---

(no changes since v1)

 .../bindings/display/rockchip/rockchip,inno-hdmi.yaml | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml
index 5b87b0f1963e1..9d1e7f894ea54 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml
@@ -23,13 +23,11 @@ properties:
     maxItems: 1
 
   clocks:
-    minItems: 1
     items:
       - description: The HDMI controller main clock
       - description: The HDMI PHY reference clock
 
   clock-names:
-    minItems: 1
     items:
       - const: pclk
       - const: ref
@@ -87,11 +85,6 @@ allOf:
             const: rockchip,rk3128-inno-hdmi
 
     then:
-      properties:
-        clocks:
-          minItems: 2
-        clock-names:
-          minItems: 2
       required:
         - power-domains
 
@@ -106,8 +99,8 @@ examples:
       compatible = "rockchip,rk3036-inno-hdmi";
       reg = <0x20034000 0x4000>;
       interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
-      clocks = <&cru  PCLK_HDMI>;
-      clock-names = "pclk";
+      clocks = <&cru PCLK_HDMI>, <&cru SCLK_LCDC>;
+      clock-names = "pclk", "ref";
       pinctrl-names = "default";
       pinctrl-0 = <&hdmi_ctl>;
       #sound-dai-cells = <0>;
-- 
2.43.0

