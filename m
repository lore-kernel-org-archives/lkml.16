Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30E1F2253F1;
	Thu,  6 Feb 2025 06:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738824378; cv=none; b=P3Jnei3mlUVfqwIYsc2TMWt4qRTdXXT5YT9CF7YORNNMjzbp2yIBqb/BX4qcr3SAnnC+zcNulFTDXl58orED3bgWNz7/6r2AyRubmsDL13Y2AUaMbdOFRLgfcprVM+hB17koC2NvcbQO0+UtW2Wa/pPTFMzkKAb23N8WycwgXD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738824378; c=relaxed/simple;
	bh=jSsJM1OOU9Q6l+DkzSx9k2DAMn9xNpGDxZOSu6vGbMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IPRyIW9VtUZ2KIjIRTWirBVYv5fPyO8Sqz254OMrir7Lp4OlC8/qj0BvnsvgqF2RY14nuB2aPh5J1nrLBg/KPoE8qEz8QUZA0V0N0Ary7p31aqVDNXyXNMGqgMccCuWTfloi5e1scRZudF716YLe4tcAbIgTO+JUNIhvjy+mML0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=IQL8yQF7; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="IQL8yQF7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=lzjtk
	//Wp5baYpqeQ5ioBfQJtIBbDj1Ub/HRRw5Ccr8=; b=IQL8yQF7qePULeZ+HgTz9
	r3DWeSDGg3Ey1/FeW4HmZxSVmtKc83qJr5aYeI2gBDuSRZdyOql33+YrMwspd/EO
	j35RQNRvfS/31sR/QDZ3nCxTixgPJELf1sCZA5YjtPpJ2Iy5VD3R98g0N7sV2dDy
	rPeAspJniegLE9IsicjvHM=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3v+2hWqRnj+u8KQ--.33691S2;
	Thu, 06 Feb 2025 14:45:57 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	derek.foreman@collabora.com,
	detlev.casanova@collabora.com,
	daniel@fooishbar.org,
	robh@kernel.org,
	sebastian.reichel@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v13 11/13] dt-bindings: display: vop2: Add missing rockchip,grf property for rk3566/8
Date: Thu,  6 Feb 2025 14:45:48 +0800
Message-ID: <20250206064552.11466-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250206064457.11396-1-andyshrk@163.com>
References: <20250206064457.11396-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3v+2hWqRnj+u8KQ--.33691S2
X-Coremail-Antispam: 1Uf129KBjvJXoWrZF45JFWDAryUCry8ZFykGrg_yoW8JrWDpa
	s3CFWDWay0gr1UXw1DtFn5Cr4vqF97Ca18KFs3JF1xt3ZIgrn8K34a9rn8XF45GFs7ZFWf
	ua1agryFyrn2vr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jFsjbUUUUU=
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqRHrXmekUdSoNgABsU

From: Andy Yan <andy.yan@rock-chips.com>

The clock polarity of RGB signal output is controlled by GRF, this
property is already being used in the current device tree, but
forgot to describe it as a required property in the binding file.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v13:
- Fix typo
- Explain the function of this property.

Changes in v12:
- Split from patch 10/13

 .../devicetree/bindings/display/rockchip/rockchip-vop2.yaml   | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
index 32da1625c063..cf68eb911118 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
@@ -142,6 +142,9 @@ allOf:
         rockchip,vop-grf: false
         rockchip,pmu: false
 
+      required:
+        - rockchip,grf
+
   - if:
       properties:
         compatible:
@@ -196,6 +199,7 @@ examples:
                               "dclk_vp1",
                               "dclk_vp2";
                 power-domains = <&power RK3568_PD_VO>;
+                rockchip,grf = <&grf>;
                 iommus = <&vop_mmu>;
                 vop_out: ports {
                     #address-cells = <1>;
-- 
2.34.1

