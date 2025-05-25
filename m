Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86146163
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 15:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748186281; cv=none; b=WWsfY5VJSCaQ0mrMbQIpAj2v6LeG1zenk9kmY/GFFVR8ROEd9TkQH5Y1BqFe6Acwq22ImHd1KgETazGgNfsSUYR8UokmipWP2FSlHAvlxqKFx6nZsGNSzXxsMb1IOPtuw+5ACVGCtn9VL9bpMP7OEzY9YruO6oGOXDG5O2HT/oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748186281; c=relaxed/simple;
	bh=jG2GxC0szzqK+wmK+l2tOnsYAA6pbhT3WJpMiI6cD8Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W6dzFIGHnUSCvBJ39OvFWVAfQTcFAMeqxIZcBff/gM1NRyGpfGK3XPHOjvfrCp4BIlqQwANV3aBaVUXrOPxuniQSmyg4/px+i3Ms6nEIh4HiUiwB2MnDlJpq9s1egQvj8urx5ZQWZqJUeJ346aiEcvZ65U5Rwn/dtFjgeOpF4IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pMRPrnyV; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pMRPrnyV"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748186277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gVhcJx40gudn2SSpvQcp664PWpnT+U+2PapwiFNrvBY=;
	b=pMRPrnyVydH0JP/ZQs6doEAswxYJXPlRhNtPLzehVmSM0r46Nokp7jY98ndHiuv36M4i+P
	tSaB9t2Rvr2cW6ivOFjf21+IshCrC+HPv29X+dpR1O1/hVqVe30zk4mwc2EzKWId+Ny/Dp
	u2CpJw8e1uSEZ+NP5auhXIQqDLNoHnE=
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jyri Sarha <jyri.sarha@iki.fi>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Simona Vetter <simona@ffwll.ch>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Devarsh Thakkar <devarsht@ti.com>,
	Praneeth Bajjuri <praneeth@ti.com>,
	Udit Kumar <u-kumar1@ti.com>,
	Jayesh Choudhary <j-choudhary@ti.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Michael Walle <mwalle@kernel.org>,
	DRI Development List <dri-devel@lists.freedesktop.org>,
	Devicetree List <devicetree@vger.kernel.org>,
	Linux Kernel List <linux-kernel@vger.kernel.org>,
	Aradhya Bhatia <aradhya.bhatia@linux.dev>
Subject: [PATCH v8 1/4] dt-bindings: display: ti,am65x-dss: Re-indent the example
Date: Sun, 25 May 2025 20:47:18 +0530
Message-Id: <20250525151721.567042-2-aradhya.bhatia@linux.dev>
In-Reply-To: <20250525151721.567042-1-aradhya.bhatia@linux.dev>
References: <20250525151721.567042-1-aradhya.bhatia@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Aradhya Bhatia <a-bhatia1@ti.com>

Reduce tab size from 8 spaces to 4 spaces to make the bindings
consistent, and easy to expand.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
---
 .../bindings/display/ti/ti,am65x-dss.yaml     | 54 +++++++++----------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
index a5b13cb7bc73..9cebe237bd4e 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
+++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
@@ -161,32 +161,32 @@ examples:
     #include <dt-bindings/soc/ti,sci_pm_domain.h>
 
     dss: dss@4a00000 {
-            compatible = "ti,am65x-dss";
-            reg =   <0x04a00000 0x1000>, /* common */
-                    <0x04a02000 0x1000>, /* vidl1 */
-                    <0x04a06000 0x1000>, /* vid */
-                    <0x04a07000 0x1000>, /* ovr1 */
-                    <0x04a08000 0x1000>, /* ovr2 */
-                    <0x04a0a000 0x1000>, /* vp1 */
-                    <0x04a0b000 0x1000>, /* vp2 */
-                    <0x04a01000 0x1000>; /* common1 */
-            reg-names = "common", "vidl1", "vid",
-                    "ovr1", "ovr2", "vp1", "vp2", "common1";
-            ti,am65x-oldi-io-ctrl = <&dss_oldi_io_ctrl>;
-            power-domains = <&k3_pds 67 TI_SCI_PD_EXCLUSIVE>;
-            clocks =        <&k3_clks 67 1>,
-                            <&k3_clks 216 1>,
-                            <&k3_clks 67 2>;
-            clock-names = "fck", "vp1", "vp2";
-            interrupts = <GIC_SPI 166 IRQ_TYPE_EDGE_RISING>;
-            ports {
-                    #address-cells = <1>;
-                    #size-cells = <0>;
-                    port@0 {
-                            reg = <0>;
-                            oldi_out0: endpoint {
-                                    remote-endpoint = <&lcd_in0>;
-                            };
-                    };
+        compatible = "ti,am65x-dss";
+        reg = <0x04a00000 0x1000>, /* common */
+              <0x04a02000 0x1000>, /* vidl1 */
+              <0x04a06000 0x1000>, /* vid */
+              <0x04a07000 0x1000>, /* ovr1 */
+              <0x04a08000 0x1000>, /* ovr2 */
+              <0x04a0a000 0x1000>, /* vp1 */
+              <0x04a0b000 0x1000>, /* vp2 */
+              <0x04a01000 0x1000>; /* common1 */
+        reg-names = "common", "vidl1", "vid",
+                "ovr1", "ovr2", "vp1", "vp2", "common1";
+        ti,am65x-oldi-io-ctrl = <&dss_oldi_io_ctrl>;
+        power-domains = <&k3_pds 67 TI_SCI_PD_EXCLUSIVE>;
+        clocks =        <&k3_clks 67 1>,
+                        <&k3_clks 216 1>,
+                        <&k3_clks 67 2>;
+        clock-names = "fck", "vp1", "vp2";
+        interrupts = <GIC_SPI 166 IRQ_TYPE_EDGE_RISING>;
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            port@0 {
+                reg = <0>;
+                oldi_out0: endpoint {
+                    remote-endpoint = <&lcd_in0>;
+                };
             };
+        };
     };
-- 
2.34.1

