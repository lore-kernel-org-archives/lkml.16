Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284909460
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 10:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749549709; cv=none; b=On5gMBZEG55RmH/PPbol2JpEH2o0HaMwDOwrC+gEUSb4Qds6tqYC6tJhFiwsq/RKP7qIIeMl8Jk4o+vOrInip0SRGNUYeCtUOUWh8JNT4obrcF5jr0x5XPmHpKRp0Rci+znpM7jMSN/qEood8RVfpyfm9KDpk+BknnqRikUJdR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749549709; c=relaxed/simple;
	bh=tjGpjjFiBa97auucGJvEEoBEE+LIjJlCsY/Rn88+T7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P+HlF9MSdF8jPpM5f06ITEQbpjqKRNmkRGstjcX3sbe15oUZgRHwhQCIJaHH9QsMKvHeFOw93xeBcoiT7llei3/nOvhykRsCRt+872oxEut3LfoRWmtXpvLHgQakxe00sfUAiEfo8YSuJsD2OXDOr0sWAGImv0mOQ8pxPNoBrHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=AMVrAUru; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="AMVrAUru"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-60497d07279so10629321a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 03:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749549706; x=1750154506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qzJn+q/i2HrP+0aEyadDV1AxemkoGFjRANAjmpR3dAw=;
        b=AMVrAUruiXDD2dyG4Y0le5MaTSlszo9A2oQDLR+T9F5ovjjdiavzUCOPcdDmZL5B63
         G25e2p8E+jLvnIc167e81+1IO2oDU6uBKtmHSV0AFnsyTk3wIzBgrFVdgmpQXq//iykL
         EPkSrkXh+KWEkBHQbqBcvN6ZNB2Zd0Eq7pF2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749549706; x=1750154506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qzJn+q/i2HrP+0aEyadDV1AxemkoGFjRANAjmpR3dAw=;
        b=SEaBeV84LkQbGvno51zVtxrZKbmzwPcni1445P4iGdeDFSXbaGA9PZSzI5V5BxxjlQ
         C2rxxjlB/y8bTKUDGQxq4B7c7/jVO26DOG7lWLSWH9sYsRaR4GMm1QVOmXhMGcAX1Mmn
         9raPIe7np6Yu/iuw8Ut0MiX2BujfCGgLBo2dSY+5RC9KN99ZHvG/J3mMwfbxPaQ6Ngu5
         QO5dsJK5PcgH+UT6DOjQ0ZNp1bOaWhYGHyKh11FQUtxfNNR3Bbad2El2rAmp3uTe0Bor
         U/FYGXcezttnrAolSSj/helnvYPHZFe7+sR8FbyAnxC2+QT+k/IXfpICZ3clDE8P4l/N
         +13Q==
X-Gm-Message-State: AOJu0YyW2JJR3MVHgYfmdYfKpsCH4quWTSkrzummmlNH2/eEaHD2HuIN
	c7EXp3tKX0gp555DKQzkQcrL2KmgVxm3iQtlXFp5tjVKU172sy/g1emaoGfNrg1be6YTvVe/Qte
	6Ik+x
X-Gm-Gg: ASbGncvQxb0Uo5+jdFASlPB37w7QqH7/lcEF80B7fqCqzkwu32CLJHXzdxz1necJJVV
	p3njs+TMiHQpITIQjTQ7bZOdOqjf80ACui3SClb4eQg/q2pw0l/sgjbiQknZ7wmQ7+7x54iDs+A
	UqskBRdjRsMxKpo1Wd6M/PezymZ1Yn40NdV4D5zOIVAQ9AtMs/XwhpcixCNDlgcbD8b85mqxSJf
	+dZX1Dy3zCF4f0iRVHxUoUNs5R8GaNzB+go2KbvXcliayy6bVR+XmmKFaCR2L5O03qRVvOKTIup
	GPQzD++twvtarJPz0rbyBvyJt57uBtHWnLvCdMHvnnZ9bm//RTUXHqd5eKDRjSr9wTmAkZiQoep
	DvBqnkZLO61sYWghStG6QBz13HuHd7TwJ7g5Dfw==
X-Google-Smtp-Source: AGHT+IFPQROOZiQ40HC/SHgHfRvdrs+evZuDMQZ7q11CzJM14kk+3LSIFz4V0o1jqTkKhETcRogRsw==
X-Received: by 2002:a05:6402:22c7:b0:608:f7:e450 with SMTP id 4fb4d7f45d1cf-60800f7e653mr4073397a12.20.1749549706134;
        Tue, 10 Jun 2025 03:01:46 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.179])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6077837ed0bsm5953438a12.36.2025.06.10.03.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 03:01:45 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Matteo Lisi <matteo.lisi@engicam.com>,
	linux-amarula@amarulasolutions.com,
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
Subject: [PATCH v3 01/10] dt-bindings: arm: fsl: support Engicam MicroGEA BMM board
Date: Tue, 10 Jun 2025 12:00:14 +0200
Message-ID: <20250610100139.2476555-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610100139.2476555-1-dario.binacchi@amarulasolutions.com>
References: <20250610100139.2476555-1-dario.binacchi@amarulasolutions.com>
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
Acked-by: Conor Dooley <conor.dooley@microchip.com>

---

Changes in v3:
- Add Acked-by tag of Conor Dooley.

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

