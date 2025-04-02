Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1E92376E6;
	Wed,  2 Apr 2025 12:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743596306; cv=none; b=jDNiJbVI7al99rGRaa9tnlf/NTd1aB+Iw2UcWa92FyNPfAgU7sBxtphD7WVXK/OAJnyjoW2udI5WNJ9a4dUTvHz5H7qq1pSqQNCps1HCF52Odh8WRsYcIryQ9w0G9m1/V0cNQ/wJI/kKp6S0H/0QyRAx8TFPH7pFbTiIJblw2sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743596306; c=relaxed/simple;
	bh=ggqz5lWHakn7J6Ha4/MaJKM/TUSGVUDkL/qWbNeHIzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O6tB4beAqIAz3zGVs9fSi/NKkCOWV0WDyb+pXwQ0Hhux2XuEk/GHKawaq6bP3AyfIOEnfX9SmHtwPoDZWL1liEGHxFKY+fz/2Jw+Mz+/OEYi11wSKpMQncE6m/F34KX2tN59cBBOc7w+bIsIba91aPPePFoKaTpNJS6L6iIqzqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FC8Yn2z4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FC8Yn2z4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D171EC4CEDD;
	Wed,  2 Apr 2025 12:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743596306;
	bh=ggqz5lWHakn7J6Ha4/MaJKM/TUSGVUDkL/qWbNeHIzA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FC8Yn2z4v08go6nDgD7NKILEDLsuUOktHQwGyl+HRIqjIj0QjeKZnlNFvC9EYyUR1
	 Vj3voJwcmAdfdShj9SldXpO+ZFs7/Oiky2ix9i0SKpx3PRUzduL99/YjXmHmJR/4Y5
	 NFmK5WVyIAhihzZ3Fvu950X88DtRPsS1FdtUhZFo=
Date: Wed, 2 Apr 2025 13:16:58 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Akshay Gupta <akshay.gupta@amd.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
	shyam-sundar.s-k@amd.com, gautham.shenoy@amd.com,
	Mario Limonciello <mario.limonciello@amd.com>,
	naveenkrishna.chatradhi@amd.com, anand.umarji@amd.com
Subject: Re: [PATCH v7 07/10] misc: amd-sbi: Add support for CPUID protocol
Message-ID: <2025040258-snap-aerospace-6e43@gregkh>
References: <20250402055840.1346384-1-akshay.gupta@amd.com>
 <20250402055840.1346384-8-akshay.gupta@amd.com>
 <c7efb154-9e44-402f-b0fb-c9bce54645b2@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7efb154-9e44-402f-b0fb-c9bce54645b2@app.fastmail.com>

On Wed, Apr 02, 2025 at 02:13:22PM +0200, Arnd Bergmann wrote:
> On Wed, Apr 2, 2025, at 07:58, Akshay Gupta wrote:
> > - AMD provides custom protocol to read Processor feature
> >   capabilities and configuration information through side band.
> >   The information is accessed by providing CPUID Function,
> >   extended function and thread ID to the protocol.
> >   Undefined function returns 0.
> >
> > Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> > Signed-off-by: Akshay Gupta <akshay.gupta@amd.com>
> > ---
> > Changes since v6:
> > - Address Arnd comment
> >   - Add padding to the uapi structure
> > - Rebased patch, previously patch 8
> 
> This changes the UAPI again. since you change the common structure
> layout.
> 
> > @@ -134,6 +279,9 @@ static long sbrmi_ioctl(struct file *fp, unsigned 
> > int cmd, unsigned long arg)
> >  		/* Mailbox protocol */
> >  		ret = rmi_mailbox_xfer(data, &msg);
> >  		break;
> > +	case APML_CPUID:
> > +		ret = rmi_cpuid_read(data, &msg);
> > +		break;
> >  	default:
> >  		return -EINVAL;
> 
> As I previously commented, I would prefer to have a highl-level
> interface per specific mailbox item you transfer, but I think that
> is something we can debate, in particular if Greg or the x86
> maintainers think it's ok, I'm not going to object.
> 
> However, having a combined ioctl command and data structure
> for rmi_mailbox_xfer(), rmi_cpuid_read() and the commands
> you add later seems to cause a lot of the extra complexity,
> and I think this really has to be done differently, using
> distinct ioctl command numbers for each of them, with an
> appropriate structure to go along with it.
> 
> This does mean the existing userspace tool will be incompatible
> with the upstream driver, but it can be easily updated to
> support both kernel interfaces (trying the new one first,
> and falling back to the old on after -ENOTTY).

Different structures per ioctl is the way to go.  It's more
self-describing and easier to audit for reviewing that the code is
working properly both in userspace and in the kernel (i.e. tools like
strace work better.)

So I agree with you here.

thanks,

greg k-h
