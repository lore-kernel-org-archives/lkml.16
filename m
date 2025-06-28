Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5D01D5154
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 08:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751099420; cv=none; b=pnkpArn6m/uB06wI14PUMsYfthEGStf6KnVpXaLixehpRqSFFMaxAJHIKiydhl8vouxeh7nXz7Hau30xN06Wwe717oQL1MNn67UAwemnWE+qO2Iq7hoIzUIaJW6qfZtcDMKAFtxO+Ebg9yA7qhQDzt90B4MAzxV40fWQHkXL0i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751099420; c=relaxed/simple;
	bh=4cRj8WS59bxfK6qbay5EitRSd60rIvwt6mbPPYZQ7aQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XxXa+ju1w0vnMaSK3/2ua5N0tmn3PVBc5FtwQgwj4FyOrWZp7BQpcvgNocwLNuVEy6cR76V/ee4b6RmIs0XbPzyZnHaUdGMm3GObdU/nc7vVMTss9uHNE3yypkLk4tpHODPMhldAPN98Az4w1gBJryLUlS6Bk8dCAshIWHszXH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZZKNWIK3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZZKNWIK3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E638EC4CEEA;
	Sat, 28 Jun 2025 08:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751099419;
	bh=4cRj8WS59bxfK6qbay5EitRSd60rIvwt6mbPPYZQ7aQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZZKNWIK3l6hFWETu0ye5iCeI5zQv+L39reKD7k/UtoxP3BKsFIqwVT5TwEWjeAzAe
	 nPyu0Qp05y9BOpcd6AEdhpYz7PCogsl7iR1fZDT5vVlfr9fOdItDuwTslw3ncXPtiL
	 +zoJKUW26x+0XFz4r/xUaEG6/no2RAu56nfgjJfQ=
Date: Sat, 28 Jun 2025 10:30:16 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH 1/6] sysfs: attribute_group: allow registration of const
 attribute
Message-ID: <2025062845-finishing-yeast-313b@gregkh>
References: <20250116-sysfs-const-attr-prep-v1-0-15e72dba4205@weissschuh.net>
 <20250116-sysfs-const-attr-prep-v1-1-15e72dba4205@weissschuh.net>
 <2025011714-skeleton-bring-3e77@gregkh>
 <3d4c063e-e56d-466c-a3a7-58566bf1da3c@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3d4c063e-e56d-466c-a3a7-58566bf1da3c@t-8ch.de>

On Sat, Jun 28, 2025 at 10:19:07AM +0200, Thomas Weiﬂschuh wrote:
> Hi Greg,
> 
> On 2025-01-17 08:01:00+0100, Greg Kroah-Hartman wrote:
> > On Thu, Jan 16, 2025 at 06:32:27PM +0100, Thomas Weiﬂschuh wrote:
> > > To be able to constify instances of struct attribute it has to be
> > > possible to add them to struct attribute_group.
> > > The current type of the attrs member however is not compatible with that.
> > > Introduce a union that allows registration of both const and non-const
> > > attributes to enable a piecewise transition.
> > > As both union member types are compatible no logic needs to be adapted.
> > > 
> > > Technically it is now possible register a const struct
> > > attribute and receive it as mutable pointer in the callbacks.
> > > This is a soundness issue.
> > > But this same soundness issue already exists today in
> > > sysfs_create_file().
> > > Also the struct definition and callback implementation are always
> > > closely linked and are meant to be moved to const in lockstep.
> > > 
> > > Similar to commit 906c508afdca ("sysfs: attribute_group: allow registration of const bin_attribute")
> > > 
> > > Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> > > ---
> > >  include/linux/sysfs.h | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
> > > index 0f2fcd244523f050c5286f19d4fe1846506f9214..f5e25bed777a6a6e717f10973f1abcd12111f5c5 100644
> > > --- a/include/linux/sysfs.h
> > > +++ b/include/linux/sysfs.h
> > > @@ -105,7 +105,10 @@ struct attribute_group {
> > >  	size_t			(*bin_size)(struct kobject *,
> > >  					    const struct bin_attribute *,
> > >  					    int);
> > > -	struct attribute	**attrs;
> > > +	union {
> > > +		struct attribute	**attrs;
> > > +		const struct attribute	*const *attrs_new;
> > > +	};
> > 
> > I'm all for the idea, BUT, let's finish up doing this one:
> > 
> > >  	union {
> > >  		struct bin_attribute		**bin_attrs;
> > >  		const struct bin_attribute	*const *bin_attrs_new;
> > 
> > first please.
> > 
> > That way we can see just how "easy" the switch from _new to not-new goes :)
> 
> I'd like to resend these preparatory patches so they go into v6.17-rc1
> and I can work on the follow-up changes.
> In my opinion the switch from _new will work nicely. There have been no
> new users of _new in -next at all.
> 
> Any objections?

Sure, please do.

greg k-h
