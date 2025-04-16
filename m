Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7247A22DFB6
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 07:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744789087; cv=none; b=n97XlyWn/v4VLBCGn8mYRLMtErS4j/dapbie/yW7Ao9FhvjL7MKRIXFtgbac7o3f/KvMLGTMFVVb6/34tbqZYhF5NYLMvMpwWeZALcdAG0lLgZk3rqaqNk4zzAvz8GKPGADji6/TxkkgbsgLsx5PymtmPt1BG6kHBMRKQdwq1Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744789087; c=relaxed/simple;
	bh=bT+cQpwTABxthE21Og42/Nfhu15qsdTLYAV48srb3+4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HuV5yh2AsldYyq18W/sWtBT/FzRCfvtiCuyDbBj5gyIp/kJLrMUV+z1XWxBrHSZB5RMjihqNTqCO0E51uxP2cPtj4XlEhhZrSBJjoJj7724LCnoaz6Vdnn18GT60SEGS6peip62E+ZMEFR49bGtZm7KwHBt0NMeP+N2FM0ks12c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VKqSGHPf; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VKqSGHPf"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac30d4ee128so93777566b.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 00:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744789083; x=1745393883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MESsicyyhatyINufDMJoZ4SnaUsTOFcTcz3ZiENjCc4=;
        b=VKqSGHPfXxjt4B+uZnv4OO54qAeihZZpBYJ0vqfrVFpszdI/L67L1H9AUejBLOF/K8
         WVYsZuw2jZiGzSu/xFvHVF79O3wOz9KpoImiobyelyBoVmw0nZfYUihHlAdn5sCJ1K5Y
         bfGc30S2MYYPVIwwmiolZHNFwaoMg0/EclofvKQWjxQxzbbyMx+8d6Ko79QJVLoLYGNE
         QdP7yDgRio25keJX6QIqUAr/i0yhThS8v9/njS3Uv+pofHDZUvStlIt26/eG6V6BxxZj
         wxE6Qu7agSjdcFJWMS3QL8qDBfdd7Xc9BGSbOsxS2LBClQYdq4VA0w9q98k52C9HCfLJ
         vDSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744789083; x=1745393883;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MESsicyyhatyINufDMJoZ4SnaUsTOFcTcz3ZiENjCc4=;
        b=R/aBCvhQsQGUgdHxk9ONtaPuCIHhuB+cINZQrjVMwdwzfwDIXmGxNMGRSLnPSBA8fo
         fpCIInewjgb+M9RAXde+MkGgzbPhwB8HXLbD3RYP4XauGliUeAK6I1koBEY++HuFs54s
         MHfN9FQgV8XguaNj4PHBRK3fP77H8Ot8R+1x20IBDArx72zuu3+KhHNIMYMgqZZsD6rX
         f3yYNVQDbd0uok175Xdz0vVDudw8knq3eoLeraUg430+QagEK3qJT/WF/gZ/yw4Jtva0
         wY75UasOMDEsybrPGBx7t61tE3C12hj57+HxyyhuoWnM1DRbXQhy2XD3Mwvmsel/maxI
         W4ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUS0i5okl53rkRLR4DER4WFjP9wNmtG98hAFdMZG2WCiopFHuWHDN7qxhiAluyyW6ioSGkPORUMNm94N9A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwM7l7d+MEmmjpH9fGYk1FCmZmkjqEop+bz3dxaImOaIsEaorXo
	OCHWvb0Jq7cNcaOwA3aFxCCi5IHB0+rmrK6tQNU3Qw+BseopfzuaRgxIlke5sWI=
X-Gm-Gg: ASbGncuRHf+VUSq6ZGcExDHFck78XeiSAPzMGey/XNFB7HcbWnR71dEgbfjYLw9v6Et
	JyXC0q1zhZOvIR3WosSS/uS2XHR1Pz06L1oNjWZ6073GLBXyiiAPPEZAhnwecHYKWSTfDGxLKS8
	bZzTumsOuaTkDtOKEEVYJbaybsrGg76sROofTEO0sE3eY8g3Ij6rI0E0NPW4ED/dgFzAcpgrE6j
	6nvUrNTUOnoQgGy9Au6GGCukSpQ3P9Av9WxPjQQbHAIfde5irqNwevchlmSHj+4fDZ0F03ygwxz
	gYLsw9uHy82kJ/5qE0ZQrhtlplIavxzEMeTunYWfnogJhKjvrRGk+cKnvNR9j7EsD8nefbePigb
	EoBgfg0k6c+Txv/4=
X-Google-Smtp-Source: AGHT+IGfmvUt/FSzOcqD2du/hnhTnAGiq086+HJ2TFi6ewXNvWJS6ClhkVHTH7jbIEYkihEMx3raLg==
X-Received: by 2002:a17:907:1c18:b0:ac1:e2eb:8877 with SMTP id a640c23a62f3a-acb42b52478mr17700466b.11.1744789083533;
        Wed, 16 Apr 2025 00:38:03 -0700 (PDT)
Received: from [192.168.1.26] (46.150.74.144.lvv.nat.volia.net. [46.150.74.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3cd63f12sm75397066b.32.2025.04.16.00.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 00:38:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250209132043.3906127-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250209132043.3906127-1-ivo.ivanov.ivanov1@gmail.com>
Subject: Re: [PATCH v1] arm64: dts: exynos: update all samsung,mode
 constants
Message-Id: <174478908177.19245.11349422916489425295.b4-ty@linaro.org>
Date: Wed, 16 Apr 2025 09:38:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sun, 09 Feb 2025 15:20:43 +0200, Ivaylo Ivanov wrote:
> Update all samsung,mode property values to account for renaming USI_V2
> constants to USI_MODE in the bindings.
> 
> 

Applied, thanks!

[1/1] arm64: dts: exynos: update all samsung,mode constants
      https://git.kernel.org/krzk/linux/c/4855244996578ac25495a708b426c3f27632a068

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

