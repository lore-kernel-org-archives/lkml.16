Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3936024C08D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 08:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749804948; cv=none; b=VEN9IohF57pMLVqSs5l+ZYyDjJzPe+/x5QQkM4dFju5HuMySo/G05RsQq6z/WG1VsLlwwKP/5wyAu+DWS3r6gyiNBMRZC4HlXeOo9BtP2mB17Se/xhN3Q5uadurv4d9Oq5XoVlOV+xaAElu8gLEHb3YgVtAwTNRWdncfYjpmWO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749804948; c=relaxed/simple;
	bh=8THR6DZNfPloltguTlqsxrK05jfVhYRp5AJDH/oUaKo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=PObWO3/ramluqa0lldoYlYG5bQtpFbLqfkOw6AT4XsUs++cs/6woWelPcoY3HZWQpbsYU2aXeTsLqZb6n3Uw3qIxel13y77GYUKKIzZ3OX21tCU75xql900L54XM0hvyo6r4OAhr3QF79owcoAVPsbcI9ZnpUluEHGCNRDic114=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ay1B1BSf; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ay1B1BSf"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so14283935e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 01:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749804944; x=1750409744; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WbgFKfFXT0IcoLad5STDBDK8DwIurD39yrIVw+HDTMk=;
        b=ay1B1BSff9CH4MAhRblPEmdh9meHDQ8U8iPWIOBEHUQafkOR8pvoCPa/f/Z9zPKzg7
         F2EZ6+5/Lw6BxzyYUy6iPxogq6at14AhfYaLziBgjgctbkDWq4jCF+HNoD/JFwuLFUbM
         drH+DHaanjxlVOoo7134dbBw38e65rUStMd4UP7S4T7/Dux/OX9Br0DjVm3GJpKm7QbU
         nPKupSH4zxYK1ljZuIJ4xHFeuhWPcFySjwYxRkqQZskab3y46T/hdUBKH9ZPu6Yz1s3c
         x6+hWTK9hp/YCyoM73/Gt4ezYaWKRW4l4qTU4C17K7vSVbC1rorJ6Byn9AbmPQmhXf8U
         bSyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749804944; x=1750409744;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WbgFKfFXT0IcoLad5STDBDK8DwIurD39yrIVw+HDTMk=;
        b=sukcPkpEF7TLUAAQSmWl9rt7+wNL9BfRW/2bZDqA0rIe/zAbCGmuP1MXOo+jXNJ2+T
         jrzLCa7Wfa7kL8p68tJMteudwjYAtQR3uqTH2BApbek+/mwzz+OqhxSNpo+92s+Idyji
         vvGfrXlj6Alzb0xmlTSC2FBLZMw712e4ER6Tb18AEYJDtqsXEGXvjpkmBojpiCc0ZvKp
         S6OiPUJhW3EZiiPIjZxbH0KOOyKuI/nPhCYUdBpEBYZNk3hfJEuxxBKZc/7Z7Nq2zYFW
         eDjHeDdCd/vJ9XP57db6kwtP/GP7ohKIMY8v9xjGthdzMoOV4BKZC7LaxOfBNX8zFtcF
         BRuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcPXCsONIEQR75XbafdAdjXUDJIbwpMj9JmnFwlb3rVmd3Z8JGP3jeElny/+UWTdBlqNmeI/cadcRKYos=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSqMA48omoMg7JTWl8KXjElVB4nGMqUrFYvz+ob9EiiFjRVRfG
	WhBfB01/xhApNLy3SZ+uU7UYa6QMjIH1DFoWxM/S2EINH0jhsFqLXVJ7WXiIVdfno4g=
X-Gm-Gg: ASbGncsa51bTpRdmVO1jAo5ZlNP9qWZu3GTFmtG0skQFyqwJrIhtPPsdwloN1tUWwQt
	84b7n/8LHsShPMGocfeZVbzQo7ThpNtB9VkYQv3YHbwz+fPccYtz75WzQIu7EmqMlK+8DJixGrA
	/ens3rnxetWm3a0jf8ZbAoF0lHbKAuSt+DElB5g2NePOiHxCxX3avEYbpygbWSBw1wB+vgYf6rU
	92/gQzQZZXF/jLxawNDSG0cFx1w2mrQN+nViQWARbJYKdLtlcRsisqAvUcfrFDWJRJLcTWsjPzi
	WQGEDZFaoLjMV6fVBCaUY9kODWIgpl0ZZDMTzjj3wS9Aft5XnRHuPigEfR8/nnKZ/wre251Akfv
	lCCRpdV6Qw4jkminK9r9jTMwypPT/6aNlhyCSYVVlEO3yLIfnFg==
