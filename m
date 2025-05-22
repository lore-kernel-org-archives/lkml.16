Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97AA1A3A80
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 07:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747898531; cv=none; b=JqAW9qkYdSKrhXxWv9F/xeBIYNtPo03uiYyp15n7lSLAZvH6plBt/npGBSf8nKyNcGBycxDJ2TGcHmijBReMV5Tbjtwnzz+Jo0fU+N89a+2R+9VIWYXWpUpFxm3uCJquqhrZXnbU9gMLEQkwNhUE2u9rpHDHu0EGQ9gW2apmMtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747898531; c=relaxed/simple;
	bh=5nOa+dAbTc5Ycm10lURR5yv4ZOoJaW7taXYg/Gy14n0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=lroJECh7fOibzdMsw0Zq0zjLQIY1RRCaqdkCRQ6Oa059bdgiuyNm2G9rFKE1hSHKZRGCJNkShUjG7LFly6Wl4XG/KTN2/79TlkquZntqKSz4iwfuN1vjmo7++YjL6+to0usU3bg1RD4HI1u+R/r5M86x50W7b9a7DhhxbrUKR0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C9d//wAP; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C9d//wAP"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a36efcadb8so3550745f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 00:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747898528; x=1748503328; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yKU1imWgjnCI3avar2mUIPQzX7TLviFQtJlqfZ793SY=;
        b=C9d//wAPcS7hINGN5bZbagwq7RfUoOIYY1smlmP4VFgYQz77dcCcmVm+OS78OEpXwc
         liUfchLX04R1NRX8eFF8DoWvp+QZZjoPNa3ueV7KfERkCw/8VvaDMOb4mRIQAqre+sq6
         MycUwMbaOqtClfVijjQ4zcW6paqPMaLc017OpB6AvtgUwCGPR7lCEIiFM+pc8FZIEH5G
         sgnM47LIgZ8JPcw0K6n6+PqmlYwJLRUkDgayRt4HF2VP5C4qBhtcimxF446cNc4aK3OR
         QqfL24DNIR8Jz/FlKVK62t+D9wiGLIEEbjK3SJSKhIzS/3TettKUP+eC3gaRT2rFuwXV
         sBgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747898528; x=1748503328;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yKU1imWgjnCI3avar2mUIPQzX7TLviFQtJlqfZ793SY=;
        b=HpRMKDCAZ2F6hjRbjSg1GJo6ei0rxuPajmIYD4o8I9oWZDCtia3C/jFMjwgg+txBcB
         OLhix3WPtqrggcbCDuwnZrCRECuN6RX/QN3bcHrzXGpcHXvoqrfeMjYESNrMiPFQMfWM
         9RBZ4a7EHulATsdoWQPLRF8aez/W3G572DcKqIb+XHXh66HUVT3H+gtXVjBZcRUrfczf
         3VXVc/Dz2EftPEBSe3MFZQVXbwhQZorc6gA9DfqgiKCJZ9IkSQarRIV3YQZQWIUheGzE
         8piICkc9/KPTcLvgCMeOwJgWrj/kKm7YUHBZrXziTpVjBRJVbmYFSkQ0eMlPSxw2Y6Xq
         9QRA==
X-Forwarded-Encrypted: i=1; AJvYcCVY1qbGlom3InfwH3bU9lky9pHJgYbuCikDOuXaLWdE2bCTYHGJasWHezrtuOZ/VeNQP/menLxjPYoJ2Tc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQLjPl26L2RyrhowSEI8tPqbA+HaSW2mLpfDf/9AJtzhXx1/Za
	DukgK2dhzOMqieKd55/U/AD9GNUNFXC3fLCzRvTri304aNAj73t9J3/wh0GV2K8+PWk=
