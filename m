Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A29E236451;
	Fri,  7 Feb 2025 09:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738920920; cv=none; b=WrHWmZl+4pCq4+mQW1tcA3Uk6+koXs15bKq92jHgEDgByShuqS2iOn4fqb5l05rbm/oTR3DYwZbe7Kx4ltS4nP5b35MykUUACdERWXTL3VldhZyKnil5rTfUGbVqqgko/V5qwVXNusCWOw8sE1Mmq+mCkR4z5aULYmtFuvCxw50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738920920; c=relaxed/simple;
	bh=BQ6G7rgyFz/R8XkAhMbxsguKvT3vIKNZNcMTlSTb8AY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dnn5MAGEydDekQAegtg4kCBZ7Ue2K9jqTzlJKk8tPcIofiTiKVtJyzTQ3ns3aLvqljKE5GOCpkD0MzAEyBckoaPhyy00kn6BNgjxa+ymCUjEIZS5R5WroaF9YSBNb/fwIfotWMzKkX8pknB83NG1SfPbap0BONIsTDCPVSCbm5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NME9/MnE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NME9/MnE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14DD2C4CEE4;
	Fri,  7 Feb 2025 09:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738920919;
	bh=BQ6G7rgyFz/R8XkAhMbxsguKvT3vIKNZNcMTlSTb8AY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NME9/MnETm0FjT0XwSS1TNU9xgUJmlkdQhA6Rht+p/8zPbA14eEVsFClb4a2/rYoQ
	 dUMn8vDgckAIZmS5BJMNrDjQfQHZrqiaQr7cUZlAnBNYgV6+uKoc06No62rhuh6HxP
	 Xhi0feJUq7fmJmoGxZOFr24ys+m4Lm9OgqR2PRrM=
Date: Fri, 7 Feb 2025 10:35:16 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jillian Donahue <jilliandonahue58@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] f_midi_complete to call tasklet_hi_schedule
Message-ID: <2025020708-manned-antidote-7d57@gregkh>
References: <CAArt=Lib_PiR1z07hb1E3tqq-PG=KVKU9CZP3cPsQE5ciokLVw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAArt=Lib_PiR1z07hb1E3tqq-PG=KVKU9CZP3cPsQE5ciokLVw@mail.gmail.com>

On Thu, Feb 06, 2025 at 12:32:14PM -0700, Jillian Donahue wrote:
> >From 9cb2628740d9f55f6f3faa5cce2de5eb8590f434 Mon Sep 17 00:00:00 2001
> From: Jill Donahue <jilliandonahue58@gmail.com>
> Date: Thu, 6 Feb 2025 10:18:05 -0700
> Subject: [PATCH] f_midi_complete to call tasklet_hi_schedule

This all shouldn't be in the body of the email, please do not use web
email clients.  The kernel documentation should show you how to use git
send-email or other tools.

> 
> When using USB MIDI, a lock is attempted to be acquired twice through a
> re-entrant call to f_midi_transmit, causing a deadlock.
> 
> Fix it by using tasklet_hi_schedule() to schedule the inner
> f_midi_transmit() via a tasklet from the completion handler.
> 
> Link: https://lore.kernel.org/all/CAArt=LjxU0fUZOj06X+5tkeGT+6RbXzpWg1h4t4Fwa_KGVAX6g@mail.gmail.com/
> 
> Fixes: d5daf49b58661 ("USB: gadget: midi: add midi function driver")

No Cc: stable?

No blank line between Link: and Fixes: please

> Signed-off-by: Jill Donahue <jilliandonahue58@gmail.com>
> ---
>  drivers/usb/gadget/function/f_midi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

And this is a v2 patch, right?

> 
> diff --git a/drivers/usb/gadget/function/f_midi.c
> b/drivers/usb/gadget/function/f_midi.c
> index 837fcdfa3..37d438e5d 100644
> --- a/drivers/usb/gadget/function/f_midi.c
> +++ b/drivers/usb/gadget/function/f_midi.c
> @@ -283,7 +283,7 @@ f_midi_complete(struct usb_ep *ep, struct usb_request *req)
>                         /* Our transmit completed. See if there's more to go.
>                          * f_midi_transmit eats req, don't queue it again. */
>                         req->length = 0;
> -                       f_midi_transmit(midi);
> +                       tasklet_hi_schedule(&midi->tasklet);
>                         return;
>                 }

Your whitespace is all damaged and this can't be applied :(

thanks,

greg k-h
