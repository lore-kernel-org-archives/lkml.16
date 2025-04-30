Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BBF27453;
	Wed, 30 Apr 2025 09:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746006359; cv=none; b=OoBVzNHIrKeSDQm2VNqcuj9J9/h9z3q0WZ9+T0sEDwW1CP3VAnI4Rq0cvJBXIRIU2unOQ3Df1xLABvFUyUQzMHIR2fNsbfI1Pn0VDHRMXig+FDCdAHFgJ7wzJ64u/CrMvtkAg2woSJp9SdzCMwbILPMgpkCmOeuADBiWTZsJ4HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746006359; c=relaxed/simple;
	bh=aw4M14bX5OS0MCbF86/9/+S1WkpFWd6sm39ciIon0+U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ACfp172PgSwvHOIdiiNIVfgpiWGzDD90Conn1V7RT+fEazTsS8GlqDyKF5wky/OO2p+zGGOM8A+kzDD1G8eoME59eMWCgHiFOpC2QrqK0on52T2mdbQdKfDhPhuAy2ezFLPE/fkQRDJtdrO7Fij+ZoR8Ofz/fYQ4WfAtZahiudY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=m/I2eGeh; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="m/I2eGeh"
X-UUID: e62991ae25a711f0813e4fe1310efc19-20250430
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=oETm/pYIYSrsCUZOG9P0GWCOTnaCfqB/rOTt5dgFQow=;
	b=m/I2eGehfaSpL20sGaZo6zlNW+MLYMmZQ2sWPHMYRbq1ztsY3U4CLWwD77qCMM6pSRbSXp1+KJ9OjL5EHyUgbotwOHQ5i4MuVRN/2eYOHiWMq3Z/wNN8SvdQn5aNWXU9KYufhzL/eK3Cu3ribmcw6QKSzPWgHG0s5u8fhJ/IZr0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:d61c177c-346c-45c6-b12a-4dfb660ecdee,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:d41c3707-829c-41bc-b3dd-83387f72f90e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e62991ae25a711f0813e4fe1310efc19-20250430
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <friday.yang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1267090029; Wed, 30 Apr 2025 17:45:49 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 30 Apr 2025 17:45:49 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 30 Apr 2025 17:45:48 +0800
From: Friday Yang <friday.yang@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Krzysztof Kozlowski <krzk@kernel.org>,
	"Rob Herring" <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"Matthias Brugger" <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Philipp Zabel
	<p.zabel@pengutronix.de>
CC: Friday Yang <friday.yang@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v7 1/2] dt-bindings: memory: mediatek: Add SMI reset and clamp for MT8188
Date: Wed, 30 Apr 2025 17:45:30 +0800
Message-ID: <20250430094545.23932-2-friday.yang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250430094545.23932-1-friday.yang@mediatek.com>
References: <20250430094545.23932-1-friday.yang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: "Friday Yang" <friday.yang@mediatek.com>

Add 'resets' and 'reset-names' properties for SMI LARBs to support
SMI reset operations.
On the MediaTek platform, some SMI LARBs are directly connected to
the SMI Common, while others are connected to the SMI Sub-Common,
which in turn is connected to the SMI Common. The hardware block
diagram can be described as follows.

             SMI-Common(Smart Multimedia Interface Common)
                 |
         +----------------+------------------+
         |                |                  |
         |                |                  |
         |                |                  |
         |                |                  |
         |                |                  |
       larb0       SMI-Sub-Common0     SMI-Sub-Common1
                   |      |     |      |             |
                  larb1  larb2 larb3  larb7       larb9

Signed-off-by: Friday Yang <friday.yang@mediatek.com>
Tested-by: Friday Yang <friday.yang@mediatek.com>
Reviewed-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring <robh@kernel.org>

---
 .../mediatek,smi-common.yaml                  |  2 ++
 .../memory-controllers/mediatek,smi-larb.yaml | 19 +++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
index 0762e0ff66ef..3d98c08b2149 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
@@ -40,6 +40,7 @@ properties:
           - mediatek,mt8186-smi-common
           - mediatek,mt8188-smi-common-vdo
           - mediatek,mt8188-smi-common-vpp
+          - mediatek,mt8188-smi-sub-common
           - mediatek,mt8192-smi-common
           - mediatek,mt8195-smi-common-vdo
           - mediatek,mt8195-smi-common-vpp
@@ -108,6 +109,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - mediatek,mt8188-smi-sub-common
               - mediatek,mt8195-smi-sub-common
     then:
       required:
diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
index 2e7fac4b5094..fc5feb2eac1f 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
@@ -70,6 +70,12 @@ properties:
     description: the hardware id of this larb. It's only required when this
       hardware id is not consecutive from its M4U point of view.

+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: larb
+
 required:
   - compatible
   - reg
@@ -126,6 +132,19 @@ allOf:
       required:
         - mediatek,larb-id

+  - if:  # only for image, camera and ipe subsys
+      properties:
+        compatible:
+          const: mediatek,mt8188-smi-larb
+        mediatek,larb-id:
+          enum:
+            [ 9, 10, 11, 12, 13, 16, 17, 18, 19, 20 ]
+
+    then:
+      required:
+        - resets
+        - reset-names
+
 additionalProperties: false

 examples:
--
2.46.0

