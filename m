Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26A54C9D;
	Wed, 18 Jun 2025 14:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750256179; cv=none; b=nk7CZjqPPoBANPjGS+LJ/inTgulrORU6VTjprDGEK3eYO/NtwMAjshthSMhP6z/2QjthHFoLu0fGBnniJfJbI2+fM5iT/8NYve9baoPqje5Z5s8S//3ipkQ0bd2C6/1dMYqT66vx1jORi9PBR9Nqihx8b5E0ycqUYBhhBLwnXoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750256179; c=relaxed/simple;
	bh=AOJIIPCDy2pFBp8SjVbpE+WPNLuRlmHXWTuQl6cyooA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C9Ui5GeQ3XVhHQQXOKL3QwauYvF3rBjg4i9Cn4Q8iGdE1BNEWbp5sOyMaIuocA7uP5cdTkOTZyjZQ1lQIk7bi+tOXGZ83G3qprpX+v2eWoeNAZeJewFwrJHyvUO0ZsZ3Cxe632/rg6yr8mEUU+IX6PMglqd6H/g4h+BJMRd6fjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NlzmgwNi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NlzmgwNi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87A0AC4CEE7;
	Wed, 18 Jun 2025 14:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750256176;
	bh=AOJIIPCDy2pFBp8SjVbpE+WPNLuRlmHXWTuQl6cyooA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NlzmgwNi54dB6Lh1GR0H3qTJOrKlDkXjmofrM4rxAzydwut2AliMh93e+YqQfW71A
	 VtUn91tAE5kO58VrrQkY7j3VVh+knjW4mbWvRC/MfmN7FktP75vmew4ljXDQgC55Op
	 y9SQ4L3s4qysm8SmxZCOqiVItuJ6vtV4kduwwOh+lfFhrN0ibq0DVo82A4O0eDr4kP
	 7a01OWrIDyTKoRRVECWKsSnD74ghdmYHY6f0a6eS9TwzTg9qnZ5ftPdtUZJfvOXxAi
	 hpP23zBIuj9VsJGED1ZkXkM6uqIOdtNqnGFc944Uet/Oo5LmFo41X5MWQr/idZOxrA
	 1qi1joxJNj0tw==
Date: Wed, 18 Jun 2025 16:16:10 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Remo Senekowitsch <remo@buenzli.dev>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Mark Brown <broonie@kernel.org>,
	Dirk Behme <dirk.behme@de.bosch.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v1 3/3] samples: rust: platform: Add property child and
 reference args examples
Message-ID: <aFLKKr1bQue9iuTk@pollux>
References: <20250616154511.1862909-1-remo@buenzli.dev>
 <20250616154511.1862909-4-remo@buenzli.dev>
 <CAL_JsqKXrsdGjTE5KDkqmVHUK5urMJnWSLWgEi8H1yM21gcOCA@mail.gmail.com>
 <aFFpmKLKR2hGs1I1@pollux>
 <DAPMND2X0QHE.1N0NF7R1F8J1G@buenzli.dev>
 <20250618133155.GB1550757-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250618133155.GB1550757-robh@kernel.org>

On Wed, Jun 18, 2025 at 08:31:55AM -0500, Rob Herring wrote:
> On Wed, Jun 18, 2025 at 01:37:08PM +0200, Remo Senekowitsch wrote:
> > On Tue Jun 17, 2025 at 3:11 PM CEST, Danilo Krummrich wrote:
> > > On Tue, Jun 17, 2025 at 08:01:08AM -0500, Rob Herring wrote:
> > >> On Mon, Jun 16, 2025 at 10:45 AM Remo Senekowitsch <remo@buenzli.dev> wrote:
> > >> > @@ -91,6 +95,13 @@ fn properties_parse(dev: &device::Device) -> Result {
> > >> >          let prop: KVec<i16> = fwnode.property_read_array_vec(name, 4)?.required_by(dev)?;
> > >> >          dev_info!(dev, "'{name}'='{prop:?}' (KVec)\n");
> > >> >
> > >> > +        for child in fwnode.children() {
> > >> > +            let name = c_str!("test,ref-arg");
> > >> > +            let nargs = NArgs::N(2);
> > >> > +            let prop: FwNodeReferenceArgs = child.property_get_reference_args(name, nargs, 0)?;
> > >> 
> > >> Is there some reason we can just pass 2 in rather than nargs? Seems
> > >> overly verbose for my tastes.
> > >
> > > It's because you could also pass NArgs::Prop("foo-bar") to indicate the the
> > > name of the property telling the number of arguments.
> > >
> > > NArgs is defined as
> > >
> > > 	pub enum NArgs<'a> {
> > > 	    /// The name of the property of the reference indicating the number of
> > > 	    /// arguments.
> > > 	    Prop(&'a CStr),
> > > 	    /// The known number of arguments.
> > > 	    N(u32),
> > > 	}
> > >
> > > and FwNode::property_get_reference_args() can match against the corresponding
> > > enum variant to cover both cases.
> > 
> > I guess we could make the function generic if that's deemed worth it?
> > A trait and an implementation for `u32` and `&CStr` each. Similar to how
> > we made `property_read` generic.

I don't think that's worth it; I think the current version is fine as it is.

> There is a case where the cells property is optional and we fallback to 
> 0 cells if not found. #msi-cells is an example. I imagine NArgs could 
> express that while a generic could not? In any case, I don't expect 
> drivers to have to deal with that as it would be subsystem code handling 
> it.
> 
> As-is is fine I think. This function isn't too widely used that it could 
> be changed later if we change our minds.

Agreed.
