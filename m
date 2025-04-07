Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C4F202C38
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 15:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744039692; cv=none; b=qt9v83TCEvrS34krNeP2Mi0qCcngOLivzXY1BEAIq1MrywVFHS2RVWX8cc5u3/42WROErwd1P/pvSlgCrqn7KjA87zi/K9pbRT6951bX38duFaEmtlIDsRZtE4JjWChpDbSjTthERfKHkd06ZOGwZlQvCFwUaEBoH0Zirt/yQ+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744039692; c=relaxed/simple;
	bh=6z5WCu9BKEtjznjzzsmgKzbsHck7/xCTm4ZcI9BylgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p5GfMPqKFNzm9mrNu6rPnfFIt62Ham6cSo2xPdW1vYYUBnB2Dh1NA4lTtCKkjFIjMiC7NEVJeY7HItZW7DBolKYGxo2Q59E3PMkSWcAK79bB6AAbicyUf8I2zVSi8Hz/EXTph1Ua6gchUkIJGhZWStN73Ak5eajw89OSFKz5A7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s/X6XMk/; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s/X6XMk/"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30613802a59so47792821fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 08:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744039688; x=1744644488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFgvCtbiUg2Axc8JMkDx3HvUYjKIsrcxL/JNSE1oUNI=;
        b=s/X6XMk/75K9Gj3zRaB/0v0dyUzD88BJWMAWmkAwaPRsV+atJbPDRWp9NHg4tyvsjs
         lfeDwP3wQTd4fp+rr/0qhAIjqBNq9DR0VGUp2ng9HULTpHM6XaARToYW+EZx6qXVQ68t
         ytcRa+skw/uI1gABLngvZnKXVYRTrfwS2FWx8LqkJhhoOmcbpuWNWXT3v1KmkGXJZsWc
         g2IJoz/PZcaCGDXptQRrIxP6xwMIvmic5pitZ167NFi6LLDb+iIgpEjgJjpFVSPTDNXI
         2/e8Q1rXsfBNw2vmd5k7P6uRWF84wEZ5TJPMEt7M3UTXzyTSNGV+tC8QPxm7gqIr5qh4
         mJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744039688; x=1744644488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kFgvCtbiUg2Axc8JMkDx3HvUYjKIsrcxL/JNSE1oUNI=;
        b=hEYXps1+18RcZ/mBszPg+1CW/yhDoWqo2dMIDFWCnkt5vjVspJHwcnK9BFQawrphkA
         8MOHmD6Qd2L4GTNpwmOKWTGpTsYIU2jnm9ATE3N8dSmw6SdOuCeSyWSczIYSPzRgee25
         TUCmGDTZ1yjm/jPJD14mYfH6ELBmCXH7Bw5TpYYiW4m/wUdkVNNTGgdzahC0BjxDtgnU
         6TroIjAAwyv2SAj5VsbW7iOz/Nu8Ek+hyXY4MRfuBAKoyzjQ3McAkEZqzvwuO470VEr9
         rLz3Oij5osqZkB29uJV54dFKUgGBawio4zPkQX2K/cTFhlNPP9D6z5yfMYPbq5iBQJFJ
         7uMA==
X-Forwarded-Encrypted: i=1; AJvYcCUyGq8OtzguiGqdfgyZLzUbqU14u4wzxVpcv+DXCC8B4c9ZgaupdbVQe25pk1vsmCyu++/fpA0bqjR/LDY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxyLDEsudlZVzVhh0lltjUlqSVQUQmMykOGJB2LQXimVXWD4U+
	i9U5vYhmDv2+WHhfeGJC7275WZOY4uuecXQV/0KaCNdL3WIc4L/bFlE/c2f1zwY=
X-Gm-Gg: ASbGncuP2iljmbaOQ4Z0T4f1nsAg82ownJimuKi2eQXqMdb0zfXlWnkTsSVL2vZauie
	4UzcCf/IRIAhmjSVhH8rku1RiaG9DYkW4DlnVdeUM95nGEpAwfJ7ksNc71xuW1kwZlIuXVIqsBU
	QNHybjITyzCZBD/hb4iXU1Y/eTpNmrnem/rkF2fpUySL4fI+JIQ69Y6o3BZM/lGP4IiIhNYnI9J
	920DQnJIXHNlF7ii5QBVFm4VzOHT/uBSIvLs6xb62fa9/VXG01TWPBLyoR0g6C/yR7wK/pQeUm/
	sfWHWlQEYwdSXcQ3Lbr8lSiabPweJEbXHA1khLMEw5iieb+M5af+W71kqp2zTK/s7rCnHWPZYkx
	lx5MRkR/PmS9lH7kLFaA=
X-Google-Smtp-Source: AGHT+IFdkzDl7qG+++GgExUEpecThyhFzUirOW/vapvpkFtPwvl1pIIZxAmc9QEAxBzudyVIXtO/Ig==
X-Received: by 2002:a05:651c:158c:b0:30c:2e22:c893 with SMTP id 38308e7fff4ca-30f0bf50edemr39634651fa.23.1744039688540;
        Mon, 07 Apr 2025 08:28:08 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f0314c62bsm16158691fa.61.2025.04.07.08.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 08:28:08 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: linux-mmc@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Avri Altman <Avri.Altman@sandisk.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] mmc: core: Convert into an enum for the poweroff-type for eMMC
