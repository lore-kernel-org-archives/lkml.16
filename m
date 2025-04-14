Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E335268C77
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 10:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744626153; cv=none; b=d07e1PNzZmFHfOCz7Qo51ECw+E2q9p6NXgqpc3dR93Mwmo8Vun8oGVDoc1gngA5CZQL5h1sAHsg1+02HLRO6jqUNOfGz5lnbyEeACj7gVr6RIvxAp5QEH75dwOrrXTX6psXbP6NW5GhQKFREJ+fmDceQFIaWKFfiprVdC9iZ97I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744626153; c=relaxed/simple;
	bh=92LgeUE1yM2JHGwEThAUY70+duEciV85RNEtyDMz6Bg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Xqd/BX7ZRHCcFYlxiPc8EZKHNOt3qpZdCbGsA5TV4+W9DVar4B9DZCO/xEv7Wvqjr7S1JmOVUenTVu3Hvdjmb7ISjYitk0YrGBYVOarff9736HYBJRjZfWFwvQ+wSYrom/32lrGCuUQVlvBPUGPSaTdDz0pSNmwbFTPEWuGbphU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RSwuybpg; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RSwuybpg"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so27970245e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 03:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744626150; x=1745230950; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TW2P21MZtVFsuF8DinY899lkZVbNaCtSvhTYV3sTkc4=;
        b=RSwuybpgOJz1WE8+l5lLl+CLFzeA4kmwVrqK2p3YxbjG03vysZoOp6hJisQvCTlafw
         7mmBXyZcUCUPZHi5vatLF1laYyETJKq6iE0P3BxiA7+6qpIiOw07eQVWyDTmoAxXFxx6
         oZF+Ff43losAR63aoJuaH1Tp8QH4FZfa/Eo0SjWlGFJrPJDkvNBP/Y4bYAyn5JHu3idB
         vcfKXNs2GTMnWF9CKFA+UcWRjPOkE7p+dI9maylmuwldbYLfMOfLhd0k+tHby5nkI7XE
         I+GXEvV3ca9Tm6Uyvuv+1yDMf8XSm71pmiHC+kjxRod3l6Od484MSGBzbfeioenLfiA4
         TqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744626150; x=1745230950;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TW2P21MZtVFsuF8DinY899lkZVbNaCtSvhTYV3sTkc4=;
        b=EvlDfYy3YQyucyej8GlzEylZK8TlQJCq9h9QQ4pIfj6+ldY22kKbWq75uPc4HPec1F
         aSL6VTJMVlkgcJCK8Gq3CG7ro0DbqY0fHoP6U+JNGTtg21+5RH9XYqD9zo+0DWOTV88B
         qtgoCXc6AhHRRP3UlPlxmfL8wJVCnJ6FLo1FKiOiUYZ/0+3T4OZbwFX79nV0DmzrN9cS
         z8Gb8lz0W94aJc4/pUokCTKEMEApwksLDK6c29yeOAWLOOfydvxFxziEmWWAje+D8w/a
         gsuloNA3xBWzQ8o6/dggtVrBtXtbF7F6/N9ABDzvf7byV0RYddiUcHmNZNT8rEv4GaSv
         0E5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWBJQvPivXaso0fB35Polty8nA0q+HFw6TznY3iBYflLk0NNJ2KLfVVJyD76e7cwiLFn+dhOpeUAtk9hZw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNCIo2TJzgB4LmHI18ib5kkXUPzgKEXTnlfBkSlCkifOZbl7pU
	BBLxkknitTHiVf66zisO2hmaCpAPkdw8hpivuTWKMt0vBeGz1yHnUSst50bBc6M=
X-Gm-Gg: ASbGnctdHBtQHyAxp0nWuXWW8swF5f05P9xD2R7T/fRpcwZ+LcW978J6stM6ifAejON
	8pF6qtWCiJNzmHA0Ao5XanUEETmxQKDVmNlIEnxXGCedHuQ7cmPzzFxWLZF+ef/tqic33YOXJa9
	nqyHrgWfVNu2pjaQRh3IHmnd7FYLpt69gCPCyAB0/29KEY+NQc1A44tjn11/sXldFqZWitIpjPJ
	JDH/KZsvuiS4Yht4hq94NxmPea5Nh25KGImR/ov8P8pTaDdf9dHgzA6DqOsxKuLP3Lk1G4rUUQc
	mSXqo27izwrwS7rJGPHw/mBMT5AcprYBhoOpqkw1gPME050CNC7R5iIWovAVqa/8rzcAWJJKjRe
	C/z6k9C/L+dmUQ6XQxw==
X-Google-Smtp-Source: AGHT+IFnnMpxrRX1IKPuzqKZUlJI+OH8HM/bkeHBq5BL8g7qMG+PpDEIxDigohVIq8aVk1XuQkVaKg==
X-Received: by 2002:a05:600c:1546:b0:43d:db5:7b1a with SMTP id 5b1f17b1804b1-43f3a93cdeamr103560625e9.12.1744626149598;
        Mon, 14 Apr 2025 03:22:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:bf8a:3473:5c13:9743? ([2a01:e0a:3d9:2080:bf8a:3473:5c13:9743])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2066d004sm178412845e9.18.2025.04.14.03.22.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 03:22:29 -0700 (PDT)
Message-ID: <d38ac821-e98e-46f6-8649-78da5a56f48d@linaro.org>
Date: Mon, 14 Apr 2025 12:22:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 6/7] arm64: dts: amlogic: C3: Add clk-measure
 controller node
To: chuan.liu@amlogic.com, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250414-clk-measure-v2-0-65077690053a@amlogic.com>
 <20250414-clk-measure-v2-6-65077690053a@amlogic.com>
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
In-Reply-To: <20250414-clk-measure-v2-6-65077690053a@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/04/2025 12:12, Chuan Liu via B4 Relay wrote:
> From: Chuan Liu <chuan.liu@amlogic.com>
> 
> Add the clk-measure controller node for C3 SoC family.
> 
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> index fd0e557eba06..cb9ea3ca6ee0 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> @@ -760,6 +760,11 @@ internal_ephy: ethernet_phy@8 {
>   				};
>   			};
>   
> +			clk_msr: clock-measure@48000 {
> +				compatible = "amlogic,c3-clk-measure";
> +				reg = <0x0 0x48000 0x0 0x1c>;
> +			};
> +
>   			spicc0: spi@50000 {
>   				compatible = "amlogic,meson-g12a-spicc";
>   				reg = <0x0 0x50000 0x0 0x44>;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
