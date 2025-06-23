Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7851244678;
	Mon, 23 Jun 2025 12:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750680105; cv=none; b=SLB42GrVj3t4Ct2A2YQFGz6LmedLWtLB61udhm2x9yQRJD5P7l+txDIVNqOw+nq5b6Xv/nvTWN8M4VrsY7JgolCdh+ISKWz6BzKu9wPVvxAJSOtwG4FeoooaoPvlkywusVCaf8I4vQPGoi7SJGE1+6qgvazyszYvsWwNVXylgvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750680105; c=relaxed/simple;
	bh=gbtG8/FPSoapFfBK9PFojeL8xN0vfOSrk+SUI+ArA44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aUGb44/krlOQb0BVVThnhXd7TRyDRNXUn+rrzQ2RyGj/WGFH/Z/DnJFWp71yEyrxRhDfoBxVix94uvZE/dAE+stWQSAMD6+x+2hyfjHmVa7PgBnXP2FyPrsJiFCnNfiXmR+IXCnO5LxSuItnBl3GvhTOSdswBroV6URkCIVYam4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=DbtqbiGr; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="DbtqbiGr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680102;
	bh=gbtG8/FPSoapFfBK9PFojeL8xN0vfOSrk+SUI+ArA44=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DbtqbiGrPGc0dZ9y8hjZ9cDu/guznwGPO+PpujFkXw7zinQ6dMIHoghLtlg1UXGMF
	 IOQ0GqcE8mQel7ATHIV8MkDGoaSaEGAyAgpmwCJRJTy+4M/1If5hMnwvwjQhUQwetp
	 QcvPygO/MET03byT5A8W5EYeKrfsHC+2ISSGdt22gDS0rv3fjNcRmVytUDpHG+UzsK
	 pGtoNVI+0zpG1T0ogrDRwUwmb846qGsEpC7T8rKGPJZInEpt/D9YVFaeUkSp2ay2r0
	 YkYZqPmoG44xH/5HV0dO+GczA64eEp/utF9asBLjrYHttUSk+u9WyEX0gvJztd6H2S
	 VoIqSiRPwoabQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5C46617E0EC0;
	Mon, 23 Jun 2025 14:01:41 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sudeep.holla@arm.com,
	cristian.marussi@arm.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v1 1/2] dt-bindings: firmware: Add MediaTek TinySYS SCMI Extension protocol
Date: Mon, 23 Jun 2025 14:01:35 +0200
Message-ID: <20250623120136.109311-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623120136.109311-1-angelogioacchino.delregno@collabora.com>
References: <20250623120136.109311-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the MediaTek TinySYS SCMI Extension protocol as found on a
number of SoCs, including MT6895 and MT8196.

This includes controls and power state notifications for the GPU,
CPU Memory latency Manager (cm_mgr), SLBC, SSPM and others.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../firmware/mediatek,mt6895-scmi.yaml        | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/mediatek,mt6895-scmi.yaml

diff --git a/Documentation/devicetree/bindings/firmware/mediatek,mt6895-scmi.yaml b/Documentation/devicetree/bindings/firmware/mediatek,mt6895-scmi.yaml
new file mode 100644
index 000000000000..98a5b81983b1
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/mediatek,mt6895-scmi.yaml
@@ -0,0 +1,22 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2025 Collabora Ltd
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/mediatek,mt6895-scmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek System Control and Management Interface(SCMI) Vendor Protocols Extension
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+properties:
+  protocol@80:
+    $ref: '/schemas/firmware/arm,scmi.yaml#/$defs/protocol-node'
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        const: 0x80
+
+additionalProperties: true
-- 
2.49.0

