Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7256A33F;
	Mon, 28 Apr 2025 20:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745873322; cv=none; b=sW5Tef2gKJL54GbD5J+dfZvPD5zyMbL2BubxVvoqv/nAXb720y9Bmvlp817MQyr/xFXvnxOd0yIuh/p6ZmwFs6/wSr1uoZUqvgTE+5xel9DomW7+ZKQD4Zsu60sKO0I8akWrwQJGC5Db00GO8WeZBiGro4piSZkw4SgmnjUlEVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745873322; c=relaxed/simple;
	bh=0HoWU3q4+qyiDoIEkIcqHAS0oyqLX985Vg5lAD6tTmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N62cw2iIPj22y+Nfx3d78FKhzrXK9o2AVF2cGbqMXL/F5JdNvNqgJGz07g00BpQVl0th/1NN0iGsFrqaeuMzikUZFsNuWqQLLGpTRCHQlqzMi4B7oMc4Bb9Hp4KMqhGcXl+rEY/CZfRSlFF4BFo12uw5Yrp3INCx6tIXBhtC9WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K/jtwGJn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K/jtwGJn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 996D7C4CEE4;
	Mon, 28 Apr 2025 20:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745873321;
	bh=0HoWU3q4+qyiDoIEkIcqHAS0oyqLX985Vg5lAD6tTmk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K/jtwGJnE0Vw1NW5I1IfjrgKmtFOWIVVc8aLyuZRgrx5W/6/AGacYMvaBrZd9THCY
	 P3yIQ4MVWUj7fpbyB5/TRrA2xlC/EWRwNLb6d1U9wt4ncRzcoLjbh1Dqb65ZbRpNDk
	 znFuoZdiTKtAGF0FRa49eBrGwLqwr4e5SfNWWOAtkbpKUDwQp+yoVPBDV+XCUNhVKd
	 R78cmCmgT52ZBtkHTMPqASZ+TxrAlto2za3iNcTTkHbReYwLItSxflXVpH9QspRV3M
	 VtI91+N5f3WO+e7uAcoPveaW0ELknRdVtuKSi0b2vHIZfTLPrLLjL4oomuJBOs0z26
	 IxegNejYhDPxA==
Date: Mon, 28 Apr 2025 15:48:40 -0500
From: Rob Herring <robh@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Dirk Behme <dirk.behme@de.bosch.com>, Dirk Behme <dirk.behme@gmail.com>,
	Remo Senekowitsch <remo@buenzli.dev>,
	Saravana Kannan <saravanak@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 3/7] rust: property: Introduce PropertyGuard
Message-ID: <20250428204840.GB1572343-robh@kernel.org>
References: <20250425150130.13917-1-remo@buenzli.dev>
 <20250425150130.13917-4-remo@buenzli.dev>
 <aAuryiI0lY4qYyIt@pollux>
 <81a65d89-b3e1-4a52-b385-6c8544c76dd2@gmail.com>
 <aAyyR5LyhmGVNQpm@pollux>
 <0756503c-02e7-477a-9e89-e7d4881c8ce6@gmail.com>
 <aA4ht5sUic39mnHj@pollux>
 <ee888c8f-4802-48a1-bd08-b454b782fff4@de.bosch.com>
 <aA-oQAol8rAU7vzg@cassiopeiae>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aA-oQAol8rAU7vzg@cassiopeiae>

