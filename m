Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB641EF39F
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 09:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749288831; cv=none; b=QvcqFnIEDjLraAolCJithyy9PjoaedODfv8MdJBABf5rRRTOlVq2Ka4+iDp1s7VKKBm7dIzJDO87e824FVEqGfdii4FyDJ93A23rTRxccDEvmPu8p1YF8Up95O1OfQx+n3SRMhZm0xDI/rMedJukU61QEQColkbrVIkMrE7Ifck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749288831; c=relaxed/simple;
	bh=SBQeAPY2jCWIuaDPyoQAe4nB9J9JgxUIVRobCxy5elM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GpA9OkYv1LI9jd1eCkeN1oGurAztcp53JblaOAEeXRDpF2OeOky7HskeB/YaZDTMtILcxpRA3oeUQLXitkixstg8cSAkUUm7mtvcw7u2Xe4qJNYY0ItXrttSPPtNUYYWlA4s8EZz4aoUMHpyFFSGZlDWqq9F6cEW9QXc/3pSd3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=NLWTm/mY; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="NLWTm/mY"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ad93ff9f714so490825766b.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 02:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749288828; x=1749893628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rngjd5bh2tRBdUHUD+bEfCY8c64QncC0ZXHf3hBwFuw=;
        b=NLWTm/mYRWalR/lyBuNBhGIryNzg7U3XPxQwhWoJaS9nUSSJz5iMJtfX++ziD72/R1
         WJrtzjr8fZEVA91MTPrCliY2SGVkGRCxzV4zDcRieKXa87N5ONL2+wpuh9J9egzXgKro
         vG//mW5CZsCHAhO0f4gtiSz7isJRMia+0VwjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749288828; x=1749893628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rngjd5bh2tRBdUHUD+bEfCY8c64QncC0ZXHf3hBwFuw=;
        b=ozEo9Z288QQUtJYm/QfeJkL7MggcEdAy5yUAoSuJ8JyMQo8/RAUeQQC/7Ep7k/QrRq
         Hs1CeRPnJgRrYWl8eah9c5aomG0LH5cTN2nLiI7biJoBVv52Xw2zeQoGBJlas16tW447
         r/3jps99p3y9vS5rXVQ5A/e66sHAQhvO8bTseDdjwy5TTJ8jt0VmJ9I9h/Uti+k6etBc
         p8hYpHSkAM+Co27KHh2XRaYYz3glE0qFDJwUNhbgPrpizWO+1d8AAs7o1qJv/U209RMm
         tYnRzmQYoOF1/PKvOvy+N+nu9fYrRX9WoA88BIEMfOpS5ZfZ7UahE+XhYLjPiVIkjmzV
         tGLg==
X-Gm-Message-State: AOJu0Yy2uMQDsqq80l2qThLpn4Rkr3Wg8sz2XT77oTeAxqIED/Qodya4
	tfwRsHvjSig7CT9G/71UgtuweDaZyq/hWwjqGHoy+XtvLRWRCDPIwS80idUno1fDTJ3B7wEB76N
	ePEmG
X-Gm-Gg: ASbGncvfMRTtAG1sIvbcEuRtVifrc5nbOpNtmyNSRRI6MLRXfFPkYtawcmgtI3yL6wS
	Y3nAcNK1Mq0yUNbQp7UHDRDiCUDIOMCR3NTqUYNBthRWYvNyHcGsm6cMkIkEgk2CRMHcr1GNou/
	a4ZwWRZDeTYLmC2vcHzMtO0PE+dONEeNMMggpW99dCa3Cz68ZzYFDITHB1cik4eYrcRARjhYK/h
	+etHTF+IPpTysLtAmuITcxpN1WwuO3GH9piXSP/eVUMKvN5NPUu/SGD9ligDtZ8s0TAPn29M10r
	WO4Fs0EY2BBcY2Rt1j0lUcel4QAQ2Lh4dWJGM2jDCmFthPjs6qnr8oZ0b+oJX7Y1bOCYZBFbkNL
	lQeNW7ufGcakPoKSPUGNB0IaR6kcgbj6aQ6TM9YFHsjFdl+RRCXFCVYhXJI7aW0GIBNycvMPieJ
	ZKeebKVr/ceRNj
X-Google-Smtp-Source: AGHT+IHxo6mo2/XRJ37av3EkDkQ/u8UoQVvuh6NrlZH01Mn6soUScs9RnD9EmZexh8NntXLdgVr6LQ==
X-Received: by 2002:a17:907:3c8c:b0:ad5:1bfd:30d2 with SMTP id a640c23a62f3a-ade1ab326e2mr564111566b.55.1749288828208;
        Sat, 07 Jun 2025 02:33:48 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-87-5-95-99.retail.telecomitalia.it. [87.5.95.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc1c316sm251541066b.98.2025.06.07.02.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 02:33:47 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Matteo Lisi <matteo.lisi@engicam.com>,
	linux-amarula@amarulasolutions.com,
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
Subject: [PATCH 01/10] dt-bindings: arm: fsl: support Engicam MicroGEA BMM board
Date: Sat,  7 Jun 2025 11:33:13 +0200
Message-ID: <20250607093342.2248695-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250607093342.2248695-1-dario.binacchi@amarulasolutions.com>
References: <20250607093342.2248695-1-dario.binacchi@amarulasolutions.com>
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

