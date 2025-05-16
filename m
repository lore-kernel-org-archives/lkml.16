Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EFD242D68;
	Fri, 16 May 2025 12:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747400276; cv=none; b=aXgQkhd0ku5I8baDG0v3lJ5/4o5wAa1nXplZ1aoSkQxJerVQyPAZskp4gSI8dRfqreMmpS7BlQX0cIDrYEe+iKCo5oZrQQRN02TiHQq4Acq2tLqJ7TKqjhhphf3wXeaiM/pk5VU7jJt4Ctvi4Il2H41ThqkHhPW87i06V2UViws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747400276; c=relaxed/simple;
	bh=bqQBd5PjO+Z7B7y6xL8kSFo8RkFPRhvksEEkPk1FNKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sXAcO3SYmn2NHxOmfTuKsUZ/YSKqHyWTiXtYDJ0V+ssB+aRvyqou29IuNh6WTvffhy9sjHtKiWSr6qMUiu/CVqrpI0ZYt+tPav4AZFrNmocP7VBsD/xV23M9quM3IUfQrtDpHF2ILPEbtd5n+MI1bFrWD1+y9iHdP65Sl9JRt2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=H3yab2Ai; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="H3yab2Ai"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 617B3C4CEE4;
	Fri, 16 May 2025 12:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747400275;
	bh=bqQBd5PjO+Z7B7y6xL8kSFo8RkFPRhvksEEkPk1FNKo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H3yab2Aievc6KyEn/HP5yAftNhFIJDyqgLHX3f9HTb70eYjHjFzW9evKQGhgPFWEY
	 /R0g1GA+IGPO7L9Po8C0OxzSBjOrwQihCO8Znp3YRDQ8yroMoqsiPP8/Z15sAXqeHj
	 MefhwGSoSlr0ZxLVf6guqsXm204gFVSspJfWlq0M=
Date: Fri, 16 May 2025 14:56:07 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: mka@chromium.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, git@amd.com,
	Jonathan Stroud <jonathan.stroud@amd.com>
Subject: Re: [PATCH] usb: misc: onboard_usb_dev: Fix usb5744 initialization
 sequence
Message-ID: <2025051659-stood-scary-c3ba@gregkh>
References: <1747398760-284021-1-git-send-email-radhey.shyam.pandey@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1747398760-284021-1-git-send-email-radhey.shyam.pandey@amd.com>

