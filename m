Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E7D25B1CB;
	Mon,  7 Jul 2025 08:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751878572; cv=none; b=r1n/c31BWfUdInzkzf2Wl9uAnNNyV478FjLLhx02LDZ5DOniAJiQUX+P3c16v3LlIimkoPrGZHCzDGiaGs7Wbe3VoB++tWe9yVDYMom0/eoi4KAEG6P5ezpcnqRKUzN9wfjAjzXyPxlsVK1srjP5FbXcOGQH+IrfGC7ZjOhnnos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751878572; c=relaxed/simple;
	bh=SOeB2ivJPIC0WQ2vqmociMUqoGvzw0NEeF95O7atMHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DGfsmMb0r+cA68SuYWQMSKFK6BIEja24Y6nR7toCZvf0EMeVpYADUXl99++80dn/Ty6tDM7NTLFqOCKOsirZI7+cyyYGNTdsc1EWTgt508Yzkx3skI24mA+4Gj6NFRlW4tNeOZir7lY4w2tfS0tX2JtEKVnUh+HSIlSuDXkl5mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UZKq+XPj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UZKq+XPj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08088C4CEE3;
	Mon,  7 Jul 2025 08:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751878571;
	bh=SOeB2ivJPIC0WQ2vqmociMUqoGvzw0NEeF95O7atMHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UZKq+XPjT8amFLCEXmbZYfmM9UM2sFle0P7xwpvUSwHHJ+DX0FP1BukqKQkmh2w5u
	 7itZidU1WuyV3FeCE3OFKFy+woszdvI0D5Mos/bv2BjvIJYYT5yf8+nbAUDq/SMcAN
	 IfxcAfqLjsBVEUZf3mZES4BwSkdP5w/peaGdxdv0=
Date: Mon, 7 Jul 2025 10:56:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Abinash Singh <abinashlalotra@gmail.com>
Cc: abinashsinghlalotra@gmail.com, johan@kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	oneukum@suse.com
Subject: Re: [PATCH v2] usb: serial: usb_wwan: Fix data races by protecting
 dtr/rts state with a mutex
Message-ID: <2025070759-reach-facelift-f562@gregkh>
References: <2025062815-uninsured-twentieth-c41c@gregkh>
 <20250701214543.981626-1-abinashsinghlalotra@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250701214543.981626-1-abinashsinghlalotra@gmail.com>

On Wed, Jul 02, 2025 at 03:15:32AM +0530, Abinash Singh wrote:
> The rts_state and dtr_state fields in usb_wwan were updated without
> any locking, which could lead to data races if accessed from multiple
> threads.
> 
> Fixes proper locking using guard(mutex) to ensure
> safe access to these shared fields. To avoid holding the lock during
> USB control message transmission, the values are passed explicitly
> to usb_wwan_send_setup().
> 
> This resolves two previously marked FIXME comments and improves
> the thread safety of modem control line handling.
> 
> Signed-off-by: Abinash Singh <abinashsinghlalotra@gmail.com>
> ---
> v2:
> - I missed the "v2" tag in the subject line earlier — added now, sorry about that.
> - Regarding the concern about locking while calling functions: I was unsure if
>   it’s safe to hold the lock across `usb_wwan_send_setup()`, since it may block.
>   To be safe, I’ve changed the function to take `rts_state` and `dtr_state` as
>   arguments, so it no longer accesses shared state directly.
> - I’ve now used `guard(mutex)` so the lock will automatically release when
>   `portdata` goes out of scope.
> 
>    Is this the correct way to use gaurd if we don't want the lock held during
>    usb_wwan_send_setup() ?
> 
> > How was this tested?
> 
> I haven’t been able to test this patch due to lack of hardware access. If you
> have any suggestions on how to test this kind of change without actual hardware,
> I’d appreciate your guidance.
> 
> Thanks for the feedback!
> ---
>  drivers/usb/serial/usb-wwan.h |  1 +
>  drivers/usb/serial/usb_wwan.c | 29 ++++++++++++++++-------------
>  2 files changed, 17 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/usb/serial/usb-wwan.h b/drivers/usb/serial/usb-wwan.h
> index 519101945769..5a990fc2e140 100644
> --- a/drivers/usb/serial/usb-wwan.h
> +++ b/drivers/usb/serial/usb-wwan.h
> @@ -59,6 +59,7 @@ struct usb_wwan_port_private {
>  	int ri_state;
>  
>  	unsigned long tx_start_time[N_OUT_URB];
> +	struct mutex lock;  /* protects rts_state and dtr_state */
>  };
>  
>  #endif /* __LINUX_USB_USB_WWAN */
> diff --git a/drivers/usb/serial/usb_wwan.c b/drivers/usb/serial/usb_wwan.c
> index 0017f6e969e1..042d63aa8ec6 100644
> --- a/drivers/usb/serial/usb_wwan.c
> +++ b/drivers/usb/serial/usb_wwan.c
> @@ -38,19 +38,16 @@
>   * Generate DTR/RTS signals on the port using the SET_CONTROL_LINE_STATE request
>   * in CDC ACM.
>   */
> -static int usb_wwan_send_setup(struct usb_serial_port *port)
> +static int usb_wwan_send_setup(struct usb_serial_port *port, int rts_state, int dtr_state)
>  {
>  	struct usb_serial *serial = port->serial;
> -	struct usb_wwan_port_private *portdata;
>  	int val = 0;
>  	int ifnum;
>  	int res;
>  
> -	portdata = usb_get_serial_port_data(port);
> -
> -	if (portdata->dtr_state)
> +	if (dtr_state)
>  		val |= USB_CDC_CTRL_DTR;
> -	if (portdata->rts_state)
> +	if (rts_state)
>  		val |= USB_CDC_CTRL_RTS;
>  
>  	ifnum = serial->interface->cur_altsetting->desc.bInterfaceNumber;
> @@ -80,11 +77,12 @@ void usb_wwan_dtr_rts(struct usb_serial_port *port, int on)
>  		return;
>  
>  	portdata = usb_get_serial_port_data(port);
> -	/* FIXME: locking */
> +	{
> +	guard(mutex)(&portdata->lock);

This use of a { } without indenting the code is not good, and should
have given you a coding style error, right?

Also, if you don't have the hardware to test this with, I wouldn't
recommend working on adding locking without being able to verify it
works in some way.

thanks,

greg k-h
