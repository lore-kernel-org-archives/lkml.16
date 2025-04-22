Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1942836B5
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 13:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745329760; cv=none; b=k9FON5f0lvwqKuIlKsrmB4wc4p4cVlQXxw8e6Cc88J4JaTlMHIXnhlhGXK5TRMrBGYfjEQB8Tch+k7nPRft6DieLAhTPPyCr1Y2WxBFRuYBOMNdMd33m540GWUsuVRLEDKcpSIeMHka5dcDy1W99TGMP6K+zUHTIXhDx85ZZ80g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745329760; c=relaxed/simple;
	bh=6LAOyOKsq6KjJbHiLaRQ4qy5m8NlKfV4KvLHm3Geq7I=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=DGKo9Zua58ME/orkHoupNvvstTZUOu5WLVWBKQzWV6U76b9U2xam2BttFIeLZcFdjfXWvSmZkihmP7+mjonJqN3DV5KtzN/uHq0ETHyAnSPGqjU/afNZkK4Bwxz/R9yldecIwLGvbFhg+7xfEKD5lIcM2PQbn/mqak2lCYsSp58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lR49Th2T; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lR49Th2T"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso61189715e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 06:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745329757; x=1745934557; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TkK06OXmdpQerGRdYcgxg4UxOZ4GGpRC6XzJ6XPJVwE=;
        b=lR49Th2T+1NJ2B/An95smciEOpPIHgsIXjxX5MV5bqqwwIo4JlM3bPbgwROdzBLIYd
         CkB25yfh7jR7dHboQoovoDrHh+Ec4w+WmpPpdfxeuZ4lK1CaqNq3RPkcxt1ubk1wv3J9
         JeP2XcUKFn3YwooAG12aXPI72zlU1Fm3PSXPU9MDli7sll3VB4yOyRgXGHK5RbyyWJlz
         eSwreLigBXMiQA/M19zlawz5aQIoYg9BRJdNOcRx9nEW+iYUk/AdtlcJK3XIYubx0CDA
         0NRbHh+tDTSHN3L4WMHwS33EGlSUEMIKhd01CmHDRsIzxnofu3iiSaWhpo3mBRcVWFmG
         to5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745329757; x=1745934557;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TkK06OXmdpQerGRdYcgxg4UxOZ4GGpRC6XzJ6XPJVwE=;
        b=Sch644sva72dWQiuLsYloEshTSMytDnpGPCFLNAVfqJ7b5CT8XDxzS9YgBLLdKKUxx
         Im5A7sM2nGf8L723NvA05yYIGhUJ7/7PZTdq7xVYJxCuAd4w5vOf/qffuqgWdelKjMds
         gC9c8DSjETbzGkD0SZi8TgwRvVT3DV2VQY+zoztPCdDM3QOaRgooBxlVwSc5KzGPOvPz
         N7wXnNWBOG/LzqT9rb+H7Ru1vZh+cBYqQ7QPvJVMtPqJbpSCaWQnJdtxCh7ejDdlJCEO
         JjEV3VRhjPNDa+LLjG1r4zjOwzHai1SO0KTnF1LYKIlkPd7iiH9CtmDx9p+gEfw8KGg4
         1uSA==
X-Forwarded-Encrypted: i=1; AJvYcCUkLDxW4l+HlzvXEPVDYTvZZ59GLkG0uQE8700d/lBaJUDG5sLYpPKA4d8cst+OYPA9QvOHdVblsweyTKg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNzGx++5y7rVgbPJKE5MIbhDdnpA0PGWEFOt0UcI5stCmPWXCR
	6Xwi4C4V4jdnexoHt8yikwCd8adeUnV9kIz7GZBX+0TxDiIzGToS8FjOxrFT/sc=
X-Gm-Gg: ASbGncvDryqjAuSpPv6ECjzTFRflY2xNIHc1tkWfyehpv2PvBwe+wiFUHb0TeS6y6cr
	Yc6C8K/YogR9roWn65v6LecuZLOw65I+EdA/h1h5/i/nmlTgvhYjF6U8jL8JCxny+Wi6756IgM4
	lniOsfz8FWDhTXf9yAcYNxInAzXM867/aUUSswnOamXXqJfdWyrK1zroAXOiIfMiWZewHXZwuWA
	Y4iio8zzbY3hbRFREktZZiLN7pRmAkI31ZoUkV9KdzQRB50W5QAmL5WYCSlu4qxpeXFmPk8oDIc
	W69lpxJL315Itwddptt0S+mCy1ozHT2x2DDez5TI9d32T6DsY7S3sJC+VF2u7RYFZ5IbA33WKOa
	/Febv/BUFLnnDV3orfA==
