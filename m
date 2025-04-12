Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F61220CCFB
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 18:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744483470; cv=none; b=hD/wu1IyUZ9v+3FJa5bWN/2Ay+gWnGZ3z5KKGCwFBAOhr6pj6qE8CueA7PcRsde8NQsXraiqpqM7b6NgTmdi6BD6wEH4Np+GQSMhxg+hfdTxtWUhlocJQEBqIM5zL7PaN1sDefSyVm89WLohWUfcm8QkJ1m+vOOr9YKOC5QB8DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744483470; c=relaxed/simple;
	bh=l6Nsox/7jySqMpZrky/EGyuojDtoPc6Au//m2bM8/iY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k9a575oVHwDToU96zQvvN57EpfwH3iIhr0Xc6ItCFwVyaU4uKtjOOxrQhA4XAabNrnvsYl/XbIjYKD15BHxt7i9Gl2eMOLdmmJBgWneGHXfX/QzBlryPOexoDsou29WpxlUB9pAwyZuXG8fivFJcn1c7iT9QolZlMKcvzwqLJlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kWRaAWte; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kWRaAWte"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1075BC4CEE3;
	Sat, 12 Apr 2025 18:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744483469;
	bh=l6Nsox/7jySqMpZrky/EGyuojDtoPc6Au//m2bM8/iY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kWRaAWteJRc67GLgilEsnMOC/0fnAF7AQwH9RX7wkPHIiyLqcmgT9G6UiUB75UevM
	 9BBcRpPfYBLnv+ky4F9qg0rpb9+muP35IZj8r26mb2KicIVqinNEDZF4rn7m5KjQzC
	 fLPgWz/G0eFZF8Y8UuixOyv2wuCJb2thtPtcApMehfcQNTg3MBfBiuIfz5vC6bhLpk
	 411zjR8kVfBqucPW1Z1NiRNIVKPz537CI7T8qX6Emr6rjO2FdKUTTMQAvQo9qbp7d7
	 c0sJN8+ZO56JZm8l3BSF2xtCKmQ2k7bY1dcfFgq6gdHUiwxiCjELNr3YnephC8pkvA
	 DLPP6wvK6jGUg==
Date: Sat, 12 Apr 2025 20:44:25 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: exporting a device type
Message-ID: <Z_q0iRXjPbdQvHMu@cassiopeiae>
References: <CAHp75VdssCM74oji59QjPMEzrVuBzPOAMadA=Ds_52hOZGJ2mw@mail.gmail.com>
 <Z_mIrjA5k2CABoG_@pollux.localdomain>
 <CAHp75Vff+at=Ty0GD1PpROPJqHEAB+g94pv-CLbeT2aTN46uJw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Vff+at=Ty0GD1PpROPJqHEAB+g94pv-CLbeT2aTN46uJw@mail.gmail.com>

On Sat, Apr 12, 2025 at 08:56:39PM +0300, Andy Shevchenko wrote:
> On Sat, Apr 12, 2025 at 12:25 AM Danilo Krummrich <dakr@kernel.org> wrote:
> > On Fri, Apr 11, 2025 at 10:39:38PM +0300, Andy Shevchenko wrote:
> > > I have an issue with this change
> > >
> > > https://web.git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git/commit/?h=for-driver-core&id=e86cc69186051d7312711565803de586efd9b2cf
> > >
> > > (I think you haven't yet sent it for review, so this is just
> > > preliminary look at)
> > >
> > > The idea of exporting bus type will open a non-reversible box of
> > > changes when people will start abusing it. Instead just provide an API
> > > dev_is_auxiliary() as it's done in other subsystems (yes, I know that
> > > some of them are still exporting the type, but it's most likely due to
> > > historical reasons of not thinking through it at that time).
> >
> > Yeah, most busses export it and provide a dev_is_*() macro, which we can't use
> > in Rust. That's why for PCI and platform I started using the bus type directly,
> > see e.g. [1].
> 
> I know. When I tried to do the same for PNP devices, Greg and others
> were objecting to this. An auxiliary bus is a new thing and I don't
> believe that Greg or any other kernel developer who is generally in
> favour of Rust development will accept this particular change.

Greg and me are aligned on this in the context of having Rust implement TryFrom
for device "upcasts" [1]. However, I decided to drop it for the auxiliary bus
for now, since I think there won't be an immediate use-case for the auxiliary
bus.

> > However, I already considered changing it up by just creating Rust helper
> > functions for the dev_is_*() macros and provide a dev_is_auxiliary() API
> > instead. This also simplifies things a bit and gets me rid of the
> > Device::bus_type_raw() helper.
> 
> This would be wonderful!

For PCI and platform I already switched to helper functions for the dev_is_*()
macros. For auxiliary, as mentioned above, I will drop it for now.

[1] https://lore.kernel.org/lkml/2025032455-elk-whoops-3439@gregkh/
