Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FA92F50
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 07:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748849736; cv=none; b=PJUiL6vUyut5b5mhppVzUPnJO7/5AvPas/rtNj74W+fDM7a3qJMEob6iInFq9Vc4h4NNxXL4sVhcnBdVyOZ1nClguZrYnkVM1v6ydJU4EK9FSaJCy3EKte0kTEK4um3cEuSEquYasUtiLXIWhcjYIyiysoFCCPboL+nqRd7wPMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748849736; c=relaxed/simple;
	bh=MJsv+5GBNj21PZlW1gTm5wXSgxhfAGAZGeqFJ/x9egw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ssFSeekKmoeAbA/X8zGUOHuUEqrSNlYPQsJVcw4f43D6Gl18PqYo+Lx+dW2hVeEDH+RHQliNuggFFDXjnZowN5KAm3mkbFXvygkUKwlADxMlaMmT/l5zat8yDA1DUFx+8YAC6cYRTAIgGkRZiN4kqZqtivAceIFEXZWklCXL044=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=QkaDbGLe; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="QkaDbGLe"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-442eb5d143eso39908585e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 00:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748849732; x=1749454532; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cumGIXMNgc0u7pbGPIyAxyyCYSUeC1bHYbz8p+dQZP8=;
        b=QkaDbGLePrTQ77/yzIMAup0CIQlXPWtPRmvRfrrkzrSatvFjptqb60j5wbYWgLrNj4
         7tlPrGAmFtuLyEosGhbUVHV1fw1aPQlhe/gz7pa2GWaYygVcIkSy5bb4Wfrwg1uJWOGK
         rOy4UhDIb20uYDG17DofwCCTFyqboUhRWlPzqxrFUSp/UnPpwGdN2YXiQlVsGBcp8y5f
         u25AK5TGhzEkkdx2mevhnLo+33RQM260GjTz6w1JLmfcM9Nc4d1c3X9FzysjgRl+Hrck
         8n/fhbjwV8+uTEaVFBuyScOrRGWnx28hUsebMZzcBNdC5AaMQgSsjf65qYYoF31guA7t
         WTKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748849732; x=1749454532;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cumGIXMNgc0u7pbGPIyAxyyCYSUeC1bHYbz8p+dQZP8=;
        b=E4irLFE51ZLHz6U1WZhuDgzrtT66NcvnD2wMiYV0tLxCP609UFamZPoIVjvwTC1bhj
         3eMSauHHef7W2BLH0x9nNkOhrJjfwMLy9JbuIFoZx8aTjZxuThkb3L+UX4aXllZ6VRD6
         ghdrVps3tvPrkpE0s9LNHW5KmgQjSQfDNF5/940FAr5xHEDV6pHo0jDjNbS9BRMkOb/5
         rDTPNJoO8swfhkGrjhPMfhA0oNM3HorJHSw5CjfbiNYZZYTEx5Kalx7G++lnc6kD1U3R
         rsxWRgXI6lIJ+fdn46MMuiTtl5Y4AWW8YiUoyXV3qz9UrAb2cFyJmHYmQ3kKBjC5Kytm
         9gmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcsF6FywTs2VX0Gk85Sm9X1qpgMJkO+7fH3IeUsdxkAo6MImxIW4uobvtkPVx9exSbusCY4FCRFw0fjAc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRIj6/aeHhyDNzO+pWGn2wq0CrL5lUIQvDe7yp0k1WKYhe53j7
	008wuO0jr9hWeCaNOJhXxuQf6Od2IRGjWKQ7YqqOQq9Kz+X5zDyE4/njFDC1/tf0Seg=
X-Gm-Gg: ASbGncsLpQqf6yI6W9ow2+DRcgWmsJTEoiOd+/NV4FWDHyg3dK+cdPbxZMbL4An/gCE
	ZusPrlubUCN3j85r85mu4pFIPhPxNQF2Al0MB5aU5dbp4IMBejjZDKfnSyM/4LFTHxqJwoKdaFj
	X8vbGQPyewrxK4CEmj/vJn7NiJZm6VVG7+jNa8okOi2NUll2/1wuCU2oDigeB0iU/wStLSS2FaC
	bm1uiCH11enudzKFradh8Z+mEUqbVD21WHTei702z2Mzzn+G0GJIz16Da9cDkUAjhmuXNwSzETO
	40Kw2MnWY+5DvOAS3lJD8xfJf1HuOSBqHmua2RYuS1ufNk3b3gOV2XZaZwlUpgDzul3mhZAvIEp
	fwnZ20DtlMz9anPd0cJRr3uX7u46fUYo=
X-Google-Smtp-Source: AGHT+IF6XBbjDeoqa8ITCmT2RHP8cD671wm4VZYXi7RTv3p6ZxGMEf7YXAkUXpSnyVYCGdL9bcgGPQ==
X-Received: by 2002:a05:600c:1914:b0:450:cf42:7565 with SMTP id 5b1f17b1804b1-45121fb93a2mr53090255e9.23.1748849732335;
        Mon, 02 Jun 2025 00:35:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6c842sm13689674f8f.29.2025.06.02.00.35.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 00:35:31 -0700 (PDT)
Message-ID: <ff60e791-7305-4ea8-8048-ff33316bf8f1@rivosinc.com>
Date: Mon, 2 Jun 2025 09:35:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] riscv: uaccess: do not do misaligned accesses in
 get/put_user()
To: "Maciej W. Rozycki" <macro@orcam.me.uk>,
 David Laight <david.laight.linux@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
References: <20250530205658.624195-1-cleger@rivosinc.com>
 <20250530205658.624195-3-cleger@rivosinc.com>
 <20250531192801.5d6329c3@pumpkin>
 <alpine.DEB.2.21.2506011830130.28395@angie.orcam.me.uk>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <alpine.DEB.2.21.2506011830130.28395@angie.orcam.me.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 01/06/2025 19:35, Maciej W. Rozycki wrote:
> On Sat, 31 May 2025, David Laight wrote:
> 
>>> Such behavior was detected with GET_UNALIGN_CTL() that was doing
>>> a put_user() with an unsigned long* address that should have been an
>>> unsigned int*. Reenabling kernel misaligned access emulation is a bit
>>> risky and it would also degrade performances. Rather than doing that,
>>> we will try to avoid any misaligned accessed by using copy_from/to_user()
>>> which does not do any misaligned accesses. This can be done only for
>>> !CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS and thus allows to only generate
>>> a bit more code for this config.
>>
>> For get_user() you are much better off reading the two words that contain
>> the value and then doing 'shift' and 'or' to get the correct value.
>>
>> Even for put_user() doing the explicit byte accesses will be faster than
>> going though the generic copy_to/from_user() function.
> 
>  FWIW I think optimising copy_to/from_user for such cases would be a more 
> robust approach moving forward than sprinkling open-coded implementations 
> across code.

Hi Maciej,

Indeed, that's a good idea, we could optimize small copy in
copy_from/to_user so that will benefit all the users as well.

Thanks,

Clément

> 
>   Maciej

