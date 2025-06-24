Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2F22D12E0
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 14:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750775553; cv=none; b=mv4M3Zylo1Pyn057P84cOJXIoithV+QfRAh2FTRQvMbJe91VNIvYDXKrCMJJcZKlaKrou+S6cWazPKM8QcC07FeYswQe+DAsOXsEg/K35tqgDpwrPkvEL0yAc1251+7VSvtD0KpqzBD/q2fKcPwG9OGZrOQCX2nTB1MPcXu2CY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750775553; c=relaxed/simple;
	bh=U3pCKeQXh5fWKdCNbSY0Rxi1y5sm9Avd5lYpt9VNji4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OJq8nWKGBahOM5Ts0Y11wLs48sUzkfWitDIdzzeIQppf8Kt0vkKv3kBLDCbOzcLWr1yi+5/hCDowbziPL6jcPnvN/rAhg84aPzSCyNtn0QILgfzg8SVp9uIng/BSMJk4qWnCYOrMry3aXDldIqWPKm8lkSbqvLWUlc0kzs/dlp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=gfntUD1N; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="gfntUD1N"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4530921461aso4861635e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 07:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750775550; x=1751380350; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mVbEF9kewOwZre8oZmBAEAxpHXBpu+7cKLNa/Clhms0=;
        b=gfntUD1NxyMAnr1/8FpEG7i+eIdBCnXkjI3xKUfh7UoAUEguUt8fEF6LSNf5wo9N3j
         TCoOopXkv24Lvxl94wZ4Hv4sdIRHZZSt3ITrOOZfZ1DNTJ0Z0B0v/yx9yDYeO1mgefIY
         LEj9WH9cex8aVra0Tec6cGH7AYYuZGKrSgHFmHUCr8Z6ZclosDh/UxdxrTo/K0nKfigN
         ++KKdfS0JWNlowmsg1o6xcNE51zhwVZ7sMW7pq1wXEg9G7onQulMk5//4htJ7KwxznYR
         o3u5wFXpSG9NKlYdyj22/aS6JudAyuZ99ocQtvfRFDSedvMIZJLtwOgcmBwTI2orItqZ
         uMeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750775550; x=1751380350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mVbEF9kewOwZre8oZmBAEAxpHXBpu+7cKLNa/Clhms0=;
        b=e/7G7fVNbuStYECfDzT8lTDQqdWu+2UOWLGnViRkCwDIWj965uiEo0lcTJ9FCQaRse
         ey0PtzXqTDdR2M2Bts+RgzrX1WlEub8G/gh/+UZDOA3Il+gJ2UNFbYtYSsCILCQzx2+R
         RzyihztkLSytj0MSIii650zRZaCQzHdeMXDm3Vp27Mi+3+fl4RBRp31udcooh26HKiRN
         bMfHF+rhGfrT4x5t1V2kisf6bDYXyLiIVpfXvZCN7p3BmIo9uIgPLru/PTjoNqqdkB8E
         ziA+ywqSuqDXRitwfi2loYK2f+sNBoymPy/5g0KW7l64vzJkh9vwRS0/PEaRMBQJdwKM
         4NWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVr+dz2S+4jSIoUokccvMLuZEvUysifjzQ4Jk/eSisOoJjOtQAfsDlWHb0Qpar74LJAcPEkAzLHJ3zzaN8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjwrqDl4KBdZMtvPYAiHm9WpSVdculOmQ4ercvlmfLJlvJtREK
	JLTonS4stdLf53cXSLDOu1H8MicZIzEIkMv+DqechAzzWffFJaJA1obV0V2WlcDsLIs=
X-Gm-Gg: ASbGncvGftO1WON4cm7hruMLacga2l3XomWIp+Vk583vFOWcm+gduK3s176huZB3QUK
	9Sbltr1u3volrTjiEvG52MLbfhwi7cl3HRwQHRcmhbDKzY8z8p+3gLHdDLLIfLnNYwJeMsQlSod
	Y3UPGhq73C+kA5zb9S2v6eD2kXUUPliJpgwDf3AOPkGC+0DSlbHhld9QjoQ2HtaU7mwToXLyzDx
	F9RMHhtDT8xAkPsZVkNlE2i2BZ+YoXEQVr+D8gf2WG+qxD+Gv9qlxTLaZaYGRqT/r0jW8rrWDQM
	eyNi8Y4In2K4VJ9Bn8J3ahqug5EVw4HA+GqMGyz0rX0J/kAoVce8vUHpv7w8GqXI2R4=
