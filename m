Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A8322FE18
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 09:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749719320; cv=none; b=ZgCnM80dCB2zZGe6BhTi86dePpCaYiaRBnzpyvyETUIrg9n2LLt8caVDGhk7iKWqx+HBOI6Bh8iczJayZZDodteV4cm0HseqbK224sji0Pda6W5uTwbHU0T9VzZ70yPjDNiPPfx61MK+9JmaXZST5cpJ7oblimnsLgo7MJ5+ajU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749719320; c=relaxed/simple;
	bh=YxFgDvHxfy4wrScb+l1g58rALcetSmeE8HAFFojcXp8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LdgwBN0Llp0415Sap0y75nxkZF7JBFNj/zhigHo2C7XjdOZJoMk5yGJHsk2xgc6dboCF+HnlhbU5dN+u3lAlmWbTtN96ywv/VSbTe1hJ6h/ym+NDZcycC/77rw7/qA/Ap7S7POBpPFeOB/ZAPQPotEu64zyx8dIRuw0fB/hSElI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=UxMBGiFI; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="UxMBGiFI"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-606b6dbe316so1536956a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 02:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749719316; x=1750324116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OE60H8an/td5GcTGMnbuvQU05tobHbDXITR9FPp9RlE=;
        b=UxMBGiFIM6O8F1G0NbhpWzlGfRLqfAfm2cKeoWB9i5/+LtZWO1VNZ+tB1sBUM8E5pE
         E6yXu7iJuhccFEpMF2XxFfDKSu1TufW9Ss0i+zojxrWyye7q82tJL4wz8sEfTwnwIgy2
         388gzMeZmbzZA0AGsVG7jsfs+dPeI1o13GcO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749719316; x=1750324116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OE60H8an/td5GcTGMnbuvQU05tobHbDXITR9FPp9RlE=;
        b=Z3+ePv6DKNajjrUHFxeJd9jOC5vMEiI5AAUx6e+3f81STdH/S1j/SPKsCSkltB0b2F
         SmH/GY4aLoIDIb5L6OzyUpFL5ogt4MFURRa8fW654Z3mD2Pl/YUWZ6D7wZZcEizlVQnl
         xn+YKEfTYHQ/XcjkX/HyUs81UQWRl/b/BoIrMlNTCi5KBY73ovyX2fZruXSbL0yf8kMg
         OhNoLfQ8C/H4LqMVExq9MmvR4MAP9qLAgNdaVKZAMD8sd4AQsVvQ3g5RXSqhNfRr19j2
         84nyVJqC/9YytPTvgCoRiDlhUySIt2Lf2W/jumO8J56z4ux6hwds03IIdtIaWhwoPAjA
         1QdA==
X-Gm-Message-State: AOJu0Yyg/fMHBSOihCC93tjfV0YBOuBmLgJ2+1uJfDveH9K4QBeP0vwQ
	IfGi8tauS71/ArJmxzpHScWMluV9qdayNf1g+LzsGUIKAN4PEhXQ6hQW03P1oNnAF47mZqd/rj0
	anj9/
X-Gm-Gg: ASbGncuep2++z5hz43RXJlFDXtqQX0Qomei1JFRKvFYIMm4p4EgPHZSgI4vjoVTlQXJ
	eTEqlX0DZCDfsCcur8KRWyBMzhTetYsntIjED1yZsdv/4HQGbp5gWt7ab0/bl9q9Uqrv49xyX1p
	qbclLYRRFXSlKCzUrYF7bp5oHKiaJcfphLgnk8dlyMV2hQA/htDaWXjnNofumJX6gO/04ukDV+X
	EWeIcl8nZiiftUShzyetLl1ypSLH79mPY6VIGVicv2qHH0vvkd81aH62Fr+LH5IRxwiAEoJL6ms
	GNnW2EswV1gwC7CXbfe77pnJv9MCKSCfvhpPqSgWO6jJQsjE/HbSLrBW1lcsGy8UCBGMuIGVlnJ
	SMsFvfKm7SxKU53IR+Zg1iESjMhljS2DhJCWb
X-Google-Smtp-Source: AGHT+IFcDn8H6yXePDjRLYWwZpyHkFaAuz+TfNP7U5ZpLT7TwfQNs0Ve8Q5TEbBgBhShu+X5lj3DUQ==
X-Received: by 2002:a17:907:1b1b:b0:ad2:4da6:f58c with SMTP id a640c23a62f3a-ade897ab542mr699899466b.46.1749719316389;
        Thu, 12 Jun 2025 02:08:36 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.38])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adead4cf274sm99933366b.31.2025.06.12.02.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 02:08:36 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Matteo Lisi <matteo.lisi@engicam.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor.dooley@microchip.com>,
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
	Primoz Fiser <primoz.fiser@norik.com>,
	Rob Herring <robh@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Tim Harvey <tharvey@gateworks.com>,
	devicetree@vger.kernel.org
Subject: [PATCH v4 06/10] dt-bindings: arm: fsl: support Engicam MicroGEA RMM board
Date: Thu, 12 Jun 2025 11:07:51 +0200
Message-ID: <20250612090823.2519183-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250612090823.2519183-1-dario.binacchi@amarulasolutions.com>
References: <20250612090823.2519183-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add devicetree bindings for Engicam MicroGEA RMM board based on the
Engicam MicroGEA SoM (System-on-Module).

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>

---

(no changes since v3)

Changes in v3:
- Add Acked-by tag of Conor Dooley.

 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 5feb62611e53..58492b1cd468 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -773,6 +773,7 @@ properties:
         items:
           - enum:
               - engicam,microgea-imx6ull-bmm       # i.MX6ULL Engicam MicroGEA BMM Board
+              - engicam,microgea-imx6ull-rmm       # i.MX6ULL Engicam MicroGEA RMM Board
           - const: engicam,microgea-imx6ull        # i.MX6ULL Engicam MicroGEA SoM
           - const: fsl,imx6ull
 
-- 
2.43.0

