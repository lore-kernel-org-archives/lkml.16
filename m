Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F874221567
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 07:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744789295; cv=none; b=PS6d6fyDsBfJHeG7PXWFYIKtij/TDcQPAYrOvD8lMLy17+qreQDVg87bwaWf5GeqYhXKeRfTABN6ZmxuoI+TbeXOJ+Jf5HnUe/sl1wwCKuhzx2k3mQOPwt0LGGPqwNTBikXjXu7zaE8wq/u5kvRoyTtX9iXpY1HKPVOwZDctRwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744789295; c=relaxed/simple;
	bh=rSAJncZcOxhrIeYAu6wLUpuKU481cEBXgkEgjcndSaA=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TDSxU6D5NEQw5xHiZm2EP4TJXpSd71AKVps8bGkWR5nMr5apvr0lrydsCM6ZyLkpI8di8BidD9v4y6lg/KohOlOfncmnbQGqlB+LwIH4psgObuVU5lKG7zjMdr0RonotVjZytw610n1/HCk3Tq4Vc3X9qxSHJ7XUMLPjYyv4Kww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iv3NMBAF; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iv3NMBAF"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac79fa6e1c2so103457966b.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 00:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744789292; x=1745394092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=abI2JFnN51Fprcf7bwh8hgubrVutcDKlmiL/HsbIAiw=;
        b=iv3NMBAFPOHm82LjBdbT7JUt9VN1SBtg2ezeZIHaLegNa00xSUz+HcOrj7dPXeto36
         t8/JW1hjkWGeXEw7ffC9bEh/5ZJSCwJZWY/pmaU2hTttR4xqG1I+VhibWv61lldls+3F
         d8lvMVvQ/8tA215iaY8nYx80JmEBA1d2ySM5pPUDaxfb7o2j9hzyV7ZBv9vYH2YMS0o1
         U9wT0NTESaaxNrco6gqpj4PEL0CgfVW7lSAEKv9IfryFPSpuVlofAwGKuxYCgV3JdYMu
         jlrFphn7InLqZ7lIpwEZRzPHKh5ZSJ4OqsE6VGH+fdRYA0uzsHetfZLuc5lZ6Wh+pz60
         o+Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744789292; x=1745394092;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=abI2JFnN51Fprcf7bwh8hgubrVutcDKlmiL/HsbIAiw=;
        b=lAeV7re8AK1Rx9AgJqMxv0buif+TNLHntnKJ7NyQ7xbxAu5HfQ3sIsb7gwcaONwpO/
         6drBRvRCiSuIJIC7w7B3sDaC4hR48IDuF9DsiGpRd4QEy49sv6JnICF3/XPBlmoG9sOX
         g6ottT12Gk84MQjAAotpMtl3w3QdN5m6XTfb72rB9QdEekT7vn9m8AhMm4ZqsKE2OxGV
         ffoeNWvpkHV8gPAqGgwJjg8/k68M1LNVqr6Z30dwL1l2nMhKaJQ3yclDgCveFcWQ4e4k
         NsCWc+kFCjHxRFFC3TUuDVvC546xbeHKogeYn6QUphlzREebPPd2kU9Xfo8PRazW0nyh
         Pl1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXlonybJZjEAv+MeBn9dqWUApyWXM2IuXysgYim1PVemx0dwqbyHZWEIYXkCz9Ti+0Ng/Hq1M//0YanxDs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJTG5oExTDA8zWwefWxOPRsUyHPDaHmPHlRNRnLKaJXff3Y+Xc
	6l2/9ZOlHxP6jyiz7gKtIjhIv0w1Vckbw/l7wmItpXchQtw8oASlWz4YOzZOXCc=
X-Gm-Gg: ASbGnctIxZBJmFN25Re7OHCFgoDJYuE+33QiCzGhYLiC2r5Z4CfOW0fsmJYBPaH6Cc0
	fovmjwgzqOCtu9IhcB7okMfqOiEF5lXEH6liGKNkUpKGMxNRiFmPmykcElyTAoEeckiOoDRU8HW
	Sdjc3rX/yIh6s70/pHYoZKqjz1XF9gBddu2mcCoLenDIUaXqYD5yJLACvTbj4EY49h3iVNvHtrO
	FnNsU/RT+AzqixHfQN1a/TvsJ3s0UBx4wu9B9VM0UsKXpdGE71v9qD+is95zSo8yMiaf3IWUckq
	UkQ/B9a7lBBgQ9QXFoOVtmODGVD2kbD2fEkPvQY4wk8U3Hon1x0FZTFPKTSbCzjlv2zJkDJDQli
	5aR2VvEa22Z/mSTA=
X-Google-Smtp-Source: AGHT+IE8h6ZIusbOx2fa72lKxk2qdTusNLhfSvFACqZPuu8uuX7bjmdba+8fMR+GvnuolveGcRCPWA==
X-Received: by 2002:a17:907:7e81:b0:ac7:3910:17b9 with SMTP id a640c23a62f3a-acb42c8e771mr17201766b.16.1744789292298;
        Wed, 16 Apr 2025 00:41:32 -0700 (PDT)
Received: from [192.168.1.26] (46.150.74.144.lvv.nat.volia.net. [46.150.74.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3d1cce01sm74205266b.160.2025.04.16.00.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 00:41:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250115211801.194247-1-krzysztof.kozlowski@linaro.org>
References: <20250115211801.194247-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] arm64: dts: mediatek: mt7622: Align GPIO hog name with
 bindings
Message-Id: <174478929099.20468.14418379313255979226.b4-ty@linaro.org>
Date: Wed, 16 Apr 2025 09:41:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 15 Jan 2025 22:18:01 +0100, Krzysztof Kozlowski wrote:
> Bindings expect GPIO hog names to end with 'hog' suffix, so correct it
> to fix dtbs_check warning:
> 
>   mt7622-bananapi-bpi-r64.dtb: asm_sel: $nodename:0: 'asm_sel' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
> 
> 

Applied, thanks!

[1/1] arm64: dts: mediatek: mt7622: Align GPIO hog name with bindings
      https://git.kernel.org/krzk/linux-dt/c/6e3b067d3c5e00dea2e38c609fcd247baa74dec4

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

