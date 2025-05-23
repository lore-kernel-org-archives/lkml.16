Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5433C23BD05
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 12:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748002588; cv=none; b=nrJ+G+E6GOeKp6IvOTplS+fvfMvnZdX7QNvD5Fsy/PsW9apPQeu6JzDmzT4pHGCfHK7I/8suMKtAz4USCSlj2gYLK3SNqY0CkwrekMNCh40uNJQ1vfZ8Ig8KuirNfksPgvXLRDZsMRFuTBHaac8ERQGs+E3DhMHpgIU8w3Cl0zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748002588; c=relaxed/simple;
	bh=G+6zcE8n1H0QKOAPIWbD5AEsQ7oZyOVolZnBASiye9Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aLcQftXWqDHRNbeUDJfEI2oWGhTOo3r/OK3l1eZ1mO7rdDX6p27xJJFgb9AeNOiVhKsah2sVgCPjUwpqndgMy7MOVgUytFIat5fIsXgujzArbiHJ0mebUo+bd2fU8Dq+Q0UeTzcvra248BWM1TCVdBtjbz/LcUYU4X6fA5MRCZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bgDPgaQf; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bgDPgaQf"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ad53bcef8c2so92377866b.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 05:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748002584; x=1748607384; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=M/iRRgF6jwuXH/Fk5crV9qCMV1n+ZqnM5fPwtxmvV98=;
        b=bgDPgaQfWlypJtOHS7GPmGeM86TmyYIr73BSwilzHfaG/x4AH1g9wCWX109t+JMDbh
         PhzQuFNE1GfFWd9pI8ZW2kj6yq/Ya0BTiEPK4nCg8e08gGBVkvfqX6i6assOwuQXnBtq
         otaD8Iv6ZnY449KpkApPSbjzKwA275aZ6+DMsPhjQyCcZM/40vUJvjjaaSMkH56lfaOY
         iExkyGJBq1WNJnoNGmWg1zMye3frGg1ZaiAPG0s6nRg+oIR/U3TyEbC/w/NpU7TpEdCo
         rvk91pZj4x/REIPvyKTsqteSmfXLUIpmYN6YSZca5/zNbPh8Ryw+XNca05pi6nsTFrNJ
         nq4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748002584; x=1748607384;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M/iRRgF6jwuXH/Fk5crV9qCMV1n+ZqnM5fPwtxmvV98=;
        b=iLFD1LUr8DEDRZ2jP6KyBJxk9BdiXyROLjlMoSy7BO4TMt3bBH9r+KWTepJqBZwt/D
         jbcvjrrNkEGIpXwP4u2C1l61t9T16hfrtu2bbu0aYjKU7cmfONen85RMIRjEKCcc+O0l
         /Z1jULENo3dQtusTVgLamH6RrWIVg+tUeDaeC7rIZTVdSIbA/IcCNzopnz4mi9ETslps
         sNzKpM48WXN8YVQuA8bLZLQg/2J+13XPi8wFp42DK9eplwscu9lrptrlv2tpy3KzB29F
         as3BvwytaLzshNcq5yHqBjcCRGoSQPXSTFPCdATvl9XWsz+2OIq5ewzuib1bWeedJtCX
         v6BA==
X-Forwarded-Encrypted: i=1; AJvYcCVFX25ABV6vjo84YGc+4Y3Z2h3EOz5wsdC4WPn+uTaSng16N3FXN5t5xbZv9hgtv76VG+bVyNk45zUcOCs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgOWBytVoHVkdGvQyaZwBQDtQ7I7GffyBUSqv1l1W0pAEKsDmi
	HMViuoFNtNE6OHY233IwEx+JAdHYwHjf3evRQxeFn3mT97lIMPPYKOO7trYDwicf6lY=
X-Gm-Gg: ASbGnct+iLcTGBbd9mM8uZPSanIqh4TAG2lspdr+C+BYM+6IajLxGGNNf9Xx1K8XsO6
	p8TNFLf5uQsOwPC2u0oLj4nOnt9UNosNrtqILUqoNThebB9/wwh65W/3cVdXXahYukGOHqVo5eg
	IiO4coXQ5rjSFSAyLiq2bi1c84CAGnDd/lBoa8py+G7gVjXv/HkgSAJZkiEIF18JAbWpvV0cF6R
	+KjAxblehTIjKGHNl9o83jtU3QpMDcjB/lTYjSzXAG43lrb1a9GYVjRvYC+HCMqEK8tSKBNnAfb
	q/WGZOIymYFFIh0pUc/5CwQvHkghsm052LNzAvEoQLSa/gxglcMNTLrFCDDFCzzeK9NEa3A=
X-Google-Smtp-Source: AGHT+IEBPy5BoYPmhgc+svPT9StZwncZf69U6mVl4FOT5ipdtTmJlC0XKXOU+PjzgmR2xKtRS9sM4g==
X-Received: by 2002:a17:906:8465:b0:ad4:dca3:5b66 with SMTP id a640c23a62f3a-ad84cd1a2edmr55502666b.15.1748002584533;
        Fri, 23 May 2025 05:16:24 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04e80asm1216438266b.2.2025.05.23.05.16.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 05:16:23 -0700 (PDT)
Message-ID: <542e254b-5feb-456f-98b5-fa1d74418e37@linaro.org>
Date: Fri, 23 May 2025 14:16:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panel: nt37801: select CONFIG_DRM_DISPLAY_DSC_HELPER
To: Arnd Bergmann <arnd@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Danila Tikhonov <danila@jiaxyga.com>,
 Jakob Hauser <jahau@rocketmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Hironori KIKUCHI <kikuchan98@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250523121127.2269693-1-arnd@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250523121127.2269693-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/05/2025 14:11, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The newly added driver uses the DSC helper module, but does not
> select its Kconfig symbol, so configurations are possible that
> cause a link failure:
> 
> ERROR: modpost: "drm_dsc_pps_payload_pack" [drivers/gpu/drm/panel/panel-novatek-nt37801.ko] undefined!
> 
> Fixes: 4fca6849864d ("drm/panel: Add Novatek NT37801 panel driver")

Indeed, I wrote the driver first without DSC and forgot about it later.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
