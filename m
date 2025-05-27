Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93201A5BA9;
	Tue, 27 May 2025 06:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748325869; cv=none; b=grLyui896kPkMzAKkylIst50lGFrHDZ3aNqaI+0KPN0xGkwGaeAmnRt4Q5RFq9XUhT4JiRIEe3fs1pAsW83+EqfVjMl27xJ/YVfX8PKcbhknl7HDrpSc2KtCCQlgdoU5fbk4MG5zxaFIn4E7hwD4IM0Tj+zQcS1gsNC9XFNevAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748325869; c=relaxed/simple;
	bh=BU3ZAsPDgUwavv+4cVPWChbJuHjYZePha7q19dRoCiM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FZ9tH51OTObjEkrjbHkHX+9VNiQayHkPaOua+WBgRpTKc/EmgSf/FBWXimAwi9CsuuruCHEQIzCEjyVehoR7ewhvSFxbIwszwtG7UyyQBHNyMM+80AY9ABrUbHgaIDBH2z3PjOZcLfzloaLyDAeX2jvZdO9cuEA3qq/4XPKwqeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=KrfuYWPV; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=VTfAECrL reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="KrfuYWPV";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="VTfAECrL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1748325866; x=1779861866;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NufnI3WPgjJfZd6jl1u+COmUHgy2mfKMhHbcX6GCUMQ=;
  b=KrfuYWPVCavn/FMypGGyPjJzhDKfBKI5e8hQuKKg4NbFn/qvnvwzMEox
   gYHPZONCGlYGgi66Q39JHMGvt2zVafBUV8RDsMHiDnqFYGj3nzCIHmMOt
   iN913hwcknA7DI0LXyA7whfIzuZtlqknyfsr7wsa47YhgkJT9t/P3vfaG
   ZhisGQgkTF0+cy8NWZJceZBrnleIeCQ0vMukvkV2GbJmK56jlVHduT8fR
   3kh0rt9FrkuHKk788t4S42XnyT9/zbEecJR65cgmUSxyWFJdM40o4rabm
   fkDko/4pTys/Gx8OE0uPsk/H8WQ6llvUtXHX8Wrbs/F++YSthclU/vNe+
   w==;
X-CSE-ConnectionGUID: osZUuC7PTcWKvOxGH52KIg==
X-CSE-MsgGUID: Rpe+SLBIS8qJvyp7bN4EZQ==
X-IronPort-AV: E=Sophos;i="6.15,317,1739833200"; 
   d="scan'208";a="44300048"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 27 May 2025 08:04:16 +0200
X-CheckPoint: {683555E0-2-45F3AE15-E90F7DFA}
X-MAIL-CPID: 088DBB11D3FA37DCE78AADB2B77E3D50_5
X-Control-Analysis: str=0001.0A006399.683555F5.002C,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B2CC6165768;
	Tue, 27 May 2025 08:04:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1748325851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NufnI3WPgjJfZd6jl1u+COmUHgy2mfKMhHbcX6GCUMQ=;
	b=VTfAECrLqktw99cR2HTGHekR4QHk0I0wXLFBFRnDdcKklm5gqG1cOf16dCldPrAAPpaSiC
	+zWKRRAVkkNIVfmbkPxitrBMBfIO8SaSNTMpm258bqeglgBD5G2ohBkIeWHgzgg+dHTG5N
	Inzm2UCH1FJ51f9tpzQ4QS0ginnETY4xWRlWTKWbWYTj6waccmmDIYLJdUMpkPl8lv8Ink
	fa7LmnugIGBKLgMYPF5HzUDaKv+ISEU/GbcrHSEVM9DjeYAj76kDUTNW7FJRnXo/u3k4z3
	n/GM00MbN3loGbwUqV0k7+qurdRgVohw3i9m9D3u4CN6YDg7ASq11NS+kwkSuA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Matthias Schiffer <matthias.schiffer@tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 1/2] dt-bindings: arm: fsl: add TQ-Systems boards MBLS1028A and MBLS1028A-IND
Date: Tue, 27 May 2025 08:03:54 +0200
Message-ID: <20250527060400.1005757-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Matthias Schiffer <matthias.schiffer@tq-group.com>

Add two mainboards for the TQ-Systems TQMLS1028A SoM, based on the NXP
Layerscape LS1028A.

Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index d828fbd4d988c..50b13811d55b5 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1627,6 +1627,15 @@ properties:
           - const: kontron,sl28
           - const: fsl,ls1028a
 
+      - description:
+          TQ-Systems TQMLS1028A SoM on MBLS1028A/MBLS1028A-IND board
+        items:
+          - enum:
+            - tq,ls1028a-tqmls1028a-mbls1028a
+            - tq,ls1028a-tqmls1028a-mbls1028a-ind
+          - const: tq,ls1028a-tqmls1028a
+          - const: fsl,ls1028a
+
       - description: LS1043A based Boards
         items:
           - enum:
-- 
2.43.0

