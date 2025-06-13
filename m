Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8ED227281C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 08:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749804698; cv=none; b=I5sqQo5nWlyNEiVJLe4e0ymAuMOV1s7kA9h7PITGt9UhvBm98QSCxd6MXifzS055xFG/5kqiua9oxLgzxMxc2X5kWJtfougTde3ua+5sjc5bBwbhZMV7fWzcAIkj3TCW82Hq80E1aMnzx1X1Mb/IiHc8VktzRfmoXpSfxHaQaSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749804698; c=relaxed/simple;
	bh=2LkWo1Pa57dprSLts/t1XsvdW5eFeYAlkgw5SnmM4Bc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=tYyaxITjgp9VaNqngRVJMnbo7QpCuTYNZZU1NMdfHk2QACkEB5V4PAmLACzf/W04CagL36hv+2OSxqgsd235CVcMs12xf8Cjgrox2pjJXJLdC2sDYuILLi1u0diKhRCVVpO4e2N3hD92d+WdBlF1nJwqhX3GRdsdm/GnU5J5o8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LPlMESds; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LPlMESds"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4532ff4331cso4714475e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 01:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749804695; x=1750409495; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4i/uycGc9IMJTkT+aPn3NiUgZauSdlLEx0uEl81rWwk=;
        b=LPlMESdsMb5tEXEtiZJanLz/dYF82YRJ7yqH8lDOGG4Nr362fVduMT9Ufw/29w7y+W
         Q/IwenJLX2+hNBhKbT3vWJei8A8dDtXrxUyfR0qhl7IpIcRuH0DrspfMz11O3GOYxlwa
         XXrJvz9P71e+BhYdAxwK+1sFK8tAI0HccCF5UM0Y1v4Ap2WJYHncdnPUKlMKF0GvFRqp
         BW4Sse9pf/zRF0MqOASB5VmVIzY8Jj6FXV4EmpeylY6vhXLjUUar7lDR15EhXAeQ8X2g
         iJ4SfZNs12m/62liREwZ9gzt/QVLZsElxs6tzi7LEBzCqbNyg2vWfuF+s8a6JMJxv5n7
         vdTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749804695; x=1750409495;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4i/uycGc9IMJTkT+aPn3NiUgZauSdlLEx0uEl81rWwk=;
        b=SUw4PvSfzdvGyVpVXGKgJAXHKCFPc2vwbGuNDdZMykXsiEc1ieEOIBBgOrfBReZplw
         hiJkJa6624K46nBjoJYQxf25gKF1+HAl6kVhUQ44GK4MRkDPH2NRr9HPxDB6YAgykkHe
         WoONBjXKLfbz8rkZNtSigfoISVNK6XG55Hbj8DsPxOwXdwsguQomWsIdH7dyGRopvdxC
         U6ZKKXARqjerRIqMBJ/TdU2GuG890Vxj5msLXnYI0G6FvrH//3wfsQhYLWpLEbE1d9v+
         ps19DuIWiGeV5oA7+z20MNBI2puqoeiNlTtBjPzJ5dG+eQvVWONWDMsnOSVBEhRUkLo5
         5tMA==
X-Forwarded-Encrypted: i=1; AJvYcCV0IIgbBoWdH9Glc3ftCdcRIGJY3lzv7LHK6qEnjHH82d0lfbdudCTazuN9CzTNGvwZsYBybcjZIoHvR0I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhUCOCfy9NvUfXjWAkjXL7PJ6wt063f8rirh9S/8yg4doUJw/i
	NuFwsEgVoSceRU6MaJlTBTyvpG44dEkFVb8TAJ0+U4JJ5vdTJJRMuNR0eTldZWZerpbp3ajxmW3
	NiwLh+og=
X-Gm-Gg: ASbGncuFbIGsLwnwxUpNDSk5aAMVXh69B2cLCWB0rQAD5zVepx6YvB/yiVkd9gr49XQ
	pD4S3M/rRWTHdsCKB7oZJAiFWV8poSLXT+9ZsYFJ9d7zSmLeRuCkaRWbt248md23LOewReUfiqn
	OBuElSYiCvM+nUC1lfTQugvBXxZzkV4hmHoqP8rPORRa346IyTheNbpjCxu0SjZSVQM7khWa7wq
	LwQf729EAPGWD5LpmYC7Fs8YckHw7nieY3BHp05PyY9TL2bPws7hyzAEkxCXqKOdJidHaXBA2Sa
	L1dt3MiF9dKHlYi9ih7BamsGChF22+Tv576xj+13aaBx6q2LHQZoACPUuH4vz2BcE+GPrUtT6Gl
	43gWytK6/hK9es6xqIrBahB3rXf9eXj4pJkzde9w=
