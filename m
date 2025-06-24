Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE49E248F59
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 07:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750749950; cv=none; b=VbCdo5OPG9es5/BSW9K8UkoaAF5ILtKE8Ac9xTxuUGT4VrD04+EqEA8pVA3Er0j7kChgMRsUA4m9ZxXSpoGZfsi2we8IxdXAt72ol6YgfKhu3fiHIf65zYNBGriKJntIVcwVi0paKZIJhK+fEsdOtQ49rmoSxF66JqwYnoKhuRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750749950; c=relaxed/simple;
	bh=Ri2f5BjFFFKOBxurvxfjeGQiE9qDOhTO3lBt58ggkUw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=iugGxmqy0OXLl1thl8yaWNWzdN+4LK50ZQa/GyeXdvLYt7lQZaxMxLGsjmcHQZ+cg5HTo69aQYHmiHwT5FkgfvnjxLrveEFRFbR075YyHjFNHo8PCbtsllG/yg0dA+95hBrgiifDdkNW+6c2yk2x2jkgwPj6crr9Z2i0rD1CSYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W906KWuA; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W906KWuA"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a575a988f9so62691f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 00:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750749947; x=1751354747; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FtgIGNczssYUGYgBiPeFqClBJjbBAECDcaII7sn4pOg=;
        b=W906KWuAZuB7TBVSsu5SoCE+FCr3Fp0JXafb7eMB2OCncaPBuDZ1mlAY5xrNPV8sWi
         WYAWqU3p+Cax1srHns56MJOEnJz/jPRAWhkZF9R2TKCsdzux70msy7dahbtVi1o7ZX5K
         +uK+m4Q/3tYG2gQVpZzfHEDPcBPEhr5eBx/bpNocmfCEPjNKuFJ+wi4dJvl01fAaUaVi
         CO7WRm9HYhRn88bbPIbsG7pK8hkW6jjrSCEHU5rwvv09aeNDjp9Wa2vonPkAb/trH9O7
         9eGt1gIYpcNsSvR9aNmEuuw9NC1EXKAQ2uBcqUfbcNWw7xBD9K/KV+TsSgrceVDWB3ky
         vQbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750749947; x=1751354747;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FtgIGNczssYUGYgBiPeFqClBJjbBAECDcaII7sn4pOg=;
        b=kzj+EGTy0+d8aXYTFMlWH4jEW1H6u0Yx+O+Zyrfsw/CMvhrDOmPoDWha7dUgiIFmrL
         947kMq5NiPDSBZN64uXGOEdMl5l4go5j4CHy/XNhtBJ7i8EVuVnjpp9vuVFRzAEjq7/9
         FNnI1Q2WRhtqvdkGVloFcILhDzxZUfQ3iVQ2FezwYD1zw1HefcqYOnmQu/AxnB8+YfJ+
         c/KusclmjBPjEf0LUznBKjw1oxk5gWMg012XYYBUknSEq6zEgQVIOoQF6whkdjJNGJaJ
         a8vKW4E+Mrp6MgvmrQn6ryRIh4I118p2Y1MWtzq5coe+EJn4KMs8+CVyNKBWQiEMGigB
         NdqA==
X-Forwarded-Encrypted: i=1; AJvYcCViI4BtwYROiz/W8vWSMFw9ADe3LfRKexVQ/PMxQk3AENJP1DBgfDcdHWOBSE6BSMIIZ1yv0HSy8C7FBqU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz35/wGMUUREqB+s7YFTf4S0k/dw6bi3p10pBlJ8RWDpGJ3SiVs
	4tOsRlKC7v391t78jpgyk39ZLgmOmPOn+8YyJgkUFKEM0tWktIl0K0+KVoIuBgmsFVs=
