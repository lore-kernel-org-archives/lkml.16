Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61201211461;
	Mon,  3 Feb 2025 21:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738618239; cv=none; b=LjAl9rHTQOZKsbV/vaSBzV2a6zD63QA+2slGeBgy+G5l7TazHe3VnltznLFlNyysngfYYsi4ma7ogy5iDDkuvgyc89ogjtJoUwpze6wBrIm2cn6FvDswm58yVP8ToQSaVDIspWRexJ4Qytg2UICecNby/7J2vWLAAs1sJIls3D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738618239; c=relaxed/simple;
	bh=etD/h9S0iZWTa4AlbpqPcrZ+lO5bLwSonKt8f2PPvbk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OyQMl9d5mdinvho9rXKzZTw30e8Bpe/U6I532wrKPrDef06vle5AHhCTr9sgMmygNwaVIcYP/IrOwZ2k9tj+3ym5b2X67dRfoK1CkzmEQuQ1dEM8qC1FY50iCcBdbN4yZ17X6V0UVLbXA38Fggy4BFB5wEWkJU5+uojFo08mzC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZGLYmgaE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZGLYmgaE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6341C4CED2;
	Mon,  3 Feb 2025 21:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738618239;
	bh=etD/h9S0iZWTa4AlbpqPcrZ+lO5bLwSonKt8f2PPvbk=;
	h=From:To:Cc:Subject:Date:From;
	b=ZGLYmgaEk61H37J6fRYCq/PqItJ4hR2Yss3x1uX/AuRdJoXEiErjpOm6yyDBXZx91
	 UY6J5JckwRc8pB2YXuO3VFr5wqHKk1oRPcmM5dMi1tA4eseDFrM/kiakG/NaOB5R1W
	 z2jE8aM6ziFV0jDxxkOfwH1LVi1VnAqC1QRRW7EmulnynuYaVK4/Usb8aG2Tfd62LM
	 Grf+uycAvB7biMVhM2n+tpID4C2uAkNrxePVvRsIt8l32qyJkCt0a8V6Gtxs1I+Wk4
	 bICpAUN8YeVgwte/YOCZk5SR5/Xoz2wVzJcyIKv/ELa2Srjr2xRa6pwW/SJl5rNwAO
	 JV1YiTttOOP7Q==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: mtd: physmap: Ensure all properties are defined
Date: Mon,  3 Feb 2025 15:30:35 -0600
Message-ID: <20250203213036.9816-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Device specific schemas should not allow undefined properties which is
what 'additionalProperties: true' allows. Add the missing 'ranges'
property, and fix this constraint.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/mtd/mtd-physmap.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml b/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
index 18f6733408b4..1b375dee83b0 100644
--- a/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
+++ b/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
@@ -122,6 +122,8 @@ properties:
   '#size-cells':
     const: 1
 
+  ranges: true
+
   big-endian: true
   little-endian: true
 
@@ -143,8 +145,7 @@ then:
   required:
     - syscon
 
-# FIXME: A parent bus may define timing properties
-additionalProperties: true
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.47.2