X-Gm-Gg: ASbGncvqhn81we9NNP/r024BQlSV98cFfOCHseN/NswlBf5bS9EEXqfebmrjFeAzaD6
	6FKHRn3wOsiK5iqGTacxhN0ijTTuMWrW9/QclTvKGRLzyd1bOdnxY7ayvn8+fP4XBPCljW3k9Bd
	vNQ7qNXdAA68XXlXmAwJCvhjh3RCBVEvZG3QQ+TRftfiyzDW9aZxWvEoj10qJP7Yszh8yc/8T5q
	oRBc0fKXxyfUcgVkN933zj77/ucvprOPanXZyDdXYGVlsNIyFCpokQ2c3schptYpG9uaMy/3ASs
	K9boHK/xrIBn7JOkNfF4y614hSVqtzsasxZsm077d0gi4BJ318OgvGf9MtOVpffRGfUbvshzq0W
	5utOVUjPd8218NGI94OzhZwF+/CCR
X-Google-Smtp-Source: AGHT+IE3G6efsN69U61nJWH6Wm1uz9RoCxH2Y5mDFgiyh9RV68lG2Ng8GLSEqrPwcUEbVLsLRT5P9w==
X-Received: by 2002:adf:e385:0:b0:3a3:6282:693a with SMTP id ffacd0b85a97d-3a362826998mr17022969f8f.44.1747898528052;
        Thu, 22 May 2025 00:22:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:ca6a:4d93:cd32:83a5? ([2a01:e0a:3d9:2080:ca6a:4d93:cd32:83a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca6210asm21904363f8f.41.2025.05.22.00.22.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 00:22:07 -0700 (PDT)
Message-ID: <09533aad-fbec-477d-a088-5ecbe181368b@linaro.org>
Date: Thu, 22 May 2025 09:22:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/2] phy: exyons5-usbdrd: support HS phy for
 ExynosAutov920
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Pritam Manohar Sutar <pritam.sutar@samsung.com>, vkoul@kernel.org,
 kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 alim.akhtar@samsung.com, andre.draszik@linaro.org, peter.griffin@linaro.org,
 kauschluss@disroot.org, m.szyprowski@samsung.com, s.nawrocki@samsung.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
 dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com,
 selvarasu.g@samsung.com
References: <20250516102650.2144487-1-pritam.sutar@samsung.com>
 <CGME20250516101803epcas5p2d9403d89d840dcad88a03d437a48aceb@epcas5p2.samsung.com>
 <20250516102650.2144487-3-pritam.sutar@samsung.com>
 <a5c1a064-d760-4140-9e78-d74823b400a8@linaro.org>
 <000101dbca1d$78ca5570$6a5f0050$@samsung.com>
 <42ddb5c6-0f17-41ed-8bd4-ab58880515b1@linaro.org>
 <bd9ab640-2469-4455-bd69-302dd3898c7b@kernel.org>
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
In-Reply-To: <bd9ab640-2469-4455-bd69-302dd3898c7b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/05/2025 14:58, Krzysztof Kozlowski wrote:
> On 21/05/2025 14:56, 'Neil Armstrong' wrote:
>>>> <snip>
>>>>
>>>>> +	}, {
>>>>> +		.compatible = "samsung,exynosautov920-usb31drd-phy",
>>>>> +		.data = &exynosautov920_usb31drd_phy
>>>>
>>>> All those new ops are only called when matching this compatible, it it really
>>>> necessary to check the version ? is there "samsung,exynosautov920-usb31drd-
>>>> phy" PHYs with version different from 3 in the wild ?
>>>>
>>>
>>> This SoC has a single USB 3.1 DRD combo phy of version v400 (major : minor versions) and three USB2.0
>>> DRD phy v303 (major : minor versions) controllers those only support the UTMI+ interface. Currently,
>>> supporting only v303 phys in this patch-set, and planning v400 phy later (soon).
>>>
>>> Yes, there's v400 phy version that is different from v303 phy. Hence, phy version check is needed to support both the phys for same compatible.
>>
>> OK so add 2 compatibles, one for the usb31drd and one for the usb2drd since those are 2 difference hardware.
> 
> ...unless this is fully detectable hardware, then use fallbacks and only
> one compatible in the driver.

But use proper compatible like "samsung,exynosautov92-usb-phy", but still those are
2 very different PHYs connected to different HW blocks, I won't mix USB3.1 and USB2 PHY
compatibles.

Neil

> 
> Best regards,
> Krzysztof

