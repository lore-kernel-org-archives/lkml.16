Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003312DA75D
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 13:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751030976; cv=none; b=GaNT4XgzEG8IDV9c7jIq7MfRabqCCKHAg4rRbHPh0+7HT4M/mln4NpcFwIMLJKCPeBoGbmL3gfTOOiGVGF43jyekFw/fvwrFsLRc+64L2s55vMvcA5Co7DPsAUakEoLHNWhx8iFDIdGPsYYU+Lim/QErMTxwKpqY3x4qTRNXvTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751030976; c=relaxed/simple;
	bh=I6faurzbIoxv3qYMgbdH4NSLMkzOIqpRf6fwnaEn4tU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hgQ9WCfBOGlvj0j7weOCZ1BgQavKhyt8UIaVwMMQzuw2clNauVlrzH7p451GYNedPefY0uumqq/LrNVngkwam5RRMchxAqHjPBHkMJJuakvoqrped7nuFWlM9FJzd1+SFRsco57VxrjyqM2W1IJWx+AJYkuX1vsCqo24swQt+Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dD/jjKPz; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dD/jjKPz"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-60c5b8ee2d9so4639928a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 06:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751030972; x=1751635772; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=totF/N0o3eF/DAQAGujOwbAUfvbVdfGY/Qpe6oziQJ0=;
        b=dD/jjKPzNV4V/F9SglPG59Q8nNBKFpHusM304vQFUftlJT8zhQFmGJBjHYYRNBrxkN
         b3nw+4du4Ph2AB1gRC2QXffwdEtqob6e7iaQeDu3yNJ5GQWmLgappSgU0nEACy62vgLr
         r6vUR04IeVbgBqddAL6o1qDFl3sIMAOipLd4s8XhdarsUBDnmv182L8lCdC9nuwOs03y
         yX2uvRBPy8v9wLgeEpJvSe4hWOMkCw00ni5UA01GCDu0pfJNGGMg5u/3GhKTmomG9HV9
         arPNZNHlR04+VhUs/6RC2ubOau+UWo49rUwBHIhzXX1o5Uo/xmJLvDzF7KL+/5HYDe8K
         ZUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751030972; x=1751635772;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=totF/N0o3eF/DAQAGujOwbAUfvbVdfGY/Qpe6oziQJ0=;
        b=L5M8eUv32BdSE/tNOGCxSPcGPrYuhY9AHppLZfC7B70yE6ComBaxS91idvONbKfcz/
         ZHNR7erubH3Ae0RYXJNquTiW/iMIpcEMVWcL/Bae+7HnHroygKLDcC9U+OaFB/9tAaj+
         R8bmFl9YxfmFUdVfDgtIiSSLYuYMHQlfihKyRVb/9nbw+RvMY7XpAvBsTS89v0vRzllY
         JU1buyMJHIW3U3pU9Pr+Di/LllmapZUVKn+/kQNuM2aXuRQJPhpbfySqmhHY+DWBSV2e
         v4bmC/u/4Zj2L/ANlZnb2LHEJA/fHm2+9hVNQXiSFSZh2/2UMaWmLZC0AEpoaCODv/Ts
         1F2A==
X-Forwarded-Encrypted: i=1; AJvYcCW6MJLrjB0Bfvpbc1IDSPzBsxfH/wPepeHirO76bUFPeFlEy2Vhruvvq1ajCHYbg7PqdEyLG2xWF7fkJy0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyImadLZk0dhv0d1u1a8KtG1lao8LPS9Nx9BidjKADcwKUZccjs
	NHmxU9dZ9ZtV57MnwR0SBtmxRUlx3IauFB53KD0V9QTwLeCSK+a1UAwEEpPWC4ZZExI=
X-Gm-Gg: ASbGncuGTXu38xqnp3HWkAdsxp4oulPLcMQBZb0tX7FAMA1uKCWMBSyy2Ad7KNic+rY
	WzrprCVZeh4GJu2v/Iyk1Iu26B2bs8USK2rOjXp6ZH9IkzDvKChV1rCmS8lAXZeP8FB/LA2ggaV
	Bv1ZnE4qvzmOfZjSbmce52wOf/llizaU5SHBt2lTYQSY6+wZ8ru6gyLfowoJ4jWJ/qxxRg7eUXS
	51s7U4lnN6AZ3piYL2UCMGpi6mL5Nxvg01IAFOB/RjgImp9xD667kn0ck/POurd8AM2LA/85g1Q
	WMJfUZdsM+ebBieglL4aDS8lHsAGcDYfLYWrEoGOmz/UbDd4CY7naYvQOj+jKOW8YFR+QByMURH
	BuqpTWuLA8j7HLbMDcbpSe3Thafp0g7TNK2+ylq06TtDkUA==
X-Google-Smtp-Source: AGHT+IFqqEN1CabLkuRpa4qT0ns50eEJVky5F6nDsnGYV38k/xhyp5qqKgZNhwr44qSRdsoEwoz0Ew==
X-Received: by 2002:a05:6402:3124:b0:60c:68bc:7fca with SMTP id 4fb4d7f45d1cf-60c88e72e9bmr2087602a12.27.1751030972308;
        Fri, 27 Jun 2025 06:29:32 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c82908297sm1462702a12.26.2025.06.27.06.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 06:29:31 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 27 Jun 2025 14:29:30 +0100
Subject: [PATCH 1/3] arm64: defconfig: enable Samsung PMIC over ACPM
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250627-gs101-reboot3-v1-1-c3ae49657b1f@linaro.org>
References: <20250627-gs101-reboot3-v1-0-c3ae49657b1f@linaro.org>
In-Reply-To: <20250627-gs101-reboot3-v1-0-c3ae49657b1f@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Enable the Samsung s2mpg1x driver as this is used by the gs101-oriole
and gs101-raven (Google Pixel 6 and Pixel 6 Pro) boards.

It communicates over ACPM instead of I2C, hence the additional
defconfig item.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index a86cab889eac60256b28619b2cd2703765b081ee..557b592821d5d1fe8a5fab0619967e4f98894bc1 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -775,6 +775,7 @@ CONFIG_MFD_MT6397=y
 CONFIG_MFD_SPMI_PMIC=y
 CONFIG_MFD_RK8XX_I2C=y
 CONFIG_MFD_RK8XX_SPI=y
+CONFIG_MFD_SEC_ACPM=m
 CONFIG_MFD_SEC_I2C=y
 CONFIG_MFD_SL28CPLD=y
 CONFIG_RZ_MTU3=y

-- 
2.50.0.727.gbf7dc18ff4-goog

