Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E591990B7;
	Sun, 22 Jun 2025 12:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750594124; cv=none; b=P4OhF/6KvqArYR6QYmZag3wsGMNFoT4sWPPS8uuc6B0lFqA6SQKF66i2UIr3Y+61AFlQPq3kMaKf/xVcHdvSVxeaF2lF4UOtLJn/z+jG0nRA+gI28h4SCGjFD+SWhdEhXJ4wpvZAIo1/4efDk1rOpUxSYx01JORVrhWpdVyJUu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750594124; c=relaxed/simple;
	bh=F0Ocl7lREMAUGCCy9bfS3tlYnFAI+Y1/tYE1Gdg+p9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nlx+BxihXY38DLNx3hD6sIPA2D5oafkjYlpODmVOP3527/h+izHHtIDVhBFWfbXAGgrh2PiZ+EC7GbhIz6DUST3MbUvBdB4E+gE8iletLsbCfYN2xn3lF9O2sih8RUFCsn4ggf+nwAZkv5Ra5xshmX8TNjrXOsdjA9/EXhbbNnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JudOeVKl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JudOeVKl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEA24C4CEE3;
	Sun, 22 Jun 2025 12:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750594124;
	bh=F0Ocl7lREMAUGCCy9bfS3tlYnFAI+Y1/tYE1Gdg+p9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JudOeVKlSIahD+xmK00EfCagq4++UwNYXtlk/yHDEPEqKaib2UVPeCSXdftWDuPsC
	 bE4EPe3FNtvaKe7HVz57MerwweB1PYyO17210KnjRMdMOqlsbIz49vwZ7jI0hOKWyW
	 P5WdGMFdf9n7iiCIFQJ+3W2poLLtS0T2mduoEB7TXrJy2L7Dk9MlvgCvvng3hNEA45
	 czTOFImUfY07Cm5aW7611H/anJJSU28BxGiEf2e0lAOkkKfpUdY8Vq2rrGfDZbqab9
	 1o2w8Sa6Rpx+ZCuNuyDw5PBGdxgwP1oOhfQreU/LZ6ecIiBQzfEGQZPOwMKaliIpts
	 GvJOD+YdO4lGw==
Date: Sun, 22 Jun 2025 14:08:38 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Benno Lossin <lossin@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] rust: devres: get rid of Devres' inner Arc
Message-ID: <aFfyRuYPxUfc7TM-@pollux>
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
> > +#[pin_data(PinnedDrop)]
> > +pub struct Devres<T> {
> > +    dev: ARef<Device>,
> > +    callback: unsafe extern "C" fn(*mut c_void),
> 
> Do I remember correctly that we at some point talked about adding a
> comment here for why this is needed? (ie it's needed, because
> `Self::callback` might return different addresses?)

Correct -- thanks for reminding me of that. Will add the corresponding comment.

> > +    #[pin]
> > +    data: Revocable<T>,
> > +    #[pin]
> > +    devm: Completion,
> > +    #[pin]
> > +    revoke: Completion,
> 
> Probably a good idea to add some doc comments explaining what these two
> completions track.
> 
> (feel free to do these in another patch or in a follow-up)

No, I think it'd be good to do it right away -- will add them.

> > +#[pinned_drop]
> > +impl<T> PinnedDrop for Devres<T> {
> > +    fn drop(self: Pin<&mut Self>) {
> >          // SAFETY: When `drop` runs, it is guaranteed that nobody is accessing the revocable data
> >          // anymore, hence it is safe not to wait for the grace period to finish.
> > -        if unsafe { self.0.data.revoke_nosync() } {
> > -            // We revoked `self.0.data` before the devres action did, hence try to remove it.
> > -            if !DevresInner::remove_action(&self.0) {
> > +        if unsafe { self.data.revoke_nosync() } {
> > +            // We revoked `self.data` before the devres action did, hence try to remove it.
> > +            if !self.remove_action() {
> >                  // We could not remove the devres action, which means that it now runs concurrently,
> > -                // hence signal that `self.0.data` has been revoked successfully.
> > -                self.0.revoke.complete_all();
> > +                // hence signal that `self.data` has been revoked by us successfully.
> > +                self.revoke.complete_all();
> > +
> > +                // Wait for `Self::devres_callback` to be done using this object.
> > +                self.devm.wait_for_completion();
> >              }
> > +        } else {
> > +            // `Self::devres_callback` revokes `self.data` for us, hence wait for it to be done
> > +            // using this object.
> > +            self.devm.wait_for_completion();
> 
> I don't understand this change, maybe it's best to move that into a
> separate commit?

We can't do that, without this change the code would be incorrect.

What happens here is that, if drop() races with devres_callback() we have to
make drop() wait until devres_callback() is completed, because otherwise
devres_callback() might experience a use-after-free.

Previoulsly this has been taken care of by Arc<DevresInner>, which C devres held
a reference of.
