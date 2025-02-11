Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD601F12F7;
	Tue, 11 Feb 2025 09:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739266050; cv=none; b=BwL5Mof2LGYiwarK61fFKyzbd5XePE6bNCOqYJr2oiA146e56Y6JeBPQ8NNAIxI5mZh+qp5gMbAzFVA6kZ4KewZ0bnpIW5Na6bH2dNsp27irWy16OZB86+Ky4poJP9ykPvxYgG3ioEXkEJyK2IMKBiLU8EvnBNNLziuRTbf3PcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739266050; c=relaxed/simple;
	bh=yjRL57La7+E9GoG6/dJBw79jGho0USNqZcA1Gd268Bg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ayfg3dMfjaxlDKlc/4y8leu/kLsNFGcs2RGrcQww7jU+Z5q8i575hbu+ZwoZIQ8Bgld/uY6gWpRC74TMLkcL1bmhiYcwiRhYKt+zLdcRAnfSIQi6f6JSJ0Yxo2ixlVqC/4pV8Y13zmnLMZ4lDSzO1LAMNPtfIwfaDkgu1KpSKv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XpMx7IkH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XpMx7IkH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C247CC4CEE7;
	Tue, 11 Feb 2025 09:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739266049;
	bh=yjRL57La7+E9GoG6/dJBw79jGho0USNqZcA1Gd268Bg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XpMx7IkHqM1cBAKfHgpQ3xSHDnUhcpy7MicnaBcgAyfYfv/ixX0OICm+3HucZGKBZ
	 8QwbhRKl0ogJBeKtViVddlIsUAI4ONXj6DZLdPAc7SGz20pASEUnBQlsZtnOzBZcAa
	 0PSCp3ldJHJD3AYokk+L4CAoY5/Dfs6TC7M+kSIeNSTIqBLWcZl7VLUOamYgZoAP0l
	 d5CRsFkRV9RLLqHzWlSmGBbw12Swbi67dhNve5Xk/OTQe/E+81JvHD5m1BHpyKqLWo
	 U6imMe/v6FRUuABVROyKOkYgHIYWkMW8Qo2mRIhE1x+qjiHl7PRVqTXnq9N7qt3Z7I
	 mjxMY96YDG3Rg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1thmYK-000000007DE-1Rsl;
	Tue, 11 Feb 2025 10:27:37 +0100
Date: Tue, 11 Feb 2025 10:27:36 +0100
From: Johan Hovold <johan@kernel.org>
To: Tony Chung <tony467913@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 2/6] drivers: usb: serial: mos7840: Fix Block comments
 coding style warnings
Message-ID: <Z6sYCJEsTDth_Nld@hovoldconsulting.com>
References: <202410250141.AEkzzW60-lkp@intel.com>
 <20241025061711.198933-3-tony467913@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025061711.198933-3-tony467913@gmail.com>

On Fri, Oct 25, 2024 at 02:17:10PM +0800, Tony Chung wrote:
> fix block comments coding style warnings.
> 1. Block comments use * on subsequent lines
> 2. Block comments use a trailing */ on a separate line

Just say something like:

	Clean up the style of the block comments.

or similar.

> Signed-off-by: Tony Chung <tony467913@gmail.com>
> ---
>  drivers/usb/serial/mos7840.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/serial/mos7840.c b/drivers/usb/serial/mos7840.c
> index dcaed0f26..b1a794f99 100644
> --- a/drivers/usb/serial/mos7840.c
> +++ b/drivers/usb/serial/mos7840.c
> @@ -282,7 +282,8 @@ static int mos7840_set_uart_reg(struct usb_serial_port *port, __u16 reg,
>  	struct usb_device *dev = port->serial->dev;
>  	val = val & 0x00ff;
>  	/* For the UART control registers, the application number need
> -	   to be Or'ed */
> +	 * to be Or'ed
> +	 */
>  	if (port->serial->num_ports == 2 && port->port_number != 0)
>  		val |= ((__u16)port->port_number + 2) << 8;
>  	else
> @@ -1539,8 +1540,9 @@ static int mos7840_port_probe(struct usb_serial_port *port)
>  	int pnum;
>  	__u16 Data;
>  
> -	/* we set up the pointers to the endpoints in the mos7840_open *
> -	 * function, as the structures aren't created yet.             */
> +	/* we set up the pointers to the endpoints in the mos7840_open

This style is only valid in networking code; the format for block
comments should generally be:

	/*
	 * ...
	 */
	 
> +	 * function, as the structures aren't created yet.
> +	 */
>  
>  	pnum = port->port_number;
>  
> @@ -1551,14 +1553,16 @@ static int mos7840_port_probe(struct usb_serial_port *port)
>  
>  	/* Initialize all port interrupt end point to port 0 int
>  	 * endpoint. Our device has only one interrupt end point
> -	 * common to all port */
> +	 * common to all port
> +	 */
>  
>  	mos7840_port->port = port;
>  	spin_lock_init(&mos7840_port->pool_lock);
>  
>  	/* minor is not initialised until later by
>  	 * usb-serial.c:get_free_serial() and cannot therefore be used
> -	 * to index device instances */
> +	 * to index device instances
> +	 */
>  	mos7840_port->port_num = pnum + 1;
>  	dev_dbg(&port->dev, "port->minor = %d\n", port->minor);
>  	dev_dbg(&port->dev, "mos7840_port->port_num = %d\n", mos7840_port->port_num);
> @@ -1591,7 +1595,8 @@ static int mos7840_port_probe(struct usb_serial_port *port)
>  		dev_dbg(&port->dev, "ControlReg Reading success val is %x, status%d\n", Data, status);
>  	Data |= 0x08;	/* setting driver done bit */
>  	Data |= 0x04;	/* sp1_bit to have cts change reflect in
> -			   modem status reg */
> +			 * modem status reg
> +			 */

Just drop the new line, this can be an exception to the 80 char rule if
you can't find a good way to rephrase this.

>  	/* Data |= 0x20; //rx_disable bit */
>  	status = mos7840_set_reg_sync(port,

Johan
