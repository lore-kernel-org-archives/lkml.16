Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F6623F291
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 08:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750408078; cv=none; b=ENIQr5Zo89f5nX6ARttOTLapxA5/ejxDBtexxWO1FCjClnpvBLcxNq8HKhvlVSC5uqF5e3Yza2IB8fhVSXAePGC8JVZt52PmaZ35qrHmg99DPhDTHGcMD4DVl6eNJCha4reJQoBth4L09WHntxga9NDadv5IaMmG+4pZaqiZxdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750408078; c=relaxed/simple;
	bh=qquhulnSka10pNm4KMhunBjcmITpIZB5yNczgEe4vBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tbVcfrN1W6ONfu4G6etCCS2Ake/gRWkrF6HmkkVg2KK0Vht9j5uWWsbjc588wPNhurVSfjuG0/0ag8bDidxFB31js90OcuhyfuRUqZIyTeGYbHRW2+Dr5mdd4YOIYX7IjaUzVVJssfsKExUCC13n957mh8Jvkm5TJRBp7KCSKo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=ibSon8+m; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="ibSon8+m"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-450dd065828so11060185e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 01:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1750408075; x=1751012875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dkXssJqSMw9SFqIqHIUe8n+o26XtmSF6lvIk+oX9miM=;
        b=ibSon8+m4s/S92Gorsm7XP4PZhSqChJfLk3GY+t9pxAk5IE97k6vk8DvweuVA6GLOb
         F97mKOQR61Zl46JjfGx1Jv5mPlRx80OLxHbNO1rzBtjcvjqUMMLrEx9sxcPkhYYUV3Mz
         WLFdK1uocoyooqPuvoJ43f1KSCBxMdIe1CjsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750408075; x=1751012875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dkXssJqSMw9SFqIqHIUe8n+o26XtmSF6lvIk+oX9miM=;
        b=n6S6+XFVzIeCI9hStrJjCozrZgNHO87Lxw3MgQRY/CsaTH1qJejyuq8K1OOkynLvgX
         qOgpxqtpyMvEPGyGrM1oJUoeMoqgaBIhW/Qwem96apSIOP1Kbtu9N4cekaTIh+CJsn3F
         G65sJtDbtM8jOzuaFYK4tjNGbk8Wd2pZWDeuw8Erivkbdfpoqscny+wY1hpBi1EbfSXF
         Dvl9dka4i32P8PDLItZaNq+tJ14GW3YtMbhfaEQRTj0POydLQu5pL5Fr5R+WpEYBe2/I
         r4P+G4AnrrTUONs078OnGuVepMxPQK1zbfXf0Qto81Vj05uNLSyFO5ei3Q8er9NKah8A
         FKSw==
X-Gm-Message-State: AOJu0Ywei2v+YMwP+MwsF3AF9vuhRNDtoFjCpmXtTHthZgefrDNJARCv
	iOz/rjfL8pivSCk+72xB4cxdja3NnlYVRyrJ3q+710WsG2rqmu1D4x6zlgvC7Qe9DER2cfC8rqV
	cHXWf
X-Gm-Gg: ASbGncs8xtCUMfuCNjRA+mmYpQiveSrnvS/+cwg3qXwmujaAQ5Jj81JqZd8EqP+NOol
	XHCC4nWh+WIZ2GoSuKd0rF6IukWNWbzuUfdJAZ/Ez2ZVzsUwR11GHcnoopa7+WMm/oo2+HQsxvi
	NP/Sv7yljaUUt8yBc4+X+CoygsRvgEs87gDkZ8fkRr4j6WgcLGinWfmo6P1tdsADgOoAD1eW3Qg
	AWzPi+cAruPa9AeKF3ubv6jei+lDKUypOZ7FvRK1DxCprjEY4GNWbeqL8RDxua+tSjZkBeaW26I
	xQDcd/3hu+1a+LDM/F9N0ogsqYCdIdscwfL54hKV6C2tTWOK6xUgb4cPkkNPEnrDuGBgb3LskEW
	WWAaUJBQmpvxjsiHQuO9FL5zABO9ulJ4TUlmX1e1brZjFU0JZBfLp
X-Google-Smtp-Source: AGHT+IGFQMl1hH2r89Qpci7PZ1CRqOy0ferh+83VseM4EtuvEjdNqgh/2GHc76iC4jrluumTPDNsrw==
X-Received: by 2002:a05:600c:3acf:b0:440:6a37:be0d with SMTP id 5b1f17b1804b1-453655c3d4fmr17572335e9.15.1750408075178;
        Fri, 20 Jun 2025 01:27:55 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.224])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e9844a9sm52274285e9.12.2025.06.20.01.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 01:27:54 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Matteo Lisi <matteo.lisi@engicam.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frank Li <Frank.Li@nxp.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Michael Walle <mwalle@kernel.org>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Rob Herring <robh@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Tim Harvey <tharvey@gateworks.com>,
	devicetree@vger.kernel.org
Subject: [RESEND PATCH v4 08/10] dt-bindings: arm: fsl: support Engicam MicroGEA GTW board
Date: Fri, 20 Jun 2025 10:27:12 +0200
Message-ID: <20250620082736.3582691-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250620082736.3582691-1-dario.binacchi@amarulasolutions.com>
References: <20250620082736.3582691-1-dario.binacchi@amarulasolutions.com>
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

