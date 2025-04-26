Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A7E1B6CE9;
	Sat, 26 Apr 2025 14:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745677194; cv=none; b=M8nl7NzRisN0MUubZ/CVEaCar0ZtgbGwooQ9UHZFL3KjJqeMCJWGwNMDCxCYhVS5y0A8a/Y5xaInLvYjimzsSjqxuwuN/19Yw1sXsqNH/7ayDiXBMmO0c5wXn5V3HfJYzp+Z5gTeXz0s12cmkpZ2S6UZpixiKay5tj7AOcOPHxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745677194; c=relaxed/simple;
	bh=zvjiuLsrY0grFT63hFRfh2MOqT5Pm8LhV/lN+C77p1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TwzLm+YzpAfgjDQKTuj1jOC/NndVwbMA+tX+msUgkRgowrGnuOReF5JXs8EDUUahgw4Mn4Tf6zk6YVVAoe9NTq+ywPco8l0XLRNKA6Shv4ZHuBmS6Hx4MQeWBHM2jgl8zl5M8y4iIlUoCJK3wJ7NIAT5vhNF7nQvjJudVg6yrf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p1LNy2a6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p1LNy2a6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 651CDC4CEE2;
	Sat, 26 Apr 2025 14:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745677194;
	bh=zvjiuLsrY0grFT63hFRfh2MOqT5Pm8LhV/lN+C77p1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p1LNy2a6qCLSl3OD9CFK+g4now/LWDkSE//6zT+6oHGc2fjacRMb9da8qAvRYz2tu
	 NxprnHpp78nxX2xbE668fgrgfLK/aNxtI/vOS5nV30j0XqUstHH9wKhhaBzPyodSQL
	 QHmo5z/b0BygUBI4s+FPjMolNFUJ544hm94SNyrJGyzx59Q2pTTZm+8ZHVBXFx2x7P
	 Ck2LvzyAa290/kbbKA6ocG64TheAzedxmVn5ocUgEpRElqjXXED6SEaIunEhMB0ub/
	 HUBjZyYK12HyVViHYmSlfWqMJ+mzMtKpMpxzObSzGl7hHjpzin4HJRPtOtdnJ6muOI
	 zBWh8C1KEZkMA==
Date: Sat, 26 Apr 2025 16:19:47 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Remo Senekowitsch <remo@buenzli.dev>
Cc: Dirk Behme <dirk.behme@gmail.com>, Rob Herring <robh@kernel.org>,
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
Message-ID: <aAzrg31NB2g0X4qL@cassiopeiae>
References: <20250425150130.13917-1-remo@buenzli.dev>
 <20250425150130.13917-4-remo@buenzli.dev>
 <aAuryiI0lY4qYyIt@pollux>
 <81a65d89-b3e1-4a52-b385-6c8544c76dd2@gmail.com>
 <aAyyR5LyhmGVNQpm@pollux>
 <D9GIUOH0CKE4.3R01AYKCCG54O@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D9GIUOH0CKE4.3R01AYKCCG54O@buenzli.dev>

On Sat, Apr 26, 2025 at 01:08:39PM +0200, Remo Senekowitsch wrote:
> On Sat Apr 26, 2025 at 12:15 PM CEST, Danilo Krummrich wrote:
> > On Sat, Apr 26, 2025 at 08:19:09AM +0200, Dirk Behme wrote:
> >> On 25.04.25 17:35, Danilo Krummrich wrote:
> >> > On Fri, Apr 25, 2025 at 05:01:26PM +0200, Remo Senekowitsch wrote:
> >> >> This abstraction is a way to force users to specify whether a property
> >> >> is supposed to be required or not. This allows us to move error
> >> >> logging of missing required properties into core, preventing a lot of
> >> >> boilerplate in drivers.
> >> >>
> >> >> It will be used by upcoming methods for reading device properties.
> >> >>
> >> >> Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
> >> >> ---
> >> >>  rust/kernel/device/property.rs | 57 ++++++++++++++++++++++++++++++++++
> >> >>  1 file changed, 57 insertions(+)
> >> >>
> >> >> diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/property.rs
> >> >> index 28850aa3b..de31a1f56 100644
> >> >> --- a/rust/kernel/device/property.rs
> >> >> +++ b/rust/kernel/device/property.rs
> >> >> @@ -146,3 +146,60 @@ unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
> >> >>          unsafe { bindings::fwnode_handle_put(obj.cast().as_ptr()) }
> >> >>      }
> >> >>  }
> >> >> +
> >> >> +/// A helper for reading device properties.
> >> >> +///
> >> >> +/// Use [`Self::required`] if a missing property is considered a bug and
> >> >> +/// [`Self::optional`] otherwise.
> >> >> +///
> >> >> +/// For convenience, [`Self::or`] and [`Self::or_default`] are provided.
> >> >> +pub struct PropertyGuard<'fwnode, 'name, T> {
> >> >> +    /// The result of reading the property.
> >> >> +    inner: Result<T>,
> >> >> +    /// The fwnode of the property, used for logging in the "required" case.
> >> >> +    fwnode: &'fwnode FwNode,
> >> >> +    /// The name of the property, used for logging in the "required" case.
> >> >> +    name: &'name CStr,
> >> >> +}
> >> >> +
> >> >> +impl<T> PropertyGuard<'_, '_, T> {
> >> >> +    /// Access the property, indicating it is required.
> >> >> +    ///
> >> >> +    /// If the property is not present, the error is automatically logged. If a
> >> >> +    /// missing property is not an error, use [`Self::optional`] instead.
> >> >> +    pub fn required(self) -> Result<T> {
> >> >> +        if self.inner.is_err() {
> >> >> +            pr_err!(
> >> >> +                "{}: property '{}' is missing\n",
> >> >> +                self.fwnode.display_path(),
> >> >> +                self.name
> >> >> +            );
> >> > 
> >> > Hm, we can't use the device pointer of the fwnode_handle, since it is not
> >> > guaranteed to be valid, hence the pr_*() print...
> >> > 
> >> > Anyways, I'm not sure we need to print here at all. If a driver wants to print
> >> > that it is unhappy about a missing required property it can do so by itself, I
> >> > think.
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
> >
> > Drivers can still decide to properly print the error if the returned Result
> > indicates one.
> 
> One alternative would be to store a reference count to the device in
> `FwNode`. At that point we'd be guaranteed to have a valid reference
> whenever we want to log something.

Yes, that would work. However, I'm not convinced that it's worth to store an
ARef<Device> (i.e. take a device reference) in each FwNode structure *only* to
be able to force an error print if a required device property isn't available.

Why do you think it is important to force this error print by having it in
PropertyGuard::required() and even take an additional device reference for this
purpose, rather than leaving it to the driver when to print a message for an
error condition that makes it fail to probe()?