On Fri, May 16, 2025 at 06:02:40PM +0530, Radhey Shyam Pandey wrote:
> From: Jonathan Stroud <jonathan.stroud@amd.com>
> 
> Introduce i2c APIs to read/write for proper configuration register
> programming. It ensures that read-modify-write sequence is performed
> and reserved bit in Runtime Flags 2 register are not touched.
> 
> Also legacy smbus block write inserted an extra count value into the
> i2c data stream which breaks the register write on the usb5744.
> 
> Switching to new read/write i2c APIs fixes both issues.
> 
> Fixes: 6782311d04df ("usb: misc: onboard_usb_dev: add Microchip usb5744 SMBus programming support")
> Signed-off-by: Jonathan Stroud <jonathan.stroud@amd.com>
> Co-developed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> ---
>  drivers/usb/misc/onboard_usb_dev.c | 100 +++++++++++++++++++++++++----
>  1 file changed, 87 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
> index 15fa90f47c70..320278a0ac39 100644
> --- a/drivers/usb/misc/onboard_usb_dev.c
> +++ b/drivers/usb/misc/onboard_usb_dev.c
> @@ -36,9 +36,10 @@
>  #define USB5744_CMD_CREG_ACCESS			0x99
>  #define USB5744_CMD_CREG_ACCESS_LSB		0x37
>  #define USB5744_CREG_MEM_ADDR			0x00
> +#define USB5744_CREG_MEM_RD_ADDR		0x04
>  #define USB5744_CREG_WRITE			0x00
> -#define USB5744_CREG_RUNTIMEFLAGS2		0x41
> -#define USB5744_CREG_RUNTIMEFLAGS2_LSB		0x1D
> +#define USB5744_CREG_READ			0x01
> +#define USB5744_CREG_RUNTIMEFLAGS2		0x411D
>  #define USB5744_CREG_BYPASS_UDC_SUSPEND		BIT(3)
>  
>  static void onboard_dev_attach_usb_driver(struct work_struct *work);
> @@ -309,11 +310,88 @@ static void onboard_dev_attach_usb_driver(struct work_struct *work)
>  		pr_err("Failed to attach USB driver: %pe\n", ERR_PTR(err));
>  }
>  
> +static int onboard_dev_5744_i2c_read_byte(struct i2c_client *client, u16 addr, u8 *data)
> +{
> +	struct i2c_msg msg[2];
> +	u8 rd_buf[3];
> +	int ret;
> +
> +	u8 wr_buf[7] = {0, USB5744_CREG_MEM_ADDR, 4,
> +			USB5744_CREG_READ, 1,
> +			addr >> 8 & 0xff,
> +			addr & 0xff};
> +	msg[0].addr = client->addr;
> +	msg[0].flags = 0;
> +	msg[0].len = sizeof(wr_buf);
> +	msg[0].buf = wr_buf;
> +
> +	ret = i2c_transfer(client->adapter, msg, 1);
> +	if (ret < 0)
> +		return ret;
> +
> +	wr_buf[0] = USB5744_CMD_CREG_ACCESS;
> +	wr_buf[1] = USB5744_CMD_CREG_ACCESS_LSB;
> +	wr_buf[2] = 0;
> +	msg[0].len = 3;
> +
> +	ret = i2c_transfer(client->adapter, msg, 1);
> +	if (ret < 0)
> +		return ret;
> +
> +	wr_buf[0] = 0;
> +	wr_buf[1] = USB5744_CREG_MEM_RD_ADDR;
> +	msg[0].len = 2;
> +
> +	msg[1].addr = client->addr;
> +	msg[1].flags = I2C_M_RD;
> +	msg[1].len = 2;
> +	msg[1].buf = rd_buf;
> +
> +	ret = i2c_transfer(client->adapter, msg, 2);
> +	if (ret < 0)
> +		return ret;
> +	*data = rd_buf[1];
> +
> +	return 0;
> +}
> +
> +static int onboard_dev_5744_i2c_write_byte(struct i2c_client *client, u16 addr, u8 data)
> +{
> +	struct i2c_msg msg[2];
> +	int ret;
> +
> +	u8 wr_buf[8] = {0, USB5744_CREG_MEM_ADDR, 5,
> +			USB5744_CREG_WRITE, 1,
> +			addr >> 8 & 0xff,
> +			addr & 0xff,
> +			data};
> +	msg[0].addr = client->addr;
> +	msg[0].flags = 0;
> +	msg[0].len = sizeof(wr_buf);
> +	msg[0].buf = wr_buf;
> +
> +	ret = i2c_transfer(client->adapter, msg, 1);
> +	if (ret < 0)
> +		return ret;
> +
> +	msg[0].len = 3;
> +	wr_buf[0] = USB5744_CMD_CREG_ACCESS;
> +	wr_buf[1] = USB5744_CMD_CREG_ACCESS_LSB;
> +	wr_buf[2] = 0;
> +
> +	ret = i2c_transfer(client->adapter, msg, 1);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
>  static int onboard_dev_5744_i2c_init(struct i2c_client *client)
>  {
>  #if IS_ENABLED(CONFIG_USB_ONBOARD_DEV_USB5744)
>  	struct device *dev = &client->dev;
>  	int ret;
> +	u8 reg;
>  
>  	/*
>  	 * Set BYPASS_UDC_SUSPEND bit to ensure MCU is always enabled
> @@ -321,20 +399,16 @@ static int onboard_dev_5744_i2c_init(struct i2c_client *client)
>  	 * The command writes 5 bytes to memory and single data byte in
>  	 * configuration register.
>  	 */
> -	char wr_buf[7] = {USB5744_CREG_MEM_ADDR, 5,
> -			  USB5744_CREG_WRITE, 1,
> -			  USB5744_CREG_RUNTIMEFLAGS2,
> -			  USB5744_CREG_RUNTIMEFLAGS2_LSB,
> -			  USB5744_CREG_BYPASS_UDC_SUSPEND};
> -
> -	ret = i2c_smbus_write_block_data(client, 0, sizeof(wr_buf), wr_buf);
> +	ret = onboard_dev_5744_i2c_read_byte(client,
> +					     USB5744_CREG_RUNTIMEFLAGS2, &reg);
>  	if (ret)
> -		return dev_err_probe(dev, ret, "BYPASS_UDC_SUSPEND bit configuration failed\n");
> +		return dev_err_probe(dev, ret, "CREG_RUNTIMEFLAGS2 read failed\n");
>  
> -	ret = i2c_smbus_write_word_data(client, USB5744_CMD_CREG_ACCESS,
> -					USB5744_CMD_CREG_ACCESS_LSB);
> +	reg |= USB5744_CREG_BYPASS_UDC_SUSPEND;
> +	ret = onboard_dev_5744_i2c_write_byte(client,
> +					      USB5744_CREG_RUNTIMEFLAGS2, reg);
>  	if (ret)
> -		return dev_err_probe(dev, ret, "Configuration Register Access Command failed\n");
> +		return dev_err_probe(dev, ret, "BYPASS_UDC_SUSPEND bit configuration failed\n");
>  
>  	/* Send SMBus command to boot hub. */
>  	ret = i2c_smbus_write_word_data(client, USB5744_CMD_ATTACH,
> 
> base-commit: 484803582c77061b470ac64a634f25f89715be3f
> -- 
> 2.34.1
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
