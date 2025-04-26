Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FFC1B4F0F;
	Sat, 26 Apr 2025 10:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745662542; cv=none; b=TihR8Zngmbbg5wVzYMS2Bxn267HYHYwfOHfMXuISueq0DlG+oGh8Zk3Fus3+3ds+6u13l/9BjT/xD2RBaIohQWEUoxMBLI+gPP27Jk4Y68XxtkcVoLeY3he4ndiXMlCeL4yN/klTxvLH09y/2Rg5v+XepsMvn4LxXknHKwrbrAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745662542; c=relaxed/simple;
	bh=hry7/PUHiav3tgWqoqsQqrRYhZ9+bBE+V2R9v/Y/I14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=taUxgcJP2xVKHx3In2BTVVIxvA+4F/aRPt8gOdJbESXBhWKPe6M6t9xsuI1g3gE/R6gmQQCeBnZXe1g0XDUlbVdkRYIXTHWc+z20lL+gMMQgUmRIHYyBFPLLQH+dIrtGpNJRqdrA9MNhw59R/aY7HkvBmilmKXcPtje3R5RgIZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FUhQtHjy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FUhQtHjy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E224C4CEE2;
	Sat, 26 Apr 2025 10:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745662542;
	bh=hry7/PUHiav3tgWqoqsQqrRYhZ9+bBE+V2R9v/Y/I14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FUhQtHjyxIUc2biG2aheOhyo3/N/rd5wvpNcK8N3vj80Yo0+S1b4dklyKAGGe90W0
	 PE1SZpuT79hZbd/xuFEI/8ZvEmPAKCkJOcmT/xIvon89nHso4PASyabQ1w/+DDb8u4
	 UfwcNZyReTcfm6CZo1Hb/VFaTFTwin7b6JGq79q2xX3dZI2BE7dLuHXGfU5SnDAMMR
	 fyAw1s+y4uZsSxJVydTRoRwK6yVkzHYpQmT7blO67m/Y3VkuTg8baAL1Aw3VfW4IAA
	 g43G5ytHuAyPawDhCwSxbveQsiwqPtE7eyZWp+1xNc4hnNmHU965ajEaJIKLIDFfyN
	 yH/98CwxFOdRA==
Date: Sat, 26 Apr 2025 12:15:35 +0200
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
Message-ID: <aAyyR5LyhmGVNQpm@pollux>
References: <20250425150130.13917-1-remo@buenzli.dev>
 <20250425150130.13917-4-remo@buenzli.dev>
 <aAuryiI0lY4qYyIt@pollux>
 <81a65d89-b3e1-4a52-b385-6c8544c76dd2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81a65d89-b3e1-4a52-b385-6c8544c76dd2@gmail.com>

On Sat, Apr 26, 2025 at 08:19:09AM +0200, Dirk Behme wrote:
> On 25.04.25 17:35, Danilo Krummrich wrote:
> > On Fri, Apr 25, 2025 at 05:01:26PM +0200, Remo Senekowitsch wrote:
> >> This abstraction is a way to force users to specify whether a property
> >> is supposed to be required or not. This allows us to move error
> >> logging of missing required properties into core, preventing a lot of
> >> boilerplate in drivers.
> >>
> >> It will be used by upcoming methods for reading device properties.
> >>
> >> Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
> >> ---
> >>  rust/kernel/device/property.rs | 57 ++++++++++++++++++++++++++++++++++
> >>  1 file changed, 57 insertions(+)
> >>
> >> diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/property.rs
> >> index 28850aa3b..de31a1f56 100644
> >> --- a/rust/kernel/device/property.rs
> >> +++ b/rust/kernel/device/property.rs
> >> @@ -146,3 +146,60 @@ unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
> >>          unsafe { bindings::fwnode_handle_put(obj.cast().as_ptr()) }
> >>      }
> >>  }
> >> +
> >> +/// A helper for reading device properties.
> >> +///
> >> +/// Use [`Self::required`] if a missing property is considered a bug and
> >> +/// [`Self::optional`] otherwise.
> >> +///
> >> +/// For convenience, [`Self::or`] and [`Self::or_default`] are provided.
> >> +pub struct PropertyGuard<'fwnode, 'name, T> {
> >> +    /// The result of reading the property.
> >> +    inner: Result<T>,
> >> +    /// The fwnode of the property, used for logging in the "required" case.
> >> +    fwnode: &'fwnode FwNode,
> >> +    /// The name of the property, used for logging in the "required" case.
> >> +    name: &'name CStr,
> >> +}
> >> +
> >> +impl<T> PropertyGuard<'_, '_, T> {
> >> +    /// Access the property, indicating it is required.
> >> +    ///
> >> +    /// If the property is not present, the error is automatically logged. If a
> >> +    /// missing property is not an error, use [`Self::optional`] instead.
> >> +    pub fn required(self) -> Result<T> {
> >> +        if self.inner.is_err() {
> >> +            pr_err!(
> >> +                "{}: property '{}' is missing\n",
> >> +                self.fwnode.display_path(),
> >> +                self.name
> >> +            );
> > 
> > Hm, we can't use the device pointer of the fwnode_handle, since it is not
> > guaranteed to be valid, hence the pr_*() print...
> > 
> > Anyways, I'm not sure we need to print here at all. If a driver wants to print
> > that it is unhappy about a missing required property it can do so by itself, I
> > think.
> 
> Hmm, the driver said by using 'required' that it *is* required. So a
> missing property is definitely an error here. Else it would have used
> 'optional'. Which doesn't print in case the property is missing.
> 
> If I remember correctly having 'required' and 'optional' is the result
> of some discussion on Zulip. And one conclusion of that discussion was
> to move checking & printing the error out of the individual drivers
> into a central place to avoid this error checking & printing in each
> and every driver. I think the idea is that the drivers just have to do
> ...required()?; and that's it, then.

Yes, I get the idea.

If it'd be possible to use dev_err!() instead I wouldn't object in this specific
case. But this code is used by drivers from probe(), hence printing the error
without saying for which device it did occur is a bit pointless.

Drivers can still decide to properly print the error if the returned Result
indicates one.