On Mon, Apr 28, 2025 at 06:09:36PM +0200, Danilo Krummrich wrote:
> On Mon, Apr 28, 2025 at 07:03:07AM +0200, Dirk Behme wrote:
> > On 27/04/2025 14:23, Danilo Krummrich wrote:
> > > On Sun, Apr 27, 2025 at 08:11:58AM +0200, Dirk Behme wrote:
> > >> On 26.04.25 12:15, Danilo Krummrich wrote:
> > >>> On Sat, Apr 26, 2025 at 08:19:09AM +0200, Dirk Behme wrote:
> > >>>> On 25.04.25 17:35, Danilo Krummrich wrote:
> > >>>>> On Fri, Apr 25, 2025 at 05:01:26PM +0200, Remo Senekowitsch wrote:
> > >>>>>> +impl<T> PropertyGuard<'_, '_, T> {
> > >>>>>> +    /// Access the property, indicating it is required.
> > >>>>>> +    ///
> > >>>>>> +    /// If the property is not present, the error is automatically logged. If a
> > >>>>>> +    /// missing property is not an error, use [`Self::optional`] instead.
> > >>>>>> +    pub fn required(self) -> Result<T> {
> > >>>>>> +        if self.inner.is_err() {
> > >>>>>> +            pr_err!(
> > >>>>>> +                "{}: property '{}' is missing\n",
> > >>>>>> +                self.fwnode.display_path(),
> > >>>>>> +                self.name
> > >>>>>> +            );
> > >>>>>
> > >>>>> Hm, we can't use the device pointer of the fwnode_handle, since it is not
> > >>>>> guaranteed to be valid, hence the pr_*() print...
> > >>>>>
> > >>>>> Anyways, I'm not sure we need to print here at all. If a driver wants to print
> > >>>>> that it is unhappy about a missing required property it can do so by itself, I
> > >>>>> think.
> > >>>>
> > >>>> Hmm, the driver said by using 'required' that it *is* required. So a
> > >>>> missing property is definitely an error here. Else it would have used
> > >>>> 'optional'. Which doesn't print in case the property is missing.
> > >>>>
> > >>>> If I remember correctly having 'required' and 'optional' is the result
> > >>>> of some discussion on Zulip. And one conclusion of that discussion was
> > >>>> to move checking & printing the error out of the individual drivers
> > >>>> into a central place to avoid this error checking & printing in each
> > >>>> and every driver. I think the idea is that the drivers just have to do
> > >>>> ...required()?; and that's it, then.
> > >>>
> > >>> Yes, I get the idea.
> > >>>
> > >>> If it'd be possible to use dev_err!() instead I wouldn't object in this specific
> > >>> case. But this code is used by drivers from probe(), hence printing the error
> > >>> without saying for which device it did occur is a bit pointless.
> > >>
> > >> Thinking a little about this, yes, we don't know the device here. But:
> > >> Does the device matter here?
> > > 
> > > If the above fails it means that for a (specific) device a driver expects that
> > > a specific property of some firmware node is present. So, yes, I think it does
> > > matter.
> > > 
> > >> There is nothing wrong with the (unknown)
> > >> device, no? What is wrong here is the firmware (node). It misses
> > >> something.
> > > 
> > > How do we know the firmware node is wrong? Maybe the driver has wrong
> > > expectations for this device?
> > > 
> > >> And this is exactly what the message tells: "There is an
> > >> error due to the missing node 'name' in 'path', please fix it". That
> > >> should be sufficient to identify the firmware/device tree description
> > >> and fix it.
> > > 
> > > I think we can't always fix them, even if they're wrong. How do we fix ACPI
> > > firmware nodes for instance?
> > 
> > So the argument here is that the device (driver) is expecting something
> > to be "required" is wrong and might need to be fixed. Not the firmware.
> > Yes, ok, that is a valid argument. I have a device tree background and
> > there in 99% of the cases the device tree needs a fix ;)
> > 
> > But let me ask the other way around, then: What will it hurt or break if
> > we keep the pr_err() like Remo did? Even knowing that its not perfect?
> > But knowing that it will give at least a note that something is wrong
> > with at least a starting point for searching what needs to be fixed. I
> > mean even if we don't get the device, we will get the affected node we
> > can search for which device uses it as "required".
> > 
> > Could we somehow agree that in 90% of the cases this should be catched
> > at device (driver) development time, already?
> 
> I don't see why *catching* such errors needs pr_err() in core code; without it
> you still get a Result as return value that you need to handle in some way.
> 
> > And therefore it should be
> > beneficial if we don't require each and every driver to be "bloated"
> > with checking this individually?
> 
> I guess you mean "bloated with *printing* this individually", rather than
> "checking".
> 
> This is where we disagree: I think it is "bloating" the core kernel instead if
> we start adding error prints to core code, where a proper error code is
> propagated up to the driver.

1 or more error strings in every single driver is what bloats the 
kernel, not 1 string. It's all kernel code and memory usage whether it's 
core or drivers.

> I did say that I would agree to a certain extend with this specific one if we
> could print it properly, since it is designed to leave no doubt that returning
> an error code from required() is fatal for the driver. But I'm not even sure
> about this anymore.
> 
> I still haven't read a reason why this one is so crucial to print from core
> code, while for other things that are always fatal (e.g. request_irq()) we
> don't.

request_irq() is not always fatal. Some drivers fallback to polling. In 
general, we've been adding _optional() variants of functions to return 
NULL rather than errors which is handled silently by subsequent API 
calls. Secondarily, those print errors in the non-optional case. It's 
not real consistent in this area, but something we should improve.

> However, if you really think we need a common helper that prints something in
> the error case, maybe we can add an *additional* helper
> 
> 	pub fn required_by(self, dev: &Device) -> Result<T>
> 
> and document that it is the same as required(), with an additional error print
> in case of failure for the given device.

One thing that's really hard to debug in C drivers is where an 
error came from. You can for example turn on initcall_debug and see that 
a driver probe returned an error. It's virtually impossible to tell 
where that originated from. The only way to tell is with prints. That is 
probably the root of why probe has so many error prints. I think we can 
do a lot better with rust given Result can hold more than just an int. 
We obviously can't get back to the origin if that was C code, but just 
if we know exactly which call from probe failed that would be a huge 
improvement.

Rob
