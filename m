Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A7C247291;
	Sat, 28 Jun 2025 14:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751122479; cv=none; b=UOAER+LCR27Vo51NgpdiYbQWswDMrxYMnD9zCV8MzgbKYFhOy/Eeg0m0WiyeU3i4yAAthsrKpggAF7mF7NQLRqyVNZR1UzkblNdcCqWKZJg23RlKKn0zeCRaUC0fO50FvW/yK6Kkx4w1c73CL66QRy2CpfQfn9owyFPnqY4ccnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751122479; c=relaxed/simple;
	bh=Aj+/ns36tbt/Z76fsAuEiVmykGmRcZ9L8AfHcCxkWOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bEpDoqS13SZOJE+SLc1XU9Kp+VY+b16l29YBIOpi6/MoCtSrkT9QTcym8vkA+JKiHisiYwF32Ch4uTs27B9ajya3pYTc4XQEw67uQOuPIJCN2va90MDveM1magkTbvLr9XugKqtc/ORjVj4Jy1L47tMF2+e+QNlh4M1UG4HqHH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=R+TtNdQv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="R+TtNdQv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1241BC4CEEA;
	Sat, 28 Jun 2025 14:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751122478;
	bh=Aj+/ns36tbt/Z76fsAuEiVmykGmRcZ9L8AfHcCxkWOU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R+TtNdQvfARRqoPrm8weDJG787f2s4asB6HneccuByWzTW9mclav7rPMsG2bDiCWh
	 33jw2fHHl34tri6W1pOAD4P04zWT45DX3akwFX05GnAEtQBgSuKW77Y+4JWahmsckL
	 MAV0spAVaD/IkgIO1+ngG2kXPJXPdbB1+5igMmM0=
Date: Sat, 28 Jun 2025 16:54:36 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Abinash Singh <abinashlalotra@gmail.com>
Cc: oneukum@suse.com, abinashsinghlalotra@gmail.com, johan@kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: serial: usb_wwan: Fix data races by protecting
 dtr/rts state with a mutex
Message-ID: <2025062815-uninsured-twentieth-c41c@gregkh>
References: <f2419bb9-2d81-4a6d-838d-b404e3ce7786@suse.com>
 <20250626153156.50131-1-abinashsinghlalotra@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626153156.50131-1-abinashsinghlalotra@gmail.com>

On Thu, Jun 26, 2025 at 09:01:56PM +0530, Abinash Singh wrote:
> Fix two previously noted locking-related issues in usb_wwan by introducing
> a mutex to serialize access to the shared `rts_state` and `dtr_state`
> fields in `struct usb_wwan_port_private`.
> 
> - In `usb_wwan_dtr_rts()`, the fields are now updated under the new
>   `portdata->lock` to prevent concurrent access.
> - In `usb_wwan_tiocmset()`, the same lock is used to protect both updates
>   to the modem control lines and the subsequent `usb_wwan_send_setup()`
>   call.
> 
> The mutex is initialized during `usb_wwan_port_probe()` when the port
> private data is allocated. This ensures consistent state and avoids
> data races when multiple threads attempt to modify control line state.
> 
> This change resolves the two old `FIXME` comments and improves thread
> safety for modem control signal handling.

How was this tested?

> 
> Signed-off-by: Abinash Singh <abinashsinghlalotra@gmail.com>
> ---
> Thank You very much for your feedback .
> You don't have to say sorry , your feedback
> is valueable for me.
> 
> 
> v2 :
> 	initialized the mutex during probing
> 	droping lock after returning from usb_wwan_send_setup()

You didn't list "v2" in the subject line, which makes this hard for our
tools to track (and for you to track as well!)



> 
> Regards
> Abinash
> ---
>  drivers/usb/serial/usb-wwan.h |  1 +
>  drivers/usb/serial/usb_wwan.c | 12 ++++++++----
>  2 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/serial/usb-wwan.h b/drivers/usb/serial/usb-wwan.h
> index 519101945769..e8d042d9014f 100644
> --- a/drivers/usb/serial/usb-wwan.h
> +++ b/drivers/usb/serial/usb-wwan.h
> @@ -59,6 +59,7 @@ struct usb_wwan_port_private {
>  	int ri_state;
>  
>  	unsigned long tx_start_time[N_OUT_URB];
> +	struct mutex lock;

You might want to document what this lock is for somewhere, right?

>  };
>  
>  #endif /* __LINUX_USB_USB_WWAN */
> diff --git a/drivers/usb/serial/usb_wwan.c b/drivers/usb/serial/usb_wwan.c
> index 0017f6e969e1..cd80fbd1dc6f 100644
> --- a/drivers/usb/serial/usb_wwan.c
> +++ b/drivers/usb/serial/usb_wwan.c
> @@ -80,11 +80,12 @@ void usb_wwan_dtr_rts(struct usb_serial_port *port, int on)
>  		return;
>  
>  	portdata = usb_get_serial_port_data(port);
> -	/* FIXME: locking */
> +	mutex_lock(&portdata->lock);
>  	portdata->rts_state = on;
>  	portdata->dtr_state = on;
>  
>  	usb_wwan_send_setup(port);

You are sure it's ok to call a function while the lock is held?  Is it
now required?  If so, please add the proper static and runtime checking
for that.  If not, then it's going to get messy very quickly :(

> +	mutex_unlock(&portdata->lock);
>  }
>  EXPORT_SYMBOL(usb_wwan_dtr_rts);
>  
> @@ -113,6 +114,7 @@ int usb_wwan_tiocmset(struct tty_struct *tty,
>  	struct usb_serial_port *port = tty->driver_data;
>  	struct usb_wwan_port_private *portdata;
>  	struct usb_wwan_intf_private *intfdata;
> +	int ret;
>  
>  	portdata = usb_get_serial_port_data(port);
>  	intfdata = usb_get_serial_data(port->serial);
> @@ -120,7 +122,7 @@ int usb_wwan_tiocmset(struct tty_struct *tty,
>  	if (!intfdata->use_send_setup)
>  		return -EINVAL;
>  
> -	/* FIXME: what locks portdata fields ? */
> +	mutex_lock(&portdata->lock);
>  	if (set & TIOCM_RTS)
>  		portdata->rts_state = 1;
>  	if (set & TIOCM_DTR)
> @@ -130,7 +132,9 @@ int usb_wwan_tiocmset(struct tty_struct *tty,
>  		portdata->rts_state = 0;
>  	if (clear & TIOCM_DTR)
>  		portdata->dtr_state = 0;
> -	return usb_wwan_send_setup(port);
> +	ret = usb_wwan_send_setup(port);

Again, is this ok to hold a lock across?

> +	mutex_unlock(&portdata->lock);

Why not use the guard() style for all of this to make it simpler
overall?

thanks,

greg k-h
