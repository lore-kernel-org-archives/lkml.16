Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B622AF1E
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 15:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747841023; cv=none; b=tb+D4C4cWonzVGR7PECPqBlUY55qvgQ4xQpRcj1eX2qA6KZJY1lQwpxphVp+Fs+XMgNLX+GIP41S67njawrsPi69xbDaQwjhI3DDawUFugW4uPHprdnW16Hj99OT2ehcI4OCmuVwSQDwfkWalFj2kWKdOGWAcWd/nyxSXGZQv50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747841023; c=relaxed/simple;
	bh=1CcDQ4m97A4Xe4o6j6Cwv75N0aejjAIt2M6JDL02s4s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fNuCzjK+NJku5zUwYGTaISQosbDlko3NkdZmnZ0Cw7JracLH1vdWDh4ysxfYcLuawnP9Q0hQ/x6mdlszQsB9GH3h24zzIUfRzkPPxmtkW3WdNIVifCh60QmAnVARe09vZBdIHNfpb3fbtuvCIrttf7JnM5w1j0KdHqVf5xHxDnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pqnQvMHW; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NOBK1jzq; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pqnQvMHW";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NOBK1jzq"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747841019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ppp2TqJLky1I3rI+t/8setko+mbIUJDKf5b7IN96CTw=;
	b=pqnQvMHWsGLDzizqBRmWsKBOxrbR2TU2QgKAwFxmUX26jl3JokfCUrOt337zrhwDCk6kFs
	dJo/crtMiajdUPTBAAxNdVOvKwF9lMg9coPOINTDuDeF5fCiLGkrotuhMkPYAPLBi92Gbf
	hKUTzmPghBxUpGu/+dELL5/cpMzZ57bPQ6SED6fDQmeM1DMN0fqYiZA1PZ6eDkSef1OCeu
	lbJAo5ZVkHNIWYBIggFh7rgfZjIbKrUggzpL3PbR8dFtsz3OB60JjwRdUMcYplsYN9wG/y
	k2U/CAtI0KmHtmCk7WgslUkAlOhvzXmQ6aYDLhhkChYrhnIEmVjtaR+YEQRayw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747841019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ppp2TqJLky1I3rI+t/8setko+mbIUJDKf5b7IN96CTw=;
	b=NOBK1jzqPcQjElSGrnWXnpslV1McrR0ojnLMWaPO1MOFCiiuAGzJsR62K5NfMy3Z60Q0sG
	sPyXNSJNxPxD+jAA==
To: Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@kernel.org>, "Ahmed
 S. Darwish" <darwi@linutronix.de>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Brian Gerst <brgerst@gmail.com>, "Kirill
 A. Shutemov" <kirill@shutemov.name>
Subject: Re: [PATCH v4 1/6] x86/cpu: Use a new feature flag for 5 level paging
In-Reply-To: <20250519131944.GCaCsv8A71vn21AB1W@fat_crate.local>
References: <20250517091639.3807875-8-ardb+git@google.com>
 <20250517091639.3807875-9-ardb+git@google.com>
 <20250519094038.GIaCr8ltHvLBYjk8iI@fat_crate.local>
 <aCstaIBSfcHXpr8D@gmail.com>
 <20250519131944.GCaCsv8A71vn21AB1W@fat_crate.local>
Date: Wed, 21 May 2025 17:23:37 +0200
Message-ID: <874ixernra.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, May 19 2025 at 15:19, Borislav Petkov wrote:
> On Mon, May 19, 2025 at 03:08:56PM +0200, Ingo Molnar wrote:
>> The second best thing we can do is to have a sane, constant LA57 flag 
>> for the hardware capability, and introduce a synthethic flag that is 
>> set conditionally (X86_FEATURE_5LEVEL_PAGING) - which is how it should 
>> have been done originally, and to maintain compatibility, expose the 
>> synthethic flag in /proc/cpuinfo as 'la57' to maintain the ABI.
>
> - we don't expose every CPUID flag in /proc/cpuinfo for obvious reasons:
>
>   Documentation/arch/x86/cpuinfo.rst
>
> - if you want to mirror CPUID *capability* flags with X86_FEATURE flags *and*
>   use the same alternatives infrastructure to test *enabled* feature flags,
>   then you almost always must define *two* flags - a capability one or an
>   enabled one. I don't think we want that.
>
> And since we're dealing with ancient infrastructure which has grown warts over
> the years, we all - x86 maintainers - need to decide here how we should go
> forward. I have raised these questions multiple times but we have never
> discussed it properly.
>
> Also, Ahmed and tglx are working on a unified CPUID view where you can test
> capability.  Which means, what is enabled can be used solely by the
> X86_FEATURE flags but I haven't looked at his set yet.
>
> So it is high time we sit down and hammer out the rules for the feature flags
> as apparently what we have now is a total mess.

