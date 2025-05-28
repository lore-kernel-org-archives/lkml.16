Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871F6283FC5
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 12:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748434399; cv=none; b=tNRx1+gb33vwcVzQ3zyVGiUh/PxwCRSmlXwCXIeHPSeEy1eEpMdU/S+oLdLD/HRJiUSKKt6L0uRV1xkDbpxanjeMt3FM41+chUPIznpWaRW0LMVBz+6XNGHewx0TmzzNiHp0Dk8L2WCmJwZ8bGS5YEdpSYBzdXCpOKEaGEKuMNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748434399; c=relaxed/simple;
	bh=tFUwK8osdkR3kQ55LeHDS1pqM9vMk8mtJ3mieIzJofQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F/KH6H6ek8tKji4QJo+j9N82tR9LQXjGOWXN+YRzObh9iA3UYK8WNaees7rIieaeFAwWwsawa+VmLMoadXZ9fDcfojN4YMMyt4IjMoDMjmYyzyiIMj2xkJSGekrithfguTRBB9ioHH++GIOtzlOGEiZL90bRcg2hMmsFTAuNZOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=YBC9dg2b; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="YBC9dg2b"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ad56829fabdso621068466b.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 05:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748434396; x=1749039196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fw04JnK5IoPkplJtwQfPjdHnamcMU8mHDxupSjYcvsA=;
        b=YBC9dg2bcCszhzdtTvqQ/drltrxRefW2gHFvM0UTTA0U6GqsBvWfb0JhDKu8mYcPDD
         ogkQS23hhXcgjtYvOfh/g7hepxYdsU8kHlJktSeL1Cs69b4iaIBF1o13UjX48Yqts072
         24QO4xpQF6saX9SX0ApzurGz1rFnRi86xO9PA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748434396; x=1749039196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fw04JnK5IoPkplJtwQfPjdHnamcMU8mHDxupSjYcvsA=;
        b=sVPUHIz3XJl2n0/UKm+0FqzPfAnij6FkWND1lF6Nb5oRG+k1HDrezrRHtHARDUAaKP
         ztWAmc3jIaBVheAd8ohd0zqHynVmoTLOD9b0j58AtDNahI2HSHH0UiZQqMGwNMNp+/Nm
         ruEes/UEmCVMxmp3eIEOtLVpZNXcazBa193LDvmAT96tagpsqAkSYP9fpdyfN9NKmOXF
         Td3sYYazkZ0ZLWL7Whvc1pi1dArAH48IzLzWk9Ev2b+3YOvsWbW+C9cMq4h8/wqaZZ4L
         nIzAHLC7v82sZrfKHwlRt/3EOa7vkaySV1dcTWORrKohf19qKfdx619uGku+pvXXYXMg
         k9aw==
X-Gm-Message-State: AOJu0Yy3s1HXsI5+DxQfwht+OSvaupPehrhGr8T4fj7pdVO2t2h6Li9c
	Z2J0omXVpwfyUv9kb0Q6pdp42dXdvwidINRwJwVfelIdTDeKBAUe+RUV4pccrlL791Lr4S8S2MG
	jkByy
X-Gm-Gg: ASbGncvhvErvOHL1UztXSC88Kc2Tckuchb77f6sJaTQLMfrevprTLWcgTTf1jGbzWOF
	khthm07psl3yzrftan3MswkYu8FkOXM2IZAO75HN9VN3+4o9De5mUPfbd2tvFJ3GKjL0LPEcIuD
	ftuTVFlw6wa0GXcQObJmGXmGSBegNlOMBYLjUve2NiPspkd1nM2xzkuoMvF+DxJpcaEXPV2ItJr
	9PtyxaSF884kab3Cr3b4K/VZjxLfG0aELUXGFTBjin59rQADV8C4u7Xog1Wogc4OXh2Ufmsldry
	ytHAu62oV845hmFKdgvERNCGgFZ4d2QaXZcgQXWJZVHDCquMtU+mBvCWLPfY5L0LBNtYdHoMwTZ
	iGr9qKJiDqMul
X-Google-Smtp-Source: AGHT+IHjHVf7EnkMIgSIuPbunpDiuFLD53MNNfAy8UL/f57+DzwfftpdTMBZSEsbPUhVtUknM6NWKw==
X-Received: by 2002:a17:907:d716:b0:ad5:6b8a:a0a6 with SMTP id a640c23a62f3a-ad85b319ab8mr1649803866b.58.1748434395702;
        Wed, 28 May 2025 05:13:15 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:5631:61bf:398a:c492])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad8a1b5b8afsm98523266b.170.2025.05.28.05.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 05:13:15 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@denx.de>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frank Li <Frank.Li@nxp.com>,
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
Subject: [PATCH v2 3/4] dt-bindings: arm: fsl: add i.MX28 Amarula rmm board
Date: Wed, 28 May 2025 14:11:40 +0200
Message-ID: <20250528121306.1464830-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250528121306.1464830-1-dario.binacchi@amarulasolutions.com>
References: <20250528121306.1464830-1-dario.binacchi@amarulasolutions.com>
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
---

(no changes since v1)

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

