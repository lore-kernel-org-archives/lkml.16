Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7497AF9D9;
	Sun, 27 Apr 2025 12:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745756606; cv=none; b=VY3mrvKO4Fcncj7gbobQxOlgiYn29FCFCSIbhFCSVbPNIB7X+RF7JmLi5I4D6/WWCxfsP+ZGUSBWf+1oNBJSz8bQ8lJBCVx+FyuUJd1DQiOeHYQfta1X5mc+JbNVrgFAJXWAjjF6V1KyRj390DM502c+srts191jAnhsq8bTqTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745756606; c=relaxed/simple;
	bh=5lF9R3W3tII2MDLw+0o9ahkg2UFpuIiu8LfXbM8rc3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tbg9WVthhfE7f0YSMSbmU88inI2utZQ25XF8LSgAwXX/M909FAzDMZ/I0qfzSndLHHvlmjkUSLOWhwmQi+TFjSJd6sEPYG8Iju80MU98aun71+OTnscYvsL99Vagva5MGFJOyhD0TZ2yG8YCAaG3jdxZU2VBnuVw6gJ47nLgGUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZDzgRD2A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZDzgRD2A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52354C4CEE3;
	Sun, 27 Apr 2025 12:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745756605;
	bh=5lF9R3W3tII2MDLw+0o9ahkg2UFpuIiu8LfXbM8rc3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZDzgRD2Aas89Hajq0s1tPy4PsfnN9yU9O9kTsUFjifH2QcFhw+8m7GEbvwEDCNP9P
	 8KLWoWVcwAJRpPbn0kvlNhjdcu2FkWjMwbC/OUQnYRoPPcRFYsuOMV5FFYz9WP339p
	 FcljDkh5eBTNf+8mLX6LodBvmWSuSuw5PjFVUspf80YzBDmpYMzN1AUpFYQpf67D/p
	 FGBFOOc7x+lmp0NpWG3r308g2rARe3uRscXB1OIEC/wxdVni0RLR4+m0ElrGgtdnic
	 RsIxMY+wD1hFFOXg01o28kAFWjRUes6MXrfg9ntoDRc5DIR5pEakMgrY90t1u7Eyi4
	 p8hscvFKnP2qQ==
Date: Sun, 27 Apr 2025 14:23:19 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Dirk Behme <dirk.behme@gmail.com>
Cc: Remo Senekowitsch <remo@buenzli.dev>, Rob Herring <robh@kernel.org>,
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
	Dirk Behme <dirk.behme@de.bosch.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 3/7] rust: property: Introduce PropertyGuard
Message-ID: <aA4ht5sUic39mnHj@pollux>
References: <20250425150130.13917-1-remo@buenzli.dev>
 <20250425150130.13917-4-remo@buenzli.dev>
 <aAuryiI0lY4qYyIt@pollux>
 <81a65d89-b3e1-4a52-b385-6c8544c76dd2@gmail.com>
 <aAyyR5LyhmGVNQpm@pollux>
 <0756503c-02e7-477a-9e89-e7d4881c8ce6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0756503c-02e7-477a-9e89-e7d4881c8ce6@gmail.com>

On Sun, Apr 27, 2025 at 08:11:58AM +0200, Dirk Behme wrote:
> On 26.04.25 12:15, Danilo Krummrich wrote:
> > On Sat, Apr 26, 2025 at 08:19:09AM +0200, Dirk Behme wrote:
> >> On 25.04.25 17:35, Danilo Krummrich wrote:
> >>> On Fri, Apr 25, 2025 at 05:01:26PM +0200, Remo Senekowitsch wrote:
> >>>> +impl<T> PropertyGuard<'_, '_, T> {
> >>>> +    /// Access the property, indicating it is required.
> >>>> +    ///
> >>>> +    /// If the property is not present, the error is automatically logged. If a
> >>>> +    /// missing property is not an error, use [`Self::optional`] instead.
> >>>> +    pub fn required(self) -> Result<T> {
> >>>> +        if self.inner.is_err() {
> >>>> +            pr_err!(
> >>>> +                "{}: property '{}' is missing\n",
> >>>> +                self.fwnode.display_path(),
> >>>> +                self.name
> >>>> +            );
> >>>
> >>> Hm, we can't use the device pointer of the fwnode_handle, since it is not
> >>> guaranteed to be valid, hence the pr_*() print...
> >>>
> >>> Anyways, I'm not sure we need to print here at all. If a driver wants to print
> >>> that it is unhappy about a missing required property it can do so by itself, I
> >>> think.
> >>
> >> Hmm, the driver said by using 'required' that it *is* required. So a
> >> missing property is definitely an error here. Else it would have used
> >> 'optional'. Which doesn't print in case the property is missing.
> >>
> >> If I remember correctly having 'required' and 'optional' is the result
> >> of some discussion on Zulip. And one conclusion of that discussion was
> >> to move checking & printing the error out of the individual drivers
> >> into a central place to avoid this error checking & printing in each
> >> and every driver. I think the idea is that the drivers just have to do
> >> ...required()?; and that's it, then.
> > 
> > Yes, I get the idea.
> > 
> > If it'd be possible to use dev_err!() instead I wouldn't object in this specific
> > case. But this code is used by drivers from probe(), hence printing the error
> > without saying for which device it did occur is a bit pointless.
> 
> Thinking a little about this, yes, we don't know the device here. But:
> Does the device matter here?

If the above fails it means that for a (specific) device a driver expects that
a specific property of some firmware node is present. So, yes, I think it does
matter.

> There is nothing wrong with the (unknown)
> device, no? What is wrong here is the firmware (node). It misses
> something.

How do we know the firmware node is wrong? Maybe the driver has wrong
expectations for this device?

> And this is exactly what the message tells: "There is an
> error due to the missing node 'name' in 'path', please fix it". That
> should be sufficient to identify the firmware/device tree description
> and fix it.

I think we can't always fix them, even if they're wrong. How do we fix ACPI
firmware nodes for instance?

(Software nodes provide a solution for that, see also commit 59abd83672f7
("drivers: base: Introducing software nodes to the firmware node framework").)
