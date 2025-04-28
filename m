Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF81F9D9
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 12:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745844495; cv=none; b=dyguUKzWBzB9LCNo0wq07wQ6BLMxBTWQgfPaV3qrRIoU1MuAqQwMe0cnkLcepjFwughQzvi02Rw2DKJT6Bn6Y4WjRIanymojIYXCFNf/lfvgSqVkMpOMb8UlxT1i11MSc+8XIveZuDno4KkNdgNj3UR/H9j+Hz32WV0lP9ymYlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745844495; c=relaxed/simple;
	bh=2A2biSJiK66raGZrBios5AKq7fSHonG3xBa3QyVowQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X/oHNWAORMFUfS6qgz/nF5GDhh5bmTu6K8qKB0TDck+w5xPPIU1FFO6fJRyak8QOg3e0i35RwgHriKZGQKHV/CxaLUxZZ5ogg3BQCDenSzWCONaaSzCmE2coxFEw8HA/Dx2BEGMbORfHF24o4ipOcc4h60A6e4Mr+YFdML2UR4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lclw8zO+; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lclw8zO+"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ace358c4d35so50776266b.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 05:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745844492; x=1746449292; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YljKQXBtGiaGwd+MSQtk+gKaVlh4BPM5fTbTeZoYEdE=;
        b=Lclw8zO+1ww/W3Ap+CqaY/BBKOGoYuVJioJjzs1cKG4LRfmlbDx7+qoWInh8/0E6RX
         hAvEGm9pCbVmZ3aDuYBuVlV6hnU5oAoDLWUG5t+XSt4RGwG4eBMZVVs3ysllebEB1IZB
         YdtlGfrr23s3ryoaKkbMnWf3m4hT4pL/W3+RoHleHe0YiiJM+m0EbhtCiycbPvSGLa9Q
         Te3mNVHC+/bzfSFOduMlacl62ut6rrpoLdKtH0uZphJYT3wbNyWUp5xOTZR9A3UdC/9h
         NtOhek1WU7PEBb+pZLHytlGG/t/5V/JA+xBgCUqtYkVRCiSpZRpaeQNHl6KHvmnMyjZL
         xs6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745844492; x=1746449292;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YljKQXBtGiaGwd+MSQtk+gKaVlh4BPM5fTbTeZoYEdE=;
        b=U/BMIzh7Pb3pMeQ+e7ykdbYfxB/7dERyQhT1mIqt2GygoxTyiLUBg7DhSzxS+gSPAz
         RG4z7z1uFxAlQXT2q+0JsCKNiQ5KCdF5zHHk5v4Tk0Exk5qZbZ250vBaF+F7JVCjb9fW
         NChfqIA2h0CR/8fUvgTgFppDgcCi14u2j31/OXmOgh6KHigomb1vfy66D+/PF/Kf7+y9
         LAM2DXUVzzRhu8kxkaFKSeIQEN4HdE8xfWekqTBraaXrgyvNY5zLl011j6UVkM/visbL
         CUYp4A7rr+3OHuucl/44X3wqQq6pCbo7an8XzchCBvMfVGIppKAS/KdKEYbaV7ZKkmjt
         S4Sg==
X-Forwarded-Encrypted: i=1; AJvYcCVve6z/6AjewmvSTiLcv7Hb0r3m4r4dYWfNmVATF27DBjdpirN+zHVWRhoPOiSHrUaXu7csd2KL8hB63uA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmEhv8NODJwFOyxCQ+7G1JsG2C775I5xo9380d/vq4GqaC5mbR
	CTcTrvg94uTuRedd8qeOkL5KHcMJ7YNpXFP0ELReUzDp7xd0vznicVbFc1f/qN0=
X-Gm-Gg: ASbGncvv5TT1HK/8wt2DekeogqmvcX9gJaNUJYpJVDbbvEUYfwrkH8+TgJolXzmFncw
	uPVYJH2rCV+w+zC52iKmNC//I+KgAp9d6imjZD5nldVBtsReqMxqi/JO6zv6vWTolc13eHu1ES9
	5YvAlCR7ZB0anG4AySvJNheAmzZCUb7JIpHwGPq/Do/FwlBsy6cm+aRg5JWY6UJaw5pxPUvdZwE
	W5Lz3dhYaW14r6K2Ie5gMfRNYSG5FDkTwSQh4EudCI3qJaRAfUDWOYoLWPa6ldvo1n0JJZHKDf6
	oMVewvQtOacNlKiUEtHBSJ8/YT8doOXbiu19oD7LqfAdLRMeCuKCccYeV6E=
X-Google-Smtp-Source: AGHT+IFOroP/fL/DAdnVjum70IajwrW6YU3IaS/LoZWYdb3NibmMKKHUKEvzakkKo/2mdE8tfvRkdQ==
X-Received: by 2002:a17:907:3d94:b0:ac3:66fb:b197 with SMTP id a640c23a62f3a-ace7103a0c0mr347630966b.3.1745844492159;
        Mon, 28 Apr 2025 05:48:12 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41b5e7sm636248466b.13.2025.04.28.05.48.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 05:48:11 -0700 (PDT)
Message-ID: <1df9b47a-d20e-4755-9b30-75d8ff150551@linaro.org>
Date: Mon, 28 Apr 2025 14:48:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Enable XDP socket support for
 high-performance networking
To: Meghana Malladi <m-malladi@ti.com>, nm@ti.com, vigneshr@ti.com
Cc: prabhakar.mahadev-lad.rj@bp.renesas.com, quic_tdas@quicinc.com,
 nfraprado@collabora.com, arnd@arndb.de, lumag@kernel.org,
 geert+renesas@glider.be, bjorn.andersson@oss.qualcomm.com, will@kernel.org,
 catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srk@ti.com,
 Roger Quadros <rogerq@kernel.org>, danishanwar@ti.com
References: <20250428121025.246119-1-m-malladi@ti.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250428121025.246119-1-m-malladi@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/04/2025 14:10, Meghana Malladi wrote:
> From: MD Danish Anwar <danishanwar@ti.com>
> 
> Enable CONFIG_XDP_SOCKETS to allow for eXpress Data Path (XDP) socket
> support specifically on TI SoC platforms such as the AM64x and AM65x.
> This enables the use of XDP sockets for high-performance, low-latency
> networking applications, allowing for efficient processing of network
> packets and improved overall system performance.

High performance, low-latency network applications do not use defconfig.
That's a development config.

Best regards,
Krzysztof
