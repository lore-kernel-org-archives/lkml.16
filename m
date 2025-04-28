Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A042621325A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 20:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745873989; cv=none; b=Ui4bdVJTLM05woaB8QyzEU7EpuL+SyrZOd4qmw5nowcjRxnbuejBhgRA3kVsPQxthig7a1dJ/N9bazA7+Uim4mh5eJEz4u74uNrnAJHm3P3ZBUO0w1i77/Ov4AOv2vWaQvXDyG5mKM5Kqfahz8hLR/g6zPl3ou6Ptj0rr5p98Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745873989; c=relaxed/simple;
	bh=ARaJN/laTWSSwP+pW1ygay2pt+8PIw/fbx6nDgGq5XQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mUGEaG3Gsuh7IxE7Pnqz6PGDdvLymZlI6pVPv5yFec1QIEQNFrX6aqtmbzj8elET0FVPsxE3/oEb7QaXxxYaw28qwGoeR87W3NHUd9e79trhE2H8MLHJ4hob9l/X/fpVez55YbcBMUW3daMbl47ypW8rAsjJmtDIjBf42Gt37ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=VZp/b/zH; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="VZp/b/zH"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7302a769534so3673610a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 13:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745873985; x=1746478785; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EPm/vbZvGk/XMsHbJko6sUgnPY0qOBeRTAo3Ld3TAjY=;
        b=VZp/b/zHE/IG86D6caMqm5lx+/raSCj2sXRTtWuG7wtXVOtAbawsEa0KRHazppsNhM
         +f9TQOfWO8bGZob2RkYETSgjXpe+C3p6cmIqvwMIfgtzKdJN3g7wbDeALKulw/viu9aY
         X/JUM1N74bUlskgSD7cno/siCWXbI5Fc6X33TmKUbZ88oGZb7brvzkbKP4U9ids1m3TA
         TzqvSAKf94y6qqm2s9atxoB1dm167YNkQwT/TZbdeh3OfLMppZr8QqY0ebNMKbX8yIzR
         inmU1btuJ5Xk7Nd/bh7f1OL3eARG/dlaIFZ9fOi6JUxPq3yl0JYBZogX9cOSZRX3/91r
         p2dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745873985; x=1746478785;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EPm/vbZvGk/XMsHbJko6sUgnPY0qOBeRTAo3Ld3TAjY=;
        b=eVG5xMx0+x4rVDSbC1kcVdqLp2QTbFC3Bnb27uVGas4y40eqtaH37MS98qtg24+k+A
         gj+IN/FxwkxFSqpS023mFOfy4KEC1v+AXsce79NrOGcvmbFfo9xFQ6fpvk32oSOFLqm+
         M+r6beECaTzLeWHbTyBAWl5CqMfnFnD7kDr2WzAh8y7p0T38upGkJgo83o/5Vjoh8TXb
         DCTmGyvxfxbivhC44oAxym39CLd8vDainZ/TacXNg604kW8eiqvxmGkOLbrYO0lFLKmj
         pR/DhkrEX6pQSDwir8Q268jMpaE1PXgBXse7sbaRgkKlPpNyqp6zWoDaBQxajOfI9/26
         jQhA==
X-Forwarded-Encrypted: i=1; AJvYcCXadjHK18ffnD+io9ypVbWjlxnbPe1ei6t+l0P4FCFT6P00m7OtVw9jrrGySIQuqulqZWCnp8cZqyshCcI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrpun8Al4D7V86zU0GtR6O4UW9ujnliX6htHDb7+LJQloYCExl
	YF+aL56nIVFEDbmVrYACUZxT5XlbLtx0pFwS09fBotGu18OxoVoD0FgBzCTI5nQ=
X-Gm-Gg: ASbGncsZYc1BdEP/CdWmF687XWbexUVAI3AEn+loceiUIQtjkzJJDJMODqlbi/+K2x7
	1DmajtI6jvQ6fBC6TRzRlT4FhDONLoJ/b321U1Wc7IKvqLWLV5GLaC0QQtNUN66exxsnKSF7JK7
	I7MaTWmcM8afy4Vvy4RuJjhdBQ7lyMFIUe0oZ3q7oidGmL3Cwuqfa4A3sHBqKkS8quh0vSMl2Ls
	NSgRfOjP9Sgp0P/mpAWho5wvtiB62GDnqzX2Zvzi2igjgQL/D088MhEWtCg6oAnaX4r49O2Ms1i
	ga5vDaGcQX+/rUrxTRXcGV/4b4x64pimoInKn63mYEM8Krg=
X-Google-Smtp-Source: AGHT+IGtUrL0vdxDI0xO+GerII96y3Pa4pSQsQzyvLDIuSbvj5q60OHBh+zIXpgdsShHxvLkTCZG4A==
X-Received: by 2002:a05:6830:6014:b0:72b:a9f0:55 with SMTP id 46e09a7af769-7308a4f12f8mr150300a34.6.1745873985641;
        Mon, 28 Apr 2025 13:59:45 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:cff6:9ed0:6e45:1ff9])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7304f056ed8sm1907614a34.0.2025.04.28.13.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 13:59:45 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 28 Apr 2025 15:58:58 -0500
