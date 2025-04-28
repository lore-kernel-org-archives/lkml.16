Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55692797B3;
	Mon, 28 Apr 2025 16:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745856584; cv=none; b=s6IziCGMLRthl+nqwXwIHM9tBt6l2aV1jGt42csHbA74otxdStiNpKEqLNeF60d6KjnXiU7zOJFy1CUJ8rragHx/m9PFtqtJlNNTWdBsa+bm0yis30/Eg/RkJ/oXJGPBXA6su3qIClyBG+gGabrhRbW8C/HRsaPgPaoJP9/8E7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745856584; c=relaxed/simple;
	bh=hNqslVR56TkvXlExRTcejZeXm/ru+xojW4YnA2ZCYI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lEvku2Q203a1n/lfq8nUUV0w0U3FqK5TY8DV38En22tevR9lXa8nI2ESWsH+y0PUmDopRK9hibwuWAkg4fQfeXdPZYrZA667u+ljW/zzUP2j2EZ4DnIUMggYxdljSHSEIiT8TA8105hKOpbuzic3K0INGztBZQGFpsqSkF56EjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z3weBaoa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z3weBaoa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82AF8C4CEE4;
	Mon, 28 Apr 2025 16:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745856583;
	bh=hNqslVR56TkvXlExRTcejZeXm/ru+xojW4YnA2ZCYI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z3weBaoaY6w0u7fnw/ke3GIImsbGRVldWRgwrzQtFk0ei07j2l1y1yhjvQipKZ/bT
	 2cD2o9cpF47G5LNMoruUVRLUPWrqaPuQ0SbcMQRB0b3Z5SnMejEV1mpf+MIebuyycA
	 2gFLIWmAGmKrudDuM6g50tROEEdbt/JgtUiqLkmQuLZLKQdQMrdLWjks9PINhT337f
	 P1xTWTf7+iImPUiKsxtaFo/0umVuTfN1sQh/qDo5MF6RQrtGjtJuTju7nJ/qrQ7VJg
	 +VC1ywvV7YvcjgI7zRPpx01RmCUEEQB9kriP2OgylCkrcutZuLQNFPjMaOyg57IKGK
	 MFtNxOAVPPVag==
Date: Mon, 28 Apr 2025 18:09:36 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Dirk Behme <dirk.behme@gmail.com>, Remo Senekowitsch <remo@buenzli.dev>,
	Rob Herring <robh@kernel.org>,
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
Message-ID: <aA-oQAol8rAU7vzg@cassiopeiae>
References: <20250425150130.13917-1-remo@buenzli.dev>
 <20250425150130.13917-4-remo@buenzli.dev>
 <aAuryiI0lY4qYyIt@pollux>
 <81a65d89-b3e1-4a52-b385-6c8544c76dd2@gmail.com>
 <aAyyR5LyhmGVNQpm@pollux>
 <0756503c-02e7-477a-9e89-e7d4881c8ce6@gmail.com>
 <aA4ht5sUic39mnHj@pollux>
 <ee888c8f-4802-48a1-bd08-b454b782fff4@de.bosch.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee888c8f-4802-48a1-bd08-b454b782fff4@de.bosch.com>

