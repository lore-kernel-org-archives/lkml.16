Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D421CB51F
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 09:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743845263; cv=none; b=YQB9WGQ/HioRfrI0z2UsVSFmYC2hnBucez0tN4iWjGtuACyGS7SCnnCGiaKqJskyuEiarJsY4fjAW5daR6ZVi2hCMPQ8GEpryJi+FUnuNjfSqCYOWuSnOZ6iQmxtqVyRGFCeR0kmtU2vmtL0QNDuTrhSeAUUqUfQqn9aMv3Jtv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743845263; c=relaxed/simple;
	bh=kHydnSM0ULFQvWKEWgBJvoEZ4DMOWEDjsKpnVZckxBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KdP982wzxUDWOSzdwg0Mdnk4Bs5XtlDK97LyGLvIZcbD9+eiLTOfMrXLemcwQWXrswSsfjtWeNkFmUYOx+sqdWWNQrZSebdMz8VAUjIGtxtsznw3pXHoIoD4bllrcm49Wr3eg94i17L0Phjq3HXNyG/7Kx/127UUqiUyJezJovo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ohe4PiYD; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ohe4PiYD"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5ed43460d6bso4597501a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 02:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743845260; x=1744450060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/vhjgPM25WIrJtvsOvWD9TP3Lhl6m8KVBdL4zwgprPU=;
        b=ohe4PiYDgrpsxz/DY/y3mtxo4mL1h2T3OXdq97MP28DcryLF766hIKN//ZuSzUygVA
         nRoFH/6Xd1a/C388HOKA4DKWYxCnMPGUByACZHwt587DxmNAgSHvu85vaumu5eYTrPk1
         900FXqLQVolycSABeOrubG2zdvLSNSoIm+T20GhG3W2xIcUHsoudMzkIJN6R6PXoRXwV
         MLauL9QjaWsJrCIOSyM5/Q151BtOffcTXdPuM5Pe0xOHgVU1WxeqNMFfB2Vidp/eVgsh
         ArlXnpB3vv/CTIFRJiwfZX7/KKbVgqB3VcXB+lpOwbiOGowgDb8H4++k9EWsKSkz3oQ5
         VZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743845260; x=1744450060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/vhjgPM25WIrJtvsOvWD9TP3Lhl6m8KVBdL4zwgprPU=;
        b=F8VhDZjfgebr6gerzFXK65RSYL0dmDooqWzqnR+OlhBVMC11EAkEJVzTFe/hpNGTKG
         KhanKE2vLSiYIzK1+C7PPyHEvoTj3qcR0IymNYeKT5iETaXM9nCESkvMWj7W6wWgxDYR
         pZrZyxAcez7PGkea6dn3T8qZy5kTdosW6VWvEJni70McZAIJlQvc6dhHefEDSPXqTPqe
         OnXRVVVm6nvxs6cLc8Zl3JxNFy6ehgFo4KFCg6X1eALKNnJPrduNv+jFk/LE7ItIkOzY
         8yxZLVqDF2pwtOaARLhcobeDdfZcUO+jlEeLfYXePhKleqHEEz0r+gsp2JSh3oS9qnyu
         GXiw==
X-Forwarded-Encrypted: i=1; AJvYcCW/CV68jUQmIfrxuEBvyjME35BK8X6/3D32v/N0lz1A5Uoa9Chtdq4o6qK2Nmirkel8vuUjzdaknt7pv54=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFLYDdmLwcVXS6CC7pSADpyZxmDDwVvKJC0pUCkfzJkMw5xWip
	T7vayf/EYdV8Z0vH+aJUKEYNB5YBrfnCF5IvuPTS50DqlKlOP6Dgh10vvsWs0Ko=
