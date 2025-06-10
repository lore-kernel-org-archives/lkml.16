Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC82F2857FB
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 11:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749554210; cv=none; b=gDaP5clXEfCe+0vSOBoamSSXgHIZlR9wLVEZGoJVrytTpyzs4u3B0F9GCdTuQjnIDPe+UXpMhGT9/hV2BBoegsU35mgsbWSbKs7+y7RBdeemUKd5C3VUk4nTkP8bN5nj7lXRlmCGCEVvUMFvlCXzpL8/SMUpUDJv+MrceNOE1R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749554210; c=relaxed/simple;
	bh=Q2G+6qC4eXTH3lTxHkq3eblVciHhR4sMPJfXSbMcZXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kXenE/TLh3DCELY/HLpnGCBH8audemOXSIwOYdO6chllbRkcxhpFKhf1q2lfQ98PwBIu21A+Csxc1FqJPX4qwzfkOVHErDHn6Anig5058cLg8gALNGr+BO6GGZXXi1JBRvEjvOTvn68QS4KY3EzXtc298fIwJB/WdvOOxOn3CCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K3Sbiz9/; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K3Sbiz9/"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5534edc6493so5732369e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 04:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749554207; x=1750159007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wb7O/WfyRrI7BVa8uAeHS7SpLGTdVUHqO49VpFjc3ic=;
        b=K3Sbiz9/ydJUT61nEBgHGRWgUAxRmf2A5lbQhaTtJ3lH25p2Xg+ObsJrhs0To3KtXj
         LVH5bQKcs0XdZ5Uv/2yE+lM8DT7qE8ExHJzFFpJ4qc1DiadOb1JPwlTjKv7Hem7Bgl5S
         Gxl7C6u0GMjYnrbEg3vTSNkJPKyt4yMP+lNYXSqtK1nCLKHbXkqWEP7Szp4EBPGCd/sB
         y8CMhov3xxpLh56a2mnbsu2DJ58eI9ORnvICrjxiT1bhR7FuuGgrK9DqjDxhMkM6PjIf
         dMTZJGForgji1gWABYdiNET59PUnn+XkzLlP/F/SRmNZqHKzhCnOvQp+SOdMj0cN8+cq
         LV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749554207; x=1750159007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wb7O/WfyRrI7BVa8uAeHS7SpLGTdVUHqO49VpFjc3ic=;
        b=oOnd6qQaSj+Y8EUeLWvfS59oCh2JwfaNe/t9IEDB1CRTa8K1NbwWbvJtDbYb4LgEZy
         9b/yVOxqS1wiI4gVLE/oN0MZ2H2oXRZryrMp6TjBToqn2j9pv1NzjD0mQviTOey3c5xb
         7iyzh9jr6lo9xe1ZpV2/5ZsYmGQJxL5DYi/PWJCC2ERbIOSuAqYveJd07/gR+6g42SCV
         LRPzgPTHs6WffIWDjfgPc61KtuWl48dDkrSM3JDR2wOHbVNOWqBDtD4Rcl5Qs9pTGjGC
         gB4wlu96caeneO9jrpBqMnF4+eWLdEyrXNzpj1ssta43uORH4WWK/zfHJmwtfB8ITGc3
         nIqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWp6tJg7li6ZrA6BfJxzimSEw50czl/EG9j/945PEkEAzLO++eb/2idO4ku9/8/VX/1BEw/iez0oCzStb4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMH/1Ka//RuuyNPM4DG500WKB6PjPl3s2wBb86X0sUWsNhQpN4
	5Klf9vNUSzYr1++A1M7hJTNEJcvH6Bu1l/y47ivty2xXkVpdpPs984KUe7ZUF2jJsAk=
X-Gm-Gg: ASbGncudcoTt7PJ+X/NfxCgNOblhcXA1+Tqqiwg51Shqfz6gbVcQukpNVZjHXvZz6vI
	26VaSHxU8xrIyOq98op4ZxUYY9f2iCK4zYB+U3XqAcxaCs1ArjMnRkexAbpbOwVCtj5lXayEY0o
	lrzDAOhGYTaTki7edrDbmqNQJZgZ+jY4Qb+TURnXvVT/KQcipFpKghbdUQ+C+sk1k64ZS9+7f0W
	/S6DoSYbXzZ0wlQ8ZgCVlAj1o2e2e2SMkmgHgc/CGX+TM79g7L10HDpdC6nSMMwbF8dsUQLAbDN
	ueT096WxlQefPh1E+FTZ7lnZHYDhWfAINjeOJt6vyF9AqvbaxXEQbFTvDw+6DCGXRHIjfrlWhd3
	lIPXbzh5Fh0yumJxRG5bfoKP8WJkch6UPNVWd
X-Google-Smtp-Source: AGHT+IGcJjeSLPZhPYZFF9acT9CaBa+tleHeWD/nvlbTe8RESEGmC/LAyYSFCjwYD71GvdSbOrVrtw==
X-Received: by 2002:a05:6512:3b82:b0:553:5e35:b250 with SMTP id 2adb3069b0e04-55366c0262bmr4758736e87.32.1749554207032;
        Tue, 10 Jun 2025 04:16:47 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55367722481sm1500146e87.126.2025.06.10.04.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 04:16:45 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: linux-mmc@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Ricky Wu <ricky_wu@realtek.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] mmc: rtsx_usb_sdmmc: Convert sd_set_power_mode() into void
Date: Tue, 10 Jun 2025 13:16:25 +0200
Message-ID: <20250610111633.504366-4-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610111633.504366-1-ulf.hansson@linaro.org>
References: <20250610111633.504366-1-ulf.hansson@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sdmmc_set_ios() is the only caller of sd_set_power_mode() and it
ignores the return code. Let's therefore convert sd_set_power_mode() into a
void function instead.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/mmc/host/rtsx_usb_sdmmc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/rtsx_usb_sdmmc.c b/drivers/mmc/host/rtsx_usb_sdmmc.c
index c204cdeaee3e..af45bac019d2 100644
--- a/drivers/mmc/host/rtsx_usb_sdmmc.c
+++ b/drivers/mmc/host/rtsx_usb_sdmmc.c
@@ -1010,7 +1010,7 @@ static int sd_power_off(struct rtsx_usb_sdmmc *host)
 	return sd_pull_ctl_disable_qfn24(ucr);
 }
 
-static int sd_set_power_mode(struct rtsx_usb_sdmmc *host,
+static void sd_set_power_mode(struct rtsx_usb_sdmmc *host,
 		unsigned char power_mode)
 {
 	int err;
@@ -1019,7 +1019,7 @@ static int sd_set_power_mode(struct rtsx_usb_sdmmc *host,
 		power_mode = MMC_POWER_ON;
 
 	if (power_mode == host->power_mode)
-		return 0;
+		return;
 
 	if (power_mode == MMC_POWER_OFF) {
 		err = sd_power_off(host);
@@ -1034,7 +1034,6 @@ static int sd_set_power_mode(struct rtsx_usb_sdmmc *host,
 	}
 
 	host->power_mode = power_mode;
-	return err;
 }
 
 static int sd_set_timing(struct rtsx_usb_sdmmc *host,
-- 
2.43.0

