Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3074427147E;
	Tue,  1 Jul 2025 11:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370013; cv=none; b=JNRbBE74kvFd0/z4ciGjYiF6qLCpbETFuuP0vokjpUUQfdqfZTwmX0XJC+s3JwIci2leCNzkxqFe5blLu/Ml+4GCN5YiiOiFOPd0dmcE8Jd880hMMDmtVyPHUw9ctTCtCzVUW5TmcP4wXpPvEAM7AYr/ioL26HL+VjAD7g1+uL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370013; c=relaxed/simple;
	bh=u8zZNCS4lvpD1VplOy6onJI7j2IZhMgAIkB1xz0hPjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lbmgfmu7IGAhzJ7qRMb9C1a8oKjwp6fEqS3JtmqICZxRgSeO6VTlKo5cTw/Lb/SHK2Xm5wPJ7b94MDYeQQZHMxqVuw28RnTtN3+wcg2h5+wifapjzEGdiDwBBrBBcE3DmFyyZle6m6BhLVB3RpIGsdCIGr7cMp8/DeKq9aInI0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PShz8UON; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PShz8UON"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFB92C4CEEB;
	Tue,  1 Jul 2025 11:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751370012;
	bh=u8zZNCS4lvpD1VplOy6onJI7j2IZhMgAIkB1xz0hPjI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PShz8UONIBJ7VTbSCVd9ONPARVYPA4QnMiTuO/LwiBb4ejnn+D2aRCpyzipuIA54x
	 xZGEyaVfFFXNRp0kG5tLgswG/lrL958MQghZHD3PJmX6rRBLr/M0NRm2x9tbxeIEeL
	 wieRiLuHupQ7J0HVAkCQSirNTGtVlRrvJUD8oM9KDGamDNI0FOd79YcSk1a35i07qI
	 lVpTXPQ08ImfNvJFacsKj8aVC9wVLBqAjf3kSulXFv9K+ybc5L0UuvWc1zR16Qz5EV
	 FwcztaJ9CfyRMM+nLKZ/J/u8hrRN6FZ5ZUBKFhqr9CRFT+q4rkQMnC4+wUygWBvD4I
	 OYihIxf+i7NQw==
Date: Tue, 1 Jul 2025 13:40:07 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Marcelo Moreira <marcelomoreira1905@gmail.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	lossin@kernel.org, ojeda@kernel.org, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: Re: [PATCH v5 0/2] rust: revocable: documentation and refactorings
Message-ID: <aGPJFw_Ouj8MNbuq@pollux>
References: <20250626165927.66498-1-marcelomoreira1905@gmail.com>
 <CAH5fLgiTTXVMs3tzrHAU1rwQDCs_VPuPgEVcEkjbu+rNT=35vA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLgiTTXVMs3tzrHAU1rwQDCs_VPuPgEVcEkjbu+rNT=35vA@mail.gmail.com>

On Tue, Jul 01, 2025 at 01:27:17PM +0200, Alice Ryhl wrote:
> On Thu, Jun 26, 2025 at 6:59 PM Marcelo Moreira
> <marcelomoreira1905@gmail.com> wrote:
> >
> > This patch series brings documentation and refactorings to the `Revocable` type.
> >
> > Changes include:
> > - Clarifying the write invariant and updating associated safety comments for `Revocable<T>`.
> > - Splitting the internal `revoke_internal` function into two distinct, explicit functions: `revoke()` (safe, synchronizing with RCU) and `revoke_nosync()` (unsafe, without RCU synchronization), now returning `bool` to indicate revocation status.
> >
> > Marcelo Moreira (2):
> >   rust: revocable: Refactor revocation mechanism to remove generic
> >     revoke_internal
> >   rust: revocable: Clarify write invariant and update safety comments
> 
> Danilo, did you have Revocable / Devres changes that conflict with this?

Yes, but I sent them to Linus for -rc3 already. Given that rust-next is based on
-rc3, we should be good. There shouldn't be any further conflicts.
