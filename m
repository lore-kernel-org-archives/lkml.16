Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A70FD528;
	Mon,  9 Jun 2025 00:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749427252; cv=none; b=GuYme31+5lon76fbQjTCSFYt4pWmeMaiTLImDZIu32hxjRAwLSUIhvVpn0Pd5oimXNOYQJv6JvR/qFe416ewF968Yb9a6HoFgo3nzR9WOsmiR3ZTJoa7wItkQBC7RrjOOqi+fEGdIVB9AD/VixRA21I0dhWLL5VmuwAzQgI2dbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749427252; c=relaxed/simple;
	bh=uuM5izvj/XnRQdh/BhX6Ts2GEjuL9/AlU1DPrp2Tw8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OSLRFTHjs6TiYLi8tH7qqWIWQLb5FaaxKZy4Dfkl8nKMl8oIZgw5bPSw9Pbkp4Z1/a9yBc9kZwnu5brZ9j6JUAhimYudgHE3OFDQ4/9SaxBEABS5gutOkgdGAcWdyU5bWtaxKBAQIPjBbDd5uoee6HR8ypBm7rLoV0PnZb6PyL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=jOHeHm6d; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jOHeHm6d"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=Lg7kReYkoTtDRNxZFaKTUsqHlGGWFcRB0L18kpt6j+U=; b=jOHeHm6dP0E3AMD0orVC5fLvWA
	3++rM0WLmpqjX7PtxuntXcRvkEjTEB+5gFdJIqBiGUYvCRrrNHC9361QbJ58jxPGL8pzCqKkNuZio
	pXY4KOV1hKTxZAnmApRmEJjNGlNit4riOegG3fAHzKxRTjTM4ZfjsFl7bF9X9GwDWUg4yMudEtobI
	vt0oQfTfWOMV0z3sies9a/C9GRKb4DfL3yItcqyOpwDh15Tythqq+evNbgXzb/eto4bjRplJ6lBg9
	ZxRBrHI5x92jH9Zdgw32pC9ux2P9rxUbLPFyHreTr1li2S1BheeZmMeUcjP2FwvmhCko8TSEDeXII
	L+4u5NUQ==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOPwU-00000007edu-2HIK;
	Mon, 09 Jun 2025 00:00:47 +0000
Message-ID: <f154dfd9-006a-43e0-9127-9f7f2e377027@infradead.org>
Date: Sun, 8 Jun 2025 17:00:43 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: core: Remove unused usb_unlink_anchored_urbs
To: linux@treblig.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250608235617.200731-1-linux@treblig.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250608235617.200731-1-linux@treblig.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/8/25 4:56 PM, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> usb_unlink_anchored_urbs() has been unused since it's last use was

s/it's/its/ (same in previous patch's description)

> removed in 2009 by
> commit 9b9c5aaeedfd ("ar9170: xmit code revamp")
> 
> Remove it.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  Documentation/driver-api/usb/anchors.rst | 11 ---------
>  drivers/usb/core/urb.c                   | 29 +++---------------------
>  include/linux/usb.h                      |  1 -
>  3 files changed, 3 insertions(+), 38 deletions(-)
> 
> diff --git a/Documentation/driver-api/usb/anchors.rst b/Documentation/driver-api/usb/anchors.rst
> index 4b248e691bd6..5a93d171e76c 100644
> --- a/Documentation/driver-api/usb/anchors.rst
> +++ b/Documentation/driver-api/usb/anchors.rst
> @@ -45,17 +45,6 @@ This function kills all URBs associated with an anchor. The URBs
>  are called in the reverse temporal order they were submitted.
>  This way no data can be reordered.
>  
> -:c:func:`usb_unlink_anchored_urbs`
> -----------------------------------
> -
> -
> -This function unlinks all URBs associated with an anchor. The URBs
> -are processed in the reverse temporal order they were submitted.
> -This is similar to :c:func:`usb_kill_anchored_urbs`, but it will not sleep.
> -Therefore no guarantee is made that the URBs have been unlinked when
> -the call returns. They may be unlinked later but will be unlinked in
> -finite time.
> -
>  :c:func:`usb_scuttle_anchored_urbs`
>  -----------------------------------
>  
> diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
> index 5e52a35486af..0e58a8531d6e 100644
> --- a/drivers/usb/core/urb.c
> +++ b/drivers/usb/core/urb.c
> @@ -597,10 +597,9 @@ EXPORT_SYMBOL_GPL(usb_submit_urb);
>   * code).
>   *
>   * Drivers should not call this routine or related routines, such as
> - * usb_kill_urb() or usb_unlink_anchored_urbs(), after their disconnect
> - * method has returned.  The disconnect function should synchronize with
> - * a driver's I/O routines to insure that all URB-related activity has
> - * completed before it returns.
> + * usb_kill_urb(), after their disconnect method has returned. The
> + * disconnect function should synchronize with a driver's I/O routines
> + * to insure that all URB-related activity has completed before it returns.
>   *
>   * This request is asynchronous, however the HCD might call the ->complete()
>   * callback during unlink. Therefore when drivers call usb_unlink_urb(), they
> @@ -890,28 +889,6 @@ void usb_unpoison_anchored_urbs(struct usb_anchor *anchor)
>  	spin_unlock_irqrestore(&anchor->lock, flags);
>  }
>  EXPORT_SYMBOL_GPL(usb_unpoison_anchored_urbs);
> -/**
> - * usb_unlink_anchored_urbs - asynchronously cancel transfer requests en masse
> - * @anchor: anchor the requests are bound to
> - *
> - * this allows all outstanding URBs to be unlinked starting
> - * from the back of the queue. This function is asynchronous.
> - * The unlinking is just triggered. It may happen after this
> - * function has returned.
> - *
> - * This routine should not be called by a driver after its disconnect
> - * method has returned.
> - */
> -void usb_unlink_anchored_urbs(struct usb_anchor *anchor)
> -{
> -	struct urb *victim;
> -
> -	while ((victim = usb_get_from_anchor(anchor)) != NULL) {
> -		usb_unlink_urb(victim);
> -		usb_put_urb(victim);
> -	}
> -}
> -EXPORT_SYMBOL_GPL(usb_unlink_anchored_urbs);
>  
>  /**
>   * usb_anchor_suspend_wakeups
> diff --git a/include/linux/usb.h b/include/linux/usb.h
> index 1b2545b4363b..e8662843e68c 100644
> --- a/include/linux/usb.h
> +++ b/include/linux/usb.h
> @@ -1780,7 +1780,6 @@ extern void usb_block_urb(struct urb *urb);
>  extern void usb_kill_anchored_urbs(struct usb_anchor *anchor);
>  extern void usb_poison_anchored_urbs(struct usb_anchor *anchor);
>  extern void usb_unpoison_anchored_urbs(struct usb_anchor *anchor);
> -extern void usb_unlink_anchored_urbs(struct usb_anchor *anchor);
>  extern void usb_anchor_suspend_wakeups(struct usb_anchor *anchor);
>  extern void usb_anchor_resume_wakeups(struct usb_anchor *anchor);
>  extern void usb_anchor_urb(struct urb *urb, struct usb_anchor *anchor);

-- 
~Randy
