Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E72204592
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 15:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744039693; cv=none; b=cR5gqyoP4Ny2jw6EuqwmPkgp/4qUAwQxAwu6o83BsFkxhUUKROT6endz3/+FXzEEc5+wFj8/F5GJ2RCfW82j6XOlEoQIrv0Iu0vTHKv4KiGys/34zrz21YWzeA/M5WUs5KcCZ9wbXkd3jYYvvRgJ8TslxVPEmidg9LGY2hvP04o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744039693; c=relaxed/simple;
	bh=KZB+pX8+Z+t02Vyu3JiH1fIAeOGA3SvV4prne66BLo8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i4N1brFTRFPBIfUys9j1xEIeAvF0bB/tlor/DdJN4P7Gi3rEHs3tV/GEVLsMKTw6GQ+5qFCVAoI9l/eohbmojQ8licqLcYhri3qjSY3+s0XFR8D+ydQYHjzoO6ahzsy/Sq5inLEgBI0HW9S9pQ+7yxoDxgTL1mQosfvj2KCGEic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HdAI2e7m; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HdAI2e7m"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30bfed67e08so45199471fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 08:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744039690; x=1744644490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qa0NqKrTJ654Zn0Q1P84Jb3f7w9bMHpFgeDh4gI/15Y=;
        b=HdAI2e7mDs1MEGlnG9DCsAZAN6uv0tgrwh0PSd6SBdIzNZ+h/bI9WrQsuMfu3fQL18
         U7OfNz7jdvi2bdtbxaVOGmT9QldDz8Rt6Fjd8tM87Nymhv+D6pcLrEym3BD8GcFzZaRD
         MPTrWww2ybXBfNJwwU98KOIF52xHJVylIbymjn2QH2fy1QOM+qoVb+O/k9WKpu+yHcZG
         GMdg6tZcfwB0xAdmVWnq6WRhgqZncDirSyizjfrNlAmVN9GWvR8NsrnTdSL7FyXef4u6
         hUW9tAOjwyaXzfLsy4JHkD2UWzenYg+tXhGiYPgu+Mx8gwf3qaabaiJ0EmlTcvg4XGR+
         9nDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744039690; x=1744644490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qa0NqKrTJ654Zn0Q1P84Jb3f7w9bMHpFgeDh4gI/15Y=;
        b=K2Ot7MCI/Cyf9nC2mYpGSc7TqO+0J56ccCGUoY8V2edHKRljGK4CNRQyRN7fvQPPhx
         osaESCtuYyuhkjYwzx89X5g3Rh9xTxa3UiiLZIyhBBeGX1UUQjft8tVqjlXc5lO+BSFs
         c+5caZ/SkBCgQPC66F6sY30eHOiN4NZqoWWT4K0x21n1mhpWx6h9YImzOkXPYkSZtUGo
         DkeX1yr2QXVaHjK5HPbPYRjmT9nStsjrvPHKrG2XDWIRc4dQeZIFx2tUf2BxtHG4NH+f
         a4fnRH7CmwvcNUfvWLsOsQLV77BOk5+VHT85V9Vw78A0lc6YYXCQT55nw249LlSyLnwE
         QjBw==
X-Forwarded-Encrypted: i=1; AJvYcCX/c3b+jCK/e6WWOOmHdESF6k+TmM6xo9jn3+NeRklkL+V4b+q07qCV9zxikBEjpNNum4Dx5sxqLjqGnDY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTeH8ozm7VAoGO1WxvcJwsp5YjQ7f4AG6jDK/MrrFwbLhntE0Q
	gTWOXsw6aNtE3Py1qKWfkcPRwM1UDjm0txBW7kFkK9xIFQhff2Aqs60T7hiY+C844cCfHqAYp2j
	y
