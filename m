Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC2A23ABBD
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 08:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750408074; cv=none; b=mkDHMZrn23wk/iOyz0sjSyEaJKLmO5t2t9MX0EdluufmDkk/4bPjCXffqTSn5CvlqGZFvzfxVSKngRzazxhuF3gBQJxad9fxVYdCsGFG040aZ0TqlDPiicI+XlD5BUfhS4I4TsEAEjIHqGMZo0OvphHSe4DNbcXzlepczjGDF90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750408074; c=relaxed/simple;
	bh=YxFgDvHxfy4wrScb+l1g58rALcetSmeE8HAFFojcXp8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hCexSexV1qjparqHsSaWwUdQ7TUNdDdS8d6D0M74qc+jADxWDHD/rKiOop0eIWVQHMTrt1pF5Xwv9k+2pB7xzzEbReZmHsfIiQ5/YGbPR7JsBTYFO6tEcOdLvQnQGaUIsM+n8g5Tc+0tCUmOgZuGhIvJa1XxcdceXqb4ZUCh/RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=ad8YTJmj; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="ad8YTJmj"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-441ab63a415so17173795e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 01:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1750408071; x=1751012871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OE60H8an/td5GcTGMnbuvQU05tobHbDXITR9FPp9RlE=;
        b=ad8YTJmjmfrBBh6eYyyI6nwj1KIOYgK3H2zdNAt3oLduPdq9BfIawAyDekhQXNc4tq
         JiUE7gIsbSXqGvBKtX2mSfQq2na7BWjd3ue431K9WdbDcA0yiSx7ScGeXvkTtyc5g3Xy
         pfzP/q5amtr+9iA4CBFH5rMRtb0NbttGMQWr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750408071; x=1751012871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OE60H8an/td5GcTGMnbuvQU05tobHbDXITR9FPp9RlE=;
        b=QGw8vFmZ6XEQjYuePmPpeFrBLoDdaDsMddvB0VWVSeRD2ocZ5J5T3sgqUqWS5EJzHP
         N1DOgYpeyEMDsezRU1j8kkTHUQ1HENy3KziCi9Yu+Iuj+Q9RdACgn/fMFZmP4pZJF4BI
         2jZjIyYitmOnlAPWHf9z+Bq+izNnJ7Ja6G76qVu92RrxOVCaKDNzWZI2QsIxM+wgdvPR
         E/BX1vTfgeoAfihaQHUg6iRxxvU2sFSWQ2OLSi8bwa191ca4H9yhBv4RoUTXp+JMmAr1
         LH8ALH11n52XwxgqUz60QwJJ9bhQyRTu36Rj2YZFpl/yJqfFD6A7U0oYOrZgUWAPv5zg
         dvHw==
X-Gm-Message-State: AOJu0Yznxe0imqAnAGIwF0oyYstVQuJeWWDtcUDbofzb+g166SCo9bEJ
	h3L0l1nzDM2OLsM3mWh/JrUd7+y1mSqmhkIWexond6EjR7AWQGPS107VVmkbhurpaqB0WK2fLNN
	Z7j7Z
X-Gm-Gg: ASbGncs2KcfJluSJAhuAbuOKfSX+8YF4dEtSG5yiRAoRe/ax0Z6zJLlFLf3N5i9i0ah
	+EBMJ4ebCtjer71iFDC0aTaYC5hkkCjKN4BC28opKTSXDQnLZthGipFW0m70jNJElIqg4iZji2e
	GpqUG8KkIXaDBYug+SAKsX583725usKvcs/ka1k+pNtKCU+53eGhyA/d6TCdkpMp16VjRlE0DnF
	zqhYkj8/kqlMoYOOltA9/6eN4Zftuwtz1qlQNzjyFoDUSt+RIKspVlu+WQeoL7f1NnzxiDOULwO
	gncoJZf5rY5hol63MYwIQjaU1B7dnVyac3QfzsoDR5AaIj26yvamwOXBsAtVRpjgF131T4Xgc1x
	P19HlXfLjYmqiLH/g+hruskZS34tzIYwTmbEgPuYplbozbqlK5yfR
X-Google-Smtp-Source: AGHT+IHi+BzPkv7chlZTxFeOkSPk4kqyihgJ5Phxbr2CKiqpwzTfLxjAIzJQmcdoM+rZ7LxYXD/OeQ==
X-Received: by 2002:a05:600c:45cd:b0:453:6150:de2f with SMTP id 5b1f17b1804b1-453653cc978mr15273915e9.1.1750408071319;
        Fri, 20 Jun 2025 01:27:51 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.224])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e9844a9sm52274285e9.12.2025.06.20.01.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 01:27:50 -0700 (PDT)
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
Subject: [RESEND PATCH v4 06/10] dt-bindings: arm: fsl: support Engicam MicroGEA RMM board
Date: Fri, 20 Jun 2025 10:27:10 +0200
Message-ID: <20250620082736.3582691-7-dario.binacchi@amarulasolutions.com>
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

Add devicetree bindings for Engicam MicroGEA RMM board based on the
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

