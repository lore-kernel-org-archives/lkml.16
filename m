Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBEB1D54C0
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 17:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746122178; cv=none; b=Kau3tOAT7YhlNYAfx+02IVAL+dVqxXIquVt5XZRmog4rEBq5UZ5I3QP1CyDm8HlNE3M4AzfWnlo0YCJNO91NGDbXRMEqLpnK5wIxqdmLlbx6AaRH1LUsIEIi5DhkctLVlP6Qdh7N6XL+1zhmKDEg+v9CXgg2pcayNTQXgxNMmis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746122178; c=relaxed/simple;
	bh=+ZkbXNWXEKtZ52N84lJPY6E9C2ga+JqlckGmI+RbAxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=szdZLlmcSjHXsY/S86Au5QvpUU3ZlEt8pr/uVD5x1uoDIZ0pWqLcSu/TtYhYWAUNkBGzdZjr9C+inAjV50e3XeGXcNMO02zCHNUef6zpd3Vas0oHXwdcVCiIChr1T7Yc/ywEU+Yk+/FtQws27DZcGuXru6WF6v+5al9hcibrDXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xo3Ww8Kc; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xo3Ww8Kc"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43f106a3591so1576705e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 10:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746122174; x=1746726974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IK2bVTIIhhzP81OChiwb596WQVXyChhJOMvKOg7chKo=;
        b=Xo3Ww8KcSEZTrnaeED2Bkq69rDjdEF7R6w6TJW65IkdMTDjRlC5k+7uZ/iFn2t8/3Q
         IGUr1/4NO2NCwSnAz4b07fZ2GS0oHZJLWLrE7bSNOh15gzYOZU8aZXTsrthb8cTn1YOg
         Y3gbRnyYfDJycrB549L1P1fQdU6e1lfb1d664u2hOlkl1KL9uUKp9kdsMEcWGJXSojnr
         oz7xesRGbnnQXRzN5LXWHvMPpw17DJ+IR28kMjVjPTblpLoxeR3rbdzNDutTkIMsrsfj
         FX3izbypGJF/a5nT5FxOmuaMXDLto68SlmL4qAnEQ9DtOVS8BKvF39IVPJpog0/StfEl
         Bv5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746122174; x=1746726974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IK2bVTIIhhzP81OChiwb596WQVXyChhJOMvKOg7chKo=;
        b=C1xRfbJotH0HHt8i8JMqloN9t1TcVcyKLsaKz4t+PeuJ2CjSYICCAEBrirCzNjcCwv
         FgOSLa5YBzbSnRFam9qFA5HlZ9cmfnnnqkH84mXmQJVFv9X7e/R4wpoYZmrFiZ+ObLqM
         U/33xAJ6GxcwJI9xnjh774AQFK9V1aee9YETLV5WuIn5ogbO06tXten4PAdZr5j8GIt/
         1CgwaE7FdUi5xpCxOuvvHbOHnleTIK8vk7L9Ql4ESBQjP8S68L0HHNItX9DAcy4aoUvv
         zIJk+gXC0SV3OoEMVf+OHIp/6guZmaUQ8GDp2Hgf9vmLQL20UUn3xFmvbK4+mmUurWU+
         Zo3g==
X-Forwarded-Encrypted: i=1; AJvYcCXSefQb035oSjZ719vEvz8HctPMzulZ/oLoeVaiLwjClhJWYctn21YH6qVSmgjXATdb3VzwHDl/hbxRVEM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMZmbMs65wi5xKMyrNmbb83ysdzd2iCmfpqRtkAHzHnsb4CaeF
	j8sv2jbvO7mhvuGRjkvqNLlwWZHTWqAGKG2cvy9TaMH7js9OKYUr8qqlJjRDlqI=
