Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66476236454
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 16:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748621281; cv=none; b=TU8dZpmcPYoDVSoHV/omhI7WVD3fzv2DqXHmpRyQeydoXilqlgZczCRnDoFNEKrDHReMbCyHkQiiK+MCHBSOs0ksJ60ADMrHhPwtTppOYHdEoL9uG9CMACuC7cHIWy3d6RqkDXDQckYs3K0EwRHutT1KpzWWN8xdiO2It5+IXoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748621281; c=relaxed/simple;
	bh=mH5Ygl5089WVcTFj/GthrjSoi47fh6ctH9y/5WjiSD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FIjcDqRW1hzqUiyLyUZtaq0WXHXrFkiNv3d+7JlhJJXoQjuAKRJFcCSJJMVYnxwiA8/AMaPGya3bSkbv10l7YjGvqwa8kYLVGM4HG10W0xiiKS+Ud5N1c7xyVpiQJCIUj9djYb685RmGjcDJh0CGxgqGL2icyb4Hvn63gBFhmpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=FPVDQ+RX; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="FPVDQ+RX"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-450d668c2a1so7328795e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 09:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748621277; x=1749226077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dqMa9aZLLZglShF07YRRISx9samkcW63UdIOcTb+9f4=;
        b=FPVDQ+RXXEbOrW7MZ9nnfqn5M41bejF86sRQSeaLJQW9zWQpTZPAhvHiOBdQ1Wwnps
         DoUmaADr3w5wnOPYslikxAjgvfLrNfTXvXk8L3ZQtC9lzxYki6l3sNGh2C4GOKZWs43/
         h5VGNP5vG7XVoz+QFKgRNTbMc70sU4Yot52LY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748621277; x=1749226077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dqMa9aZLLZglShF07YRRISx9samkcW63UdIOcTb+9f4=;
        b=wk43c8FPaci/hImAb5S2c08DeYdLTEPPZADEciR03gwavQLgrR8CAAMjSKc5NyXac3
         wM08iMmgxjkf5re5Rzk59BU1H79qipLQ6sZDVwFxh5atyko7O5LaCJBPH2pGRVOD3kYl
         jdL8Iw6kUDCTHFDOwaMR6l8TgZV580v6o73bYfgEkp5++N+pYmnfSGYl6mZb8s4M4UQF
         54iC1l8r4egTHwx7VQ5CPkWLtAAGikvolvRMXVh/DoSzDB6FezfCB4IcnDfZoGT2lHNF
         gRtYccjwZfunKYCSFQwhnH3ttBL1/p1f99a285owXuHR4BpYemJNSf4fnLk2PXymm1Yd
         rMqA==
X-Gm-Message-State: AOJu0YxHNuyP4mniT0pRpCSg7ytNMK/hIY/1MamjrMMn8eylJDYwhCV0
	qHd4kovmLmo71+5Sh+9UJ+mRGM45zHXreFWbcY11diLy5E7+Qo0/33NIps7n8TTQvy0Kt1f3le3
	liWbf
X-Gm-Gg: ASbGncuaq/jAfLUCIwS0s1tNarUCJBldEEUwDFdeGgvV5dDa0XMrhjK2nnfGGNNKeNt
	VXslZC0Mczb6IE8O5hXvr2TrTEE8re3NLTV7IDBgkQeKd6awaDzjpvDX9VFQe3MwOos4v5zPCGO
	liEczogBaabPsOUXxOE5hkJljBKN9aUlbwHfJACsnpjq4AUq6FX2NMwI+cQr7AasKX/D8vs1znU
	NREzlmTQy8bo1DZ0lZmISOAE8sbfDAcSNM9fwB/BUjOhxtqz+8eJpiVY87CCqes+7RWr1NgLwVd
	E9bTAElIH2EJkz9cGZjis/K509GVLxtMPJzgMEJ6PU/Yhq2Eng7sFR1crJ1OhBNtCW6EUNQ6rsg
	qO8hS8qngFnte2Og2/Yv9gVctpJrVqVVJfeqFoOVm
X-Google-Smtp-Source: AGHT+IHmuBUc1HOBGfi1fMo9UepB/xlrFgTLLRVVChBOvFjYf3Ff7XCEd4unYE2huxbygIssnRT1IA==
X-Received: by 2002:a05:600c:8285:b0:442:f4a3:a2c0 with SMTP id 5b1f17b1804b1-450d6bb92ccmr41258895e9.13.1748621277548;
        Fri, 30 May 2025 09:07:57 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450dcc18a80sm9716365e9.38.2025.05.30.09.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 09:07:57 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@denx.de>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Heiko Schocher <hs@denx.de>,
	=?UTF-8?q?Jo=C3=A3o=20Paulo=20Gon=C3=A7alves?= <joao.goncalves@toradex.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Michael Walle <mwalle@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Tim Harvey <tharvey@gateworks.com>,
	devicetree@vger.kernel.org
Subject: [PATCH v5 3/6] dt-bindings: arm: fsl: add i.MX28 Amarula rmm board
Date: Fri, 30 May 2025 18:07:34 +0200
Message-ID: <20250530160748.2476088-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530160748.2476088-1-dario.binacchi@amarulasolutions.com>
References: <20250530160748.2476088-1-dario.binacchi@amarulasolutions.com>
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

