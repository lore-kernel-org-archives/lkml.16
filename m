Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3054029E107
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750846122; cv=none; b=F64iKAT8ZWVrDPFocJWgjnxs6INg+uHGDWygumI+vnJ3f8pOarujYENTgm/30wf9v8KHLgWiKdZOdf3V/nNv4/+D/ZqVWgdagf2nRLUsOV+P7IhjFdfzKTAVDxzz6X0ZKhLYMewq2A3SdQHty7Wr8d2DrkgOZEStNu7SgGX6Pvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750846122; c=relaxed/simple;
	bh=LEktYiomA97kahVU9LB1E6S/iTgUI2I2o3Xo7BTo7hs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=S8DLeO9S4d0moaJOyK0zZjlNOuw8mILp0tEL7w9Pjn23L6FBBosZnkTPq0c/jsKVmUp4wkkyJeunkgRKCdDhHmP+O8oIqYYk0vkWMA8fyWbWWw3K54zgtIFZfyv18VM67T7bnwozU0Na+xmcwyZBAUC+ksPXC2SDo21LmCoyhY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VnxJDtaP; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VnxJDtaP"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a588da60dfso3822729f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 03:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750846118; x=1751450918; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7JzupWL1XDYIRewec2SQsdiCKOY9Pec5DNEnhFtHIf8=;
        b=VnxJDtaPu8nyTpzcKYBhhyUdkVXzp2fRTeergdWOv1+xsr8BQL+ORTaBYbJxEzTBbT
         7W2QZRxpNTrF8MJb8afk3fIyP+vZE9gMoymHNEOOSCS24TUfylFIZvfaN1BXZB8NmvYa
         Gddi3t87GMApMr95wOVLBJRZfxs+y6CvQ2zJTHLxsSS8UyQSZSkVa4TPTia0MOpfy9rA
         VM977RA/8t0bkLf7gdvXAuTRqvVRXwVUt5ZtaqC6ymUZA25L5H9kDC9xDlOPbbPKVMt3
         M7hXq7dX6hLZyDbF4A7J8cih2U3xv3F/pGNMAqzWLkaPTJFug4IrSqYh6U0y2DCKG7Z9
         li5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750846118; x=1751450918;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7JzupWL1XDYIRewec2SQsdiCKOY9Pec5DNEnhFtHIf8=;
        b=LZikd7Fo6Ap1dIsLDjjZuZFECXefmM+yp7peaoszsCdMzf4E6481Mr+EjgvVkS858a
         LQk/NFCFKBLKpzMzddzbIoZ0Il0AYucVrtiSOrAT87GBNFQPMqthlsqD5VUJ+2r9cpce
         tFb91swVfs7b1KZOy5Ys+hT9eVV9YmH4lT0N2LS/RAop3tEvB5+w/KDaqi88tU3F3R+f
         OM/x+ZLQmefoQuvZXS1eZHgyexdF4ACsK7zWcgdUX/RibIon1XhQOn4fMZLEJgtYnZnz
         JzOLALf9+7ZYSBp2QzJAA8HGLfZLB1SEjdWvQcOp1HVbkbm87jD42MMVuIMQLYdbHlyK
         CD4w==
X-Forwarded-Encrypted: i=1; AJvYcCXnmxQmxEeH+kJGCRp2087xeuRk8ku2mw4vgTZaUrqY/WaPfzzlZ6N0B61Gz0Pi9fBXQ6uZbY+P3rp6U6Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEbWnIrgx//uivDzrnGgFYb1qaQpwFmx8QSIQsOZnjeOVGX5cZ
	HDD0l1rf4TIPg+S9tK55fQ3ur4W8zdpAa0n15R33xHDite1iGzmwZZMmkkrqGT7ZRLY=
