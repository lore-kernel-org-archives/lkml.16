Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F58770FE
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747939013; cv=none; b=KHYZIAjVy5wY3Js268QajJQT7Kv/7gZZByGGN4njRNATDvT3TLBVvV3Ref1folPCtaKAziCLDSwq40gwf2Ado2jZA6JUA+LVbH42FyoGzqJB3TcPBnVZRBQuURSFUmariHq24EndHMngIRMMGxeJr8U0v537swgiC0lVH65aJTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747939013; c=relaxed/simple;
	bh=r2LJRwJfk5HQfOY1MfeFn7U5D6uIM9YRcshMS9LAyXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=JN9U6N9PTfLXDDgzNX2RwsrA24DrN4Y4JXjPMNK+HIHe5aaYyQEErxE+afONNuRdqCkDgriBCUmRjbyqYPJIi7JUWzyZi5ojrbnMNnzw+2ARVuVwKgZbizelWtkPecYIoEf59KuQSgt3u5a28T3FxQUbudX97yv9lIla5R+FNSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ynp51Emq; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ynp51Emq"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a362e099cfso992595f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 11:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747939009; x=1748543809; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RJGS5GdAP2jwMN2asFwop/bmwWDSIqO/lnl06Fno7WE=;
        b=ynp51Emq3Sz7WihnFRiS8jgSbdB9ZHFA6LAn0KXX6vjoX+Etc73olrQIWeEzIuD8IB
         gKaGwAEaW9psSOBtT96NyvNRRaQcJ+Bvs8rYh4kR+B21iqkK0DZXRznJc+kV89pirUgb
         D8tLRICQIs1FsgIlv3zAg89eXYRdX2fwt09up2jnorFJYRm8EOSk6CC3D4ZYYOYlwJuz
         17SH1C4OK4Oq4j8N1Q7wUjZHzyOQHYZ0xLNVlBPq0CddX+IgNuR4gNkJU6O0lWBNSWXr
         9jWN/5da0eNdPndLKy2Wg5xTnGnkcibBK8JYLQUs3rV+6cYF/VGZr1yRTju0uVjqtHgT
         SwNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747939009; x=1748543809;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RJGS5GdAP2jwMN2asFwop/bmwWDSIqO/lnl06Fno7WE=;
        b=W+cNX4k1Bmc6VzcZyav4OV7g5u9tJ96faO1ZYM5ieyJ30aKEmvG5px9VLDM7Dp4NLx
         G/NXxejpyovxy4IewvT7H8bZt9ULtdsdcD/zMO3IycnxrNwo38PJn12nOk+WDEtFdKav
         9+AT2hZwSlOfvALyGswBl/SnyEu4xhvz75iq8MRBhBe5CQUUeSfbxULPEfykDY65T1+2
         0/U4RHjelmO6RUJvYqpbUjlIK92VJJP2CZksiT/Baqu5t0ymuEO5VYAW4gFYaGwvZju2
         0j0NuYpxmrxoxGRzztEL2lH0Vx/Wtmf84nAIP17Pqscj4KEWcNC0U8C+ok1E37yrTE5v
         omZA==
X-Forwarded-Encrypted: i=1; AJvYcCUdkmXKEx/QXr521YwpxjpYQXR+uPALDuxC3CHv2eB9ImGsBdejOXonNUdkmBvvebTRUxJXTgq/ygpvdmY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqqVxM00XkZ5UkkurA1Rbqa7Xm9Yc7cqKTwotWllp41zur4QEu
	E3qc7W53RTfHNin9FDr1jC/PIYNMzKp26EMioRm1iLhP5UJtY6kYZ0AeJu2xhuwD/9A=
X-Gm-Gg: ASbGncut0g6B2asoWEKj3E9IXqvdpvshOVroTPkUQXcJTfAZYMSZ5IGLBi9IJ6A26mv
	bG/j+0vMO4vZtuT4BUBpOTxXPI6WWUxItXLskqZafEJNJGxTLlinQoOThjVUvyYbi+5MF9sgBKv
	QOVQe713zNGhHpCt44shyT6SVp/oVY2I51jb32Jec+xl+h4xptxb396nSDaxyjh/UxQYn4OdOVD
	Uv7SJonHPXAZ9ioyonw9RQzE6YmA29kJWJUkebaP3T8pFLp8qtohDufEXjAcq39CJkB0UqkGDGn
	bxpKODi0qCDQwBzEmPj3zaH1Imvba9l2avaU2z2E8HMAXQnIxT0oGfFe6DIn8mqzzfVWbLY=
X-Google-Smtp-Source: AGHT+IHR+WLXCmN0YpGsXVAMyTrf5qwUXOqpxWzDyNHvcgpM8sHVsTuYa3Mt6GIgso9ohbfhoLilLw==
X-Received: by 2002:a5d:5f47:0:b0:3a3:6a3d:163a with SMTP id ffacd0b85a97d-3a36a3d18b3mr7521239f8f.12.1747939009584;
        Thu, 22 May 2025 11:36:49 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f6b295fdsm120822505e9.5.2025.05.22.11.36.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 11:36:48 -0700 (PDT)
