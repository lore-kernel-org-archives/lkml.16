Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE1A82D98;
	Wed,  5 Feb 2025 13:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738762092; cv=none; b=LoOrF170kVPO70BOdGlwVmVZVFpd7pMIK3Y82XEJDztgpvzfaaVssyUwCD9DE0zj7Twht+QGQiPw4dAMA2T5bYkt4MkFBZJrYWumnBNGnVQeSdPKp+Op+RAL7qyBvGo9MkI4mMeldowLfS+4lFsCasEdbtmF3CFmh097Y++cdw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738762092; c=relaxed/simple;
	bh=//kvva3iZqW8obzgAlWViejdA8i1gDjetT5FaEKlR74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rDsE98I7KX06bl6xnn7s4YAjreR5LI7Zhu4RcAfn0pml0pSViFiNdFgexd4+1LrF5P1tDdre/Ms/a22DQK6PDkRsdW/euvFiXriPtn6KvcA+YFzzYN9tuzXfRudhBdv4fi8gR6V/e3E2e7LmQumpsRix6y0G1vlbUyXux1bNOZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=a9GILhbQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="a9GILhbQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A62B3C4CEE2;
	Wed,  5 Feb 2025 13:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738762092;
	bh=//kvva3iZqW8obzgAlWViejdA8i1gDjetT5FaEKlR74=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a9GILhbQ5I2l1a1J2F6mOoyTpCRmFFujMYGOKaYtpTZIZqQwm5hBE0LiZmourKzwt
	 DH4kseSDUOERqf7QqrplxBjNRADy98ZLEuYX+q5QQUsgb48eKFsH30wkCsxXldfhG0
	 htl68LJEAKTicO8Cl29JEc82BpVSlqk6uu3T6fww=
Date: Wed, 5 Feb 2025 14:28:08 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Dave Penkler <dpenkler@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Nihar Chaithanya <niharchaithanya@gmail.com>,
	Rohit Chavan <roheetchavan@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpib: mark pnp_device_id tables as __maybe_unused
Message-ID: <2025020548-tropical-thickness-52a0@gregkh>
References: <20250205121244.322054-1-arnd@kernel.org>
 <2025020532-roast-shortage-4086@gregkh>
 <19cc695e-47e6-451a-a443-384e2b423953@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19cc695e-47e6-451a-a443-384e2b423953@app.fastmail.com>

On Wed, Feb 05, 2025 at 02:04:37PM +0100, Arnd Bergmann wrote:
> On Wed, Feb 5, 2025, at 13:25, Greg Kroah-Hartman wrote:
> > On Wed, Feb 05, 2025 at 01:12:26PM +0100, Arnd Bergmann wrote:
> >>
> >> @@ -1390,7 +1390,7 @@ static struct pci_driver tnt4882_pci_driver = {
> >>  	.probe = &tnt4882_pci_probe
> >>  };
> >>  
> >> -static const struct pnp_device_id tnt4882_pnp_table[] = {
> >> +static __maybe_unused const struct pnp_device_id tnt4882_pnp_table[] = {
> >
> > I see this happening in many different drivers right now, what is so
> > unique about pnp that causes this?  Shouldn't we fix up the
> > MODULE_DEVICE_TABLE() macro to not require stuff like this instead?
> 
> I think the other drivers that produce a similar warning usually
> have a different bug, they have an incorrect of_match_ptr() or
> ACPI_PTR() around the reference to that table, and the correct
> fix is usually to just remove those macros. I have previously
> sent patches for all of these, and could resend those.
> 
> These two pnp drivers are special because they predate the
> linux-2.6 driver model and there is no reference to the table
> at all in the drivers.

Ah.  Then the variable should just be removed as it's obviously not
doing anything :)

(I know it's doing module loading, but that's not ok to just fake it
this way, it should use that table when it is searching the pnp area.)

So a nice "#if 0" carve out for now perhaps?

thanks,

greg k-h
