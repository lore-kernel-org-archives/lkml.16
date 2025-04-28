Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE331E502
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 07:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745825533; cv=none; b=OrwpRmJ28vewDITzlStPdnvFydd9JUO4CMf6UoNwnljq8UwLx1eos1LPLw2swEk296dwsjRA1KcMgRrPsG51/bnAHSnhY2bGVdFvjWs9PajLOZAuGp1zXLW38WHkBx2BR0h4Y8zYldyZ4jBjJItNKi/BvJC0xF/3BVWxxw9rBVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745825533; c=relaxed/simple;
	bh=QJCal8CXpSxtV6NulIx/0tF1rQ4/QuFDPBte8ijaA4E=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=lrGFMZxwbA68cSRg1EEdHhy0pe1ThfVG5x02YVarBHxPaFSSeLUcuPjC7Wngn+hllxk0MXN5NUKcIfsCW5J2FqsQGizMUdthIr00hRheR3tSxBVyuMvKgGOclHM6bgkuQIChgHVAXkjAwog/G3Vo4SQ+9VYxKlSHfuSvKBxiyws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xlC+cLPI; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xlC+cLPI"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso42225135e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 00:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745825529; x=1746430329; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gGcH0UeKddFKvZzS6VK/UwJ2UKFscoxXJBXhLgGEGFA=;
        b=xlC+cLPITYNx1TNx0Af7VZft/q4CZLJEyOuY3BQr407xsJhtpYPZQ+VYu3aUvH7fMB
         vJ1hbtS2vHkGAkWYMmoyObokP9q8IlM6WXE3imno28xZJPXLQpWYC4o9q2urULi8Bwpj
         ksfgJ0nGF/XrXSsz/XBWWD+YVpnN0UspWAWq8JVPJYWPpgnk2NnKUAKYbSXjY930zfNh
         yIS1/1Mbf7jeH+izHyZqR9APVws3eZpQOUChgXQ3UwrKIPtmoynWgYk6Mg1uvLCQhomD
         GobinuUfiqvC7xmtZPknDen9j2/Xrv6ln/d5Fyp9cL+xMwkALAbbTOOBl7T4uNhdHG8h
         GjkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745825529; x=1746430329;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gGcH0UeKddFKvZzS6VK/UwJ2UKFscoxXJBXhLgGEGFA=;
        b=CfDLUAtjUSxNGAA8a3jeTOkDWMeDB88sbZXaEYIsvQlTAUwb8lhHKOsk5g4X2x+swU
         KYa5wQfuV0NIcxCTSgwlXIToCGGQfu5LQSgm0i9r9eXvKGuAmRJDGjdWd7bFIHCp8R4J
         6dRybReQuScM9FJYuFk58EPmv3fZGHqB0iFCmOY8XMcFP9f5ccg4u6w/VhHrn7dFPfEa
         ZK/tSlaDeTntxOyc/kDkStt2szzUCuHBHtL+/wN35CZk8fDS2iJ+UKPnT3g3L4xsYW9i
         iRrKN7erApFQBvQSsoLMlSyJ7B99xn/fq4cxV8sXa/+nBgc2vFnMkRfRKP1mNst4qO22
         gDLw==
X-Forwarded-Encrypted: i=1; AJvYcCWPQC2j1YEyuGgolqfUTlAM2Ig4NRqZt2YTft5Cx5ullcjIVT0yA3wdjqGl8CpEh9UQZa3Iy3QhB91xyLo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdsnBVeNalo4/x8HhDrL/A80tC1UWUi7a6m9kgRxmHfgZB/OPc
	ZNggMO6pJ2NrMn13O23Z/6paH1AyvurLkk2FAYoWbaOG1BZjc0FI3BMPDYNrG7o=