X-Gm-Gg: ASbGncsOg0Vc72UiBEHEKm2AivlC7bhBS+x6waX0eZ5IpCjEkZZsSuSV8ZcxeQc3Pdn
	j0D/Z79DOT5szCMkdgIgGq/WC6PhusU6p+CECJAKu5eVnappt8Ndlh4HYAMQ3FrSfDQPV8W8vah
	y0Yd1iS5cdSh9Si1O+whleABsU1oN6384h3M8Bs9aUToQRG1TnRziH7ExKh0dIp9jHLQW+ZONkN
	tIZagpNdlV1C/duDM+QCTUm/7TQ39prxVwANk0wQokQ0NhBZjMpb7LFeqRpGfcyifyOydpFZW4x
	8JUhSeTKSJf1eYDf7usck9l436+8q9ZJr9/VBwvRy2CYe5fO+MLF+iKIknsjG8MobrlMJUvNhJ/
	5yOkpk41uFrerhMxTfC0Xy1pR3MFmbw==
X-Google-Smtp-Source: AGHT+IFeOmjZZCVinZE9PYC+J15PmJZZVU9CLynwj9bgWoY1cdAzycB5GWB7cxZRv+fyPdkRgXGDbg==
X-Received: by 2002:a05:651c:3130:b0:30b:cef8:de87 with SMTP id 38308e7fff4ca-30f0a0ec55dmr40033581fa.4.1744039689698;
        Mon, 07 Apr 2025 08:28:09 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f0314c62bsm16158691fa.61.2025.04.07.08.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 08:28:09 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: linux-mmc@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Avri Altman <Avri.Altman@sandisk.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] mmc: core: Add support for graceful host removal for eMMC
Date: Mon,  7 Apr 2025 17:27:54 +0200
Message-ID: <20250407152759.25160-5-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250407152759.25160-1-ulf.hansson@linaro.org>
References: <20250407152759.25160-1-ulf.hansson@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An mmc host driver may allow to unbind from its corresponding host device.
If an eMMC card is attached to the host, the mmc core will just try to cut
the power for it, without obeying to the eMMC spec.

Potentially this may damage the card and it may also prevent us from
successfully doing a re-initialization of it, which would typically happen
if/when we try to re-bind the mmc host driver.

To fix these problems, let's implement a graceful power-down of the card at
host removal.

Reported-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes in v2:
	- None.

---
 drivers/mmc/core/mmc.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index c41cee7ef267..48656dadf93b 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -36,6 +36,7 @@
 enum mmc_poweroff_type {
 	MMC_POWEROFF_SUSPEND,
 	MMC_POWEROFF_SHUTDOWN,
+	MMC_POWEROFF_UNBIND,
 };
 
 static const unsigned int tran_exp[] = {
@@ -2054,15 +2055,6 @@ static int mmc_poweroff_notify(struct mmc_card *card, unsigned int notify_type)
 	return err;
 }
 
-/*
- * Host is being removed. Free up the current card.
- */
-static void mmc_remove(struct mmc_host *host)
-{
-	mmc_remove_card(host->card);
-	host->card = NULL;
-}
-
 /*
  * Card detection - card is alive.
  */
@@ -2088,7 +2080,8 @@ static void mmc_detect(struct mmc_host *host)
 	mmc_put_card(host->card, NULL);
 
 	if (err) {
-		mmc_remove(host);
+		mmc_remove_card(host->card);
+		host->card = NULL;
 
 		mmc_claim_host(host);
 		mmc_detach_bus(host);
@@ -2160,6 +2153,20 @@ static int _mmc_suspend(struct mmc_host *host, enum mmc_poweroff_type pm_type)
 	return err;
 }
 
+/*
+ * Host is being removed. Free up the current card and do a graceful power-off.
+ */
+static void mmc_remove(struct mmc_host *host)
+{
+	get_device(&host->card->dev);
+	mmc_remove_card(host->card);
+
+	_mmc_suspend(host, MMC_POWEROFF_UNBIND);
+
+	put_device(&host->card->dev);
+	host->card = NULL;
+}
+
 /*
  * Suspend callback
  */
-- 
2.43.0

