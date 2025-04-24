Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F305F2206BE
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487614; cv=none; b=TPJD0MfZvsFF1WTqe+T4SY1FiPB9wMrUVCZOP+Asp67Y1yG4rPRcv1ODitOZI4luw0EA113s1s+7jj5VGKqUX3YHA0I/PkTm0rUtiNA0kK6dFDoEWWgX4OrPkShpAnqpN1X1YjHPsPUsx4egWNbKMMLuFZk0pydHnvD8LyYyDx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487614; c=relaxed/simple;
	bh=nGD9BVz8j2OotRq+XBALzjc133ysWi7LIJQYFknwE3A=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=BOtlGBGY40jK8/CQ++o2Y8NnsIxBHmDggJhe/u5UxGKykKRIREULxr3bD26gKi+ou4qehwIXjMm+Rr+u+8pE+ew4Loq5loxTFmQVbbSg9jrPLqKmWNLoDu7Jo0vk27SCFDZERfEOF9uiYtZxl7RujFSTOI9+UiGfpcEOUxS58yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t7WLsYj3; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t7WLsYj3"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso3903715e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 02:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745487611; x=1746092411; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GsdYiir2/QPJiZE91FucRo493WTjvg2844/jPSOuFnc=;
        b=t7WLsYj3U0SF8Fk5dgfUfFRWc4OzO2Vc5Vn5qCFXrHLzFOLjqi/q8jvnbT0CWAB0bA
         QZ2moCV/3lkl13eT6XjDb4Yjn3fUd1HnCJO/Ekbd+gGJHahxdyChhnH4n7BQGXJLC/Do
         Nzmb6jChSR5nAgb3DCI6P6fbyW1ShbfyiIkNx/V2PeCcFrcpZdIdvJpa20EuCFpY8cIT
         GiUlrxuJKBq6eVcJ3yLzjIHjCkObTcGHwjK0+qMppKyjzqzHu7pOnM3nhCDIT2KBu4dC
         Bri5fKBs6qlEAnBdLhuJrF/CLuzC5l/c/y39+zhobNuFElWtftN/NjkjSXNyRLcEaslM
         8Xvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487611; x=1746092411;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GsdYiir2/QPJiZE91FucRo493WTjvg2844/jPSOuFnc=;
        b=axlkG8IfYigqE0m8u8Zto1Enqx/caWb4ZDLuMXz1BaWsojw3bEAEN+uY5S83hqbxqY
         ZjpUfjQb1iCXkXkt00r+Y7+awLu1ERgGZ2hy600dybDnOCJdEYXidRNoFjqTQ4Xn7XK+
         UrKgoywsxbhMbS9XQYCerxY3A5A2GtfjA7S3cVhanX+oRJkgqHFdDbmH5FgxTuLjQrso
         dxNQyMAqoUM3D4I7Boq7uwjw8SIu+3OyXLeMbfcWkzN9xisElx8aoM6q4UNtuJeRPEF9
         INX8Ywv45rBmFpzx5aW3N3QoF7rQHluL0/KQdKJxxehOgnB8QG3aBMlyp1NCOkqEtMBv
         1dIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXio5GsM+QyzqX1rgqf3iynuwBVnaoKGVCmT5k8MXs5l63+HZZz96deabTlHQermMCPtvyBWUgP66J9KQQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl78YYgU+2MYJ8a0T3GL6kayfIjepGQFaOXrGcAXN5B7udmXsC
	X3zQublh6iRIorJ8z8Fo47bM4U14Fjn/eOEdsOI5zDAqdbywg/LvuddhQn+rLLw=
X-Gm-Gg: ASbGncvY4ozjlOOflzvjuY71SCF+IP1rg+Tz5m9atqp2aZFBDVkp8MApeBaSF8ZZRls
	OD80cR09c/l/HA+IcIy0LLKgsrBmQLD3C8m7FsfpXDuDXIABp+xnSrfQW2SczyZ9oZYHiP8QBUg
	qvODdNiJEfAf1/AOXAkkr0X8xuv6IIY+2fCUuMjqttMka1DY3nokOCt5JJV430cI42YBZzVDJMk
	NFDd96QBLkHcNSNLWBtDDzi5c2qq/r2A9ShTlkoAlCO13TOpfA75Qpjz68yJsXNDEGykZ3Tha6b
	9bpEHLbrYXXS6DherfYa1FZjs9pZMBemx/Dhx6HvsKpOQGwEd46+KPYPLJeU5ENCQKZdYtr4lfI
	OvQbJ4qhk1txMr0mHtg==