X-Gm-Gg: ASbGncub/QKKf9w4tJa9/WDVT7rh7z1O9VFQ170O2B+j7EcFqlga+mJPQlY4f8sMn3W
	mirMxXnv+wsy3OcRhLSvYqBKSE4ilQDXk1P7ChC/7gMZrXiOU1hzWNAQqiU/cQbP9cfinNJX7b5
	00mL1gyd/CoYASG12Y8fR/gxWn4J+W0D3mOkR9Imgs2J2XuNPuhNwwWQ3qEEe0pv5dnROxjq80r
	aSthjEBi5VZEMJnc+R5gIi8y9+GnaUtCHlhWOEHKqcADZLYPpSByliYwIsSwobJt50ooKrI5kAQ
	mr/GwfYpPz7VAIy+nwYrGxKmahh72vmwLH6WezzlO2/y8h5Vh1z5Dt4+rDAWthm6MTrMRztK7Sf
	q7l7HbzDoWtYNGcZVUw==
X-Google-Smtp-Source: AGHT+IE9IxrEQndV7PtNABLrBikOF06TG2rz/qdA9+WaR/LH3kMB0rSX+0YP2PDCf8juRT8QFLptjQ==
X-Received: by 2002:a05:600c:46c8:b0:43c:fe15:41c9 with SMTP id 5b1f17b1804b1-440a65d8c6emr88097415e9.9.1745825529140;
        Mon, 28 Apr 2025 00:32:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:e2bb:d0cc:c4c9:4442? ([2a01:e0a:3d9:2080:e2bb:d0cc:c4c9:4442])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2e00e3sm149222995e9.34.2025.04.28.00.32.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 00:32:08 -0700 (PDT)
Message-ID: <20523c9e-f7de-4355-82ed-380ee03083f0@linaro.org>
Date: Mon, 28 Apr 2025 09:32:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] arm64: dts: amlogic: gxl: set i2c bias to pull-up
To: Da Xue <da@libre.computer>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250425203118.1444481-1-da@libre.computer>
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
In-Reply-To: <20250425203118.1444481-1-da@libre.computer>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/04/2025 22:31, Da Xue wrote:
> GXL I2C pins need internal pull-up enabled to operate if there
> is no external resistor. The pull-up is 60kohms per the datasheet.
> 
> We should set the bias when i2c pinmux is enabled.

So, yes in some cases when the on-board pull-up is missing, the on-pad
pull-up is required, but the whole idea was to only add the pull-up property
when needed.

So I know the real motivation is again about the 40pin headers, where
some applications don't add a pull-up and still want to have i2c working.

So my question is: why can't the pull-up property be added in overlays ?

Neil

> 
> Signed-off-by: Da Xue <da@libre.computer>
> ---
>   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
> index 2dc2fdaecf9f..aed8dbfbb64d 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
> @@ -214,7 +214,7 @@ mux {
>   				groups = "i2c_sck_ao",
>   				       "i2c_sda_ao";
>   				function = "i2c_ao";
> -				bias-disable;
> +				bias-pull-up;
>   			};
>   		};
>   
> @@ -576,7 +576,7 @@ mux {
>   				groups = "i2c_sck_a",
>   				     "i2c_sda_a";
>   				function = "i2c_a";
> -				bias-disable;
> +				bias-pull-up;
>   			};
>   		};
>   
> @@ -585,7 +585,7 @@ mux {
>   				groups = "i2c_sck_b",
>   				      "i2c_sda_b";
>   				function = "i2c_b";
> -				bias-disable;
> +				bias-pull-up;
>   			};
>   		};
>   
> @@ -594,7 +594,7 @@ mux {
>   				groups = "i2c_sck_c",
>   				      "i2c_sda_c";
>   				function = "i2c_c";
> -				bias-disable;
> +				bias-pull-up;
>   			};
>   		};
>   
> @@ -603,7 +603,7 @@ mux {
>   				groups = "i2c_sck_c_dv19",
>   				      "i2c_sda_c_dv18";
>   				function = "i2c_c";
> -				bias-disable;
> +				bias-pull-up;
>   			};
>   		};
>   

