Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C18C1CEAD6
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 08:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748332952; cv=none; b=jKW98sf7Tzz5INumk004iAQYV5/M9D6ANN1BYRQBXfYr+7Mau+0WTlzDaZ+x46S236EMswgFc8dSyymCaWOVl3e0EdXlAUKbP7E4W1CIWnA4dS/kWvRr4zsNFWSqBIOu2Q23dGm0x60wIIWHIgifYVIc+CX7EJL+4fWVT9VPeto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748332952; c=relaxed/simple;
	bh=EFsqzRCZ8ePp1PM1ihVHdbx19gT/fR4vZ8gVTQC6W1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gek3kJHuR0yO5/74H2Oj5GipWCcN59iRLBB/kkwmLJHtU7ilxJ6I8jxmQFtlJV3aO/d2umerQEbmOiZYiMgORgYlIqjbd2TGrBzpepgdaqOCHXUWgwXfdNdiSFpeBrw92Q2kx+cn4jVUgoXJWlPvhprYhp14WyVvUJCpjd/CdYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pLkjcxiD; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pLkjcxiD"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6047d11fa5cso235975a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 01:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748332949; x=1748937749; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zZdYklQjuqTcptyM6fEwz69fIzQVNbHtd0JSSB/QcCU=;
        b=pLkjcxiDdd3SmdBCmtEn+2KneExCEBtRk/FsBMIDIG0UtTus7SmjbfkywLrQdViLFv
         DimvsKGBJ5JDKNBxG66OR+WOqIUv5B9W0oeKQ2TEFUva8AzY9UNzLAW1g+DV2ZSmA2zL
         NzCzDmXusooyywFx4uG+WnCQN77BLxyL4reLkJg0adyxshvxSRmAf05EBg94Y+6knOta
         9Wso7GLfyu3RIDyoFLoJk5XECxCjH9dKdrRLW/wKdEl/FTCE/U/J8tFP9Gy/hQs4p5TF
         l5IOiBI/6hN5qFjrMMUnaLYcVrIS+N/zZU2XyTECct1EgDBLWYQXgewC5Ggv6GXQf9Hx
         cdCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748332949; x=1748937749;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zZdYklQjuqTcptyM6fEwz69fIzQVNbHtd0JSSB/QcCU=;
        b=N/1ewcEC01iH5a2aOKwQEussRBiVOFjibnR2Nuvbr1JyPS56M/OFosU3UKZ0EZWk7y
         m9ucfOeJG9kwtUtMG6iWznf3VfQ8EOFz1ufd9Ok5u/3mXHwKplq0K58F6o9dhiwc6yIG
         lBpjTyfwPzkbwShWat2V2j4KcE+8VmLhXkAul++2fKACJFAaa/mCsVdNLIGntekAYl0P
         dNnHBUhRbXOJ6J4LvhxIkyMvIdI/yTpt8HUVQzUBBoLsOpQioYIqm/1q5rqjlESJdmcR
         r+LhIbRJf+wvzzPJQdwu82emxNdcl0djrsof6ymGYgA2ioqGZbtpR2e8f6bbjeFx1rLr
         0+qQ==
X-Forwarded-Encrypted: i=1; AJvYcCXK0YsLvPjYBriWxPkKAXo+mXFEhWDkpKCCwly2PXerwL05wBWcjiaA2Yx0jz/gusEUBPkBDTaj1F5BJ1c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzaz8ItmPAPn+J+23aUBBGkgb9njFrBrLlQya46NuHwsAl+iHOM
	RpfYBPHAjnT3/qW0F12q5l2ukaLvJdvsuCvRs9tpV76iYZL3gX8zoVfx+C0G85NfZ2I=
X-Gm-Gg: ASbGncveFLyO9ttKNIi+86uXhCXXnw7wXD1TjW3IFLLQhOz5qnfRPL/vL1H3iR6CimK
	Ou0+35HHi1tHMn37D8j8l5yC6+C/4BYOFi5y9X1XQwSUsupn1x6PvAa5zcSBb832hATf2ZiGd8b
	TjUTJDCMuIS/vMZkHQroDz/msmGxPTKksebcr7WJpZa7bcAzvMpHVIhRJuajlT9Dp7eDKDC5dON
	G39Eh643lSjUZWRQ0z+XnA6fDt62wB8AYI/p45tMZ8hUqUfOIB7W6kL7UMzOjlNfYuU8iREf4wN
	jeP4i3xWWwu5gj6hmvUOZ3yNQ7r9klcLpbtR+DneRn7utCt4wRipT+VpuiFIfRhsobMY5zE=
X-Google-Smtp-Source: AGHT+IFOoikQuzl2sjvQi67mzdQkPUbTkaKcMh95YzCvEYyHDcauQWWOyuVFb9fxSQsI1sfVsZP94Q==
X-Received: by 2002:a50:f69b:0:b0:602:e002:dadd with SMTP id 4fb4d7f45d1cf-602e002dbc5mr3049695a12.10.1748332949273;
        Tue, 27 May 2025 01:02:29 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d27192dsm1807445066b.71.2025.05.27.01.02.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 01:02:28 -0700 (PDT)
Message-ID: <e200db90-f886-4519-a772-c1e45084a457@linaro.org>
Date: Tue, 27 May 2025 10:02:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Bluetooth: hci_qca: move the SoC type check to the right
 place
To: Bartosz Golaszewski <brgl@bgdev.pl>, Marcel Holtmann
 <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Hsin-chen Chuang <chharry@google.com>,
 Balakrishna Godavarthi <bgodavar@qti.qualcomm.com>,
 Jiating Wang <jiatingw@qti.qualcomm.com>,
 Vincent Chuang <vincentch@google.com>, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, stable@vger.kernel.org
References: <20250527074737.21641-1-brgl@bgdev.pl>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250527074737.21641-1-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/05/2025 09:47, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Commit 3d05fc82237a ("Bluetooth: qca: set power_ctrl_enabled on NULL
> returned by gpiod_get_optional()") accidentally changed the prevous
> behavior where power control would be disabled without the BT_EN GPIO
> only on QCA_WCN6750 and QCA_WCN6855 while also getting the error check
> wrong. We should treat every IS_ERR() return value from
> devm_gpiod_get_optional() as a reason to bail-out while we should only
> set power_ctrl_enabled to false on the two models mentioned above. While
> at it: use dev_err_probe() to save a LOC.

... and to fix spamming kernel logs on deferred probe.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
