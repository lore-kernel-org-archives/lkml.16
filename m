Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799E0238C21;
	Thu, 12 Jun 2025 23:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749771071; cv=none; b=TwpqjoMRMu7TL0x21LbucIM3mod6pAZdJcWTWZrqq+Mvl2nScgBRTgpj69bPBMbcSutvoophzmpl/VMYzHx8WZK/u1h9VFR7f1LLHmqodOdklPoj0xAEZoqZQiMXFBjUeV4F4Wnmh++Relqfr5kzIkANAYaTxoBXbrbwEHD7Dq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749771071; c=relaxed/simple;
	bh=mU5DXDEL7JdhVFDjam/sn9jho5YjD+GUxxITlSy3FG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vApnmkp+HehpZNVMwXzyJFyS2xOQckQozbJ4Pvs7gon9fBydX8y1AlW+FILGBZiaUbc4vAYVpzyAhRoMFYySkI2tmpdRgy9camWll1biwkB3uoGM1xFlbGV6w7W1nFaWRFQeKlY11f7Xh9o5KmHQ2t91Thk04p8xMyC1unhOlcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k7suuKZ9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k7suuKZ9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6457AC4CEEA;
	Thu, 12 Jun 2025 23:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749771071;
	bh=mU5DXDEL7JdhVFDjam/sn9jho5YjD+GUxxITlSy3FG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k7suuKZ9oZ5wCRHKONiv/gjZWvLGLxXukuKiFHv7R7DLPnkqRYVvWGxb9ksbbFNqn
	 G4wYv7Up3oZfznl7bPdrICrVqFnaNtCZJdfXqq82EJ7Xpspmebu9HCWz45x3LFE9EP
	 m/TKI5rwD8kjjGo818AtqjppZVgjuFgwe5WNQ0R/ckqTey7vXNK2yeny+Vue5T/1fW
	 E1YGHUnRh7Tx0xLdj64XwO4gQudneBlaFb37sloeDzpUenNHG1JD1xXKz7HofQr2zE
	 yPej+CdDKR/993BBR00Q3eWzbmSz3gvnSIPUCpfjiaL91o1SBHsWmKZIfXT9iReIbS
	 tEoUcXhV/ihWw==
Date: Fri, 13 Jun 2025 01:31:04 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Remo Senekowitsch <remo@buenzli.dev>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Dirk Behme <dirk.behme@de.bosch.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v8 0/9] More Rust bindings for device property reads
Message-ID: <aEtjONTgqDikCoB6@cassiopeiae>
References: <20250611102908.212514-1-remo@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611102908.212514-1-remo@buenzli.dev>

On Wed, Jun 11, 2025 at 12:28:59PM +0200, Remo Senekowitsch wrote:
> Remo Senekowitsch (9):
>   rust: device: Create FwNode abstraction for accessing device
>     properties
>   rust: device: Enable accessing the FwNode of a Device
>   rust: device: Move property_present() to FwNode
>   rust: device: Enable printing fwnode name and path
>   rust: device: Introduce PropertyGuard
>   rust: device: Implement accessors for firmware properties
>   samples: rust: platform: Add property read examples

Applied to driver-core-testing, thanks!

Once the patches passed 0-day testing they will be merged into driver-core-next.

>   rust: device: Add child accessor and iterator
>   rust: device: Add property_get_reference_args

I did drop those two patches for now, because:

  (1) They're basically dead code.

  (2) It seems that FwNode::property_get_reference_args() leaks a struct
      fwnode_handle reference. property_get_reference_args() explicitly says
      that the caller is responsible "for calling fwnode_handle_put() on the
      returned @args->fwnode pointer", which doesn't seem to happen.

Can you please fix the leak and resend those two patches with an additional one
that adds a sample usage of the introduced methods to the platform sample
driver?
