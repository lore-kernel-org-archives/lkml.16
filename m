Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8A32750E3
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 13:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744982607; cv=none; b=JRwlLH+2qAJvWMPm6JG+JagI0v744Tg9E1a2qpjEnQpukpSFgfVXTQ4DIw4Wffa/ic6cZeKNfFkNCi7kZO8+98Wy/XM0mqLNu7rWdtVXaIEuOMjT5Wlt1wfke61ZcKnUFmevVMyWRSaVT/FGNEYB5dB9lCI774XG4tsWY7iAsRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744982607; c=relaxed/simple;
	bh=Oia/rkgNKHh2/N++KZlkJWuabXAo8hJuINnL3w3Ncyk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=sWzpnf3+K7UXNQUaMporaC7eXl4+lh2shbfy3Vh3oUzfsv+ZmdiSqj+m6DV1uE+DjDg+lAdT47wuvrQW6GNxfiEj35KIeXg/q4Xp8jcpRTaPLgzJP7AUP+xItdY31gDPpqiuz6wtUoDdimTiq8WHUTD5IREE0To9baHuv0hQ5L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Un7bvDB2; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Un7bvDB2"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso17602655e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 06:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744982603; x=1745587403; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8+0uPBCTRcJa+XJIyDOCaVN9ER8Mys0My2OlQ2q8Nbw=;
        b=Un7bvDB2n3MWTJUSop6RjsQMFykd4GvIyaDJAzjqubH0ePTUizdxRJO0oNrrGVLXIi
         PPC7cVfIjLjHCNefyJocFea1Luojl48UXhl2BkyRvB7TP+m17UIwme1rjyEu4gGHf4AP
         NKaWhNWZB+tRnld0hcbGiM1WSPrCebxa40USYClx8RL1X/hQN4+mR+panwNzOxfcTqIm
         H5pQqfE1iOfd+lX70q3LgLOvvgYuDIka1HZhM4KMe85zBk2+zbp9WZdJhw1Csoj1uRmn
         yFt5C8gmEAEEtVTS/djp2QXa2+nf0iedwp3PcKPSZLItcBYC9mBPHIL8hMPsT8WbxW0x
         dbKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744982603; x=1745587403;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8+0uPBCTRcJa+XJIyDOCaVN9ER8Mys0My2OlQ2q8Nbw=;
        b=gceyr+wHO4uQvrB27Z1vQlTejJxWZEN86aYkg5HkDem6bZ0uMElbAJvaXAdStYMwMW
         eoHvXAU2BSzMjLvpaOO138d7wa85IJbt9qffcgKxRpN/mnNchEJOFr4LK8+X7NkSS7mP
         h9k8JxPJ+VMvUt5Od827Uva9OWALn89UaNwv1dRpihkOCt4dSyxVGm87gddaLBfptfpW
         0zLHn1GO9bVBWWGpF4gKL0bCyrbJzhVPkDqbC0ar9gHqX8cuY8zh2rHgVswevIoYChyr
         gz7Vr2qstTKgo8WCiqzIpqSBPUSC1ZU3rFoP3GrYBx6tA6Ml/5LdjwweXaaUCp5q7zx8
         9oIg==
X-Forwarded-Encrypted: i=1; AJvYcCUS92CHH98Mai/mQm+OLy5rGB/bl6lmGnNldjpm6icDH4kZV3lAoE+vfoOb14xeI7Zr5unTvy3EJzCoiU8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwODpHhVTkUFgK9ffXczjymZWXmknKLzzQuheiBqkM/pQqrD9wn
	HmUhhRal4NAMduHGaB6P1iODqbwx51Y/3O5Zvcx7VyNahz4PC2Klc4R63pOs4JU=
