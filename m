Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403E81DED4C
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 17:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746379535; cv=none; b=EzBJhvvRA5QFzDM4+b3sVlePy0NP7GJVQey8HyMYW0qnp4tyVKCN6eTbZJF1ZC0CNk4VCxzeS0bplT67iysO18GqPHRzgU411X+qLHVS5bRLZO2tOVn5uMqCNdoJltlwN35MW7JxNZixzb4ptpDkKS0Z7Gohhr/pNy1MAPMQKo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746379535; c=relaxed/simple;
	bh=fl5zCCVpEE2Zmqz4fRFa18I28mrrarwfyrO9Th1s7Mc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=B8PgZphjoyZAyynoAoz5SA5yLZ5dboFz0JHS495xkSqLOkQIcfGBbpoc9Dhlwso3jxW/pFEBuK5afnQTmtl5TNvB82MFsFXEY9T0bk+fLs7wpC9BzOGkdPzCvSdv1U1zdU9iFwZr6gGpk80DIHQ2JDqE99BwdlKEJgvu1tHDzR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=czlK2TyK; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="czlK2TyK"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39127effa72so195392f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 10:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746379531; x=1746984331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nIetZtVvpEUX157Voy4D+ZB3t8P1w/c+ExnDxR/4ciA=;
        b=czlK2TyKMbuZCT2cvCF8CPpvRAqbGYZWG1fhfNoY1LT/uKlbsYgdH2RU4W/uomJGxQ
         rkS7SE7Dlywc+XWYYB0gVx2IpZ6G4DhCdLJ//3hB9V64a2agCuHTkcxXh4pQ8QYHichO
         9AY19tsnaJazC2aroIg91CD7QD1O3yIX5xoiNa8ug8iKU0/1f13Ka7QJB5B13c/fYPYj
         wIqi5+1SRZ7uGRG4ejKwk3jH/lrHhzlMu72tNGwE+Uk4yVqMcQQZyfhRPr12Tt36AT1h
         v+dqmusfOX2RuLkpyMYDjh22SMYBIElqOnxMVNeT65aZeMT+PJbMlTlhF8KdJbc46/eo
         7VdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746379531; x=1746984331;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nIetZtVvpEUX157Voy4D+ZB3t8P1w/c+ExnDxR/4ciA=;
        b=vVZg6367ZEM6qVH2KsSP6Xxu9jiYeeQnLaBHBAdQMykuD0PE1YKZkP+u2YD0QraT+U
         j8pe543KxJEhml0v8Zfy20FOGVj25IvgrdxoEWGxth1WbaeX095QibSQJcH4Imi1t9O7
         Yozj4Y/0vN0NGKiIaujRPyT0FUggs1chhVfCEm551cEVUz1eU4yDivKG9afL5yOMzLBi
         5X0blwu4dCVYlH7Nb2DXIiLmae7ivczRGeH4MOrd9w0OMAN+Pw9O4rB9cp1itkO6Q9iY
         im45nfzm8QBGPp+nJdcRoAYMcdJVo5LfGw538btf+cWUeTHCPfHRa3u0I/MG0ROr0kXZ
         rXwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdkdM0cSJIMbgn36/GYYAwf1VSgvp8E3fK/C3KIKs3DFhYsKzFeLxGqhNN1BPnSlj5Df63kp+ZU3VZZT4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdin8AkuYGfzCxxJVj85LPKae5VZlNCtuV0IhAvBCVPt1NZt/N
	Ov2c2FM0jTJaEJPSE2TKPE5vfI1QTImspVNHjUie5ucSDtYZNzyDb859KzgxbH4=
X-Gm-Gg: ASbGncu55g1vUI9Wv+WxSQeZSTLPqPX2VR+7OZ1w81AnOXTuLzsKcH0TWh6mpFSur47
	WEL0SmHUo2C4ZP3h0VSKnTgyil3LcU8NZHBZZGwk09NESiYg0EOgmtjhtk+fGrQ3ka1w7yugj7G
	IW1KwkwjH2LSdZ7rXcQbbVg65QOvbTbdRx2kV0Ir4GHQCyMH/+vKUUQU77bJHgx5ktgW8b388JA
	n4MxrF8cV3BKf+V6E4R3iIke+R+zDYpW4DZcrs6I+p3bTS552ED1zPg+SNM0ziwaOPdUb8cbCz1
	Eo+rcnbUTHHCwQBlBB3VfAqGXctNUoh3RHXrxIpknWG4UVeu4yZ0zR4Q/+w=
X-Google-Smtp-Source: AGHT+IFYaZEBx5yqoumH/FiWwmOzxWN7aGOeGNL5Ypj10vpFzEjWkb0gKejuM1ERKGG9RC8IhnyXsA==
X-Received: by 2002:a05:6000:250e:b0:3a0:99a4:e53f with SMTP id ffacd0b85a97d-3a099adff15mr2242281f8f.8.1746379531418;
        Sun, 04 May 2025 10:25:31 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b0fe9dsm7896332f8f.71.2025.05.04.10.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 10:25:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexey Charkov <alchark@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250503-wmt-soc-driver-v3-2-2daa9056fa10@gmail.com>
References: <20250503-wmt-soc-driver-v3-0-2daa9056fa10@gmail.com>
 <20250503-wmt-soc-driver-v3-2-2daa9056fa10@gmail.com>
Subject: Re: (subset) [PATCH v3 2/3] soc: Add VIA/WonderMedia SoC
 identification driver
Message-Id: <174637953030.102764.839474842803768682.b4-ty@linaro.org>
Date: Sun, 04 May 2025 19:25:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sat, 03 May 2025 15:52:32 +0400, Alexey Charkov wrote:
> Add a small SOC bus driver to parse the chip ID and revision made
> available on VIA/WonderMedia SoCs via their system configuration
> controller's SCC_ID register.
> 
> This is intended to select appropriate sets of on-chip device quirks
> at runtime, as it has been found that even within the same SoC
> version there can be register-incompatible differences, such as
> with the SDMMC controller on WM8505 rev. A0-A1 vs. rev. A2.
> 
> [...]

Applied, thanks!

[2/3] soc: Add VIA/WonderMedia SoC identification driver
      https://git.kernel.org/krzk/linux-dt/c/6cd47734da4af93cefa1cb3d8370db57cb5616e8

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

