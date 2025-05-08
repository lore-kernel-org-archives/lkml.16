Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F39B209F45
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 15:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746719375; cv=none; b=kSHu30xLX15CFfF5PoUG6TQ4ZWNr8f2HvImKydI0tV7RC+7w+4xd01j7qkNtimr59pXMfkK0hGkwg6X6S81KP4q31iGNJkDhgLBSAPa5Uz8/w8Q/XccY5+ym2281IeU6AMTUN8i+Yg7RgZA/kRnmur/W6uz1lISAxdYMPOf9hTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746719375; c=relaxed/simple;
	bh=fp295efYxgtyeMPAVEBxA0DJUr7nCi7X5kBc4DMAS/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IQe+F5y4N/ONuvCqLqlSI53uaJm3ZGhgS1xNbVsZmhT8yULELQvU6IyohI592TyefB4HP1cYEqqkwsrPNaJUGlK44oHxVRngE5u+UxYLJYHY6j6Zb8V+LdEULYMTmyN2EpTjXk9WBvWdiejXdVfoZ1i2axNYpfRnpc0AZ9n114A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BhZdJcya; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BhZdJcya"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7348DC4CEE7;
	Thu,  8 May 2025 15:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746719374;
	bh=fp295efYxgtyeMPAVEBxA0DJUr7nCi7X5kBc4DMAS/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BhZdJcya4QN2cnpL52Aez+KQ4lkoVnT88j1DkCGtdFuc2wKqqsHjJdDLpEb8c66rq
	 BK5xZMyHLAtS0oMw0g4W8817GKphTOVJ8wJFOsrdO8mer0HNT8KDifaoaKsIMWNHZS
	 Ar5Ca7NLZETvYVVYatTnCKVhVe0n1ZHsw62ud+F0=
Date: Thu, 8 May 2025 17:49:32 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Heikki Huttu <heissendo88@gmail.com>
Cc: Ian Abbott <abbotti@mev.co.uk>, hsweeten@visionengravers.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] comedi: drivers: adl_pci9118.c: Edit file so that
 checkpatch.pl has 0 typo errors
Message-ID: <2025050811-capricorn-poise-4e80@gregkh>
References: <aBoz0MJWkKk7zSZg@Lappari.v6.elisa-laajakaista.fi>
 <d12145a2-6a84-48c7-8bb7-39ed25598432@mev.co.uk>
 <aBzOdFXd_TwYrhd1@Lappari.v6.elisa-laajakaista.fi>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBzOdFXd_TwYrhd1@Lappari.v6.elisa-laajakaista.fi>

On Thu, May 08, 2025 at 06:32:04PM +0300, Heikki Huttu wrote:
> Wed, May 07, 2025 at 10:04:05AM +0100, Ian Abbott kirjoitti:
> > On 06/05/2025 17:07, Heikki Huttu wrote:
> > > Fix errors produced by checkpath.pl about typos.
> > > 
> > > Signed-off-by: Heikki Huttu <heissendo88@gmail.com>
> > > ---
> > > 
> > > V2: Removed all modifications done to parenthesis. Edit Patch name and
> > > only typo fixes remain.
> > > 
> > >   drivers/comedi/drivers/adl_pci9118.c | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/comedi/drivers/adl_pci9118.c b/drivers/comedi/drivers/adl_pci9118.c
> > > index a76e2666d583..67c663892e48 100644
> > > --- a/drivers/comedi/drivers/adl_pci9118.c
> > > +++ b/drivers/comedi/drivers/adl_pci9118.c
> > > @@ -32,7 +32,7 @@
> > >    * ranges).
> > >    *
> > >    * There are some hardware limitations:
> > > - * a) You cann't use mixture of unipolar/bipoar ranges or differencial/single
> > > + * a) You can't use mixture of unipolar/bipolar ranges or differential/single
> > >    *  ended inputs.
> > >    * b) DMA transfers must have the length aligned to two samples (32 bit),
> > >    *  so there is some problems if cmd->chanlist_len is odd. This driver tries
> > > @@ -227,7 +227,7 @@ struct pci9118_private {
> > >   	struct pci9118_dmabuf dmabuf[2];
> > >   	int softsshdelay;		/*
> > >   					 * >0 use software S&H,
> > > -					 * numer is requested delay in ns
> > > +					 * number is requested delay in ns
> > >   					 */
> > >   	unsigned char softsshsample;	/*
> > >   					 * polarity of S&H signal
> > 
> > The patch looks fine, thanks.
> > 
> > Reviewed-by: Ian Abbott <abbotti@mev.co.uk>
> > 
> > I don't have commit access to any pulled trees, so could you please resend
> > with Greg Kroah-Hartman <gregkh@linuxfoundation.org> in the Cc list?  Feel
> > free to add my Reviewed-by: line above when resending.  You can leave the
> > patch at version v2 since the patch and description hasn't changed.
> > 
> > -- 
> > -=( Ian Abbott <abbotti@mev.co.uk> || MEV Ltd. is a company  )=-
> > -=( registered in England & Wales.  Regd. number: 02862268.  )=-
> > -=( Regd. addr.: S11 & 12 Building 67, Europa Business Park, )=-
> > -=( Bird Hall Lane, STOCKPORT, SK3 0XA, UK. || www.mev.co.uk )=-
> 
> Thank you Ian! When you have the time, could you please take a look at
> this patch Greg? Thank you!
> 
> Fix errors produced by checkpath.pl about typos.
> 
> Signed-off-by: Heikki Huttu <heissendo88@gmail.com>
> Reviewed-by: Ian Abbott <abbotti@mev.co.uk>
> ---
> 
> V2: Removed all modifications done to parenthesis. Edit Patch name and
> only typo fixes remain.
> 
>   drivers/comedi/drivers/adl_pci9118.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/comedi/drivers/adl_pci9118.c b/drivers/comedi/drivers/adl_pci9118.c
> index a76e2666d583..67c663892e48 100644
> --- a/drivers/comedi/drivers/adl_pci9118.c
> +++ b/drivers/comedi/drivers/adl_pci9118.c
> @@ -32,7 +32,7 @@
>    * ranges).
>    *
>    * There are some hardware limitations:
> - * a) You cann't use mixture of unipolar/bipoar ranges or differencial/single
> + * a) You can't use mixture of unipolar/bipolar ranges or differential/single
>    *  ended inputs.
>    * b) DMA transfers must have the length aligned to two samples (32 bit),
>    *  so there is some problems if cmd->chanlist_len is odd. This driver tries
> @@ -227,7 +227,7 @@ struct pci9118_private {
>   	struct pci9118_dmabuf dmabuf[2];
>   	int softsshdelay;		/*
>   					 * >0 use software S&H,
> -					 * numer is requested delay in ns
> +					 * number is requested delay in ns
>   					 */
>   	unsigned char softsshsample;	/*
>   					 * polarity of S&H signal

This needs to be submitted in a format I can apply it in :)

thanks,

greg k-h
