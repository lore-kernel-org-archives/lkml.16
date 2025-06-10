Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCD528CF51
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 10:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749549718; cv=none; b=iYw3HP99Am5WqyLOtkjxHVPu1WTO2kStYZHxum6ct4tndR5tvlbvGzbs5w+ez2FpwF21zWMyHF6PJp/JmBIgT9CguLXK9J4Jq5UPysi5olbHwlA67GcBrOTJ+FGLqvZWddwFprP3ukITBInljxkUkaLiHCD4Xh/67XvEZ3dcj08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749549718; c=relaxed/simple;
	bh=Wu0oggdHIMl21yHRrD1q1OTM30QUCT5J7qOjRFSBCVU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WhqUlOhIuo0hTf3bsECWMQp1NBqWst/jfUNzYv6hS/qiSxTh7zfsM4cNhU57Vgrst9XIRJ8/ZfAe+0RXefXKuH0CmWEgIOnkJg5r1ORfQZdSkMf+VIseJFih5X4IC/hE31rVEst9huNp5S8H0YDqBmGBbVqPJ1r90hRNtnnnnPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=hN3XBndy; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="hN3XBndy"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6077dea37easo6197299a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 03:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749549715; x=1750154515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g+CuR2t2agnTd143XnFYj6BBOX9cjwJ9yRR8SSRtGwA=;
        b=hN3XBndyLKreH1iDzNkb1aOuniPYZ7VoJ43FKEU51W99ac683tIeo8I4ZQ5CsVTRvs
         etlBEocfg0APdg+6gVgWKLLkhBIzE928aMlkFz4eezwaAwt8i9V+GbJxbO93IM010n6m
         7HFrhY2ovLP2wP+LXJ1dMHHn8C6zeMiTDh0oY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749549715; x=1750154515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g+CuR2t2agnTd143XnFYj6BBOX9cjwJ9yRR8SSRtGwA=;
        b=ROxpqGMZ+nV/3OnkwwvhP+ZuEUHMFzjzfqpc9fbQwofRzX2wjHekHrpV5GD/lac1Hv
         0uJeTbmBlU9ksHniA4Ngo/7OyHdr9hmzFYb9KBg5WQRMKzwImJ2ftkUg6ijFCAgnoDUv
         z+lX7lfPxdavXqi7hlxIlluoVIb5iCLVbtr/k+VAn5hgu2OnQlC2P2ZwJDVlGtEc6k3k
         Cu5QYqpr4M9Vds+mx82dWQEb8vz9+y45fT7PQ6pY/+0lARJn9jq4Rz2QBJ2ooDdAx05x
         +B/qt9a/XBB/BBUzwYrMVecweqdLOuqhFQi2Tq/Y9WkPifjXPxT3TQpuRRdWFxL+qfGW
         sRLA==
X-Gm-Message-State: AOJu0YzS2BKWtXgbE7MqJX53T+V7gcHj7ppsgBqwSWU4czeCwnm8CYBK
	D5BXgrDMdCiMOz9Q02BloBq2HEw4MHREZ5vC9BcrWibXn05AvPpAm9WRHoHeoVVs2Tvg9vYM7Rn
	jJHCk
X-Gm-Gg: ASbGncvFddTzp7ZthgCx81wxmEFsojDCGWC/DSHz9Kd/71x+zqQJaLBsCb9oO3Q/hKq
	+1/q/ZyhD05QneCqgII1p5o047JEAtR8m7JalZzvOUBU0Lq5JWpf6JfuaE0bPMz1oXfJDljASy/
	VxB1d9A5a9NbchuJDrc5KIjfCr3TAt290a6w7j9mVdZFDiUHM8LE5Rdz8jG+WvwCEd2oLVI24+p
	K2BTidC1Pgl6SxS5IuAI5kN2wczPbYxVaJsW3nNyrVfBtEUL6tYAVXgzoZE7TqNq5SSnHAjUBM1
	IqiQsRCfOyAKNJcc0reiGiwaI+nmFW5r1MViglSnU/XFjX3N5Hil3JlOsxI1TEYYB0HQ+TSTuyt
	l/GYgJ2GxEy3iHLIb3rYRVUDjSVE=
X-Google-Smtp-Source: AGHT+IE3bgkWoQ9nO8aNuMn9ZSpoWZlBdl446ax7t76j4zMgmTGWKmlQCyK3iwCOhkvKgG6kJdBnbw==
X-Received: by 2002:a05:6402:2755:b0:608:330a:9f67 with SMTP id 4fb4d7f45d1cf-608330a9fe8mr1072507a12.32.1749549714754;
        Tue, 10 Jun 2025 03:01:54 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.179])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6077837ed0bsm5953438a12.36.2025.06.10.03.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 03:01:54 -0700 (PDT)
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
	Rob Herring <robh@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Tim Harvey <tharvey@gateworks.com>,
	devicetree@vger.kernel.org
Subject: [PATCH v3 06/10] dt-bindings: arm: fsl: support Engicam MicroGEA RMM board
Date: Tue, 10 Jun 2025 12:00:19 +0200
Message-ID: <20250610100139.2476555-7-dario.binacchi@amarulasolutions.com>
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

Add devicetree bindings for Engicam MicroGEA RMM board based on the
Engicam MicroGEA SoM (System-on-Module).

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>

---

Changes in v3:
- Add Acked-by tag of Conor Dooley.

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

