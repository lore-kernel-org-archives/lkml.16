Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E730F1B4240
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750664467; cv=none; b=t4Xm5I1U6cOOxwH1CpSGmydmELdtWAbB9+xKs5Xg8Hh7EkzOb01uN9LxE0AqTxwiXoYrcH/wgibSkW2BqQgg4l9BbY7C2bE8Cx8Zzj0oZYTkE+WK8QnNAtilcs12JdEYvEDAXwiO0R9Nx2eOGCl6hTgxNurJqmeBeFssVZJGUIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750664467; c=relaxed/simple;
	bh=s1nX8RXAq8rCQ3l6eiogAzztXZcWBGN63n8sFqj4tRU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=SB+Nf/rRLOATDYM9iRR4Csov6Xn6W9Mc/yIALKrte0ChL3uuJzjq+fz5mz2MQjWopK525OaF+gO42xOw/Q7cj8yAQ3AjbTckVpZ5ZN2AhsigDSHhY71oyrZZy860O0W3WPLqQ8u7/u5H8FyF91C1Vn5H3mN2Nh20YxyRgJStswE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G1KITVyB; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G1KITVyB"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so24576185e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 00:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750664464; x=1751269264; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AeW6Uuzf1Bl2HUqpMLFHqgIH+Q2PYHxgIXjI/kFeO3s=;
        b=G1KITVyBrCQlfFjDq2VL+UhbjFbUE5u9BWeR2ErT5UNsfVXnO1wo4B743rrTp7TfYP
         7+T9/hoH3rQxLlI82pJ3ZdOoy/taoe75Gr8YRH27dL3Er3nMWXD7rV3KwlBL/Ijhx7ER
         yJC+hrKACIdmGuo5P2z1As+lYyUvd4FbC/TbQA7sKHHqiKn2OywPwC+RxejuqPd16g3Y
         5nPhA6TIU375lm85oIjpVB9XfHRR0m6ZVV6Iz62jrB4Q4iRJPhLCXD/sPnPb2Dxd6epW
         PG7JBvz8mHXXGpCAECnfNdt+TdpatTneua057rNTbj5GOKP3YqfXfyKM+cdwn8WlevzF
         +M3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750664464; x=1751269264;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AeW6Uuzf1Bl2HUqpMLFHqgIH+Q2PYHxgIXjI/kFeO3s=;
        b=Kb06f3Z1cIQsPAgqgOpvPbaWuU2fhQAk5rxoyfAy3JH/zE+Y00Agq9pMJxB8gSYJTA
         0O4tMsJdGOlDzN9iQewykzywG1zYQWjLjmjOzqN65OAGTs7WmL5BdCd1rQvVvVoJuoJr
         lCBmM0ptT7SsCmfekU+D+ezVu4fIfbKBdFHR0XS6hPXK//d0AWui4Bhsxe5ZcPR8ksVh
         F869sYazfFq1o+NIduNnizoHkvQZL0po4Z/EoRxP8m8vROqwDVCKyxDacCAAQADMZHjD
         w98HlSXNgGQr6FhnMCljYegQoh24JsGy8ojkskKwHO8XODTmhyWI1gnqmUNQjJPC1S3A
         shUg==
X-Forwarded-Encrypted: i=1; AJvYcCXmyXA8kmMio4DU8n7KPVIXduFJWIC5DUnKszig/lFzn5i3m6VB9cvPoW9bGSX/+FLHMQGXJ9/346Lv1vc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/29ccKedo6dsjH1AnSoN7sFVsawcRHeZHe+xkFgYDD7dADQvu
	Dc1ixYgU2ZUfpM2avDTvbl8WNhzu0MibSF4CCKJwhqIf7OBsOlUtWMoV3FD4dQhkmQM=
X-Gm-Gg: ASbGncsDoJ9pkSYd18mN8CT2RwS7gFZYJ3tSyXF94g5ff728FOKN9zkQ3GltxwpvDKH
	KuyIAEMtsqO3pI2r7NWXxODj07nLkI5HMSrAGOl7PdOFKgckPdymxqbQRn2zXdSeEX9TbcDmYZi
	IGHZUF19fJ8Hqdtbq9IOWzQgJtKUPUbbZv3PGZ943Q2F400K3koTjirwApqUXPPWYwe5mkE4wT4
	Cf6K2mIbXtLBcKSZfZ7QtI87X0sEg5Fd9GAFXxZg89qkPmK/ttFBB0FVRKVLCujKOFvPFsshCC3
	LGpbOJWqZGU8z/ubc64AddVP4rvJ0kADO6Oe/kzlkAQgt6xSEUD6jmSaOaA/fhkWIol4npnMcl/
	CFkwgS7XWgQc/D8ftp5kq3DdcX1qYoWlEmbxyA+k=
