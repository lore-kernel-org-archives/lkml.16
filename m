Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DE120FA9E
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 20:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745873989; cv=none; b=AE3v+A3PqABA0OMBkbbecVwF2WQW4t1/hqAPfwdc9xw2WJ2T6ng17dwwUSpgkcaUdYHdfNWoshmb2zNtmBbuLWol8n/f1gghOUN43qeraAq07c7WgcaI1rx3wa82F6Kj+rFm7KdXNvOQ7qF31bm7+xJVFbJ29e9TVmu7gL5Pi28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745873989; c=relaxed/simple;
	bh=Hot0Oy29xwQca3fFwNhjd1qoO8ecKD1UEJkmEF7N4c4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TmYtI8Hx6PPOfbrkvYpOJxxjE4w5mD7CZMPVIkjbqSJ4NsT1duQJasGl1la+ANLVIniylw3rEuSYRoFaWL1JjC0PqlZdAKzoQMleQgd5EbgW3F1WLUMOYaqPcHArPfTDurdn/MBRbX1BdpKnO71y0/ZXGbdKB1f/nsKGMpELL3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=itgL0QKg; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="itgL0QKg"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-72b0626c785so4546204a34.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 13:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745873986; x=1746478786; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cgkMltK7c0hJCGj044bGbv6mIEyEY9fELxtEWcXT/oU=;
        b=itgL0QKgQ3EwXiXtNZ0zY0P2e4pxyMaUHgh48B6FeSS/60KzGQ5C+tMDBy4qL5/dyd
         pwca0p3XgvM7xKSpucs9npVeUJFEA7pR0rtuOrrR1pcKGPGO09pIUl48DNd/to2RGH/k
         SwSHN37Zgjf495bhNkKvrM369WPMTuftoNzbbsPRurkf0TWt9SvLLw+SPft0DBQ4gAXQ
         80Z4f01IewNqN3y93G87wUxPxgfhJK/zZL+pDdo+Sz4+lbQlTUD4pz9ECxFBfoZzNNP2
         +akBoN2h61O7mwiqSNfRYpz0Sor0PLa9WHD6E/JELUJuE+ymMUH4DbfgNwQMjYEf/GY5
         Ak0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745873986; x=1746478786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cgkMltK7c0hJCGj044bGbv6mIEyEY9fELxtEWcXT/oU=;
        b=qXxQ5ek3CR6w50/WU8Mlcpy+nr1PYub1rtNo14FW0weciTu0XIOZlzY5tgmzCa0wIU
         B6JC+Ss5EuHnM1Br57IPp715R3tLpupMcnDd8rTUHGQgxgRFMwMpuZgknpKvlbJGHgr+
         TZo3xp3RZ9h8c+rXTnePharQpgV/T1zxKJvA7mAmFSH3nZjWRbNNJlHkmYyAPwPl0I+Z
         On0jmYeMeO2QFkqgiijAVfI2YXubOE7itvHBz0F7fdquiLPGpeDvlj4SxYHlBo44O55o
         /jQ0ipZDOr/p5oN/SpFo7cXGW7Km1AzPZK5LRC2Du+NypetIkg9dTgSv6K9S6TUgDJgr
         ym4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWks0t/jTn1D3M2TNB/i1pm3zxe6GVa4sPCbOQvbJkyyErg7D40T/zSjGKSwAttbSKuoCM5XAsZ9jq6ya4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOBq/lZd84llbyrm0pGnx8EQyhJUWU6T/vq24SWc3SjygmI0VW
	k8Qwq4DPP0fBKSBgZA+LbIgn5LxhBy3H9UPspzybuPiM1/2oSq/owcr2BywhK0I=
X-Gm-Gg: ASbGncvob7hfq1fLyl/kuIanTzLl/QQS6QtyZI+94veWS3R1r55In1PTnmwQwDEqu6Q
	JNoeMRmPpsAXe8htcMbhGGH3WYTIpyF70Ng+2eEmUcO7VxzeW6uPm+7HHK250MoJOiX7gbCY8P8
	lf5xkHixhdFxG6T38N/MtyWco1G9LFCXwhjTSFY3UX4PKFkBCfrmclKNFbtyKtBlZabyPx3s3nX
	Ws0JFM2yBTqsxkxP2TAAdPS6947AWu7O+7/ZrLP04/72o1Wf+yEpd7zbybajqwkyxj69+cs+D0r
	nQB3GyTfWS6hmIIm1FB/CuhN/YPXLfWIVIWMpOaOV7s7u8c=
X-Google-Smtp-Source: AGHT+IHBjFNxaxXK2uTmSjmKOErKMPwPnwLBjXcUoUMiKswS0jvYT4ChJ1QEqctONlEWTN+lPYxlFA==
X-Received: by 2002:a05:6830:6409:b0:72b:9f90:56c5 with SMTP id 46e09a7af769-73088c2081dmr736664a34.17.1745873986383;
        Mon, 28 Apr 2025 13:59:46 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:cff6:9ed0:6e45:1ff9])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7304f056ed8sm1907614a34.0.2025.04.28.13.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 13:59:46 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 28 Apr 2025 15:58:59 -0500
