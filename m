Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4901279DC6
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 09:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749805366; cv=none; b=N6BFB6tLzBhn24ZKGuyyCzhki478pGR/XmGINqib4E/kWMkyTHtDxuVzQH7FDT8BUSFpFSjS0lAN22A2ICa8JBKBPx5zYXcQjkxTs65L4gUOT2fVvsD+v2T5akXAe8Iukli1ONps79lvezPLuXIN/yPR12xjd9YbpPPca87Y4xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749805366; c=relaxed/simple;
	bh=TG/TNboyr2nZrIwI/ZrZYVcAAGxuEMBiR73YY0u3i0E=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=heu3xCstsAJGAkfRphfvGktDIQxQh7n6cAg4Md7kmyTMkwoUnwqvn6dL65CFEhLqQCQMrY2IMUEQK4+SMl/g0BtzWTa1Do+KfcOfcp/b8PZha4svAiFmmt6kkstxXEGBi0bRTiKtKRs/M8kEb8rgwJ944Ec+cfRNdmgXOlteAlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NZe9dRZq; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NZe9dRZq"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45305c280a3so8085405e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 02:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749805362; x=1750410162; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6QoYHACCv/8zjy2YDzLm8y9RpQw16pLEN6YirZ9m0vY=;
        b=NZe9dRZqlR5Vgm2fPn9XRZFEnQ85YY77Q5P+EpwDXDBhMgQVpiAskUT/aPwGSfvfru
         hREq1ccutxzWn1/YXmYvP3QF69OYHd0jzV8jDqyl5xMR6fz8ayP7f2sNlx4l7k9waOOJ
         jGf+S3BtopQ6H4jZeQJqLbCdpJF2gMiO5GmQFwrno9zMp2G+TiUNxQGG8xOXNhnVkQUY
         ULO81C5oPcyReZfVEsbUKGOpZRw3y0OqsfTmKtRraYCWf2/izGp10lLnKYdpoXydGSlW
         SHBcaSjaaGnkxg09lb5dQtLN6OjCRC6aSHsh5qYMrGxWvuGq3t6eATy7faiidbCIxbmc
         0YGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749805362; x=1750410162;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6QoYHACCv/8zjy2YDzLm8y9RpQw16pLEN6YirZ9m0vY=;
        b=sufPgc9c1jIHHABgO7HEG4xlFOxuBdSXo6zrhUDIdbr5xqkg2ss7V79DB3e8/mVYvT
         dhXIBRGibdEj9xsFVATeGKqJFET/CRVjktLuKp04KVYAvZEK0RCnHoA6FNban1C96YTs
         aV3wnPAjbch9AJbRJaUcTgW7wBNd+z6e14KfB3+pYDxHapvP8PEvdRzDVQpFUAQitrUb
         msz8J3iB4mST9KwQT8asZDA6mbHL7OfiJK8yHe333ROh6HBJRGAyjCbRUr2ySn5saPCC
         72QJhXQRsJHsiiIIzkgppARrCyf9kKzkKmC8tiOVQUdtw4y/gk8L72VsgRJz7K3XX9gR
         95DA==
X-Forwarded-Encrypted: i=1; AJvYcCWXOrOmnGw7hXzqocWJ4cFYJT5awHpWYUEiu+g4du/I4HNzyYplG5bjE9yqyqVQDMvg7OQX/r2ei7hZd1A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvsGLRJuK8ihaqNJVg/Gc8q2zHII7UaGRvc6yaLo/6UO+Hj1PZ
	kG7O346rrp9QK+coiirD+iw5x7vXbuvvz+MLUq67AXbDIDypcoTV0ukBOQ5dgFieEJU=
X-Gm-Gg: ASbGnct2G4r5unsGFLpfoLqhyTfaNoK3hjqPEHn/srU7YbntdBJj9hoEeYsu05dztbK
	ZP8xAlRbr0y7TiPJNLRulfelqAl9BCpU7k5Jnw8kQexuYj/xCdwlovpJeb+P8gCJJmSJO7Cwd8n
	h8ws6CG0LU+5n+Q0J4ogPNUQBKCsOFsmZdC+t60w2hV8gpq2rRwdphFcn047vglBQ+KnibDQiL+
	EU1toW7K78M+6M3+FdbtIiB2c0QFKSvs7z4+ySEovdnT8CxR9tW3B/EhN/3+P5uaIAS4JbWhNOX
	3qCbcTItsASAUXfCp/d/luP1GXTDp+rf9Tyzundbqm9AfISSPP21UrpgTSJdIwQ5/Vi9gruDr8O
	UGw/yL8k2x4GfWibuIREMt2+XM+5hdxX22JYpRjI=
