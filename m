Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79327298271
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 11:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747310183; cv=none; b=jeZaFunI4oIx8RYbiqHLlTkyJuHUJzBdxghoKANeOiaIqvck0/+KtRjxr57V5EOpLlMmD4qSil9tDRJV+5Rg19vCj5F0ZJ0hcIrmfDDu+4QsEXwlbXKlIzjzhdl2L/oNriZ6j5wrSbW1tbsA/a1C3JPqfgYVGGJMtzuNbOzfh+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747310183; c=relaxed/simple;
	bh=Q800e4xY45B3/g+8yBWnD99v8G99LICrKs79zwHLJNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nUhYNUSiDUZGOsnjCWfcsVEk23+3BjcqpMcmVSXiH/CBHZYlpSR+6kP3HC5lvWJRCgLN05I1uOw77O5j55+NU87jMytpVEnb5i07lszBJpI0iBrcvYwfx3xDHcIVM5Ll725ldT9ywN4STh4wnIOtkK7POq2leh0cEaciYayZW94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U3HuU10B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U3HuU10B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E139C4CEE7;
	Thu, 15 May 2025 11:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747310182;
	bh=Q800e4xY45B3/g+8yBWnD99v8G99LICrKs79zwHLJNw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U3HuU10Blh7y15uDlVUQE0Rrr94/hs9ePqvUAYX7B9Z5frKh1zQKwo4WEU26grCuN
	 m1IxaL1feiioIiwnEUXKGGsqm2fO5B1uqzMiLt/VeW6Uqw6+uUBzp4yvawOfknBS8L
	 DSS67yJWllVArHcc43VVOux73UmMPoZSpyKC3k9ZDd9Cd5hc81bMJe0GPBd2witGks
	 3a80FG3ndjY6Wr1MedgVshZV+X14h2yVy1IiL5n3P+Bn8TaxjgRY1Jqy107OjGw2vT
	 hXg5CEv3q3Io0ncI+hC2bj+uVY8NjJMnXSDfd1z42tFeqcOMKJxkuvDbl7EmI8x0Ar
	 Wjc9sagITjH9Q==
Date: Thu, 15 May 2025 13:56:17 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andy Shevchenko <andy@kernel.org>,
	Borislav Petkov <bp@alien8.de>, Juergen Gross <jgross@suse.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Kees Cook <keescook@chromium.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 00/29] x86/boot/e820: Assorted E820 table handling
 features and cleanups
Message-ID: <aCXWYUQ3is0UZSFp@gmail.com>
References: <20250421185210.3372306-1-mingo@kernel.org>
 <f647bbd0-254f-42b7-be2a-54ddfa5679db@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f647bbd0-254f-42b7-be2a-54ddfa5679db@app.fastmail.com>


* Arnd Bergmann <arnd@kernel.org> wrote:

> On Mon, Apr 21, 2025, at 20:51, Ingo Molnar wrote:
> >
> >  - Assorted cleanups: type cleanups, simplifications, standardization
> >    of coding patterns, etc.
> 
> Since you are already looking at cleaning up the types and testing
> a lot, I wonder if you could make sure this also works for a 32-bit
> phys_addr_t when booting a 32-bit kernel with and without
> CONFIG_X86_PAE. In my recent cleanup series I originally
> changed phys_addr_t to 32 bit after removing CONFIG_HIGHMEM_64G,
> but this caused regressions, so it's still left as u64 even
> though it should not be needed any more.

Yeah, this series does boot fine with and without PAE+HIGHMEM4G in my 
testing.

Thanks,

	Ingo
