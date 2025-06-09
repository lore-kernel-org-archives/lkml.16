Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0291A20E6E2
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 10:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749464208; cv=none; b=p0E2+PJTke+l71ieGfc7ORD7h2gn2Pgg65KL5QVtXBW10ua3lGDBV2BsQL8kGshePdQSblTrKzJSOJdBRjBAOhcGTjGQXVrLD3p+k4IeexI8gVwqnI9Ifm20RVRiFsJbCwwOXFxO0/0khGfyoe9iNJ0Rjmaus+t7/ixNIfqkThY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749464208; c=relaxed/simple;
	bh=PIXsigzhpaZTAE27MAczpJvgQdw5iQTaoN4gsyWHgXg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=knIvbp9Z/fu1IZdilCAWOppMgKlBFR8aVaStv3OFpTjTxqZbMj/0ISLQ5/sqTLjRfaKj0sb7hSQ/VT817+6N05mABF2c2SA1l+8PepLVoeFJDekCVpeMj6hWByeKIbcdj9INQdwaBm1wEm6eko6yupw4f0XHjiV4qOxEchiFBW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Zqd0psO1; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Zqd0psO1"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ad89f9bb725so772064466b.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 03:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749464205; x=1750069005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yicwNTagJmvvj5A4ShfxxiK3V9ru6zwPujeU6NtiIN4=;
        b=Zqd0psO1T6qlOsFHv4V7K9jVF5aZZ8xutWtTcpMx3e/DGV6oWX6U/RwFu/ARPo9RGe
         yAt3Zi5c6W8JUTdtfRI6rHRD+g6QPN3DgT+7yl5UqPQ85q0Kk5DCaVG7K2LwymruRbKj
         8xcYkWkWaLoMhA4f1d45OGg8jeaCGq1aIkZXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749464205; x=1750069005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yicwNTagJmvvj5A4ShfxxiK3V9ru6zwPujeU6NtiIN4=;
        b=syIBKdpP8W8H+b8PckBh8aO1dvRDDxQuLR2PAYcFtUvAf86E8Mz30wV8CLeOtKKkyZ
         sN5IRlztJC82T8rX1CLwKbbQ/wmh3sTLPNc6ywoFpV2Jzp7W6nVk270s9SK7w66SBBN9
         1gA0a3bS5Z+/qKNpHJC/j2VLwgvNTt8jOELomVxze+I6E0ngVh811nkfA/1G3m+O18J3
         LnGzQ0/SglnjVsiX1ya2vFcRQhJPbn5aArzl/NwYyAIgI2WDwRelzEUT0l9G4NUDgpVW
         luEYVqofj/wFchot20XQhrpMQ0B39cgh1AhaAiYq2Y0FrQod/tN4BU8LKPi0lnZYiDnW
         Yc5w==
X-Gm-Message-State: AOJu0Yyz9pgWbWVBsl3dMqKCKNL/q3aEgD+9+Fi98J3B1JB0fq3dkVd5
	SPEG13ZHIzKHFXxWsUnpWCshs42mXMYTDZxWocOS1kT9taMAhDbEpRIP91zTpF/R7+7rDxDI/mC
	F+OdV
X-Gm-Gg: ASbGncvQZAVL/lXFGlGeesowHnm+RG3IyrvAoGE3CCSXMcsOgLfAtuVKnobeEtRIGrW
	uhGJhF3PYoAkYtvLoS7nN76aJbxoswelWbW+gj6iS9qXgocoH4+3GJOYRKUG/Op2nxBA00kBUH9
	cb44vt4aNiiw1PXvV0gOCJioKRhOiqESvv0rl1kQpgmcWygwBSv6ZKM/I479/JIYkL10TBgS9Dl
	e5LgPEIjYjD7U4IsMUUAZA1pWeKVt++da9UqkpKkUHqKBKzPCBeGT61Su59octWzGHrmigTX3JT
	QrYHLgfuL5l4pCH9XJnQuYCemiJYQcn0YAiSkdN0MpR17XxPpUo+Tuu6rET4tepflZJYNasYXtm
	rlxxmLr4051QuXe3cvrO6EFYXgoKXlodHMoPBara5kv0tLdMo3TE=
X-Google-Smtp-Source: AGHT+IFdGH+Ca3nOF3jsrfTN5mBnN8GlICWVgOgFiG1/Xv4yRCclCqVY5ksTupdhLtEfg0nqQsZ/vQ==
X-Received: by 2002:a17:907:72c5:b0:ad8:9645:798c with SMTP id a640c23a62f3a-ade1a9ed94emr1034602766b.51.1749464205040;
        Mon, 09 Jun 2025 03:16:45 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.40.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1db55c7esm529257066b.49.2025.06.09.03.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 03:16:44 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Matteo Lisi <matteo.lisi@engicam.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@denx.de>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Michael Walle <mwalle@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Tim Harvey <tharvey@gateworks.com>,
	devicetree@vger.kernel.org
Subject: [PATCH v2 01/10] dt-bindings: arm: fsl: support Engicam MicroGEA BMM board
Date: Mon,  9 Jun 2025 12:15:34 +0200
Message-ID: <20250609101637.2322809-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609101637.2322809-1-dario.binacchi@amarulasolutions.com>
References: <20250609101637.2322809-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add devicetree bindings for Engicam MicroGEA BMM board based on the
Engicam MicroGEA SoM (System-on-Module).

The use of an enum for a single element is justified by the future
addition of other boards based on the same SoM.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 Documentation/devicetree/bindings/arm/fsl.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index d3b5e6923e41..5feb62611e53 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -769,6 +769,13 @@ properties:
           - const: dh,imx6ull-dhcor-som
           - const: fsl,imx6ull
 
+      - description: i.MX6ULL Engicam MicroGEA SoM based boards
+        items:
+          - enum:
+              - engicam,microgea-imx6ull-bmm       # i.MX6ULL Engicam MicroGEA BMM Board
+          - const: engicam,microgea-imx6ull        # i.MX6ULL Engicam MicroGEA SoM
+          - const: fsl,imx6ull
+
       - description: i.MX6ULL PHYTEC phyBOARD-Segin
         items:
           - enum:
-- 
2.43.0