X-Google-Smtp-Source: AGHT+IGbKzH+UdHoa8Vh4y2Ra8BSslqvY1MacnDBCVBoNcCm+y48fIa9KnJUakAXtxUbplXif8s16w==
X-Received: by 2002:a05:600c:3482:b0:43d:94:2d1e with SMTP id 5b1f17b1804b1-4409bd23196mr21055935e9.13.1745487611286;
        Thu, 24 Apr 2025 02:40:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:a24a:bfda:f031:720d? ([2a01:e0a:3d9:2080:a24a:bfda:f031:720d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2b77f9sm13631535e9.25.2025.04.24.02.40.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 02:40:10 -0700 (PDT)
Message-ID: <094c0d7e-7b24-405d-8e44-c981100383f1@linaro.org>
Date: Thu, 24 Apr 2025 11:40:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v6 0/3] Add support for Amlogic A4/A5 Reset
To: Kelvin Zhang <kelvin.zhang@amlogic.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Zelong Dong <zelong.dong@amlogic.com>,
 Conor Dooley <conor.dooley@microchip.com>
References: <20250411-a4-a5-reset-v6-0-89963278c686@amlogic.com>
 <ef1ac07a-09c5-4f8a-89d5-44d232f8ae41@amlogic.com>
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
In-Reply-To: <ef1ac07a-09c5-4f8a-89d5-44d232f8ae41@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 24/04/2025 10:32, Kelvin Zhang wrote:
> Hi Neil,
> 
> Are there any improvements needed for this patchset?
> Thank you for your review!

No, waiting for Philipp to pick patch 1.

Thanks,
Neil

> 
> On 2025/4/11 19:38, Kelvin Zhang via B4 Relay wrote:
>>
>> Add dt-binding compatibles and device nodes for Amlogic A4/A5 reset.
>>
>> Imported from f20240918074211.8067-1-zelong.dong@amlogic.com
>>
>> Changes in v6:
>> - Rebased onto the latest v6.16/arm64-dt.
>> - Link to v5: https://lore.kernel.org/r/20250320-a4-a5-reset-v5-0-296f83bf733d@amlogic.com
>>
>> Changes in v5:
>> - Rebasing on top of the latest upstream changes.
>> - Link to v4: https://lore.kernel.org/r/20250313-a4-a5-reset-v4-0-8076f684d6cf@amlogic.com
>>
>> Changes in v4:
>> - Remove the superfluous 'items' in the dt-binding.
>> - Rebasing due to recent upstream changes.
>> - Link to v3: https://lore.kernel.org/all/20240918074211.8067-1-zelong.dong@amlogic.com/
>>
>> Changes in v3:
>> - rebase on 'amlogic,t7-reset' patchset
>> - Link to v2: https://lore.kernel.org/all/20240715051217.5286-1-zelong.dong@amlogic.com/
>>
>> Changes in v2:
>> - remove 'amlogic,t7-reset'
>> - move 'amlogic,c3-reset' to the other enum list
>> - move reset node from amlogic-a4-common.dtsi to
>>    amlogic-a4.dtsi/amlogic-a5.dtsi
>> - Link to v1: https://lore.kernel.org/all/20240703061610.37217-1-zelong.dong@amlogic.com/
>>
>> ---
>> Zelong Dong (3):
>>        dt-bindings: reset: Add compatible for Amlogic A4/A5 Reset Controller
>>        arm64: dts: amlogic: Add A4 Reset Controller
>>        arm64: dts: amlogic: Add A5 Reset Controller
>>
>>   .../bindings/reset/amlogic,meson-reset.yaml        | 22 +++--
>>   arch/arm64/boot/dts/amlogic/amlogic-a4-reset.h     | 93 +++++++++++++++++++++
>>   arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |  8 ++
>>   arch/arm64/boot/dts/amlogic/amlogic-a5-reset.h     | 95 ++++++++++++++++++++++
>>   arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        |  8 ++
>>   5 files changed, 218 insertions(+), 8 deletions(-)
>> ---
>> base-commit: 4bc28af2da876531e5183d25ae807e608c816d18
>> change-id: 20250313-a4-a5-reset-6696e5b18e10
>>
>> Best regards,
>> -- 
>> Kelvin Zhang <kelvin.zhang@amlogic.com>
>>
>>
> 

