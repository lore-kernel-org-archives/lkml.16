Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663471519AD
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 06:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743403266; cv=none; b=Yy7u7SKFlEr5K1Csx34rYZGCG5nhrKHg+rD/fmWPbBcGZCnhsBS+CpZmDXSdXdHgh9guwddjUvYa5sy0ggn4uBu/n+CB8iWsSFAmuGdUrIxR9qiZqL6PJgWqMllC3QoLtxkC0DAUKFYJcuADlqzILHQrU9+8+yTsqNIDtypOhB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743403266; c=relaxed/simple;
	bh=jcayFaPmoWyfXnL5/L1fwYSoocEhf/HEuthdV/gHMJY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=PyEDcF+bohATcq8cPmQp2tOTaxOxDZtIgFV5Itzc+1ImFFf1r0QRawLU+a1wfiR6xtLGQW21fA1dBJmcZ0y6TNBRA/I+jTHpdBIpiIhYnfUL8BwD1swDcx3WKze/ns5E1kKDt+3ErpRJtFs3HaL34rmRk5eLnQFTkt3feJxF/10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nh8ikwmU; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nh8ikwmU"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cf848528aso36805495e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 23:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743403262; x=1744008062; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sGnhJIC759yJZtlti/ONE6+GpsFrfUcaeYqXQAyKOzg=;
        b=Nh8ikwmUOT6z1148sSXe9wm5oZTWg4Y1HRpSUpt8vHp1vX2BkqzZ7AiNuVsXNIGecq
         gCpRLk3nuTE44Kc4mbDvw+whCxpRj6+6TsxIRD2PwoV0VBpcbloecNreBHOhBlugzeF7
         G+lWvYtWUXpIA6nCXwTindVXRUJtQEqSbM7kSdkyRPXKQBdpbkBO/0DFJLOssxdW33HZ
         Iv6l53eW8dBzjhqmraIiXQMDixOtAZ1qyDP6sj9LW7zS8iFNJ+BUrT1VN4S8GppbDKpl
         mB5Ag5ns0M4QtgnvWf26tSZDuU0HIR8PzhIu0D709xWiJjfd87BUNCCjlNhXtxw/XWiL
         zXNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743403262; x=1744008062;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sGnhJIC759yJZtlti/ONE6+GpsFrfUcaeYqXQAyKOzg=;
        b=dt2TRY0oxvPDrkaNuLoHSUxy6TjsN4LcpzF4/DyfENiTj9959IXlJz9K0OpZvT5XGO
         9thhF9fhIRTXWcWghcpNHHBjjn4xJZtNMFc0Yuw6dpbknsy2+qZX/axGKz4TWgLv373f
         iTQOVoZOkG/n8UKADHByfmq+53qjK+LH4+R7CgSrr9al0bSysejmDj0nsAue7FARDTVs
         3Lw3SttrjfqLNwAC1m3wSVqVcZBK7YfCLHiFXhf+24ZnxgrU3YBTq7HxcqSt4wTxa/mK
         FftuitwVWTbP03M32xU450WNE6smgDNEnlNzxv9CSEHxwsTID+tPwzYue9FlTzQsmDZZ
         GyeA==
X-Gm-Message-State: AOJu0YwSILOKToWCjgsKufgiKWGhXHtYrObZOPktZuudpMZcEc8RECCm
	FFMYA3bj3QQcIW9ADmqXiZVthoUc07xu+VHe3nIbBOpgwiIolnu4RVltx/xL920=
X-Gm-Gg: ASbGncvrVCBZdoTX4Ub9GKksHilg0nslJImzu2oSC9uK9uku9Agse0fsX43j4DoSd83
	xyQWqX32QORX9G//J/9AfxQj/9R27x8TR6VUa3o5Pe3hT9zwEvW2wegtkrQeNZnYlcuFleg5Ldz
	yqws4vokFV8k6O8EOVLT9i0pHeyKtdhGv5z9i2QfP2rgcPP5rnmaqRmRwM/4FPHR2dKQXzJ0a1d
	evDv8YiBVs18JUfyp+0IUKN+ON6TCpzJgJw5BgD1OCewWEAJLJJYyNlAatH1v6cJ74evR3xnI4j
	0FBE+UyrMfwsu5umXzUUvBhC73Rt2/QBU2jAN8HIuTG+qy/Pu445ub4pi4yuZ9oIYGa3cbvYtV8
	PejtacI5MHj/n1VYd
X-Google-Smtp-Source: AGHT+IH5cRzNfuzcbg+vhCUwchxeuNmDNhE01WF7XDQIelmYWUn5sRs+QoiQmqXdq3AIDEZNp4hpcg==
X-Received: by 2002:a05:600c:5494:b0:43d:7a:471f with SMTP id 5b1f17b1804b1-43db6252fa8mr75261725e9.18.1743403261690;
        Sun, 30 Mar 2025 23:41:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:143:2e3d:45f1:fd2? ([2a01:e0a:3d9:2080:143:2e3d:45f1:fd2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82dede5csm159075245e9.8.2025.03.30.23.41.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Mar 2025 23:41:01 -0700 (PDT)
Message-ID: <769e7524-c1fc-4364-a6e8-e0d0315f9514@linaro.org>
Date: Mon, 31 Mar 2025 08:41:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] pinctrl: meson: define the pull up/down resistor value as
 60 kOhm
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linus.walleij@linaro.org
References: <20250329190132.855196-1-martin.blumenstingl@googlemail.com>
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
In-Reply-To: <20250329190132.855196-1-martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/03/2025 20:01, Martin Blumenstingl wrote:
> The public datasheets of the following Amlogic SoCs describe a typical
> resistor value for the built-in pull up/down resistor:
> - Meson8/8b/8m2: not documented
> - GXBB (S905): 60 kOhm
> - GXL (S905X): 60 kOhm
> - GXM (S912): 60 kOhm
> - G12B (S922X): 60 kOhm
> - SM1 (S905D3): 60 kOhm
> 
> The public G12B and SM1 datasheets additionally state min and max
> values:
> - min value: 50 kOhm for both, pull-up and pull-down
> - max value for the pull-up: 70 kOhm
> - max value for the pull-down: 130 kOhm
> 
> Use 60 kOhm in the pinctrl-meson driver as well so it's shown in the
> debugfs output. It may not be accurate for Meson8/8b/8m2 but in reality
> 60 kOhm is closer to the actual value than 1 Ohm.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>   drivers/pinctrl/meson/pinctrl-meson.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
> index 253a0cc57e39..e5a32a0532ee 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson.c
> @@ -487,7 +487,7 @@ static int meson_pinconf_get(struct pinctrl_dev *pcdev, unsigned int pin,
>   	case PIN_CONFIG_BIAS_PULL_DOWN:
>   	case PIN_CONFIG_BIAS_PULL_UP:
>   		if (meson_pinconf_get_pull(pc, pin) == param)
> -			arg = 1;
> +			arg = 60000;
>   		else
>   			return -EINVAL;
>   		break;

Nice finding !

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