X-Google-Smtp-Source: AGHT+IHdFpY2t7FI/be0EqJz9t7HFlCCvc06lK5PIsjhFFst91bNUJ0oXsSvGUrxZ85zoDSQF25lnA==
X-Received: by 2002:a05:600c:1d06:b0:43d:aed:f7de with SMTP id 5b1f17b1804b1-44075dd6aedmr71755055e9.21.1745329757107;
        Tue, 22 Apr 2025 06:49:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b137:7670:8eb9:746f? ([2a01:e0a:3d9:2080:b137:7670:8eb9:746f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa433429sm15455640f8f.37.2025.04.22.06.49.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 06:49:16 -0700 (PDT)
Message-ID: <e3229c42-b322-447a-ad1e-86c6f20dd54e@linaro.org>
Date: Tue, 22 Apr 2025 15:49:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 0/7] Baisc devicetree support for Amlogic S6 S7 and S7D
To: Xianwei Zhao <xianwei.zhao@amlogic.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20250317-s6-s7-basic-v1-0-d653384e41f3@amlogic.com>
 <a175ed1d-9e57-4150-af8f-7ca785203108@amlogic.com>
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
In-Reply-To: <a175ed1d-9e57-4150-af8f-7ca785203108@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 22/04/2025 13:45, Xianwei Zhao wrote:
> Hi Neil,
>     A gentle ping, thanks.

I'll apply them this week except patch 4,

so can you send patch 4 separately since it goes via the tty tree ?

Thanks,
Neil

> 
> On 2025/3/17 15:16, Xianwei Zhao via B4 Relay wrote:
>> [ EXTERNAL EMAIL ]
>>
>> Amlogic S6 S7 and S7D are application processors designed for
>> hybrid OTT/IP Set Top Box and high-end media box applications.
>>
>> Add the new S6 SoC/board device tree bindings.
>> Add the new S7 SoC/board device tree bindings.
>> Add the new S7D SoC/board device tree bindings.
>>
>> Add basic support for the S6 based Amlogic BL209 board, which describes
>> the following components: CPU, GIC, IRQ, Timer and UART. These are capable of
>> booting up into the serial console.
>>
>> Add basic support for the S7 based Amlogic BP201 board, which describes
>> the following components: CPU, GIC, IRQ, Timer and UART. These are capable of
>> booting up into the serial console.
>>
>> Add basic support for the S7D based Amlogic BM202 board, which describes
>> the following components: CPU, GIC, IRQ, Timer and UART. These are capable of
>> booting up into the serial console.
>>
>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>> ---
>> Xianwei Zhao (7):
>>        dt-bindings: arm: amlogic: add S6 support
>>        dt-bindings: arm: amlogic: add S7 support
>>        dt-bindings: arm: amlogic: add S7D support
>>        dt-bindings: serial: amlogic,meson-uart: Add compatible string for S6/S7/S7D
>>        arm64: dts: add support for S6 based Amlogic BL209
>>        arm64: dts: add support for S7 based Amlogic BP201
>>        arm64: dts: add support for S7D based Amlogic BM202
>>
>>   Documentation/devicetree/bindings/arm/amlogic.yaml | 18 ++++
>>   .../bindings/serial/amlogic,meson-uart.yaml        |  3 +
>>   arch/arm64/boot/dts/amlogic/Makefile               |  3 +
>>   .../boot/dts/amlogic/amlogic-s6-s905x5-bl209.dts   | 42 +++++++++
>>   arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi        | 97 +++++++++++++++++++++
>>   .../boot/dts/amlogic/amlogic-s7-s805x3-bp201.dts   | 41 +++++++++
>>   arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi        | 99 ++++++++++++++++++++++
>>   .../boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dts | 41 +++++++++
>>   arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi       | 99 ++++++++++++++++++++++
>>   9 files changed, 443 insertions(+)
>> ---
>> base-commit: 73e4ffb27bb8a093d557bb2dac1a271474cca99c
>> change-id: 20250221-s6-s7-basic-f300c30877e6
>>
>> Best regards,
>> -- 
>> Xianwei Zhao <xianwei.zhao@amlogic.com>
>>
>>

