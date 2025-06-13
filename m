Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1202E613C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 11:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749814931; cv=none; b=Ki1HHmnN8BiacayXVQMHJKY4ZpRNeS8xNLxBmJVT64kis3zSn3wG29BhBMPWcv16wbRst/Woj6zl8gw6b45cLRPOd1be2CnbRKDurjcolaknzVIB8WGZf5sv1LRozr1KKqbBy4umJxkRNqxce5FdPq7FWweEKVB55HyHtONMfBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749814931; c=relaxed/simple;
	bh=UjOVwgtEo33Ysf1DyH6d5ldmTFzYDqKUhAyLQVB9wK8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tg999t277mOgG9CQjF5l0lGJ+sueBXvM3ik9lMEOb0u2ypjpByhZiVf3N/xF3D1Zzvi5NY2SxSGyf6ReOaPLKlUGIy7iANnNo0nkT+8qOtqxP132cnLxvIk17wE0h7Rwa6jmFNql2xZ9H+YHJZLU50tw1Gnyebux8Pr63LtKx08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=plC9ULUn; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="plC9ULUn"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4772f48f516so32593351cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 04:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1749814928; x=1750419728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6WlKCQdBK9LWxBVakFnX+t2/73xtUBtXu9i2PrxiazI=;
        b=plC9ULUnylGNLltJ/YPUOz5o61tneqDQCbYUViWc8yRcJPbUutA6Wh91Nks0pGLaRf
         U4qg6GhJ7CdVGxJ61wwfrMgPl+Uim6usuvApWZXRXE7eIDHJfsnoRUIStFDxnv3bLLyH
         XE8XCoNTQ8G3ivf1V+3FwUh0Ru9V4giBSI2c/69kHiqgVwM2hNzL+8lEkRWWVEmZYKHr
         BuJDBHycreZiGgXiTAQMuO9ZOAWIofniBOkiLCZPn6c0C8USAc75ectbFb0iyNEREENB
         IZVZxKnNkiYbvyxMRcBnD0Igmgmkr4mjbCZia+NHjd381jTdr8OgVywYSAEvF7iD5hGD
         MZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749814928; x=1750419728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6WlKCQdBK9LWxBVakFnX+t2/73xtUBtXu9i2PrxiazI=;
        b=VUZOccMoNK/WdIwygT0HYKSDk5NH+4djxeRCxjDdLpwuMYIRSuhPHufJyHsVjhVpyi
         3uylTL2xgZly8OI/ElOOw1p1h8cMZmVpzcKw3moiEYox2lD2naDODr9MKoNghj7YhGTo
         Dos4V438SJq8RtzhE6P51qQVbOLB/shDekbU5JDcrp8zxTvbeobSUQlxwI7cB0hTSm92
         aPS5t+l9AkHmxZb2L7NIyZTBggbTFk6DU13tMXmEfdLteanu6QBstYykaCEpTV/Ut7Mn
         c67X2XTShjIsgx2u/5/Mss+oXGzPownkRDaA+aczSfMNxLafstxWEqYL3DfCFISKDOQe
         ejVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxdZNdj37Nb+kCPvyifY8I8D5Vbs49BfNjPyUkXq3JYTo71NWI7RuzMIuAWvE5A/Jm94uDrhd7senb54Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHowaNyZu/Uk968pUGsa3rJS+rl+PgT+c4US6YPpTI1vZQBnzu
	+kSvLf6Ng58W0XjaePOQ/ZzEa/EdB7TpFBDQNcZHKfpGX5dXKCZwPwWiESpZnx+tQd4=
X-Gm-Gg: ASbGncsi/Rsn7RqhL/8LDdFuCR0Zl06IYc3/6f9pjGzedkYbGbUtT+RncYeJaD9dMRX
	t36ZfN8a7a1tNPALcPD6al4blzG5hh7IOHyLXevqV4B9p98uh3IKwnU2DVuY7Ib4yMh5nP0LDXV
	l0+hWdJJ7PQm77I7Vy4yQ8y9CT64m5TgELok1qzF0TI2YnLWyon/oGZ7WeZ/yKHl48vVahwOBa6
	gcos94Wy5P7dVpYTpkoDj/PQihO1ahymwM1NiFq0mC6hU3nqllGA08lgxVA8Ee6JJ/CK1SQUdTL
	/oMG0qfHdi89KsI04qZysHMcoNwZmip7zdJo89/Il0VFXozmwY2JE+B2H5/63FI39Qb3rxvI//B
	DKB/BHtp+AZpzcA/7YvxahQ==
X-Google-Smtp-Source: AGHT+IGoxDxx9zyPnLwBJu/HgiS6b9JD+b3qfzp8/xdsORghv63P60xiRPkYDDUy+K9jds0kDneIzQ==
X-Received: by 2002:ac8:7dc2:0:b0:4a4:310b:7f0a with SMTP id d75a77b69052e-4a739328f1bmr4762501cf.10.1749814928381;
        Fri, 13 Jun 2025 04:42:08 -0700 (PDT)
Received: from fedora.. (cpe-109-60-82-18.zg3.cable.xnet.hr. [109.60.82.18])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-6fb35b3058fsm20558206d6.37.2025.06.13.04.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 04:42:08 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: catalin.marinas@arm.com,
	will@kernel.org,
	olivia@selenic.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	vkoul@kernel.org,
	andi.shyti@kernel.org,
	broonie@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org,
	kernel@pengutronix.de,
	ore@pengutronix.de,
	luka.perkov@sartura.hr,
	arnd@arndb.de,
	daniel.machon@microchip.com
Cc: Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v7 4/6] dma: xdmac: make it selectable for ARCH_LAN969X
Date: Fri, 13 Jun 2025 13:39:39 +0200
Message-ID: <20250613114148.1943267-5-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613114148.1943267-1-robert.marko@sartura.hr>
References: <20250613114148.1943267-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LAN969x uses the Atmel XDMAC, so make it selectable for ARCH_LAN969X.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/dma/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index db87dd2a07f7..0c3f14ab569f 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -111,7 +111,7 @@ config AT_HDMAC
 
 config AT_XDMAC
 	tristate "Atmel XDMA support"
-	depends on ARCH_AT91
+	depends on ARCH_AT91 || ARCH_LAN969X
 	select DMA_ENGINE
 	help
 	  Support the Atmel XDMA controller.
-- 
2.49.0

