Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363411E47A9;
	Sat, 12 Apr 2025 13:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744463776; cv=none; b=jGv5Zy0LHC6GkBChpUHUwlAp131qfotmcG4ZXAYx+FaAONxd71HEfuBOVFJk+fkro5mRgYhemPpITWsxKWMbUMIXo4YeZU6us3O0D6KuA2tupx50/Ne3+kTTVMjpfsd0rdlclVA2k5wk0bcsQLfIY617ClP9VTz1ucpEcwN26Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744463776; c=relaxed/simple;
	bh=tVWlsHyHnXCIGSgizl8HG7hmSOJbp84SHZlXyFf90fw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OuPy8Oh/UQjmHylePisdOWKi7pqSzMJKllG1nl5hU/WsSPPUIlzkrCQKmoAtDvthk9cRFEF18wz4Eh3awWu/JScq9X6V9sh31rokt0bgYOhv65hVG1hutwCLK+INY0teJXNTCjEe2Pm99Ef6/Xt3CW0VYNDcuRqCWsLOjS94C6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iC8a/WC4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iC8a/WC4"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 98BD3C4CEED;
	Sat, 12 Apr 2025 13:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744463775;
	bh=tVWlsHyHnXCIGSgizl8HG7hmSOJbp84SHZlXyFf90fw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=iC8a/WC4yo3UI0nR+qdj4g9mJKJuSY3KdMM/puHRci2xFEhhKn+UIA1tIihfh0Vrk
	 g87Mg2IRd0WuHbtTsf7/obAM44hE3Y21xcjLZqzSRaXU1m744l8hj8nx38fn0YpRa2
	 2Q+vRq9jZUF6eLjIqssRMVoTST99fRxF4uULxdmjbVcvqXbVYDBzrUys0CJZ9e+vYX
	 JpqbGzka1Zm4Ia2pYuArzyOo2EHFdCoH94wflhO72zL9qky6LnBWWBbsbg8WwApLQ/
	 CduuWdars4/4ub4Bp+5YlfWxUHxGwnDN4MSG/o8DGpQIvnCm9aj9Lzk6DLyFdd+zJj
	 sxX9SSrmCrrbg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED57C369AE;
	Sat, 12 Apr 2025 13:16:15 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Sat, 12 Apr 2025 15:16:04 +0200
Subject: [PATCH v5 3/4] dt-bindings: nand: Add fsl,elbc-fcm-nand
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250412-ppcyaml-elbc-v5-3-03f0e577139f@posteo.net>
References: <20250412-ppcyaml-elbc-v5-0-03f0e577139f@posteo.net>
In-Reply-To: <20250412-ppcyaml-elbc-v5-0-03f0e577139f@posteo.net>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Crystal Wood <oss@buserror.net>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744463772; l=3440;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=WvJoQK0edpJeqo++ZsYt3pS+SZc6YBUbltPH3xZQKbg=;
 b=ZlwLLrnr0tnVcUvMUkmKmZgmWUTcpmFXhK0evY0sU2YAfzQ+KWPr7Ghb7DGrYHdgyVPkEjTeW
 Nl3W6FN2QgOAF2xXhTWmmHy05LriYY32Tb0O27Jash1igxQHD2JFsns
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net

From: "J. Neuschäfer" <j.ne@posteo.net>

Formalize the binding already supported by the fsl_elbc_nand.c driver
and used in several device trees in arch/powerpc/boot/dts/.

raw-nand-chip.yaml is referenced in order to accommodate situations in
which the ECC parameters settings are set in the device tree. One such
example is in arch/powerpc/boot/dts/turris1x.dts:

	/* MT29F2G08ABAEAWP:E NAND */
	nand@1,0 {
		compatible = "fsl,p2020-fcm-nand", "fsl,elbc-fcm-nand";
		reg = <0x1 0x0 0x00040000>;
		nand-ecc-mode = "soft";
		nand-ecc-algo = "bch";

		partitions { ... };
	};

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---

V5:
- add Rob's review tag

V4:
- no changes

V3:
- remove unnecessary #address/size-cells from nand node in example
- add Frank Li's review tag
- add missing end of document marker (...)
- explain choice to reference raw-nand-chip.yaml

V2:
- split out from fsl,elbc binding patch
- constrain #address-cells and #size-cells
- add a general description
- use unevaluatedProperties=false instead of additionalProperties=false
- fix property order to comply with dts coding style
- include raw-nand-chip.yaml instead of nand-chip.yaml
---
 .../devicetree/bindings/mtd/fsl,elbc-fcm-nand.yaml | 68 ++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/fsl,elbc-fcm-nand.yaml b/Documentation/devicetree/bindings/mtd/fsl,elbc-fcm-nand.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..91e8f2f9ff26da0f5a3f9bf276955ed32e9e7bc6
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/fsl,elbc-fcm-nand.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/fsl,elbc-fcm-nand.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NAND flash attached to Freescale eLBC
+
+description:
+  The Freescale Enhanced Local Bus controller (eLBC) contains logic to
+  interface with NAND flash, called the NAND Flash Control Machine (FCM).
+  This binding describes flash attached to an eLBC using the FCM.
+
+maintainers:
+  - J. Neuschäfer <j.ne@posteo.net>
+
+allOf:
+  - $ref: raw-nand-chip.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - fsl,mpc8313-fcm-nand
+              - fsl,mpc8315-fcm-nand
+              - fsl,mpc8377-fcm-nand
+              - fsl,mpc8378-fcm-nand
+              - fsl,mpc8379-fcm-nand
+              - fsl,mpc8536-fcm-nand
+              - fsl,mpc8569-fcm-nand
+              - fsl,mpc8572-fcm-nand
+              - fsl,p1020-fcm-nand
+              - fsl,p1021-fcm-nand
+              - fsl,p1025-fcm-nand
+              - fsl,p2020-fcm-nand
+          - const: fsl,elbc-fcm-nand
+      - const: fsl,elbc-fcm-nand
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    localbus {
+        #address-cells = <2>;
+        #size-cells = <1>;
+
+        nand@1,0 {
+            compatible = "fsl,mpc8315-fcm-nand",
+                         "fsl,elbc-fcm-nand";
+            reg = <0x1 0x0 0x2000>;
+        };
+    };
+
+...

-- 
2.48.0.rc1.219.gb6b6757d772


