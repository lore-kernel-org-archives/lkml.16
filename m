Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68B4216E2B;
	Tue, 29 Apr 2025 14:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745937472; cv=none; b=eNftz78ahuVo6xmg9BYdV/596gPsm9nht/O+TefSlTtueXFK47FArQk42N5P07U1L5Du3X7eIDJtewDylk4Ptseee8x+wZnzWPHS0L3V1myWGmNZJinDWqc41PfQdPGHSb9RP1fQ+RhMMAGKW/oLRthXykKhbq9rAzfsaE+S1+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745937472; c=relaxed/simple;
	bh=nVd8qF6yGUMGXXiUlR6CdwvZIu05Rfbpb3ez4qo0FPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ljmiYdjmmt33Ly4AQhlr/uRmI0bR6YdN86AVocuhLOmvqyrHVOvNZxmavVMdQNMnPUvGe6Cm/AGY1v36hx3RlUYXkfuxBMm/Z5ROkxxpzaFzp2yj0xXXNgRXBHO6yECPFqbjLz1FpiU7RJ2ghR7DJKOy4eiSWTUA/93FxcLNxyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=arqTb0Vm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="arqTb0Vm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72ED2C4CEE3;
	Tue, 29 Apr 2025 14:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745937472;
	bh=nVd8qF6yGUMGXXiUlR6CdwvZIu05Rfbpb3ez4qo0FPQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=arqTb0VmVe4kYSqEOdXDmPjiuCngQMkK8fgA1AEi6jsd21U9E4lNuLZdCPVUcU7sz
	 aAoQvaLpIPBYInFrSOa6MULulzKmwaKO/4MRaLLJt1qFfY9Gjf1nO8yw+evNXlJf+x
	 bI/FNbkX+GJ1L7FFgenePoULpIHqn0rUIUBBoVeM=
Date: Tue, 29 Apr 2025 16:37:49 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Ayush Singh <ayush@beagleboard.org>,
	Jason Kridner <jkridner@beagleboard.org>,
	Deepak Khatri <lorforlinux@beagleboard.org>,
	Robert Nelson <robertcnelson@beagleboard.org>,
	Dhruva Gole <d-gole@ti.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: kernel: device: Add
 devm_of_platform_populate/depopulate
Message-ID: <2025042904-trade-leverage-0f98@gregkh>
References: <20250429-rust-of-populate-v2-1-0ad329d121c5@beagleboard.org>
 <aBDi2LE3O1rIsGqn@pollux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBDi2LE3O1rIsGqn@pollux>

On Tue, Apr 29, 2025 at 04:31:52PM +0200, Danilo Krummrich wrote:
> On Tue, Apr 29, 2025 at 05:09:26PM +0530, Ayush Singh wrote:
> > +    /// Remove devices populated from device tree
> > +    pub fn devm_of_platform_depopulate(&self) {
> > +        // SAFETY: self is valid bound Device reference
> > +        unsafe { bindings::devm_of_platform_depopulate(self.as_raw()) }
> > +    }
> > +}
> 
> One additional question regarding devm_of_platform_depopulate(). This function
> is only used once throughout the whole kernel (in [1]), and at a first glance
> the usage there seems unnecessary.
> 
> In your upcoming driver you call devm_of_platform_depopulate() from a fallible
> path [2].
> 
> So, I think we should change devm_of_platform_depopulate() to return an error
> instead of WARN(ret).
> 
> If [1] needs it for some subtle reason I don't see, then I think we can still
> call it from there as
> 
> 	WARN(devm_of_platform_depopulate())
> 
> [1] https://elixir.bootlin.com/linux/v6.15-rc4/source/drivers/soc/ti/pruss.c#L558
> [2] https://github.com/Ayush1325/linux/commit/cdb1322b7166532445c54b601ad0a252866e574d#diff-7b9e3179e36732d5f3a681034d70c2fda4ff57745c79ad4a656f328c91e54b77R71

Ugh, no, we should just delete this function entirely if only one driver
is using it.  That implies it's not really needed at all.

And we should NEVER have a WARN() call, that's just an excuse to reboot
the box and assign a CVE...

thanks,

greg k-h
