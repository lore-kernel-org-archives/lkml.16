Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F386245019
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 07:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744614974; cv=none; b=B6ZGE6ufw7ZWQkHY9XNGcmP/bI9BBmGAqNRut57hIzGSOEBxFnWwUIP+9J0dc2tnBHqzVcGKhO6g/HvatcdRTg6k21x0R4/gh4Vd+GzMSt4mzcu5h6H0KcpAX6qvgtBQnivMXyfJDNpVgNZDVmVNpodUztzurKwrWTqE9O+grKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744614974; c=relaxed/simple;
	bh=WK4NCloQDa0S4cRk3/OQggqH9gl0NPLMNlI5ytZg4G4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=qMnSSyZAINlzaPteyJPZd4b3rTvG3F6hrEA5eU6UQFXM46tRcjcH/p1wm7GQCOhzWGL06AtGjOBljsi6VVn4mGKBDW00Dxo0nLgEAaXISWqo3Afvp1R4rC3lYsqYKD2b4AWqFX52CRaw4FSpKQAq/xm0Y+W+0xqnKjVHi6pDKxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yEY+oDyM; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yEY+oDyM"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39c30d9085aso2308945f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 00:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744614971; x=1745219771; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A4BBxO2Q/J6IMxfz+uEtm4Q1azghcdwE0iVwsVnnKvk=;
        b=yEY+oDyMCLlRp6ZJB9Tqsjsor6XXTOn6bRoowgIC39c/kjAil0UWnDRG3hfNTx2q4i
         gxK33yBiRoVpS6q8JTD+ClHRUVGtmOigPL1PP3u7aEp7Onad1d3+tII8aJ1f/Yy8jyQ2
         VJ+uqCkLSvC/jl+3oYO7XfvtWoEGWzaG/FHx7qebuClNHWbp/IMf3CetGCKO8Zdfqb0u
         aW4js7aMLrY/xHJOEis4LgkcLRAG8uWQyJIiGbgJC1dqFLDXGZQjmTM+4qRw/RAhfbAE
         UeKpL8me/jdNm00mmCMmvC97Ia1zrALfZ3Oo2XvyCCNMgZWqbRUtl4EsQNMDuwOFf8NH
         Oz9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744614971; x=1745219771;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A4BBxO2Q/J6IMxfz+uEtm4Q1azghcdwE0iVwsVnnKvk=;
        b=Ll5GQycPAuZlR49KgUQxJXMIQvFqyqC/5k8d9zBY0TDUOpJqBVADVGvwo/WDW82mM0
         pvMnN8qNvZWd6xn/aTlnwFv9wPks33KDhxtn4UK8TW92wLISM5gQmPb0eATy98SGDmW8
         Hu1/K0Sr4kzIEhR1e8mVHzkbZizrszOqChU2ZvKKwOVkZTnmbz+xTT/bDprunp5WI3gz
         nSP788k0k670b9eKuZfwHlV+NeK16uwAp18gYzjYsrpGrl8aUqOlJI3xftNmUym4qr0P
         emUTtcqAQTQ9ji6DYWD3Dj+zj28za4YceQEhRqvg919GkOJF4+VuJNuObNhlDsBDyR6S
         d39A==
X-Forwarded-Encrypted: i=1; AJvYcCUpTOXO087UcpX/QtSgvTFTOPrtGH1n7kxNxD9wA13mvX1cs1zYOzroGsi4wHUIeNsLxGQynMUEBdOioJg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTjlMMP7249IUgxJlzUYarY77T3TOcy31qLcraOF2SP9iU5im7
	0OIGJFCCT52WCWVbCGZrvVFcS9mkRPHt3hmDM8qWb5t2MfBXkN7YnhpfJmG3qiQ=
X-Gm-Gg: ASbGncvNKSm8Ql4XhHVQHPM3VdhCCitnCSijsJ5tkce1YI813hvYg49gMt3mewyj0wv
	9LhYmxLLsOZzCnvN6MSpV2Za2/zTD6OIo3eoFMBtq2CNWczxD67Mtv/1OTlnfrKTXqIpyFBFWkc
	O5JIBXTd/a/oYSL5ddbHFRMXg4ZEOdjM1UTccYrkR1JfNL7jAigc3azgGh72MH7pNuTJwZNaw4w
	mRRTZFCF5ivVqXM6FwiM0CL6TNspVqOgT+U1Ks7t/yXuliBArqfG1V7wAzsPs7UsCrE0aXElimA
	A4JtPN7sb1CY7FP40+6x6bz0MaSfDSeEyOoSBS6BZF6uo2ix9BPWLRq84/RrHsTJboxBsZ4V311
	jdSc3Ytzkfd6gYLDLdQ==
X-Google-Smtp-Source: AGHT+IFk/4b/d6EUYjjExv4IiKLoJZUz+hd9IYDUnYI9Yd0PRlZMBINesye58HTjAx7nVixJNpR1PA==
X-Received: by 2002:a05:6000:144e:b0:39c:1f11:ead with SMTP id ffacd0b85a97d-39ea5213077mr9016322f8f.26.1744614970477;
        Mon, 14 Apr 2025 00:16:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:bf8a:3473:5c13:9743? ([2a01:e0a:3d9:2080:bf8a:3473:5c13:9743])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96c614sm10221879f8f.27.2025.04.14.00.16.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 00:16:10 -0700 (PDT)
