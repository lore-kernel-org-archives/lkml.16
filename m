Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752B820C038
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 09:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749288843; cv=none; b=jxUOgAHRaakP15I6HnWS7+i4w0nrtH0sXPD/Crt55DkSVnv9dvJBD01fBsMf4K/tZduN4tacXFI37I+Trfn0/0rUdI4qU30hmxsoYSfz9+PXAvCHGv6477mACo/YqB3X02eBCuzbI65QH4FNZkUDpQidt9BH3hSDdVp9lpNi0rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749288843; c=relaxed/simple;
	bh=Yqcf5TW8YfhX69k3zXNVG5GmujWRH6hO2eu9bkjbyko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VXeXzEDnDgfX0qbMpX3Yf7KB8HPE6BgSkkg3A/BlN35ZJUhEhravgRBe2NDxAOxiqRM5s3LYSpl6u1nU4zBZRGT/zhT7B1q5DupBF7m1qyeBP2cUQ4gNFvpHugq4LAqERruLAjQNJCN14f7TkrEc5gws5LL7A2OucZiPt6rMfjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Y+l3m40m; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Y+l3m40m"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-606ddbda275so5264770a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 02:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749288839; x=1749893639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RxEd2AdkeiCCeDSCFcPyL7zgCyiOfRVYJlDF1i2IoUo=;
        b=Y+l3m40m1koX5tcv82yw3gJu9lVFoOxqmPU2bNqBfiD8ukaTJolDDv6AXhuWSPesP0
         87tc1WSDwqYAZvhAzpPj5aeDPNf4yeyc9zgyJ9ejpBZNPKlrzk9eEwsuoI1iUEB7tKRg
         uEoQ5N5eTzmToy2Tv20jV0w6pKUlDkifamhXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749288839; x=1749893639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RxEd2AdkeiCCeDSCFcPyL7zgCyiOfRVYJlDF1i2IoUo=;
        b=nFPzLcrm0hITa2S3VtcM5wi3eY2z33lC5DBRx44g2jNJat0Y1RKH4Tyebjsy7x804N
         i5IHusFyBqxcxw524zKDXm/Ru7ek9VwGj6fsZS45O2M3WMrvSDt3wby6nAlV3nTl5c9I
         i8pK87P/k9ZzSEapButh8cvhRVn//HKZQT3vVZfOcj+1Qb1mXia/2BDKbadywDWm//hL
         pCr081IXWVhnd/zT7BD/UBlXeTv1Q1QOu/ivNZLpfM8A3/Y/u1XZk4S60eMiOIDML1WX
         Z6DikfGq5gX65R0Etlms9HKQwJPYm6obHOGV4eDT9tpMFUp04Vrq4aVoAzjslg1I0ISS
         gpsw==
X-Gm-Message-State: AOJu0Yz3OcoalEL218/eVuwhSYPOnIGG/wlex3h4r5Tn2FhNqz54HijG
	mxiaT/O0Ps5y4UpIq70H2xoSExn9z1A6JqwcyTJKyQHVqOuVGQLUYp8E5rnWo8mXkvXGegSiSOW
	wll0Y
X-Gm-Gg: ASbGncvDqsg9LfBRCru7rzjUe9IEj9yi3QcTl6kkmoDYzmH3GsawQlxcRyN6zosh2gN
	Qb+ntm0Xkg0yteQdaop7EYGQHTN0+JGJH2hhXqn59znQ6MX9Q8HIPu1dbdL12UyYtCf4Lz/t7Su
	Achu0/IWlQauJ+5Akjekegsum1FJimQyI6wB1qLgTOWDBpcTT5msb0FF7mYhHpLFLskGqKtmZS+
	1sI4bjCNwl4M7UT1/rqcUu14S7R/1qPKG+YcXCMuPgHaIeSlcLVTBzbWCt+Z+m2yavZ13rBqSZ2
	qy0y20+DP9ZNmVyAHT1UvzqGrtYoQ96JKta3W82vSLKc1JnLYklfXgU3g8GlZh5kQ9BSR1KQNVx
	pALfLkwM9J5PpiLNBQsFavmi1fhGEWGNBMu56TMmGRudajkSgnM+J6ydRl63gykhiiYtBSs9cXJ
	Z8SUcGCi18MD69
X-Google-Smtp-Source: AGHT+IGYbydEgnGk8F6YGGogCA17omQe2S98dizXcs3JVp65SK75LQ489PZTWGPSh2pDxfdX41g3zQ==
X-Received: by 2002:a17:907:97d6:b0:ad5:c463:8d42 with SMTP id a640c23a62f3a-ade1a9164acmr631030366b.12.1749288839580;
        Sat, 07 Jun 2025 02:33:59 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-87-5-95-99.retail.telecomitalia.it. [87.5.95.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc1c316sm251541066b.98.2025.06.07.02.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 02:33:59 -0700 (PDT)
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
	Primoz Fiser <primoz.fiser@norik.com>,
	Rob Herring <robh@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 08/10] dt-bindings: arm: fsl: support Engicam MicroGEA GTW board
Date: Sat,  7 Jun 2025 11:33:20 +0200
Message-ID: <20250607093342.2248695-9-dario.binacchi@amarulasolutions.com>
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

Add devicetree bindings for Engicam MicroGEA GTW board based on the
Engicam MicroGEA SoM (System-on-Module).

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

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