Subject: [PATCH 3/4] spi: axi-spi-engine: optimize bits_per_word for
 offload
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-adi-main-v1-3-4b8a1b88a212@baylibre.com>
References: <20250428-adi-main-v1-0-4b8a1b88a212@baylibre.com>
In-Reply-To: <20250428-adi-main-v1-0-4b8a1b88a212@baylibre.com>
To: Michael Hennerich <michael.hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3108; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=ARaJN/laTWSSwP+pW1ygay2pt+8PIw/fbx6nDgGq5XQ=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoD+wtKbrM87Br0iUTrX8PmS0qoypqR5/xwfFbx
 5+1urDsIZ+JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaA/sLQAKCRDCzCAB/wGP
 wGOQB/4lpOzs4u45Rj068DI3+3h1J80plwy9Pty6NFrRY9Tw+fylYlbbZcG11h3z4W0ivm+bt9U
 x7tzdi4H1R9LVPUoKkHEvKTPcQopzKNVPbdJNFJJG9+X80j9p08y4hplGSG/xTnKrOdS++xBaED
 KoSd4sjkHF10JeIpSjwmSiu5eACx1tVzYeVvM++RzPAPe5epKUVh3u1jCX240afaIaW2SKSamaF
 3YGTeZFT+gufYSO7CQ9jI56iAKKmtw5Yu4GCmfzbpytdEaoTWAgfOhT4THS07n56yee8uqZOg7f
 mZsMRlY8B2orYX9vUvAzxAiF+IIpcZOUXdcEnAdYrRwYaYN9
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Add an optimization to avoid repeating bits_per_word instructions in
each message when using SPI offload. This only applies when all data
xfers in a message have the same bits_per_word. In this case, we can
execute the instruction that sets bits_per_word when the offload trigger
is enabled. This is useful e.g. for obtaining higher sample rates on
ADCs since each message takes less time to execute.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/spi/spi-axi-spi-engine.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/spi/spi-axi-spi-engine.c b/drivers/spi/spi-axi-spi-engine.c
index 05ef2589f8dc0bdaa1b3bb3a459670d174f821a2..b54d2e1437c9993d251aa2842d9040ec0949a78d 100644
--- a/drivers/spi/spi-axi-spi-engine.c
+++ b/drivers/spi/spi-axi-spi-engine.c
@@ -142,6 +142,7 @@ struct spi_engine_offload {
 	unsigned long flags;
 	unsigned int offload_num;
 	unsigned int spi_mode_config;
+	u8 bits_per_word;
 };
 
 struct spi_engine {
@@ -267,6 +268,8 @@ static int spi_engine_precompile_message(struct spi_message *msg)
 {
 	unsigned int clk_div, max_hz = msg->spi->controller->max_speed_hz;
 	struct spi_transfer *xfer;
+	u8 min_bits_per_word = U8_MAX;
+	u8 max_bits_per_word = 0;
 
 	list_for_each_entry(xfer, &msg->transfers, transfer_list) {
 		/* If we have an offload transfer, we can't rx to buffer */
@@ -275,6 +278,24 @@ static int spi_engine_precompile_message(struct spi_message *msg)
 
 		clk_div = DIV_ROUND_UP(max_hz, xfer->speed_hz);
 		xfer->effective_speed_hz = max_hz / min(clk_div, 256U);
+
+		if (xfer->len) {
+			min_bits_per_word = min(min_bits_per_word, xfer->bits_per_word);
+			max_bits_per_word = max(max_bits_per_word, xfer->bits_per_word);
+		}
+	}
+
+	/*
+	 * If all xfers in the message use the same bits_per_word, we can
+	 * provide some optimization when using SPI offload.
+	 */
+	if (msg->offload) {
+		struct spi_engine_offload *priv = msg->offload->priv;
+
+		if (min_bits_per_word == max_bits_per_word)
+			priv->bits_per_word = min_bits_per_word;
+		else
+			priv->bits_per_word = 0;
 	}
 
 	return 0;
@@ -306,6 +327,12 @@ static void spi_engine_compile_message(struct spi_message *msg, bool dry,
 	if (msg->offload) {
 		priv = msg->offload->priv;
 		priv->spi_mode_config = spi_engine_get_config(spi);
+
+		/*
+		 * If all xfers use the same bits_per_word, it can be optimized
+		 * in the same way.
+		 */
+		bits_per_word = priv->bits_per_word;
 	} else {
 		spi_engine_program_add_cmd(p, dry,
 			SPI_ENGINE_CMD_WRITE(SPI_ENGINE_CMD_REG_CONFIG,
@@ -862,6 +889,11 @@ static int spi_engine_trigger_enable(struct spi_offload *offload)
 					    priv->spi_mode_config),
 		       spi_engine->base + SPI_ENGINE_REG_CMD_FIFO);
 
+	if (priv->bits_per_word)
+		writel_relaxed(SPI_ENGINE_CMD_WRITE(SPI_ENGINE_CMD_REG_XFER_BITS,
+						    priv->bits_per_word),
+			       spi_engine->base + SPI_ENGINE_REG_CMD_FIFO);
+
 	writel_relaxed(SPI_ENGINE_CMD_SYNC(1),
 		spi_engine->base + SPI_ENGINE_REG_CMD_FIFO);
 

-- 
2.43.0