On Mon, Apr 28, 2025 at 07:03:07AM +0200, Dirk Behme wrote:
> On 27/04/2025 14:23, Danilo Krummrich wrote:
> > On Sun, Apr 27, 2025 at 08:11:58AM +0200, Dirk Behme wrote:
> >> On 26.04.25 12:15, Danilo Krummrich wrote:
> >>> On Sat, Apr 26, 2025 at 08:19:09AM +0200, Dirk Behme wrote:
> >>>> On 25.04.25 17:35, Danilo Krummrich wrote:
> >>>>> On Fri, Apr 25, 2025 at 05:01:26PM +0200, Remo Senekowitsch wrote:
> >>>>>> +impl<T> PropertyGuard<'_, '_, T> {
> >>>>>> +    /// Access the property, indicating it is required.
> >>>>>> +    ///
> >>>>>> +    /// If the property is not present, the error is automatically logged. If a
> >>>>>> +    /// missing property is not an error, use [`Self::optional`] instead.
> >>>>>> +    pub fn required(self) -> Result<T> {
> >>>>>> +        if self.inner.is_err() {
> >>>>>> +            pr_err!(
> >>>>>> +                "{}: property '{}' is missing\n",
> >>>>>> +                self.fwnode.display_path(),
> >>>>>> +                self.name
> >>>>>> +            );
> >>>>>
> >>>>> Hm, we can't use the device pointer of the fwnode_handle, since it is not
> >>>>> guaranteed to be valid, hence the pr_*() print...
> >>>>>
> >>>>> Anyways, I'm not sure we need to print here at all. If a driver wants to print
> >>>>> that it is unhappy about a missing required property it can do so by itself, I
> >>>>> think.
> >>>>
> >>>> Hmm, the driver said by using 'required' that it *is* required. So a
> >>>> missing property is definitely an error here. Else it would have used
> >>>> 'optional'. Which doesn't print in case the property is missing.
> >>>>
> >>>> If I remember correctly having 'required' and 'optional' is the result
> >>>> of some discussion on Zulip. And one conclusion of that discussion was
> >>>> to move checking & printing the error out of the individual drivers
> >>>> into a central place to avoid this error checking & printing in each
> >>>> and every driver. I think the idea is that the drivers just have to do
> >>>> ...required()?; and that's it, then.
> >>>
> >>> Yes, I get the idea.
> >>>
> >>> If it'd be possible to use dev_err!() instead I wouldn't object in this specific
> >>> case. But this code is used by drivers from probe(), hence printing the error
> >>> without saying for which device it did occur is a bit pointless.
> >>
> >> Thinking a little about this, yes, we don't know the device here. But:
> >> Does the device matter here?
> > 
> > If the above fails it means that for a (specific) device a driver expects that
> > a specific property of some firmware node is present. So, yes, I think it does
> > matter.
> > 
> >> There is nothing wrong with the (unknown)
> >> device, no? What is wrong here is the firmware (node). It misses
> >> something.
> > 
> > How do we know the firmware node is wrong? Maybe the driver has wrong
> > expectations for this device?
> > 
> >> And this is exactly what the message tells: "There is an
> >> error due to the missing node 'name' in 'path', please fix it". That
> >> should be sufficient to identify the firmware/device tree description
> >> and fix it.
> > 
> > I think we can't always fix them, even if they're wrong. How do we fix ACPI
> > firmware nodes for instance?
> 
> So the argument here is that the device (driver) is expecting something
> to be "required" is wrong and might need to be fixed. Not the firmware.
> Yes, ok, that is a valid argument. I have a device tree background and
> there in 99% of the cases the device tree needs a fix ;)
> 
> But let me ask the other way around, then: What will it hurt or break if
> we keep the pr_err() like Remo did? Even knowing that its not perfect?
> But knowing that it will give at least a note that something is wrong
> with at least a starting point for searching what needs to be fixed. I
> mean even if we don't get the device, we will get the affected node we
> can search for which device uses it as "required".
> 
> Could we somehow agree that in 90% of the cases this should be catched
> at device (driver) development time, already?

I don't see why *catching* such errors needs pr_err() in core code; without it
you still get a Result as return value that you need to handle in some way.

> And therefore it should be
> beneficial if we don't require each and every driver to be "bloated"
> with checking this individually?

I guess you mean "bloated with *printing* this individually", rather than
"checking".

This is where we disagree: I think it is "bloating" the core kernel instead if
we start adding error prints to core code, where a proper error code is
propagated up to the driver.

I did say that I would agree to a certain extend with this specific one if we
could print it properly, since it is designed to leave no doubt that returning
an error code from required() is fatal for the driver. But I'm not even sure
about this anymore.

I still haven't read a reason why this one is so crucial to print from core
code, while for other things that are always fatal (e.g. request_irq()) we
don't.

However, if you really think we need a common helper that prints something in
the error case, maybe we can add an *additional* helper

	pub fn required_by(self, dev: &Device) -> Result<T>

and document that it is the same as required(), with an additional error print
in case of failure for the given device.

- Danilo
