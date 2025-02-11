Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB426206F02;
	Tue, 11 Feb 2025 13:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739279284; cv=none; b=D4zHX5oEE0zUluuJ6XvYXu327Zq8lZAGaJ7DzoobfBvPHRch91Zzxe2H3Po9N/Q6P5Zwuq4Iaf+9pLyj/har9YABI3AhMKpkYnISdc1rRdc1P7F11RkTXrMlo2Bjb5c6m+DptFmaOJVFncV5Z1qVxP5TwwdUULCqZEDewWSvp1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739279284; c=relaxed/simple;
	bh=KPYi1A3O/sh8s8numOmFmpRAC1Ro6cWCm+dP4Ba7dvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zv5XphQ7BJDECjsKMaVs56bKEmkGPXJ24Aj3+1Jzpd6L7Sq02RrDsa0fiD7qvpsimLk9WrJV16geY7VkaeHP4UYAIVx4lCd9MFkxgDG0/7fJtVnROUi2ijDUXZ3FPjx1bUeNYiDCza2kcJ5N1a3kYcN6veMvTATeSSRGyx/mvP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MkYLkKb9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MkYLkKb9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 327B7C4CEDD;
	Tue, 11 Feb 2025 13:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739279283;
	bh=KPYi1A3O/sh8s8numOmFmpRAC1Ro6cWCm+dP4Ba7dvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MkYLkKb9BZZyO58GPRBkBIpVW0ejN2pewkAe1+uEtw/P/+EY0zVXKxyHCLeMdGgU+
	 VxyKqGlphdSDmfkmMDO424aNvPz+7oLe3lbfw1D7wO/EzEFPg3nieywXdcQkdO9WiU
	 ira2IcVN61+g8PeNMc1T0D9QlH6xDcb9N9E//6q+X79Lj1XZg1FLSDil+sV0c/6hOC
	 VqDlHUI4Cy2wCSQWSFQ5MllQiAe6MoaD6uW5+1DLluWkuRSXtttVh9PqthVccDwpYk
	 YzSYpMuUnuXkq+V5Za4ZXjeawpW3f1FkmjApe9++SSE0JR5190yDne0TWkdIL1VWDk
	 Pom+JlQ/MyvBg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1thpzm-000000006n6-0Qvz;
	Tue, 11 Feb 2025 14:08:10 +0100
Date: Tue, 11 Feb 2025 14:08:10 +0100
From: Johan Hovold <johan@kernel.org>
To: Tony Chung <tony467913@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 3/3] driver: usb: serial: mos7840: add more baudrate
 options
Message-ID: <Z6tLuiw7eK5s4Agq@hovoldconsulting.com>
References: <20241024100901.69883-1-tony467913@gmail.com>
 <20241024100901.69883-4-tony467913@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024100901.69883-4-tony467913@gmail.com>

