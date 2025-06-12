Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFE323315A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 09:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749719323; cv=none; b=JdQSHrlPXxaQt8fpnyTkuHlnpZS3QSkxs3P3za4joyCNAIfugsN6VtSKAaPfozGfm+rV+1hA1sh1OiqIHKs+Nwtx3KCLMH2aDvb65UDoeODUxUqHUJ3xPLbJ1sbo0rNrMM1/VqXGnJ4EH4FudPjnAN5D/LhQLS5D89aMdm20jZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749719323; c=relaxed/simple;
	bh=qquhulnSka10pNm4KMhunBjcmITpIZB5yNczgEe4vBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QqbNELWw0ujeeo14ukKCRqJCYVWMNTMj311+93vujbaWy+guaVcpZI+JSf6pHcmMTb5Pz5KoreXZd6uLKe9GQeXv7ZI3ZlqqmP6Z+oxGFKbd2MsOKbegr9147RC8l35/FtjPcMHbNcbtLiEQX7a+AtBQcHY7a+TVck7arijWKCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=ZauwnzE7; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="ZauwnzE7"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ad89c32a7b5so119142266b.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 02:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749719320; x=1750324120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dkXssJqSMw9SFqIqHIUe8n+o26XtmSF6lvIk+oX9miM=;
        b=ZauwnzE73AHnAdgKx3SL+ZdAYesuefTLEFqwV2ZacRalX8A8WYVidNfPH8r3zCdA+A
         9CA0oHSH8dOxdj4VuYROvHtZTZHdI1Uen29JqLFPnYPd+nNYdhkZGLCN3wjZOsNJ7umm
         L79nx6iW2JyT1wXgvTwwbzVrBpvdInnuIaJeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749719320; x=1750324120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dkXssJqSMw9SFqIqHIUe8n+o26XtmSF6lvIk+oX9miM=;
        b=odQhCikGtfRF0HfaEzVx1Cw98i5ASEyGVezIH2HIt577Pvcywc4psWoTfuvV4NQ6eM
         K/VtUv2liu6CszbhS4FoLab489ZqPRj+fryUZLGFOhDIro0oiK9sthKqIwDZnKfAXQBG
         kiF8N+GWd4C0AH/Dl3hrnv/SpgoNgWl9oP/lHgd5r6dDnuMaSoNnIvM/QiGdf/ZObGCy
         CRMUf0VeDcK/uQUlqwhbwvlFdjp/yVbn7qk9GRtMS88NhoQQdVkRZ1Gm0IWeTDpmiBBL
         52XRftPARaBIKT9xW+2r2vevK2A+x5PWNawcTcMpb/Hc6n9hN088keWi+/oPdFLwl3Wk
         GyzA==
X-Gm-Message-State: AOJu0YxEfJYWsHSEFoNrPl2FIDCZqZ5kIRdO9HigoEfx/w8AZDrk4mqp
	Q1rHtRhivAsbkGuupcyL21pKyOWEmGQ1Vve78eJeieh56t+bItWQvHC2uS2ytWrJWZKfrv53HNO
	Cemvv
X-Gm-Gg: ASbGncsbwHJQ7RFzy2t5l8TN2ASNmxCbtOFMBoF9UbvGoqK0uUI+BjteEEGdUG6v9zO
	5P1RorptUmBDj55BPhBGpjjDOaAfOJI3COSFhCmsv3d95gmBZk6bg1kp1UdBwdxGKym+kJbNP5U
	10/PGg9xQM7VcwvbPmyzkm/lvpkgQMZvFxC/N5T1o+PlBroIEgXwmjt/ryyXL9PmEL2xtA2j+A7
	xo2F9nkSx0GS2OZrjf2xksKM+SxqwXb7N+SXV0+ZnVuT8lIj1QFgjIzwmO6QObUzbs+5dAPQcNj
	+hGmZeMDrvavUyFf5ldwHE84LIjkDYznNbtyY/jAla+Ba5pHpVIEhYimvKzfp+Xq70IUrboJchJ
	CMUhSp7Hg5SFjXEMkidXZRujzaA==
X-Google-Smtp-Source: AGHT+IGezkrSmIAiPINGgtwck+Hd86fYa1kJIwPDGy5fuxFns0Y1GZDy2f56nyYpAeTg32AbaibLvQ==
X-Received: by 2002:a17:907:3ea0:b0:acb:5c83:25b with SMTP id a640c23a62f3a-ade893e6126mr615292666b.7.1749719319676;
        Thu, 12 Jun 2025 02:08:39 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.38])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adead4cf274sm99933366b.31.2025.06.12.02.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 02:08:39 -0700 (PDT)
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
	Rob Herring <robh@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Tim Harvey <tharvey@gateworks.com>,
	devicetree@vger.kernel.org
Subject: [PATCH v4 08/10] dt-bindings: arm: fsl: support Engicam MicroGEA GTW board
Date: Thu, 12 Jun 2025 11:07:53 +0200
Message-ID: <20250612090823.2519183-9-dario.binacchi@amarulasolutions.com>
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

Add devicetree bindings for Engicam MicroGEA GTW board based on the
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
index 58492b1cd468..99ff7c78544b 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -773,6 +773,7 @@ properties:
         items:
           - enum:
               - engicam,microgea-imx6ull-bmm       # i.MX6ULL Engicam MicroGEA BMM Board
+              - engicam,microgea-imx6ull-gtw       # i.MX6ULL Engicam MicroGEA GTW Board
               - engicam,microgea-imx6ull-rmm       # i.MX6ULL Engicam MicroGEA RMM Board
           - const: engicam,microgea-imx6ull        # i.MX6ULL Engicam MicroGEA SoM
           - const: fsl,imx6ull
-- 
2.43.0

