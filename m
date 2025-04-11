Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0281E7C0E;
	Fri, 11 Apr 2025 07:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744358138; cv=none; b=l18SjbUGgX6K82rzhzJdgaFL8FV68MvnktAKLE7/AAlzRJUWk6jfz6EfHWTz52ZnqgUpoTMhCcdqZEieu3IEj1xrQ2HpV5zWWIvkQ0ekZkPxPJVqdCaKghz1wMl2GO13OCuVyWdyjl7gUTho/FV9cB9sXsm0UE3byQNXHzM5rpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744358138; c=relaxed/simple;
	bh=wlmcAhCm6zahkvpuLIUEhEZ18hG3/lDplSHhbarvimE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S72FwV4mWgpcYS8GHA3TfOwEoQ1Iy8XuN91x67PmL0b1EwrOjchNxuEfGQqq0J1AN1v06BlEWgJ+1GeGvoYTJri7UCROGvbIVn3hRLc6N0k3yZMz0Zscl6oQQ3RANrPGwcSOzGO7lueGMMsPrNyN74vGBmVrpSzYGMpxLdIDjqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gjRVyrZv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gjRVyrZv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF4E4C4CEE2;
	Fri, 11 Apr 2025 07:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744358137;
	bh=wlmcAhCm6zahkvpuLIUEhEZ18hG3/lDplSHhbarvimE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gjRVyrZvgHWrhg7BwxYLKVYE7aCaCPt5+z+1HM3YmjSvhTfZfBENHpXgPxFecDQ97
	 E4AMcEn2CJnt1J3LxjUgy2vkW1YDBZtIhjwOxk7tZYJ2fWmkywjsJgkTCynlK5yZpW
	 oL0RBFwEQLnTSbuQJxaf2SltV8Is9VygI3INgpDQ=
Date: Fri, 11 Apr 2025 09:55:34 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chance Yang <chance.yang@kneron.us>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, morgan.chang@kneron.us
Subject: Re: [PATCH v2] usb: common: usb-conn-gpio: use a unique name for usb
 connector device
Message-ID: <2025041119-pluck-malformed-fc41@gregkh>
References: <20250411-work-next-v2-1-40beb82df5a9@kneron.us>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411-work-next-v2-1-40beb82df5a9@kneron.us>

On Fri, Apr 11, 2025 at 03:47:08PM +0800, Chance Yang wrote:
> The current implementation of the usb-conn-gpio driver uses a fixed
> "usb-charger" name for all USB connector devices. This causes conflicts
> in the power supply subsystem when multiple USB connectors are present,
> as duplicate names are not allowed.
> 
> Use IDA to manage unique IDs for naming usb connectors (e.g.,
> usb-charger-0, usb-charger-1).
> 
> Fixes: 880287910b189 ("usb: common: usb-conn-gpio: fix NULL pointer dereference of charger")
> Signed-off-by: Chance Yang <chance.yang@kneron.us>
> ---
> Changes in v2:
> - Replaced atomic_t with IDA for unique ID management
> - Link to v1: https://lore.kernel.org/r/20250411-work-next-v1-1-93c4b95ee6c1@kneron.us
> ---
>  drivers/usb/common/usb-conn-gpio.c | 25 ++++++++++++++++++++++---
>  1 file changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/common/usb-conn-gpio.c b/drivers/usb/common/usb-conn-gpio.c
> index 1e36be2a28fd5ca5e1495b7923e4d3e25d7cedef..421c3af38e06975259f4a1792aa3b3708a192d59 100644
> --- a/drivers/usb/common/usb-conn-gpio.c
> +++ b/drivers/usb/common/usb-conn-gpio.c
> @@ -21,6 +21,9 @@
>  #include <linux/regulator/consumer.h>
>  #include <linux/string_choices.h>
>  #include <linux/usb/role.h>
> +#include <linux/idr.h>
> +
> +static DEFINE_IDA(usb_conn_ida);
>  
>  #define USB_GPIO_DEB_MS		20	/* ms */
>  #define USB_GPIO_DEB_US		((USB_GPIO_DEB_MS) * 1000)	/* us */
> @@ -30,6 +33,7 @@
>  
>  struct usb_conn_info {
>  	struct device *dev;
> +	int conn_id; /* store the IDA-allocated ID */
>  	struct usb_role_switch *role_sw;
>  	enum usb_role last_role;
>  	struct regulator *vbus;
> @@ -161,7 +165,17 @@ static int usb_conn_psy_register(struct usb_conn_info *info)
>  		.fwnode = dev_fwnode(dev),
>  	};
>  
> -	desc->name = "usb-charger";
> +	info->conn_id = ida_alloc(&usb_conn_ida, GFP_KERNEL);
> +	if (info->conn_id < 0)
> +		return info->conn_id;
> +
> +	desc->name = devm_kasprintf(dev, GFP_KERNEL, "usb-charger-%d",
> +				    info->conn_id);
> +	if (!desc->name) {
> +		ida_free(&usb_conn_ida, info->conn_id);
> +		return -ENOMEM;
> +	}
> +
>  	desc->properties = usb_charger_properties;
>  	desc->num_properties = ARRAY_SIZE(usb_charger_properties);
>  	desc->get_property = usb_charger_get_property;
> @@ -169,8 +183,10 @@ static int usb_conn_psy_register(struct usb_conn_info *info)
>  	cfg.drv_data = info;
>  
>  	info->charger = devm_power_supply_register(dev, desc, &cfg);
> -	if (IS_ERR(info->charger))
> -		dev_err(dev, "Unable to register charger\n");
> +	if (IS_ERR(info->charger)) {
> +		dev_err(dev, "Unable to register charger %d\n", info->conn_id);
> +		ida_free(&usb_conn_ida, info->conn_id);
> +	}
>  
>  	return PTR_ERR_OR_ZERO(info->charger);
>  }
> @@ -278,6 +294,9 @@ static void usb_conn_remove(struct platform_device *pdev)
>  
>  	cancel_delayed_work_sync(&info->dw_det);
>  
> +	if (info->charger)
> +		ida_free(&usb_conn_ida, info->conn_id);
> +
>  	if (info->last_role == USB_ROLE_HOST && info->vbus)
>  		regulator_disable(info->vbus);
>  
> 
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250411-work-next-d817787d63f2
> 
> Best regards,
> -- 
> Chance Yang <chance.yang@kneron.us>
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
