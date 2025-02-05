Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A507521D598;
	Wed,  5 Feb 2025 05:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738733262; cv=none; b=G2eNKDnCGmsByCHAjw8x2ojHuwnIyqYXWXiLTV2dORK/NfFXQFzDckaB9PkIQl6N6f82MV9HOXUu+8rsS0tTgSBGKBXh4C5hBiOAwJbqk0cRvxZKAWrzd/7KcpKZV8zG+nN+Zrh/7wLMqnTlaDzhpsLfbB8LSxpV6uZcmOAqnUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738733262; c=relaxed/simple;
	bh=uFlIQiXs2x7XIDiqACOzZJ5pxuFZzNVLGY2VrrW5gKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kyScspBAB9sdzJBKHHvmZ6gvIDw4gVQ7BXHHvfvVY3/HMobMHpVtf2QFvjjW1aYI0OED+3+1b/7C3bBzgJs3sMJCxFIJtIex8ggQnKs50/csg8sOg4W+fAUNwGG4wLEos+L4AZi4pd4Y7+Bxj65UhdWV4z1pQnNlCPNUMFvV+kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ai30CFmL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ai30CFmL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C90E3C4CED1;
	Wed,  5 Feb 2025 05:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738733261;
	bh=uFlIQiXs2x7XIDiqACOzZJ5pxuFZzNVLGY2VrrW5gKA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ai30CFmLox8XR+bbLL+XpV/6Ib8/k5tfn4bCBU0L8jcxQVMaGF+tq5RHI2FjmptKy
	 IWQP9Ogqck1SjS2ST/FGTquIT6HpdXBWwkXyz3tv24jDR8vKfihQrW/TXS9s47/EXz
	 HvzfLlivs86USOIsglcvHgFakyQjLE+YMrkhcEIo=
Date: Wed, 5 Feb 2025 06:27:38 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Purva Yeshi <purvayeshi550@gmail.com>
Cc: Thinh.Nguyen@synopsys.com, skhan@linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: Fix kernel-doc warning for sg member in
Message-ID: <2025020552-sandstorm-thaw-132e@gregkh>
References: <20250204134423.28051-1-purvayeshi550@gmail.com>
 <2025020439-bulgur-ludicrous-5071@gregkh>
 <cc1694bc-88fd-4557-b957-aabf1f444eaf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc1694bc-88fd-4557-b957-aabf1f444eaf@gmail.com>

On Wed, Feb 05, 2025 at 02:15:08AM +0530, Purva Yeshi wrote:
> On 04/02/25 19:15, Greg KH wrote:
> > On Tue, Feb 04, 2025 at 07:14:23PM +0530, Purva Yeshi wrote:
> > > Added description for the 'sg' member in struct dwc3_request to
> > > resolve the kerneldoc warning when running 'make htmldocs'.
> > > 
> > > Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
> > > ---
> > >   drivers/usb/dwc3/core.h | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> > > index f11570c8ffd0..5e4daec322b7 100644
> > > --- a/drivers/usb/dwc3/core.h
> > > +++ b/drivers/usb/dwc3/core.h
> > > @@ -942,6 +942,7 @@ struct dwc3_hwparams {
> > >    * @request: struct usb_request to be transferred
> > >    * @list: a list_head used for request queueing
> > >    * @dep: struct dwc3_ep owning this request
> > > + * @sg: pointer to the scatter-gather list
> > >    * @start_sg: pointer to the sg which should be queued next
> > >    * @num_pending_sgs: counter to pending sgs
> > >    * @remaining: amount of data remaining
> > > -- 
> > > 2.34.1
> > > 
> > 
> > What kernel version/tree did you make this change against?
> > 
> > thanks,
> > 
> > greg k-h
> 
> The change was made against kernel version 6.13.0-rc7+.

Please always work against the latest development tree for the subsystem
you are working on, OR against linux-next, so that you don't end up
duplicating work that others have already done, like was done here.

thanks,

greg k-h
