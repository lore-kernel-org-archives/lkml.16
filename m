Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE07D19C569
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 01:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751075619; cv=none; b=ldPcyeTI8JXLfEUPvQ654aAhkb/nT730SxwzattgAnBfwizxjHWfKc0ve2K2dgJ2iItpGPXJLYKkq4mckpGMLbM6rAujPJc/kPkeNHrBsZe3o7CDLdr6oCk9mmG5IzbpkQ6OEPqaFyhRFQIw/PQMMgsebyG24TvU3FsWf1dGm80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751075619; c=relaxed/simple;
	bh=xAVEsFJaJpe1cuzT3LWf6Yt7wVSF7ac/1D8++/chJis=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rWHq5ZsU/oyIq9CpntJ/wu+Nzn24PiY4pItoooykKoTlWpbac4KLUxaw33r+m0pXc3jtJa+EUFnV33zFG4mngOiPmY0MTs47daU6GLhWpwsFIjoyVPBAdyLRPfH4nSrO3saavX77qA7Y+HHd6JIagqrTD8WEp9x/BEnNDOxNgXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=libre.computer; spf=none smtp.mailfrom=libretech.co; dkim=pass (2048-bit key) header.d=libre.computer header.i=@libre.computer header.b=gk8BRuiP; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=libre.computer
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=libretech.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=libre.computer header.i=@libre.computer header.b="gk8BRuiP"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4a6f6d07bb5so5323771cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 18:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1751075616; x=1751680416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IDgANBooOaHABbpjHHyBVc8hQrSombBZ6qXbl2V9NGc=;
        b=gk8BRuiP6zV7SsQTXRzhKoEH1aAVPWlIyRbasH9Q8uDyT3xyc0s5EuWKXDabUbBgXP
         DzxnnOdNCg6uh22ool2WDzIqoiUwuKVTmu+i9naxLUJzarn1Pktm/37KhMoD2f1C5hZx
         MSrnsUAHKwVs0Nx1LyNHsfMBjjGMtkjm/5avxei9yDmRhYcFcDMPvEfpSFUitUzOLImh
         TbQOeYOTu9gRTWfG0hn0Dj3ShTPA8fTzcftpblPTjNHrd8eJfDJdsGKbt+YWc/0LiPjn
         fY393AyVSEEES0RjM4L2llXdiusOcP3wWdlizBJa5p7JCAE4/m76A8TaPNCPbu+AmVgl
         54iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751075616; x=1751680416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IDgANBooOaHABbpjHHyBVc8hQrSombBZ6qXbl2V9NGc=;
        b=UZlvhas25XrBQYbkqAt+8/pkeFhag0U6Pbj+PU6K3L1Lxl+Vw/qf0xv3Edfwals+Pm
         h/3C0puJ5rQa4JQDXnslLEUYIriyuoeLyZ03lUS248+PChG7xjsNqHU36MyEVBQmpuTZ
         SmOxLRWa1n0ZkqyP58vkz65jyFpKOj/KIUxOdY4WNGqdgXst8iurhfq8voEfYYLbebuL
         SwT5ZyfyzvcUx0cEFM2Idxd874lO5S4WuLwJhIlIWtANCx+SVuN+jGCGrqjJ6GjN4Cjc
         eIGctn23vknEQC3lMA/Scvc3K1oa1ZeG9/5TifzGeafEYCqZ8UthA2sA1Vuholdj7C5N
         5Vsg==
X-Forwarded-Encrypted: i=1; AJvYcCVIv3OCldTnYjtqyAxHJ16YhlKBIECh/Fvd9m9CjoLuzzdj2Gnc4C4z+2gZgNQ8JYmvMzUXMSCRbFIBJJE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNeaDc1vYPJwJxJWZdBouAll3mVyCUH8yYpLBELhisxZY7w4sy
	6KetNeJ/FyH2chKYddBV+1T8BffCxus/7UlwQ6qN2wSol237SJ826uirp+pPbf1shg==
X-Gm-Gg: ASbGncvUdbTm/+msGDp4yy4V/LKPsK9YTH6VrIeI8WqhsvfbMQLIcTmfBp7o5k1VftX
	FiR9S49hPdzzLw1gVp+Xk3P/RqzNjxDRjWtCaBV79Xk9GFEa5dRKNg+mbXsT3iJ/WcS/Mf5To6T
	ENTDxGaYPyojM6rdNNCl+nha6aZSAUju/ugKvG3e1qEAImf55rOwq5OilINnRd5mhCiaLpQaQzd
	itUR/GyXtUvX+yLgNOVWFt2G6YZgKh/06sh8HyyqpSSPKPkfCKVXCsBJnfaQWRu/z8YYYDLgJq2
	i7oIaD6tbmi0f6wbatgFiadWeeVHfTPVBC29rywjFAGmy+6hHvFnZt4+GCV79yHYjAzvLA==
X-Google-Smtp-Source: AGHT+IHDOFs/ZbAzvN7ioQVvaBO3tKspbKCC2PmmEG/e0ea92CY3dBFRoIiyAncqYqaZi3cyXQ2vdQ==
X-Received: by 2002:a05:620a:198b:b0:7d3:f3e1:b8c4 with SMTP id af79cd13be357-7d443944e85mr816887085a.15.1751075615803;
        Fri, 27 Jun 2025 18:53:35 -0700 (PDT)
Received: from localhost ([2607:fb90:6159:6306:aa35:a456:78ca:2103])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc55c396sm21861621cf.50.2025.06.27.18.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 18:53:35 -0700 (PDT)
From: Da Xue <da@libre.computer>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Da Xue <da@libre.computer>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC] mmc: meson-gx-mmc: add delay during poweroff
Date: Fri, 27 Jun 2025 21:53:28 -0400
Message-Id: <20250628015328.249637-1-da@libre.computer>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Regulators controlling the SD card power need some settling time for SD
cards to fully reset from UHS modes. The regulator framework seems to
ignore falling times set in the device tree causing a few boards with the
same hardware implementation to hang on reboot because the SD card still
had some voltage and did not reset properly to be initialized again.

Add a delay sufficiently long for the voltage to drop so that the SD card
can reset properly. Otherwise the reboot will hang at missing SD card
especially with Samsung cards.

Signed-off-by: Da Xue <da@libre.computer>
---
 drivers/mmc/host/meson-gx-mmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 694bb443d5f3..a39906079d29 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -605,6 +605,7 @@ static void meson_mmc_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
 	case MMC_POWER_OFF:
 		mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, 0);
 		mmc_regulator_disable_vqmmc(mmc);
+		msleep(50);
 
 		break;
 
-- 
2.39.5

