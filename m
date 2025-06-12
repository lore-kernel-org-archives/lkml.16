Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66795223DEE
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 09:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749719312; cv=none; b=OP6o51jRvE0Znvj3+a8FuGsloEPRrIf6sn81D3nvlMMsG71kw9Es6xJWfrYiPun4lE36+1DBsedOVBrrnIiHtIEW4JYkKDepmmtTMHDIaEYag7QmMXvRA5BeJ1HAxzReJob5ilw152I1hbARcIj8ZthJvIuFH1gKp29py/6L3iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749719312; c=relaxed/simple;
	bh=2D+i3G15KhWJmzs9CLvtQ7hedAF2DHhxvlFywkAiVis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FtYbgmdpubxZLOJ0VATcsBiINctk/OESm4mHZPvfIaLQ/DjG9cvf4fhCAtBFW1D/dhF2YFPAP2svSejxg0yN4Jvv7hS6zlx+hdwBhtKOffDH0F8sh4vjh+XeCnNiMGYLl76o0fxSDF6+pNX7hySkZ3cxLboKKTXdHCCR0oHb7gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=mo7IsMvf; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="mo7IsMvf"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ade33027bcfso114450366b.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 02:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749719308; x=1750324108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MyOwHJZxAKroqQz4dfAYFqm5YCbbl731xMN7ncfMwH0=;
        b=mo7IsMvflkdlS+YF8t6ehxfeHPNINpaHTznM4EsLfRa5GXsl6byXlSKe3wx9wICScs
         44SucNYJISdnp9xfUvze/psIGlgSpErs3kpG5XxLgs/9YYVD8qiEt48/JeXwxFMcIS5/
         AOmozNjSTlI5mjlLa4Q6slcFSM2JCmB0aGtGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749719308; x=1750324108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MyOwHJZxAKroqQz4dfAYFqm5YCbbl731xMN7ncfMwH0=;
        b=CBHWj1HtS6dD3K853uP2O7UksYDYeUc5BMA/8crswoDn6fOcUJZ1Qk0DG6EbRoR5Hd
         fqSPzJsrPevEUPtESpuvqRgbO9Am7+vZmdZF4ShDkY212EjP+g25UVmB2kFp6qV+jZf2
         Lv4kcgckB+uB8q9tPDZv5v188QzH+iAO4B8R+ntkTsrQ7/+DpJKejH+aQA07+j6kGpcM
         AiUzaVpD9WyQ2O54Tkc6ARnYnoqMWqzEVKFvaPkjhxUoH0/xb+j36quK4Xm4F9AkTqG0
         eA1fMM6Xs8zgTxQkjjvD9NW1EtH/xbz1AtBNF80z6/a+IzBPVBxq3jZqCDZ2Y439nQRs
         uh2w==
X-Gm-Message-State: AOJu0Yw65Y9f+2wcHVX3ZdfnFUBbx9N7FG/LY+8oQCNCvjSRVV+J5gEi
	2/HQplPatZxCG1niAnYl1ZjArr4V6Am8ehRN9SjVHW2SHNrzsxP9z47jwMt5NcSMQM5Nq1xFEHR
	UMgGb
X-Gm-Gg: ASbGnctHK5mrAV6Y5a7GAKi0ItIxsTTqX8T+mvuOZygqt0Q4mD0tR94b75cAuBsTlqJ
	bYBKxmiVoaSNFxxxbgi+6Ucq9waYctpBtX6zL/FzxvaMkq4ZwyFs/K/hg5leA5DRS77BOjDdNKK
	AQag67hgeUxhJSkyRrZ3iGW1fU3YXgmhq6Ed/w/Dy8Jqugcb7u0aLEBrOwX2wcRhTA4vawIYPLq
	mpWcLa99s02pXoyqmrwUqSKgqS0SJDUIOXvtMZHqMRTDdXZOrQPWOu40I/IFHvhdlLRgGY9Wy35
	BEfHpaP2k+xreuotN72m9D710SQ19gkj7j4GVsP9fB6M9NqY45UUG9jskUSdOQYQpQuOdhHUsCK
	6OZtRms9JHkIewOJlYPJg/r0v1w==
X-Google-Smtp-Source: AGHT+IGgy7MfaG0CuUCYyXegR9nYgzxPQKyKhU7iG87w5yCta78UvdqFABZl7v4JXh+tKoWIwNgRgQ==
X-Received: by 2002:a17:907:9707:b0:ad8:9084:4ec0 with SMTP id a640c23a62f3a-ade896f3402mr602898666b.35.1749719308479;
        Thu, 12 Jun 2025 02:08:28 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.38])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adead4cf274sm99933366b.31.2025.06.12.02.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 02:08:28 -0700 (PDT)
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
Subject: [PATCH v4 01/10] dt-bindings: arm: fsl: support Engicam MicroGEA BMM board
Date: Thu, 12 Jun 2025 11:07:46 +0200
Message-ID: <20250612090823.2519183-2-dario.binacchi@amarulasolutions.com>
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

Add devicetree bindings for Engicam MicroGEA BMM board based on the
Engicam MicroGEA SoM (System-on-Module).

The use of an enum for a single element is justified by the future
addition of other boards based on the same SoM.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>

---

(no changes since v3)

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

