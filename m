Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95CE12376E1;
	Wed,  2 Apr 2025 12:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743597167; cv=none; b=fMI8CK0CABm9H9+Ptv/1debyoL7RUozUDeRIYhO/u79pOOm7aAgnhopLUn3cU+dpjWGlHbVo44k6zInxvSRTkqDwJHjLz7B0yh8W2NOFp042HmqgVuohog7LmKCV3qlERCpV6EilCuo457F21h6XNgUBPm/J1NPEp3yGznbA8E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743597167; c=relaxed/simple;
	bh=lKYht5ql/5FIPEeJczRwWYQx5Oi2NvAPbM4ZIVsT/Pk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SzxaHzHCZoi7EF4tsQQ75XWPVTYvtxOQ0gJcBQnqUAgdv2u9OdPpYITC0kXZao1+IA7qC7My8/YSWww8EOP9AoylalukQlN+Znik+QILj6ssKyxJEQMQP0M9tnyIXSU4tk8JKKDcLKKAjY6yPmOBEdgWCnf2QMJUML8ULSSqk4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=jz30fZ3v; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="jz30fZ3v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=jvJrC
	JlXKu0zyBhFzDwypCRXXkJB5PHy1URiAxDBM28=; b=jz30fZ3v9aBAfxkd5mqMl
	jkHWm5hKKsL+mYZErNFNeJjOJ6oSukaEG2MpzVhhWIKpfAKDC/Cudfjd1bAKvxZn
	PdfRkYOd93NPhfUyzRIWUKyJYHb+IemVxCndB7vnGWlTII2TNkZX0HsStTg/3MA9
	TB+PKwuMm3mk2Uc1xOPz+w=
Received: from ProDesk.. (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgDnd405Lu1nJwOJBA--.36321S4;
	Wed, 02 Apr 2025 20:31:59 +0800 (CST)
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
Subject: [PATCH v3 2/7] dt-bindings: display: rockchip,inno-hdmi: Document GRF for RK3036 HDMI
Date: Wed,  2 Apr 2025 20:31:36 +0800
Message-ID: <20250402123150.238234-3-andyshrk@163.com>
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
X-CM-TRANSID:PygvCgDnd405Lu1nJwOJBA--.36321S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZryxWw47XF1UAFyxtFyrZwb_yoW8Gw15pa
	sxC3srWFyxGFy7X34ktr1kCrWYgF97Aa15GFW2qr17tr12gan5Ka1agwn8ZF4UAFs7ZFyS
	9ay7GFy5Aw1Ivr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jrjjgUUUUU=
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkA0jXmftKOaFiAABso

From: Andy Yan <andy.yan@rock-chips.com>

HDMI on RK3036 use GRF control the HSYNC/VSYNC polarity, but this part
is missing when it first landing upstream.

Document that it is mandatory for RK3036 HDMI.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

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

