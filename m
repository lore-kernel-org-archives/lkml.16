Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31B7186294;
	Fri, 28 Mar 2025 21:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743198999; cv=none; b=mLYRDno6+jb1waniPXXFj/U+ddmYz1R1bnQUVlqFum/s/UhOjTMP3Q6aAR6kclhu8F7R0P4FZaV9MCtrmKS2qBdbDYuH/jGTuVVpsn0jNNReGiAFipZWsYvN7XRn6KYt6cvf+p+9iYKQk5dOIzQCDQji1HE8pGm42giQhxe6c88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743198999; c=relaxed/simple;
	bh=Gujb+m320PuDNxTY4YhXq/uG35BHF0Afxmnbfk9Bu9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oTIA8gQbvCSVWyDuJY0i/kXA2T9fyd31u3R6H87y59ipHydLLhL8Xj2dMwrJE2jZurvBNiCrQMDcB0noV7FoXDk1T7o9LokbJHZCzRxe2cb8vCbalanMoZ6xv8JgwH0eAKK8T6s4h4NX3JIEDbAArczmOuaguUc7Ynjlq8jbFGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W8jDHRHK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W8jDHRHK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BC61C4CEE4;
	Fri, 28 Mar 2025 21:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743198998;
	bh=Gujb+m320PuDNxTY4YhXq/uG35BHF0Afxmnbfk9Bu9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W8jDHRHK77Tf0PUisoKII5myboATQe+eIbYIVfQPfRASmhaljzqGedNhFAsIDxTVh
	 lZfsYe4nsA4LZ2eZBwF/ht63fX42VZreFe04Wp5hAKR44qsOuiIouNU9l7QLgqYCnF
	 0887CK5ruEO48GJ4OIx65kIxDhKyU/VSs3AsNJX510d0lrri9o0DxULbStpmt7/EVV
	 RgjTnd+485dl84gj3+8G93Nh2uEFmD6T+Wh/M/MDE8hyfRXz3znxBqPB6pPpMmYHKs
	 yCy7uAa7jpl0m9jIyiFuuJtXEFegnifZJGWBiEaqqcw3DDbHXGofWtvclpTHMyKTVu
	 P6+Cw5oWbY8FA==
Date: Fri, 28 Mar 2025 22:56:33 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>, David Gow <davidgow@google.com>,
	Brendan Higgins <brendan.higgins@linux.dev>, x86@kernel.org,
	Rae Moar <rmoar@google.com>,
	Sergio =?iso-8859-1?Q?Gonz=E1lez?= Collado <sergio.collado@gmail.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [PATCH] x86/tools: Drop unlikely definition from
 insn_decoder_test
Message-ID: <Z-cbEbqwree_EgVP@gmail.com>
References: <20250318-x86-decoder-test-fix-unlikely-redef-v1-1-74c84a7bf05b@kernel.org>
 <Z9spq9OccwK7vKj7@gmail.com>
 <b26a2a43-3c55-4086-88e2-64e65dcfbeb2@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b26a2a43-3c55-4086-88e2-64e65dcfbeb2@linuxfoundation.org>


* Shuah Khan <skhan@linuxfoundation.org> wrote:

> On 3/19/25 14:31, Ingo Molnar wrote:
> > 
> > * Nathan Chancellor <nathan@kernel.org> wrote:
> > 
> > > After commit c104c16073b7 ("Kunit to check the longest symbol length"),
> > > there is a warning when building with clang because there is now a
> > > definition of unlikely from compiler.h in tools/include/linux, which
> > > conflicts with the one in the instruction decoder selftest.
> > > 
> > >    arch/x86/tools/insn_decoder_test.c:15:9: warning: 'unlikely' macro redefined [-Wmacro-redefined]
> > >       15 | #define unlikely(cond) (cond)
> > >          |         ^
> > >    tools/include/linux/compiler.h:128:10: note: previous definition is here
> > >      128 | # define unlikely(x)            __builtin_expect(!!(x), 0)
> > >          |          ^
> > >    1 warning generated.
> > > 
> > > Remove the second unlikely definition, as it is no longer necessary,
> > > clearing up the warning.
> > > 
> > > Fixes: c104c16073b7 ("Kunit to check the longest symbol length")
> > > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > > ---
> > >   arch/x86/tools/insn_decoder_test.c | 2 --
> > >   1 file changed, 2 deletions(-)
> > 
> > I suppose this should be merged into the Kunit tree? The c104c16073b7
> > commit is in -next currently.
> > 
> > Anyway:
> > 
> >    Acked-by: Ingo Molnar <mingo@kernel.org>
> > 
> 
> Thanks Ingo.
> 
> David/Brendan, Okay to apply this for the next rc?

Since the original commit is now upstream, I've picked up this fix for 
x86/urgent and we'll send it to Linus in a day or two.

I've added your Ack:

  Acked-by: Shuah Khan <skhan@linuxfoundation.org>

if that's OK to you.

Thanks,

	Ingo