X-Gm-Gg: ASbGncuiYn5iRR9vgeFgeiwYd4zKbZKagu3RGC8l557kbhxeLPhmcYmMOWf7UxTeejy
	nS8u1On6rO//ta82NbxqCVs/w/+2gMxyeCSftjX63affa+BLF4fvg2wejbFmc0/d6Y10E2E90xc
	9hUnQcozJF7pjMs7+K5U4spLrk4zU4zotl2LRDaBxMDSwHDgHa4lab317hIWyDCKSZ0sQecspGf
	hYYKkV9ZRP7r9gVNORF5za5P/51hrzr37SloC9z9CMEX7bH3k1TunaOe3PAa4ynpb9KLO1a+GEG
	DFGRhGkqVJlwlSZQPZhWGzUPc12XxWZsayI98baii577GvFKjw==
X-Google-Smtp-Source: AGHT+IGxU6AQk/lGxA5BuJalTi4YDJdWHCrI3Gxv3qwNMs4ENzrJKR1Xxmjq53bryBeUQ1gqPpBg8A==
X-Received: by 2002:a17:906:f588:b0:ac7:7526:46a7 with SMTP id a640c23a62f3a-ac7d6c9f9f8mr456183566b.1.1743845259603;
        Sat, 05 Apr 2025 02:27:39 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac7bfe5d3d8sm392574566b.31.2025.04.05.02.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 02:27:39 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] pwm: stm32: Search an appropriate duty_cycle if period cannot be modified
Date: Sat,  5 Apr 2025 11:27:13 +0200
Message-ID:  <f0c50df31daa3d6069bfa8d7fb3e71fae241b026.1743844730.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1743844730.git.u.kleine-koenig@baylibre.com>
References: <cover.1743844730.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1609; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=kHydnSM0ULFQvWKEWgBJvoEZ4DMOWEDjsKpnVZckxBc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBn8Pd1OuSd8laVmWsGMsZDQ3jElzoOQdmOU0iVj Pfwnc8P+kaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ/D3dQAKCRCPgPtYfRL+ Tkw/B/9jCyatQhCnULqdSAYE6atXCRb8xNFBivDhozOExipctqkbMkUxZN9AKJ1YgwFfWHLNl0z PUSP8gpGwtEQUxTzzp2s5toba5GXknwV0rO6+9YdTjf5SlLRVO9Vuru9m3Z6I67iUD7FG+8/20T hftKLgmwm1MFOxcN1nEr+5L9o9Il8jAkXqLMNWPtkiKBFDz3s4WDY6Utex2YaiDmbUdYGJTUOuM 3kXU1Dbmc9xQDzmoJPIU+ivoT7mGih87U1/i4W7s2iaJbgDM7KXly4D591nvm3oGGu9BMh4DKEn 9z21R0ghSUi0Z2k+g2BOV3Esx3ZQWrT//64X88x1buPhHoD6
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

If another channel is already enabled period must not be modified. If
the requested period is smaller than this unchangable period the driver
is still supposed to search a duty_cycle according to the usual rounding
rules.

So don't set the duty_cycle to 0 but continue to determine an
appropriate value for ccr.

Fixes: deaba9cff809 ("pwm: stm32: Implementation of the waveform callbacks")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/pwm-stm32.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/pwm/pwm-stm32.c b/drivers/pwm/pwm-stm32.c
index a59de4de18b6..ec2c05c9ee7a 100644
--- a/drivers/pwm/pwm-stm32.c
+++ b/drivers/pwm/pwm-stm32.c
@@ -103,22 +103,16 @@ static int stm32_pwm_round_waveform_tohw(struct pwm_chip *chip,
 		if (ret)
 			goto out;
 
-		/*
-		 * calculate the best value for ARR for the given PSC, refuse if
-		 * the resulting period gets bigger than the requested one.
-		 */
 		arr = mul_u64_u64_div_u64(wf->period_length_ns, rate,
 					  (u64)NSEC_PER_SEC * (wfhw->psc + 1));
 		if (arr <= wfhw->arr) {
 			/*
-			 * requested period is small than the currently
+			 * requested period is smaller than the currently
 			 * configured and unchangable period, report back the smallest
-			 * possible period, i.e. the current state; Initialize
-			 * ccr to anything valid.
+			 * possible period, i.e. the current state and return 1
+			 * to indicate the wrong rounding direction.
 			 */
-			wfhw->ccr = 0;
 			ret = 1;
-			goto out;
 		}
 
 	} else {
-- 
2.47.2

