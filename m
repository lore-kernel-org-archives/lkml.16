Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721022727EF;
	Fri, 13 Jun 2025 08:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749804620; cv=none; b=Bq2HspuM8EzZesJuTo3JIiLLiMyHVx+fBP7SpfSlNH8ixwRczagX2Se2GkjurE0z/bIR864tVoVYSvdCzW8zo2lljb08V4bB8rLGT7ngr9EVfh2M+Hg6s3e/KVCKEfE4bO5YZ9ZRrbLBsZ28I9eEDR9bYLdAGVsDNpmvQnEGPd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749804620; c=relaxed/simple;
	bh=eCo/L6P/lgVu+jHfJMyorLu6Y9nvXk/E/NCtlMoCn2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZiktWQe1B2eEUTd7F8/WfUiDDA7umY6sgc3p0FsWRJDTrrtJg6khvk4XO7f79n/wHqkhq1gVa6y917INfhc3WD6LYMIkfblXRJRy0z0GMnwfl++Z1dt+6tEhP9M7Kltb7pUsSRRcGCUdlPp2N6A1pudihJsFKcWT2NBn0C4haZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZIBCLUxD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZIBCLUxD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D34D3C4CEE3;
	Fri, 13 Jun 2025 08:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749804620;
	bh=eCo/L6P/lgVu+jHfJMyorLu6Y9nvXk/E/NCtlMoCn2k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZIBCLUxDuDg0GoH2XX9bzbW0PoVGYuEIZz8QDuTtS28tmTHIkGbIWFn5SrtbelRQT
	 1LPwLu4iq4Gdz3KT8FtEhAfAWORb/MZAPSwyKUk9oRzhPdH/E+Gw48+wtVAja0fjjS
	 HjVEq2xut2/oBRpOddOoDLn17mnM4h3xbGUvfTS2cAa2camZu98bveQnqWVi4+zwof
	 xOtrQ7mxDHXFViyNJlO4Ix5z9JiU6EQl2LX1nwEUJHnE7DeJEZZz52OH0UPDkU+/+Z
	 eRv7Tk+j7WxrzJjfFfwEnzSMl2ES2liUMs3SxCay7QlS3jkNVkUkQOQskOrbMfMIAD
	 KMBKfGlS99roA==
Date: Fri, 13 Jun 2025 10:50:14 +0200
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
Message-ID: <aEvmRmQwX7Vb8Y_3@pollux>
References: <20250611102908.212514-1-remo@buenzli.dev>
 <aEtjONTgqDikCoB6@cassiopeiae>
 <DAL8LI3LMET9.3LW0J9JED1EZG@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DAL8LI3LMET9.3LW0J9JED1EZG@buenzli.dev>

On Fri, Jun 13, 2025 at 09:45:47AM +0200, Remo Senekowitsch wrote:
> On Fri Jun 13, 2025 at 1:31 AM CEST, Danilo Krummrich wrote:
> > On Wed, Jun 11, 2025 at 12:28:59PM +0200, Remo Senekowitsch wrote:
> >> Remo Senekowitsch (9):
> >>   rust: device: Create FwNode abstraction for accessing device
> >>     properties
> >>   rust: device: Enable accessing the FwNode of a Device
> >>   rust: device: Move property_present() to FwNode
> >>   rust: device: Enable printing fwnode name and path
> >>   rust: device: Introduce PropertyGuard
> >>   rust: device: Implement accessors for firmware properties
> >>   samples: rust: platform: Add property read examples
> >
> > Applied to driver-core-testing, thanks!
> >
> > Once the patches passed 0-day testing they will be merged into driver-core-next.
> >
> >>   rust: device: Add child accessor and iterator
> >>   rust: device: Add property_get_reference_args
> >
> > I did drop those two patches for now, because:
> >
> >   (1) They're basically dead code.
> >
> >   (2) It seems that FwNode::property_get_reference_args() leaks a struct
> >       fwnode_handle reference. property_get_reference_args() explicitly says
> >       that the caller is responsible "for calling fwnode_handle_put() on the
> >       returned @args->fwnode pointer", which doesn't seem to happen.
> >
> > Can you please fix the leak and resend those two patches with an additional one
> > that adds a sample usage of the introduced methods to the platform sample
> > driver?
> 
> Alright, thanks. I suppose that should be a new patch series, with a new
> title and starting at v1 ..?

Yes, that's fine. Please make sure to mention that it's a follow-up of this
series (ideally with a link).
