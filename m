Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAD81917E7
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 20:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743625826; cv=none; b=RzKyAPtMzjnjL08smD76LYFxkST5S4WQOKAQxST/DFcTiPUcqYdSsN0zC3hZuJ8/JOu8AYrD/r9jQ9sHJBV9N7s6wh1VJKCV2D9ZKPQktgfCk2qO/VTlm1RI+FPz+d0FP7/9E/o4fGz3WWvTIFjpOqqmvfSezfetYRo/EaEXCJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743625826; c=relaxed/simple;
	bh=RLONw20lGO+tRITzrVnK2W01Z85JtRqJFfoLO5wknFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GcLrWLxwBzXB6QyJs+r1qlSGZZ89O0iXE/xoXhYMoUKiemaziZzdx6Obs/ADvap+lRtXDozqbJwvF7+9szb36+UEiIxLDo5WkqdLtlpwr295mi4eJ3EIU/dJXwyD9d+4/wItLG48dPRKeyfUDeGStxsvyW5QHZovlUIRiR0wtpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G9omKV1a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G9omKV1a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9949FC4CEDD;
	Wed,  2 Apr 2025 20:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743625826;
	bh=RLONw20lGO+tRITzrVnK2W01Z85JtRqJFfoLO5wknFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G9omKV1aweowffnaD4V5AUpAs01/S8dJOsQ7pbEb1+mNhhY8CFBXK6N5d1YjNr0fv
	 mN7/Xs+I9EJR53WeeP47XFngbLRrz2Iy5Q6kk8B7b0K1lZ43Wr/AXpLKcA86opF9Rl
	 LfKNMv7x0c/ARjX/tJRRtyUgM/0W29wO/KT8JjEOuwiQSYT68X3Xv6KejQtI87Zbfo
	 rmtZkpQj+vLA9xIulagoe5TZ/LGn/xr12NNGlkimKaquz38c88O0tFfu8RDKOvvLrs
	 pU9nlmBp+X3atMrxNnTS47F4uByB492pbFJ/7gDGeVIYvx3+idOSx0eoHu3zP/h2k0
	 NZuJyFEIWuCxQ==
Date: Wed, 2 Apr 2025 22:30:21 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [GIT PULL] objtool fixes
Message-ID: <Z-2eXbKvyJG8a4xt@gmail.com>
References: <Z-xFKa5hiQ5urVwS@gmail.com>
 <CAHk-=wgqa0B9OV+EAQ34-VOUAeVB2o2bXnZXQDG7u+Z=4Cmw8w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wgqa0B9OV+EAQ34-VOUAeVB2o2bXnZXQDG7u+Z=4Cmw8w@mail.gmail.com>


* Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Tue, 1 Apr 2025 at 12:57, Ingo Molnar <mingo@kernel.org> wrote:
> >
> >  - Fix a number of objtool warnings in various drivers, core kernel
> >    code and architecture code. About half of them are potential
> >    problems related to out-of-bounds accesses or potential undefined
> >    behavior, the other half are additional objtool annotations.
> 
> So I've pulled this, but I really dislike some of it.
> 
> That
> 
> > Josh Poimboeuf (35):
> >       objtool: Fix X86_FEATURE_SMAP alternative handling
> 
> makes a bad thing even worse.

Sorry about that, we'll fix it!!

Thanks,

	Ingo
