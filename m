Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F2028C027;
	Wed,  7 May 2025 19:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746646695; cv=none; b=F06vSzMRpFI1GBsuLt/Sjg3neEEhHyudedTbE1KLtREBb1GGFzJlqNPKL4uQpFDWb6fRrNxv3KwngX0rUJWEs1xqdhPN/+f+lAsCfJt600T/diHlfi0HTXqYGDLVOay5Fkc7Ze0szkOabbpcNyuefpJZRkG6sOvyfIKS/misUU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746646695; c=relaxed/simple;
	bh=P80Uol6PvMEjz/mpG6q1B6NOrD+50bIpe2jHFHe1Zcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CZ8oH9S/EDJUXoJTgwp4zjFOvZkI6afErdEI/jNG7YrkwEc/LVas7XrOACCCZaEbg/fo5VHSKQrYO2niPb/C9BVPHts2jfwUzfFsXmtTt1L0EZ2Tsj5uS/abliusFhuInWl6dlmmEDFRbErAfs0Kx9xG68hADndlE1BSuGwBViA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F06e8mAq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F06e8mAq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFCDEC4CEE2;
	Wed,  7 May 2025 19:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746646694;
	bh=P80Uol6PvMEjz/mpG6q1B6NOrD+50bIpe2jHFHe1Zcw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F06e8mAqSiO13S2S1AeKWurNzZn0TPJhA5TKf9jBGrc7IrgPClJUiV1h6b28BiyLl
	 MotF5UwE1YyRMgPIR6VPUR7khPa2RIXS1kvoIVXYd8uqqCUNTgM1crin7xLRonyGC4
	 nxAXA57AybMHF3rs9cEh++OfW6O0yRwMGg9bihSivkbcOqCok2aKXvCSw9ppRR/3kr
	 NpKipTRRleJc/yeygWQUYLOh1hZypFSVay0qCcw+jQddhdE86Y4xES+41hwIWkEe5f
	 VgyP+KAN7S7pVl6rIB5ogKVOqIUg34xkyHzdMnxljQHjeKn9QhLB92xtevet3lVK49
	 tX4rEKBkGOA6g==
Date: Wed, 7 May 2025 21:38:09 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>, Lyude Paul <lyude@redhat.com>,
	Rust ML <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 01/10] rust: Rename timer_container_of() to
 hrtimer_container_of()
Message-ID: <aBu2ocPIFOvq_EiA@gmail.com>
References: <20250507175338.672442-1-mingo@kernel.org>
 <qqz686a7_ob8uzbREL3X3P-MTdPUVJo9hi33Dsv-3kgJoB1_bE0ynnuXFVLIwbZ5dNkntegTdZhkBp04syneXA==@protonmail.internalid>
 <20250507175338.672442-2-mingo@kernel.org>
 <877c2spaag.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877c2spaag.fsf@kernel.org>


* Andreas Hindborg <a.hindborg@kernel.org> wrote:

> "Ingo Molnar" <mingo@kernel.org> writes:
> 
> > This primitive is dealing with 'struct hrtimer' objects, not
> > 'struct timer_list' objects - so clarify the name.
> >
> > We want to introduce the timer_container_of() symbol in the kernel
> > for timer_list, make sure there's no clash of namespaces, at least
> > on the conceptual plane.
> 
> Is this a resend?

I noted the changes in the boilerplate:

  Changes in -v3:

    - Picked up review tags
    - Rebased to v6.15-rc5

This particular patch didn't change.

> Again, I think this change is unnecessary. Please see my earlier reply [1].
> 
> Best regards,
> Andreas Hindborg
> 
> 
> [1] https://lore.kernel.org/all/877c3cbdq2.fsf@kernel.org

Yeah, saw that, but you said you are fine with it if I insist, and I'd 
like to have this to free up the timer_* namespace. Since I think we'd 
like to introduce the timer_container_of() in the future it would be 
nice to do this rename, as:

	$ git grep -w timer_container_of

will have hrtimer related false positive hits in rust/ code, even 
though the namespaces are obviously independent.

The Rust method is arguably a minor misnomer as well: you have 
work_container_of around struct work, but timer_container_of is around 
struct hrtimer?

Thanks,

	Ingo