On Thu, Oct 24, 2024 at 06:09:05PM +0800, Tony Chung wrote:
> Adds more baud rate options using 96M/30M/External clock sources.
> To use these clock sources,
> set through Clk_Select_Reg1 and Clk_Select_Reg2.
> 
> Signed-off-by: Tony Chung <tony467913@gmail.com>
> ---
>  drivers/usb/serial/mos7840.c | 156 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 155 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/serial/mos7840.c b/drivers/usb/serial/mos7840.c
> index acc16737b..70ee4a638 100644
> --- a/drivers/usb/serial/mos7840.c
> +++ b/drivers/usb/serial/mos7840.c
> @@ -1169,6 +1169,37 @@ static int mos7840_calc_baud_rate_divisor(struct usb_serial_port *port,
>  		*divisor = 0x01;		// DLM=0, DLL=0x01
>  		*clk_sel_val = 0x60;	// clock source=24M
>  
> +	/* below are using 96M or 30M clock source
> +	 * will determine the clock source later
> +	 * in function mos7840_send_cmd_write_baud_rate
> +	 */

Block comment style, also try to follow style of driver and capitalise
"Below".

That said, this one should not be needed after you add proper
abstractions for this. For example, instead of returning a raw
clk_sel_val you return an enum which you handle in the caller.

> +	} else if (baudRate == 6000000) {
> +		*divisor = 0x01;		// DLM=0, DLL=0x01
> +		*clk_sel_val = 0x80;	// DUMMY val, clock source = 96M
> +	} else if (baudRate == 2000000) {
> +		*divisor = 0x03;		// DLM=0, DLL=0x03
> +		*clk_sel_val = 0x80;	// DUMMY val, clock source = 96M

The above looks useful.

> +	} else if (baudRate == 403200) {
> +		*divisor = 0x0f;		// DLM=0, DLL=0x0f
> +		*clk_sel_val = 0x80;	// DUMMY val, clock source = 96M
> +	} else if (baudRate == 225000) {
> +		*divisor = 0x1b;		// DLM=0, DLL=0x1b
> +		*clk_sel_val = 0x80;	// DUMMY val, clock source = 96M
> +	} else if (baudRate == 153600) {
> +		*divisor = 0x27;		// DLM=0, DLL=0x27
> +		*clk_sel_val = 0x80;	// DUMMY val, clock source = 96M

But why would anyone use these?

> +	} else if (baudRate == 10000) {
> +		*divisor = 0xbb;		// DLM=0, DLL=0xbb
> +		*clk_sel_val = 0x80;	// DUMMY val, clock source = 30M
> +	} else if (baudRate == 125000) {
> +		*divisor = 0x0f;		// DLM=0, DLL=0x0f
> +		*clk_sel_val = 0x80;	// DUMMY val, clock source = 30M
> +	} else if (baudRate == 625000) {
> +		*divisor = 0x03;		// DLM=0, DLL=0x03
> +		*clk_sel_val = 0x80;	// DUMMY val, clock source = 30M

Or these?

In any case, these would probably also need to go in a lookup table.

> +
> +
>  	} else if (baudRate <= 115200) {
>  		*divisor = 115200 / baudRate;
>  		*clk_sel_val = 0x0;
> @@ -1246,11 +1277,134 @@ static int mos7840_send_cmd_write_baud_rate(struct moschip_port *mos7840_port,
>  
>  	}
>  
> -	if (1) {		/* baudRate <= 115200) */
> +	if (1) {

Probably a good time to get rid of this in a preparatory patch to reduce
the indentation.

>  		clk_sel_val = 0x0;
>  		Data = 0x0;
>  		status = mos7840_calc_baud_rate_divisor(port, baudRate, &divisor,
>  						   &clk_sel_val);
> +		if (status < 0) {
> +			dev_dbg(&port->dev, "%s failed in set_serial_baud\n", __func__);
> +			return -1;
> +		}

Ok, here you add the error handling. But as I mentioned it's better to
fix the caller so that it does not pass in a speed that too high for the
driver. Just keep the old rate and update the termios to reflect that
that requested rate was rejected.

> +
> +		/* Write clk_sel_val to SP_Reg or Clk_Select_Reg*/

Space before */

> +		// check clk_sel_val before setting the clk_sel_val

No c99 comments, please.

> +		if (clk_sel_val == 0x80) {
> +		// clk_sel_val is DUMMY value -> Write the corresponding value to Clk_Select_Reg

Odd indentation.

> +			// 0x01:30M, 0x02:96M, 0x05:External Clock

Ok, so here's the comment I asked for earlier. That should probably go
above the clock register defines, and/or with defines for these
constants added as well.

> +			if (baudRate == 125000 || baudRate == 625000 || baudRate == 10000) {
> +				clk_sel_val = 0x01;
> +			} else if (baudRate == 153600 || baudRate == 225000 || baudRate == 403200 ||
> +					baudRate == 2000000 || baudRate == 6000000) {
> +				clk_sel_val = 0x02;
> +			} else {
> +				clk_sel_val = 0x05; // externel clk for custom case.
> +			}

This needs to be cleaned up using a lookup table and a clk_sel enum.

If there are product that would benefit from using the external clock
input, this would need to be handled on a per-device basis so that we
know its frequency.

> +			// needs to set clock source through
> +			// Clk_Select_Reg1(offset 0x13) & Clk_Select_Reg2(offset 0x14)
> +			// Clk_Select_Reg1 for port1,2		Clk_Select_Reg2 for port3,4
> +			if (mos7840_port->port_num <= 2) {
> +				status = mos7840_get_reg_sync(port, CLOCK_SELECT_REG1, &Data);
> +				if (status < 0) {
> +					dev_dbg(&port->dev, "reading Clk_Select_Reg failed in set_serial_baud\n");

Looks like the driver is currently using dev_dbg() for errors, but this
should most likely be dev_err() throughout. No need to say in which
function it fails, just 
	
	failed to read clock select register: %d\n

or similar should do.

> +					return -1;
> +				}
> +				if (mos7840_port->port_num == 1) {
> +					Data = (Data & 0xf8) | clk_sel_val;
> +					status =
> +						mos7840_set_reg_sync(port, CLOCK_SELECT_REG1, Data);
> +				} else if (mos7840_port->port_num == 2) {
> +					Data = (Data & 0xc7) | (clk_sel_val<<3);

Spaces around binary operator throughout.

> +					status =
> +						mos7840_set_reg_sync(port, CLOCK_SELECT_REG1, Data);
> +				}
> +				if (status < 0) {
> +					dev_dbg(&port->dev, "setting Clk_Select_Reg failed\n");
> +					return -1;
> +				}
> +			} else if (mos7840_port->port_num <= 4) {
> +				status = mos7840_get_reg_sync(port, CLOCK_SELECT_REG2, &Data);
> +				if (status < 0) {
> +					dev_dbg(&port->dev, "reading Clk_Select_Reg failed in set_serial_baud\n");
> +					return -1;
> +				}
> +				if (mos7840_port->port_num == 3) {
> +					Data = (Data & 0xf8) | clk_sel_val;
> +					status =
> +						mos7840_set_reg_sync(port, CLOCK_SELECT_REG2, Data);
> +				} else if (mos7840_port->port_num == 4) {
> +					Data = (Data & 0xc7) | (clk_sel_val<<3);
> +					status =
> +						mos7840_set_reg_sync(port, CLOCK_SELECT_REG2, Data);
> +				}
> +				if (status < 0) {
> +					dev_dbg(&port->dev, "setting Clk_Select_Reg failed\n");
> +					return -1;
> +				}
> +			}

The above needs to be cleaned up and abstracted better too. It's hardly
readable currently and the patterns looks too similar to be repeated
like this (i.e. a helper function may be the right choice).

> +		} else {
> +		// clk_sel_val is not DUMMY value -> Write the corresponding value to SP_Reg
> +
> +			/* First, needs to write default value to
> +			 * Clk_Select_Reg1(offset 0x13) & Clk_Select_Reg2(offset 0x14)
> +			 * Clk_Select_Reg1 for port1,2		Clk_Select_Reg2 for port3,4
> +			 */
> +			if (mos7840_port->port_num <= 2) {
> +				status = mos7840_get_reg_sync(port, CLOCK_SELECT_REG1, &Data);
> +				if (status < 0) {
> +					dev_dbg(&port->dev, "reading Clk_Select_Reg failed in set_serial_baud\n");
> +					return -1;
> +				}
> +				if (mos7840_port->port_num == 1) {
> +					Data = (Data & 0xf8) | 0x00;
> +					status =
> +						mos7840_set_reg_sync(port, CLOCK_SELECT_REG1, Data);
> +				} else if (mos7840_port->port_num == 2) {
> +					Data = (Data & 0xc7) | (0x00<<3);
> +					status =
> +						mos7840_set_reg_sync(port, CLOCK_SELECT_REG1, Data);
> +				}
> +				if (status < 0) {
> +					dev_dbg(&port->dev, "setting Clk_Select_Reg failed\n");
> +					return -1;
> +				}
> +			} else if (mos7840_port->port_num <= 4) {
> +				status = mos7840_get_reg_sync(port, CLOCK_SELECT_REG2, &Data);
> +				if (status < 0) {
> +					dev_dbg(&port->dev, "reading Clk_Select_Reg failed in set_serial_baud\n");
> +					return -1;
> +				}
> +				if (mos7840_port->port_num == 3) {
> +					Data = (Data & 0xf8) | 0x00;
> +					status =
> +						mos7840_set_reg_sync(port, CLOCK_SELECT_REG2, Data);
> +				} else if (mos7840_port->port_num == 4) {
> +					Data = (Data & 0xc7) | (0x00<<3);
> +					status =
> +						mos7840_set_reg_sync(port, CLOCK_SELECT_REG2, Data);
> +				}
> +				if (status < 0) {
> +					dev_dbg(&port->dev, "setting Clk_Select_Reg failed\n");
> +					return -1;
> +				}
> +			}

This is the same code as above, just writing the default value. This
obviously needs to be refactored.

> +			// select clock source by writing clk_sel_val to SPx_Reg
> +			status = mos7840_get_reg_sync(port, mos7840_port->SpRegOffset,
> +									 &Data);
> +			if (status < 0) {
> +				dev_dbg(&port->dev, "reading spreg failed in set_serial_baud\n");
> +				return -1;
> +			}
> +			Data = (Data & 0x8f) | clk_sel_val;
> +			status = mos7840_set_reg_sync(port, mos7840_port->SpRegOffset,
> +									Data);
> +			if (status < 0) {
> +				dev_dbg(&port->dev, "Writing spreg failed in set_serial_baud\n");
> +				return -1;
> +			}
> +		}

Johan
