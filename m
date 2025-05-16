Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE6B157E99;
	Fri, 16 May 2025 16:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747411281; cv=none; b=k1Lx/IKoi7hrTo1AUsmk0eRmnIqiJDByllqrtqe6u+k3Y/PC+QC3LXiPR9rpi5vy7PVb+DBaFMBfqT1EUFRA3r6FxibfZlf2w2GR1/2o2/xNcMyFDCd8GFSq3h2zc3DFGThulAslC6LQFFW+33W9jfFCysAJEPdvDWGk1BvntP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747411281; c=relaxed/simple;
	bh=8LXYtup+Ql2ziVjAhu4GTB/LIRRAj34dS331eN8NA98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gaGKDPZiE6eGbecEh9Fz26hPqr8y0YNXqnD4nkUILop0JMqJFexhd3UqOQ/ilnodXxEJpZ/UbAzqYcmQKhY1oKem2CgxN2/8GzI6V7mxvcaB0Tcqt0O/BbbA22BXdK0mtznHGfZW9dNIDunVM4xGZ12C1+Oj+neUD6Cy+oTSXiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HHZUKtNz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HHZUKtNz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB418C4CEE4;
	Fri, 16 May 2025 16:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747411280;
	bh=8LXYtup+Ql2ziVjAhu4GTB/LIRRAj34dS331eN8NA98=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HHZUKtNzdkxZeiiPuUQUE0c1/WCTW34kXeCA8JaKpbzmHk6owBYZJQ4HA3dtEHd5y
	 Ic9HnEAHiU+kmt1Nd98E6jjo/nm/ooW/o7JdmLSJlikFdTpucVILQ2WrfXGy57QESR
	 X8ltwvTdZ334Xk9bY11atJ+CmfaKoSNAo0pdNd1KsBiZm5fQr4KerhvxoHnOuB9DpM
	 3XYnHIexf0dwbFKCySrmgaWyMeXk0yAGfS/Je3zAv35I79XYCMw8LtRoHIHIk+EE2k
	 9oZqiECiZT5/qV4V5rN5ibPJ09ATyOaSfcnjv3TK/KvzqS/n+dcWoxhnO4h+z271yy
	 h3NRqt1n1eKmg==
Date: Fri, 16 May 2025 18:01:15 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	John Hubbard <jhubbard@nvidia.com>, Timur Tabi <timur@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: add basic ELF sections parser
Message-ID: <aCdhS10JCh6HRpqV@pollux>
References: <2025051543-override-rockiness-3ead@gregkh>
 <D9WLFTPRB9FJ.OL6I760HKALZ@nvidia.com>
 <D9WP3YU31199.Q8IEDBJZ87LU@nvidia.com>
 <2025051532-gentleman-reset-58f2@gregkh>
 <CAOZdJXWKLu0y+kwC+Bm8nBCLizQVpsDdDUoS--hVgz2vnuZJQg@mail.gmail.com>
 <8b14b078-b899-42e8-8522-599daa65bc63@nvidia.com>
 <2025051647-urology-think-b8e0@gregkh>
 <D9XMAV4ERYK7.39TLQBLYTX3TU@nvidia.com>
 <aCc_PSOPkLWTcTru@pollux>
 <D9XNS413TVXB.3SWWJE4JGEN8B@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D9XNS413TVXB.3SWWJE4JGEN8B@nvidia.com>

On Fri, May 16, 2025 at 11:35:42PM +0900, Alexandre Courbot wrote:
> On Fri May 16, 2025 at 10:35 PM JST, Danilo Krummrich wrote:
> > I think we should either we get to the conclusion that the desire of parsing (at
> > least part of) the firmware ELF is valid in the kernel and make it generic
> > infrastructure, or conclude that there really isn't a reasonable technical
> > reason to do that.
> >
> > Please let's work out the exact technical reasons for doing this in the kernel,
> > such that we can either conclude one or the other.
> 
> I think it's mostly a matter of where we want to draw the line.
> 
> We use ELF as a container format to associate binary blobs with named
> sections. Can we extract these sections into individual files that we
> load using request_firmware()? Why yes, we could.
> 
> Now the GSP firmware for GA102 contains the following sections (skipped
> the ones that don't need to be extracted):
> 
>   [ 1] .fwimage          PROGBITS         0000000000000000  00000040
>   [ 2] .fwversion        PROGBITS         0000000000000000  02448040
>   [ 3] .fwsignature[...] PROGBITS         0000000000000000  0244804b
>   [ 4] .fwsignature[...] PROGBITS         0000000000000000  0244904b
>   [ 5] .fwsignature[...] PROGBITS         0000000000000000  0244a04b
>   [ 6] .fwsignature[...] PROGBITS         0000000000000000  0244b04b
> 
> That's 6 files instead of 1, for serving the same purpose. And the number of
> signatures is bound to *increase* as new chips get released, but since they are
> associated to chipsets, we can maybe limit them to the relevant chipset
> directory and limit the damage. Still it would clutter linux-firmware a bit
> more than it is today.
> 
> But let's say we do this, and problem solved. Only... let's take a look at the
> booter binary, which is another innocent-looking firmware file.
> 
> It includes a header with offsets to the code and data segments, that the
> driver loads into the falcon microcontroller. And one offset for the signatures
> that we need to patch. Reminds you of something? :) Should we split these ones
> too?
> 
> I would push back really hard on that one, unless you agree to go after all the
> drivers that do the same thing (and I have names).

Great, but then why did you back off in your discussion with Greg? Given that
you are convinced that this is a valid thing to do for drivers, you should keep
discussing it with the target to make it common infrastructure.

I did not argue for or against it -- what I do disagree with is that we seem to
just agree to disagree and stuff a generic piece of code into nova-core after
three mails back and forth.

Please keep discussing the above with Greg until we get to a real conclusion.

- Danilo
