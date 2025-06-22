Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0075BC2E0;
	Sun, 22 Jun 2025 15:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750607138; cv=none; b=IpaAdXdHlkPRsEzJpiOL0GGF7rSuWn+c5WDrTtu/GCpKEnwMh/Fl9LFUJRoFRAjeI++RshXZ0t3TO9aMdPknSWYWiRRZSMKvCe0FqcFJJs8Q7ON3QvK+EW3uulTbsmhQWih4Hr4eNZfBcgbnKoq8qL5CgPZe8zBXjLyc0/Ztljk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750607138; c=relaxed/simple;
	bh=T/dZXFGp2zWlfxXxLiecNvnvGisn8wOtc33YHclENJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YRWGd7u8iIWmLbBaZZivKsp/nDGKOAaFU2XWNcBoHvtssR/2ek9I2pgAZlKGk0tmYrvSCiCuCUmBEhq22EYZSy9+rtbWFghnx13albrCo2rJkmyhqzCjEu+YFO60YYTuShgT34IHFo/b7coAE69oPBxW86wUAYlWIOJiBgXM/38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SnsEmvhn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SnsEmvhn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9C43C4CEE3;
	Sun, 22 Jun 2025 15:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750607137;
	bh=T/dZXFGp2zWlfxXxLiecNvnvGisn8wOtc33YHclENJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SnsEmvhnSlIR5NVBnTN1Dyr47VrlmtUV8Vag4V4l7Vz/AdgzcLs1gxlFK7g97WEuM
	 gRr3a0MlMs68zPklUZh1K/VG7YPFgjEbiqAGcmXa+SbqrfEfIWsQIjx6nkNGucq0VZ
	 lvDf0jjuH0C+iRO+5p4ruCuPLw/BNBqjK0EX2uKUIeZ1ngloZp6UZid5IbDrRixVk/
	 aj3QYfZlOZjqCLYYxIGLbHHyK/lYWejh+2azuRNBw092wuebfCFd5p89svKdHSDJbi
	 4xG7/Or55l9fiUiNJ7FxctRDZ/M36YK022RSUcBsxiqAlA1Ps9nMgyFNckEqGlIN8g
	 A5pWdXahEwJ0w==
Date: Sun, 22 Jun 2025 17:45:32 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Benno Lossin <lossin@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] rust: devres: get rid of Devres' inner Arc
Message-ID: <aFglHG6lK0a94SIu@pollux>
References: <20250612145145.12143-1-dakr@kernel.org>
 <20250612145145.12143-4-dakr@kernel.org>
 <DASVDU1WY5RH.1VLCIQ4TIS0FP@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DASVDU1WY5RH.1VLCIQ4TIS0FP@kernel.org>

On Sun, Jun 22, 2025 at 09:05:51AM +0200, Benno Lossin wrote:
> On Thu Jun 12, 2025 at 4:51 PM CEST, Danilo Krummrich wrote:
> > +    fn remove_action(&self) -> bool {
> > +        // SAFETY:
> > +        // - `self.dev` is a valid `Device`,
> > +        // - the `action` and `data` pointers are the exact same ones as given to devm_add_action()
> > +        //   previously,
> > +        // - `self` is always valid, even if the action has been released already.
> > +        (unsafe {
> > +            bindings::devm_remove_action_nowarn(
> > +                self.dev.as_raw(),
> > +                Some(self.callback),
> > +                self.as_ptr().cast_mut().cast(),
> > +            )
> > +        } == 0)
> 
> I don't think the parenthesis are required?

At least the compiler doesn't seem to be happy about removing them:

error: expected expression, found `==`
   --> rust/kernel/devres.rs:199:11
    |
199 |         } == 0
    |           ^^ expected expression

error[E0308]: mismatched types
   --> rust/kernel/devres.rs:194:13
    |
194 | /             bindings::devm_remove_action_nowarn(
195 | |                 self.dev.as_raw(),
196 | |                 Some(self.callback),
197 | |                 self.inner().as_ptr().cast_mut().cast(),
198 | |             )
    | |             ^- help: consider using a semicolon here: `;`
    | |_____________|
    |               expected `()`, found `i32`

error: aborting due to 2 previous errors
