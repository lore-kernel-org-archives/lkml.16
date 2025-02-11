Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9176326BDA9;
	Tue, 11 Feb 2025 10:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739268991; cv=none; b=k18+xAONuCfaiWOC3tZoT0WJmqYIEn8xmJRLfVbDvRyqiv7PHvdtAzuX7Lxfw6Wj8kDyflzkocmkaXrkZI3gp5LRLVKeriB41QjoAvCg56sXX7sj6xZ6BPUZ9Sno5BqYN8TqkGDr/3++QDNrAihHO1vggpnJN4aijDL+y2eaN4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739268991; c=relaxed/simple;
	bh=h3BpfPvrJQaNAd4htfrP3ddn5ZRvJlMFCTVdibd03eE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z/QJO1oer/VurNPk8BMm9TKsRvFE2iIRdSZLeaY/KURwluj6VLBxI1q1tEcjsE8IaiH22nK0fnQuar9J9b/HM633+MC5o6DqxKyOZAyjqc/0vh3ekqt9iRPhVy4bJD3K+qtGjD/Uk6kUwylUfoQxa8Kk3pMbrEAaT0a6mpMe7hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NALsp+xe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NALsp+xe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15FD0C4CEDD;
	Tue, 11 Feb 2025 10:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739268991;
	bh=h3BpfPvrJQaNAd4htfrP3ddn5ZRvJlMFCTVdibd03eE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NALsp+xe8cw09a+xtwajFCSr2ztu+oNoi98SVZ/zsb1RSATuTlI9Yjivn0FXa5Dip
	 HyWtk2xTvpHFB9+/PyLmjTcObhbQByQpSfFN/MFesVOLwCJJc3ZReeSkPjdLXZfLC7
	 KE4ytkgguda7cDlDcOSA1QiXdQwaeNhC6W1ivw77m0srgLgJ3sQqDXDcyQ5MJ71CuI
	 nSg8jHrlxqyR3gG3ydZqqmF3tSaG5jul8k/42QhdzLcrnwUNJGPNGq38qceldHBPYc
	 kfeatPvjpfJ6iQib7G9IyI1tWK4CO8g5nS5AWTU/zmzfXlTtwah27zdMaEP2p4Hu7/
	 6f/rzFuKMhDdA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1thnJl-000000008A7-3BGl;
	Tue, 11 Feb 2025 11:16:38 +0100
Date: Tue, 11 Feb 2025 11:16:37 +0100
From: Johan Hovold <johan@kernel.org>
To: Tony Chung <tony467913@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/3] drivers: usb: serial: mos7840: added optimized
 register setups for common baudrates.
Message-ID: <Z6sjhS_1KY1jjdur@hovoldconsulting.com>
References: <20241024100901.69883-1-tony467913@gmail.com>
 <20241024100901.69883-3-tony467913@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024100901.69883-3-tony467913@gmail.com>

On Thu, Oct 24, 2024 at 06:09:03PM +0800, Tony Chung wrote:
> added optimized register setups for common baudrates.

First, how did you determine the base clocks here? Do you have access to
some documentation or did you just measure them?

These are all derived from the internal PLL IIUC?