X-Gm-Gg: ASbGncvErLJtIpTB9hyx35Ik+w4vWzTHdQcCM0lLCLfBiWJkqUHMzhAi8YxKiCGkIvF
	wY7YsQZdXlgOgPBqhp+mPXwW7u9/JtgCBZjI33SLRgdbzV3xwx1B+Y6kH/LoypdQ/azg0RCLOsA
	kcuKelEGyypGSIUK0qxX4LRlkiSlwKILc6mHiZP5+Kv80nzo4N9gOgcEemeMys8wXMVV7E3ERma
	7Wy7xdVXP1ZyR5ri6YfaMV5RMrofO+X+NGnmbN2XZlkRcvWdCxbLZvwOElZ8sizBhQ7vAXMkfzv
	0UAa3IGRqLefFitgruu1Da/aRrab//h1SKP0kZ/zh/k8//a8jw==
X-Google-Smtp-Source: AGHT+IHcNTVko+p0UslEdpOSECiNWYg4KwegPnVDNSnfA7qyX5CM0XpJuYwCCSoT+IM6d6ZiWuLCrg==
X-Received: by 2002:a5d:6b0f:0:b0:3a0:9570:7233 with SMTP id ffacd0b85a97d-3a095707240mr506546f8f.11.1746122174634;
        Thu, 01 May 2025 10:56:14 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a095a88313sm1382939f8f.75.2025.05.01.10.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 10:56:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Peter Rosin <peda@axentia.se>,
	Andrew Davis <afd@ti.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] mux: mmio: Do not use syscon helper to build regmap
Date: Thu,  1 May 2025 19:56:03 +0200
Message-ID: <174612212105.144653.16236323628246216247.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250123182059.597491-1-afd@ti.com>
References: <20250123182059.597491-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=706; i=krzysztof.kozlowski@linaro.org;
 h=from:subject:message-id; bh=2C+7D+yGdun27ZaKkVE18fZXeGHs1oDPSs0rlfSvMVE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoE7WzLJtvI19KZ47O9RE4I5NxFGbOugCUjtiWq
 oDTx2QP52GJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBO1swAKCRDBN2bmhouD
 16zKD/9hf1syttk58/fLfpJSGpEDOg06ZdzQsz6dYZxNeRSW4ZItDg66G7kHld+/U6+DYqyTAoU
 sc8sCewKGAfi/c+0yA4YQzcrfPWoWVzMPTLXPiqsEcKkRI+TAfHn678Q4nNeIzcmx6uviPbTuUW
 IU1LqsK3EdFNL5O75LyOL7aoklElwC07H0gEo6aY0pCGbjuoy694aypvvHzE/qoTKzyE6NPZe1b
 c+9gD1cuWspZTM9zaKPMhD2VvRyevSQNBQMivBmI/Z6tqw63GOV2YDR05/PXTfT+cM1KmXQltP5
 +t8lqZmAl+RIYPIkgxGyX8I0RHDYKxkLITvUvZMDs6y9Rk3cQUfTkZgMmkT0t+LpxRJTaGULi6O
 a+658NaeR/fTAdKbfmBCRbS0vtXi28rkMfmWC2D2DcfbXMH/VEgpkrUXEHQ2gJrPGph8GWIGpOP
 xgSx9GlqEIek4/LUwwjUZRekOA2EjQioFdjzM8WF+PZ/zGJNTcdeUT2llAnLutNRXas0WuoJ5q0
 838ypedYWra7ZOjBIf4ODW7ZVWUer2soM2gUEfo1re47lUEXNPulSaXzwa2FQAIdNIwtrEdyQ42
 WqGWBzUm56wMjyQNobyNNSzYsveFP7lr+5FhuvTtuNyOW0UO5ILGJxVqdxvPtz6IPtudvZ4suGa oWj5bzRa2zd71Uw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit


On Thu, 23 Jan 2025 12:20:59 -0600, Andrew Davis wrote:
> The syscon helper device_node_to_regmap() is used to fetch a regmap
> registered to a device node. It also currently creates this regmap
> if the node did not already have a regmap associated with it. This
> should only be used on "syscon" nodes. This driver is not such a
> device and instead uses device_node_to_regmap() on its own node as
> a hacky way to create a regmap for itself.
> 
> [...]

Applied, thanks!

[1/1] mux: mmio: Do not use syscon helper to build regmap
      https://git.kernel.org/krzk/linux/c/61de83fd8256e185588670d3cf0bccc3e913819c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
