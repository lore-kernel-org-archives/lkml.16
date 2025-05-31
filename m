Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F479238C2A
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 11:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748691624; cv=none; b=E1pci2O4ryk8XV7PE6tD2LH23vfzAlnotZJjufq1oi6IaeXjiRCtuNzK8ko27K/LrBdsrzLaqCGC22CkCA620qBzJKaZcgTitbPH8wfBdqX5qc/RUmJ60EbTKnfEmqcD9su1Ukilyb3fxmpdsiuOt/uIJmGB8GmzJp26I7ISuLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748691624; c=relaxed/simple;
	bh=QmBowPy2XocnfyrqUSljY0nK1UfcMM28v5fKuvkAQHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jq60WC8jrcIiXAIq3XwZZ3isNSzOr5lBhwBbU2BXCVoZu6zmRI+hgHv98QVvesLsC+hhNdiFH9f3AK1CIw05FzoCZ4j7p0i2X1GCjRK4ShXn2fXV8zvpKKwZEtcOqi6V/+nbR7pOujSAi/e3SlBpXfwsdBcv/t3r+ahUpmqco8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de; spf=pass smtp.mailfrom=t-8ch.de; dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b=fSI6RidY; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b="fSI6RidY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1748691613; bh=QmBowPy2XocnfyrqUSljY0nK1UfcMM28v5fKuvkAQHo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fSI6RidYQ1iOYn1EHMbWUgNl4KFV3576+zpMGLfy+nAbpGB+5WyV3WuWFHUCCihMh
	 GSeovPhYQmXKjKBjcuQcdzigFnUwxf70Rq6DTMAyO542ln6y/qI7IgFmrbGR+DWmQq
	 LrRkjENCJyxS6NMY2Lm5iU/rnk71604f+LcIW6q8=
Date: Sat, 31 May 2025 13:40:13 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] Driver core changes for 6.16-rc1
Message-ID: <39eaf3d6-3c69-4e06-a61e-cccc7aad578d@t-8ch.de>
References: <aDcyRMojWUbAllVX@kroah.com>
 <35e4b33f-d9e4-41d6-8a47-644fda5b1b7f@t-8ch.de>
 <2025052822-cavity-mortality-07d2@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2025052822-cavity-mortality-07d2@gregkh>

(trimmed the CC-list)

Hi Greg,

On 2025-05-28 18:29:20+0200, Greg KH wrote:
> On Wed, May 28, 2025 at 06:16:21PM +0200, Thomas Weißschuh wrote:
> > On 2025-05-28 17:56:52+0200, Greg KH wrote:

<snip>

> > > Here are the driver core / kernfs changes for 6.16-rc1.
> > > 
> > > Not a huge number of changes this development cycle, here's the summary
> > > of what is included in here:
> > >   - kernfs locking tweaks, pushing some global locks down into a per-fs
> > >     image lock
> > >   - rust driver core and pci device bindings added for new features.
> > 
> > >   - sysfs const work for bin_attributes.  This churn should now be
> > >     completed for those types of attributes
> > 
> > This is missing the switch away and removal of the transitional
> > struct members, "read_new", "write_new" and "bin_attrs_new".
> > These are the actually churny changes.

<snip>

> > Do you want me to resubmit it to you? Now or shortly before the end of
> > the merge window?
> 
> Ah, yes, those are still in my "to apply after -rc1 is out" queue, sorry
> about that.  And yes, I'll be glad to take updated versions as things
> have changed.

In case you don't see patches submitted during the merge window,
here is the updated series:

https://lore.kernel.org/lkml/20250530-sysfs-const-bin_attr-final-v3-0-724bfcf05b99@weissschuh.net/

Based on linux-next to make sure that all changes that could go into the
merge window are accounted for.


Thomas
