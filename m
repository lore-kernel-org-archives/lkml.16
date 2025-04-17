Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684454683
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 10:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744885177; cv=none; b=bIuQh4mstrT+fJDyz3HscczWHXgnVrAAERmFjm0iN4Zw0SE04jlsucK+QuEGaRmnlOuKYtGpNfTPTST5ZHZf7T3+XDiAa9PuJD9xc+/iyTloIJmr+Oyv6ijjz3cxFuAUTQijq/6u6UM5AIOTA+iz+BphDLxlQ8gzm0Tq+kTbm5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744885177; c=relaxed/simple;
	bh=EWKR4Zbe4vhkkbIIaWDty/4mfXUE8sTN0/STnroYIKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nf+hiZqqBQXdp64yHnyMpa/l4eFOMdyT86rePMGqeh4rPd1Mc6ncZhmspprHv+HluMIq2tciQ9a6K4d+W3GK1sI8s8udW4PwElVr2zqF3z1/JGRkjQnIX1jE4TEwExm0cLzBUHbfjAC7NlIBtmjsC9IOaftS48a/B6nuQ0mUfiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=nD9DMgrV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nD9DMgrV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F295C4CEE4;
	Thu, 17 Apr 2025 10:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744885176;
	bh=EWKR4Zbe4vhkkbIIaWDty/4mfXUE8sTN0/STnroYIKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nD9DMgrV25bDaL3IantSFMHwb3daTCQR7xg3HaTPwCBia14pgsLt/wdkgjLHYHVCR
	 HENnXWH5yhpBJACvR6Vw95APQZikBl1w3sjo4dA9hwBB3InJl2wxHznluMRWpb6p6E
	 0TpWPcAq7Ni4leO91sBLjRSo95BBr8a2CkA8BYDk=
Date: Thu, 17 Apr 2025 12:19:33 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Purva Yeshi <purvayeshi550@gmail.com>
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] char: mwave: smapi: Fix signedness of SmapiOK variable
Message-ID: <2025041743-rebuild-skedaddle-5e53@gregkh>
References: <20250417091018.29767-1-purvayeshi550@gmail.com>
 <2025041728-calamity-unsuited-4ba9@gregkh>
 <d5e06499-781a-4bc0-a43b-8ef2aa89930b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5e06499-781a-4bc0-a43b-8ef2aa89930b@gmail.com>

On Thu, Apr 17, 2025 at 03:19:58PM +0530, Purva Yeshi wrote:
> On 17/04/25 15:08, Greg KH wrote:
> > On Thu, Apr 17, 2025 at 02:40:18PM +0530, Purva Yeshi wrote:
> > > Smatch warning:
> > > drivers/char/mwave/smapi.c:69 smapi_request() warn:
> > > assigning (-5) to unsigned variable 'usSmapiOK'
> > > 
> > > Fix Smatch warning caused by assigning -EIO to an unsigned short.
> > > 
> > > Smatch detected a warning due to assigning -EIO (a negative value) to an
> > > unsigned short variable, causing a type mismatch and potential issues.
> > > 
> > > In v1, the type was changed to short, which resolved the warning, but
> > > retained the misleading "us" prefix in the variable name.
> > > 
> > > In v2, update the type to s16 and rename the variable to SmapiOK,
> > > removing the "us" (unsigned short) prefix as per Greg KH suggestion.
> > > 
> > > This change ensures type correctness, avoids confusion, and improves
> > > overall code readability.
> > > 
> > > Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
> > > ---
> > > V1 - https://lore.kernel.org/all/20250409211929.213360-1-purvayeshi550@gmail.com/
> > > V2 - Use s16 type and rename variable to remove misleading "us" prefix.
> > > 
> > >   drivers/char/mwave/smapi.c | 10 +++++-----
> > >   1 file changed, 5 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/char/mwave/smapi.c b/drivers/char/mwave/smapi.c
> > > index f8d79d393b69..65bc7e1ea6cf 100644
> > > --- a/drivers/char/mwave/smapi.c
> > > +++ b/drivers/char/mwave/smapi.c
> > > @@ -66,7 +66,7 @@ static int smapi_request(unsigned short inBX, unsigned short inCX,
> > >   	unsigned short myoutDX = 5, *pmyoutDX = &myoutDX;
> > >   	unsigned short myoutDI = 6, *pmyoutDI = &myoutDI;
> > >   	unsigned short myoutSI = 7, *pmyoutSI = &myoutSI;
> > > -	unsigned short usSmapiOK = -EIO, *pusSmapiOK = &usSmapiOK;
> > > +	s16 SmapiOK = -EIO, *pSmapiOK = &SmapiOK;
> > 
> > Do you think that "SmapiOK" is a valid kernel variable name?  Doesn't
> > look ok to me, what does checkpatch.pl say?  :)
> > 
> > thanks,
> > 
> > greg k-h
> 
> Hi Greg,
> 
> Thank you for the feedback.
> 
> I ran checkpatch.pl on the patch, and it reports 0 errors and 0 warnings, so
> the variable name "SmapiOK" is valid in this context.

kernel variables should not be InterCaps like this.  they should be all
lower case, unless they are describing some hardware thing (like a
register or data field defined outside of Linux's control.)

BUT, if you look at this code, this field is coming directly from
hardware, based on the SMAPI specification, so maybe I'm wrong?  Look up
the spec for that and see how it defines these fields and maybe we just
have to live with the name following that?  If so, document it as such
in the changelog text please.

thanks,

greg k-h
