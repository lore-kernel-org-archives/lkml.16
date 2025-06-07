Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5100921B908
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 09:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749288839; cv=none; b=UMELwxxK0ytZcqxYMwhKsB4N6U8geqW4MI/88I7Lyg7fT2ww/jmJNt0y+XZzVzo54jmuUBQm3i2ryta6HaG5SGarPsfRUZc4N7Tq1eFhbVfbG6zqIptFfD8X3SFdRpbwZTqcKTz8ieoBjM03WT4FtDhxZ6Za5mkBV1UEPZyq3Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749288839; c=relaxed/simple;
	bh=hzT3vNgL1vWDpYVWZ4Vv9VCYguwOggONSy8Bpm6xvOg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HQjVBVRt2VQTCFRkjKg9v1lSg4PpDUBZfy98w9eD17ep3YrqmHLxoUm1bZlASQCQiOPIHYU5rIIMua+xcO09a3gjdOjb5DT3peKcAD1fn9Nprp6bHXvjNkrMCnBkyLjqVEgYHJotI+JgyDqLHPxFz4V6KnRdzKOoFzwuO9iIMAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=I1ejNc55; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="I1ejNc55"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-60179d8e65fso516959a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 02:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749288836; x=1749893636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5MR+dZbWYo4do6lj7ERY9jZ9tLxOFZiirseEEryjRVE=;
        b=I1ejNc55IVc7Cxdz5arB+XZ+Yp1SIwPmCSSjNtUbwEkHIQkPJuDemkUtG9Mc3VN1mc
         QikAM4LI8POOd4dUjueeX+NQX9MqECnR+Pzw0IaiMVbILvxEKN8snNH/ZPd0SG7qG+wG
         mXZmcptviJjR/lA979j4QieqTqkYo/ek0E2M8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749288836; x=1749893636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5MR+dZbWYo4do6lj7ERY9jZ9tLxOFZiirseEEryjRVE=;
        b=FkXlYvVxE/CAA+Q3mWd/4JUjvB3BIjpQ+rzj4KQ12YGUXP1nnoc4Eo1paINozafG7E
         Hm2jdfThTwtxiVwjD9Wi9nSc9nzZixiF7hv/9m8hUgAUgydjqx4vzNFqcmseMdikwput
         E5Pp/msRRAESxh59UVUpBMCldkICaFpU+qGpzFw/ZpEKGGrlDafKUMHhQo0Q5OE+jsCe
         laPBPMgv0PQUqj7vkicr8m7RmYRWrWsba2SPBEN+Dy0n8Lrqy7Qz99AWqJ6tBtGbldrL
         BynRpQTSxGCUTiZMKiT0rOnCUkK0KohdSKBl++I/EnoALtYmWU1SeVdK13Q5+dqzW2k2
         FQ7A==
X-Gm-Message-State: AOJu0YzgAny2mWicx8Omc1xFeUE8RTPUivLSA2bhcy2Ady1Hes3tyIL8
	ZfmPFDV8sgIl0RuIpmRcEPrWMH7zLXA0QvUn8UadlzMOepx2j9u76lHwOKuxblUKL/seDHi+pfi
	uwbiI
X-Gm-Gg: ASbGncu5IeWU3/a2531LVkpVAO5e3U7EKOphdYCBN00x9lYKicx9+vsCc/TokY74qhV
	GfanzPrQluNf/1UqdYh2cRhAjwRgUs3Mj3WR/AboZlZHucCFcuuG/gGVWma8241U7r4jL/cBMV7
	+FObgQV70i0FbdPY65DWO5y9s8Ud7Wym9eis3XHW7/PDulNr9UEFznlmuz7SaluGH8tB3oLUFW5
	nFan3sK8V5yFHrZOXpodoAh0TGKhMSiKZRyp6R4XLZu0wl6Z/QYX3Oh7/MNYw0NX2A/PJWW/d30
	1RSfhH6qBkpkXzH8YNCwR3SMZxiYE96Tw4wyjRYF+EWzxvZlRgNh43GJ+Jc/XO4Gu+XC/xxlIks
	VKNZnuLIVJcEkHfXxJLctnA0ZNCGDP94+DSxSi3vME7gU5LctBrdLEhkeZNeDZaC8FR18tf79CW
	7T/ELjhgfd9KZdrMGIVPvvmrg=
X-Google-Smtp-Source: AGHT+IFlHwQClNktEW9rU11ODeYPn4LafvV12ThMJYdILr+sWuVhLFbv21t3KR4w5K99ahlUqfYzBw==
X-Received: by 2002:a17:906:4fc7:b0:ad8:89c7:2735 with SMTP id a640c23a62f3a-ade1aa0fbaemr593115766b.58.1749288836475;
        Sat, 07 Jun 2025 02:33:56 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-87-5-95-99.retail.telecomitalia.it. [87.5.95.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc1c316sm251541066b.98.2025.06.07.02.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 02:33:56 -0700 (PDT)
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
Subject: [PATCH 06/10] dt-bindings: arm: fsl: support Engicam MicroGEA RMM board
Date: Sat,  7 Jun 2025 11:33:18 +0200
Message-ID: <20250607093342.2248695-7-dario.binacchi@amarulasolutions.com>
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

Add devicetree bindings for Engicam MicroGEA RMM board based on the
Engicam MicroGEA SoM (System-on-Module).

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

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

