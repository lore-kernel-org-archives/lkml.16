Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 970D21FC0ED;
	Thu,  6 Feb 2025 06:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738824348; cv=none; b=JDxCJZCJEuNuXD37PgZgqd3zL4nkINEMU6gtA6SayyD2/Zfsr2hlucECNEo/8b0nmyq61RHyyPxZqtIIL0T+HwB6uEL3sW31yji/vkihmhjPvsBK7/olYQN2IVOtIBXTtBdZfpNqN/mzbEATqecw8m6Ol7JZUF3OOrB5iUsG770=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738824348; c=relaxed/simple;
	bh=kNa5dGtY+tNF5iSqgM2f1+7k7xk8PgiweEqkoZWwTuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EY5pCfzWwCa4vaY/2zolbVwC4cMMiQ8r7juzA2sbgknTx8Vz8c09klRL0Jg829D5EFIrYR+/wb+sQnkxCVKOXI51JqtWjHS1LeHtPUSQiJD9wukesGTf4KDzKBwR4tE2YNziagvzhMwVSC2/L2Kks82/VeQFUSJ1kBkqCEWYdLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ldvU3xhs; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ldvU3xhs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=VjpGl
	lgUTFnEqj9Ntfpt0RfQHFO2cLVfyWMBrZr3BPQ=; b=ldvU3xhshq4BP2idMpqDX
	Z6vfPZ4rIUjFN+29YLCLmpMS3Eov0a/0Ezn0rmrEMLbcU7FCO0P4nBt/c23tWjt1
	G6EEpceximBzIyg/5p+7dsWBMphgR0EZ6oeakxpmXgglmUzT51NAXMBg1Dg2x1Y4
	saE0xPGIQznK4p0urUIj/0=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wD3fyNsWqRnb3bDKQ--.52146S12;
	Thu, 06 Feb 2025 14:45:14 +0800 (CST)
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
Subject: [PATCH v13 10/13] dt-bindings: display: vop2: describe constraint SoC by SoC
Date: Thu,  6 Feb 2025 14:44:38 +0800
Message-ID: <20250206064457.11396-11-andyshrk@163.com>
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
X-CM-TRANSID:_____wD3fyNsWqRnb3bDKQ--.52146S12
X-Coremail-Antispam: 1Uf129KBjvJXoWxZF4UWFyDtF15Gry8GFykKrg_yoW5ArW5pa
	97C3s8X3ykGr1UWw4ktF1fCw4SqF9xAw47Jrn7t3WxGa1qkF4UG3yagrn8Ar9xWFsFvaya
	kan0kw15J3y2vr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jbOz3UUUUU=
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqRHrXmekUdSoNgAAsV

From: Andy Yan <andy.yan@rock-chips.com>

As more SoCs variants are introduced, each SoC brings its own
unique set of constraints, describe this constraints SoC by
SoC will make things easier.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v13:
- Add maxItems constraint for clocks
- Remove constraint for interrupts in allOf block, as the current
  maxItems is already 1.

Changes in v12:
- Only change the description method for existing SoC.

Changes in v11:
- Remove redundant min/maxItems constraint

Changes in v10:
- Move interrupt-names back to top level
- Add constraint of interrupts for all platform
- Add constraint for all grf phandles
- Reorder some properties

Changes in v9:
- Drop 'vop-' prefix of interrupt-names.
- Add blank line between DT properties
- Remove list interrupt-names in top level

Changes in v8:
- Fix dt_binding_check errors
- ordered by soc name
- Link to the previous version:
  https://lore.kernel.org/linux-rockchip/6pn3qjxotdtpzucpul24yro7ppddezwuizneovqvmgdwyv2j7p@ztg4mqyiqmjf/T/#u

Changes in v4:
- describe constraint SOC by SOC, as interrupts of rk3576 is very
  different from others
- Drop Krzysztof's Reviewed-by, as this version changed a lot.

Changes in v3:
- ordered by soc name
- Add description for newly added interrupt

Changes in v2:
- Add dt bindings

 .../display/rockchip/rockchip-vop2.yaml       | 40 ++++++++++++-------
 1 file changed, 26 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
index 2531726af306..32da1625c063 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
@@ -14,6 +14,7 @@ description:
 maintainers:
   - Sandy Huang <hjc@rock-chips.com>
   - Heiko Stuebner <heiko@sntech.de>
+  - Andy Yan <andyshrk@163.com>
 
 properties:
   compatible:
@@ -120,43 +121,54 @@ allOf:
       properties:
         compatible:
           contains:
-            const: rockchip,rk3588-vop
+            enum:
+              - rockchip,rk3566-vop
+              - rockchip,rk3568-vop
     then:
       properties:
         clocks:
-          minItems: 7
+          maxItems: 5
+
         clock-names:
-          minItems: 7
+          maxItems: 5
 
         ports:
           required:
             - port@0
             - port@1
             - port@2
-            - port@3
 
-      required:
-        - rockchip,grf
-        - rockchip,vo1-grf
-        - rockchip,vop-grf
-        - rockchip,pmu
-
-    else:
-      properties:
         rockchip,vo1-grf: false
         rockchip,vop-grf: false
         rockchip,pmu: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3588-vop
+    then:
+      properties:
         clocks:
-          maxItems: 5
+          minItems: 7
+          maxItems: 7
+
         clock-names:
-          maxItems: 5
+          minItems: 7
+          maxItems: 7
 
         ports:
           required:
             - port@0
             - port@1
             - port@2
+            - port@3
+
+      required:
+        - rockchip,grf
+        - rockchip,vo1-grf
+        - rockchip,vop-grf
+        - rockchip,pmu
 
 additionalProperties: false
 
-- 
2.34.1

