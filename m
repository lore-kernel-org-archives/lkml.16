Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BEE523A;
	Mon,  2 Jun 2025 17:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748886347; cv=none; b=YgPB191qEK+d+sq+JeZ1bStCng0MbgfTQDBc82WIHu1B8HTooY8Kho/OLHl0VBLL+cGGr+e5/zTOI4HUkWEjCDwovPakayHt1us5DjCYrMD8/kXxIo86vwdkX/gygJUHFkQHVEwkBobgIWvgwOmUetj+Occ29uR6uQwYaSCBIeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748886347; c=relaxed/simple;
	bh=cmbRGzAjJbcU9RL43GysVar9nkxMGOGwNZHu/XCzKYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B1a6x8suOIevfgQyU+ZWXAdUk1CJNY2sw7Cr0hMiDVblEJJ0KykFrI+AqhJjKm/x864peyuwZjJedNbmB010Ts4o2TgNfFlHXuqx0jnOYMRCSsMZFiEWDyR5CNX/qOJo6BrKPIE/c0CcHusb8dSnhn1YsDovPsQ2q7jESf/QeMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FrXTRgOp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FrXTRgOp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2094C4CEEB;
	Mon,  2 Jun 2025 17:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748886346;
	bh=cmbRGzAjJbcU9RL43GysVar9nkxMGOGwNZHu/XCzKYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FrXTRgOp9pyO95akq2p0KZh/+Mt4AwNc55moU5tw7Ofn7Au8gEqipKsgMEjbDzCy3
	 CyHNnXquTsnSnIjTcyNcUw73GQI94iYoURbDO2tf67x91uUwTeLVhxANp/gi43B/Q8
	 7ymigCbERhnU0PRurvctPGbUaj4gY4P01FHU+Ys+NId210fl+xvtALBfFcZBeSWAQg
	 +eJVG4R5cL0zzNQ3Gt8sxcpSBJ4aZV77OPeij421CWb3U3n8iVu5TuaXq8/7mvnMLp
	 4SWiAMn8s72Lw7+hihzfMBAhmLSsRirTiXUEMYhxtKZ+ta36Z/RD7OkmgMgXwgW8FA
	 c53VMNBscIGGQ==
Date: Mon, 2 Jun 2025 19:45:41 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 2/2] rust: platform: add irq accessors
Message-ID: <aD3jRbuxc0NQt6MC@pollux>
References: <20250514-topics-tyr-request_irq-v3-0-d6fcc2591a88@collabora.com>
 <20250514-topics-tyr-request_irq-v3-2-d6fcc2591a88@collabora.com>
 <aCsK7s0qepzIiA-l@pollux>
 <CA34AB78-D9DC-433A-B6DF-663849A07370@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA34AB78-D9DC-433A-B6DF-663849A07370@collabora.com>

On Mon, Jun 02, 2025 at 11:56:28AM -0300, Daniel Almeida wrote:
> Hi Danilo,
> 
> […]
> 
> >> +
> >> +    /// Same as [`Self::irq_by_name`] but does not print an error message if an IRQ
> >> +    /// cannot be obtained.
> >> +    pub fn optional_irq_by_name(&self, name: &CStr) -> Result<u32> {
> >> +        // SAFETY: `self.as_raw` returns a valid pointer to a `struct platform_device`.
> >> +        let res = unsafe {
> >> +            bindings::platform_get_irq_byname_optional(self.as_raw(), name.as_char_ptr())
> >> +        };
> >> +
> >> +        if res < 0 {
> >> +            return Err(Error::from_errno(res));
> >> +        }
> >> +
> >> +        Ok(res as u32)
> >> +    }
> > 
> > I don't like the indirection of claiming a u32 representing the IRQ number from
> > a bus device and stuffing it into an irq::Registration.
> > 
> > It would be better we we'd make it impossible (or at least harder) for a driver
> > to pass the wrong number to irq::Registration.
> > 
> > I see two options:
> > 
> >  1) Make the platform::Device accessors themselves return an
> >     irq::Registration.
> > 
> >  2) Make the platform::Device accessors return some kind of transparent cookie,
> >     that drivers can't create themselves that can be fed into the
> >     irq::Registration.
> > 
> > My preference would be 1) if there's no major ergonomic issue with that.
> 
> Isn’t 1 way more cluttered?

I don't think so, your irq::Registration::register() function needs a reference
to the registering device anyways.

And given that, now that I think about it, it even has to be this way.

Otherwise, I could provide irq::Registration::register() an IRQ number that does
not belong to the bus device that is passed into irq::Registration::register().

So, irq::Registration::register() even needs to be unsafe, with the safety
requirement that the IRQ number must belong to the corresponding device and
should be wrapped by bus device abstractions providing the safe driver API.

> That's because the accessors would have to forward all of the arguments (i.e.:
> currently 4) to register().

It's only the additional arguments below, which you can also wrap in an
irq::Args structure to keep things cleaner. :)

+        flags: Flags,
+        name: &'static CStr,
+        handler: T,
