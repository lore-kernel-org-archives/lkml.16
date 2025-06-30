Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A387F1DFE26
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 19:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751312129; cv=none; b=EVagZ4PsLlQSlzC7LUbk42qoQ4xWVWV5+QcQlhDR81K4aMnLT7EIlxyAnVM6MTjbqeF7WK3VTpYAhoN2qtgdNvSVc/GZwqTukJTHosy05hv84J/8N3IuD/BtTUqTcMnrc4Oq1+nRE5TNgIvuy+H4TclFeUb6rvZCpw834qHQrAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751312129; c=relaxed/simple;
	bh=QNwceMSVmMF1Nwg0Ks3Dq86yFnaGmtYCWAfbiAZhQVA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZTh+agYH2PrCt+aNE2Kae0HmN8W2bMrWESJyGavG/lrUSn+hgAkSR585KMgxJ0w7dkIixe6Lehghf29WDZnIm+4t9BmcdAcnSaLGIgYK/CSIDin3lV7Z8/FWD3HgKIT5k0/JgEKAARAisjPQaQ7b8WKgcMoDdN8I5i905Z21R2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BZm5War7; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BZm5War7"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2ea080f900cso751889fac.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 12:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751312127; x=1751916927; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uSnBBrW7DyQ9uDD3D8W9h8fjOrHlTZaIJ8+vrX+84dc=;
        b=BZm5War71MaHdwNXfnbyn8EWVV08/8zVwr2fc7uDPEXEvJyFM8n2ZZMljxyQGsXEN2
         JHBArk5vN0mUzyFWVOaWhmvfbapBB7kZA3vextrK82N1vG71vnFY0XReqeN+gZxOE1uQ
         GEqIt0zE0IAoEvgaQQclbW2clY+hRVKbXPpD0+J6Pd7Tuo+ySzJqg+MBu0n60rZnctfA
         FWDiwbFViBOrBc1D8rUgwX/8EFpsuUjBO9+xbGJmIlqzMN6dNmsDjqyw2GTsWEtdFXaO
         YDOKtiepkGIH34Yom+lR8J4EG0NRfAsEwyvdKDt4cv7eN1A+6TaVUUpP0PM9YMbxW9XJ
         0ckA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751312127; x=1751916927;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uSnBBrW7DyQ9uDD3D8W9h8fjOrHlTZaIJ8+vrX+84dc=;
        b=sVgWQ+NR2K14wJ1+j9It1HJST145rYofXiHda3xTTvG1Cg+yvQkTlQ/Fx9jYTio/Sm
         5SlZvpoZTer8jGNpwRZXeOV8Ah8ftBPmj/HWsGb6LF5D6FaMuPpgs1q29RfTSApQpic2
         oeXrL00BKgFn/yDrKHc6Fr76XaVzOGMMr2SmetEptnXgXdQtVSssgqpx/HSkCGpMP4u+
         BbKkrkaLQpPbm2dYdj3NnT4rx/C5fOD+NKTaS2KSTlFYyB/vH5QgpXXTknF8x/VUB6gf
         FfD/wro02IbzHctw4y1SWrLVplg2LUs0xpR9KMZijkcRNhp1HwV6kAVxGzHpBdcnmLWn
         i1HA==
X-Forwarded-Encrypted: i=1; AJvYcCXeIRpXISHLlUdDBTE/TN2xf1UmP2z8EQfnMAJ5TtfqGEiU6KHo0l27GSZC2TRb/armWqLnJqeqSbIuTMM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgviY1mq+b4UKdsuYWFepLpoFJ3ojgdxyPTW2bLHuCRUC8pn2J
	M0m6ItiwHrx0XPxUAQyXP+Z9hHJuPBVY/wx63j5cljH0DPEvgIE/yQisM+yOnmW2/yoLQ6QKgZp
	EYTdXv70=
X-Gm-Gg: ASbGncsCotuR20ejP54FvloxNQ5DkN2++V/MqCnSI35VJmCW09GlAyhTIAbutBFe1Sv
	rZ2ADxivt/vk2uHj0No1S6QMb7dMgV/cbGKHEgKC/qpO72X3DDoG0tb8ZsvA5KTT/Wx3AEjn8oC
	KE9voGC2kwFOJrJw8ZsoEKmU4SjABlVDlCtoxPy5dJw9VoHxAQYtvFCMPCRNCRSEmv5xWqW8zMm
	tHsRcAkVMnTAwjVY2CH6y7lopBMqmyIuXhvg7jseh0/WH6bYKGtframR5eascLXMKIOEN56ems1
	taart1+XsKVJzsp9LiNFkqM/iBkHhqhYGxWPN8YVxjeJhgAtaUBO/s67fXleBduDm1XOyW8wTTJ
	DMGw=
X-Google-Smtp-Source: AGHT+IFjeReXBA3k7+eClk/ifIE93Uzbc7oaZBkcYmdYTh/N0ppG05eqByPpmkkuYUzt5s/KtcZ0Xw==
X-Received: by 2002:a05:6870:783:b0:2eb:adf2:eb2 with SMTP id 586e51a60fabf-2efed7a2a73mr9014336fac.36.1751312126689;
        Mon, 30 Jun 2025 12:35:26 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:49cc:1768:3819:b67])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-2efd50f7f6asm2908403fac.36.2025.06.30.12.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 12:35:26 -0700 (PDT)
Date: Mon, 30 Jun 2025 14:35:25 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
Cc: Alain Volmat <alain.volmat@foss.st.com>,
	Mark Brown <broonie@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] spi: stm32: delete stray tabs in stm32h7_spi_data_idleness()
Message-ID: <2033b9fa-7b0f-4617-b94e-7b0a51c5c4b1@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

These lines were indented one tab more than they should be.  Delete
the stray tabs.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/spi/spi-stm32.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index 3d20f09f1ae7..afb54198bde7 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -1895,8 +1895,8 @@ static void stm32h7_spi_data_idleness(struct stm32_spi *spi, struct spi_transfer
 		if (spi_delay_ns) {
 			dev_warn(spi->dev, "Overriding st,spi-midi-ns with word_delay_ns %d\n",
 				 spi_delay_ns);
-				spi->cur_midi = spi_delay_ns;
-			}
+			spi->cur_midi = spi_delay_ns;
+		}
 	} else {
 		spi->cur_midi = spi_delay_ns;
 	}
-- 
2.47.2

