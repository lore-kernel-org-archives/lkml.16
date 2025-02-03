Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F261820F08C;
	Mon,  3 Feb 2025 21:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738618233; cv=none; b=fCL2WtT27EJQMvm29lBnBg/A0ftDuDQDTueUACzXt3n/yX5Bu14Dbw3gbXBWmYRQWDJxToWMuYYZ+mhgrcyONlOd2m8rk05YhscXG1kJbsrP4lJA1nvsc1krlfY9Ychm5n/U1hjV5c9gGNnsp+ylQXRHdi5aaIHa5GK3S2jImLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738618233; c=relaxed/simple;
	bh=p72PiHjsMc3b7WsyXXFFfwMbwIVxFGnML3vWUepaJEE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n7JBMyrzAcp9uY07oWO70GgHS5lVPbSK0TmVmz3DWfcCF+4RTR2NrwIJ7QexkR46By/fl4+zD0Kh0Dj+9Ldq6Ab60gP11JMy5WnHH8azUy+HbQV/95h55av1nH1VsINpa612G7l1AGOlcgz/z7pHojYY6QJm0CYAXBiGilGt8C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FHgwl3UT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FHgwl3UT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A17BC4CED2;
	Mon,  3 Feb 2025 21:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738618232;
	bh=p72PiHjsMc3b7WsyXXFFfwMbwIVxFGnML3vWUepaJEE=;
	h=From:To:Cc:Subject:Date:From;
	b=FHgwl3UTgGmzRxVHE1y1rTWarg6Y+vGC6GFUOrk+hyJlZbV+pCiETRcbi3SoT7tgT
	 /4v4RiSGQza3oItrSRPW9Xd2S+ci8r9dDvdlNjZk4St4ZKrPda2XquyvGxHRrlM6D9
	 MGwyHMiaLTKbpVF1dqWsmY9sLZPvxw4KWjs/XmDbA30Qh+qSjuvhSSrT/xATXYUdub
	 OTR5TnEd0SIiiuAb7Ri/OfBujcM7kfN5Ysql4v/OLA5m3jSK36ITx6s3/XSjbczfFD
	 f8vbuhYz1LIkv9W5jCBuOngeAwR5/RLMZzHAgCsWJB4tt4tg9cyVuThsQMoEnLk4SR
	 zCzovsN83KEoQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peng Fan <peng.fan@nxp.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: imx: fsl,aips-bus: Ensure all properties are defined
Date: Mon,  3 Feb 2025 15:30:26 -0600
Message-ID: <20250203213027.8284-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Device specific schemas should not allow undefined properties which is
what 'additionalProperties: true' allows. Add a reference to
simple-bus.yaml which has the additional properties used, and fix this
constraint.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/soc/imx/fsl,aips-bus.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,aips-bus.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,aips-bus.yaml
index 80d99861fec5..70a4af650110 100644
--- a/Documentation/devicetree/bindings/soc/imx/fsl,aips-bus.yaml
+++ b/Documentation/devicetree/bindings/soc/imx/fsl,aips-bus.yaml
@@ -22,6 +22,9 @@ select:
   required:
     - compatible
 
+allOf:
+  - $ref: /schemas/simple-bus.yaml#
+
 properties:
   compatible:
     items:
@@ -35,7 +38,7 @@ required:
   - compatible
   - reg
 
-additionalProperties: true
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.47.2

