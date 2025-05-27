Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8331E1C1A
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 05:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748325309; cv=none; b=lZ1KQuHSmyyZfvFZ6xd8nstHOVhVZQhRt3Vl8lv2pe0kp0M5NQI4LHoyT6oSzXFepYnjYECmb175T448StormyJahbkum0x/p+HeXUUHhwtNnf/dKZL5LMx7GkTvDyTvCd8mKkBVFcz9j3s8X/bNVHj7OxAd9fTXRMXfL0JjYhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748325309; c=relaxed/simple;
	bh=kp2Ho/gN90qoPt7EOupJs6drcisxOPFdqCVoJAm4AUk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tMRu2YZi2CcXbRchoHxsS5q0Yvw/YUalsY6Vo6oirclKVCavMiC+jglqTszjmzmsFMCBiYmoUNDbd+cVHYOeXIQB4kt1Lzeisg0QXkkppsJSRlg5f16lyyLfFCxFFgYfxMFhFV8Xk+0NVhb5h7eT6MYzl9dko/22H33KFxUdz6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oqBvIRK6; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oqBvIRK6"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6049431b0e9so2536829a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 22:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748325305; x=1748930105; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0/92qQ8/8bI1foaF/B/6o65zGGONk9qpEUFF2woz+1A=;
        b=oqBvIRK6POmfT6Lpcsd6rtLAadL4/sk/ZvLuE/DlnDsmWoT8GJGKs1AbGOToP/560N
         q+wok/6j9NUxz7tdV/UKvySUjjXgURCOkEx5cGyuQPScB49rvwfi9A1EG2dhZRNw1ANw
         v3OXvegVtDbJ12mJW0exwPsJ0hLnEzjBwKezoN8XOmMQ2Ja6HGfhHUCwiD6OHFvaJ/DA
         iAdv6DwNssGp0yZ/yr+Z0JtY8pQnHDTag20uURulIUtuvRKnIG2K8HT7mexi/jj4SEGk
         bm7Atk3CzfGgQHmKECGcYoBO5ShbMjzHwur97nY2EVw/dCl0VXjEOJ4OF3ujguvlKPd0
         O0rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748325305; x=1748930105;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0/92qQ8/8bI1foaF/B/6o65zGGONk9qpEUFF2woz+1A=;
        b=D520sSJPa4C3knpvLmbcP2sC7GMM+s9XooL0SYfwBnFvN6+o+25bhBTPsYyQAGLHFC
         h49LQbyP+8XIKYrsTNcfeG6uQw3NgZfnBDlP42gMSTarGhlYGbWJ5scWv9/gQeLB9EM6
         CHL9NM0xVG7paDMj61zCfXmxpDJVi2/P49LUigBGo5AyqWP1kuMTwar8kgRJdrw5sVP1
         FaXqUan1YLCMKspakIEUpVAONhaq+JDwwc2NRLUWRgydNT9mJIqTCvFXVQ50xZNsvHWn
         3ZRCbAqBD8TcByNUD9ODukLwJJff2CVlSTIu673ljFHxYqoNNxUT1OY1cxRncWxYwe90
         ii3A==
X-Forwarded-Encrypted: i=1; AJvYcCWOMo289fiprn9/Dcs7pdyfw4tLL3y1Vn5977zdDIOqBbi88BBDDJFZ6JGZjccdHBpPzCeL284h0rQOhAU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoCYGsIGgjpSd7jvButSLHN/8oWh/AFgxTfQ6vKQEmerf0YVq+
	92M8Fwmu8xZdS7qlp+9ohZNgg/IrVkTQPLBW6fIad9un50J9jqGeDjimcC4KTVjt3pI=
X-Gm-Gg: ASbGnctDaEYreaBGrSy8x0XChWlttT05eEre1c3bG8y72MlsYoxpB2j5B1GubBbE9B6
	gF9gD7IjQuiMRlUhcdvpbr+r2H9XMK/Bm5NalwfHp1WsLmLQYADvq92DOeg8YpcuKex2L+UFRjr
	ZR6iW5TO8Hn4+LdZjkcfJmOv2eLX+qhA89WxMoj3kqGu9Cas/xvpJ+E6KyuhE9GXt1kjxq8oqBy
	PZ2NGV9d8CYpJyBFxqDoVI5bGKxQ6sqMhJ/Pm687hfa7fKYNrGDx3AlfW8LbE/nZdCFQO2aaRrY
	fpZGE6Xiba99LmSRZsjyuzhdP8f+n9JJNkXTAwyo2KnErV49bQK6i1xSgPE3VhPgv3DGUuI9wdg
	=
X-Google-Smtp-Source: AGHT+IEv5s7xDmY7xLIqn57Glb7AygAOacFI1nEFLy11fNwi+mIgMvJcQA8W8aLW+zQYLW7VY4hQDA==
X-Received: by 2002:a05:6402:2713:b0:602:1832:c187 with SMTP id 4fb4d7f45d1cf-602d8f5d5camr8978474a12.4.1748325305573;
        Mon, 26 May 2025 22:55:05 -0700 (PDT)
Received: from localhost (hf94.n1.ips.mtn.co.ug. [41.210.143.148])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-60464875b8csm3393023a12.76.2025.05.26.22.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 22:55:05 -0700 (PDT)
Date: Tue, 27 May 2025 08:55:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: [PATCH next] mmc: sdhci-of-k1: Fix error code in probe()
Message-ID: <aDVTtQdXVtRhxOrb@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

If spacemit_sdhci_get_clocks() fails, then propagate the error code.
Don't return success.

Fixes: e5502d15b0f3 ("mmc: sdhci-of-k1: add support for SpacemiT K1 SoC")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/mmc/host/sdhci-of-k1.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index 6880d3e9ab62..2e5da7c5834c 100644
--- a/drivers/mmc/host/sdhci-of-k1.c
+++ b/drivers/mmc/host/sdhci-of-k1.c
@@ -276,7 +276,8 @@ static int spacemit_sdhci_probe(struct platform_device *pdev)
 
 	host->mmc->caps |= MMC_CAP_NEED_RSP_BUSY;
 
-	if (spacemit_sdhci_get_clocks(dev, pltfm_host))
+	ret = spacemit_sdhci_get_clocks(dev, pltfm_host);
+	if (ret)
 		goto err_pltfm;
 
 	ret = sdhci_add_host(host);
-- 
2.47.2