Message-ID: <3cf3f029-f56c-4ea7-a10d-ece09fdbb2b0@linaro.org>
Date: Thu, 22 May 2025 20:36:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] watchdog: stm32: Fix wakeup source leaks on device
 unbind
To: Guenter Roeck <linux@roeck-us.net>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20250406203531.61322-1-krzysztof.kozlowski@linaro.org>
 <f1dc5228-ac91-47c3-a854-b425cb77bb5f@roeck-us.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTRLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+wsGUBBMBCgA+AhsD
 BQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEEm9B+DgxR+NWWd7dUG5NDfTtBYpsFAmgXUEoF
 CRaWdJoACgkQG5NDfTtBYpudig/+Inb3Kjx1B7w2IpPKmpCT20QQQstx14Wi+rh2FcnV6+/9
 tyHtYwdirraBGGerrNY1c14MX0Tsmzqu9NyZ43heQB2uJuQb35rmI4dn1G+ZH0BD7cwR+M9m
 lSV9YlF7z3Ycz2zHjxL1QXBVvwJRyE0sCIoe+0O9AW9Xj8L/dmvmRfDdtRhYVGyU7fze+lsH
 1pXaq9fdef8QsAETCg5q0zxD+VS+OoZFx4ZtFqvzmhCs0eFvM7gNqiyczeVGUciVlO3+1ZUn
 eqQnxTXnqfJHptZTtK05uXGBwxjTHJrlSKnDslhZNkzv4JfTQhmERyx8BPHDkzpuPjfZ5Jp3
 INcYsxgttyeDS4prv+XWlT7DUjIzcKih0tFDoW5/k6OZeFPba5PATHO78rcWFcduN8xB23B4
 WFQAt5jpsP7/ngKQR9drMXfQGcEmqBq+aoVHobwOfEJTErdku05zjFmm1VnD55CzFJvG7Ll9
 OsRfZD/1MKbl0k39NiRuf8IYFOxVCKrMSgnqED1eacLgj3AWnmfPlyB3Xka0FimVu5Q7r1H/
 9CCfHiOjjPsTAjE+Woh+/8Q0IyHzr+2sCe4g9w2tlsMQJhixykXC1KvzqMdUYKuE00CT+wdK
 nXj0hlNnThRfcA9VPYzKlx3W6GLlyB6umd6WBGGKyiOmOcPqUK3GIvnLzfTXR5DOwU0EVUNc
 NAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDyfv4dEKuCqeh0
 hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOGmLPRIBkXHqJY
 oHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6H79LIsiYqf92
 H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4argt4e+jum3Nwt
 yupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8nO2N5OsFJOcd
 5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFFknCmLpowhct9
 5ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz7fMkcaZU+ok/
 +HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgNyxBZepj41oVq
 FPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMip+12jgw4mGjy
 5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYCGwwWIQSb0H4O
 DFH41ZZ3t1Qbk0N9O0FimwUCaBdQXwUJFpZbKgAKCRAbk0N9O0Fim07TD/92Vcmzn/jaEBcq
 yT48ODfDIQVvg2nIDW+qbHtJ8DOT0d/qVbBTU7oBuo0xuHo+MTBp0pSTWbThLsSN1AuyP8wF
 KChC0JPcwOZZRS0dl3lFgg+c+rdZUHjsa247r+7fvm2zGG1/u+33lBJgnAIH5lSCjhP4VXiG
 q5ngCxGRuBq+0jNCKyAOC/vq2cS/dgdXwmf2aL8G7QVREX7mSl0x+CjWyrpFc1D/9NV/zIWB
 G1NR1fFb+oeOVhRGubYfiS62htUQjGLK7qbTmrd715kH9Noww1U5HH7WQzePt/SvC0RhQXNj
 XKBB+lwwM+XulFigmMF1KybRm7MNoLBrGDa3yGpAkHMkJ7NM4iSMdSxYAr60RtThnhKc2kLI
 zd8GqyBh0nGPIL+1ZVMBDXw1Eu0/Du0rWt1zAKXQYVAfBLCTmkOnPU0fjR7qVT41xdJ6KqQM
 NGQeV+0o9X91X6VBeK6Na3zt5y4eWkve65DRlk1aoeBmhAteioLZlXkqu0pZv+PKIVf+zFKu
 h0At/TN/618e/QVlZPbMeNSp3S3ieMP9Q6y4gw5CfgiDRJ2K9g99m6Rvlx1qwom6QbU06ltb
 vJE2K9oKd9nPp1NrBfBdEhX8oOwdCLJXEq83vdtOEqE42RxfYta4P3by0BHpcwzYbmi/Et7T
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <f1dc5228-ac91-47c3-a854-b425cb77bb5f@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/04/2025 23:17, Guenter Roeck wrote:
> On 4/6/25 13:35, Krzysztof Kozlowski wrote:
>> Device can be unbound or probe can fail, so driver must also release
>> memory for the wakeup source.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 


This was almost two months ago, got review but still did not reach
linux-next. What is needed for this patchset?

Best regards,
Krzysztof
