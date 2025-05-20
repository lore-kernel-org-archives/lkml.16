Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58227E573
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 12:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747744365; cv=none; b=V2EGVMc6XfyJZJbV5jQ+zMEfgJUW32LyiAWK5WDrn3q4/4YrLYS8rnZ1IS0VO3KlUvzhhEeswIID68ulKmY8ue49/DBWU6lXqJedyLokTOGIYpD8ncuchD5oZk7jLHkLy9ugCE495WIcbBVobDnMaXU3MFNZ/hJNU4VZZlQXKik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747744365; c=relaxed/simple;
	bh=mo+zkf2V9/PQsTpLE7bLLxHvMSr4hjhk93Mt9S9v2VM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LnFjXbgL6WqdcTy3RDb4jtqVeXBdJGmteOQBuY2llO0o9lZnae0+RQNT1xS5L0x2BI2SCelXyO6DPF6IQOXOyGz+8OUEGqR7EhsyP4mSyPQZK1c9ETW9ik6Ip7tgOqdZLkCY4mdj5+64sjFTKsAgAXXTUS5sqv3BAjRf1cOA2AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oKlOMxLm; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oKlOMxLm"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a3683d8314so2560045f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 05:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747744361; x=1748349161; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lQ/iGDifZoJFpYpccOafvVqXyLvyOSbrLk1nfUTcRGE=;
        b=oKlOMxLmeJ1CZGQ+fJ6qBDnwCWaIv9bp2/H29U83r/wsnXmU+aeth1hxUpEbwS23JI
         etARuHaS4mitMjiLuQ9rOzTMTzidxyqVa+4Exw1oxgkhljYsLMwks2zyGe/gR2MDko2J
         QZzdYYWseqrAvcMnRYdlRyCOQbBM5QUqEBiyv0DhKtVDTe/X2f47OH1SlJWqEfN+jmiW
         mGyUmrzNb+DSu3jOGYkqMy6ZoieUYLFeyXegFNzP2vU2U9DM1nsEDh9XJTaq2nbhfLK3
         OzFT8XGHfF9fezNwgeRs1mTYZlrYN0scVFPlmxExFMVkoY6XZ2/EGQ3TCNYSZeLNbPYq
         MEUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747744361; x=1748349161;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lQ/iGDifZoJFpYpccOafvVqXyLvyOSbrLk1nfUTcRGE=;
        b=cSvfmSAcoGZ/5ARgoc672ytWj25kPp55GdzuuF+4uWrrAyj+U+119FfhcXzGdl/fnQ
         o64Ch7JOdf39M/dEFR4v+kiFmsXcO1tzcYqE9wQWLOFbO3M9ljXY7K3u/EJf8yX7x1K+
         PUO/55bc/LVxaymsbgSo/GGYqt65r1MEEJrZlXmAzuWtdn7EdbuDX15kaGIa5ugS1fPe
         /G4fgQfASlKVO0Krwgv18WXc7oasNrAatkFJK5yXDmkZgmomGqb+5UMu3eG04f6zfEKE
         uLUgv9uCrq0wQe8cq6eqdj9lJCYR85cYfjzJabdQqv03ZhCl9L7tw/WXezttWBCy0MM3
         TUvw==
X-Forwarded-Encrypted: i=1; AJvYcCUQ3RSoiZ0YDVNsT74eNPMvpp9mvmQTEnsiyUSASJ3NFBRECgJoM9Q3Fz4KjcBXlpsk3krb2ndBHFqYGSM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiFGsICc7BO5noAW6I3NkgpGCo1u/ciON0paUSXmH6Z9l9WvzY
	/A/Ye467/pn7SiAFFdE3L1t8HguoF9ihH5x8cUMEyS3FJUfLexYjeMOInTQdZyW44N8=
X-Gm-Gg: ASbGncva+qaYoJSaoRa9somkfFAX71/0C0t5rVbHRlZwaAO77fbFeLqfQlblBg9+c/a
	pj2sfEl0oQnWkHPJIZf5r4vXvPcSoOUYbwH57DYz4Ufty8nhRFPqfqlNrTFRQfPZPTB4s/pNvWA
	mPgNW2lQP/ZFTAGTB5IcDKi+6Hk4N5eHZ5xGYdhF5LxLScmrwe5qjBFvkhbZelSDvDA4k/974lN
	JMhRC90U146YxLvgAjOF2En6dzn1oBQiR4wKEWNSnZYUyJ8SzBVetSZ3Ky8Q7/WIs5Or/vU1Fx8
	3tMpoVpCqcSiY2jcV+X+i7Y/npMylAUar+ahFz0Ygmw1d9w6/RlmgGbmkU7trP7vLxQCiUdABCZ
	2YX5r1F4c3IHPMjMLAQz4n1oUoWKg
X-Google-Smtp-Source: AGHT+IF9JgnEXOZZrtY+Ie0ZOfbkRyYBtLxvkI5PbUcfuC510953elD1+wY7Qfb0abQ602fLh29f7w==
X-Received: by 2002:a05:6000:2509:b0:3a3:7bbc:d957 with SMTP id ffacd0b85a97d-3a37bbcdaa6mr1647245f8f.33.1747744361519;
        Tue, 20 May 2025 05:32:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68? ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5a04csm16065014f8f.23.2025.05.20.05.32.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 05:32:40 -0700 (PDT)
Message-ID: <872b7da3-b771-4df3-9b1a-21ca48c36045@linaro.org>
Date: Tue, 20 May 2025 14:32:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v1] arm64: dts: amlogic: Update USB hub power and reset
 properties
To: Anand Moon <linux.amoon@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/Amlogic Meson SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson SoC support"
 <linux-amlogic@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Cc: Wayne Schroeder <raz@chewies.net>
References: <20250520091842.7504-1-linux.amoon@gmail.com>
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
In-Reply-To: <20250520091842.7504-1-linux.amoon@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/05/2025 11:18, Anand Moon wrote:
> Add missing reset-gpios property to the USB 2.0 hub node to
> ensure proper reset handling. Also update the vdd-supply for
> both USB 2.0 and 3.0 hubs to use the shared hub_5v regulator
> for consistent power management.
> 
> Fixes: ccff36934137 ("arm64: dts: amlogic: Used onboard usb hub reset on odroid n2")
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> index 3bca8023638d..ad959f8bc1ac 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> @@ -42,7 +42,8 @@ hub_2_0: hub@1 {
>   			compatible = "usb5e3,610";
>   			reg = <1>;
>   			peer-hub = <&hub_3_0>;
> -			vdd-supply = <&usb_pwr_en>;
> +			reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
> +			vdd-supply = <&hub_5v>;
>   		};
>   
>   		/* 3.0 hub on port 4 */
> @@ -51,7 +52,7 @@ hub_3_0: hub@2 {
>   			reg = <2>;
>   			peer-hub = <&hub_2_0>;
>   			reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
> -			vdd-supply = <&vcc_5v>;
> +			vdd-supply = <&hub_5v>;

In this case, also remove the &usb2_phy1 phy-supply since now it's managed by the hub reset control.

Neil

>   		};
>   	};
>   
> 
> base-commit: a5806cd506af5a7c19bcd596e4708b5c464bfd21