Message-ID: <576f0726-d238-4c37-8dc2-481df67f8fec@linaro.org>
Date: Mon, 14 Apr 2025 09:16:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] spi: meson-spicc: add DMA support
To: Da Xue <da@lessconfused.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Mark Brown <broonie@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Sunny Luo <sunny.luo@amlogic.com>
References: <20250408-spi-dma-v1-1-3c38be62c09c@amlogic.com>
 <c29a8c28-996c-4e94-b0a1-0e4a37f0bebb@linaro.org>
 <aebccc51-14a2-40be-8d9e-20a55ce94459@amlogic.com>
 <d9d81cb4-12b4-4db3-becb-4578548986b2@linaro.org>
 <c9f0ca5f-17c4-474f-8370-fc0c83ac9093@amlogic.com>
 <CACdvmAg5px00er9TUd6_Nhr1GoSf=6LK6vSWOB-YcC1Ve0NRQQ@mail.gmail.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <CACdvmAg5px00er9TUd6_Nhr1GoSf=6LK6vSWOB-YcC1Ve0NRQQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 14/04/2025 05:56, Da Xue wrote:
> On Sun, Apr 13, 2025 at 11:14 PM Xianwei Zhao <xianwei.zhao@amlogic.com> wrote:
>>
>> Hi Neil,
>>      Thanks for your reply.
>>
>> On 2025/4/9 20:35, neil.armstrong@linaro.org wrote:
>>>
>>> Hi,
>>>
>>> On 09/04/2025 03:49, Xianwei Zhao wrote:
>>>> Hi Neil,
>>>>      Thanks for your reply.
>>>>
>>>> On 2025/4/8 15:41, Neil Armstrong wrote:
>>>>> [ EXTERNAL EMAIL ]
>>>>>
>>>>> Hi,
>>>>>
>>>>> On 08/04/2025 09:04, Xianwei Zhao via B4 Relay wrote:
>>>>>> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>>>>>
>>>>>> Add DMA support for spicc driver.
>>>>>>
>>>>>> DMA works if the transfer meets the following conditions:
>>>>>> 1. 64 bits per word;
>>>>>> 2. The transfer length must be multiples of the dma_burst_len,
>>>>>>      and the dma_burst_len should be one of 8,7...2,
>>>>>>      otherwise, it will be split into several SPI bursts.
>>>>>>
>>>>>> Signed-off-by: Sunny Luo <sunny.luo@amlogic.com>
>>>>>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>>>>> ---
>>>>>>    drivers/spi/spi-meson-spicc.c | 243
>>>>>> ++++++++++++++++++++++++++++++++++++++++--
>>>>>>    1 file changed, 232 insertions(+), 11 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/spi/spi-meson-spicc.c
>>>>>> b/drivers/spi/spi-meson-spicc.c
>>>>>> index df74ad5060f8..81e263bceba9 100644
>>>>>> --- a/drivers/spi/spi-meson-spicc.c
>>>>>> +++ b/drivers/spi/spi-meson-spicc.c
>>>>>> @@ -21,6 +21,7 @@
>>>>>>    #include <linux/interrupt.h>
>>>>>>    #include <linux/reset.h>
>>>>>>    #include <linux/pinctrl/consumer.h>
>>>>>> +#include <linux/dma-mapping.h>
>>>>>>
>>>>>>    /*
>>>>>>     * The Meson SPICC controller could support DMA based transfers,
>>>>>> but is not
>>>>>> @@ -33,6 +34,20 @@
>>>>>>     * - CS management is dumb, and goes UP between every burst, so is
>>>>>> really a
>>>>>>     *   "Data Valid" signal than a Chip Select, GPIO link should be
>>>>>> used instead
>>>>>>     *   to have a CS go down over the full transfer
>>>>>> + *
>>>>>> + * DMA achieves a transfer with one or more SPI bursts, each SPI
>>>>>> burst is made
>>>>>> + * up of one or more DMA bursts. The DMA burst implementation
>>>>>> mechanism is,
>>>>>> + * For TX, when the number of words in TXFIFO is less than the preset
>>>>>> + * reading threshold, SPICC starts a reading DMA burst, which reads
>>>>>> the preset
>>>>>> + * number of words from TX buffer, then writes them into TXFIFO.
>>>>>> + * For RX, when the number of words in RXFIFO is greater than the
>>>>>> preset
>>>>>> + * writing threshold, SPICC starts a writing request burst, which
>>>>>> reads the
>>>>>> + * preset number of words from RXFIFO, then write them into RX buffer.
>>>>>> + * DMA works if the transfer meets the following conditions,
>>>>>> + * - 64 bits per word
>>>>>> + * - The transfer length in word must be multiples of the
>>>>>> dma_burst_len, and
>>>>>> + *   the dma_burst_len should be one of 8,7...2, otherwise, it will
>>>>>> be split
>>>>>> + *   into several SPI bursts by this driver
>>>>>
>>>>> Fine, but then also rephrase the previous paragraph since you're
>>>>> adding DMA.
>>>>>
>>>> Will do.
>>>>
>>>>> Could you precise on which platform you tested the DMA ?
>>>>>
>>>>
>>>> aq222(S4)
>>>
>>> Will you be able to test on other platforms ?
>>>
>>
>> I tested it on other platforms over the last few days. G12A and C3 and
>> T7(T7 CLOCK use local source).
>>
>> My board SPI does not connect peripherals and is tested through a
>> hardware loop.
> 
> I can test it on GXL and SM1 in the next two weeks against a SPI
> display and some WS2812B LCDs.

Would be great, thx !

Neil

> 
>> cmd:
>> spi_test -D /dev/spidev0.0 -v -s 5000000 -b 64 -l
>>
>>>>
>>>>>>     */
>>>>>>
<snip>