X-Google-Smtp-Source: AGHT+IFuqvNh8uSOWZu2UXCmd0wVJaqPH+h4LYm2IztLltELqL96IHlDFA1jJK0I4kUnynIETYIuDw==
X-Received: by 2002:a5d:5f48:0:b0:3a5:57b7:cd7b with SMTP id ffacd0b85a97d-3a5686d7013mr1993978f8f.22.1749805361999;
        Fri, 13 Jun 2025 02:02:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:4144:6a84:fe1d:3aae? ([2a01:e0a:3d9:2080:4144:6a84:fe1d:3aae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b087b4sm1738872f8f.51.2025.06.13.02.02.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 02:02:41 -0700 (PDT)
Message-ID: <5c531d53-3573-4c25-a32b-79dfd5abd4cd@linaro.org>
Date: Fri, 13 Jun 2025 11:02:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 1/4] phy: rockchip: inno-usb2: add soft vbusvalid
 control
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
 <20250610-rk3576-sige5-usb-v4-1-7e7f779619c1@collabora.com>
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
In-Reply-To: <20250610-rk3576-sige5-usb-v4-1-7e7f779619c1@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/06/2025 16:07, Nicolas Frattaroli wrote:
> With USB type C connectors, the vbus detect pin of the OTG controller
> attached to it is pulled high by a USB Type C controller chip such as
> the fusb302. This means USB enumeration on Type-C ports never works, as
> the vbus is always seen as high.
> 
> Rockchip added some GRF register flags to deal with this situation. The
> RK3576 TRM calls these "soft_vbusvalid_bvalid" (con0 bit index 15) and
> "soft_vbusvalid_bvalid_sel" (con0 bit index 14).
> 
> Downstream introduces a new vendor property which tells the USB 2 PHY
> that it's connected to a type C port, but we can do better. Since in
> such an arrangement, we'll have an OF graph connection from the USB
> controller to the USB connector anyway, we can walk said OF graph and
> check the connector's compatible to determine this without adding any
> further vendor properties.
> 
> Do keep in mind that the usbdp PHY driver seemingly fiddles with these
> register fields as well, but what it does doesn't appear to be enough
> for us to get working USB enumeration, presumably because the whole
> vbus_attach logic needs to be adjusted as well either way.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>   drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 113 +++++++++++++++++++++++++-
>   1 file changed, 109 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
> index b0f23690ec3002202c0f33a6988f5509622fa10e..4f89bd6568cd3a7a1d2c10e9cddda9f3bd997ed0 100644
> --- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
> +++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
> @@ -17,6 +17,7 @@
>   #include <linux/module.h>
>   #include <linux/mutex.h>
>   #include <linux/of.h>
> +#include <linux/of_graph.h>
>   #include <linux/of_irq.h>
>   #include <linux/phy/phy.h>
>   #include <linux/platform_device.h>
> @@ -114,6 +115,8 @@ struct rockchip_chg_det_reg {
>   /**
>    * struct rockchip_usb2phy_port_cfg - usb-phy port configuration.
>    * @phy_sus: phy suspend register.
> + * @svbus_en: soft vbus bvalid enable register.
> + * @svbus_sel: soft vbus bvalid selection register.
>    * @bvalid_det_en: vbus valid rise detection enable register.
>    * @bvalid_det_st: vbus valid rise detection status register.
>    * @bvalid_det_clr: vbus valid rise detection clear register.
> @@ -140,6 +143,8 @@ struct rockchip_chg_det_reg {
>    */
>   struct rockchip_usb2phy_port_cfg {
>   	struct usb2phy_reg	phy_sus;
> +	struct usb2phy_reg	svbus_en;
> +	struct usb2phy_reg	svbus_sel;
>   	struct usb2phy_reg	bvalid_det_en;
>   	struct usb2phy_reg	bvalid_det_st;
>   	struct usb2phy_reg	bvalid_det_clr;
> @@ -203,6 +208,7 @@ struct rockchip_usb2phy_cfg {
>    * @event_nb: hold event notification callback.
>    * @state: define OTG enumeration states before device reset.
>    * @mode: the dr_mode of the controller.
> + * @typec_vbus_det: whether to apply Type C logic to OTG vbus detection.
>    */
>   struct rockchip_usb2phy_port {
>   	struct phy	*phy;
> @@ -222,6 +228,7 @@ struct rockchip_usb2phy_port {
>   	struct notifier_block	event_nb;
>   	enum usb_otg_state	state;
>   	enum usb_dr_mode	mode;
> +	bool typec_vbus_det;
>   };
>   
>   /**
> @@ -495,6 +502,13 @@ static int rockchip_usb2phy_init(struct phy *phy)
>   	mutex_lock(&rport->mutex);
>   
>   	if (rport->port_id == USB2PHY_PORT_OTG) {
> +		if (rport->typec_vbus_det) {
> +			if (rport->port_cfg->svbus_en.enable &&
> +					rport->port_cfg->svbus_sel.enable) {
> +				property_enable(rphy->grf, &rport->port_cfg->svbus_en, true);
> +				property_enable(rphy->grf, &rport->port_cfg->svbus_sel, true);
> +			}
> +		}
>   		if (rport->mode != USB_DR_MODE_HOST &&
>   		    rport->mode != USB_DR_MODE_UNKNOWN) {
>   			/* clear bvalid status and enable bvalid detect irq */
> @@ -535,8 +549,7 @@ static int rockchip_usb2phy_init(struct phy *phy)
>   			if (ret)
>   				goto out;
>   
> -			schedule_delayed_work(&rport->otg_sm_work,
> -					      OTG_SCHEDULE_DELAY * 3);
> +			schedule_delayed_work(&rport->otg_sm_work, 0);
>   		} else {
>   			/* If OTG works in host only mode, do nothing. */
>   			dev_dbg(&rport->phy->dev, "mode %d\n", rport->mode);
> @@ -666,8 +679,17 @@ static void rockchip_usb2phy_otg_sm_work(struct work_struct *work)
>   	unsigned long delay;
>   	bool vbus_attach, sch_work, notify_charger;
>   
> -	vbus_attach = property_enabled(rphy->grf,
> -				       &rport->port_cfg->utmi_bvalid);
> +	if (rport->port_cfg->svbus_en.enable && rport->typec_vbus_det) {
> +		if (property_enabled(rphy->grf, &rport->port_cfg->svbus_en) &&
> +		    property_enabled(rphy->grf, &rport->port_cfg->svbus_sel)) {

Why do you check the registers since you always enable those bits on those conditions:
	rport->port_id == USB2PHY_PORT_OTG
	rport->typec_vbus_det
	rport->port_cfg->svbus_en.enable
	rport->typec_vbus_det
Can't you us them instead ?

Neil

> +			vbus_attach = true;
> +		} else {
> +			vbus_attach = false;
> +		}
> +	} else {
> +		vbus_attach = property_enabled(rphy->grf,
> +					       &rport->port_cfg->utmi_bvalid);
> +	}
>   
>   	sch_work = false;
>   	notify_charger = false;
> @@ -1276,6 +1298,83 @@ static int rockchip_otg_event(struct notifier_block *nb,
>   	return NOTIFY_DONE;
>   }
>   
> +static const char *const rockchip_usb2phy_typec_cons[] = {
> +	"usb-c-connector",
> +	NULL,
> +};
> +
> +static struct device_node *rockchip_usb2phy_to_controller(struct rockchip_usb2phy *rphy)
> +{
> +	struct device_node *np;
> +	struct device_node *parent;
> +
> +	for_each_node_with_property(np, "phys") {
> +		struct of_phandle_iterator it;
> +		int ret;
> +
> +		of_for_each_phandle(&it, ret, np, "phys", NULL, 0) {
> +			parent = of_get_parent(it.node);
> +			if (it.node != rphy->dev->of_node && rphy->dev->of_node != parent) {
> +				if (parent)
> +					of_node_put(parent);
> +				continue;
> +			}
> +
> +			/*
> +			 * Either the PHY phandle we're iterating or its parent
> +			 * matched, we don't care about which out of the two in
> +			 * particular as we just need to know it's the right
> +			 * USB controller for this PHY.
> +			 */
> +			of_node_put(it.node);
> +			of_node_put(parent);
> +			return np;
> +		}
> +	}
> +
> +	return NULL;
> +}
> +
> +static bool rockchip_usb2phy_otg_is_type_c(struct rockchip_usb2phy *rphy)
> +{
> +	struct device_node *controller = rockchip_usb2phy_to_controller(rphy);
> +	struct device_node *ports;
> +	struct device_node *ep = NULL;
> +	struct device_node *parent;
> +
> +	if (!controller)
> +		return false;
> +
> +	ports = of_get_child_by_name(controller, "ports");
> +	if (ports) {
> +		of_node_put(controller);
> +		controller = ports;
> +	}
> +
> +	for_each_of_graph_port(controller, port) {
> +		ep = of_get_child_by_name(port, "endpoint");
> +		if (!ep)
> +			continue;
> +
> +		parent = of_graph_get_remote_port_parent(ep);
> +		of_node_put(ep);
> +		if (!parent)
> +			continue;
> +
> +		if (of_device_compatible_match(parent, rockchip_usb2phy_typec_cons)) {
> +			of_node_put(parent);
> +			of_node_put(controller);
> +			return true;
> +		}
> +
> +		of_node_put(parent);
> +	}
> +
> +	of_node_put(controller);
> +
> +	return false;
> +}

This DT parsing is quite complex, but seems it's the only way to detect such features
without bindings change, not sure it's really beneficial.

> +
>   static int rockchip_usb2phy_otg_port_init(struct rockchip_usb2phy *rphy,
>   					  struct rockchip_usb2phy_port *rport,
>   					  struct device_node *child_np)
> @@ -1297,6 +1396,8 @@ static int rockchip_usb2phy_otg_port_init(struct rockchip_usb2phy *rphy,
>   
>   	mutex_init(&rport->mutex);
>   
> +	rport->typec_vbus_det = rockchip_usb2phy_otg_is_type_c(rphy);
> +
>   	rport->mode = of_usb_get_dr_mode_by_phy(child_np, -1);
>   	if (rport->mode == USB_DR_MODE_HOST ||
>   	    rport->mode == USB_DR_MODE_UNKNOWN) {
> @@ -2050,6 +2151,8 @@ static const struct rockchip_usb2phy_cfg rk3576_phy_cfgs[] = {
>   		.port_cfgs	= {
>   			[USB2PHY_PORT_OTG] = {
>   				.phy_sus	= { 0x0000, 8, 0, 0, 0x1d1 },
> +				.svbus_en	= { 0x0000, 15, 15, 0, 1 },
> +				.svbus_sel	= { 0x0000, 14, 14, 0, 1 },
>   				.bvalid_det_en	= { 0x00c0, 1, 1, 0, 1 },
>   				.bvalid_det_st	= { 0x00c4, 1, 1, 0, 1 },
>   				.bvalid_det_clr = { 0x00c8, 1, 1, 0, 1 },
> @@ -2087,6 +2190,8 @@ static const struct rockchip_usb2phy_cfg rk3576_phy_cfgs[] = {
>   		.port_cfgs	= {
>   			[USB2PHY_PORT_OTG] = {
>   				.phy_sus	= { 0x2000, 8, 0, 0, 0x1d1 },
> +				.svbus_en	= { 0x2000, 15, 15, 0, 1 },
> +				.svbus_sel	= { 0x2000, 14, 14, 0, 1 },
>   				.bvalid_det_en	= { 0x20c0, 1, 1, 0, 1 },
>   				.bvalid_det_st	= { 0x20c4, 1, 1, 0, 1 },
>   				.bvalid_det_clr = { 0x20c8, 1, 1, 0, 1 },
> 

Thanks,
Neil
