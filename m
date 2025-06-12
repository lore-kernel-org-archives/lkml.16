Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0D327AC4B
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 15:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749740922; cv=none; b=cRvBrNq82dPPAMJfy6rxtoJemSSTxSsVSNCMG8PxcEkulqnkpTrX5OC4R2ckW7hak7W7a5OTOT5Po2uLvH4NUk+NR/2ApVEq9KPNs7siUZhq+KXILw1A6xAOv0/1ApOM7m525VRd5THxRrYFm67Usi2HBnaAlODNGd+gEX5Rfag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749740922; c=relaxed/simple;
	bh=a2v2y6wL0kyXRH8MKApGqb3Kz81NcBCJAVjIEqK7s/w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dVTGY71mcYrSxplASHRjlbtQNG/ex2pNdMBnjsY5TSnvCIJpkq0IeYDGxziivQWScgz7iqn0b97e5T1LyuPWRrq/cX9W0WiTWfHtQI0W8OakA/gj/im+Oq4nuBPhaPFg3B/dcrhpbL1EzcJviOgWyxT4rQuq4gDvkEXpk7T7HK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xz51RLys; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xz51RLys"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-44069f5f3aaso1492755e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 08:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749740918; x=1750345718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RfogaeDXFu8NsSm9XLGcZrTDHnRVDxhctoqJhgjWD2Y=;
        b=xz51RLysxZ+mSDr+1/yg/1W3PPed9UqSCwCBDPA4fjObBOxjoHitJhfuEBgKo0BqSq
         dduFNk15ih4SS8lmAmkXpUQJ6CABIFzLblFVgoa6vV8GebCi5MefvT2r7+RSF0RXJQ6N
         FkMuUIPurKFfJellTWi78mO/HrsntjFGJr+pqoTM9rdGZ6dtnNA7nIEklEvEJyr0oKaN
         ko4Hv/9Zfut3qiR2QHYcSQ4/lFJH80EGEm01TBoepYUSKTlSCxQkoUq+fy+5TLftlvZ6
         KTbzYdwNUxWtKi88AaMhsGztlA1Rixoc/lw937GK0LO6UP14VZwIBVbnrPOqVMvwBKNT
         C7ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749740918; x=1750345718;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RfogaeDXFu8NsSm9XLGcZrTDHnRVDxhctoqJhgjWD2Y=;
        b=MPXr/ayyo1mFbw6U1UUQrewABdk/YVj5pyz5njQx5ksXVaCDx7KurpAxvTG3W+mmqx
         WEnlU0qbGLVtQZ21+r53e4tpt153ZZlY8D0A6Dtc5jrcrJAj+4YeMMG9iVodX6eeU8ZD
         xNBQ56orQHebn4A4/b94dRd5ZqeGnSr4jHnSHtoUQQO70ZcomprU4W1sp8YXT42aUPAr
         qVs4iphHsRRVQeiBZ+QIRItR3e1gPHjGG3roDx1IFsxczxNhLzmnUDhKr1VP+16iYZ0w
         Jrgb/AYuXLQtgizTGBhaoEPjq0kcNzd+euvlKL2VLMleavjo40Usl1KMSErqX4NwD/Uf
         9kEA==
X-Forwarded-Encrypted: i=1; AJvYcCXKs2CcIuTdJHsaQ0BgVDGDB3WqF/yHUt5mPM4yXA3T4HP2X41KbibQzek/DpVE3QYCrLP53v6pPGO7lzg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/g8tgw1O/rE/hHvywan53BzcGnIw+q5Oi6rJZ3AKC8wsFkChj
	gm53EOjMHj9Cw71Ys5NDf45zh5hLkbNMFdPiZG2Ng4n4OuLxg78JHB6SbCugW1uMJAY=
X-Gm-Gg: ASbGnctivnbGoomVo1S+gKAZmb4j1Wh86sAsFQBajSdnfRIGwmSZ7H97ytEcR9RAoIu
	opFkqMy5XVTAHof8LZtS9ABfL3C460vN//y4KHF4bxhPbQmMvMWKvn9V0Yum3Uzc1ze+AEItcf6
	yF0oAxkYzQygxuK6HNdxqZqOpB94KWUtEYO8C69vISXrwgT3zfwoNM+uXaiJ6zezSp7iuqycYgo
	21mdyN/U2ueCuUDmZQbRqqtfkhZfXxfUw8SAX3+0CGIhdyVFS62n/wZPCRqhyOYqecTND3RSznZ
	yw7lO9cII/4hVRt+qfj16jhyIxKfR28Sjec4V0B6FFLqAQkBXF31Djxq6PkSP/83z9/+AzSlHcH
	Wqw1zYEnY/9sGKPmEAw==
X-Google-Smtp-Source: AGHT+IGsHolW/1zgZsW15i4xzcpT6QiGNVGcfarQaCKUIeuKHVzXBnh/SKJKOYXQYnzFBUqMAybUug==
X-Received: by 2002:a05:600c:4e45:b0:439:8294:2115 with SMTP id 5b1f17b1804b1-4532e8e40d2mr12583245e9.8.1749740916809;
        Thu, 12 Jun 2025 08:08:36 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea1925sm24251255e9.12.2025.06.12.08.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 08:08:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250504145907.1728721-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250504145907.1728721-1-ivo.ivanov.ivanov1@gmail.com>
Subject: Re: [PATCH v4 0/4] arm64: dts: exynos: add initial support for
 Samsung Galaxy S22+
Message-Id: <174974091358.105902.6680955080416928440.b4-ty@linaro.org>
Date: Thu, 12 Jun 2025 17:08:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sun, 04 May 2025 17:59:03 +0300, Ivaylo Ivanov wrote:
> Hey folks,
> 
> This patchset adds device tree files for Exynos 2200 and Samsung
> Galaxy S22+.
> 
> [1] is a dependancy on the aforementioned series for the usb phy drivers
> and bindings.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: arm: samsung: document g0s board binding
      https://git.kernel.org/krzk/linux/c/a67a28f59fbaeebbc37186d60a6c56e16b99829c
[2/4] arm64: dts: exynos: add initial support for exynos2200 SoC
      https://git.kernel.org/krzk/linux/c/11715fcf1ccab759d43ee1ad3b1b5bedd7559b48
[3/4] arm64: dts: exynos: add initial support for Samsung Galaxy S22+
      https://git.kernel.org/krzk/linux/c/5430fd9e0794a21b08ccdc01ddc942b09830c1be
[4/4] MAINTAINERS: add entry for Samsung Exynos2200 SoC
      https://git.kernel.org/krzk/linux/c/6c1497a4bd72438360d977f37837d9638b702f33

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

