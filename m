Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF851EDA02
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 12:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748694362; cv=none; b=gW+5zYk8LwrPyH952935DfbNk4fR9HkymurAvnqc5hMelpQpP4gMFTLP+KFG+B1jf3FCu54cP6JE9QpOVTTkM5vZzxzH8G4pKtj/BuY6QJ3NOY13+U79wiOeRbYhD0c4MOegWvwKcrkbKJYwHOskUr6r8mQNKfwZxdM6Cpc5Kfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748694362; c=relaxed/simple;
	bh=F9HwltFBCv1seZat4nMyQQRR1pH2BkQqheckHTr46To=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BDpMxn2pUXpCryNTZsLmFt5tN58nrLigPuYh7tpCDD2Psd7v+pelcrPmUPFsXvU4XWEMK5LFScr+igUzf5SR2DMwAYqvVPiLHegXVNTNHCuNZOd3MHVWa6LPp9ZzJeaAU1CE9P/VSN6OTWjZKXmJNScd0AsKYnw6Pi0If6UcxVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YJYuRgps; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YJYuRgps"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEDB8C4CEE3;
	Sat, 31 May 2025 12:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1748694362;
	bh=F9HwltFBCv1seZat4nMyQQRR1pH2BkQqheckHTr46To=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YJYuRgpsh9Lb+e6pfpSdH5FpbHmgyHfK8TnH37VWU20XOnJimp9qup4NJq8pCsYW5
	 FTLrfAIzsxswhbKtbfyQpasmGX7UBuLi5eRnW3vn3NMAj23ggKjGqCKuIwY4TrkJzB
	 nSPHTDq144AjBfZDMi8GlI7HYNdl0obE4INz85Io=
Date: Sat, 31 May 2025 14:25:59 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@t-8ch.de>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] Driver core changes for 6.16-rc1
Message-ID: <2025053142-comprised-vocally-6c11@gregkh>
References: <aDcyRMojWUbAllVX@kroah.com>
 <35e4b33f-d9e4-41d6-8a47-644fda5b1b7f@t-8ch.de>
 <2025052822-cavity-mortality-07d2@gregkh>
 <39eaf3d6-3c69-4e06-a61e-cccc7aad578d@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <39eaf3d6-3c69-4e06-a61e-cccc7aad578d@t-8ch.de>

On Sat, May 31, 2025 at 01:40:13PM +0200, Thomas Weißschuh wrote:
> (trimmed the CC-list)
> 
> Hi Greg,
> 
> On 2025-05-28 18:29:20+0200, Greg KH wrote:
> > On Wed, May 28, 2025 at 06:16:21PM +0200, Thomas Weißschuh wrote:
> > > On 2025-05-28 17:56:52+0200, Greg KH wrote:
> 
> <snip>
> 
> > > > Here are the driver core / kernfs changes for 6.16-rc1.
> > > > 
> > > > Not a huge number of changes this development cycle, here's the summary
> > > > of what is included in here:
> > > >   - kernfs locking tweaks, pushing some global locks down into a per-fs
> > > >     image lock
> > > >   - rust driver core and pci device bindings added for new features.
> > > 
> > > >   - sysfs const work for bin_attributes.  This churn should now be
> > > >     completed for those types of attributes
> > > 
> > > This is missing the switch away and removal of the transitional
> > > struct members, "read_new", "write_new" and "bin_attrs_new".
> > > These are the actually churny changes.
> 
> <snip>
> 
> > > Do you want me to resubmit it to you? Now or shortly before the end of
> > > the merge window?
> > 
> > Ah, yes, those are still in my "to apply after -rc1 is out" queue, sorry
> > about that.  And yes, I'll be glad to take updated versions as things
> > have changed.
> 
> In case you don't see patches submitted during the merge window,
> here is the updated series:
> 
> https://lore.kernel.org/lkml/20250530-sysfs-const-bin_attr-final-v3-0-724bfcf05b99@weissschuh.net/
> 
> Based on linux-next to make sure that all changes that could go into the
> merge window are accounted for.

I saw them, thanks!  I'll look at them at the end of next week.

greg k-h
