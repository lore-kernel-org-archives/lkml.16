Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3807F2C1A2
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 16:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748449764; cv=none; b=FJGLgrPbiS3L6FQCBqptqJ6rOCIc2NdN/RSZ1wZ7Dwz7wRfPLdc7Yw5BP9Y0wQ1uGun10Ed+83aXZVGS8Uon8SjUITZjbygN9FZjDr0zlzXo02jIHvMJOQgulXvl/zpQY6K8wlL7HkWlOExPZU5s9cm4TRsCvjsbSDN4tHaRdvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748449764; c=relaxed/simple;
	bh=5d80Uts15uFivd8jgpeZQZ5P5BsUBpfqQO8jiCUoymA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K3jMhtcq5Ntf6RjsWzoFdVpl78xRMika3Iko+pxJHsvw+3qilvYEWj7zztQb9DFdHQJqpINSgOAPmYp5FFdaXRns/z85mG4KySY7Xpsq8lz938Xm5HPLA9dy+Pqv/X/AXj6vmtKVED5cynlcO3yE9eqrqDLHxO8rTbqWSgBScVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rfpCEm2Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rfpCEm2Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2160FC4CEED;
	Wed, 28 May 2025 16:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1748449763;
	bh=5d80Uts15uFivd8jgpeZQZ5P5BsUBpfqQO8jiCUoymA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rfpCEm2Ziy+wUasElaNpu380P7O6LV4PmCZITEmCIlONqjt9niHMWsL/7gR7nXsvA
	 GnclRDEqqwxR/dxjM+DN+fVFRnR4PKPEYG6dHpxKqeEZY++SeVJKHqcXygKibRodOt
	 XyrlgSBBXvshI2mWFEe28aWKvKj7HUoEafrxEtzM=
Date: Wed, 28 May 2025 18:29:20 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@t-8ch.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [GIT PULL] Driver core changes for 6.16-rc1
Message-ID: <2025052822-cavity-mortality-07d2@gregkh>
References: <aDcyRMojWUbAllVX@kroah.com>
 <35e4b33f-d9e4-41d6-8a47-644fda5b1b7f@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <35e4b33f-d9e4-41d6-8a47-644fda5b1b7f@t-8ch.de>

On Wed, May 28, 2025 at 06:16:21PM +0200, Thomas Weißschuh wrote:
> Hi Greg,
> 
> On 2025-05-28 17:56:52+0200, Greg KH wrote:
> > The following changes since commit 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3:
> > 
> >   Linux 6.15-rc6 (2025-05-11 14:54:11 -0700)
> > 
> > are available in the Git repository at:
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-6.16-rc1
> > 
> > for you to fetch changes up to 071d8e4c2a3b0999a9b822e2eb8854784a350f8a:
> > 
> >   kernfs: Relax constraint in draining guard (2025-05-21 14:23:13 +0200)
> > 
> > ----------------------------------------------------------------
> > Driver core changes for 6.16-rc1
> > 
> > Here are the driver core / kernfs changes for 6.16-rc1.
> > 
> > Not a huge number of changes this development cycle, here's the summary
> > of what is included in here:
> >   - kernfs locking tweaks, pushing some global locks down into a per-fs
> >     image lock
> >   - rust driver core and pci device bindings added for new features.
> 
> >   - sysfs const work for bin_attributes.  This churn should now be
> >     completed for those types of attributes
> 
> This is missing the switch away and removal of the transitional
> struct members, "read_new", "write_new" and "bin_attrs_new".
> These are the actually churny changes.
> 
> I have a branch with those, based on current linux-next/master, at
> https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/sysfs-const-bin_attr-final
> 
> (Has not yet passed 0day, but earlier versions this week did)
> 
> Do you want me to resubmit it to you? Now or shortly before the end of
> the merge window?

Ah, yes, those are still in my "to apply after -rc1 is out" queue, sorry
about that.  And yes, I'll be glad to take updated versions as things
have changed.

thanks,

greg k-h
