Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C711E9905
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 11:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749554207; cv=none; b=nUIJEMDpxincDlYV2Z3FW9BkygINnK6sJ+5TVZkUJ4X35U6IVThCZU3MkJEzCAjp6kgeOAEEVU8w2Or9kccElXvYq6/RA4GuJU8n26HWJgN8l7KZ3VJBv8+Y3PCgy/ObyhMi8RUJ9XxxHeArv5R80yec0HT4ItXvLZ4918c2vcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749554207; c=relaxed/simple;
	bh=zDeUcuv0yIbt+CHEosHsPE/6OpchOeANXKzL+3pPZ5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CPoJ/O79FZbHwNtQGnrOyd62RZCdtY//v60Iz4k/VMUPeHZODxcCjpsOOqICjl0B/gjtOKqMdxhsMADCGQNtayim/TQIeZAekMH34mm50+a7K2fLXnT/SxF9CzgNh5QPOsSp9cfDuq0iMnF8O2wcRJQhsRqyqpGaNV4un3Iq5QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AHOfRn2K; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AHOfRn2K"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-553644b8f56so4910874e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 04:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749554204; x=1750159004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DaisSQk71updXPXwWenQ0eCHUVGGjGQ9tauWhBJXRks=;
        b=AHOfRn2K352HHbttT5Z+D+yaoRH+pl23mWkGaVrmPF9XQR4JzyFwi3b/fTOsTmxwF7
         9W8LWPlVJx6ubYiMoIzvkijlsDVDKHCjpAn3mucnMiJFYhDGh7uLqGSSZGE3ccTRSVsG
         6AoFRduNmUnnNODVMcKrkuq0B+D+TR70ypXCyNG6mxDxNPle8Dq/9/ZgSDTs20muYBey
         M+ohTt6ooiKFv3gnmrHa3E7G3p6WKiOaDAioKQ9hjZcFCK6fTyaYlx6GJiAuZYtUL66F
         6ob/q5GRukWsibxHcoLGYoWDyyCJCLjBk0GF1uZos5KbmiVd05jTDpzl6J0o2XjtK16r
         RcMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749554204; x=1750159004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DaisSQk71updXPXwWenQ0eCHUVGGjGQ9tauWhBJXRks=;
        b=htmWrZBnHWqMwlufetcrkF6wJbqU95MZcaTWVVuX0CH+p6O0VQvx75HOoEWC2tvIwP
         H2MA8fozjlwK5k3RpzsDkp/Sh/8HC9uUZGWHPbt7W0wKWga88JMIRKPlBxrQqj1U1Kgl
         GUCde3bgz8CdkheEo/ZXyOfrWOWw9hMDTlD+DKk7R1LeoTjqC8IxiA1AKKZHtJHVsQ9C
         lEvRd2wWpk5Kq88vodl3GdQB43DZcQOA4YFk8GgPDYaORax6NLd1FFo2SKPh0xByMHer
         kgKFcOz8k6eMeIW/oYJlRSLgsqK7k0SXdJAtaXW3nZI64e8bBEvJu0km2d9ZrNhPbGIP
         M2oQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwvj+/AsGipkKHjNX4kCrlPgVGGtpV91M/TMxSnFwPL1rX12uwuFqV/c8w8w+mVNI7yugOxXZ8fryk3YM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxxziCD7qSCFACTs7GBhn1TZXYu6M1MxwrG7fEUBxZZNDlGU7/
	umIVfmhdoLgTnYlzme1sb/5moNg4C+oXD6E6qUxjevMdFCDYCJ1UhG4X5m80rs/1pDf9kDdgXBt
	WErtwmyw=
X-Gm-Gg: ASbGnctm3uY0yO4OFjHmgRFiizmq3B92J7jCH4q86YTgLDQleAbITUuTAb8+TZnmDPh
	jMsXTEyDOeYZH7FHOTy1NmQI8v+GKqcw1f6ypotZv2z2aeuqMy+vCAds09m2vbYqjjULRoEX0Ce
	uE2vd7wmn/LJsQP2FsMQwdWbr88c97ELrXU9eaBnNq+mT62NM6mN5T6SJ+PcfDo8Mm8I5tpSkVU
	4eW2JliLWwMHqas8beHCrhby7fr+Ytrejx+45k2WdoYvRlJQuH5qPoMxnveIyHXRd2RiDs5GTOl
	mr/f3yRY7uKpK963LnPEXJ7z75Rbg2RdmAhpxlwPIpsKRZnYRcGbETkbmcqrOcJLerGK2pKl87x
	ixwlVnXClhcvvAfH5wJlLF5GOHnA/72M9Edlv
X-Google-Smtp-Source: AGHT+IFY3VnRE9UcSrBVBH5iOgtbkmizeDx0kmpdz4+rinUwu3zbjO++INcIj2dBpGSkxIptNQK/Jw==
X-Received: by 2002:a05:6512:1318:b0:553:515a:5ebd with SMTP id 2adb3069b0e04-55394745ef6mr667032e87.8.1749554204142;
        Tue, 10 Jun 2025 04:16:44 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55367722481sm1500146e87.126.2025.06.10.04.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 04:16:42 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: linux-mmc@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Ricky Wu <ricky_wu@realtek.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] mmc: rtsx_usb_sdmmc: Fix error-path in sd_set_power_mode()
Date: Tue, 10 Jun 2025 13:16:23 +0200
Message-ID: <20250610111633.504366-2-ulf.hansson@linaro.org>
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

In the error path of sd_set_power_mode() we don't update host->power_mode,
which could lead to an imbalance of the runtime PM usage count. Fix this by
always updating host->power_mode.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/mmc/host/rtsx_usb_sdmmc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mmc/host/rtsx_usb_sdmmc.c b/drivers/mmc/host/rtsx_usb_sdmmc.c
index d229c2b83ea9..8c35cb85a9c0 100644
--- a/drivers/mmc/host/rtsx_usb_sdmmc.c
+++ b/drivers/mmc/host/rtsx_usb_sdmmc.c
@@ -1029,9 +1029,7 @@ static int sd_set_power_mode(struct rtsx_usb_sdmmc *host,
 		err = sd_power_on(host);
 	}
 
-	if (!err)
-		host->power_mode = power_mode;
-
+	host->power_mode = power_mode;
 	return err;
 }
 
-- 
2.43.0