X-Gm-Gg: ASbGncvRWROE9hcjCrfDFurulwp0WauEyBKdGNwoLbJ4PW9AAFjBp6EA1BOLD+f4pqx
	5DbYx/HJW9PvD+Mt82DjETNVVbBK8QMm3qZv99FD+Nyb5p97fNZ48MnBm04bsDrOrdYtct4IL6U
	WzxoC+/8Q2Kt4NtG+wdrxLhl2Mf/dkzOvraHvoXGsOup4r0RFErwbXEqkxbbfkoYz8zAn7BHIOn
	rnwFMfSjKULDaQf6uxyMLFYfZkFz/vxufO+ZfnjNthaqrLPGA24kVfHDi6uOCRT2PPjavzSIkoG
	7a1Ig2fgJiaVHoFXAg1t46GyQunovsXqLX70EyzEp0W2YrfFlj2NpQvUyqf+G9zcXHNomfle1xB
	siJGUXoJjiQfedrNa3Uc1l3nEMc/mpcB+UDSpzdU=
X-Google-Smtp-Source: AGHT+IFAh6IcPckJtUb2REr21+qkeIcOv+2E3MpGel+3N0TmxwGvyzKEomHombfie38TZXzxxU5RLQ==
X-Received: by 2002:a05:6000:2084:b0:3a5:3b15:ef52 with SMTP id ffacd0b85a97d-3a6d1192980mr9358226f8f.8.1750749947067;
        Tue, 24 Jun 2025 00:25:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:6fea:600c:ca20:f54a? ([2a01:e0a:3d9:2080:6fea:600c:ca20:f54a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80fed75sm1215020f8f.66.2025.06.24.00.25.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 00:25:46 -0700 (PDT)
Message-ID: <bfba6751-2fd4-4183-b6d4-b1440a4fc98f@linaro.org>
Date: Tue, 24 Jun 2025 09:25:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v1 1/2] phy: mediatek: tphy: Clarify and add kerneldoc to
 mtk_phy_pdata
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunfeng.yun@mediatek.com
Cc: vkoul@kernel.org, kishon@kernel.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <20250623120315.109881-1-angelogioacchino.delregno@collabora.com>
 <20250623120315.109881-2-angelogioacchino.delregno@collabora.com>
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
In-Reply-To: <20250623120315.109881-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/06/2025 14:03, AngeloGioacchino Del Regno wrote:
> As struct mtk_phy_pdata was almost fully documented, transfer
> the comments into kerneldoc on top.
> While at it, also rewrite the comments to both improve the writing
> writing and the actual information in the documentation, and add a
> description for the `version` member of the structure.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   drivers/phy/mediatek/phy-mtk-tphy.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
> index 644a34bd2b0b..858824b4476e 100644
> --- a/drivers/phy/mediatek/phy-mtk-tphy.c
> +++ b/drivers/phy/mediatek/phy-mtk-tphy.c
> @@ -277,19 +277,19 @@ enum mtk_phy_version {
>   	MTK_PHY_V3,
>   };
>   
> +/**
> + * mtk_phy_pdata - SoC specific platform data
> + * @avoid_rx_sen_degradation: Avoid TX Sensitivity level degradation (MT6795/8173 only)
> + * @sw_pll_48m_to_26m:        Workaround for V3 IP (MT8195) - switch the 48MHz PLL from
> + *                            fractional mode to integer to output 26MHz for U2PHY
> + * @sw_efuse_supported:       Switches off eFuse auto-load from PHY and applies values
> + *                            read from different nvmem (usually different eFuse array)
> + *                            that is pointed at in the device tree node for this PHY
> + * @version:                  PHY IP Version
> + */
>   struct mtk_phy_pdata {
> -	/* avoid RX sensitivity level degradation only for mt8173 */
>   	bool avoid_rx_sen_degradation;
> -	/*
> -	 * workaround only for mt8195, HW fix it for others of V3,
> -	 * u2phy should use integer mode instead of fractional mode of
> -	 * 48M PLL, fix it by switching PLL to 26M from default 48M
> -	 */
>   	bool sw_pll_48m_to_26m;
> -	/*
> -	 * Some SoCs (e.g. mt8195) drop a bit when use auto load efuse,
> -	 * support sw way, also support it for v2/v3 optionally.
> -	 */
>   	bool sw_efuse_supported;
>   	enum mtk_phy_version version;
>   };

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
