Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1A22C1A2;
	Tue,  8 Apr 2025 01:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744075409; cv=none; b=kDgSlF8gjBhj/BF2mUtBWNxA4C8kiU/ubfBtb/t1UAJ/60mfE0GvO4VnRxj8bq/Q4CtE+zjsh0G+0ZHp+v4xljCVXc0zcZS1SYHcHz0hZmJl+oL4rC3SNS0MeBRSE1203vowsRF78rh0kK1N76lpMlg6tWLvbBib1mdIR8e10WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744075409; c=relaxed/simple;
	bh=84fDVGkUTdJUTtSMGNxjTm2lp64cSjhR44AJkaIZClM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=meCjm7+KgW2BhnYXGL6Dk9/3HxNxNFKM5brbrgvKzCDie+xPkcxZpNbLfUehCeCeh2A7K5hOmm1pEOat4PhhK4aNT7wC3+zt/JbAaGnUgmzH/MBo2RQjZr5wlFapZW3GX7UEK8kQkw+yOhvaNTclnbQ7IdMZsOjOEBVPoT8CKfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q0yuj3CX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q0yuj3CX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5B0EC4CEDD;
	Tue,  8 Apr 2025 01:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744075408;
	bh=84fDVGkUTdJUTtSMGNxjTm2lp64cSjhR44AJkaIZClM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q0yuj3CXbsGBJDNquyi9xGT7PWLUg6Y+4Q0thl7hHk34amRW7RJeRPi4zHfN8zZDd
	 ZG3xlqKO0SRlIkQFDoKBppvkRM5uR7JPP/cu1tEgVlmjFftT3mLQmRwibEzKHe9W90
	 MPJnaUG9KvLZHBgWl83z2uhGvKRN/H5rAUUqa59mJOn9N4T+M7TJoQqvwa0+YKgeMU
	 UVxPdgktpgYceD15hp3fmVsMxUBHSdu7d/1PM5GhAKX6rpF9bzAlll89L/rArnyU+b
	 LbHvcubwJ8Iv2yrWtYdApu6hLdScRuB3tmXX9S8JnP5DE+nzfvzmjUxdswjkTnFrdX
	 ZUyH+CM/sj/1w==
Date: Mon, 7 Apr 2025 18:23:25 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Philip Li <philip.li@intel.com>, kernel test robot <lkp@intel.com>, 
	Guenter Roeck <linux@roeck-us.net>, oe-kbuild-all@lists.linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, Linux Memory Management List <linux-mm@kvack.org>, 
	Alessandro Carminati <acarmina@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
Subject: Re: [linux-next:master 12681/13861] drivers/i2c/i2c-core-base.o:
 warning: objtool: __i2c_transfer+0x120: stack state mismatch: reg1[24]=-1+0
 reg2[24]=-2-24
Message-ID: <bzy7cad37tafrbcmsstn355fpljxxmi25ifc4piihp6ln3ztxh@zp3c7ydsjmuq>
References: <202504011011.jyZ6NtXx-lkp@intel.com>
 <Z+ttzRArSBMqfABz@rli9-mobl>
 <xqfrt2rueezh3upug2umvuw2r44luoaxfqycnmvkh5sezaosw6@h77yjfio4ws6>
 <348cdb14-f8cf-1e7b-44b2-79dc4dda4e35@loongson.cn>
 <lcozyamcrcuff6a3pgly7sptluuj7ubzvy4na2vrus7hfmwmb6@zv7tooy3pmkh>
 <0cbe7ab8-bd87-b5f7-0513-07c82a7e76c9@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0cbe7ab8-bd87-b5f7-0513-07c82a7e76c9@loongson.cn>

On Mon, Apr 07, 2025 at 06:52:10PM +0800, Tiezhu Yang wrote:
> There is a potential execution path with only using s0 and ra
> (without using s1, s2, s3, etc): 2d58-->2d70-->2f88-->2e78-->2e84

[...]

> From this point of view, it seems that there is no problem for the
> generated instructions of the current code, it is not a runtime bug,
> just a GCC optimization.

I don't see how this is responsive to my email.

I described a code path which revealed a GCC bug, specifically with asm
goto (unless I got something wrong).  Then you responded with a
*completely different* code path.

How does that prove my original code path isn't possible?

To summarize, the path I found was

  2d58 ... 2d9c -> 2da8 .. 2dc4 -> 2ebc .. 2ec0 (runtime patched static branch) -> 2e78 .. 2e84 (ret)

> (2) Analysis
> 
> In fact, the generated objtool warning is because the break instruction
> (2ee8) which is before the restoring s1 instruction (2eec) is annotated
> as dead end.

Actually, it's the opposite.  Objtool would normally consider BREAK to
be a dead end.  But it's annotated as "reachable", aka "non dead end".

> This issue is introduced by the following changes:
> 
>  #define __WARN_FLAGS(flags)					\
>  do {								\
>  	instrumentation_begin();				\
> -	__BUG_FLAGS(BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
> +	if (!KUNIT_IS_SUPPRESSED_WARNING(__func__))			\
> +		__BUG_FLAGS(BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
>  	instrumentation_end();					\
>  } while (0)
> 
> of commit e61a8b4b0d83 ("loongarch: add support for suppressing warning
> backtraces") in the linux-next.git.

Putting that annotation behind a conditional should not break anything.

> (4) Solution 1
> One way is to annotate __BUG_ENTRY() as reachable whether
> KUNIT_IS_SUPPRESSED_WARNING() is true or false, like this:
> 
> ---8<---
> diff --git a/arch/loongarch/include/asm/bug.h
> b/arch/loongarch/include/asm/bug.h
> index b79ff6696ce6..e41ebeaba204 100644
> --- a/arch/loongarch/include/asm/bug.h
> +++ b/arch/loongarch/include/asm/bug.h
> @@ -60,8 +60,9 @@
>  #define __WARN_FLAGS(flags)                                    \
>  do {                                                           \
>         instrumentation_begin();                                \
> -       if (!KUNIT_IS_SUPPRESSED_WARNING(__func__))                     \
> -               __BUG_FLAGS(BUGFLAG_WARNING|(flags),
> ANNOTATE_REACHABLE(10001b));\
> +       if (!KUNIT_IS_SUPPRESSED_WARNING(__func__))             \
> +               __BUG_FLAGS(BUGFLAG_WARNING|(flags), "");       \
> +       __BUG_FLAGS(0, ANNOTATE_REACHABLE(10001b));             \
>         instrumentation_end();                                  \
>  } while (0)

Huh?  That's basically:

	if (!suppress_warning)
		WARN();
	BUG();

So it upgrades a conditional WARN to an unconditional BUG???

Not to mention the reachable annotations are backwards: the WARN() is
annotated as dead end while the BUG() is annotated reachable.

Even if that silences objtool somehow, it will most definitely have the
wrong runtime behavior.

> (5) Solution 2
> The other way is to use "-fno-shrink-wrap" to aovid such issue under
> CONFIG_OBJTOOL at compile-time, like this:

As far as I can tell, that would be a workaround to get objtool to stop
warning about a legitimate compiler bug.

-- 
Josh
