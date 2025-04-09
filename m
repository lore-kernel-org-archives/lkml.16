Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36457217734
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 21:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744235732; cv=none; b=mOEFBxc70RwkOghORgwR2kxBX5+JxVu7Q3wTqeMp1rYy+OOYPlxSZbti4zR0cPqbgtefkWpz8ZmcZomGd7QerYQFBKJWjcR35AutBpBtI944XS2COywJNYZxr9fV/oNdsA7B1SRy/4bciEWTp4BSAUSK8NJR61j7ludCq9Yp+gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744235732; c=relaxed/simple;
	bh=y6UC8ltqIrUdBHxZyZn1iW/T01hmKUt77XTlYrIEfag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WZcyYebjGL69RAeOnT/UGU/HmkJb6n+ex1vRW2towJml5XmPgvPNLlw+LYZggbKq/V/iV+9+9adkEPUuRxkQ+2M+pgIx+ldm7sbE8ufytbtIwQcWKyHthLDJxRiW9dmNdlGmLp8KCxeSfhtjcgwWnSEkKOjYdBJyBvtEr9UXic4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZNiDUIhs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZNiDUIhs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C62BEC4CEE2;
	Wed,  9 Apr 2025 21:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744235731;
	bh=y6UC8ltqIrUdBHxZyZn1iW/T01hmKUt77XTlYrIEfag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZNiDUIhs58ydnUmvQThAdScypXet69a08OXds6vX3Se4gpTdiAcNkdzG3WzHL3RR5
	 ypNQeIpq58LG2ptrDtE6rgPAXKIZX5chcFdaGClTO4Bn9Q+d7TAzqbTyv09o++FBBl
	 mPstYNlY1InlAviNR4Wuc1tdRDabLc0nqM3YkVzbLs67hdx1MquuK31F9oYm7OuYhI
	 O69BoLnkqq+z638jn2UjsSNMDO9FYQthkZGQ1rpjRdG+s1Mt/rLPORE42m3sWR/Kgz
	 J7xTqC8Bv7o59X8V0OM/gOrjPbqvJPOcVTOWFKZLLBd1DwucbBErRHmJUwzmuEOeZ3
	 uIcqFMWn3CbLg==
Date: Wed, 9 Apr 2025 14:55:29 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, 
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH RFC 4/5] x86/alternative: Improve code generation
 readability
Message-ID: <rvdkkywhaqcymcco3im4bmy2o35u2kpqxuqschjbuc3h7n2yzr@ikvofglh56gr>
References: <cover.1744098446.git.jpoimboe@kernel.org>
 <35ae5c17e8cc88506b5ae8f3b06d9491f7ef319c.1744098446.git.jpoimboe@kernel.org>
 <20250409143821.GE9833@noisy.programming.kicks-ass.net>
 <4q77jakv67gmglrcbzojngyutbfi3pzgsjayrymkg7dhkxo4hl@mczk3gots764>
 <CAHk-=whAtuMohKpzrzt0HFLP0RdU=KB-_4fu25gG6O4R=+PXvg@mail.gmail.com>
 <qik3dltarxj5trsbgzoifhf545nss4vwnabhql7i2b7qiowq52@y3d5pirwd4ni>
 <CAHk-=wiL8J8v3+XKJGM4Ro83UqJTh7q0GD9UUYrDnwx24jR83A@mail.gmail.com>
 <lk33e6ldcyilu6bejru63wzfkfyqt7czvhjotvqlhnp34qnw4n@kt6wt4lwfu7q>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <lk33e6ldcyilu6bejru63wzfkfyqt7czvhjotvqlhnp34qnw4n@kt6wt4lwfu7q>

On Wed, Apr 09, 2025 at 02:27:28PM -0700, Josh Poimboeuf wrote:
> On Wed, Apr 09, 2025 at 02:20:55PM -0700, Linus Torvalds wrote:
> > On Wed, 9 Apr 2025 at 12:51, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> > >
> > > What if we were to use a global asm() to define an alternative .macro
> > > whenever "alternative.h" gets included?
> > 
> > Yeah, I wouldn't mind that, but I have this dim memory of us having
> > tried it at some point and it didn't work.
> > 
> > I think the issue was that the in-compiler assembler was not as
> > complete as the external one (ie not doing macros at all or something
> > like that).
> 
> It seems to work with GCC 14 and Clang 18 at least.  I can try to find
> some old toolchains to test with.

Actually, Clang *compiled*, but on closer inspection it's actually
silently omitting the inline asm :-/

So yeah, that's not going to work.

-- 
Josh