X-Google-Smtp-Source: AGHT+IED0BAxVtTDwS2fXEfcMGK0wFVpqVPP42bVl1Ked9zQXlMc38uyZUsXUnAGgbS+IP+aE7R9kQ==
X-Received: by 2002:a05:600c:3545:b0:442:dc6f:2f11 with SMTP id 5b1f17b1804b1-45334b6ef0fmr17740555e9.25.1749804944379;
        Fri, 13 Jun 2025 01:55:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:4144:6a84:fe1d:3aae? ([2a01:e0a:3d9:2080:4144:6a84:fe1d:3aae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a7ddefsm1728926f8f.39.2025.06.13.01.55.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 01:55:43 -0700 (PDT)
Message-ID: <49eb73df-9a15-436e-a05c-72dd3aa36bf8@linaro.org>
Date: Fri, 13 Jun 2025 10:55:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 3/4] phy: rockchip: usbdp: reset USB3 and reinit on
 orientation switch
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
 <20250610-rk3576-sige5-usb-v4-3-7e7f779619c1@collabora.com>
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
In-Reply-To: <20250610-rk3576-sige5-usb-v4-3-7e7f779619c1@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/06/2025 16:07, Nicolas Frattaroli wrote:
> Until now, super speed on Type-C only worked in one orientation. This is
> because on an orientation switch, the UDPHY was never reinitialised.
> 
> Heiko presented a patch to do this[1], but there were concerns over the
> correctness of it[2]. Experimentally using Heiko's patch on RK3576 did
> make me run into issues, though they seemed to be related to the
> orientation switch actually happening while a clock driving a GRF
> register was disabled.
> 
> The key issue is that the hardware wants the USB 3 controller to be held
> in reset while the PHY is being reconfigured, otherwise we may run into
> hard-to-catch race conditions.
> 
> Either way, this patch implements the required ordering in a somewhat
> unpleasant way: we get the USB 3 controller from the DT, and use runtime
> power management to forcibly suspend it while the UDPHY is being
> reconfigured, and then forcibly resume it later. As an added pain in the
> rear, the suspend/resume of the USB 3 controller also tries fiddling
> with the USB 3 PHY part of the UDPHY, which means we introduce an atomic
> flag to skip suspending/resuming the UDPHY if we're resetting the USB 3
> controller. We may just need to skip trying to acquire the mutex again,
> but both ways work for me in practice.
> 
> This solution may in fact be complete rubbish, but it works to get USB 3
> Super Speed working in both cable orientations on my board.

Yeah this is kind of a hack, and we have a similar situation on Qualcomm platforms
when dealing with USB2-only and DP-only altmodes, where we need the DWC3 to
disable the usb3 path. Hopefully on Qcom combo PHYs we can switch lanes without
disable the USB3 PHY.

So the proper solution would have the dwc3 driver to also react to mux and
orientation events and disable the usb3 path to allow the phy to reconfigure
itself.

We don't have any concrete proposal yet, but we will get something soonish.

Neil

> 
> Link: https://lore.kernel.org/all/20250226103810.3746018-3-heiko@sntech.de/ [1]
> Link: https://lore.kernel.org/linux-rockchip/h57ok2hw6os7bcafqkrqknfvm7hnu25m2oe54qmrsuzdwqlos3@m4och2fcdm7s/ [2]
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>   drivers/phy/rockchip/phy-rockchip-usbdp.c | 54 +++++++++++++++++++++++++++++++
>   1 file changed, 54 insertions(+)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> index fff54900feea601c8fe6bf4c7123dfebc5661a15..5cd6bbc367f69bca15c2a94a07e72f850b381ae3 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -200,6 +200,10 @@ struct rk_udphy {
>   	/* PHY devices */
>   	struct phy *phy_dp;
>   	struct phy *phy_u3;
> +
> +	/* USB 3 controller device */
> +	struct device *ctrl_u3;
> +	atomic_t ctrl_resetting;
>   };
>   
>   static const struct rk_udphy_dp_tx_drv_ctrl rk3588_dp_tx_drv_ctrl_rbr_hbr[4][4] = {
> @@ -1255,6 +1259,9 @@ static int rk_udphy_usb3_phy_init(struct phy *phy)
>   	struct rk_udphy *udphy = phy_get_drvdata(phy);
>   	int ret = 0;
>   
> +	if (atomic_read(&udphy->ctrl_resetting))
> +		return 0;
> +
>   	mutex_lock(&udphy->mutex);
>   	/* DP only or high-speed, disable U3 port */
>   	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs) {
> @@ -1273,6 +1280,9 @@ static int rk_udphy_usb3_phy_exit(struct phy *phy)
>   {
>   	struct rk_udphy *udphy = phy_get_drvdata(phy);
>   
> +	if (atomic_read(&udphy->ctrl_resetting))
> +		return 0;
> +
>   	mutex_lock(&udphy->mutex);
>   	/* DP only or high-speed */
>   	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs)
> @@ -1401,10 +1411,31 @@ static struct phy *rk_udphy_phy_xlate(struct device *dev, const struct of_phandl
>   	return ERR_PTR(-EINVAL);
>   }
>   
> +static struct device_node *rk_udphy_to_controller(struct rk_udphy *udphy)
> +{
> +	struct device_node *np;
> +
> +	for_each_node_with_property(np, "phys") {
> +		struct of_phandle_iterator it;
> +		int ret;
> +
> +		of_for_each_phandle(&it, ret, np, "phys", NULL, 0) {
> +			if (it.node != udphy->dev->of_node)
> +				continue;
> +
> +			of_node_put(it.node);
> +			return np;
> +		}
> +	}
> +
> +	return NULL;
> +}
> +
>   static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
>   				 enum typec_orientation orien)
>   {
>   	struct rk_udphy *udphy = typec_switch_get_drvdata(sw);
> +	int ret;
>   
>   	mutex_lock(&udphy->mutex);
>   
> @@ -1420,6 +1451,18 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
>   	rk_udphy_set_typec_default_mapping(udphy);
>   	rk_udphy_usb_bvalid_enable(udphy, true);
>   
> +	if (udphy->status != UDPHY_MODE_NONE && udphy->ctrl_u3) {
> +		atomic_set(&udphy->ctrl_resetting, 1);
> +		pm_runtime_force_suspend(udphy->ctrl_u3);
> +
> +		ret = rk_udphy_setup(udphy);
> +		if (!ret)
> +			clk_bulk_disable_unprepare(udphy->num_clks, udphy->clks);
> +
> +		pm_runtime_force_resume(udphy->ctrl_u3);
> +		atomic_set(&udphy->ctrl_resetting, 0);
> +	}
> +
>   unlock_ret:
>   	mutex_unlock(&udphy->mutex);
>   	return 0;
> @@ -1430,12 +1473,22 @@ static void rk_udphy_orien_switch_unregister(void *data)
>   	struct rk_udphy *udphy = data;
>   
>   	typec_switch_unregister(udphy->sw);
> +	put_device(udphy->ctrl_u3);
>   }
>   
>   static int rk_udphy_setup_orien_switch(struct rk_udphy *udphy)
>   {
> +	struct device_node *ctrl = rk_udphy_to_controller(udphy);
>   	struct typec_switch_desc sw_desc = { };
>   
> +	if (ctrl) {
> +		udphy->ctrl_u3 = bus_find_device_by_of_node(udphy->dev->bus, ctrl);
> +		of_node_put(ctrl);
> +	}
> +
> +	if (!udphy->ctrl_u3)
> +		dev_info(udphy->dev, "couldn't find this PHY's USB3 controller\n");
> +
>   	sw_desc.drvdata = udphy;
>   	sw_desc.fwnode = dev_fwnode(udphy->dev);
>   	sw_desc.set = rk_udphy_orien_sw_set;
> @@ -1499,6 +1552,7 @@ static int rk_udphy_probe(struct platform_device *pdev)
>   		return ret;
>   
>   	mutex_init(&udphy->mutex);
> +	atomic_set(&udphy->ctrl_resetting, 0);
>   	platform_set_drvdata(pdev, udphy);
>   
>   	if (device_property_present(dev, "orientation-switch")) {
> 

