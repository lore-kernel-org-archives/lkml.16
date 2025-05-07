Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158F328B4EF;
	Wed,  7 May 2025 15:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746632570; cv=none; b=VrMwYtqyMJbFYSeWa76bAb0Jg2hhAy/4V4pzTgvp2HXrcMrTgTV3cQomDeG1H82j0x4lnQVIXCbIDwEWAeyAHwM8mza9+LMB5EaBWfgG53JkFlghoZXVn7XXluXEgMnRDhVvwNtDgIdlt2TxDRlv4DPL3Pa6FxxIaLsmTD1Vkgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746632570; c=relaxed/simple;
	bh=Wq8+hagNHhDt0qgNoLvZp0IFuNFz4fjEvxG0I7XXFfg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VctdKIb8dYVVXEPG42MZoNHmyuLvIFKJJo0+AMqYMfaIfTlCGYR//+623ZQagnQ/teNmtDsnpuYzksaM8FgMLPjJspfvIGy616dqAvjiZSnaLtHUWeEdMt9P/Vwk8rg7ajIYxJIOXDc8SUE5Lu5Ty2WX48eJLgFN54M7Rjxvs+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JhsprL40; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JhsprL40"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74E47C4CEE9;
	Wed,  7 May 2025 15:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746632569;
	bh=Wq8+hagNHhDt0qgNoLvZp0IFuNFz4fjEvxG0I7XXFfg=;
	h=From:To:Cc:Subject:Date:From;
	b=JhsprL40DKDoJ/8ssEfDM8YpWELJdbYvICrLM7tteL1vAQ7odnDmbL5c7nH+KIfsY
	 bgxyn8gORtmn/MaH3ZWTaT1CijwyPRqLQhkuhtABDVpXDFCjxa9kkZy2Fjxb6zZt/X
	 FHJlNVQxhXO5Aqq9vX/dz8DvOa9VD/dUJPduhuJP5qdTWq9fMf+wFxswdxKJCeEl+6
	 7AOxeeJHLYNms2Nx8cg65XW6njIxoLFVSwqSd5qMl0TTZ2J//JAuqkDiipeeO7UI6b
	 3PenYl7wri6hT/2L9mNs/+6ZCWwW6g7MQ867i/749OxWMDNCrrZOmw19/6B4iiLv6l
	 7XB331fdsW+KA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: soc: fsl,qman-fqd: Fix reserved-memory.yaml reference
Date: Wed,  7 May 2025 10:42:31 -0500
Message-ID: <20250507154231.1590634-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The reserved-memory.yaml reference needs the full path. No warnings were
generated because the example has the wrong compatible string, so fix
that too.

Fixes: 304a90c4f75d ("dt-bindings: soc: fsl: Convert q(b)man-* to yaml format")
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/soc/fsl/fsl,qman-fqd.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,qman-fqd.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,qman-fqd.yaml
index de0b4ae740ff..a975bce59975 100644
--- a/Documentation/devicetree/bindings/soc/fsl/fsl,qman-fqd.yaml
+++ b/Documentation/devicetree/bindings/soc/fsl/fsl,qman-fqd.yaml
@@ -50,7 +50,7 @@ required:
   - compatible
 
 allOf:
-  - $ref: reserved-memory.yaml
+  - $ref: /schemas/reserved-memory/reserved-memory.yaml
 
 unevaluatedProperties: false
 
@@ -61,7 +61,7 @@ examples:
         #size-cells = <2>;
 
         qman-fqd {
-            compatible = "shared-dma-pool";
+            compatible = "fsl,qman-fqd";
             size = <0 0x400000>;
             alignment = <0 0x400000>;
             no-map;
-- 
2.47.2