X-Gm-Gg: ASbGnctMNRWmiWvcOIdlFR54ncc+x95ch6hHFbWQb6iqlK5wEyeZTlrPl2TqeXXWCb0
	P871fUf+bT/EMHlMmw/BOKIg5FKTD+Zfjk7i/lIhPC/0W3CW1zj7umVYIWc58isa1asPuDJiOcN
	MQWnKmROq2lYwMqEa2tFaKja/tmV6z90GrF45dWFu7yadLBGWABqJRVUI6QVQ92naBqie8NIAPw
	F8JdSBowRACqrTPYjqWBU9YGw1DFrsBzn7Jaax95pT22VRySqKccT/zysHf+ADIZ1m7MCk6r30m
	4ySScH5RXpCoOkNhd9y9/uD5/v8lniff2gvh1++e35AZtbzihn7rLWVntXPXS4KKfHPdymwWCYo
	wNouS6R+cDe7zsd1Vz1IACmMA1HBOfUlmNQmQ
X-Google-Smtp-Source: AGHT+IG5LF4AWsLjPx/1089V2zva7Qrc3IalhvEwkT4jUmwXeJtLeU7OltxRai8wGL+rEMr7x8tcQQ==
X-Received: by 2002:a5d:5c09:0:b0:3a5:8abe:a267 with SMTP id ffacd0b85a97d-3a6ed64b709mr1271789f8f.29.1750846118498;
        Wed, 25 Jun 2025 03:08:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b3df:bee7:215:e1a4? ([2a01:e0a:3d9:2080:b3df:bee7:215:e1a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233a8bbsm15636395e9.6.2025.06.25.03.08.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 03:08:38 -0700 (PDT)
Message-ID: <ce935264-37fc-4073-aed1-0be2bc7aac99@linaro.org>
Date: Wed, 25 Jun 2025 12:08:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 4/4] phy: qcom: phy-qcom-snps-eusb2: Add extra register
 write for SM7635
To: Luca Weiss <luca.weiss@fairphone.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20250625-sm7635-eusb-phy-v1-0-94d76e0667c1@fairphone.com>
 <20250625-sm7635-eusb-phy-v1-4-94d76e0667c1@fairphone.com>
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
In-Reply-To: <20250625-sm7635-eusb-phy-v1-4-94d76e0667c1@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/06/2025 11:14, Luca Weiss wrote:
> As per the downstream devicetree for SM7635, add a register write for
> QCOM_USB_PHY_CFG_CTRL_1 as per the "eUSB2 HPG version 1.0.2 update".
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> The downstream driver supports an arbitrary extra init sequence via
> qcom,param-override-seq.
> 
> volcano-usb.dtsi has the following which is implemented in this patch:
> 
>      /* eUSB2 HPG version 1.0.2 update */
>      qcom,param-override-seq =
>              <0x00 0x58>;
> ---
>   drivers/phy/phy-snps-eusb2.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
> index e232b8b4d29100b8fee9e913e2124788af09f2aa..6122fc797c7fd3011936edc3ff4dafe6a58e6583 100644
> --- a/drivers/phy/phy-snps-eusb2.c
> +++ b/drivers/phy/phy-snps-eusb2.c
> @@ -420,6 +420,12 @@ static int qcom_snps_eusb2_hsphy_init(struct phy *p)
>   	/* set default parameters */
>   	qcom_eusb2_default_parameters(phy);
>   
> +	if (of_device_is_compatible(p->dev.of_node, "qcom,sm7635-snps-eusb2-phy")) {
> +		/* eUSB2 HPG version 1.0.2 update */
> +		writel_relaxed(0x0, phy->base + QCOM_USB_PHY_CFG_CTRL_1);
> +		readl_relaxed(phy->base + QCOM_USB_PHY_CFG_CTRL_1);
> +	}
> +
>   	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_HS_PHY_CTRL2,
>   				    USB2_SUSPEND_N_SEL | USB2_SUSPEND_N,
>   				    USB2_SUSPEND_N_SEL | USB2_SUSPEND_N);
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
