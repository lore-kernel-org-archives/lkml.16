Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2C021931E;
	Mon,  7 Apr 2025 17:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744047466; cv=none; b=GO3prsPI1xVZRwE79ShYHWagGfhknZqAnig6ZUZ3uS07Pdr22YQFb5hQNoALnmG3oVRTdjfG+xxubpMk5W5XNiiO6H6xUvNmkBrDxo8rxlNQ/QuZTfXRHV5l7X23CcjwcMOfZ8COW5nB3aK6mJBh1aQKbfQiSw5tUmRAMihvuRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744047466; c=relaxed/simple;
	bh=vlvFb/36oExWywUwQghjphG5IpOqvKyJI4kJxsL/qAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TNpCbAPnn2RLKIp94wwPgBDTmeXXgp5vBEcWpmUvqeVzre/qXWVU9mj0f4T17oOMtGIkwdVr/S5pqtUe7Z696h6kkgBrX0E9eQSbS26AJ3M5ozcIFGgrOO6PMo3oyzBu5nxkCM5aw5gFCHddJoqMlpJVQ/7/gIip1OUzpqdlMN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=phjk4y44; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="phjk4y44"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13887C4CEDD;
	Mon,  7 Apr 2025 17:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744047466;
	bh=vlvFb/36oExWywUwQghjphG5IpOqvKyJI4kJxsL/qAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=phjk4y44/S3pC0ppeoSDuHloy4mP5gTsYgNF+pyCSjTUQ4hoF7JE1378SzC3LF2e2
	 HdrHwGz5BAoql38JXNXTJmFXpWyMI1Fp/l3DboG/AlJ63vQ4nJXfvuXZ2nrg0nO5/R
	 Lo6WQlQ3b+Jsi+/LjGunsk231kkKi2Pjy/7/7O3PxPLtPuHMDx0v/rUPtY7Nk1GZ+4
	 bRHRPM0qnafJvljnWyWcL3ULy44tGxkb0ShfRcYldrv/Vag8uvsO2Tun6k0M5zpPvE
	 8n+xvVoe3NbVCX0y2KOpT6UELCvSWO2LNV0KTsL7+XL6G6EVgxMSOqiMyAU9G2aqdE
	 JdtPrnvO9MLIA==
Date: Mon, 7 Apr 2025 10:37:41 -0700
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
Message-ID: <20250407173741.GA3847400@ax162>
References: <202504061053.F27227CA@keescook>
 <CAHk-=whVfxi4KRu-H=tsgSdoGdDz1bvu0_miJT0BTgAf4igpdg@mail.gmail.com>
 <FFE5FB0B-CC92-4A25-8014-E7548AD1C469@kernel.org>
 <CAHk-=wijG2dSOOFr8CCYygwxZQxdTUj73rfB8=tyZP-3G-8-og@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wijG2dSOOFr8CCYygwxZQxdTUj73rfB8=tyZP-3G-8-og@mail.gmail.com>

Hi Linus,

On Sun, Apr 06, 2025 at 07:04:29PM -0700, Linus Torvalds wrote:
> On Sun, 6 Apr 2025 at 18:33, Kees Cook <kees@kernel.org> wrote:
> >
> > I should have said "libcall optimizations". It's not just blindly constructing calls.
> 
> But it's *WRONG*.
> 
> It's stupid. It's not an optimization, it makes things worse.
> 
> > This is the same kind of thing that has been heavily discussed before for bcmp() and stpcpy()
> 
> And it makes a bit more sense at least for stpcpy(), because the
> implementation there is basically "strlen+memcpy". Both of which we
> want the compiler to work on - even if we're not interested in it ever
> using stpcpy().
> 
> IOF, for stpcpy, there's at least a *reason* for the compiler to do it.
> 
> For something like wcslen() the answer is "DON'T DO THIS". Because
> there is absolutely zero upside to trying to recognize this pattern,
> and there is real downside.
> 
> See?
> 
> Don't work around the compiler doing stupid things. Fix the compiler
> options to tell the compiler to "Don'tDoThatThen(tm)".

So I do not necessarily disagree with you in the general sense for these
types of optimizations but I figured that in this case, where this
optimization only gets applied twice in a single translation unit
throughout the entire kernel from what I can tell, the overhead was
unlikely to matter much and it felt less problematic to just add the
function. If this is still genuinely unacceptable in your eyes in spite
of that, so be it.

I will admit I did not actually test if '-fno-builtin-wcslen' would not
work with LTO when I wrote the commit message (I merely drew on the
experience for bcmp() several years ago). Now that I have, it appears
to, at least for the simple arm64 allmodconfig case that I tested.
Looking into it, it looks like '-fno-builtin-*' started being honored
properly for LTO with [1] in LLVM 10 and fixed/adjusted for inlining in
[2] in LLVM 11.

So would the following change be acceptable? I can draft up a commit
message and send it along today if so.

diff --git a/Makefile b/Makefile
index 38689a0c3605..a137de124897 100644
--- a/Makefile
+++ b/Makefile
@@ -1057,6 +1057,10 @@ KBUILD_CFLAGS += $(call cc-option, -fstrict-flex-arrays=3)
 KBUILD_CFLAGS-$(CONFIG_CC_NO_STRINGOP_OVERFLOW) += $(call cc-option, -Wno-stringop-overflow)
 KBUILD_CFLAGS-$(CONFIG_CC_STRINGOP_OVERFLOW) += $(call cc-option, -Wstringop-overflow)
 
+# Ensure clang does not transform certain loops into calls to wcslen() after
+# https://github.com/llvm/llvm-project/commit/9694844d7e36fd5e01011ab56b64f27b867aa72d
+KBUILD_CFLAGS-$(call clang-min-version, 210000) += -fno-builtin-wcslen
+
 # disable invalid "can't wrap" optimizations for signed / pointers
 KBUILD_CFLAGS	+= -fno-strict-overflow
 
---

[1]: https://github.com/llvm/llvm-project/commit/878ab6df033d44430939c02075ee00800995dc3b
[2]: https://github.com/llvm/llvm-project/commit/f9ca75f19bab639988ebbe68c81d07babd952afb

Cheers,
Nathan
