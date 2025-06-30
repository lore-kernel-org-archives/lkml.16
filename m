Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C72243169
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 12:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751288089; cv=none; b=qiJqsqbJ9ZvD+4tqG7ZvW43djhu8mh6cM41awEMiRjxj2x0yKxhTqA2Sfzrd2dYDMTBuMf3UQVQaWcxeahs/JvTYQk7hu336CCjfWWlJaXHmmeUwRVNXwEeiOHz8vlnATcLYVAUwEqLA55W3Yo9+IV+PQ/0ALQPi8d0du6W7X1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751288089; c=relaxed/simple;
	bh=dFUfA59cZPhURFeCuho8nEpvNW1tRPC7vIft9cBn9oA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J8EDhpfaxJIVuwqZWkT93Tt+MvN4boi+DHI/BC+bjpqP+FyJRMSdR9aVNhML4CSL33CP8/zKAc750utEjHQlBNXu1JOG67N5it7bs1Bbc2RaNtiKBnYr/eDuQ7M0MVYIKO0fwLcVXmUZqvO7UibDzY5WPIbFFHqY+MmThXnojyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R+73O+uH; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R+73O+uH"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a6cd1a6fecso4710220f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 05:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751288085; x=1751892885; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q6LLhW0l1DwH7atSswhul01kdjels/mjiCnzYleUxWc=;
        b=R+73O+uHqcbAp5zK871JbSGR5idK+6Fw1kZbydJbrvh51xZW+IfTonrgCMQWPPAz+R
         dOQB08F4cjT8Y505YGGIFHAa1LAxXbjxmVym1C0/7mQC3xT18eaT4gMklU7fhxCI3kAz
         vH0ZMpQ7/i6HRkVk2PgXmmGoox9/khzGoSO/LG9G9tsNQglMCSjogpHf4jmnAAnNam3N
         tdadz6ilBd+goYmphFQA3jqKaDhKbF0eENBxiOOLZOZSk9nnTUIFyt/znUznkJ3xVYng
         yT2qUrVcaLnJIw4gQKep24ItxO6tKI4JHEt4AEdfupegANLOJbPcTWfMWNBx98IBpNpQ
         Vy3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288085; x=1751892885;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q6LLhW0l1DwH7atSswhul01kdjels/mjiCnzYleUxWc=;
        b=k96L+yv+2JhyXqYTiOEUBdDGPI5BMhWOYAHCmGLqHHG8j5LQwfOkwGHJ+WSkkOg49G
         mGaixNCuUdwq30HUY7Bx8w4s46R1nkS21xFWdJQkVnXKDkbkE1smGRTg9mHP7JGqb/GP
         kuk+IO3nnXUM/YNXW1YTLYyeebxqO4AyKNhJ+0uR6RNLcLIsccEaMeAZjzfwlHK0+BkK
         MkObH6p3ws4eAs8SuB5TDFBXn9YZwMDZJ7CJZCF+vyQkRhACyaYOzSjfCgdnnMvKzW3C
         365RwYBkyi2xrG7xTFOVthy6WdMSvY7ewfLmHRRL/kCn1i9ckwre332PFchURHr3Kq0y
         8KfA==
X-Forwarded-Encrypted: i=1; AJvYcCXFYncKNOMtRbnGuknfOMLzxqODld7SbSvnm/w9ETYzunWYe6fb/dIBMwWu7oxDB0KsP2dXMZYCj4gUL6k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLHIzweRFzkRpwz5S9yomRfcCQRez/UYrznyN93yq0oOuXTKTV
	xFQusEWRRYjwRU9GOTGXKM/UimVKPwLKj+qdKeUzR4SE8DWeIxQFdz/fLexQLNCqufI=
X-Gm-Gg: ASbGnctxu0vDVCJU+Msh2Sz2aA01VtqSrxQyYUqaGXqqN3v8y9lRZj7MRnmaHUgngeb
	m1M4pu9xfNmeBDpPl0r3HplGbwmxWDb3VVI8XdmmhlMcd59pnxpudNJwrpMjOzWxjaC88WiWjsL
	8Wp6BclF00eMpR1bugnDdzeBeTfwPacjLxzfDbvjkP8I0Iy/niHZUa33J+w+wNX41vq/+UKseQV
	DyB8TS0vqz++xF8XyYvZ1ocYbPEkcAjOj38AlQ7Vm/T3BVkGaNWmmg37Mqrkj/h43UESguBn3KO
	L4dzX7gQhPcnwon/ps8j/pPpabBOxCOtir8rx+v/3vbe3wsRd3L8oo1cKXSMaD7jghw=
X-Google-Smtp-Source: AGHT+IEOf3lWnYoS17T+S9usuCMf7ZAOx76NQaH3qOvK0doAAUlbSt9hmIVQE6Nph3hAnN/TUv8l9g==
X-Received: by 2002:adf:fdca:0:b0:3a4:e4ee:4c7b with SMTP id ffacd0b85a97d-3a90d5a7cfemr10289035f8f.15.1751288084621;
        Mon, 30 Jun 2025 05:54:44 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453888886ddsm95050155e9.0.2025.06.30.05.54.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 05:54:44 -0700 (PDT)
Message-ID: <e7a7dbc6-c423-44e0-95c0-5b3323f83c8b@linaro.org>
Date: Mon, 30 Jun 2025 13:54:43 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] spi: spi-fsl-dspi: Target mode improvements
To: Mark Brown <broonie@kernel.org>
Cc: Vladimir Oltean <olteanv@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, linux-spi@vger.kernel.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Larisa Grigore <larisa.grigore@nxp.com>
References: <20250609-james-nxp-spi-dma-v1-0-2b831e714be2@linaro.org>
 <175128365072.28911.16806664823646528710.b4-ty@kernel.org>
 <9f707fd9-a9f0-45d3-aaec-e20bad4c4f76@linaro.org>
 <e5dabc83-eb1c-46eb-b24e-6dc8b19c4ff7@sirena.org.uk>
 <d86c48f4-fa10-4205-b0de-43fc8be0c848@linaro.org>
 <a164abb4-0863-4a0b-b2f5-f7c1b36e408b@sirena.org.uk>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <a164abb4-0863-4a0b-b2f5-f7c1b36e408b@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 30/06/2025 1:40 pm, Mark Brown wrote:
> On Mon, Jun 30, 2025 at 01:36:17PM +0100, James Clark wrote:
> 
>> I was a bit confused to see this notification on both V1 and V4. Maybe an
>> artifact of the first commit that was applied being the same?
> 
> The tooling remembers if I ever downloaded any of the versions and
> didn't explicitly delete them, if it sees a patch that it remembers
> it'll report that it was applied.

Got it, thanks

