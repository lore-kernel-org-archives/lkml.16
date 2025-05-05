Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEE2227EBB
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 12:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746448722; cv=none; b=fFaRe07xO8fWJjJOuCsX0ROQKZudLWrnyAHRXPD3C9CvP7J+bnDwSCQOjWNV6/a0aZmORU+RitwJ506Mb6hRRO251cs51xDRjjN+Kf8GqH4XBZVQDw/2+nKZV3Npwb+jEUL5PnRKc1ON8bYq11JRTLEn9bgVQqWSd+9I3VHPBYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746448722; c=relaxed/simple;
	bh=i1ow5HamyQ6uUmgMTVN2OCl6RT8FtU4Bwib3PgVLTe0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mutIImGKQdeojvCEU2RwvEKqoVDC3ESlZ7quDVtkAFEGuvgv2wD3EvP6n/m8uvSzK6DpF5WViqatm3Km+xx95DCSge6/cCxlkHpn77VDR64wiMftBxXoHlvIZSh2VyRT1K2+LxaGv8zCQYjQVESk6glG8s+4ryaYTnBLnUzR878=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FL13yfSU; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FL13yfSU"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39ee623fe64so4427304f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 05:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746448718; x=1747053518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rl6spdFCta6JXs9NjzJlT+z8o2YUBT0Kre+VTf+/vXs=;
        b=FL13yfSUaFeyQCbtJ73Zd9/EGA9eo2k8YvhYPE9hCZszdH0GuETRiKTsUE6xYS/iJU
         lieF3zD+55s+bpC7KfFhV5Nit13UH0ENWSz1VkYdVHBh/I37JzmVA634UB1to+xY/nIK
         1qcCadEwCqZeT5ek9hlg5Sq5zAb9jtGODyaEX6fXzDxwlb1AiCLlIoeozL9AIyhyg4zv
         cUsW6K8Ians4iwRavVbRAN6P7vbH9WxTyCETJPAHJrFxz6lqi+57g/8d2BlV7xv5aC3H
         mBQahh2y23DL0IPjY1Z/HDlSlY0AV3+lbi2LHfVw3B0g7y5gHPugkucbbrK3UJj3SD52
         w7fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746448718; x=1747053518;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rl6spdFCta6JXs9NjzJlT+z8o2YUBT0Kre+VTf+/vXs=;
        b=GlqwZl6MoTs9uaUoygYoS0ZNkJ9Yij9JWtWFJa+0RyFTjD+0m4pmqwMMCZ2ipVz0ge
         49A5sknrwunoFEjc+F+kHPfLF82dlPPPloUzYNACNS7Biv0N3nx1vYMKaZyz89XjCUUO
         b7rbk1rOaFmCGhvIi9vdvunsuECxGn2X2kPzPOoCHBJM9HDzmU5zmSwWijiyai/+bP4n
         rvcC2k8faJtlsQ1VSYQuPGQ/rIcUZx+LnCyapt2lumG01mWi8yg0RiHHHkH+IRuvMrYc
         KCXpejXGBpC6nhOP7O89ICChhHeky8WN4yBicrZOHA5GVGOT496JRXg6Nvx34IYj5k2Z
         zlNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWv/5GM8RWJsKqh7tUAN8vBOW/NPkf06MgcwYbMWs+ifdrQvqvkMt7bVL+fOT/YIIVVzUcmR2Z1UPRDWa8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwDSsFpCq3C5eT/ig7TMmE8fBEiKO1AMTBROhAo8+jSgmo0LYL
	pV6BGbOyLEj4OpGcCNiZibEYiGt5MAAQQm4svvvYvfXYRexdGkJeMXw2JwkIr8w=
X-Gm-Gg: ASbGncuA12iY1sSCh+t/Y+NsuiT6jD8X9wjzvi+HSKjW+FqO3reurDMn+rJgQneWdbx
	ArdVvnfq0+tERCTv9kVGZL5c73NxHDHx6kNGV3KpeAY3S+LZexrQS5MxtyRm9EMpdjAOzMBzlWS
	Y056rJ+wz563Bh49PeZxu+D7Ue29H3IyIrJNbbzT+kUo7F2mW7KKzjgkTAXLhWWNTM50ojW3LEZ
	XeGvPhMjF5qOCLZypwwm+N0fAmhbH06+nTacg/mG/+IQkGbHpLwHhMzuXKpKyajeFKeHquH9p0Z
	Sw3B0cW7RGZmSlZgKKEYH0LyWVBVXKdOapK++UmTDvjeLzJ2gHcjPWkN5poJzg==
X-Google-Smtp-Source: AGHT+IEPB1W6TKe5pDLjaw9rUkL1i4ZzERHI8wMQEDvQTkA9//qDganu2o1wcLoboBW4dB3iaby3zw==
X-Received: by 2002:a05:6000:1869:b0:3a0:8c45:d41b with SMTP id ffacd0b85a97d-3a09ceafb06mr6167004f8f.20.1746448717806;
        Mon, 05 May 2025 05:38:37 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae0bf6sm10416625f8f.18.2025.05.05.05.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 05:38:37 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Kelvin Zhang <kelvin.zhang@amlogic.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Zelong Dong <zelong.dong@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20250320-a4-a5-reset-v5-0-296f83bf733d@amlogic.com>
References: <20250320-a4-a5-reset-v5-0-296f83bf733d@amlogic.com>
Subject: Re: [PATCH v5 0/3] Add support for Amlogic A4/A5 Reset
Message-Id: <174644871707.1393229.7222540687542026901.b4-ty@linaro.org>
Date: Mon, 05 May 2025 14:38:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

Hi,

On Thu, 20 Mar 2025 17:42:07 +0800, Kelvin Zhang wrote:
> Add dt-binding compatibles and device nodes for Amlogic A4/A5 reset.
> 
> Imported from f20240918074211.8067-1-zelong.dong@amlogic.com
> 
> Changes in v5:
> - Rebasing on top of the latest upstream changes.
> - Link to v4: https://lore.kernel.org/r/20250313-a4-a5-reset-v4-0-8076f684d6cf@amlogic.com
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.16/arm64-dt)

[1/3] dt-bindings: reset: Add compatible for Amlogic A4/A5 Reset Controller
      (no commit info)
[2/3] arm64: dts: amlogic: Add A4 Reset Controller
      https://git.kernel.org/amlogic/c/946b51882b84f0cbec2acd203467866a7378abac
[3/3] arm64: dts: amlogic: Add A5 Reset Controller
      https://git.kernel.org/amlogic/c/f0911f29478992f37e91c208fe44c2ea5b378b61

These changes has been applied on the intermediate git tree [1].

The v6.16/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil

