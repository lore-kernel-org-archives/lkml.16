Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FBA267AF3
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 07:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745392998; cv=none; b=Q2QwDlVYUnp2lO6DjHoVGO76Umzzc5Xxm0Rx3t69CGXEzY+CfrYqvRDRVCd8K5UZONNudVJcYJrEN6BXBpjQ6oOalknWb/PKjX79+iSkt/WbWQAdwPkzGRufuW1mIdrOGShWR8IIoqK9+QGm3wWjDoBWo3G6Hg8xAYdSDowdVB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745392998; c=relaxed/simple;
	bh=Tbr2Q90DvfOtSGXfzrp3mJhdDmZv07AsT8h8G2q3gw4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=keIsFWOiwzrGitZM3QLTsiLj0yiUX7djMUrk2buXFI/pNlGJZhr8cD2yIHg9x0ybwXJsHo7/99Khjs08FDLK6Q15xierZta2dTXhvNQMzcCRUV+yA/TQdh1sjVeupC2ofqVGsNbTzDaiyCXIZFIynNjfiMBOS/ChtB8H/+N5BWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RWs6N5gw; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RWs6N5gw"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so33762705e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 00:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745392994; x=1745997794; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WB0RCfrpm6KO0azBMBNT3gQRNEul5d5cuD4mn3Ij+n8=;
        b=RWs6N5gwxNgu5fYaYYTWtFuLsIi5MuuXBUlM3dbKTM8z0RvoVBOX07Qj40hrZ8X7cC
         xuwZ00pkQEDbHOXC8oIXO2/pQlkWXf8M0CPLoa72haoX2QbowU8W7tojbd9+L8tXIO6U
         V66hybfxxizMRC3gqRAlrVOFcF1nP6lc6VI+p/GbihVik10YbjFgN1TiqcaOdrkmD1KU
         MIjcHL+30acFyl7YuIKx9tRdEOXk/dm+M71+KIb3KrWFBnTcwMHMVmjBXi++wqXwt5sr
         ASROJdL9LKlfJ3j783XBRLno/c7jQzL0hujM0CZqyMEQtwZ0JeMDrXz0MgeywxWcAsGv
         k1VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392994; x=1745997794;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WB0RCfrpm6KO0azBMBNT3gQRNEul5d5cuD4mn3Ij+n8=;
        b=GmX/sVTa9GJ3QI1Sp1lT/QDAoKjiDtHkT1cBmugHOBVqa2jIZCKXQswY2dmIiMcZ0n
         hNfKs8OxzTK2Kt22MvEY9wBcMrmgNtygUVISzROrZbaHfJKVKaBG7PYK0JgqTkEtQWU+
         AWHGk9Lqvl4G1wt9jNZA+9/W1vYGBPoLqm5OKPDhNPVTBxghsOnlmhDVwzEeH9VXZ14C
         TSa4QI3uw3levXR2EA7vg3dzz9ju232jdoxegTlOVwCP/u88PJ3KfpTR69fVsQRtuLXy
         bDAnWVCzWa2n4wrjbW//R5j/sbVW7GkhjO/IeoEEpdJjUvgIadikGAEpFskEZcS34T1B
         Jlbg==
X-Forwarded-Encrypted: i=1; AJvYcCULxHJS9Rz3IdrspZsg+o/wyHx0dAIK35E4xgYb7Ww7pgSsmx/Le4X5l63Qg71Qo5bjNfdh473+9lPy0DU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPxRW6prNi5+tiEkR4gfYup0G+vU7L1lgNY4VuhYdekEGSlKbO
	CGITl+xWismMM1mfvkIPAiIVNpNZhGPFiMqRfUXCn5QoG9kNI+ToU+O8gKYHq8c=
X-Gm-Gg: ASbGncvVX/9q/ein6ZETzPTTxPvCzNxhdkAMZ8vcJjZhULh0Fpw1x+aj1Ah/NReZyJq
	tNBPomaLpDktP6AU9SdM7GnWNpKaWd1Ev6GHU5bPbnQVhh5aYSXKT9D1OU1qzdNQAaAwx8ExJfK
	hxES/FjRzZEj7y9nC46SmkSx38R5A/XWRU58rzgKu5Wj2LI5yBb+39wYnN9KGJmnq30E6AwIg8j
	NaUffrP2FFhwPoAWYokJVHsfc0R8fCg4H2keiqIxYIzXapYbcWdyQ8xlKyGyP5zR+axXK4ghRPj
	ExNZsKD5DBYQID9KBuYu3bRkdfHpRHomJ8HrZ9wIWhrUpuo/3gkrHXaKE3mOte6abePoW2PDgmE
	yl7UUWwnA8cPUEDUdMg==
X-Google-Smtp-Source: AGHT+IF7iRgKZdIR7ImIaoLwdAL0qVsjtbiBOb3c9EZ1TcpXaE3Utdm6WozDnJe6gph5La9PzewJlg==
X-Received: by 2002:a05:600c:350a:b0:440:66c5:26f4 with SMTP id 5b1f17b1804b1-4406ab703b8mr160055435e9.1.1745392993806;
        Wed, 23 Apr 2025 00:23:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:2835:c2f4:c226:77dd? ([2a01:e0a:3d9:2080:2835:c2f4:c226:77dd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44092d1709esm15163115e9.7.2025.04.23.00.23.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 00:23:13 -0700 (PDT)
Message-ID: <eb1c3442-6b86-42e9-a672-eaba7de8b375@linaro.org>
Date: Wed, 23 Apr 2025 09:23:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
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
 <e3229c42-b322-447a-ad1e-86c6f20dd54e@linaro.org>
 <be8b7874-1251-4ba8-9243-a615517861ab@amlogic.com>
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
In-Reply-To: <be8b7874-1251-4ba8-9243-a615517861ab@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 23/04/2025 08:15, Xianwei Zhao wrote:
> Hi Neil,
>     Thanks for your reply.
> 
> On 2025/4/22 21:49, Neil Armstrong wrote:
>> [ EXTERNAL EMAIL ]
>>
>> Hi,
>>
>> On 22/04/2025 13:45, Xianwei Zhao wrote:
>>> Hi Neil,
>>>     A gentle ping, thanks.
>>
>> I'll apply them this week except patch 4,
>>
>> so can you send patch 4 separately since it goes via the tty tree ?
>>
> 
> I will send patch 4 separately.
> The following patches(5 6 7) can be not included for now. Without the patch 4, the command "make ARCH=arm64 dtbs_check W=1" will fail to execute.

I know, but since it's reviewed, Greg KH will pick it for the next release so it's fine.

Neil

> 
>> Thanks,
>> Neil
>>
>>>
>>> On 2025/3/17 15:16, Xianwei Zhao via B4 Relay wrote:
>>>> [ EXTERNAL EMAIL ]
>>>>
>>>> Amlogic S6 S7 and S7D are application processors designed for
>>>> hybrid OTT/IP Set Top Box and high-end media box applications.
>>>>
>>>> Add the new S6 SoC/board device tree bindings.
>>>> Add the new S7 SoC/board device tree bindings.
>>>> Add the new S7D SoC/board device tree bindings.
>>>>
>>>> Add basic support for the S6 based Amlogic BL209 board, which describes
>>>> the following components: CPU, GIC, IRQ, Timer and UART. These are capable of
>>>> booting up into the serial console.
>>>>
>>>> Add basic support for the S7 based Amlogic BP201 board, which describes
>>>> the following components: CPU, GIC, IRQ, Timer and UART. These are capable of
>>>> booting up into the serial console.
>>>>
>>>> Add basic support for the S7D based Amlogic BM202 board, which describes
>>>> the following components: CPU, GIC, IRQ, Timer and UART. These are capable of
>>>> booting up into the serial console.
>>>>
>>>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>>> ---
>>>> Xianwei Zhao (7):
>>>>        dt-bindings: arm: amlogic: add S6 support
>>>>        dt-bindings: arm: amlogic: add S7 support
>>>>        dt-bindings: arm: amlogic: add S7D support
>>>>        dt-bindings: serial: amlogic,meson-uart: Add compatible string for S6/S7/S7D
>>>>        arm64: dts: add support for S6 based Amlogic BL209
>>>>        arm64: dts: add support for S7 based Amlogic BP201
>>>>        arm64: dts: add support for S7D based Amlogic BM202
>>>>
>>>>   Documentation/devicetree/bindings/arm/amlogic.yaml | 18 ++++
>>>>   .../bindings/serial/amlogic,meson-uart.yaml        |  3 +
>>>>   arch/arm64/boot/dts/amlogic/Makefile               |  3 +
>>>>   .../boot/dts/amlogic/amlogic-s6-s905x5-bl209.dts   | 42 +++++++++
>>>>   arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi        | 97 +++++++++++++++++++++
>>>>   .../boot/dts/amlogic/amlogic-s7-s805x3-bp201.dts   | 41 +++++++++
>>>>   arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi        | 99 ++++++++++++++++++++++
>>>>   .../boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dts | 41 +++++++++
>>>>   arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi       | 99 ++++++++++++++++++++++
>>>>   9 files changed, 443 insertions(+)
>>>> ---
>>>> base-commit: 73e4ffb27bb8a093d557bb2dac1a271474cca99c
>>>> change-id: 20250221-s6-s7-basic-f300c30877e6
>>>>
>>>> Best regards,
>>>> -- 
>>>> Xianwei Zhao <xianwei.zhao@amlogic.com>
>>>>
>>>>
>>

