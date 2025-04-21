Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C621A38E1
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 08:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745223628; cv=none; b=VamJF5velcuWA04knOe70Q7Yu0XQc/1RzzQZeO1SOKQ2MW/xdAL303hs+HddtrFBnCTROyfk+50fRWuvweKuVC+1fnXKVI/2ywYLQeGFBBWds7L4nboE8iWh13HZbDWQkB6FHGABKPNhV+/zn/Nn4XQeOzY61WlF6Laa4EzOja0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745223628; c=relaxed/simple;
	bh=IFSBT6v25qjOVZm3VodtIQq2tdjsQ6B1Axqdspb6A3w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cgUi6qTJqB3p9F4qhQlADvAAqZ/uAoQ57LdzYLDSJG1F/5Ybbc5dXo+MktBzOoINpkc7XoKfnBwPYNsxJ2NqqOY4qRsKrk3dejVAaBvETqzcGJFM6US2g6rjIjZAZS8Inmj+BX3roPrBP/preSiVfomYBv15L9otYCffA1xbFnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=cF7J8z92; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="cF7J8z92"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5f62ef3c383so4130975a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 01:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745223625; x=1745828425; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0m7jP2wxTkf8fGVipTvtdJjuwbLzoj/2wX/3RGTjBVg=;
        b=cF7J8z92fQMJLkmbuHb9Blae6XHZmbm8eEWuFlRPctGSXNUOiUnUF+1q9Nln2YMoRU
         OpusrXoHzYJVZXEk2wNFOxTMBdNc7243s5akhzP8jTPmZlf3zjUyvN/EUFSzJxI4M534
         5IvYD2XLA1aPygkz2XDvEpum99Qr87NflzXtDtg4OwB3ch5TMc/mK7CsldSG3M0KsPGd
         RqcrKDIWDHLaZIrIwMPKIZfVwK2BwCbANgfafH0B+m6kMb5l+0Rfchen7TdgRS3wVCU0
         91TDXJel9OfgT2khUaHm0qchPLF4K6l33B83ANDs9CAoRUYzf1rtC/wtQ6ZXdtmdmR7c
         SXkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745223625; x=1745828425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0m7jP2wxTkf8fGVipTvtdJjuwbLzoj/2wX/3RGTjBVg=;
        b=NNPw3AO25rvGg+DAxfGVFAT3Upf1RaDup8eH/BDG0IhecgzrtOGfHBg0LO5ez78Dho
         /T8M7ocTp4vPZxGat0I+YfqhP0mhwbZmmfiMRaauiYCpSsKOeLChZ0SWPlI4a/oNvd6U
         5+IsLWVeGEKyTcYb5npr+sccznXNKlZCbszUK3NS1ELy4G5pRGefkjLqx0mNfqP+2+/g
         2WzQy+d3/w/nj02BuTr6p9phVQP1PaUfUmjG75BjKTPkfH/RoQvZKtYEDdXRaBmCZqAD
         I35ADlkh7a6pNzLSLcDZT34JWAQ7CYDGE3oyT27yjswUBfFqcIGGH20Bfug1zRRTRKIA
         KskA==
X-Forwarded-Encrypted: i=1; AJvYcCUybo8YB+0LvvA/DDJfeWvl7NtOsMVTcFlDXSFmaFfwWajpO+v6avHo7kovUU19T0GQ/lR4priYVUq6Wvg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyainSSx7vIqRdZJLTjJ1tqpHjAFhEjyXjBxSzA4MXrmYe6YMnb
	FTD36Y8caCW4ZlWsPyD+Pei6ICRiyP+ysf/UmkWqu1kzw4XgvmaCxMzTiOK9c5A=
