Received: from mail-m49232.qiye.163.com (mail-m49232.qiye.163.com [45.254.49.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260A727465B;
	Wed, 28 May 2025 08:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748422499; cv=none; b=Nexx9+ir81LUNTPbDFNKkvKj+n7h8giIKmJBeG+NnCWt0oEci1IkYv1WUooP5zCHTKuKha+ms/ITXFqDWMcLZfyErh3/O9T/Vq1m8PNPiQpGcJ/vEWcZ2TyVpmoa2iRY+HODJtd+fCOOPg/SGyYPufj41EoqU13qvisznR2YkV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748422499; c=relaxed/simple;
	bh=3SGc/VP4sDTxxeisGrvVH8yGTEp4dzsvju6BchTm+zQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=h5H4QXzUn16RURCHWOtQxO1+b/T/DzaUNqkYmlFglMwnBssm3aU1aaUPRMj2CnkYQcAsLUm9D8vFZ3hHzKfj02rzzFe1cUMgl+54Ken2Czz4O3uZfBo8ta183DiAzB2L7lpvCoREOBP748O1348JJQjhYkpDlmWF4s7zLusZKi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=ZslRBfNd; arc=none smtp.client-ip=45.254.49.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="ZslRBfNd"
Received: from localhost.localdomain (unknown [117.184.129.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 16b15a5f5;
	Wed, 28 May 2025 16:54:47 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ge Gordon <gordon.ge@bst.ai>
Cc: BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Albert Yang <yangzh0906@thundersoft.com>
Subject: [PATCH v1 2/9] dt-bindings: arm: add Black Sesame Technologies (bst) SoC
Date: Wed, 28 May 2025 16:54:44 +0800
Message-Id: <20250528085444.481163-1-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCHkIZVklNGUtIGU4dQ0hISFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkxVSkNPVUpJQlVKSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
X-HM-Tid: 0a971619ed6109cckunma4140f57397d08
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NT46USo4CTE*PkgZUQ9KOTMt
	QxowCy5VSlVKTE9DT0lJT0NDTkxKVTMWGhIXVQIaFRwBE0tCS007DxMOFR8eCQgUHQ9VGBQWRVlX
	WRILWUFZSkpMVUpDT1VKSUJVSkhPWVdZCAFZQUlITE03Bg++
DKIM-Signature:a=rsa-sha256;
	b=ZslRBfNdnW2bRPoB7+povFOwSwa1nMCumeKBGMgQd7JE+W8YOSPbGR0q4PmtMDcVlHAqhDT//rOdOPiIhvzMYIZCXixAsTNQEWXnYjk90GVBqxAV/tGRyaNSDOQ2lDmoFtDB6a/NzLj6Wwz5LFK5J9nCzF/alj6tZJKaSbperRE=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=5aDsGHATrYbvgalCsJgPhzB/hTqSH/AkFDrxYsFVCvs=;
	h=date:mime-version:subject:message-id:from;

Add device tree bindings for Black Sesame Technologies Arm SoC,
it consists several SoC models like C1200, etc.

Signed-off-by: Ge Gordon <gordon.ge@bst.ai>
Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>
---
 .../devicetree/bindings/arm/bst.yaml          | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/bst.yaml

diff --git a/Documentation/devicetree/bindings/arm/bst.yaml b/Documentation/devicetree/bindings/arm/bst.yaml
new file mode 100644
index 000000000000..e21a37130cef
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/bst.yaml
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/bst.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: BST platforms
+
+description: |
+  Black Sesame Technologies (BST) is a semiconductor company that produces
+  automotive-grade system-on-chips (SoCs) for intelligent driving, focusing
+  on computer vision and AI capabilities. The BST C1200 family includes SoCs
+  for ADAS (Advanced Driver Assistance Systems) and autonomous driving applications.
+
+maintainers:
+  - Ge Gordon <gordon.ge@bst.ai>
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: BST C1200 family platforms
+        items:
+          - const: bst,c1200
+
+      - description: BST C1200 CDCU1.0 ADAS 4C2G board
+        items:
+          - const: bst,c1200-cdcu1.0-adas
+          - const: bst,c1200
+
+additionalProperties: true
+
+...
-- 
2.25.1

