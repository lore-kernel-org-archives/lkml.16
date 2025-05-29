Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930031E2858
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 17:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748538546; cv=none; b=acNqj93ZvMzmvYtM+nHGaH5gbQsyqlU50NdT45Uv+Lm5y8PxgFCSXNLjhEZRTM+hCOJen52pMLBPbFNGp+xu6Kyf90WUB5kNtsND75q8wBcPackQpIBu9A5t9iDAkTpEe1J0SmN8sW+F41lgnjeVpbQxtZa3tE/lPIDN9MrtGcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748538546; c=relaxed/simple;
	bh=bTCJh7Vs9YYA62uTf9Qa5e5R88sXF7eDOyoY3jHAfms=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SGMvuU93Qvza2IlnzCQ9LRgEv7Qxy4uDb5zflGAOS0tvu4s/NAEWRebs/ll4KcO0MKj3dsmX4Wh6/tfDx0mH4ruQ/oj/4hK9ICEHfxNp2LiZ+g2oHO6xh8xdMKE+uLtcJIhyLzm5G0ut5pBnWbh9mEMSTQFQ/t87gN1XNEtNRBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=VFdgZAYy; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="VFdgZAYy"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-742c7a52e97so969964b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 10:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748538544; x=1749143344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=475QwjMvob141k8a/Wu8TwXkWBwztNaPrC5le4HhOJA=;
        b=VFdgZAYylFU8y6AQEOWhvTM2lqdrEJ1dSxQmIjOsYRUiNwT/l4hFRHjSgLOD/M2EQD
         qihBYlkgFfDhUopSR8LegVYx/BLLWuazLA4pm5JrTzEDNzOd74qG/RNDG90nuNTX0GxR
         tSMo3Ou4X01BtRE7dkKXOS93M2kNDsGGE+o7qhtz733emPXkgp6B3EppLTjmSoyYoOCo
         DxEO/zmoNWqnFUghtqoB74XYgnOhPmVEPcrNYDPr5rPlmCqAGYHDKyQ0iW+Yv31Nc+cj
         BJmzwEHpRW2np4UT6UenDeyXoe+oTvumoVJZ6zKtKzMZjJNgfEUIR5kCW1Nz/JW4ls8u
         Us2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748538544; x=1749143344;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=475QwjMvob141k8a/Wu8TwXkWBwztNaPrC5le4HhOJA=;
        b=CF2Zp247/D4t3e4sj9Qaq3DzIOPl6JBca3wAS5Mq/2/0Z2nugtZZs/jQuIIcmAGZ2o
         Zh6fT3XocgmmEEic4TiH1sgXaY0m7FGvVyelZOvEFVwcmiZJai1nYHdMwAIuJ3HVJd5f
         zj3k45dlJIbErEO2f0z+FzOii+LaE0Xo10p8/5HIX1bmC8/cLoz3xM5CpLUyhageWfuM
         K94npjPB/MiU4E945T7/SeGxUi4QqUDoZ1k/n6firVyQhfAjGYATx9d8oG+Dx4FAlSP9
         7dldE3WCeEx0eQfdglykFlQi4l5A3oUy48y2+cfTgaCys3qLi2PVCIIybktPqouAWIPQ
         vWgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsdqjtQjfPzlkCrUawkOpFbAdde41q4EbPGlb0BxyG9+y0LFG9VZWaf1UjURNTkY8PVkIAEkGWnYICYXk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPhzOysph752JlgL3SX/UcIy1SIrz5EN4J0xvQbAO/ZWbK+dvf
	sPZbpC9bYh/H3fgwamPNfb3Kp4wnnV3aZBPMnGzMp3WQxWOnHCMwzvwbtXKA/Q4wJM8=
X-Gm-Gg: ASbGncsBB7goWp2ZEvMRUq662CYAvEIYw56MfW34vc60K4FBCWKJQbw1KIPtNIUNQMi
	Xh4Kf2YnVG2DC6X5GLW3H+llp7LNOhUF6dvhby/1+BOL0MGzNbsxQpe/vP9byPJwYz02JhM97CU
	kmzaL5H99lwcn73nsaG54D8gh0wqnutdyl/sySnGWZyuIqZFx4IXTtlgBCHVeJggwXbfpOMZY3M
	1nGfxXPc2X6gNMdJxN+sPddQlOMq53PylwmgRPPnz5yCRaZo7lyT6J7LUMH5jAK5zdvtE+6fvqf
	VU51rQC+OoMifI7bRSu0qF0PTnKRCtMA5JxFDL+SB9/En2iprA==
X-Google-Smtp-Source: AGHT+IFsZkN4U8eseSF5210Vs36avHRe1Pd57NJYh8mHeC8iyOPf69SAlhCzh6rpbhZ6zB7HSxl2pA==
X-Received: by 2002:a05:6a00:4fc3:b0:740:6f86:a0e6 with SMTP id d2e1a72fcca58-747bd96da33mr304060b3a.6.1748538543680;
        Thu, 29 May 2025 10:09:03 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affb01d3sm1559252b3a.113.2025.05.29.10.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 10:09:03 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Mark Jackson <mpfj@newflow.co.uk>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-omap@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250514125158.56285-2-krzysztof.kozlowski@linaro.org>
References: <20250514125158.56285-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ARM: dts: omap: am335x: Use non-deprecated rts-gpios
Message-Id: <174853854269.3631742.2539937093987304095.b4-ty@baylibre.com>
Date: Thu, 29 May 2025 10:09:02 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-d7477


On Wed, 14 May 2025 14:51:59 +0200, Krzysztof Kozlowski wrote:
> The 'rts-gpio' (without trailing 's') is deprecated in favor of
> 'rts-gpios'.  Kernel supports both variants, so switch the DTS to
> preferred one.
> 
> 

Applied, thanks!

[1/1] ARM: dts: omap: am335x: Use non-deprecated rts-gpios
      commit: 30b3788330e351f0f16d484f0e7b9b816506e444

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