Subject: [PATCH 4/4] spi: axi-spi-engine: omit SYNC from offload
 instructions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-adi-main-v1-4-4b8a1b88a212@baylibre.com>
References: <20250428-adi-main-v1-0-4b8a1b88a212@baylibre.com>
In-Reply-To: <20250428-adi-main-v1-0-4b8a1b88a212@baylibre.com>
To: Michael Hennerich <michael.hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2495; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=Hot0Oy29xwQca3fFwNhjd1qoO8ecKD1UEJkmEF7N4c4=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoD+w1ncYpjs/q9honQUN28D/IU3WXnD229sq4z
 jF3zy/aDumJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaA/sNQAKCRDCzCAB/wGP
 wIC3B/4rdKjJtlFDToqOrIGe5qv6sjXRM3wxFOP9IqRUQMZE8T9KxJaZp0yrem7LI9g9scVAUim
 0oxvvokQ4GE+kFm5pCCLzRThx8kdI17Jins1k98bKAH28wrBFNGM9rhcLlnSP98z8V1KUNOSaFs
 Rvu07RPaoGNETx9Zag6QaaKld9dmpfLTDHX0lGeP/WbyXBXtOLsJQaMZxPMnet+8BBveOZI9Ou2
 0OL8pBcQFanO6gLAf7r+dbV5ceQyzxLQ75OZ0nsPWWIymKrciP8P8RY36h/evzZAMuVHmwqsCbU
 hVY4gRa6aXKPBbNhC2bvQDY5uvrNvzfbq6pRbcVoabo6YNVu
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Add optimization to omit SYNC instructions from offload messages.
Starting with IP core v1.5.0, the SYNC instruction is no longer required
for proper operation when using the offload feature. Omitting the SYNC
instruction saves a few clock cycles needed to executed which can e.g.
allow achieving higher sample rates on ADCs.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/spi/spi-axi-spi-engine.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-axi-spi-engine.c b/drivers/spi/spi-axi-spi-engine.c
index b54d2e1437c9993d251aa2842d9040ec0949a78d..8cc19934b48b5276f49c4049dcb2dbbeb4112871 100644
--- a/drivers/spi/spi-axi-spi-engine.c
+++ b/drivers/spi/spi-axi-spi-engine.c
@@ -162,6 +162,7 @@ struct spi_engine {
 	unsigned int offload_sdo_mem_size;
 	struct spi_offload *offload;
 	u32 offload_caps;
+	bool offload_requires_sync;
 };
 
 static void spi_engine_program_add_cmd(struct spi_engine_program *p,
@@ -702,6 +703,8 @@ static void spi_engine_offload_unprepare(struct spi_offload *offload)
 
 static int spi_engine_optimize_message(struct spi_message *msg)
 {
+	struct spi_controller *host = msg->spi->controller;
+	struct spi_engine *spi_engine = spi_controller_get_devdata(host);
 	struct spi_engine_program p_dry, *p;
 	int ret;
 
@@ -718,8 +721,13 @@ static int spi_engine_optimize_message(struct spi_message *msg)
 
 	spi_engine_compile_message(msg, false, p);
 
-	spi_engine_program_add_cmd(p, false, SPI_ENGINE_CMD_SYNC(
-		msg->offload ? 0 : AXI_SPI_ENGINE_CUR_MSG_SYNC_ID));
+	/*
+	 * Non-offload needs SYNC for completion interrupt. Older versions of
+	 * the IP core also need SYNC for offload to work properly.
+	 */
+	if (!msg->offload || spi_engine->offload_requires_sync)
+		spi_engine_program_add_cmd(p, false, SPI_ENGINE_CMD_SYNC(
+			msg->offload ? 0 : AXI_SPI_ENGINE_CUR_MSG_SYNC_ID));
 
 	msg->opt_state = p;
 
@@ -1055,6 +1063,9 @@ static int spi_engine_probe(struct platform_device *pdev)
 		spi_engine->offload_sdo_mem_size = SPI_ENGINE_OFFLOAD_SDO_FIFO_SIZE;
 	}
 
+	/* IP v1.5 dropped the requirement for SYNC in offload messages. */
+	spi_engine->offload_requires_sync = ADI_AXI_PCORE_VER_MINOR(version) < 5;
+
 	writel_relaxed(0x00, spi_engine->base + SPI_ENGINE_REG_RESET);
 	writel_relaxed(0xff, spi_engine->base + SPI_ENGINE_REG_INT_PENDING);
 	writel_relaxed(0x00, spi_engine->base + SPI_ENGINE_REG_INT_ENABLE);

-- 
2.43.0

