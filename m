Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C34513D893;
	Mon, 28 Apr 2025 21:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745874636; cv=none; b=j+4KXucFEAJ8Uq5k0MI2rOsO+4BRO4AaUfsyAvJd07xf8Atbv6b39ArJtqrJnfHmY/yFXSC1tg5xH3C92tlUj63djKoxBVvAzd4HDNB8AE2h4xrz2m8sOrlPMkj94axw3G3XVF8riB+DzLtMI8DSTBRr8SZKt8P/jsUh8AroaV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745874636; c=relaxed/simple;
	bh=gBMzb7StDcO2cZNOIdTOT3gUzhYcnYn1AyW7djylsVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U6dfF4a71v1P30roW62fc1m27vQsyRorVd2vc6nw0+r4ZvyAu4WlYJyGiiJpeMeYncJiWdJHm7GoRekDgzF2cR3A1Q9KItphkpqpd9CIEeuGHGpxV2YrFy6VLQ5H6zvl+CxRkPXZxbU2144rBCoYzh81j8hNDES9JZ4Zmpdo3z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=egfPPFTC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="egfPPFTC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D75EC4CEE4;
	Mon, 28 Apr 2025 21:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745874635;
	bh=gBMzb7StDcO2cZNOIdTOT3gUzhYcnYn1AyW7djylsVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=egfPPFTCxuvevp9nIYSdIbofNrdINOG8z6SA86wc12K9aTieU5pe6t4penOxZP4gR
	 mImRHDXP/gTZqRvNlLhmkgaUJjIzRWpokIeURmiTEcCoDY15iif/xdQ+KjVLfkeSur
	 Ehqh+2pGsVyfrtq6OUDbLQJPBPU467Osnapm9reG8uU48yRkAM5oOyFTF24z47fbhV
	 Caebh+pFQXrmmm9MWjw58cHI51zGKKtRyj5k9J2TN9JDjJqxzH7PpMfNAV5h+Ha2m+
	 6TL8KrTfAEtwQNasmPFVRWGTz6dVKEM4AjTmxj6jqulFVVfUxJuZotKcN0Zc4Tn8cZ
	 0+Dyb4xt6qopQ==
Date: Mon, 28 Apr 2025 16:10:33 -0500
From: Rob Herring <robh@kernel.org>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Remo Senekowitsch <remo@buenzli.dev>,
	Danilo Krummrich <dakr@kernel.org>,
	Dirk Behme <dirk.behme@gmail.com>,
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
Message-ID: <20250428211033.GA1632162-robh@kernel.org>
References: <81a65d89-b3e1-4a52-b385-6c8544c76dd2@gmail.com>
 <aAyyR5LyhmGVNQpm@pollux>
 <D9GIUOH0CKE4.3R01AYKCCG54O@buenzli.dev>
 <aAzrg31NB2g0X4qL@cassiopeiae>
 <39798ebd-35a8-4a67-9df4-f12a6f20ef11@gmail.com>
 <aAz1f2jhdwjXmHex@cassiopeiae>
 <D9GWI4GT3ZK4.25N3DYX5MSX0P@buenzli.dev>
 <c922d67c-ab20-4e46-9359-01fb32223d17@nvidia.com>
 <20250428201821.GA1572343-robh@kernel.org>
 <32b5e40d-f1a1-4104-b4e4-1471de77e2d8@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32b5e40d-f1a1-4104-b4e4-1471de77e2d8@nvidia.com>

On Mon, Apr 28, 2025 at 01:25:03PM -0700, John Hubbard wrote:
> On 4/28/25 1:18 PM, Rob Herring wrote:
> > On Sun, Apr 27, 2025 at 03:12:18PM -0700, John Hubbard wrote:
> >> On 4/26/25 2:50 PM, Remo Senekowitsch wrote:
> >>> On Sat Apr 26, 2025 at 5:02 PM CEST, Danilo Krummrich wrote:
> >>>> On Sat, Apr 26, 2025 at 04:35:07PM +0200, Dirk Behme wrote:
> >>>>> On 26.04.25 16:19, Danilo Krummrich wrote:
> >>>>>> On Sat, Apr 26, 2025 at 01:08:39PM +0200, Remo Senekowitsch wrote:
> >>>>>>> On Sat Apr 26, 2025 at 12:15 PM CEST, Danilo Krummrich wrote:
> >> ...
> >> The idea is that the lower level you are in the software stack, the
> >> more rare printing should be.
> > 
> > If that's a kernel style/requirement, I've never heard that. About the 
> > only coding style in this area I'm aware of don't print messages on 
> > kmalloc failure because the core does. It's the same concept here.
> > 
> > When practically every caller is printing a message, it should go in the 
> 
> If *every* caller, without exception, today and tomorrow, including 
> callers that expect failure--if all of those require printing a message,
> then yes, it's time to print from the lower level routine.

We do know for 2 reasons. The first is we document with schema whether a 
property is required or not. That is a contract between the firmware and 
the OS. Changing what's required breaks that contract. Second, the 
caller indicates whether the property is required or not. We already do 
this with subsystems that are indirectly accessing properties (e.g. 
clk_get() and clk_get_optional()).

But see my other reply. We are perhaps arguing about the symptoms rather 
than what is the root cause for having prints in the first place.

Rob