> Signed-off-by: Tony Chung <tony467913@gmail.com>
> ---
>  drivers/usb/serial/mos7840.c | 114 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 111 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/serial/mos7840.c b/drivers/usb/serial/mos7840.c
> index 362875a53..acc16737b 100644
> --- a/drivers/usb/serial/mos7840.c
> +++ b/drivers/usb/serial/mos7840.c
> @@ -1063,11 +1063,116 @@ static int mos7840_calc_baud_rate_divisor(struct usb_serial_port *port,
>  {
>  	dev_dbg(&port->dev, "%s - %d\n", __func__, baudRate);
>  
> -	if (baudRate <= 115200) {
> +	// divisor = (256*DLM)+DLL
> +	// baudrate = InputCLK/(16*Divisor)

Style nit: Please avoid using c99 comments (here and below), just use a
block comment here and add spaces around the operators.

> +	if (baudRate == 50) {
> +		*divisor = (256*0x09)+0x04; // DLM=0x09, DLL=0x04
> +		*clk_sel_val = 0x0;	    // clock source = 1.846153846M
> +	} else if (baudRate == 75) {
> +		*divisor = (256*0x06)+0x02; // DLM=0x06, DLL=0x02
> +		*clk_sel_val = 0x0;	    // clock source = 1.846153846M
> +	} else if (baudRate == 110) {
> +		*divisor = (256*0x04)+0x19; // DLM=0x04, DLL=0x19
> +		*clk_sel_val = 0x0;	    // clock source = 1.846153846M
> +	} else if (baudRate == 134) {
> +		*divisor = (256*0x03)+0x5d; // DLM=0x03, DLL=0x5d
> +		*clk_sel_val = 0x0;	    // clock source = 1.846153846M
> +	} else if (baudRate == 150) {
> +		*divisor = (256*0x03)+0x01; // DLM=0x03, DLL=0x01
> +		*clk_sel_val = 0x0;	    // clock source = 1.846153846M
> +	} else if (baudRate == 300) {
> +		*divisor = (256*0x01)+0x81; // DLM=0x01, DLL=0x81
> +		*clk_sel_val = 0x0;	    // clock source = 1.846153846M
> +	} else if (baudRate == 600) {
> +		*divisor = 0xc0;		// DLM=0, DLL=0xc0
> +		*clk_sel_val = 0x0;		// clock source = 1.846153846M
> +	} else if (baudRate == 1200) {
> +		*divisor = 0x60;		// DLM=0, DLL=0x60
> +		*clk_sel_val = 0x0;		// clock source = 1.846153846M
> +	} else if (baudRate == 1800) {
> +		*divisor = 0x40;		// DLM=0, DLL=0x40
> +		*clk_sel_val = 0x0;		// clock source = 1.846153846M
> +	} else if (baudRate == 2400) {
> +		*divisor = 0x30;		// DLM=0, DLL=0x30
> +		*clk_sel_val = 0x0;		// clock source = 1.846153846M
> +	} else if (baudRate == 4800) {
> +		*divisor = 0x18;		// DLM=0, DLL=0x18
> +		*clk_sel_val = 0x0;		// clock source = 1.846153846M
> +	} else if (baudRate == 7200) {
> +		*divisor = 0x10;		// DLM=0, DLL=0x10
> +		*clk_sel_val = 0x0;		// clock source = 1.846153846M
> +	} else if (baudRate == 9600) {
> +		*divisor = 0x0c;		// DLM=0, DLL=0x0c
> +		*clk_sel_val = 0x0;		// clock source = 1.846153846M
> +	} else if (baudRate == 14400) {
> +		*divisor = 0x08;		// DLM=0, DLL=0x08
> +		*clk_sel_val = 0x0;		// clock source = 1.846153846M
> +	} else if (baudRate == 19200) {
> +		*divisor = 0x06;		// DLM=0, DLL=0x06
> +		*clk_sel_val = 0x0;		// clock source = 1.846153846M
> +	} else if (baudRate == 28800) {
> +		*divisor = 0x04;		// DLM=0, DLL=0x04
> +		*clk_sel_val = 0x0;		// clock source = 1.846153846M
> +	} else if (baudRate == 38400) {
> +		*divisor = 0x03;		// DLM=0, DLL=0x03
> +		*clk_sel_val = 0x0;		// clock source = 1.846153846M
> +	} else if (baudRate == 57600) {
> +		*divisor = 0x02;		// DLM=0, DLL=0x02
> +		*clk_sel_val = 0x0;		// clock source = 1.846153846M
> +	} else if (baudRate == 115200) {
> +		*divisor = 0x01;		// DLM=0, DLL=0x01
> +		*clk_sel_val = 0x0;		// clock source = 1.846153846M
> +	} else if (baudRate == 230400) {
> +		*divisor = 0x01;		// DLM=0, DLL=0x01
> +		*clk_sel_val = 0x10;	// clock source = 3.692307692M
> +	} else if (baudRate == 460800) {
> +		*divisor = 0x01;		// DLM=0, DLL=0x01
> +		*clk_sel_val = 0x30;	// clock source = 7.384615384M
> +	} else if (baudRate == 806400) {
> +		*divisor = 0x01;		// DLM=0, DLL=0x01
> +		*clk_sel_val = 0x40;	// clock source = 12.923076922M
> +	} else if (baudRate == 921600) {
> +		*divisor = 0x01;		// DLM=0, DLL=0x01
> +		*clk_sel_val = 0x50;	// clock source = 14.769230768M
> +	} else if (baudRate == 25000) {
> +		*divisor = 0x78;		// DLM=0, DLL=0x78
> +		*clk_sel_val = 0x70;	// clock source=48M
> +	} else if (baudRate == 50000) {
> +		*divisor = 0x3c;		// DLM=0, DLL=0x3c
> +		*clk_sel_val = 0x70;	// clock source=48M
> +	} else if (baudRate == 75000) {
> +		*divisor = 0x28;		// DLM=0, DLL=0x28
> +		*clk_sel_val = 0x70;	// clock source=48M
> +	} else if (baudRate == 100000) {
> +		*divisor = 0x1e;		// DLM=0, DLL=0x1e
> +		*clk_sel_val = 0x70;	// clock source=48M
> +	} else if (baudRate == 250000) {
> +		*divisor = 0x0c;		// DLM=0, DLL=0x0c
> +		*clk_sel_val = 0x70;	// clock source=48M
> +	} else if (baudRate == 300000) {
> +		*divisor = 0x0a;		// DLM=0, DLL=0x0a
> +		*clk_sel_val = 0x70;	// clock source=48M
> +	} else if (baudRate == 500000) {
> +		*divisor = 0x06;		// DLM=0, DLL=0x06
> +		*clk_sel_val = 0x70;	// clock source=48M
> +	} else if (baudRate == 600000) {
> +		*divisor = 0x05;		// DLM=0, DLL=0x05
> +		*clk_sel_val = 0x70;	// clock source=48M
> +	} else if (baudRate == 1000000) {
> +		*divisor = 0x03;		// DLM=0, DLL=0x03
> +		*clk_sel_val = 0x70;	// clock source=48M
> +	} else if (baudRate == 3000000) {
> +		*divisor = 0x01;		// DLM=0, DLL=0x01
> +		*clk_sel_val = 0x70;	// clock source=48M
> +
> +	} else if (baudRate == 1500000) {
> +		*divisor = 0x01;		// DLM=0, DLL=0x01
> +		*clk_sel_val = 0x60;	// clock source=24M
> +

You should be able to determine at least most of the above by just
calculating the divisors from the base clocks. Perhaps you need a lookup
table as well to determine which base to use in some cases too.

Note sure we need to add non-standard rates like 25000 etc either.

> +	} else if (baudRate <= 115200) {
>  		*divisor = 115200 / baudRate;
>  		*clk_sel_val = 0x0;
> -	}
> -	if ((baudRate > 115200) && (baudRate <= 230400)) {
> +	} else if ((baudRate > 115200) && (baudRate <= 230400)) {
>  		*divisor = 230400 / baudRate;
>  		*clk_sel_val = 0x10;
>  	} else if ((baudRate > 230400) && (baudRate <= 403200)) {
> @@ -1088,6 +1193,9 @@ static int mos7840_calc_baud_rate_divisor(struct usb_serial_port *port,
>  	} else if ((baudRate > 1572864) && (baudRate <= 3145728)) {
>  		*divisor = 3145728 / baudRate;
>  		*clk_sel_val = 0x70;
> +	} else {
> +		dev_dbg(&port->dev, "func: %s -baudrate %d not supported.\n", __func__, baudRate);

Here you could drop "func: %s -" and the period, if you need this at
all.

> +		return -1;

The calling code does not check for errors, so either fix that or,
better still, make sure the function always returns a valid divisor
(e.g. by making sure the input rate is always valid).

>  	}
>  	return 0;
>  }

Johan
