Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0839C225A35
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 11:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749554208; cv=none; b=P7kMQPNVJ6OxPCPaNdeMTX+2xS3smWr5yDrmAVUmIFoW3gt0F/PVJHl1IbvnsfRy9rtsb94fFMqW8GWYZxt3KnsGYHCwj+tf4BmUQJOUZ7axGdhWErVeD5KaGjOUXDjax2VkmlPRfxgbtaU6G6YBLgbf2OFj7f0T0fLRGSRvDXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749554208; c=relaxed/simple;
	bh=wLLJmOQJ18uLKIlN2M5/WYRzh0iJEMOdjCRJqqaJhYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qDF60pn8TaQGLolaMk/Hr6lS0I7KN84Nv8v31TnCb2RWoPSXma9J2fE9qcrIWU74WeuRSUnJAiuyvcYj8QcMJNGGTEk049tDy74vCs9H05Gq8/dmDD+VbnbeB6UOQ21XaP3iVYzki3dVqrs0o6Kz4GNlUkpGfnTvr8w4+mAW0zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jg7tMin0; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jg7tMin0"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5534edc6493so5732336e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 04:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749554205; x=1750159005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wnN9sQ1yphiBQx4a25u6KZxAXJc9uNDdDG1dBOTP22E=;
        b=jg7tMin0YEmDGDyZKwBYm9HuBxAe14hARHx4C9Djb+h2Dc6aSdvkTJL464MJKN8w7u
         6hRqytAQg3HPKOq/j20LPkSJNG0DVMIpqH4SUPyzzlg9AglUOAyWyL9AbAKwOMii/guZ
         KxStum5BVMMShgnzo7h+LOI6sYhubUXyUg2I7ZQI4nwFHXuesX40SWT/3yggnqurIfQY
         ai3miKs26pzfYpqfVGvfAvp1OZ8Iwpf65UwkF2CXrSBVT6oFcjJgCX/+IbMDHJRbVdkz
         JRLwWtxIvzLmLrRW9FfgyUmRD1kDtytSn+744CUWsP0ALMjYluo8X+v5YgqOOIt/sU9k
         F2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749554205; x=1750159005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wnN9sQ1yphiBQx4a25u6KZxAXJc9uNDdDG1dBOTP22E=;
        b=Fhljyhm2D4T7ofqXf68EEuIjgYd01p/gtxal7h/2Muo4jPqh4ZuVikQBZ991M8biqr
         AN8mHK4SN18N7fPmLivxpzIwwG5vRstjYbx9X4bOsRRdoScmcK8wB4geFAeKJClpJce9
         8YwinZUu7j/3NU13Bg6sFVlEeQecBwO4eDdXD0/ztGmW0Eqc0qH453MF5OlGuxlMyi01
         bCVNkQzX37HBVhdO2gthJDg8YdNA0hVQM8c5caOnlWmCpzh4drGzLqBx5swTEyJ4YEkm
         4Aj9uNVUZiCVQMOZjlX33e3BtFa15omLrMcl8KqeYuakmnZN3VF03OCL3WOh4hOCqtkw
         dZvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpbSXJ+lavYedwYf66mcEvDtT1Te7kzLopmCp8kktaAWFNTMG85j8sGLSYkGCiXrpJvk5O+pmVsu9ijqA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyemSFFg4bDswk4MOOR+lM8Sam/a5M+ZSZ246/8bZ3vLgSOWRtY
	VJqYM4cVLn+HqCHals02AkG1ATqPngbxC7FatVNZFQfF6EUTtAA3emTD6qXVGVtlqeI=
X-Gm-Gg: ASbGnculfIjVitihQeYv77cr9eJmtwHFFamoTzh7cc0f4elP+nBC/fgE9HC0DsR24iR
	PZUzHk59RO+o48lIbAqTwu9hGCz67IclSh72LlXakya6SlzRr1PDA0+sfXemaD2dLdl9iBDFpYv
	ZdM7AShDKh3/t9eqkmKfIjEYC4BLccTuFmtrXC8SCslzaMJlLz0QkQG5/I1T4K/NKUZ/ZF02cdQ
	3KfRGnpXeJT2xJmFtFhoG3UOkCxiaK0KYWnqZe7WnwfMWIEGwflkkxPbJrThvSJy5EfWX1wwAfV
	45K+2n40/rY4j2U7oyyiO3lSty0MElbTqMYxzbYh8XckrX5VjZj0DDI3p09xcDklMkoxN/L6eQx
	2cD3LBMpGrBBb/CNbI5+0KE6z3Q46hlIq5uK2
X-Google-Smtp-Source: AGHT+IGmpHd8lIlZVdZTjU5PAjkevrDkv0bWhCAiyYC16cFI40T3Wsvz/AvzpYrW0BRCpDYvuwv1wQ==
X-Received: by 2002:ac2:53ac:0:b0:553:20f2:2e77 with SMTP id 2adb3069b0e04-55366e33a1emr3605992e87.55.1749554205189;
        Tue, 10 Jun 2025 04:16:45 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55367722481sm1500146e87.126.2025.06.10.04.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 04:16:44 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: linux-mmc@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Ricky Wu <ricky_wu@realtek.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] mmc: rtsx_usb_sdmmc: Print debug-messages at power-on/off errors
Date: Tue, 10 Jun 2025 13:16:24 +0200
Message-ID: <20250610111633.504366-3-ulf.hansson@linaro.org>
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

It should be useful to know when we fail to power-on/off a card. Let's
therefore print debug-messages when this happens.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/mmc/host/rtsx_usb_sdmmc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mmc/host/rtsx_usb_sdmmc.c b/drivers/mmc/host/rtsx_usb_sdmmc.c
index 8c35cb85a9c0..c204cdeaee3e 100644
--- a/drivers/mmc/host/rtsx_usb_sdmmc.c
+++ b/drivers/mmc/host/rtsx_usb_sdmmc.c
@@ -1023,10 +1023,14 @@ static int sd_set_power_mode(struct rtsx_usb_sdmmc *host,
 
 	if (power_mode == MMC_POWER_OFF) {
 		err = sd_power_off(host);
+		if (err)
+			dev_dbg(sdmmc_dev(host), "power-off (err = %d)\n", err);
 		pm_runtime_put_noidle(sdmmc_dev(host));
 	} else {
 		pm_runtime_get_noresume(sdmmc_dev(host));
 		err = sd_power_on(host);
+		if (err)
+			dev_dbg(sdmmc_dev(host), "power-on (err = %d)\n", err);
 	}
 
 	host->power_mode = power_mode;
-- 
2.43.0

