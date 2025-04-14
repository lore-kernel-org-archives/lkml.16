Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3F5269B15
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 10:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744626161; cv=none; b=BXmuDiR8I8D+/VoKie56cMkERrR9jpCotlr6iOrihvuOsJmzcGlK3/PMCu0jPXDMK5fKbXrhhAp6MqmXfNFqq5ju5S1C2zM4tgQT1FRNJ0qpS1fnzY19C8QKCvTag+sNlu8gjOpNOelmlhPod1Eds4SvyIeIhNySXsRKZ+3Sag0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744626161; c=relaxed/simple;
	bh=waw5m+a5rUbWd3g3L+9sKULfcemhyg6/+YbXAHVBvsw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=CM3i8y2ArUP9T9GHPcJwnKcflVlX+5keZtddhdyg431/30wtCDe7otuePLkMUOGrxZ3c+CoabdJzV+Qxt9OtvK4HdW5hoEWAe8PtlzO6ZZQnQoephdQSkZ61p74kr2xgtPh7GiMSH70NHV6dweGo/YKKV6aVI/i5NHXHEC01/94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rt8x0U3P; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rt8x0U3P"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39c1efc457bso2645867f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 03:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744626157; x=1745230957; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ncb7iE4IeU3zq0y7h4GUyT6X0SHC2wVqTzFRUQ7FKXs=;
        b=rt8x0U3PllfbrwlTVr55zri2IJ/Qr8Ypyx8UpKXpfUPQ75U+cAj87Dhame9ZrsEDun
         OZIuBhxF1D0WUClBcaaTyrFggMKEc5EtHJ+2EgSbE1wd+yfx7gTAyMEOGrdoqAvxCKO5
         E6U84PMKwsVOZ2OD3JhmAiSKiZzed/dqkfBYnxfArl9CiW2E6WzLa0IeCMgtkogP/5qz
         64AN8TcJKSzd61ItkrO++0Whp2m3Gm8z6VOL2mhPgDyOBy7yh5hL3KYYeJYScRURaCxI
         xe8i/H6escdwMtQRliAoi4zFdHOC6EKVXN5ccBXctdAfOEYXhEllaSnjA/syo/cnIG+R
         kUsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744626157; x=1745230957;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ncb7iE4IeU3zq0y7h4GUyT6X0SHC2wVqTzFRUQ7FKXs=;
        b=EoLqQ8m+dWn6nDITZgkuuDaTsFBsSaXE279jdosxattX5ej+L8WUKIGGsigMoz4N+8
         qQbgPSLf0rjmdy18ZwUM+SXTufO+3XIrTfx/r1M6fC9fQDOr7o++hqNmOUqC8nhJkDDM
         wTaoSSSfJ0L0LmtpcBPiDprOlycfSzVVPsXMtslw765y2QKw+pU0wYPRexB/hfM++nPv
         wbSgyQXFv/cEZO+9yoFknvNL8LhmmGsStW5C722i9P8774i067ZZ3CocU7wUAQox8qV1
         cHctBlKYgcuYqtHwoedtzSoyxPx+H84QU0ajjIm0bo40X3mD45txXhpFYXuNq8KrpXb+
         jOXA==
X-Forwarded-Encrypted: i=1; AJvYcCVF09HbohlGlwe9wSrCs/iPVei6A/WCqSJ8q8Fg7e1YRUUO9o9dyIO/9TjyBI4I0BKpcMswcrGFNmhGI2A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ0QaPt/2J+WJRjRndCeU22fodCzaBaphJr1xe2I67SXGpVAaI
	MVYr8xPn6VSxajoabSxhGrdVDOdLtwoaf87XERH31lFo+cNBEw5MPGlc2pPf9kQ=
X-Gm-Gg: ASbGncuYhUVx0+QoOmSaWctlpXpdt/QkJF9nhuW+37ciHedUsciFnrPukG1yo5KJ/aF
	/chgu7fnDBecyzaxunniJ75Q3RlWP9sj5a1VqACxwARsie8LGDfIJe1FRLgiq0IVJq3R9pMy9uZ
	J1Ox0iCLljTDyzsG4svplx3eH/1YYGd2xYJXs086keMajY+CHRNznG6ovc/zvSVaajFFI3c7m7r
	Ps2Ho5Zt+wnutAESqQoIOMERVGLj/SBKiMtfZ7JnB+ehjJ7gGT1I5ZKmTtkpIxZk6K+3Q/Dydqa
	BoitB8Mt5hbspIhoPAZrf6f2yi9xTDQIWTIbiE0FRXFZRJROrTPX4gqLDHzrUOhm8Rys3Ts6GT+
	p8eeRKpKh2/wgRUOVYA==
X-Google-Smtp-Source: AGHT+IF0cQm7QJPDKLZYNfA24Nhm+uBnvLvXcohFpubR3I6TIYW257bhrujMNaGcKOrBacSwBaeyEQ==
X-Received: by 2002:a05:6000:1a8e:b0:39c:12ce:67e with SMTP id ffacd0b85a97d-39eaaebe9b2mr9002901f8f.41.1744626157591;
        Mon, 14 Apr 2025 03:22:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:bf8a:3473:5c13:9743? ([2a01:e0a:3d9:2080:bf8a:3473:5c13:9743])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2075a65dsm179752655e9.31.2025.04.14.03.22.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 03:22:37 -0700 (PDT)
Message-ID: <5f8b7452-86e2-4fe8-b5a1-068b72856739@linaro.org>
Date: Mon, 14 Apr 2025 12:22:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 7/7] arm64: dts: amlogic: S4: Add clk-measure
 controller node
To: chuan.liu@amlogic.com, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250414-clk-measure-v2-0-65077690053a@amlogic.com>
 <20250414-clk-measure-v2-7-65077690053a@amlogic.com>
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
In-Reply-To: <20250414-clk-measure-v2-7-65077690053a@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/04/2025 12:12, Chuan Liu via B4 Relay wrote:
> From: Chuan Liu <chuan.liu@amlogic.com>
> 
> Add the clk-measure controller node for S4 SoC family.
> 
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> index 957577d986c0..9d99ed2994df 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -629,6 +629,11 @@ internal_ephy: ethernet-phy@8 {
>   				};
>   			};
>   
> +			clk_msr: clock-measure@48000 {
> +				compatible = "amlogic,s4-clk-measure";
> +				reg = <0x0 0x48000 0x0 0x1c>;
> +			};
> +
>   			spicc0: spi@50000 {
>   				compatible = "amlogic,meson-g12a-spicc";
>   				reg = <0x0 0x50000 0x0 0x44>;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
