Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37761EF0A9;
	Tue, 11 Feb 2025 09:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739265627; cv=none; b=Uqg4aWAJSH4h2FTrXJPXgscAvTLWRaHXS2UJWGJpGwhJni1bCajEh3YEFJBexdV2hDZ8Movyqm0zmrx9AfFkX7EBfc/7agFmWYYDfnsBVUZeaJC9uICgNrMAKCXwuU49o9Vud1OunWJ5I0xvqzRQsKrsgvxDMouBZKeGOgDDLgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739265627; c=relaxed/simple;
	bh=Enmx1Mf91eumUny/Nv+BlPDXt1VJTfSVWeEc5f9YmQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IOk6Ew62Y0y34FWc3u2TjFptnEfsdKlIORJu37PA8Etns6/o+IfIlm59YCtWh1JhWWNqeYoiA2sb90JrZI6MxZHq/job4Qirx+WwLFDaNw0cQXcvk+VkkdWm0XCsaf1UodOdKWr+OE+0ZGi4qOrfXZ24GMYxVSaSBd3nC4CJ/7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CTjPQ0jg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CTjPQ0jg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA488C4CEDD;
	Tue, 11 Feb 2025 09:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739265626;
	bh=Enmx1Mf91eumUny/Nv+BlPDXt1VJTfSVWeEc5f9YmQg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CTjPQ0jgJgEc4Htsy8I1lnt3GKb2A58obbIC0LR0UDesS0w6yhL7bCvn33El9lN86
	 j869lGuovprb6b/X0Fr6wR5hQ4+scN/JevXZe43DHHohJ8U9cInHDw14LC8y5OjAXe
	 1QgJIGHdbn50mIhYiQK9nViCuH/Zb36zQtyhYCSxlSj9z6tllA00uWtJ3g+pohRmn1
	 Gk0Mj++tfvgANTYJvzwBVJqY3psx13tVrZ7/7om+98+nDl5JTeE7adWTq1u+EKZJb9
	 03GC76cK659cagthnyYDhqd9LZyHMx1Ed/3UXX5zC62s9+A2ggv+icvapQivruxzwL
	 vLi3LGTJoEoxg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1thmRV-0000000075f-33d3;
	Tue, 11 Feb 2025 10:20:33 +0100
Date: Tue, 11 Feb 2025 10:20:33 +0100
From: Johan Hovold <johan@kernel.org>
To: Tony Chung <tony467913@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 1/6] driver: usb: serial: mos7840: fix style warnings
Message-ID: <Z6sWYSYbNNm7-jcn@hovoldconsulting.com>
References: <202410250141.AEkzzW60-lkp@intel.com>
 <20241025061711.198933-2-tony467913@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025061711.198933-2-tony467913@gmail.com>

On Fri, Oct 25, 2024 at 02:17:08PM +0800, Tony Chung wrote:
> fix "no space before tabs" coding style warnings.

Perhaps rephrase as:

	Replace spaces before tabs, which some editors and pagers
	highlight as errors.

Getting rid of those red higlights I see in vim should be motivation
enough here (again, as you're doing other changes to the driver).
 
> Signed-off-by: Tony Chung <tony467913@gmail.com>
> ---
>  drivers/usb/serial/mos7840.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/serial/mos7840.c b/drivers/usb/serial/mos7840.c
> index ca3da79af..dcaed0f26 100644
> --- a/drivers/usb/serial/mos7840.c
> +++ b/drivers/usb/serial/mos7840.c
> @@ -220,7 +220,7 @@ struct moschip_port {
>  
>  /*
>   * mos7840_set_reg_sync
> - * 	To set the Control register by calling usb_fill_control_urb function
> + *	To set the Control register by calling usb_fill_control_urb function
>   *	by passing usb_sndctrlpipe function as parameter.
>   */
>  
> @@ -238,7 +238,7 @@ static int mos7840_set_reg_sync(struct usb_serial_port *port, __u16 reg,
>  
>  /*
>   * mos7840_get_reg_sync
> - * 	To set the Uart register by calling usb_fill_control_urb function by
> + *	To set the Uart register by calling usb_fill_control_urb function by
>   *	passing usb_rcvctrlpipe function as parameter.
>   */
>  
> @@ -1356,11 +1356,11 @@ static void mos7840_set_termios(struct tty_struct *tty,
>   * mos7840_get_lsr_info - get line status register info
>   *
>   * Purpose: Let user call ioctl() to get info when the UART physically
> - * 	    is emptied.  On bus types like RS485, the transmitter must
> - * 	    release the bus after transmitting. This must be done when
> - * 	    the transmit shift register is empty, not be done when the
> - * 	    transmit holding register is empty.  This functionality
> - * 	    allows an RS485 driver to be written in user space.
> + *	is emptied.  On bus types like RS485, the transmitter must
> + *	release the bus after transmitting. This must be done when
> + *	the transmit shift register is empty, not be done when the
> + *	transmit holding register is empty.  This functionality
> + *	allows an RS485 driver to be written in user space.

But perhaps you should keep the indentation here (all lines are aligned
under "Let") as the author intended.

Johan
