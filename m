Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5312046A0
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 15:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744039694; cv=none; b=K4HtXQDihDCMhSYaf0ElUMKztGuDV2zvfU1brnOcpk30xGEn9XvwoK0BibKI/Utqs7XqBW4gZEBwkEqaZaJAeSJhp0H7E7FOxvU2vI33uNaJ0H7354Y2Y4UC1jPjEee2mQ+aPrBZ4LzVFwdYIuoa/nSY5EEl5iXxiqd49uKwq1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744039694; c=relaxed/simple;
	bh=Ijknpk5Uk4hIjq83+lZpg+DXsxI0t9quWol4n7s82Jg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uk1+3nCFP4ueUdxcTSmpsyRj1JR0BF+LDf8vMtge+/SGx7hdflxkxMOQsNtUpwP49cXW6SqMlHMkVuVni97Mi1YdHFsL3fFDAfyqTPT1gF7XWfrahAYcGICaf7YVLNC0LGTWkajEKuWhrrJclr7sLaPTvL7tPTpEVWJkCk+8ITo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TXgppfrF; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TXgppfrF"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30db1bc464dso40799461fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 08:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744039691; x=1744644491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7gicrhysR2QFFxxlVaKRKpkwXL5D7hQu+/seU1sSHjg=;
        b=TXgppfrFtNPf8da4F7uAvFWqVrsHkeQNDYtI2xo4entXqZpt2yjyH+KnOTJ2Pxm8qf
         UzsRa9oLlXwwevmkU8+s0U7XXZlnKc5Fi7aN1wEzPZSWeD0bQIXCr7ORdfBNCojAiPlt
         Hgt/CsA8zyC1kI7XWa6w9b7aLYkCg9r8q36Mea5IVL4UQUyhBq1SNZc43ZT3GeQftdA9
         H8ejQO5c4fHVPAy2fE32jQJ3R4g1xPtyceDMyvuhorbeC5nTHEOMN8UazEhY78EZ4YG/
         YVI8DVRZdNKP3t4Itk0opmuvlnP3nTUH1FxdAD8eKQ6U3m23t64C93F7MNINzhceBaJe
         2RbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744039691; x=1744644491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7gicrhysR2QFFxxlVaKRKpkwXL5D7hQu+/seU1sSHjg=;
        b=gxgTZGaSqmNu5YVLDmjpZSfHal80I1pEZr4IDUEjSD9MTprwmIkhQx6jy4nrKNbX3Q
         Q3Pbiqf2GTQguMjNFq5SCigk0MRf8IejjBGsFg9lgtbelUs6iridzVCM9ohsCNocP9Zc
         txq5suxq40Y/3JfOey77d9MPrE+3FV4fNTpaXE6mqc9lBYsdMG7BOpOGydksAk+acdCd
         bWi2X3vWKEglPeRGSAesO1bYC+GxaoX+Nzi+pLgShYwRhkd98lNntb1AtVRuHrOmx8Qh
         EMSXD9a7deOZkFaErhrb6TAgVUqUraiazNKlk5Z4ioFTFv09783yzfNJNvJArez1/9dR
         sagA==
X-Forwarded-Encrypted: i=1; AJvYcCX1BDrhWlqDD+YsvmPTdxgYcbw67wsvRM7pLvGe7smW48ehOxtofpRcFxnkpLEcY3lAvRsN7v54QHe51ks=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7J5gFG8bSzKecbuXb3BJQxgzbck0wH78N/i+s9FzTUuqKxkqZ
	ZjU7VqBQoqgFSL4TNPlSI3MC9pstYarK0HOS0TvkBCfHXGTb8IONC+kxBCNK5nA=
X-Gm-Gg: ASbGncs1bcFsA+20xRH7+oLqQ4t7PzX+0bfKI4jYA++yolEEYEZ2PUeCVaGC9lwt8s8
	3g0ruF92+n4zOAQyU6qPRUJV6RqPxxvugBnjKHxQ/w6i7Ja7ewiZE6Tc+kXQy0cO67RQrQhw3CL
	efP7J4wU36L706XV8TyBCr/y0cnSZ4/o1qXrFcfxPVeAYZtaJ5QS/zqt03S1qHyYerI/hOzSOIG
	zCmlrsRwuGlk5kYsJXG+yf5QeBfp55Z+hBbQsVwEAtbJh+tOsQ5kWeHYqG0Zc1w5NeddFt5gOZE
	1FTx+sgKRuoK85/iXy7k5xm8lFBPUVuc1JPxeHE6oC3OFByUBPkFaGvOBsOL8EdjK1NrAEzxWiF
	etO1CXfRTVzI22d+HYqA=
X-Google-Smtp-Source: AGHT+IHhIxQb3ouOtoDhkU3Fmd8/KhI6GFSskoCR2n+C2BKMnFkWdfA/ZJhkp0ALJ+c5RIpyY/oQvA==
X-Received: by 2002:a2e:bc1b:0:b0:302:22e6:5f8 with SMTP id 38308e7fff4ca-30f16539e48mr25655121fa.22.1744039690725;
        Mon, 07 Apr 2025 08:28:10 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f0314c62bsm16158691fa.61.2025.04.07.08.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 08:28:10 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: linux-mmc@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Avri Altman <Avri.Altman@sandisk.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] mmc: core: Add support for graceful host removal for SD
Date: Mon,  7 Apr 2025 17:27:55 +0200
Message-ID: <20250407152759.25160-6-ulf.hansson@linaro.org>
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
If an SD card is attached to the host, the mmc core will just try to cut
the power for it, without obeying to the SD spec that potentially may
damage the card.

Let's fix this problem by implementing a graceful power-down of the card at
host removal.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes in v2:
	- None.

---
 drivers/mmc/core/sd.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/mmc/core/sd.c b/drivers/mmc/core/sd.c
index 8eba697d3d86..cb4254a43f85 100644
--- a/drivers/mmc/core/sd.c
+++ b/drivers/mmc/core/sd.c
@@ -1596,15 +1596,6 @@ static int mmc_sd_init_card(struct mmc_host *host, u32 ocr,
 	return err;
 }
 
-/*
- * Host is being removed. Free up the current card.
- */
-static void mmc_sd_remove(struct mmc_host *host)
-{
-	mmc_remove_card(host->card);
-	host->card = NULL;
-}
-
 /*
  * Card detection - card is alive.
  */
@@ -1630,7 +1621,8 @@ static void mmc_sd_detect(struct mmc_host *host)
 	mmc_put_card(host->card, NULL);
 
 	if (err) {
-		mmc_sd_remove(host);
+		mmc_remove_card(host->card);
+		host->card = NULL;
 
 		mmc_claim_host(host);
 		mmc_detach_bus(host);
@@ -1730,6 +1722,19 @@ static int _mmc_sd_suspend(struct mmc_host *host)
 	return err;
 }
 
+/*
+ * Host is being removed. Free up the current card and do a graceful power-off.
+ */
+static void mmc_sd_remove(struct mmc_host *host)
+{
+	get_device(&host->card->dev);
+	mmc_remove_card(host->card);
+
+	_mmc_sd_suspend(host);
+
+	put_device(&host->card->dev);
+	host->card = NULL;
+}
 /*
  * Callback for suspend
  */
-- 
2.43.0

