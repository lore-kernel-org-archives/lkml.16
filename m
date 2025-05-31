Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C7B1EDA02;
	Sat, 31 May 2025 12:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748694295; cv=none; b=Oai4HwHW9ikkrY7LB7caZf4vLShWAWephSPruKPhDnRGoqcmm57cRWI56Ck7ityIkj6177u4g72SAn5rPuwzu8DYv//wzlfr28cRGyKDbxaDH8ddGXloHOvGZ57lNG1UpE9Y0X4+4/nee6QQ+0mbBzyjkwR0DT+dlk+m65klHDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748694295; c=relaxed/simple;
	bh=zjDPoVOSfkcrVTFow4R0P40L1Sy8ujWeHLMMwa94e+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CrEHPZd2SnR9492v/fwXl6QQFGb4Liuyt8rN6Wj8IsNp4WUHYwzeInsn2z0bQxh+OGA8RMAUfn7GfyZziXI1po0ldNEyc1iittxzW9zNym2bkuKcNTHV/Rbj5egZ3bEVPPWrK5axF/2uU0cDwtNedmljZ+XkZDSZ/iyHJYtOQwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XGthnRo1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XGthnRo1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B069C4CEE3;
	Sat, 31 May 2025 12:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748694295;
	bh=zjDPoVOSfkcrVTFow4R0P40L1Sy8ujWeHLMMwa94e+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XGthnRo1MzoqjktqwkqFm4ou8/ncQIGwt1L6vyGQnOwbPDj9vqHsXkrinolnhWmuE
	 WwhONxdMNxM5Hd0i0ZB3+FlItLVuCAs3rldE7M8lKhKVjiRv24nRSsOcEz6DO7aBF6
	 Rct/oWzuI4eKEsZO3Xb1/JCNCR+bbdjkKILiU5tyo9XKlrDvbrmz4HOc6IktX55VzJ
	 PJoSLvfjWVWFk+bCBJHJIKCZz9PYMIkY5fSEy+K4JI9QGtC40GVmxo22udt0Q6/sUD
	 xrnCr3EMUMmR5PRqydTNbzuMnyIGqlALXA00Abnpj7kuOiMWlpFtoPkpZlbq25bjSP
	 B04weEmWl5j+w==
Date: Sat, 31 May 2025 14:24:49 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Benno Lossin <lossin@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	chrisi.schrefl@gmail.com, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] rust: sample: misc: implement device driver sample
Message-ID: <aDr1EWOIeDVgjau9@pollux>
References: <20250530142447.166524-1-dakr@kernel.org>
 <20250530142447.166524-8-dakr@kernel.org>
 <DA9RRZVPZSMW.1LGW9H4G0RLT5@kernel.org>
 <aDowAzvEvrQcella@pollux>
 <DAA6ZTTNP0CM.270XX92YOFGWB@kernel.org>
 <aDrZ7ma_aNki3FRz@pollux>
 <DAABXF5QDYF0.21V01UJODPM89@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DAABXF5QDYF0.21V01UJODPM89@kernel.org>

On Sat, May 31, 2025 at 02:03:05PM +0200, Benno Lossin wrote:
> On Sat May 31, 2025 at 12:29 PM CEST, Danilo Krummrich wrote:
> > On Sat, May 31, 2025 at 10:11:08AM +0200, Benno Lossin wrote:
> >> On Sat May 31, 2025 at 12:24 AM CEST, Danilo Krummrich wrote:
> >> > On Fri, May 30, 2025 at 10:15:37PM +0200, Benno Lossin wrote:
> >> >> On Fri May 30, 2025 at 4:24 PM CEST, Danilo Krummrich wrote:
> >> >> > +config SAMPLE_RUST_MISC_DEVICE_WITH_PARENT
> >> >> > +	bool "Create a misc device with a parent device"
> >> >> > +	depends on SAMPLE_RUST_MISC_DEVICE
> >> >> > +	default n
> >> >> > +	help
> >> >> > +	  Say Y here if you want the misc device sample to create a misc
> >> >> > +	  device with a parent device.
> >> >> > +
> >> >> 
> >> >> Why not create a separate file? The `cfg`s might confuse newcomers
> >> >> looking at the sample.
> >> >
> >> > It would be a lot of duplicated code, unless we really *only* exercise the
> >> > device creation and registration part, which would be a bit unfortunate, given
> >> > that this sample is also a pretty good test.
> >> 
> >> We could separate the common parts into a single file and then
> >> `include!` that file from the two samples. (Or if the build system
> >> supports multi-file samples then just use that, but my gut feeling is
> >> that it doesn't)
> >
> > The samples are normal modules, where we can have multiple files. But I don't
> > see how that helps.
> >
> > `include!` works, but I'm not sure it's that much better.
> >
> > Another option would be to put the `cfg` on the module!() macro itself and have
> > two separate module types, this way there is only a `cfg` on the two module!()
> > invocations.
> 
> How about we do it like this:
> 
> We create samples/rust/rust_misc_device/{module.rs,parent.rs,common.rs}
> and `module.rs`/`parent.rs` are the two entry points. Both of these
> files:
> * include `common.rs` using `include!` at the very top.
> * define a `RustMiscDeviceModule` struct and implmement `InPlaceModule`
>   for it.
> 
> The module-level docs, common imports constants, `module!` invocation &
> other definitions stay in `common.rs`.
> 
> This way we can build them at the same time and have no cfgs :)

Seems reasonable to me -- let's do that then.
