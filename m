Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB1822AE5E
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 14:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748529361; cv=none; b=gKuHqTLjfarbxsOLwk8VCdca6huFx9dayxScI3ISTUWhwi5Q4xDC1zLT22JWFtKJ2UnANa98WDzBNYSLURIm7kWecA9xQkV9MunwskWggnhTLRd5JXrHVts92X3dRzoChTcFHTvvKNjAgIBItb1eClm4TJLHp/0jtDoyMfLBdJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748529361; c=relaxed/simple;
	bh=mH5Ygl5089WVcTFj/GthrjSoi47fh6ctH9y/5WjiSD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cGughXrBIo7jFYCE6F0F6TrmMdC+L18J6WVMn0vKM5UGIIdahnAWR/1D385a1nZoBf3FCaV4Mw233fjDB4SGHWRkIChqlfnUcBN5oDZdGA6jdGxLUw+oPttn6MO8i3xh3TWPxVF6WyJdPjrS3VT9bAT0yPXj8Q+gDIuSFG0NLd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=BzInq2EB; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="BzInq2EB"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-604e299b5b6so4019295a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 07:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748529358; x=1749134158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dqMa9aZLLZglShF07YRRISx9samkcW63UdIOcTb+9f4=;
        b=BzInq2EB01rktKYrGTYhTSH2o7XtJMnMa3DvEe7dLyE850ZVHxP98KdyTUUMXRB9z/
         LFAZaw6MX5Tc3gBXI/Cvl2IRNJgEVNJz9bBEjljmjsDvXxgMlmvQ8C7ZdhgjKV4PQBFU
         cm3JRHS9eBjcgZtM/gXFCb0qomm0uklnGpZbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748529358; x=1749134158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dqMa9aZLLZglShF07YRRISx9samkcW63UdIOcTb+9f4=;
        b=RzoAVh+IwoWbv/+PrGywTwntOcfT9T2VW80iSsy5PUKZS9FNPqaJurqN1F3JotqTws
         d1oRAICBHtfXgGKsz4nb1ZleBLh3g2MM1RjkoF8c4Phg+wPp/UiYij2/2WUhNTpoADYQ
         WPlsWtDZWMqwcslXc5ZzW4T5moEQpHPT0dhbCtmhBWAzt0vrP0aAHoR1Vb9Ykae2ebia
         z64dVfKTnvuNtuf2sj5qjCDSl33rsc/bSjFLReE9QKcKwHi2itvIoJTn4KmSTGeXu6ge
         kLjFQjAXfF1iq8fLY5w/nGUnY6H3y3fOgE9Tx6cA3XZuTR9U9mqn3HnXPOL+VytiIH8/
         ZPaw==
X-Gm-Message-State: AOJu0Yz7bmoVEJ+/Ri2COn3vB+X6IpXeTFkIWSjTffaJOwmUaq3zZRk4
	09zwEoHeoVLGHAwrA1NlVxVMOLLvZLj8m2pb3rbfeijuaN6MLfW93WJrNCq1yWHAFIwWoCzhn2c
	ASWOP
X-Gm-Gg: ASbGncu0cl+zPnSzq5Z3PbK9jupNomZp0lKTXijsPwo+ZQn1bPziKh3+2vF9XtFEmg6
	GTdYg1O3lJ25NykhBn04AFqPHiBgTTKB9O4drBlCkmk2t53YM/6zRNVSAB40WsrKZ74z/v51IKn
	ImU6fbKtiTKS+CdJYD9o66G7K/udxcqbOAH7e1kavjSPghnuOAepIrBWN+UhfMiqBt5RXyWqo9d
	bFVgMlJselAQRfLBnZ1UDqREk8QWFl+weTRCm1pIEHACoGjzakDmEZmornxg30AxlgMtTo5KWT2
	ny1VVFoBE1aCFCIFg/nuafy5fIw5NcPlAEYvs7tK3x76ooFZMmPwGmOFSH+5QBHVHS8eDeljT8s
	oecjkhPNdSXqhiGYr
X-Google-Smtp-Source: AGHT+IEpes4ZwctbD2SRNZB6tf32zXJCVvU8+v4TnWMlM5URevwLgFd+9HuMAb5V0GgnPGcW12AFJQ==
X-Received: by 2002:a17:907:7206:b0:ad5:5a7e:bcd with SMTP id a640c23a62f3a-ad8b0a47cdbmr384866166b.8.1748529357762;
        Thu, 29 May 2025 07:35:57 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7ff075sm154305866b.37.2025.05.29.07.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 07:35:57 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@denx.de>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Heiko Schocher <hs@denx.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Michael Walle <mwalle@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Tim Harvey <tharvey@gateworks.com>,
	devicetree@vger.kernel.org
Subject: [PATCH v4 3/6] dt-bindings: arm: fsl: add i.MX28 Amarula rmm board
Date: Thu, 29 May 2025 16:35:10 +0200
Message-ID: <20250529143544.2381031-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250529143544.2381031-1-dario.binacchi@amarulasolutions.com>
References: <20250529143544.2381031-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The board includes the following resources:
 - 256 Mbytes NAND Flash
 - 128 Mbytes DRAM DDR2
 - CAN
 - USB 2.0 high-speed/full-speed
 - Ethernet MAC

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>

---

(no changes since v3)

Changes in v3:
- Add Acked-by tag of Conor Dooley

 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 1b90870958a2..b67f0e71e4c8 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -89,6 +89,7 @@ properties:
       - description: i.MX28 based Boards
         items:
           - enum:
+              - amarula,imx28-rmm
               - armadeus,imx28-apf28      # APF28 SoM
               - bluegiga,apx4devkit       # Bluegiga APx4 SoM on dev board
               - crystalfontz,cfa10036     # Crystalfontz CFA-10036 SoM
-- 
2.43.0

