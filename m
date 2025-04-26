Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4AD79CF;
	Sat, 26 Apr 2025 15:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745679750; cv=none; b=eXj4bxXmRvThCHRIZRR7cWVeMyOVAtwhrb2Nd/CMOdm56nRa/NuRSQ9Z5GP0WcvaXxd2ibCzQnQQYtGP5Mb66FBJ8glE/VJieo+Z+jpe+vjHO4L+ZHirL0wrBVUzo9vOG4erro0Ytbk38M4K4gBMK8rvrdgEDr/8Jh6VrpiBxJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745679750; c=relaxed/simple;
	bh=vm+BLppbw1VD4WX0DPD3q9NuAeJlDbqTxlZ+9ctOkKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oBlkcNTTfo3MjD06PJsHTMmGLj6Dxn67R+4rRwZWGsrUgTUTOGA00PclghfF9+mvpum52a8dY2lR5F7ukquV5KJWDHjyKn1MsLOMU+/3jtNhS6PtLQG7UVLJDZo8lEw84bnjLbDprJksB6m4kk+Q4tBr0tkn+vhAU8Qf/DzmG20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lm1vUHVN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lm1vUHVN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8004C4CEE2;
	Sat, 26 Apr 2025 15:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745679749;
	bh=vm+BLppbw1VD4WX0DPD3q9NuAeJlDbqTxlZ+9ctOkKo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lm1vUHVNH2GMp5VCJ0wSxwGSSZVshXdpyLM4IgVENZOIZlt9lq5blXFiHzPcbiZ3C
	 usqHNaw5fgQWTfsn1RUhWSyZYQgRFBA6AMVPRxiimQp5gTLuT4pZNnIcXjEdeqmkW1
	 D6wo5vVAM5w0MRF6FLyONqs353v026DoR/dQJZlT+wT2NhPn91nOtB/96ZErif5VQj
	 2O/qZZjknr3KI5eV+psonhcexQkqmigTUH7raw/jLIkAT3EH/HGGaLMKK/bEe2Ze0t
	 AfUOAMA/mftmbxwH3mokmwsYT42BdgskYAD3PgXn11aqwtmCLEUPfPDYFhkvTq+CFy
	 HRAA3ZclTTUDg==
Date: Sat, 26 Apr 2025 17:02:23 +0200
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
Message-ID: <aAz1f2jhdwjXmHex@cassiopeiae>
References: <20250425150130.13917-1-remo@buenzli.dev>
 <20250425150130.13917-4-remo@buenzli.dev>
 <aAuryiI0lY4qYyIt@pollux>
 <81a65d89-b3e1-4a52-b385-6c8544c76dd2@gmail.com>
 <aAyyR5LyhmGVNQpm@pollux>
 <D9GIUOH0CKE4.3R01AYKCCG54O@buenzli.dev>
 <aAzrg31NB2g0X4qL@cassiopeiae>
 <39798ebd-35a8-4a67-9df4-f12a6f20ef11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39798ebd-35a8-4a67-9df4-f12a6f20ef11@gmail.com>

On Sat, Apr 26, 2025 at 04:35:07PM +0200, Dirk Behme wrote:
> On 26.04.25 16:19, Danilo Krummrich wrote:
> > On Sat, Apr 26, 2025 at 01:08:39PM +0200, Remo Senekowitsch wrote:
> >> On Sat Apr 26, 2025 at 12:15 PM CEST, Danilo Krummrich wrote:
> >>> If it'd be possible to use dev_err!() instead I wouldn't object in this specific
> >>> case. But this code is used by drivers from probe(), hence printing the error
> >>> without saying for which device it did occur is a bit pointless.
> >>>
> >>> Drivers can still decide to properly print the error if the returned Result
> >>> indicates one.
> >>
> >> One alternative would be to store a reference count to the device in
> >> `FwNode`. At that point we'd be guaranteed to have a valid reference
> >> whenever we want to log something.
> > 
> > Yes, that would work. However, I'm not convinced that it's worth to store an
> > ARef<Device> (i.e. take a device reference) in each FwNode structure *only* to
> > be able to force an error print if a required device property isn't available.
> > 
> > Why do you think it is important to force this error print by having it in
> > PropertyGuard::required() and even take an additional device reference for this
> > purpose, rather than leaving it to the driver when to print a message for an
> > error condition that makes it fail to probe()?
> 
> To my understanding doing the error print in "core" was proposed by
> Rob [1]:

That is fine, though it doesn't answer my question above. :)
