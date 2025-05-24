Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C583E1DF27E;
	Sat, 24 May 2025 16:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748103475; cv=none; b=huURqQXm837tW3oJW9uQol/iQJ+XVJzbVShjQH9CgyKn9Te1zKkur5gOzdN080wgZGMwTG8qoC/VL7YJB4z+BUhPF+Wpy+5WezyCUQQr0zts1UH96HPHUbZsCB8UVqnxeTyoeM/SZbhVpZuzL5ER/mncj6GEON+X/ldnmbVSQ4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748103475; c=relaxed/simple;
	bh=2PqjOsTXHea2A1nlsV5lb1aiLBMHAEESuBIul4P5vps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o71hp0ZHPOa8fp/kYh5tfwK0CaJIcrvPqOmxMt5yN5s7nR0xrtKM9OIclmYTnifzhBhF/a/i4YPrQZEuzkp7hhRmm2tVoGyhRyB26mRyzkOZuwA5bH/4zSx0C1ZOnqdt6WTLHscoALUBYKeTjZCra3ddoghOtrdOhDKHJjocq2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=btM1Y3da; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="btM1Y3da"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5E94C4CEE4;
	Sat, 24 May 2025 16:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1748103474;
	bh=2PqjOsTXHea2A1nlsV5lb1aiLBMHAEESuBIul4P5vps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=btM1Y3daMuWWZlxrePRGj1CxuuJv6HqWCWNijtb6BxknSYdVrzLiQ4OTzeMvlFGCR
	 tzX0BOpmtPDjMpn8/Y+aQNe2AXCQ/Mv4ZwGowFqNmRooKpNv2pWE4j9KN7zSysXLwg
	 d0hqtnbTuOmvcT+iRxwAx55T9RUPQKBtQDAVmYwI=
Date: Sat, 24 May 2025 18:17:51 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Heikki Huttu <heissendo88@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] staging: vme_user: add missing includes
Message-ID: <2025052448-overuse-demise-d090@gregkh>
References: <aCZDHXJTyfJRseho@Lappari.v6.elisa-laajakaista.fi>
 <2025052136-backstab-dork-de2d@gregkh>
 <aDHvSicbJpYBY-dn@Lappari.v6.elisa-laajakaista.fi>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aDHvSicbJpYBY-dn@Lappari.v6.elisa-laajakaista.fi>

On Sat, May 24, 2025 at 07:09:46PM +0300, Heikki Huttu wrote:
> Wed, May 21, 2025 at 01:43:24PM +0200, Greg KH kirjoitti:
> > On Thu, May 15, 2025 at 10:40:13PM +0300, Heikki Huttu wrote:
> > > Header files use u32, size_t, dma_addr_t, struct device, struct list_head.
> > > Add direct includes to make the headers self-contained.
> > > 
> > > Signed-off-by: Heikki Huttu <heissendo88@gmail.com>
> > > ---
> > >  drivers/staging/vme_user/vme.h      | 5 +++++
> > >  drivers/staging/vme_user/vme_user.h | 2 ++
> > >  2 files changed, 7 insertions(+)
> > > 
> > > diff --git a/drivers/staging/vme_user/vme.h b/drivers/staging/vme_user/vme.h
> > > index 7753e736f9fd..55499b240dc3 100644
> > > --- a/drivers/staging/vme_user/vme.h
> > > +++ b/drivers/staging/vme_user/vme.h
> > > @@ -3,6 +3,11 @@
> > >  #define _VME_H_
> > >  
> > >  #include <linux/bitops.h>
> > > +#include <linux/types.h>
> > > +#include <linux/device.h>
> > > +#include <linux/list.h>
> > > +#include <linux/mm.h>
> > > +#include <linux/dma-mapping.h>
> > 
> > If you are going to add these, please do so in a sorted way.
> > 
> > But really, why is this needed at all?
> > 
> > >  
> > >  /* Resource Type */
> > >  enum vme_resource_type {
> > > diff --git a/drivers/staging/vme_user/vme_user.h b/drivers/staging/vme_user/vme_user.h
> > > index 19ecb05781cc..297b25fab164 100644
> > > --- a/drivers/staging/vme_user/vme_user.h
> > > +++ b/drivers/staging/vme_user/vme_user.h
> > > @@ -2,6 +2,8 @@
> > >  #ifndef _VME_USER_H_
> > >  #define _VME_USER_H_
> > >  
> > > +#include <linux/types.h>
> > 
> > Same here, are you sure this is needed?
> > 
> > thanks,
> > 
> > greg k-h
> 
> Hi Greg,
> 
> Thank you for the feedback.
> 
> I was under the impression that it's generally preferred to use direct includes to make headers self-contained and avoid relying on transitive includes.  
> If I was mistaken, apologies — feel free to disregard this.

Generally, yes, it is a good idea, but if nothing is broken, adding
additional .h files to other .h files is not a required change at all.

Are you doing this for all of the staging driver files?  Is this a goal
to try to fix up more than just this one file?

thanks,

greg k-h
