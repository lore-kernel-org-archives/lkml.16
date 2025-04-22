Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3C9F22F3AB;
	Tue, 22 Apr 2025 07:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745305558; cv=none; b=afoEdQ7rxpJSWPOXXY1KEkTTZ2cCNlQkexmptjcCdx7/V4FTvBtWcZObqDkqDbxPBq7kW6YHOt1OUJL9/BJKxERr8GheHVOTG/N+/EAFS4VmegMALgTSXD6fs5CK36+ZHYb9O8qNYZFBLDHRLktCA14RU0kjXblpYQMuURuHB30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745305558; c=relaxed/simple;
	bh=m0IlVc05AIUxjaX/5cmoqo4gLg+qBbEClSWtdzqfVQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D3evJLkKi3EyyWIPN7jgC+jmcnW+mPh/ZYuPecOwtpvJEOXMoYeQHKte3UHFqmAOYtU8jmDJjDcsJyEZtLLcSVHKIpcBt+Wm/gDp6wYIojsKqEktOJEuQByAMg0genltTVRUdVhwBth1PloDTKsRHM5Qo+wWeB8uggseqhVsXyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Jex7O9og; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Jex7O9og"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=uy3Up
	9+VL/2AsL+aZ5eo5DfBzY9pu8UsnO2LpuewdHE=; b=Jex7O9ogF3CNCOu8eviey
	be0347Ae1rSkyFNyg+SkQTgOQnrseUN5fHeSxKQZa5rd/K/ACBnySoT8l6jqBzyM
	ARF9N97ZGnA/mLfuKsZHAkdN2r7+awFFz/Bagfm4JA/KIMp0bk9Tjmv6XxZ/RXyw
	T1H3/4rdixSoEpBhtINvmw=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wCHACaZPwdowMxzBg--.7474S4;
	Tue, 22 Apr 2025 15:05:04 +0800 (CST)
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
	Andy Yan <andy.yan@rock-chips.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 2/7] dt-bindings: display: rockchip,inno-hdmi: Document GRF for RK3036 HDMI
Date: Tue, 22 Apr 2025 15:04:41 +0800
Message-ID: <20250422070455.432666-3-andyshrk@163.com>
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
X-CM-TRANSID:_____wCHACaZPwdowMxzBg--.7474S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZryxWw47XF1UAFyxtFyrZwb_yoW8XF17pa
	sxC3srWFyxGFy3X34ktr18CrWYgF97Aw45JFW7Xr17Kr42gan5Ka1agwn8ZF4UAFs7ZayS
	9a17CFy5Aw4Ivr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07je-eOUUUUU=
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkBE3XmgHPY1Z9wABsY

From: Andy Yan <andy.yan@rock-chips.com>

HDMI on RK3036 use GRF control the HSYNC/VSYNC polarity, but this part
is missing when it first landing upstream.

Document that it is mandatory for RK3036 HDMI.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

(no changes since v2)

Changes in v2:
- First included in v2

 .../bindings/display/rockchip/rockchip,inno-hdmi.yaml    | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml
index 9d1e7f894ea54..290376bec079a 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml
@@ -56,6 +56,12 @@ properties:
       - port@0
       - port@1
 
+  rockchip,grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to GRF used for control the polarity of hsync/vsync of rk3036
+      HDMI.
+
 required:
   - compatible
   - reg
@@ -75,6 +81,8 @@ allOf:
             const: rockchip,rk3036-inno-hdmi
 
     then:
+      required:
+        - rockchip,grf
       properties:
         power-domains: false
 
@@ -103,6 +111,7 @@ examples:
       clock-names = "pclk", "ref";
       pinctrl-names = "default";
       pinctrl-0 = <&hdmi_ctl>;
+      rockchip,grf = <&grf>;
       #sound-dai-cells = <0>;
 
       ports {
-- 
2.43.0