X-Google-Smtp-Source: AGHT+IEUAqqXCa6QukFfprZqmstdAPX/2X+IrxwAqf6HoHLLDv2NyKBWx+d7mBvUd0+CFYb9GJHC/Q==
X-Received: by 2002:a05:6000:4313:b0:3a4:dc2a:924e with SMTP id ffacd0b85a97d-3a5686e4794mr1735144f8f.6.1749804694922;
        Fri, 13 Jun 2025 01:51:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:4144:6a84:fe1d:3aae? ([2a01:e0a:3d9:2080:4144:6a84:fe1d:3aae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54a63sm1721189f8f.11.2025.06.13.01.51.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 01:51:34 -0700 (PDT)
Message-ID: <e0ce89fd-456d-4ef2-bf8a-0ea0f1e646ef@linaro.org>
Date: Fri, 13 Jun 2025 10:51:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 2/4] phy: rockchip: usbdp: move orientation handling
 further down
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>
Cc: Alexey Charkov <alchark@gmail.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250610-rk3576-sige5-usb-v4-0-7e7f779619c1@collabora.com>
 <20250610-rk3576-sige5-usb-v4-2-7e7f779619c1@collabora.com>
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
In-Reply-To: <20250610-rk3576-sige5-usb-v4-2-7e7f779619c1@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/06/2025 16:07, Nicolas Frattaroli wrote:
> The orientation handling code isn't referenced until very far down the
> driver code.
> 
> Move it down some ways so it can later reference other driver functions
> without needing forward declarations.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>   drivers/phy/rockchip/phy-rockchip-usbdp.c | 100 +++++++++++++++---------------
>   1 file changed, 50 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> index c066cc0a7b4f10fc3cd8779323c369360893520d..fff54900feea601c8fe6bf4c7123dfebc5661a15 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -651,56 +651,6 @@ static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
>   	udphy->mode = UDPHY_MODE_DP_USB;
>   }
>   
> -static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
> -				 enum typec_orientation orien)
> -{
> -	struct rk_udphy *udphy = typec_switch_get_drvdata(sw);
> -
> -	mutex_lock(&udphy->mutex);
> -
> -	if (orien == TYPEC_ORIENTATION_NONE) {
> -		gpiod_set_value_cansleep(udphy->sbu1_dc_gpio, 0);
> -		gpiod_set_value_cansleep(udphy->sbu2_dc_gpio, 0);
> -		/* unattached */
> -		rk_udphy_usb_bvalid_enable(udphy, false);
> -		goto unlock_ret;
> -	}
> -
> -	udphy->flip = (orien == TYPEC_ORIENTATION_REVERSE) ? true : false;
> -	rk_udphy_set_typec_default_mapping(udphy);
> -	rk_udphy_usb_bvalid_enable(udphy, true);
> -
> -unlock_ret:
> -	mutex_unlock(&udphy->mutex);
> -	return 0;
> -}
> -
> -static void rk_udphy_orien_switch_unregister(void *data)
> -{
> -	struct rk_udphy *udphy = data;
> -
> -	typec_switch_unregister(udphy->sw);
> -}
> -
> -static int rk_udphy_setup_orien_switch(struct rk_udphy *udphy)
> -{
> -	struct typec_switch_desc sw_desc = { };
> -
> -	sw_desc.drvdata = udphy;
> -	sw_desc.fwnode = dev_fwnode(udphy->dev);
> -	sw_desc.set = rk_udphy_orien_sw_set;
> -
> -	udphy->sw = typec_switch_register(udphy->dev, &sw_desc);
> -	if (IS_ERR(udphy->sw)) {
> -		dev_err(udphy->dev, "Error register typec orientation switch: %ld\n",
> -			PTR_ERR(udphy->sw));
> -		return PTR_ERR(udphy->sw);
> -	}
> -
> -	return devm_add_action_or_reset(udphy->dev,
> -					rk_udphy_orien_switch_unregister, udphy);
> -}
> -
>   static int rk_udphy_refclk_set(struct rk_udphy *udphy)
>   {
>   	unsigned long rate;
> @@ -1451,6 +1401,56 @@ static struct phy *rk_udphy_phy_xlate(struct device *dev, const struct of_phandl
>   	return ERR_PTR(-EINVAL);
>   }
>   
> +static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
> +				 enum typec_orientation orien)
> +{
> +	struct rk_udphy *udphy = typec_switch_get_drvdata(sw);
> +
> +	mutex_lock(&udphy->mutex);
> +
> +	if (orien == TYPEC_ORIENTATION_NONE) {
> +		gpiod_set_value_cansleep(udphy->sbu1_dc_gpio, 0);
> +		gpiod_set_value_cansleep(udphy->sbu2_dc_gpio, 0);
> +		/* unattached */
> +		rk_udphy_usb_bvalid_enable(udphy, false);
> +		goto unlock_ret;
> +	}
> +
> +	udphy->flip = (orien == TYPEC_ORIENTATION_REVERSE) ? true : false;
> +	rk_udphy_set_typec_default_mapping(udphy);
> +	rk_udphy_usb_bvalid_enable(udphy, true);
> +
> +unlock_ret:
> +	mutex_unlock(&udphy->mutex);
> +	return 0;
> +}
> +
> +static void rk_udphy_orien_switch_unregister(void *data)
> +{
> +	struct rk_udphy *udphy = data;
> +
> +	typec_switch_unregister(udphy->sw);
> +}
> +
> +static int rk_udphy_setup_orien_switch(struct rk_udphy *udphy)
> +{
> +	struct typec_switch_desc sw_desc = { };
> +
> +	sw_desc.drvdata = udphy;
> +	sw_desc.fwnode = dev_fwnode(udphy->dev);
> +	sw_desc.set = rk_udphy_orien_sw_set;
> +
> +	udphy->sw = typec_switch_register(udphy->dev, &sw_desc);
> +	if (IS_ERR(udphy->sw)) {
> +		dev_err(udphy->dev, "Error register typec orientation switch: %ld\n",
> +			PTR_ERR(udphy->sw));
> +		return PTR_ERR(udphy->sw);
> +	}
> +
> +	return devm_add_action_or_reset(udphy->dev,
> +					rk_udphy_orien_switch_unregister, udphy);
> +}
> +
>   static int rk_udphy_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
