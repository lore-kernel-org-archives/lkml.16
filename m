Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA66416F8F5;
	Mon,  7 Apr 2025 21:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744059722; cv=none; b=sOKflCYVebMZZch4SFgvqHzjUT3k+HinBqIscJPDgf4hhXuPhP/k8qLNI/sm6NQfP9mMX20Lx0okapo1yKYJNWzF924hFU5gTQajyJxTnAHaBN0D7RuzhiEZEfz02FY4qNX3sTMhASwKfoio72N+qjwLtHoN4tZw2C2p/GREXU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744059722; c=relaxed/simple;
	bh=RUEw9MCQ5WbA6rU7L+PsMCGnp4Sk3dSUqWohB4+wKvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dc/exIInCvkf/iVLOAsUtbRBc3acWQuswUlS0RRKw0chzhmbJty83dynSGZTNqEyGFc2wDh+FfG/a0r+/Ip+LUWHCLVEP7w25vBkKkzOId9IT40sePqKGZ9dT4jNaX2oPFLhBT1unFtHgCeZcScgCv/tQM6/uryJFXP7to7g7cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XCRr1pXu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XCRr1pXu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2758AC4CEDD;
	Mon,  7 Apr 2025 21:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744059722;
	bh=RUEw9MCQ5WbA6rU7L+PsMCGnp4Sk3dSUqWohB4+wKvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XCRr1pXu4d64i/540v+tBk1kKW7xIcZJLrGC+1Ds93N9mbJ+ZemzXo+JB9mRYE/CY
	 DUTH9gkhso+Eu+/q4znSAccKiFjfPmr1mCg0LUNyL9forIpvSsus8rHLzKxlDrjXqg
	 ZZwyrSOCw9UW9tq8BfpgYKPR8em/FK1jr32p1fIwj7mrjJ2abBe8tUnTZWx9QTROUs
	 V/Tys5cz/7BshdUuKBZzF+0z0AkXU3YbTJFFu/80gMyoLifvG0PYYFcyS9HoNAr200
	 YaT8YxdtE5KaOg23cyZcmjQ/AOXkH4RMpTxR6HqlxlEKcZKb9Rgkaz58LwHgbTuZzV
	 CzB5pl5hJoj5g==
Date: Mon, 7 Apr 2025 14:01:57 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Peter Collingbourne <pcc@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Will Deacon <will@kernel.org>, llvm@lists.linux.dev
Subject: Re: [GIT PULL] string fixes for v6.15-rc1
Message-ID: <20250407210157.GA583041@ax162>
References: <202504061053.F27227CA@keescook>
 <CAHk-=whVfxi4KRu-H=tsgSdoGdDz1bvu0_miJT0BTgAf4igpdg@mail.gmail.com>
 <FFE5FB0B-CC92-4A25-8014-E7548AD1C469@kernel.org>
 <CAHk-=wijG2dSOOFr8CCYygwxZQxdTUj73rfB8=tyZP-3G-8-og@mail.gmail.com>
 <20250407173741.GA3847400@ax162>
 <CAHk-=wi89ogViEN5oTBmcNQXnMEB5_Qse9G401pSNzocP_dqQQ@mail.gmail.com>
 <20250407192537.GA518371@ax162>
 <CAHk-=wiQgK1ciFurQcHib8gF5oD8ZrWOaCPLDNLn=7ZvkF4=mQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wiQgK1ciFurQcHib8gF5oD8ZrWOaCPLDNLn=7ZvkF4=mQ@mail.gmail.com>

On Mon, Apr 07, 2025 at 01:25:04PM -0700, Linus Torvalds wrote:
> I think if unconditionally works, that's probably the best option
> simply because it's the simplest option.
> 
> But I don't see 'wcslen' in the gcc docs, which was why I was assuming
> it wanted that "check if it works" thing with "$(call cc-option,...)"

It appears that neither gcc nor clang warn for "invalid" libcall values
to '-fno-builtin-*':

$ echo 'int main(void) { return 0; }' | clang -fno-builtin-ireallydonotexist -o /dev/null -S -x c -
$ echo 'int main(void) { return 0; }' | gcc -fno-builtin-ireallydonotexist -o /dev/null -S -x c -

> I don't think we need to call out the particular compiler, since the
> argument against using it is not compiler-specific per se.

Sounds good, I will ultimately make this:

  # Ensure compilers do not transform certain loops into calls to wcslen()
  KBUILD_CFLAGS += -fno-builtin-wcslen

Cheers,
Nathan