X-Google-Smtp-Source: AGHT+IHD+/fz1sWecInD3T1Za6Q8jYc1LEFBXvsskAFiJv2dUlnZNh4T9pnHkuNli8KWbY6bfCumQg==
X-Received: by 2002:a05:600c:5403:b0:453:aca:4d08 with SMTP id 5b1f17b1804b1-45365e2f118mr93390785e9.1.1750664464218;
        Mon, 23 Jun 2025 00:41:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:8c08:7c51:bbb1:5a2d? ([2a01:e0a:3d9:2080:8c08:7c51:bbb1:5a2d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d117c6a7sm8879897f8f.51.2025.06.23.00.41.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 00:41:03 -0700 (PDT)
Message-ID: <3f335e16-8528-422a-a73e-efa06e68851c@linaro.org>
Date: Mon, 23 Jun 2025 09:41:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] pinctrl: meson-g12a: add g12b pwm groups
To: Da Xue <da@libre.computer>, Linus Walleij <linus.walleij@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250619022337.43900-1-da@libre.computer>
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
In-Reply-To: <20250619022337.43900-1-da@libre.computer>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/06/2025 04:23, Da Xue wrote:
> g12b and sm1 have additional pwm pinmuxes for b, c, and d
> 
> Signed-off-by: Da Xue <da@libre.computer>
> ---
>   drivers/pinctrl/meson/pinctrl-meson-g12a.c | 22 +++++++++++++++++++---
>   1 file changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-g12a.c b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
> index e2788bfc5874..8b9130c6e170 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-g12a.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
> @@ -270,15 +270,21 @@ static const unsigned int pwm_a_pins[]			= { GPIOX_6 };
>   /* pwm_b */
>   static const unsigned int pwm_b_x7_pins[]		= { GPIOX_7 };
>   static const unsigned int pwm_b_x19_pins[]		= { GPIOX_19 };
> +static const unsigned int pwm_b_z0_pins[]		= { GPIOZ_0 };
> +static const unsigned int pwm_b_z13_pins[]		= { GPIOZ_13 };
> +static const unsigned int pwm_b_h_pins[]		= { GPIOH_7 };
>   
>   /* pwm_c */
>   static const unsigned int pwm_c_c_pins[]		= { GPIOC_4 };
>   static const unsigned int pwm_c_x5_pins[]		= { GPIOX_5 };
>   static const unsigned int pwm_c_x8_pins[]		= { GPIOX_8 };
> +static const unsigned int pwm_c_z_pins[]		= { GPIOZ_1 };
>   
>   /* pwm_d */
>   static const unsigned int pwm_d_x3_pins[]		= { GPIOX_3 };
>   static const unsigned int pwm_d_x6_pins[]		= { GPIOX_6 };
> +static const unsigned int pwm_d_z_pins[]		= { GPIOZ_2 };
> +static const unsigned int pwm_d_a_pins[]		= { GPIOA_4 };
>   
>   /* pwm_e */
>   static const unsigned int pwm_e_pins[]			= { GPIOX_16 };
> @@ -649,12 +655,22 @@ static const struct meson_pmx_group meson_g12a_periphs_groups[] = {
>   	GROUP(pwm_a,			1),
>   	GROUP(pwm_b_x7,			4),
>   	GROUP(pwm_b_x19,		1),
> +	GROUP(pwm_b_z0,			5),
> +	GROUP(pwm_b_z13,		5),
> +	GROUP(pwm_b_h,			5),
>   	GROUP(pwm_c_x5,			4),
>   	GROUP(pwm_c_x8,			5),
> +	GROUP(pwm_c_c,			5),
> +	GROUP(pwm_c_z,			5),
> +	GROUP(pwm_d_z,			4),
> +	GROUP(pwm_d_a,			3),
>   	GROUP(pwm_d_x3,			4),
>   	GROUP(pwm_d_x6,			4),
>   	GROUP(pwm_e,			1),
> +	GROUP(pwm_f_a,			3),
> +	GROUP(pwm_f_h,			4),
>   	GROUP(pwm_f_x,			1),
> +	GROUP(pwm_f_z,			5),
>   	GROUP(tsin_a_valid,		3),
>   	GROUP(tsin_a_sop,		3),
>   	GROUP(tsin_a_din0,		3),
> @@ -1058,15 +1074,15 @@ static const char * const pwm_a_groups[] = {
>   };
>   
>   static const char * const pwm_b_groups[] = {
> -	"pwm_b_x7", "pwm_b_x19",
> +	"pwm_b_h", "pwm_b_x7", "pwm_b_x19", "pwm_b_z0", "pwm_b_z13"
>   };
>   
>   static const char * const pwm_c_groups[] = {
> -	"pwm_c_c", "pwm_c_x5", "pwm_c_x8",
> +	"pwm_c_c", "pwm_c_x5", "pwm_c_x8", "pwm_c_z",
>   };
>   
>   static const char * const pwm_d_groups[] = {
> -	"pwm_d_x3", "pwm_d_x6",
> +	"pwm_d_a", "pwm_d_x3", "pwm_d_x6", "pwm_d_z",
>   };
>   
>   static const char * const pwm_e_groups[] = {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