Date: Mon,  7 Apr 2025 17:27:53 +0200
Message-ID: <20250407152759.25160-4-ulf.hansson@linaro.org>
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

Currently we are only distinguishing between the suspend and the shutdown
scenarios, which make a bool sufficient as in-parameter to the various PM
functions for eMMC. However, to prepare for adding support for another
scenario in a subsequent change, let's convert into using an enum.

Suggested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes in v2:
	- None.

---
 drivers/mmc/core/mmc.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index ee65c5b85f95..c41cee7ef267 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -33,6 +33,11 @@
 #define MIN_CACHE_EN_TIMEOUT_MS 1600
 #define CACHE_FLUSH_TIMEOUT_MS 30000 /* 30s */
 
+enum mmc_poweroff_type {
+	MMC_POWEROFF_SUSPEND,
+	MMC_POWEROFF_SHUTDOWN,
+};
+
 static const unsigned int tran_exp[] = {
 	10000,		100000,		1000000,	10000000,
 	0,		0,		0,		0
@@ -2015,15 +2020,16 @@ static bool mmc_can_poweroff_notify(const struct mmc_card *card)
 }
 
 static bool mmc_host_can_poweroff_notify(const struct mmc_host *host,
-					 bool is_suspend)
+					 enum mmc_poweroff_type pm_type)
 {
 	if (host->caps2 & MMC_CAP2_FULL_PWR_CYCLE)
 		return true;
 
-	if (host->caps2 & MMC_CAP2_FULL_PWR_CYCLE_IN_SUSPEND && is_suspend)
+	if (host->caps2 & MMC_CAP2_FULL_PWR_CYCLE_IN_SUSPEND &&
+	    pm_type == MMC_POWEROFF_SUSPEND)
 		return true;
 
-	return !is_suspend;
+	return pm_type == MMC_POWEROFF_SHUTDOWN;
 }
 
 static int mmc_poweroff_notify(struct mmc_card *card, unsigned int notify_type)
@@ -2120,11 +2126,13 @@ static int _mmc_flush_cache(struct mmc_host *host)
 	return err;
 }
 
-static int _mmc_suspend(struct mmc_host *host, bool is_suspend)
+static int _mmc_suspend(struct mmc_host *host, enum mmc_poweroff_type pm_type)
 {
+	unsigned int notify_type = EXT_CSD_POWER_OFF_SHORT;
 	int err = 0;
-	unsigned int notify_type = is_suspend ? EXT_CSD_POWER_OFF_SHORT :
-					EXT_CSD_POWER_OFF_LONG;
+
+	if (pm_type == MMC_POWEROFF_SHUTDOWN)
+		notify_type = EXT_CSD_POWER_OFF_LONG;
 
 	mmc_claim_host(host);
 
@@ -2136,7 +2144,7 @@ static int _mmc_suspend(struct mmc_host *host, bool is_suspend)
 		goto out;
 
 	if (mmc_can_poweroff_notify(host->card) &&
-	    mmc_host_can_poweroff_notify(host, is_suspend))
+	    mmc_host_can_poweroff_notify(host, pm_type))
 		err = mmc_poweroff_notify(host->card, notify_type);
 	else if (mmc_can_sleep(host->card))
 		err = mmc_sleep(host);
@@ -2159,7 +2167,7 @@ static int mmc_suspend(struct mmc_host *host)
 {
 	int err;
 
-	err = _mmc_suspend(host, true);
+	err = _mmc_suspend(host, MMC_POWEROFF_SUSPEND);
 	if (!err) {
 		pm_runtime_disable(&host->card->dev);
 		pm_runtime_set_suspended(&host->card->dev);
@@ -2203,11 +2211,11 @@ static int mmc_shutdown(struct mmc_host *host)
 	 * us to send the preferred poweroff-notification cmd at shutdown.
 	 */
 	if (mmc_can_poweroff_notify(host->card) &&
-	    !mmc_host_can_poweroff_notify(host, true))
+	    !mmc_host_can_poweroff_notify(host, MMC_POWEROFF_SUSPEND))
 		err = _mmc_resume(host);
 
 	if (!err)
-		err = _mmc_suspend(host, false);
+		err = _mmc_suspend(host, MMC_POWEROFF_SHUTDOWN);
 
 	return err;
 }
@@ -2231,7 +2239,7 @@ static int mmc_runtime_suspend(struct mmc_host *host)
 	if (!(host->caps & MMC_CAP_AGGRESSIVE_PM))
 		return 0;
 
-	err = _mmc_suspend(host, true);
+	err = _mmc_suspend(host, MMC_POWEROFF_SUSPEND);
 	if (err)
 		pr_err("%s: error %d doing aggressive suspend\n",
 			mmc_hostname(host), err);
-- 
2.43.0

