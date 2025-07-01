Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A58A276041
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 11:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370489; cv=none; b=LPfF3O7D7NjL7tAYONy4h4u4JOIWu57R0HfqV1jsY9IZWorCardEkdqk7CJFm0ncHffQUcM0T9bc1Ngk/DKajzDj2RWSKmnxc1oz3h5gH9C2Q8sGKpvlAg8dySzwDhwOtnNqD1/oWz+Mjv3Fu6hgXhQrkVSSWvI78CwVoQtuDYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370489; c=relaxed/simple;
	bh=QuGttwI0OZFvkoIf9v7woAbjYjj7oBHxyYqMn/p2JR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MdrUcAGJLxMO41gYsZjjTkFGR8EwjNGb8Tfgo5f8AdAQ434xq3Js8XoEYSWUfCygBJJ/Kz6bcttsUAQ9svaqchUK4C1GJIkbTUCyUXPxgHWrwhRliWRGnc1+7F5XTGA1NlqNYpCqRO0tcooob+HB6Rp5eoXgdNM6t5DoOPnVCN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jDQIm7mo; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jDQIm7mo"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-553b82f3767so3635511e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 04:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751370486; x=1751975286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fe5xgad5AXlWIH4ix+NrVYG0DCMVBlY/Hz/zA/w4CmA=;
        b=jDQIm7mo30ERWh6u/ffmL5ZepdmzGin+NLRWWTXVTRc6GoelJ8s9spfAChFOh7qFGl
         pn2M6JejfB1ulFI7W4nzaEIh9NoqP4bpszUDDLgSw5Q6yi4Ay3N3c56lvjibELoRnxuo
         vYrZK9x6rhM0SBbbYjpspBJSXZPzrbRxBjbvrpVClU2cDFSrQxxnmhR12RFFia5RpFfa
         o9DCYUKe3/9q9jBv75owEAtSoV8uiP/V8UBnggUpTIa2iklHk7/5kd1mPLTYT0ph1CSv
         in9eoTzHeXzD7HfjUcHw3OY9LZ9nFy9LvJTqLZ/o4BdDpWYcJY1BXzG/LIcKSktr95UP
         oNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370486; x=1751975286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fe5xgad5AXlWIH4ix+NrVYG0DCMVBlY/Hz/zA/w4CmA=;
        b=I4asjSy5DaxFH5jNfSp0n0okl9VQSd4Bu20fZIBud6Ks1OSdutKWp5NfEW+0oq6p13
         BvZqDl9KQVpJvopV/xQbVuUc9/6iQqqOxyCFt19VAY2KzhJR4b1YhZTTBRs+Ha9gm+Fo
         4rudpjw0MLt+jzdGIBevs+9S/piESorVLi918OjyqDvROCyTg9rQYRmqu7Aw+Xtdx9lP
         RyR8q7fUsG/wFZOcQ+qS3l7dDanEW+JYz7rp5f5JW3WQMyfh88Bjx1sbNnA6Shvn1HRo
         7Ml9PDgW24CNhvAEdw6RSXTmlbPGCxyugCYI8PfbeCghuNTUxXl/yPb3uwCoDhiT6/9a
         FQmw==
X-Forwarded-Encrypted: i=1; AJvYcCXGavCKt3HIobbKj1/kWwM5FmvI5FJMFhMZrW/J0y3Tg8YLX420RJHU/B0Eo3qe8x89PWUzTsENXQUlcvE=@vger.kernel.org
X-Gm-Message-State: AOJu0YygkV/byH8f2BnRwllUqYtVypxqzE9PXXgRTpJXih1pRaRMDzOT
	zm7AHig4gifct2VSZj/twJ6jIchY4gKgEkxcESTeMfU27xFpAbE8jjEYzen+p966f2M=
X-Gm-Gg: ASbGncuKPcyhZq7woL2CNfjK0IFMRjbSzVQPQ49lHDDVyNwB2Bu4oOopkhWSq268KMN
	W3wZ8IT1MxaeL1TIu52G4JB5pT+0dUDY9DDS+74T6K485d++j/5DbsG6NmRFlqbjUAAsty6oZTH
	ht7CNjkn5pqW8UDX2By971ksrHHc3Z5QyNGmVNT2Vsue7uTkCfkOFLF+EISJXIg3SG2EOLIPOsV
	VhSVRN8bkokPvj5YXHvnMwVCXRW3bnGpzRCj4h/yvTbHggiz6PMi5EwIZnZJG5w6fRf4GIXp/lq
	a/EdQ7XRrDqQb5WVVFd+kxvNGqFiuZm2i+9veWOcP/Os1YFVy5leQ6Wi3Y+3hSyVnoxpeO/ZbNo
	j06S+3VSkTT7acV8/HKdzfG8uMjjTvNCv+hn2
X-Google-Smtp-Source: AGHT+IGPH5aM5Z4YbOMg/s4pZiEhmK3ttk/WWSZNeNphwAL/3oCJAKxe81UqHvcdpBdwTW8Yth1UsA==
X-Received: by 2002:a05:6512:3ba2:b0:553:3407:eee0 with SMTP id 2adb3069b0e04-5550b860e0dmr6025596e87.4.1751370486189;
        Tue, 01 Jul 2025 04:48:06 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1800592e87.248.2025.07.01.04.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:48:05 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Saravana Kannan <saravanak@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Michal Simek <michal.simek@amd.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 16/24] firmware: xilinx: Use of_genpd_sync_state()
Date: Tue,  1 Jul 2025 13:47:18 +0200
Message-ID: <20250701114733.636510-17-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701114733.636510-1-ulf.hansson@linaro.org>
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To make sure genpd tries to power off unused PM domains, let's call
of_genpd_sync_state() from our own ->sync_state() callback.

Cc: Michal Simek <michal.simek@amd.com>
Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Colibri iMX8X
Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> # TI AM62A,Xilinx ZynqMP ZCU106
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/firmware/xilinx/zynqmp.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index 87ddbb7d11c2..02da3e48bc8f 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -20,6 +20,7 @@
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
 #include <linux/hashtable.h>
@@ -2101,9 +2102,13 @@ static void zynqmp_firmware_remove(struct platform_device *pdev)
 
 static void zynqmp_firmware_sync_state(struct device *dev)
 {
-	if (!of_device_is_compatible(dev->of_node, "xlnx,zynqmp-firmware"))
+	struct device_node *np = dev->of_node;
+
+	if (!of_device_is_compatible(np, "xlnx,zynqmp-firmware"))
 		return;
 
+	of_genpd_sync_state(np);
+
 	if (zynqmp_pm_init_finalize())
 		dev_warn(dev, "failed to release power management to firmware\n");
 }
-- 
2.43.0

