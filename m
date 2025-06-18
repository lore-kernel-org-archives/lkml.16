Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C482DE1EF;
	Wed, 18 Jun 2025 11:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750246639; cv=none; b=mmxmYnNE0zUtWWLrv9W6psQBpbfXZyOfLWdNmou8AatMmNcHb8rJq/QMw1INonhJRmud+vQedSQz4iMet4P91E828/onMcmxODkzxcijBCO6dMVE8T9V5dOToEp1DD37gf7z+0IqcFyIlNRI8iCH1w3VRgoAaiW1ZG/2wnx9ID8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750246639; c=relaxed/simple;
	bh=miWVdcEmACn9TbAvm2+Yx19kNh+0z9kIGEcvC9jyLfs=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=HNM5McU1KovxmLW1i2Kf952SmPtIlM51ODt+WT7A16fv2IGQUlmOHxoJ8AyecrfWdogxOOSLWbkQdeYrX/ELjh4fZGhRyKca4PFFCwjcllXxRNNit3Q5mKfvSsYrHu2kapVtJG5mZImUx8Mc07HyoOZdmns3VeYmyaw2sW8HHzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4bMhY56J3rz9tNN;
	Wed, 18 Jun 2025 13:37:13 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Jun 2025 13:37:08 +0200
Message-Id: <DAPMND2X0QHE.1N0NF7R1F8J1G@buenzli.dev>
From: "Remo Senekowitsch" <remo@buenzli.dev>
To: "Danilo Krummrich" <dakr@kernel.org>, "Rob Herring" <robh@kernel.org>
Cc: "Saravana Kannan" <saravanak@google.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Mark
 Brown" <broonie@kernel.org>, "Dirk Behme" <dirk.behme@de.bosch.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v1 3/3] samples: rust: platform: Add property child and
 reference args examples
References: <20250616154511.1862909-1-remo@buenzli.dev>
 <20250616154511.1862909-4-remo@buenzli.dev>
 <CAL_JsqKXrsdGjTE5KDkqmVHUK5urMJnWSLWgEi8H1yM21gcOCA@mail.gmail.com>
 <aFFpmKLKR2hGs1I1@pollux>
In-Reply-To: <aFFpmKLKR2hGs1I1@pollux>

On Tue Jun 17, 2025 at 3:11 PM CEST, Danilo Krummrich wrote:
> On Tue, Jun 17, 2025 at 08:01:08AM -0500, Rob Herring wrote:
>> On Mon, Jun 16, 2025 at 10:45=E2=80=AFAM Remo Senekowitsch <remo@buenzli=
.dev> wrote:
>> > @@ -91,6 +95,13 @@ fn properties_parse(dev: &device::Device) -> Result=
 {
>> >          let prop: KVec<i16> =3D fwnode.property_read_array_vec(name, =
4)?.required_by(dev)?;
>> >          dev_info!(dev, "'{name}'=3D'{prop:?}' (KVec)\n");
>> >
>> > +        for child in fwnode.children() {
>> > +            let name =3D c_str!("test,ref-arg");
>> > +            let nargs =3D NArgs::N(2);
>> > +            let prop: FwNodeReferenceArgs =3D child.property_get_refe=
rence_args(name, nargs, 0)?;
>>=20
>> Is there some reason we can just pass 2 in rather than nargs? Seems
>> overly verbose for my tastes.
>
> It's because you could also pass NArgs::Prop("foo-bar") to indicate the t=
he
> name of the property telling the number of arguments.
>
> NArgs is defined as
>
> 	pub enum NArgs<'a> {
> 	    /// The name of the property of the reference indicating the number =
of
> 	    /// arguments.
> 	    Prop(&'a CStr),
> 	    /// The known number of arguments.
> 	    N(u32),
> 	}
>
> and FwNode::property_get_reference_args() can match against the correspon=
ding
> enum variant to cover both cases.

I guess we could make the function generic if that's deemed worth it?
A trait and an implementation for `u32` and `&CStr` each. Similar to how
we made `property_read` generic.

>> > +            dev_info!(dev, "'{name}'=3D'{prop:?}'\n");
>> > +        }
>> > +
>> >          Ok(())
>> >      }
>> >  }
>> > --
>> > 2.49.0
>> >

