Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998F423F400
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 12:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743598081; cv=none; b=hVUF+CEM0O1y4SAEEruMj/TUiy8h7MU35EC9y8PiqYhiqf0jzBNsp9J94FJKIqLrSdDimNq0ZUOG8xdHiIxXYnBmM4PTnZMgCaBYHDvVHzdJucfwK275guQw1UH2CaRW98jPBMUsXnTsYY+K5uIorhkxns62BGr30oTtjj4G11I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743598081; c=relaxed/simple;
	bh=TKE8yYqSvh5CTfDsthEGrDa+fvp8GLdxByJGAAoWQ5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EzXZ6ds31bZRQ5qtpJApsgY4JHNMdW69TN92yxtmilepgiAf74tM6wgRZ9HV6sq3vB0f7hf+iHBR0AiBAXX8vxr8VWKNG8yUAQTedV6rQfoF3eCod9+o407BDM3lYS9X7vimYpMcVQY+dnQzSy4VOY0FR3FvADGHllS77bEcvdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b6f8kIXB; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b6f8kIXB"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso49813885e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 05:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743598078; x=1744202878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8rEM6GDoOc8qSQG8ptxriqMDYs/u8ieO+7RntT8HZ8Q=;
        b=b6f8kIXB0gyTu6UsdhiQGjmQDOqxllcxCZSjN4EE0kUdXyl/QntY+9ya8G5msKSCW/
         ncksT7hEmpi3PSzgoy2/LeS11nPTP1nMqVIAGbw2mlyLUFFWHt/gMgrnwTlHQhPN6+b8
         FFz+1gekq8JhD1qGB/TJWkKEPaPr4T+LxWcZv1Dqf+ebs8TuO0G20b7MES0un/KxO2H2
         o40VHKtysDxm2qSPphBBfD6yeCcmqBDvh3VV88El/t5+4Rdd58nl5JYtXX2B2d0ftB7c
         4KHHxlXrNd0a9EnozLsnFt56r/UxOzpgLe9OkwWSItxyqGrzqmfFCkyuJE1lul90Ywrz
         BbmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743598078; x=1744202878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8rEM6GDoOc8qSQG8ptxriqMDYs/u8ieO+7RntT8HZ8Q=;
        b=HjpZnFIRPMXpFQwPjSBsczVGxpTlSNY65nJReaLuOuD7BFHNFNX0s8xYM1hJxBNJsJ
         lGjSUi3IsGZ/qduTHNF+fvpoeRnVvlXr+OwO3npmwkSTV4dCavrc+7nFIdv+f7xPfMtm
         I0FBi6sV/iIgNj1v5KCYX1rJi6Z5DEROHzPUmLqWZKQIBt48qRDwjccsjSYCM1Tr1kw2
         a0lF+BSqG/TTNZbEf3AiHH/lii8I5GuqNc1UvBtZQBWQIlkyLxumfyDZQIAodEjOWGNa
         Pa7R5Wi4JjvirPAqNzs45mlHLHvgQXju3rukWoupCTowRW5IRzOQcQgnlpPJusBE7ZfW
         K+cg==
X-Forwarded-Encrypted: i=1; AJvYcCU9QwwYfeY/2UlIF+anLFp5gxvzxBsaQX74u8Uf7HqU7a/d6Ap6ULaP/fWIpILF61dbbGuYKH3+vyzRA1Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZsdeOgi66jm/2Am6xnB+MTzP/h9uWtK6OqJyMoOU7cL3VoC+2
	sMNlnbEDtdlzdbVsGmylP4cIg0lo1zpRTJDRXSYtQIfKe/x+A1r8GfRHyaxkawQ=
X-Gm-Gg: ASbGnct7uFME6De3b4woAvueLufWeD9uNJU0VLvSy8eXf1okgvPhSeNu6pi9UWtq04S
	hLETVGsz+uYoi3O2ZXHopgcMI953nVepIs1RxIRYRugm6IBpufeRMiiNz2960Bs3fuUJMSzPbTw
	BACTg4cdcGkmygdPrRdbNvfav0rzrlYLbJa36FbU38bXOXe+JmhYBpnHZBx9QL1iJP6/HR+1VXN
	htZJJX7n7e0Yjmi+gPYZxUrC64IF5S7x/SvWJ/ZOcDMx1HQcBnK1hJ/KxkX/MW+OZVkekbbtOcK
	6fEeB1ICChv6CEmYgDP+Bm7Rr6APMHUoM3QHQ0cVbA==
X-Google-Smtp-Source: AGHT+IF/ugBq75bTqrl45fMDCIyEjBFz/p2e/sr3I7XVZNQJ+ZGWvLt+LzQN5HokwK4sHTYXfc3xAw==
X-Received: by 2002:a05:600c:34c2:b0:43c:f8fc:f687 with SMTP id 5b1f17b1804b1-43ea7cdf399mr62342575e9.27.1743598077828;
        Wed, 02 Apr 2025 05:47:57 -0700 (PDT)
Received: from pc.. ([197.155.71.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb61b6cd2sm19675985e9.39.2025.04.02.05.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 05:47:57 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] staging: rtl8723bs: Use true/false instead of 1/0
Date: Wed,  2 Apr 2025 15:47:41 +0300
Message-ID: <49c14bf7475d121e7b3f600e46b93c003851abd1.1743596287.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743596287.git.karanja99erick@gmail.com>
References: <cover.1743596287.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Standardize boolean representation by replacing 1/0
with true/false in cases where boolean logic is implied.
This improves code clarity and aligns with the kernel’s bool type usage.

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index d46a04b9a05e..199727f04516 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -386,10 +386,10 @@ void update_bmc_sta(struct adapter *padapter)
 
 		pmlmeinfo->FW_sta_info[psta->mac_id].psta = psta;
 
-		psta->qos_option = 0;
+		psta->qos_option = false;
 		psta->htpriv.ht_option = false;
 
-		psta->ieee8021x_blocked = 0;
+		psta->ieee8021x_blocked = false;
 
 		memset((void *)&psta->sta_stats, 0, sizeof(struct stainfo_stats));
 
@@ -1967,17 +1967,17 @@ void sta_info_update(struct adapter *padapter, struct sta_info *psta)
 
 	/* update wmm cap. */
 	if (WLAN_STA_WME & flags)
-		psta->qos_option = 1;
+		psta->qos_option = true;
 	else
-		psta->qos_option = 0;
+		psta->qos_option = false;
 
 	if (pmlmepriv->qospriv.qos_option == 0)
-		psta->qos_option = 0;
+		psta->qos_option = false;
 
 	/* update 802.11n ht cap. */
 	if (WLAN_STA_HT & flags) {
 		psta->htpriv.ht_option = true;
-		psta->qos_option = 1;
+		psta->qos_option = true;
 	} else {
 		psta->htpriv.ht_option = false;
 	}
-- 
2.43.0