There are several issues with the handling of CPUID and feature flags:

   1) The evaluation of the CPUID information is a complete maze and
      has been expanded as people see fit without ever thinking about
      a proper design.

      As a result many CPUID instances are read out a gazillion times
      to evaluate only parts of them and most of it is done with
      magically hardcoded constants and the most convoluted macros.

   2) The in memory representation is as stupid as it gets. Some CPUID
      features are stored as is, others are analyzed and individual bits
      are stored in some artifical bit field.

   3) There is no clear seperation between global and per CPU
      information. Real CPUID features are supposed to be global and
      identical accross all CPUs. Per CPU data in CPUID is information
      which is related to topologies of all sorts (APIC, caches, TLBs,
      power etc.)

   4) Drivers having access to CPUID is just wrong. We've had issues
      with that in the past because drivers evaluated CPUID themself and
      missed that the core code had stuff disabled.

So what we (mostly Ahmed) are trying to do here is to create a 1:1 view
of the CPUID information in memory with proper data structures, which
are generated out of the CPUID data base.

I know people will whine that this is waste of memory, but we are
talking about a few kilobytes of data and not about insane large structs.

That means we end up with something like this:

	union cpuid_info {
		unsigned long		bits[SIZE];
		struct cpuid_data	data;
        };

        struct cpuid_data {
        	struct leaf_0		leaf_0;
                struct leaf_1		leaf_1;
                ....
                struct leaf_N		leaf_N;
        };

Some of the leafs will be arrays, but that's a implementation
detail. Versus CPU feature bits this means that we are not longer
looking at a condensed linear bitmap of feature bits. but at a sparse
populated bitmap. The bitmap offsets of the individual feature bits are
computed at build time and not longer hardcoded in some horribly
formatted header file.

This allows to:

     1) Read _all_ CPUID information once into memory

     2) Make _all_ subsequent CPUID related operations memory based

     3) Remove CPUID() from drivers and other places and let them retrieve
        the information out of the relevant leaf structures by doing

            if (!info->data.leaf_N.foo_enabled)
            	return;
            foo = info->data.leaf_N.foo;

        instead of

            cpuid($N, eax, ebx, dummy1, dummy2);
            if (!(eax & MAGIC_NUMBER))
            	return;
            foo = MAGIC_MACRO_MESS(ebx);

        That also makes sure that everything in the kernel looks at a
        consistent piece of information, especially when the boot code,
        mitigations, command line options etc. disabled certain features.

Now what about software defined (artificial) feature bits including BUG
bits?

We still need them and there is no reason why we would replace them with
something else. But, what we want to do here, is basically the same as
we do for the real CPUID information:

   Create and document real artifical leafs (there is enough reserved
   number space in the CPUID numbering scheme) and put those into the
   CPUID database as well.

   That allows to handle this stuff in the same way as any other CPUID
   data and the autogeneration of bit offsets and text information for
   cpuinfo just works the same way.

Coming back to the original question with the example of LA57 and the
actual enablement. There is no reason why we can't have the actual CPUID
bit and a software defined bit.

The way how this should work is:

    1) The CPUID info is in data.leaf_07.la57

    2) The enablement bit is in data.leaf_linux_N.la57 or such

The CPUID database contains the entries for those in leaf_07:

      <bit16 len="1"  id="la57"                    desc="57-bit linear addresses (five-level paging)">
        <vendors>
          <vendor>Intel</vendor>
          <vendor>AMD</vendor>
        </vendors>
        <linux        feature="true"               proc="false" />
      </bit16>

and leaf_linux_N:

      <bit3 len="1"  id="la57"                     desc="57-bit linear addresses (five-level paging)">
        <vendors>
          <vendor>Linux</vendor>
        </vendors>
        <linux        feature="true"               proc="true" />
      </bit3>

As the "proc" property of leaf_07.la57 is false, the bit won't be
exposed in cpuinfo, but the software defined bit will.

This also means, that we switch to a model where the software defined
bits are not longer subject to random introduction and removal. We
simply keep them around, mark them as not longer used and introduce new
ones with proper documentation. That requires due process, which
prevents the adhoc messing around with feature bits, which has us bitten
more than once in the past.

Aside of code clarity and simplification there is another benefit of
having such a proper defined and documented view:

  Analysis in crash dumps becomes easy for tooling because both the
  kernel and the tools can rely on machine generated data which comes
  from a single source, i.e. the x86 cpuid data base.

Versus global and per CPU information.

Global information contains:

  - all feature bits, which can be mapped into the X86_FEATURE machinery

  - all globally valid information which is only accessed via software,
    e.g. the name string or some numerical data, which is the same on
    all CPUs

Per CPU information contains:

  - all leafs which truly contain per CPU information (topology, caches,
    power ...)

This will obviously take some time to hash out and implement, but in the
long run this is the right thing to do.

Thanks,

        tglx
