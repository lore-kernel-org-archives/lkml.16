Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E70D158DD4
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 17:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743961392; cv=none; b=ifFRiK+fPlW1cR0s12w4wW5k4Vma12zsF4/4zIdGK0j+EMOttJIsoITjvYmXyou1c66e2O0iA5HSekTb4pKM7eQXGM/WtK23U/G0Irkb9fvw12XC4RJDWHYeErDPPBxNlOfq41mAWbQj/IMUaM0Hd+mxlR549CRpwpkwpB2dQIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743961392; c=relaxed/simple;
	bh=rJZV0G90x0J+4qYA5JGODt9/yrTs7P7YYGype4F4eq8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ZHKD2TrzOFYn5/jzfnitH8/U55+/QbE5/yhDP3q3h22kJQfT10H6xximyAx0TyWjpCkaSTXx5zpwwctJUhpNWryxnENyV9jfM0sRi5wO3X1dpY/u1uOsoQqu1KP/mlcxF0k3gDekCHMPw2gZdsOtN6EYcl15nBdcqa5gCnP65L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UxYM27HB; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UxYM27HB"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39973c72e8cso386391f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 10:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743961388; x=1744566188; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oUhpKvx4fBH9iWVzZ6YE2Z2g+R9flvc4QgoEqUeRJPs=;
        b=UxYM27HBXbZfffqlt8eUnnXI8taQavmyrloTSwM66/8wy4bxb5Oeirin2vCHmEklkr
         yuOZjInYnR+Ych9+KfZiSxpmsR1NZMI6Vtagogp/pyM1B385W+o4FKGguiEOBJzTduLJ
         V+CeeMr769FJzZqmaH1dFpXbK6k4hCls0EkO7FpuuFxxXeqbaLFwS1rdsCv7DCOww9Vh
         kdNvHWS8lEZ60aIsihaYnU0cAEKC5ortvVVIiBUP41knmhkjumPypz/5zF+3IfIUvdbN
         I8XKWb5u00lJBqKcNhHo2kX/MSk7Ad0c+SxWT90AiY9VjgBLOQzCufL6cWU9kcCQxchU
         Vzmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743961388; x=1744566188;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oUhpKvx4fBH9iWVzZ6YE2Z2g+R9flvc4QgoEqUeRJPs=;
        b=YDDzthxxaksycmywp9BaLbqkN0DnOlN+7/n/2PfSHxwor2LqMz8Ydu0UESboHHZaY9
         qkyp5V3ETWs8UcJf7R591cRj3gdBBf/5xevSW1O48aeXQqF2sX4cU2Dv9GFviPTYSqgL
         /3cMZMvYu8GDodVHCtgWnNm3vbZu+/hcnR7g7HOeuaFlZ18lmIZ9c5Ki7htIaKHYPeN7
         T/dg1YCUvqxjgBcgTfB0UYoLmAi3n3HYDBBBSwbU8Owhlsp2shzQJBX13M9tU+OYzriz
         x8MOVzoq7KaBZXwrrmneqmLuU1oiluhtNUTcrQUZaQaOBnr6ri2wsNXi5AxmufwRQNR8
         CZ8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVmnDWS+Ow5NoC7d5FzUmS2U2pYa8twMlJxX9wW0Vak2/N4I+66kbibxY6gl46SqC7HUQpuPdI7V8dAU0Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoGr911mm/GZiPl9RvYcZYwLdhPB2LLHN7I7n9kRVbb0liN1fs
	KkQSEc+MRxb3mvvjgzLJHw159XFL8yEfg0JNRZn0L8hnMj8aLVFIdQQ5ewdRCzM=
X-Gm-Gg: ASbGncsbyHFMat8FIQEEmqDqUWo1gn8dG+6GQwtYinPnDsjGL78tYFkTib3r2dJd/Ad
	hPklI1cSXg+dhWAMvketKH70IimDdNg34WfCbR7IDqPvbijCFtQboBqpVXH11ftFfhu41iTVyKU
	5CTTPhqEokp2MEmMWp5t1njoORC+ctm9FQWtOLQJ2viCKg2nIcm0sXKEB6Kc0YHH0PXE97Zf4t6
	1gEGjQeGuaSfzVrKqJVtrkG5M6Oai5ztSqQm40Ri46c39nu4aJMZiZqoO5jrCbDUe+DHRLrAcHY
	GHjbQSa3t9Hj5PcBgcXnfukkEcrDetc0/49arQhqDKxaB++bE3OSMfCsIctpIa7e
X-Google-Smtp-Source: AGHT+IGzHMK4flsGk4xl8C6hBzmImNR5FM1T9MGeAQ9eadcap3jSKN01u23R9cYYDfo7R8FmbaQZeA==
X-Received: by 2002:a05:600c:5492:b0:43b:c825:6cde with SMTP id 5b1f17b1804b1-43ecf883ef7mr22800115e9.3.1743961388323;
        Sun, 06 Apr 2025 10:43:08 -0700 (PDT)
Received: from [192.168.1.106] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1630de9sm109058435e9.1.2025.04.06.10.43.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Apr 2025 10:43:07 -0700 (PDT)
Message-ID: <2f0e8807-d37c-4491-be6e-c04e3e9032e6@linaro.org>
Date: Sun, 6 Apr 2025 19:43:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dmaengine: ti: Do not enable by default during
 compile testing
To: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250404122114.359087-1-krzysztof.kozlowski@linaro.org>
 <20250404122114.359087-2-krzysztof.kozlowski@linaro.org>
 <033fe56b-3f07-4fa7-98a1-84ad53034ace@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <033fe56b-3f07-4fa7-98a1-84ad53034ace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/04/2025 18:08, Péter Ujfalusi wrote:
> 
> 
> On 4/4/25 3:21 PM, Krzysztof Kozlowski wrote:
>> Enabling the compile test should not cause automatic enabling of all
>> drivers.
> 
> The scope of compile test has changed?

No, it's the same.

> These drivers will likely not going to be compile tested from now on in

Why? They are. That's why allyesconfig you have.

> practice on other that the platforms they are used?
> 
> It gave a piece of mind to know that the code compiles on ppc/x86/etc
> also or it is no longer important sanity check?

And nothing changes here. They will be compile tested on all these other
archs the same as all other arch/soc specific drivers, which do exactly
what I am doing here.

Best regards,
Krzysztof
