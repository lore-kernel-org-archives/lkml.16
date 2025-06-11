Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181CD380
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 18:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749667046; cv=none; b=KtvTkjT6pqY0vRCEKic1mY0ko1rN5M1IdlP738Qb5/QEQLuxrfLfKXm5yZ2w89wu83W6St2McaZBnxhIdKHXnmJKwnVYN4id9f2aOAvbMfK2qpnLjdabeOzzeZU7pIuCp9HxTcWrZjmPKy9BxjhgDYFPJZVTpFeZDBx1zur6rN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749667046; c=relaxed/simple;
	bh=i7gGdufPkSGRwB6IPZKAt6alZaKpalTRVeGTcHa0rDg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O4GgwRQw19cK3IyCDIvFN85pJmpQChvpWv0C4ecVPZ2Hyc+S+4JZLq0EFevah1H9oS6GaXFYsZ7bTCMnynp1IsJa9rcQ+vSqGWhmSgM3e8NWk4At9tVFMpWZiezG1FnEQoiVl77gz7D+BxIw9kBU9VeVGAA0JPltFURly2rdjsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=hEp2WiPD; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="hEp2WiPD"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a50956e5d3so188531f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 11:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1749667041; x=1750271841; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qgYBfY2UR29MQlCGcRFEVcrLVgS61xcAj8mfuW0laMQ=;
        b=hEp2WiPDuXfZ9f3XhKZ/PJSBZrBA1nspeqUhsyJmy5UxhK3JvwnxnorzGAUDiGtpqW
         BczdVAmQ0CQti+OxQiheFfcVUD01xKkFOpEnJ+10plYZYlBiqudX3EJ5iTXp+0ee9Bi7
         u/ofqYX8t1SQLb6PswiU769wsxlvbsFAnUL4Y6T/9HHVAK7fHHlikFNK/2MpAovD9ZTZ
         /cd3fNfVOPBabMdCOOQlYc2AyNXpeVaL+DNUZ5oUDfa8QODx401dpNRuYOTJnoTCqBmF
         KqPESMzyIcDJm2+VmOvaH4XzlAerUj6xF+Zg6TlS+QScHM7S1/zpUSeDWr6pL1e0YSlp
         4I+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749667041; x=1750271841;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qgYBfY2UR29MQlCGcRFEVcrLVgS61xcAj8mfuW0laMQ=;
        b=URJ7jxLFT8soRnaed+rt9bSc94LxBkFXBdwE5oq3n/27nURxc5jOaPCdEFUb1SEtqx
         GBb84E91YhAjBifQJflCxC+p84V79Q2vHmYCi42pL4biMDqQtFP1py/c6DWevKoAsfZw
         02m0aLPCVb1Re/0TcVOoU93S+r8bqytMKEkXnJ1BrSqNBWj8xt8QZ0OuthlJ05baqTx0
         lLGszrXikDbICCVaUfT31BzQIU7nvj8BSx4v95IqNttstOAOkE22yrjRfpFEyjBzGLhS
         cD0fa7c0EWiBFssYBY5nF/QyBKQN+FDBTxQ1TYACHCIqmPBTrAoFbMUNifQEy7AVFF9s
         9UpA==
X-Forwarded-Encrypted: i=1; AJvYcCXGwF0D92wMSWcASroJcHPTtHs+nD4yM/KJV+glvXhEBGRf+js5TGiPVHjzB8o6o9YpfqB+Or1pGYbkhRQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpPBzxDt33UHCvVl1cJjL4ZsMzglmWPkG+O50FKIcZT1TByOCn
	o3b5eKhQHJpTtnzJ3CY4/kcHcgjIQhXrMAqHVKK9kM2cqVngVaCFYMvtgjTSAOX0pcylrwiKVdF
	Ir5gM
X-Gm-Gg: ASbGncvS88EYiTHC1Rc01owxRRgZwGpErRtxNiVhGXi7azqr4zbuKIzhxh4gD308qFN
	FWz39eWTZu+d2xL3n3B5mj3KvmR780tjHg0BVKiDvVhgDn5hH/iLwO2IoDqWobUPlT3OXX914wl
	o2fayXlpI1t1K14d2NhldoioOezmEn6ACjJUZVoc0mcnaCI51ergtd6EMb65Obi1038dtGtQl6Q
	yX1wVKfTxilbzpT4ObtdiPWJ7nok4JIVg27Glb9Tk68h+fDeuBza24WU1wd1E0Edz8N5rRlbSta
	lR8mJF4gvuiMzd7akpoltsRNgMiK28I0w5QNe34kPyP4TEu4jkWVTA==
