Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B468B266F00
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 14:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750861320; cv=none; b=PEAMPRDHT7cDXEbp5PiA/v/dGgHv6QBvUWJEUadYjnQ7CjwIZACaLJ/PGEitaMQE/yT911DS3Impb1QkDJV4fdGOldCAo5QOal5bDs0MCeaI4IZLGD6jtSy60AFjPJnK3Cuer0hLjQNlJPMq6O2wruId2RrpzPam1f5FzuqR2LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750861320; c=relaxed/simple;
	bh=DlB7Q252ankMqOJ6UIJLWrlxrGtVqX6epo2WRrBN/7g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mEMOgkw3G0aHO7hoHubcauZtBjltItqL0u660Vw3gD+dHJJTcdY3nxrYl6+mSO9XGGKDitc0fwrrAZKj69m1tjq2IOQ2GwBp7zOn1fUi6DL5OmCMFsOTNQB5EQg9+PGYd8GBYqkYT7fxCdmkM1ymERK7/mVMD1ZKB1HO/vM/v7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KfwENfvP; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KfwENfvP"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-607fbf8acb6so941292a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750861317; x=1751466117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M3GGOIs1M7qewnK0dbN/1VCKv2nwsADPB2kGIBYK9J4=;
        b=KfwENfvPko+uVUHCtZF1p201lEnG2tYVu7x172POP0/VLNrWoLOgAtqqfpXWX90ta9
         +ATle29k3gaayDZCvOARIJFRZdpL39l2CJ7RepXufOecjNEoBz3gC7oXVU/rz3KXclWZ
         IN6xTE4/8CTysRum/rePQX0RBWGWVa70jFSqepBZ7GKZodbKwEJxSNlmkDTKhYsrU7NF
         HnQwG6BimYRjj6fVvYVyBI/haxoevXKUQL8d+WCDNosbzER99H70cjHhMsv8P8CfQ3Jp
         KaJ39FpFBHMhIBR17FLShkwHVvQ3Q/KKT3HF+9eInVP+OilXA+cBS1kXWqj54aNzKlmZ
         M1iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750861317; x=1751466117;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M3GGOIs1M7qewnK0dbN/1VCKv2nwsADPB2kGIBYK9J4=;
        b=M1o9Sz16N7a9ajEmIkpmK6O5QEwF4dbyv+BdXve0g56xPoIMhMIzBjkEmnrTpHQ0GJ
         nifabMEhOGZhjC66/3FkoAfprIfrWPad/kk6Zk6JRdSZp0cBcTAY3krIA503pU1cZC5l
         bBuQLkB8e4Klk472tiU4adjkhnEnTcezVG4lJRb8lZsq/toc5ziOzoK3ha5M3tHTDDVo
         OInXf0N9Rd+JnotTvJIh4/er0G2MxUNG8ZoE3kk50c2cJ3PSyhnN8FNDUW7AJEYO1DzX
         5PJKNKMRhzdYiMnSjeO2E57gznMH+zzMhbFovXuUB0aFB1MHd8h/hCkaUy6vj9LM7dvq
         xpdQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/YvEnok5TlZVyOCt/aVQLekd6kXC2Uh+MD02yphSfBICJav6/Y7U4jsJMtbQCx9i/aB+m/QEWatWpeiU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPjMqApXPNxfsWOsnbrasp5lw+nShBNyKC0pdmPhq+dBPtu5Dh
	nATfTt99uP3MDW/WvkiNMnZR7Fn0oCeWABPfoKhFYK8vm3pZ3hcZ1W9DHZFeG7LfQKs=
X-Gm-Gg: ASbGncvpu4ql6gQya5jqA8Gi/QloQo72AOkbg2GCCaZ5DUQFaVWEjLfpudCxA1kXf+N
	FW4xwmje4uDECxwm8D+i+RMVThbPhyFnaMiEutr/9gkcBPN/JY1SY09jBZRRRAF5fVDeWQgMF4s
	tXZLPb6uxn04KM5Dmgrz4VXpu/RvfofjQO+HABKjePDYyHU83immB2iyNIhnPWTWJnTr8UTIVlY
	3OJinPn7BTCMFR+NS1Fm66ZGVXMfeS8rn9SeNn6Atp9gPhp4C/T6FKsA2aDEdWjJZ0+zHDVc8Lq
	lzjLq3LwOPC6QaXKz8vv//i/J4a1/yiilezszE4+XBjRqR3XAFOegAOtoGEuAbLL7cUR0bMYSg8
	KwhYeYA==
X-Google-Smtp-Source: AGHT+IG/VagrGt6bbb5MQZ1l2HyN6eoH3YHZ865LF4suVMe/z6ykxO6VmgeAkdlRkcs2VpPNynx8Og==
X-Received: by 2002:a05:6402:2714:b0:609:d55e:8a88 with SMTP id 4fb4d7f45d1cf-60c4def71bdmr915957a12.10.1750861316962;
        Wed, 25 Jun 2025 07:21:56 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c2f4682cfsm2588550a12.39.2025.06.25.07.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 07:21:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
In-Reply-To: <20250612094807.62532-3-krzysztof.kozlowski@linaro.org>
References: <20250612094807.62532-3-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] ARM: dts: exynos: Align i2c-gpio node names with
 dtschema
Message-Id: <175086131563.117782.7215160413435880072.b4-ty@linaro.org>
Date: Wed, 25 Jun 2025 16:21:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 12 Jun 2025 11:48:08 +0200, Krzysztof Kozlowski wrote:
> New dtschema v2025.6 enforces different naming on I2C nodes thus new
> dtbs_check warnings appeared for I2C GPIO nodes:
> 
>   exynos4212-tab3-lte8.dtb: i2c-gpio-3 (i2c-gpio):
>     $nodename:0: 'i2c-gpio-3' does not match '^i2c(@.+|-[a-z0-9]+)?$'
>   exynos4212-tab3-lte8.dtb: i2c-gpio-3 (i2c-gpio):
>     Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'magnetometer@2e' were unexpected)
> 
> [...]

Applied, thanks!

[1/2] ARM: dts: exynos: Align i2c-gpio node names with dtschema
      https://git.kernel.org/krzk/linux/c/a0c7a6b5f42b29dddfc359717d620e5b1badb9a1
[2/2] ARM: dts: s5pv210: Align i2c-gpio node names with dtschema
      https://git.kernel.org/krzk/linux/c/a24cd2f207efa73d7ce8089ce4848aea99f48f6e
[3/3] arm64: dts: exynos5433: Align i2c-gpio node names with dtschema
      https://git.kernel.org/krzk/linux/c/42873b118abf3e297e012e52ddcae2e5b1f42214

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