X-Gm-Gg: ASbGncvp1QW7YvXddtirzz1La/wqidmk2wzBYu4VNR92FM4ucaUqSpQztg8B3EApfXN
	CeP+zcgHnyWWHGt4Rnfl9Q0EkN/i61G9xy6KB7rYCAvYrkJ+vyM+J5Vxg5uuelAFJw1ozeGhsfS
	t47YDfm3tjhj6eTXgnXTE01n7jog77vTDCAw9u/p0NZ6wdzscIlqaSwJxryKid0gyZKUXIhfnN1
	QY8s2l2QiQUleag+umocgWzIl9yEIh1/WDA1jM4ANaJxT0l9eRkrOcgqOdFpAeBvzZfEKZFFvAP
	7JVQbBj7pXkj2DL3e3xtKDUmH6NlAb/Ioj7SbszOnKrEiYMr8imQz9gmvM91bpKp29ZZqNf6GvL
	bwGsFG6HQYvgsElwLgQ==
X-Google-Smtp-Source: AGHT+IGJzh9R71bSIKxTajSqWiIGIo/+gzFHTQInZvegKY/vJp4hnU48uSfbPDcFzy+R16bgsGHN1Q==
X-Received: by 2002:a05:600c:3485:b0:43d:b32:40aa with SMTP id 5b1f17b1804b1-4406ab6897fmr29952425e9.3.1744982603014;
        Fri, 18 Apr 2025 06:23:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f8ba:7c24:7066:d010? ([2a01:e0a:3d9:2080:f8ba:7c24:7066:d010])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5a9ecesm22619665e9.2.2025.04.18.06.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 06:23:22 -0700 (PDT)
Message-ID: <9eab3246-9ae1-46bd-8058-aff7774820a6@linaro.org>
Date: Fri, 18 Apr 2025 15:23:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] clk: qcom: gcc-sm8650: Do not turn off USB GDSCs during
 gdsc_disable()
To: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250305-topic-sm8650-upstream-fix-usb-suspend-v1-1-649036ab0557@linaro.org>
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
In-Reply-To: <20250305-topic-sm8650-upstream-fix-usb-suspend-v1-1-649036ab0557@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bjorn,

On 05/03/2025 20:00, Neil Armstrong wrote:
> With PWRSTS_OFF_ON, USB GDSCs are turned off during gdsc_disable(). This
> can happen during scenarios such as system suspend and breaks the resume
> of USB controller from suspend.
> 
> So use PWRSTS_RET_ON to indicate the GDSC driver to not turn off the GDSCs
> during gdsc_disable() and allow the hardware to transition the GDSCs to
> retention when the parent domain enters low power state during system
> suspend.
> 
> Fixes: c58225b7e3d7 ("clk: qcom: add the SM8650 Global Clock Controller driver, part 1")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/clk/qcom/gcc-sm8650.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sm8650.c b/drivers/clk/qcom/gcc-sm8650.c
> index 9dd5c48f33bed5b944a0b25959ef69e7862d0449..fa1672c4e7d814e1e08c79f9cda9463bf1cd1598 100644
> --- a/drivers/clk/qcom/gcc-sm8650.c
> +++ b/drivers/clk/qcom/gcc-sm8650.c
> @@ -3497,7 +3497,7 @@ static struct gdsc usb30_prim_gdsc = {
>   	.pd = {
>   		.name = "usb30_prim_gdsc",
>   	},
> -	.pwrsts = PWRSTS_OFF_ON,
> +	.pwrsts = PWRSTS_RET_ON,
>   	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
>   };
>   
> @@ -3506,7 +3506,7 @@ static struct gdsc usb3_phy_gdsc = {
>   	.pd = {
>   		.name = "usb3_phy_gdsc",
>   	},
> -	.pwrsts = PWRSTS_OFF_ON,
> +	.pwrsts = PWRSTS_RET_ON,
>   	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
>   };
>   
> 
> ---
> base-commit: 7ec162622e66a4ff886f8f28712ea1b13069e1aa
> change-id: 20250305-topic-sm8650-upstream-fix-usb-suspend-20979d5a0170
> 
> Best regards,

Gentle ping !

Neil