X-Google-Smtp-Source: AGHT+IHHT50NdMoz+n9TfRr2G7Tew6o4zd1nSosAD5QXIFC2jG2M1x+AHqx1qfPmXTcOGk2hed8jOw==
X-Received: by 2002:a05:6000:26c5:b0:3a4:d0fe:428a with SMTP id ffacd0b85a97d-3a558a27540mr3799331f8f.28.1749667041208;
        Wed, 11 Jun 2025 11:37:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a5324364d4sm16119390f8f.55.2025.06.11.11.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 11:37:20 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 11 Jun 2025 19:37:13 +0100
Subject: [PATCH 1/4] media: tc358743: Add support for 972Mbit/s link freq
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-media-tc358743-v1-1-708556026f9d@raspberrypi.com>
References: <20250611-media-tc358743-v1-0-708556026f9d@raspberrypi.com>
In-Reply-To: <20250611-media-tc358743-v1-0-708556026f9d@raspberrypi.com>
To: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Maxime Ripard <mripard@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

Adds register setups for running the CSI lanes at 972Mbit/s,
which allows 1080P50 UYVY down 2 lanes.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/tc358743.c | 48 +++++++++++++++++++++++++++++++-------------
 1 file changed, 34 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index 3d6703b75bfa..b87db3de20db 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -1993,6 +1993,7 @@ static int tc358743_probe_of(struct tc358743_state *state)
 	/*
 	 * The CSI bps per lane must be between 62.5 Mbps and 1 Gbps.
 	 * The default is 594 Mbps for 4-lane 1080p60 or 2-lane 720p60.
+	 * 972 Mbps allows 1080P50 UYVY over 2-lane.
 	 */
 	bps_pr_lane = 2 * endpoint.link_frequencies[0];
 	if (bps_pr_lane < 62500000U || bps_pr_lane > 1000000000U) {
@@ -2006,23 +2007,42 @@ static int tc358743_probe_of(struct tc358743_state *state)
 			       state->pdata.refclk_hz * state->pdata.pll_prd;
 
 	/*
-	 * FIXME: These timings are from REF_02 for 594 Mbps per lane (297 MHz
-	 * link frequency). In principle it should be possible to calculate
+	 * FIXME: These timings are from REF_02 for 594 or 972 Mbps per lane
+	 * (297 MHz or 486 MHz link frequency).
+	 * In principle it should be possible to calculate
 	 * them based on link frequency and resolution.
 	 */
-	if (bps_pr_lane != 594000000U)
+	switch (bps_pr_lane) {
+	default:
 		dev_warn(dev, "untested bps per lane: %u bps\n", bps_pr_lane);
-	state->pdata.lineinitcnt = 0xe80;
-	state->pdata.lptxtimecnt = 0x003;
-	/* tclk-preparecnt: 3, tclk-zerocnt: 20 */
-	state->pdata.tclk_headercnt = 0x1403;
-	state->pdata.tclk_trailcnt = 0x00;
-	/* ths-preparecnt: 3, ths-zerocnt: 1 */
-	state->pdata.ths_headercnt = 0x0103;
-	state->pdata.twakeup = 0x4882;
-	state->pdata.tclk_postcnt = 0x008;
-	state->pdata.ths_trailcnt = 0x2;
-	state->pdata.hstxvregcnt = 0;
+		fallthrough;
+	case 594000000U:
+		state->pdata.lineinitcnt = 0xe80;
+		state->pdata.lptxtimecnt = 0x003;
+		/* tclk-preparecnt: 3, tclk-zerocnt: 20 */
+		state->pdata.tclk_headercnt = 0x1403;
+		state->pdata.tclk_trailcnt = 0x00;
+		/* ths-preparecnt: 3, ths-zerocnt: 1 */
+		state->pdata.ths_headercnt = 0x0103;
+		state->pdata.twakeup = 0x4882;
+		state->pdata.tclk_postcnt = 0x008;
+		state->pdata.ths_trailcnt = 0x2;
+		state->pdata.hstxvregcnt = 0;
+		break;
+	case 972000000U:
+		state->pdata.lineinitcnt = 0x1b58;
+		state->pdata.lptxtimecnt = 0x007;
+		/* tclk-preparecnt: 6, tclk-zerocnt: 40 */
+		state->pdata.tclk_headercnt = 0x2806;
+		state->pdata.tclk_trailcnt = 0x00;
+		/* ths-preparecnt: 6, ths-zerocnt: 8 */
+		state->pdata.ths_headercnt = 0x0806;
+		state->pdata.twakeup = 0x4268;
+		state->pdata.tclk_postcnt = 0x008;
+		state->pdata.ths_trailcnt = 0x5;
+		state->pdata.hstxvregcnt = 0;
+		break;
+	}
 
 	state->reset_gpio = devm_gpiod_get_optional(dev, "reset",
 						    GPIOD_OUT_LOW);

-- 
2.34.1