X-Gm-Gg: ASbGncu1oDQOWAQP384rqzJbNZIW8NoZZJ+q320X1G/Z/Eh6RRWuaFWkqpYaKKclUoR
	GyOCYDTgYWBG4M0S8OCMpO/r8zlgJNe7ACgI4yhV1rVIgP+cxeCOx9ByYdeZTLtwRkvYEiDor3B
	sR8Xj3X5f7jgi+J4cSf/lO0i2k1uopRHZ/hb5b17riC/alFuPTDzF7tZIJuaJ7bEYUqTo3CNK/A
	NgykgShYNu8wDWu6/ALGy+0FKCF2nSjBVvVAdir2e98/VPQ+QPKI9iQ3hu+6zKzOk3YKT7+zWKT
	0HqaPlN4j6uk8oOMqb7RPIGLBbVrhb+ZITPBT+gB0EVdVA==
X-Google-Smtp-Source: AGHT+IHNHbUGLwb08K8zTnsZaX9K578r00c2tp5U+zBU23eG/2mTEsjbZofE8waPRYo5HOQNKkFHmQ==
X-Received: by 2002:a17:907:868f:b0:acb:893:8c40 with SMTP id a640c23a62f3a-acb74b388edmr1119224166b.19.1745223625191;
        Mon, 21 Apr 2025 01:20:25 -0700 (PDT)
Received: from localhost ([2001:4091:a245:826e:c0c:4cef:7dd:26bd])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-acb6eefd888sm477891166b.115.2025.04.21.01.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 01:20:24 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Mon, 21 Apr 2025 10:19:59 +0200
Subject: [PATCH v6 1/2] firmware: ti_sci: Support transfers without
 response
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250421-topic-am62-partialio-v6-12-b4-v6-1-3b5cefab1339@baylibre.com>
References: <20250421-topic-am62-partialio-v6-12-b4-v6-0-3b5cefab1339@baylibre.com>
In-Reply-To: <20250421-topic-am62-partialio-v6-12-b4-v6-0-3b5cefab1339@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1642; i=msp@baylibre.com;
 h=from:subject:message-id; bh=IFSBT6v25qjOVZm3VodtIQq2tdjsQ6B1Axqdspb6A3w=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhgzW/3vcn9uuqZa4FSeoGr3tckK5kJxIj6Jn+1HtzwEmz
 h6ueZwdpSwMYlwMsmKKLJ2JoWn/5XceS160bDPMHFYmkCEMXJwCMJFHbxj+h8y4821R9/m50uIb
 jRZsfjXP+I7Oy5VJsr/Y5I/mchRdtGD4ZzbxitMdps9uKq83+Hw71Xrk785z56bKsb2JiAx426K
 RxgMA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

Check the header flags if an response is expected or not. If it is not
expected skip the receive part of ti_sci_do_xfer(). This prepares the
driver for one-way messages as prepare_sleep for Partial-IO.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 drivers/firmware/ti_sci.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index 806a975fff22ae00ecb88587b2c47ba172120bc2..09d11e75e14e6a6a82f6d99ab1852c142aeb7e5f 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -398,6 +398,9 @@ static void ti_sci_put_one_xfer(struct ti_sci_xfers_info *minfo,
 static inline int ti_sci_do_xfer(struct ti_sci_info *info,
 				 struct ti_sci_xfer *xfer)
 {
+	struct ti_sci_msg_hdr *hdr = (struct ti_sci_msg_hdr *)xfer->tx_message.buf;
+	bool response_expected = !!(hdr->flags & (TI_SCI_FLAG_REQ_ACK_ON_PROCESSED |
+						  TI_SCI_FLAG_REQ_ACK_ON_RECEIVED));
 	int ret;
 	int timeout;
 	struct device *dev = info->dev;
@@ -409,12 +412,12 @@ static inline int ti_sci_do_xfer(struct ti_sci_info *info,
 
 	ret = 0;
 
-	if (system_state <= SYSTEM_RUNNING) {
+	if (response_expected && system_state <= SYSTEM_RUNNING) {
 		/* And we wait for the response. */
 		timeout = msecs_to_jiffies(info->desc->max_rx_timeout_ms);
 		if (!wait_for_completion_timeout(&xfer->done, timeout))
 			ret = -ETIMEDOUT;
-	} else {
+	} else if (response_expected) {
 		/*
 		 * If we are !running, we cannot use wait_for_completion_timeout
 		 * during noirq phase, so we must manually poll the completion.

-- 
2.49.0

