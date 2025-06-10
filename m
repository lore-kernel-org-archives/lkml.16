Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5609F28D8C9
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 10:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749549721; cv=none; b=ea9UIplOso7u2dYTS4FsQdwpM4SqWu+lPE12oEgslOMQ9ipMb+0l2iHx83zHyeYePkPdViSOIvadGmlU8DeeqeABt7xCPDR7mHidfjbOi199bdXJB/sCzBCwTBnmbwLp/aTAniXgsxKkDz0UbBRIQO+6v1kHXdk2PmPwaZsIYiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749549721; c=relaxed/simple;
	bh=ajwul8elyJUy33gM+JOS0xdI8KEwQpbbj17fh8ObkWE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m0w5RPjEfa1Vu9ekcnYz/H/UKY/NRF8iQaP6xxuamqwEowNXkRof2yZvtTGdo4veb5m7iUUxx37mlg9wDGgu3TBvlBGw5xCH77raTUgJXNqn/FCVtHulRSAz8j5LOqQZXSZ867SbDgWyXseMvrDzksDh0crv/nUT5S8qKq8o84U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=VDBOry2I; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="VDBOry2I"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6069d764980so11469872a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 03:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749549718; x=1750154518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ud0pOGo+pPwbsh+KmRFEDBj7XsSmfxjM0obvvLY2GBw=;
        b=VDBOry2IrAdjTtsFk7utKLGlt0fX91D59Sy9nQJVYYHYBZqny3Hb2rmcaZW4UFdnSq
         jC0pPn9z9cg/dRXww48jZl8VfeRGUhZz7Ue9SBZe9sz88hd8tL+KpgGrm2olcWht3d0c
         r11wpcnlbo4vDJcE8a2L0NJAEwaoczpJSfsVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749549718; x=1750154518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ud0pOGo+pPwbsh+KmRFEDBj7XsSmfxjM0obvvLY2GBw=;
        b=NuMyR2i388stB4wHWLS+mXZjDSOzhVNnUM8XJmNjlXh+iK9R+nHMIkrMxtaeWwpmIi
         41M9awCeg/bS9Ym9BMvd/QnTzqpgeSR339ud+pqG45ewN7DAyshQ+DmxA5yek1vjEU6J
         4NHYvwilcmC+jB2hJRmPlh77A8SjM8uZJnxyPgDJdorqPbJW4i9dQ/mzsxHwLTfHnVjD
         Abk3QU59t7dZNFU/HN/5DFxFX57j790lUntAMJvMZMcskIQwtNhqHJfHtT35rPDNt14U
         NbNMotFhd5N8TxvjYyvCO8QbRL+67Y/hkEpOVZTehZxRv+NanRfAg4UyqlYssLtpbWQN
         L0bg==
X-Gm-Message-State: AOJu0YykibHCQVZhUt5Zpt9yc4bOrqBv5HTpu8xB3GjPl+QDNo2216UV
	agjGDG4+P+7oHQfxGAEpd6+6T/GcvY9hczpE7pQ2U+ZqXhuNIMfGPxe8R6DeE2C+K/rtaBi+/n+
	aywYc
X-Gm-Gg: ASbGnctQohkwIHWC4+l8IhS6l1BUWGgYhAmLVtKRS7xeokNRstoImk8iq7IyS++1+Nr
	a/nPWpRoT6uNasUySETngJDZDaHsJl9WBfdqtwR6YS4dsMgrN0e9z6xhVxI0yhvcyj7SZQQsD7s
	1PP1Vt1O7MZFdN+gjHXnJqz/botJ4WmU/OeX8lSG3Ee88VquVsMFatXVmLgZGwi8+ieIB2T/oZG
	LUcjn/AR56Nkb7AvgAZv0X2UzNJStHmGLQHt63BryoC+ZHkK7ZLnj/C9P0xPEAPc0/SEv4pY8Dj
	vO9cKd8fPTtPzMcFv2WjbbyHtWMirEXQeQXPTbD76f6uT137RzzK0i9epAvv4qz23lbHJYVcZLK
	CQDxrgB3GRYWRNdI7lgybYieIWME=
X-Google-Smtp-Source: AGHT+IGMS+hUfgI6LOBeveNqUWZ24WG/Hn807LJtdnldLG+zajSuz1AWN6szdkVSWL3Vez5POnXrOw==
X-Received: by 2002:a05:6402:3547:b0:5ff:f3f2:d88e with SMTP id 4fb4d7f45d1cf-6081868f8f9mr2475891a12.12.1749549718370;
        Tue, 10 Jun 2025 03:01:58 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.179])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6077837ed0bsm5953438a12.36.2025.06.10.03.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 03:01:57 -0700 (PDT)
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
	devicetree@vger.kernel.org
Subject: [PATCH v3 08/10] dt-bindings: arm: fsl: support Engicam MicroGEA GTW board
Date: Tue, 10 Jun 2025 12:00:21 +0200
Message-ID: <20250610100139.2476555-9-dario.binacchi@amarulasolutions.com>
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

Add devicetree bindings for Engicam MicroGEA GTW board based on the
Engicam MicroGEA SoM (System-on-Module).

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>

---

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

