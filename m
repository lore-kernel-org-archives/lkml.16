Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6562153E7
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 18:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749667045; cv=none; b=grZGIsFqe6S+TGc3urqMzqxogYuBzIy/KK6b5mQUI71//0WTCkVynKddrqYiEiV7TxiFJDKzrF2IiYw5iVC4ps/JjZGfkxF7lC151x6j74VETWkGilue/I4gf+UZUKXZddH1knuVCavnL6iEUYTk26PeyErPh9aVoLWsaL1K1iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749667045; c=relaxed/simple;
	bh=RyLIKNeJDHGcRQHXIaBVFM/PFmHB/hcFvEYioa32LRQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y+SlnE5a7hj/1BFgtqRMcgjWypqNmabyA2LqSJ51whxzPkVzr2YfWqBNww6+hWy5WsY5o/h+da8HxZFMejaLt9vHwGgI/AWo32ZG58eg+FYAoA1Y13t2Kx0QyTwDDFkmHvc8nqhFyUYAVcUOVwDFel15e0nzo5COxI7fzwX8jP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=VB2T1mWi; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="VB2T1mWi"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a54700a46eso198531f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 11:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1749667042; x=1750271842; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6/DWf3eFTS1FAKsBMmWgLu1g2vHF8byXbBX1nrqf/VM=;
        b=VB2T1mWifQGJcLguGEC73P3aw+Ok5QvPAwB0qwbo4C7m1ahWrx+yILFuMXTkwqK9Vr
         Ps1IQui43AjQB/n1Z9f+7HGWq6honuJ7HJDWjA45aKQBERpVVkVJS/PS6rlV3C1P5sl7
         HxOnVWCxCGVJ8iePCamBxtWi6E/lkMIb/MuVNYLhohYXpeFJVsvpYWrQyAlgZwHVRxZU
         K5CCcIAvTNPc8alozPrRdZMIZbEZ1DqYJBPnHYUYYVYC9KWxXVkQ7zskO/yYXGRLGKQx
         7+pdtQKKovkbjpjoDc+EcfhYOZ6kN1m5j7IGsmG9mfXI44h8RqsIN2c0ZUSuGP18mJ9n
         wVeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749667042; x=1750271842;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6/DWf3eFTS1FAKsBMmWgLu1g2vHF8byXbBX1nrqf/VM=;
        b=NwUlXE9YwB7zgbtl//pPRmX3ilLgUppcs0n3Yz4/w9tl+s4U7TYG7KHLe/lpt2uPuS
         rxHTekPemcdMe3H3a7cHp0iw22NK55eASU0xPS4mrfE35Q4dGcKkOR3/FHZsJzdnxN18
         ESfT53h2//Ge3uscTb+G152B4wJWX9NabUN7Nf1oPqu1Snj4VDxjveZw2c1FRbIxPu16
         1upOP6KhbpB/qnFoftQEbA0ZK7zDHjR5Du+3ObAL63NVvMjvYRapv5Uo89rTU1XUpYG0
         6cO2w386OcMg7FgSZXAS2FNiAzlVRMC4IKvd6ZQ0wG+mXre8nAUncLd0IptncV8LskKn
         OfAQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9VC37e11bWEMhLRlx0KlAfTy1YaclvOiFm4mJfZ4vXcBxUUBwlleKUxalXQi774eFeNIR8IzBT8lV9R4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1YOohgjNYCk1EKioz9HDjtYYd0UJgtiGot0EqBCsG8wtm+YyW
	5/GCEDPrd1rIAomnimcJ1w9MhYxuwOyRO5J4rPVC+NcS2Hf3KZyCo7rKQWlYf74t3kQ=
X-Gm-Gg: ASbGncu23PoLMaTF2H1Tuq6mgbihu38CSr9Yy5e9wfKqhWktXLM9JpK20wco8i5ku7b
	YYsMaYBTcJd1/FP1SPQoKELo5BMwwoWeJV6jGVS0MZJ2aLpnaU3uECjtieyh01iNTmLF1TFdJvs
	2Z0XJIIqF9s8YlMHCJv+cD8nLxyY3nSVV9OXbW1NIaS43/6AX2oiHV1sx7j3UeTyMmbIukZlEMJ
	IXAVWtwHOe+j5njbbNJgF9+FwFhJGj+ONDNjpRcldUNb9UYmvKG42FzJqmMU9YNmm/LN0nccgzO
	LgAF4YNKxS47jvti3Y8MO6VlRvIPAI5d4nHBytT+dSOBvWVsUMAAQA==
X-Google-Smtp-Source: AGHT+IEkF/dFZASIDjRh7yC2bAPt/if4YBRK41hg0H9/5YtD56ovdLDxPjw06Yoz2hJ3UEcOFPSVyQ==
X-Received: by 2002:a05:6000:2204:b0:3a3:7593:818b with SMTP id ffacd0b85a97d-3a558695e91mr3797607f8f.21.1749667041968;
        Wed, 11 Jun 2025 11:37:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a5324364d4sm16119390f8f.55.2025.06.11.11.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 11:37:21 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 11 Jun 2025 19:37:14 +0100
Subject: [PATCH 2/4] media: tc358743: Increase FIFO trigger level to 374
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-media-tc358743-v1-2-708556026f9d@raspberrypi.com>
References: <20250611-media-tc358743-v1-0-708556026f9d@raspberrypi.com>
In-Reply-To: <20250611-media-tc358743-v1-0-708556026f9d@raspberrypi.com>
To: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Maxime Ripard <mripard@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

The existing fixed value of 16 worked for UYVY 720P60 over
2 lanes at 594MHz, or UYVY 1080P60 over 4 lanes. (RGB888
1080P60 needs 6 lanes at 594MHz).
It doesn't allow for lower resolutions to work as the FIFO
underflows.

374 is required for 1080P24 or 1080P30 UYVY over 2 lanes @
972Mbit/s, but >374 means that the FIFO underflows on 1080P50
UYVY over 2 lanes @ 972Mbit/s.

Whilst it would be nice to compute it, the required information
isn't published by Toshiba.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/tc358743.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index b87db3de20db..ddba8c392ead 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -1972,8 +1972,19 @@ static int tc358743_probe_of(struct tc358743_state *state)
 	state->pdata.refclk_hz = clk_get_rate(refclk);
 	state->pdata.ddc5v_delay = DDC5V_DELAY_100_MS;
 	state->pdata.enable_hdcp = false;
-	/* A FIFO level of 16 should be enough for 2-lane 720p60 at 594 MHz. */
-	state->pdata.fifo_level = 16;
+	/*
+	 * Ideally the FIFO trigger level should be set based on the input and
+	 * output data rates, but the calculations required are buried in
+	 * Toshiba's register settings spreadsheet.
+	 * A value of 16 works with a 594Mbps data rate for 720p60 (using 2
+	 * lanes) and 1080p60 (using 4 lanes), but fails when the data rate
+	 * is increased, or a lower pixel clock is used that result in CSI
+	 * reading out faster than the data is arriving.
+	 *
+	 * A value of 374 works with both those modes at 594Mbps, and with most
+	 * modes on 972Mbps.
+	 */
+	state->pdata.fifo_level = 374;
 	/*
 	 * The PLL input clock is obtained by dividing refclk by pll_prd.
 	 * It must be between 6 MHz and 40 MHz, lower frequency is better.

-- 
2.34.1

