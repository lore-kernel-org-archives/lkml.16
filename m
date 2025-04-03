Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E7D3C0B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 10:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743674454; cv=none; b=M87JAWb5pa9BCN4tC6/fjSIkYeCyia1xtnarbFDRZQXyUppp1FXDY+vC2YK9pnp2Wm5lYoW2CfFxSZaYGhNZpqlOZvVp5L5z4PW+qfY4dYTfe8zIU6f/+i18sdi/MM5yTaXmgoHSCakfJZAFGfMxBTvDgmz37cT7K6avFcTOCxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743674454; c=relaxed/simple;
	bh=X91ve6Ah0Kg1e1dwtx44XDPRu+8PQbIaDdhH0M5KAck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AWGUqjn1FenfSEFIynH+QoYFm0hfixpozggp86VHazQGJkUp5351U5WhiGjKNNIPUFxIl7aaewFb/SFOAyqfTHyTuvQ9hA0xj4AScIBeGcT13xANd59r8xpiKkuarC62oh7l4zyqaGrC5SNfz7KGNvKIrZ7ryEeHwUOF9uJB1Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZClJOx09; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZClJOx09"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so4362355e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 03:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743674451; x=1744279251; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bPIHZcH7jsHk3BCGOsoXS/UMGxCNVe0vteMtqWkEZco=;
        b=ZClJOx09n/Bn2HbgqsaovkQlUkvEFuZJMDSP+72k+f/K63odHNGXz079g+LWnCoX+9
         d3bZngCa4btc61zKGKDmhKE8Vh7OGBcXAHqLvmT//q9B5/ADwLBbbr0OQIKfT54M//Kk
         YVGh2XIetTVC8892RuvN5N7jHk5Cihz8jHETt90ncebZephgYvpPCRtCVJvcc1MLGsyZ
         C5w1avJP9Tu0SO55H5B47i34mXCNEbFfFKiHbWnvaXFLNovJZEQ0V07YyR6DRfRdpTPy
         ffNmCgRGSpg7rj4OQ5ErgXMdAlegIkmiJ8hKSE6pf9xU4WlA+G665qXYzX0pmT5cqYvZ
         HvvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743674451; x=1744279251;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bPIHZcH7jsHk3BCGOsoXS/UMGxCNVe0vteMtqWkEZco=;
        b=TZ0PfeuXwyFcBy+AzUapD73EFtt42FkgMnu6yJ6rMLE/qsiWyWq5BY+F6m3pskUPON
         koNMdTLZS0x8CCgTjqL+lwPbcRTBrqEUdlClj8Ez/yFYn3JCiepKImOy5iGFLziIfIzM
         Xgx5XocXwas4bBreqdySmQPQoHAEDSYV067nqdbT/JWXuEZ3XgcNfO4Y6HyC8+jPQFcU
         sIWV9DYQnLqkleuFjDxMQBVKVBNXyxfKBIB9redSX5d82VzX+byVEH/wedCSqmdt3OOY
         KvDKOmcHNWeeO0XWmuKki+yX6s67ekgPutDI3ii+kvJsuvVe/tFHlZubAqJp2RSSUb41
         mDqw==
X-Forwarded-Encrypted: i=1; AJvYcCVfkMjM1TFG7jzjIdVEAFe0JB7qf13lu9TVCyt8bazCc/jYcpBQgtDEjA1pYTMZqaxpceVMNkyIJUOzPpM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwY0RGxlCi/UozevrlasE6KpoZpWEMFSo8JuUFlzR1WvOQ9Iys1
	a5FxoJSnu5AjnMNwlRiTu5M5XTidrUUae1pcnUhRSioNCilp2UB+iHYYOT20klU=
X-Gm-Gg: ASbGnctPN9IH6RYvJlS9bPK6Z0UYt21WWzYsHzfPZnV684tvcR46RJUcU2HlkSUWeLM
	WlV+6gONjdfQcdzP5Mv75z//JVLNDpdyzen8RRb8Fp+EIOK9OY5wrAE1/BVkfeWDOpAUGRWkBAM
	YsoE2RfvlzdMRvezK/N54JX9VXAO+a9rEeYRFjVX2LZSHv1t0ZeLmiFuUdld6azz7eDSbiWMtMf
	B4dXo3dxRy42CCtuZmfzNGrZEHL/01LLuFqgAb1ZztbiCNKqAdOcpz2tBA9qmqejXzYTnIrctgg
	DKSwyclvNG2n2fGLYX1vkwcZOQF49HE6z1sH93Ec0sJ2rW69a97cKQ==
X-Google-Smtp-Source: AGHT+IH0shxMDrYSFcYgFsaXsSZ9dGimeYXwNI38c1YfGi4Au1JKWd6AbU69jfYhfTtey+OesrvxBQ==
X-Received: by 2002:a05:6000:4211:b0:39c:1efb:ec9a with SMTP id ffacd0b85a97d-39c1efbee21mr11054386f8f.6.1743674451013;
        Thu, 03 Apr 2025 03:00:51 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3009674bsm1341602f8f.3.2025.04.03.03.00.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 03:00:50 -0700 (PDT)
Message-ID: <e1d8108f-50c1-4924-bb68-53436728e701@linaro.org>
Date: Thu, 3 Apr 2025 11:00:46 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/19] mtd: spinand: Use more specific naming for the
 (quad) program load op
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Santhosh Kumar K <s-k6@ti.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250403-winbond-6-14-rc1-octal-v2-0-7846bd88fe83@bootlin.com>
 <20250403-winbond-6-14-rc1-octal-v2-14-7846bd88fe83@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250403-winbond-6-14-rc1-octal-v2-14-7846bd88fe83@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/3/25 10:19 AM, Miquel Raynal wrote:
> SPI operations have been initially described through macros implicitly
> implying the use of a single SPI SDR bus. Macros for supporting dual and
> quad I/O transfers have been added on top, generally inspired by vendor
> naming, followed by DTR operations. Soon we might see octal
> and even octal DTR operations as well (including the opcode byte).
> 
> Let's clarify what the macro really means by describing the expected bus
> topology in the (quad) program load macro name.
> 
> While at modifying it, better add the missing_ OP suffix to align with
> all the other macros of the same kind.
> 
> Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

I don't remember giving R-b on this, not seeing it on ml as well, so
please drop it when applying.

I used Acked-by and not R-b because I wanted to signify that I'm OK with
the general idea of the patches and that I'm OK with them landing, but I
may not have reviewed it as thoroughly as if a Reviewed-by: was
provided. Please use only the tags that I sent. And if by mistake I sent
both A-b and R-b, use just the latter. Thanks!

ta



