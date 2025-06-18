Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B61627E1C3;
	Wed, 18 Jun 2025 13:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750253518; cv=none; b=Dcex8OJC5kqEHnz+t87FuXI9T6fag5IGUK+ne8glaGlWZRPwc2Aam0+aLlyrir97yXycE0X6EwcxGgRGxWHwZ9T258qdwDta2SViFpjLLRINEjUp2ACHayjsGcHigb7WCiO5P/sBqtCE8XdyGWThCyT9S8ijdw0OHjTjFnLqg+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750253518; c=relaxed/simple;
	bh=sfxH+ws1wOJOfMLaBxgpISqgTdDurXEqio3nOsX1S/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qBmwagOJL4ZOwOXhkQ7c/l2AF5hQF/0Vt+q9O2sfB36Jx41MdSqoDo6H3/OnAPRjRASLO+gL0FQ66utEs3yvTAgO2Cq3p0IR8kUQNZNP1+FjWHlcs/uE1dkhFUSenCg0ALwletpYM340Y1F+8fCnEM77vNpTjlF8vaRQG8bl5xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pdzdcBhk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pdzdcBhk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9479CC4CEF0;
	Wed, 18 Jun 2025 13:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750253518;
	bh=sfxH+ws1wOJOfMLaBxgpISqgTdDurXEqio3nOsX1S/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pdzdcBhkCzxCjd2GTsH6uIJmKGXeZ9bSr8OoDGcT0UZpXTLgJXCiXwos2WBtrIken
	 wxor2acD3hWrH9UtL9BatEUtrkU0qIaY2VGKKiMB3QLYEW+hVGHpvl1KLX+j5iQldc
	 r5w/4o1KaEHkB2pKRQ/2KBnvhjZ7gTXIe/qsB4Scy4Y+yUYFu27fyuJx6sta3l5Rgm
	 SUAo3qmqsytZ6ZbEXNp8fVnkyEwTZ6fdUbcB7MQE5ZjqgfRl+01PhIUyLUHWaON3z6
	 ul9p1lxSDzF6s3OK7opRDl4Uiy5xeAOiRo5SreBcNZ2ZtZ4LnH1ImV/C3j8I7aMp43
	 XJ3llqp3Bwyjw==
Date: Wed, 18 Jun 2025 08:31:55 -0500
From: Rob Herring <robh@kernel.org>
To: Remo Senekowitsch <remo@buenzli.dev>
Cc: Danilo Krummrich <dakr@kernel.org>,
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
Message-ID: <20250618133155.GB1550757-robh@kernel.org>
References: <20250616154511.1862909-1-remo@buenzli.dev>
 <20250616154511.1862909-4-remo@buenzli.dev>
 <CAL_JsqKXrsdGjTE5KDkqmVHUK5urMJnWSLWgEi8H1yM21gcOCA@mail.gmail.com>
 <aFFpmKLKR2hGs1I1@pollux>
 <DAPMND2X0QHE.1N0NF7R1F8J1G@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DAPMND2X0QHE.1N0NF7R1F8J1G@buenzli.dev>

On Wed, Jun 18, 2025 at 01:37:08PM +0200, Remo Senekowitsch wrote:
> On Tue Jun 17, 2025 at 3:11 PM CEST, Danilo Krummrich wrote:
> > On Tue, Jun 17, 2025 at 08:01:08AM -0500, Rob Herring wrote:
> >> On Mon, Jun 16, 2025 at 10:45 AM Remo Senekowitsch <remo@buenzli.dev> wrote:
> >> > @@ -91,6 +95,13 @@ fn properties_parse(dev: &device::Device) -> Result {
> >> >          let prop: KVec<i16> = fwnode.property_read_array_vec(name, 4)?.required_by(dev)?;
> >> >          dev_info!(dev, "'{name}'='{prop:?}' (KVec)\n");
> >> >
> >> > +        for child in fwnode.children() {
> >> > +            let name = c_str!("test,ref-arg");
> >> > +            let nargs = NArgs::N(2);
> >> > +            let prop: FwNodeReferenceArgs = child.property_get_reference_args(name, nargs, 0)?;
> >> 
> >> Is there some reason we can just pass 2 in rather than nargs? Seems
> >> overly verbose for my tastes.
> >
> > It's because you could also pass NArgs::Prop("foo-bar") to indicate the the
> > name of the property telling the number of arguments.
> >
> > NArgs is defined as
> >
> > 	pub enum NArgs<'a> {
> > 	    /// The name of the property of the reference indicating the number of
> > 	    /// arguments.
> > 	    Prop(&'a CStr),
> > 	    /// The known number of arguments.
> > 	    N(u32),
> > 	}
> >
> > and FwNode::property_get_reference_args() can match against the corresponding
> > enum variant to cover both cases.
> 
> I guess we could make the function generic if that's deemed worth it?
> A trait and an implementation for `u32` and `&CStr` each. Similar to how
> we made `property_read` generic.

There is a case where the cells property is optional and we fallback to 
0 cells if not found. #msi-cells is an example. I imagine NArgs could 
express that while a generic could not? In any case, I don't expect 
drivers to have to deal with that as it would be subsystem code handling 
it.

As-is is fine I think. This function isn't too widely used that it could 
be changed later if we change our minds.

Rob
