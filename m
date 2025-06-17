Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6282E7183;
	Tue, 17 Jun 2025 13:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750165919; cv=none; b=OBwC4nBnUWFmkegzoytj73712z1UkOqs01bJoPoXhJH0bOtn1QQZE+/a/DvfRDcfvShipYKhmuQsMqlJpL3a5CtdIMXhpJkTUXeK3rQvSDRBgxYLZYb1ZOC5a7CG//mqes2b0BWQp/oXRqTXDzW0A/3rzNhwGU2FI7Sr1raN7Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750165919; c=relaxed/simple;
	bh=kLpVHH/oSXMyWtAknVnnOLvs1mUmoq/Job7UKUflMWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZokV5P6LyhBs5SnS6GspkN76IPYeR2aSZwpE39F7HeKCHI9sHjhMAORV7MevHjT6bLCGLpYSpx1iwv0N0dyrNPqfyXzr3U60ELPl3wvhDnzb0ix7ZX8GHTVVjI8SouUKxmzHAMgiENL8JYp/Dj5n5d2dimWNSa9JQX+y4VKf9ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rkvDV9HX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rkvDV9HX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F430C4CEE3;
	Tue, 17 Jun 2025 13:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750165918;
	bh=kLpVHH/oSXMyWtAknVnnOLvs1mUmoq/Job7UKUflMWc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rkvDV9HX+sS5KL7PRdL3WMFnyO67XeGcjBX/QFs9fcDIclkUwTEgJNcmTAc+vWHug
	 gmvpPfcr8BC8tEgi44BavGHJqFfGh1IEr+9mfqNRxwB5lDPTFlwganEjeJwF5w/Raw
	 3Jz/yLv+n0a4J3G08mml4+XOvaQBXvPR33V2BQGM91C/VcBse6wopqXKClO16Ps+N+
	 qszS4Vg97PFs1TTPWclO1wk1QAqGYEAm2nMv5sMbGR/eM2vIPvhS7zIB+3+swCgKg3
	 KeEbSPK5eZ4aAUzIRJBUBObE9urTqShqOn377qsPAAGvoJXD9MjfM7RvdjFyPG5cCT
	 Bc/LxB6+MLGBg==
Date: Tue, 17 Jun 2025 15:11:52 +0200
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
Message-ID: <aFFpmKLKR2hGs1I1@pollux>
References: <20250616154511.1862909-1-remo@buenzli.dev>
 <20250616154511.1862909-4-remo@buenzli.dev>
 <CAL_JsqKXrsdGjTE5KDkqmVHUK5urMJnWSLWgEi8H1yM21gcOCA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqKXrsdGjTE5KDkqmVHUK5urMJnWSLWgEi8H1yM21gcOCA@mail.gmail.com>

On Tue, Jun 17, 2025 at 08:01:08AM -0500, Rob Herring wrote:
> On Mon, Jun 16, 2025 at 10:45 AM Remo Senekowitsch <remo@buenzli.dev> wrote:
> > @@ -91,6 +95,13 @@ fn properties_parse(dev: &device::Device) -> Result {
> >          let prop: KVec<i16> = fwnode.property_read_array_vec(name, 4)?.required_by(dev)?;
> >          dev_info!(dev, "'{name}'='{prop:?}' (KVec)\n");
> >
> > +        for child in fwnode.children() {
> > +            let name = c_str!("test,ref-arg");
> > +            let nargs = NArgs::N(2);
> > +            let prop: FwNodeReferenceArgs = child.property_get_reference_args(name, nargs, 0)?;
> 
> Is there some reason we can just pass 2 in rather than nargs? Seems
> overly verbose for my tastes.

It's because you could also pass NArgs::Prop("foo-bar") to indicate the the
name of the property telling the number of arguments.

NArgs is defined as

	pub enum NArgs<'a> {
	    /// The name of the property of the reference indicating the number of
	    /// arguments.
	    Prop(&'a CStr),
	    /// The known number of arguments.
	    N(u32),
	}

and FwNode::property_get_reference_args() can match against the corresponding
enum variant to cover both cases.

> > +            dev_info!(dev, "'{name}'='{prop:?}'\n");
> > +        }
> > +
> >          Ok(())
> >      }
> >  }
> > --
> > 2.49.0
> >