X-Google-Smtp-Source: AGHT+IGqsN8V2Kqq4ukhS8ZiL+K2QB+8bClwqfh0d/aBfYgnP752Jp9v7Ul1nPRg7YWzqlJ9R0sP7w==
X-Received: by 2002:a05:600c:468e:b0:442:d5dd:5b4b with SMTP id 5b1f17b1804b1-453656bab67mr174529765e9.31.1750775549662;
        Tue, 24 Jun 2025 07:32:29 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ead2a84sm178512935e9.32.2025.06.24.07.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 07:32:29 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 24 Jun 2025 16:32:19 +0200
Subject: [PATCH 2/5] pwrseq: extend build coverage for pwrseq drivers with
 COMPILE_TEST=y
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-pwrseq-match-defines-v1-2-a59d90a951f1@linaro.org>
References: <20250624-pwrseq-match-defines-v1-0-a59d90a951f1@linaro.org>
In-Reply-To: <20250624-pwrseq-match-defines-v1-0-a59d90a951f1@linaro.org>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1253;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=2ehPYsnzhfIr+Sl5KtygAfKZml3wCVfX6aGvffUmSwc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWrb5/ZD6cGNe0SODQu8G6MTV2TyemaIWJGr8n
 IbX+Krmp36JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFq2+QAKCRARpy6gFHHX
 cnh4D/0eF9mZsgltwhV+c03clkM4zPTtNKVX04B9cuU4X5DVbI0KgJvcPhVe6Z+gnMMDNlUlWkW
 v3r86iHn4p+K9ChVY/FfX7chS7YFtby/vtXUUaD4Ktefsyi05sD+gd1HoVKfGlZ8e5AnXrPvPIW
 c/6JzP64+G7QUnMKONgwaPVAhCAv9Rx/ty4eoj5WZokPtwhxAYxG2BqkKUMpOq0wRVRLx7M9vYb
 rOPr5v8vQBIacA9NxL/nQpr+6J1YMSBsIGbcASAf6EwdhZ4IgwsN1jvuIVm+IHsN/jy7DbpHys+
 B0ZIwglXIdg+432uOpCtZyS5twVOHuM512PaIhGWsJuFemzx2DAO2gixScYleFb322TqpVg8wxz
 /WcQCk8ojYAM2AICYS6E/YKWUvPjuQtJFpQKGTk1HX1PMcqjp1DkIvvBQRmfOTS/KxsROJcFutJ
 CrJVNlzROukJYtbFWCKqBNvG0MHBRhmSIdyLZdVnqj8Rz2dWYxnxZsMxJBlKz3olyZL21dNHYtR
 mIBQywymAMf7dYb1RrNaN10rF464jtFrMvoVaJ8haulYyjKw77wMRY91WreQLs0LMVKPsuhID0b
 DS7Aa5GzGBI1qsnh4zmgeDUqOxLcw9hgbytxNMlSH88ooZpYC8gIsnIRSwCm3lv8up+Eh7m4pmC
 lvBl8uUD1T+K8Vw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Enable building the pwrseq drivers with COMPILE_TEST enabled. This makes
it easier to build-test them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/power/sequencing/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/power/sequencing/Kconfig b/drivers/power/sequencing/Kconfig
index 0f118d57c1ceddc03954c006f99b5990acf546d4..280f92beb5d0ed524e67a28d1c5dd264bbd6c87e 100644
--- a/drivers/power/sequencing/Kconfig
+++ b/drivers/power/sequencing/Kconfig
@@ -16,7 +16,7 @@ if POWER_SEQUENCING
 config POWER_SEQUENCING_QCOM_WCN
 	tristate "Qualcomm WCN family PMU driver"
 	default m if ARCH_QCOM
-	depends on OF
+	depends on OF || COMPILE_TEST
 	help
 	  Say Y here to enable the power sequencing driver for Qualcomm
 	  WCN Bluetooth/WLAN chipsets.
@@ -29,7 +29,7 @@ config POWER_SEQUENCING_QCOM_WCN
 
 config POWER_SEQUENCING_TH1520_GPU
 	tristate "T-HEAD TH1520 GPU power sequencing driver"
-	depends on ARCH_THEAD && AUXILIARY_BUS
+	depends on (ARCH_THEAD && AUXILIARY_BUS) || COMPILE_TEST
 	help
 	  Say Y here to enable the power sequencing driver for the TH1520 SoC
 	  GPU. This driver handles the complex clock and reset sequence

-- 
2.48.1

