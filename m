Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80B322D4FD
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 13:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746712477; cv=none; b=EdIppf8jDOxZxkqu6d3EgHUGMuvQSdeejEpo9yTJptq+/LjU6wGaL353naAOtJXXAZVXddIG/Klr4jH+BBPUeAvo+4nIMps3hVh9OPpQKa8WRxjK5gLY7PFzJfulq9OM3ClEQyzxeIXHhOQ9ttCd3YYN9UC3xH48aPdPNwMuYl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746712477; c=relaxed/simple;
	bh=qRzs9PVcepQsfzI+91MDulpnTFZB7bYA8DD+AYQJXBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sM59w3teY3uIjb2avQ3f3CE2FwfwDqa5qGl0UzUNQ91caefpw9ocQEA1KzBPvKwM7ng/8gTd/Pxtm5cT5CN9L8xHKQViWMtSLZKhK72bKiJ3lkIDyn0fF8IFhol0sjta3OV1k89GU4GlWM9Yc1f8bOiJZHfHSFOE7lrtCQmTvNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H0yIog/H; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H0yIog/H"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a0b3f62d1aso132988f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 06:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746712474; x=1747317274; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OE2XfGjW9rbiEGA9DoJIt4ipIusyoB7R0P16CBqgBPM=;
        b=H0yIog/HB6bZgr3/fYdOYKGCseCGqZSoA0NQyJ4AUqPHOJWtMoGBTJ4DN6DS/3W7iP
         HJbaU8X3q5KIPBDVgKP+ElwgtYSqSvJa8qK2YdqtntZ9P52+63rO8ugQKoVM/ndc8pOj
         Og6qHPCTPZBm8rTZV1HuBAI4gQbetbhUGvq9vTd0qLuG3rqLC4qmnWfyjBrMjLKtqLxl
         8T3iS92pnMt9n1Z4Sm29bpBWzgIcOd5Cq4mgp4kZjCh3yssq8RclaYbNuPry5PpxSMwN
         OSBCIhh0WnrFDPE7nP0m5CjQJExjwFE6mkZsmoD+tUpzgo+j8TDPXI130q1UGPHnB8tw
         YC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746712474; x=1747317274;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OE2XfGjW9rbiEGA9DoJIt4ipIusyoB7R0P16CBqgBPM=;
        b=MFpJAJCbcrDDGO2RoLdNn/MNEaWee5SGy1VbmDuUl7zxW2QjVTta+e1lqye0lvy1t9
         N2Bh8A3+zr0LjcC5CAXrQ+tjIHefl96kcBFZ/S8zXIe05JkhqQOjaKSdc9rKL3/7BeRo
         tEtUrqBBzMjNkBoL9+sGeAu3lW7hFf5kATdMkcYdaCRUlQZUZnWYpfQtejaA6npLwv5u
         PxST/n/RjRSE/HVL60XehFEAT5cjhhuPU0Pm3EFqWD91QtPtkYlG5S7KhlrpO3iUNDum
         Xf90jhFNWHyK0cZrrFdm105qAng779/CutQDUJHh1IDJwjOab+hpu4hFc89zGyqvCxmt
         ry5g==
X-Forwarded-Encrypted: i=1; AJvYcCVnHnMCG+oHghRGx7/GkKzGAmBFxTQpB+tJWscYzXZVVlb+nVuqv5s5G+mdLuSCsUKsBAIl0wZMTqKFGBk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXKZJb4cyFIyrGlRRF+sBtNZP84+vdZBGhMxbaOSgopnk4d7sq
	wMffneQvsOD3m13yRfpM4nTwRwISTAqBNTpwL9idB/ezW92ZCLSwXCXVL8l8vio=
X-Gm-Gg: ASbGncvflLBj6nZ2S/Zn6UmdePxdBLzzzQRPsSQyr9f7Be8ndkNn3orsD87N/wM5cb7
	soGA85PiGl6F6+v3EJefu64Jj6FT0Gb/mBmZSiQj0UDQ1oOSfht30EXOcbz0oA3ZlMJI2BiGLYR
	6MDg/uD4Ey5mU9XBZG6pVsFg/86e1nf9XEkfpoji41JEi74f72UIVfcXQ3ok+B5RfaUCjPAqo2k
	CEd10gCUNyr318gcti15R89+X8SuhhNRYMbMh9Hh3wdx7f+jaiT9OBBM5MQ3oln/dWI7xbabf89
	IKSgZ5XRrSAFBDXx2e3/yIkAw6CRl4o4mNSkn4xNhCYwdKKG6jatistO6eXpuiKaIS+sgg==
X-Google-Smtp-Source: AGHT+IGFsswoZdi7bBzt6mldCknC7FapGsMM1Gttk1zZwwuSCaJhWziPOOq27/+/xll1dWJ7kbC78Q==
X-Received: by 2002:a05:6000:2703:b0:3a0:bd7a:7bab with SMTP id ffacd0b85a97d-3a0bd7a7d1fmr539248f8f.12.1746712473884;
        Thu, 08 May 2025 06:54:33 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32b0a9sm38507795e9.2.2025.05.08.06.54.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 06:54:33 -0700 (PDT)
Message-ID: <809ff3f7-612f-4e0b-8f81-59290d4bd0aa@linaro.org>
Date: Thu, 8 May 2025 15:54:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/panel: Add Novatek NT37801 panel driver
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250505-sm8750-display-panel-v1-0-e5b5398482cc@linaro.org>
 <20250505-sm8750-display-panel-v1-2-e5b5398482cc@linaro.org>
 <CACRpkdZi3ryJ_D6NYaLS1Cmevp-Pmbdq6zTL5+a=cmXNq42N5g@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <CACRpkdZi3ryJ_D6NYaLS1Cmevp-Pmbdq6zTL5+a=cmXNq42N5g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/05/2025 14:54, Linus Walleij wrote:
> (...)
>> +static int novatek_nt37801_on(struct novatek_nt37801 *ctx)
>> +{
>> +       struct mipi_dsi_device *dsi = ctx->dsi;
>> +       struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
>> +
>> +       dsi->mode_flags |= MIPI_DSI_MODE_LPM;
>> +
>> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0,
>> +                                    0x55, 0xaa, 0x52, 0x08, 0x01);
> 
> The above is obviously some kind of unlocking
> sequence to open page 1 of some vendor registers.
> 
> We know this because the exact same sequence appear in
> panel-innolux-p079zca.c  and panel-sony-tulip-truly-nt35521.c
> and the last argument is the page, so there we added
> a switch page macro making it clear what is going on.
> Could you do the same here?

I don't have docs and this is auto-generated panel driver based on
downstream DTS, but sure, I can prepare something similar based on above
assumption.

> 
> With this addressed:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Yours,
> Linus Walleij


Best regards,
Krzysztof
