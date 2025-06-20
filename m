Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FCE1FBEA6
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 18:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750445767; cv=none; b=WFNAtzbFw3n/QLfQE4NZyIe0CaIXsSKlQYkZ6RoMWH2OYxX6+Cxi+7ZlGmSYY3iSZpO5jnkxMzNi2PMRChEbfGw27a3PO9ocfKuCXdsLR6UcrBhI62T8BQLUdPa2RgX/mKG0gs3DBhMTcNrb70tGVzK/++OnS7MZPPyCX3OcXyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750445767; c=relaxed/simple;
	bh=3ZWv6pJ1P+qO2ceUT6OkaGab4GTeMQ7MCR6CHcmWpCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c8qvVhfEfL5izya4na0NJufIypKwel6MbSFJ5V+xYEKYcn+pNtLMkZ+hqbc0aPTJbnUtlB2mX7m5N0z+LxXl0n7jTYDI7holDA+VNkGHHeqOHcYlHiapj1XpWgKU4gVlCrGzD2MY22Y08rDSzxFFwyFd3iy6AVUyo3IT7ofW7Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wbinvd.org; spf=pass smtp.mailfrom=wbinvd.org; dkim=pass (2048-bit key) header.d=wbinvd.org header.i=@wbinvd.org header.b=TUOacAVa; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wbinvd.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wbinvd.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wbinvd.org header.i=@wbinvd.org header.b="TUOacAVa"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-234bfe37cccso29092355ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 11:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wbinvd.org; s=wbinvd; t=1750445765; x=1751050565; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f+HEITA2dX1aYujll3OHX4xef5VcGiuOk2/IfTQS9/w=;
        b=TUOacAVapBINL7VI52FTcvNyAV254i4UYEFexav26NO0oZHgsq51IH0zP9xVAqi2lj
         NEIUx/k74bv9zzhDR4JlQb9M8zLzD33NgNGM/zQkrXRPcmLSysmbk/CtvIscAjATrUk0
         e4dvPPVtnnGEYGJoMC8XN6iYBStNem/tl47zvajWAGPeeWMvdykAkgLqYHfmU/shrKWZ
         +CeGSxbRDavvuCspdfA7TK/6EqDz+FopoiiwqoFD+VaMvf7Sn+UuHAaAQI4qtSS/DPy1
         EogJJwzSE8SmMiUPq6XpcApoBOOsiKHUZUln5sMK6H2OOYCfwcgVdwX7swb6Jiiq1lST
         5NrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750445765; x=1751050565;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f+HEITA2dX1aYujll3OHX4xef5VcGiuOk2/IfTQS9/w=;
        b=Tz2XCYvsQKncTp5DWaYDrLg17Z24FCh4Zcm3ECCzsyzD/nu4YrzbbB8+O0bvkPrBBE
         r24uv8BPK7ApBAhlBIgsK6edAIEiyDvAZnJ/VU4nGwYJwOJs3zLJAgxqntysWE0A4KIu
         TbIuRExctNClSMhhxnnRPSORcqi2/4Iga8+p4Ew0eB8cvgXqrug0gJEthOt2ymXCHXkc
         Rhl1Zwxwdr0UOyFyJ2Ize4l0ULYx6laGGWDBYm91Hk/gc+RMGFQMeJm0OYJnbccVs9xy
         P+CI+abapKBWI6OtRZC7EY2DbzGssu2+JJTtuNqgm78Us0DwbPpQ6WmFv0pDXcycHPUB
         gIxw==
X-Gm-Message-State: AOJu0Yz9JwJ+QsBgg25mwtMbmvAKjYrlTXVk7Pev4NYs2y9hssbarSj6
	2fi/FdGZtkBuvCyMOEg2beL/omZ2l7Osd2xn4w29CfVlSJKZSSEh+pkT3CQuPP+k05+B3zXDS3q
	lbdjK
X-Gm-Gg: ASbGncsTDvt4E7e5uT2g30dF7uat3MRbP0NcOvtAH45FyWGVZtY3Mr361EgVkUFgCfz
	j2uFd/WylnfYEBksFp6V8XxCm9HrecYNqVeJB5o/1osLQlPW/5ERNxQ2p15LDhdiLdd3f2kN9MR
	9BGwYYcLQglJEAepSkV/HRyLOYsAOzdPRvMiwFD4qi+zM0hSLqBQnKN/aCW+D+2VVRVlHwbIA+h
	pG27YdtX4y5wArf/H3ZAltnhk53uPpoVIuh6G5GCUPaI2oOylBcqBJ2qIf519qyVaOGJj8L/Wvc
	WM1Ja6l3egAuw83WvrLs6fuLvFG+FidKtDq8iWzC+N2gVcrSkHZWg65VnE5CC4PJgZoFV85oRSq
	PK60nSiJUw+khPqMsuDIUUVl7P1+0R0A=
X-Google-Smtp-Source: AGHT+IGApfVMQ/tLs1d+ctuFzl6TsPvurszXNSONVg0mc9GC9mInqbAOaqj3jfgWHImeLHUAJzcrvw==
X-Received: by 2002:a17:903:1a83:b0:234:c549:d9dd with SMTP id d9443c01a7336-237d9ac3da1mr63538045ad.48.1750445764601;
        Fri, 20 Jun 2025 11:56:04 -0700 (PDT)
Received: from mozart.vkv.me (192-184-162-253.fiber.dynamic.sonic.net. [192.184.162.253])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83eefc9sm23685645ad.74.2025.06.20.11.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 11:56:04 -0700 (PDT)
Date: Fri, 20 Jun 2025 11:56:01 -0700
From: Calvin Owens <calvin@wbinvd.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, "Lai, Yi" <yi1.lai@linux.intel.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org
Subject: Re: [tip: locking/urgent] futex: Allow to resize the private local
 hash
Message-ID: <aFWuwdJUEUD8VcTJ@mozart.vkv.me>
References: <aFEz_Fzr-_-nGAHV@mozart.vkv.me>
 <20250617095037.sOnrJlPX@linutronix.de>
 <aFGTmn_CFkuTbP4i@mozart.vkv.me>
 <20250618160333.PdGB89yt@linutronix.de>
 <aFLuDoX9BGBUC3tW@mozart.vkv.me>
 <20250618170924.Z34OXf1E@linutronix.de>
 <aFMoDcWy-OzE3yoV@mozart.vkv.me>
 <aFNCHS-5LLywIAC7@mozart.vkv.me>
 <aFR8EuMg82aMCvjo@mozart.vkv.me>
 <20250620103110.xd5CEFDs@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250620103110.xd5CEFDs@linutronix.de>

On Friday 06/20 at 12:31 +0200, Sebastian Andrzej Siewior wrote:
> On 2025-06-19 14:07:30 [-0700], Calvin Owens wrote:
> > > Machine #2 oopsed with the GCC kernel after just over an hour:
> > > 
> > >     BUG: unable to handle page fault for address: ffff88a91eac4458
> > >     RIP: 0010:futex_hash+0x16/0x90
> …
> > >     Call Trace:
> > >      <TASK>
> > >      futex_wait_setup+0x51/0x1b0
> …
> 
> The futex_hash_bucket pointer has an invalid ->priv pointer.
> This could be use-after-free or double-free. I've been looking through
> your config and you don't have CONFIG_SLAB_FREELIST_* set. I don't
> remember which one but one of the two has a "primitiv" double free
> detection. 
> 
> …
> > I am not able to reproduce the oops at all with these options:
> > 
> >     * DEBUG_PAGEALLOC_ENABLE_DEFAULT
> >     * SLUB_DEBUG_ON
> 
> SLUB_DEBUG_ON is something that would "reliably" notice double free.
> If you drop SLUB_DEBUG_ON (but keep SLUB_DEBUG) then you can boot with
> slab_debug=f keeping only the consistency checks. The "poison" checks
> would be excluded for instance. That allocation is kvzalloc() but it
> should be small on your machine to avoid vmalloc() and use only
> kmalloc().

I'll try slab_debug=f next.

> > I'm also experimenting with stress-ng as a reproducer, no luck so far.
> 
> Not sure what you are using there. I think cargo does:
> - lock/ unlock in a threads
> - create new thread which triggers auto-resize
> - auto-resize gets delayed due to lock/ unlock in other threads (the
>   reference is held)

I've tried various combinations of --io, --fork, --exec, --futex, --cpu,
--vm, and --forkheavy. It's not mixing the operations in threads as I
understand it, so I guess it won't ever do anything like what you're
describing no matter what stressors I run?

I did get this message once, something I haven't seen before:

    [33024.247423] [    T281] sched: DL replenish lagged too much

...but maybe that's my fault for overloading it so much.

> And now something happens leading to what we see.
> _Maybe_ the cargo application terminates/ execs before the new struct is
> assigned in an unexpected way.
> The regular hash bucket has reference counting so it should raise
> warnings if it goes wrong. I haven't seen those.
> 
> > A third machine with an older Skylake CPU died overnight, but nothing
> > was logged over netconsole. Luckily it actually has a serial header on
> > the motherboard, so that's wired up and it's running again, maybe it
> > dies in a different way that might be a better clue...
> 
> So far I *think* that cargo does something that I don't expect and this
> leads to a memory double-free. The SLUB_DEBUG_ON hopefully delays the
> process long enough that the double free does not trigger.
> 
> I think I'm going to look for a random rust packet that is using cargo
> for building (unless you have a recommendation) and look what it is
> doing. It was always cargo after all. Maybe this brings some light.

The list of things in my big build that use cargo is pretty short:

    === Dependendency Snapshot ===
    Dep    =mc:house:cargo-native.do_install
    Package=mc:house:cargo-native.do_populate_sysroot
    RDep   =mc:house:cargo-c-native.do_prepare_recipe_sysroot
            mc:house:cargo-native.do_create_spdx
            mc:house:cbindgen-native.do_prepare_recipe_sysroot
            mc:house:librsvg-native.do_prepare_recipe_sysroot
            mc:house:librsvg.do_prepare_recipe_sysroot
            mc:house:libstd-rs.do_prepare_recipe_sysroot
            mc:house:python3-maturin-native.do_prepare_recipe_sysroot
            mc:house:python3-maturin-native.do_populate_sysroot
            mc:house:python3-rpds-py.do_prepare_recipe_sysroot
            mc:house:python3-setuptools-rust-native.do_prepare_recipe_sysroot

I've tried building each of those targets alone (and all of them
together) in a loop, but that hasn't triggered anything. I guess that
other concurrent builds are necessary to trigger whatever this is.

I tried using stress-ng --vm and --cpu together to "load up" the machine
while running the isolated targets, but that hasn't worked either.

If you want to run *exactly* what I am, clone this unholy mess:

    https://github.com/jcalvinowens/meta-house

...setup for yocto and install kas as described here:

    https://docs.yoctoproject.org/ref-manual/system-requirements.html#ubuntu-and-debian
    https://github.com/jcalvinowens/meta-house/blob/6f6a9c643169fc37ba809f7230261d0e5255b6d7/README.md#kas

...and run (for the 32-thread machine):

    BB_NUMBER_THREADS="48" PARALLEL_MAKE="-j 36" kas build kas/walnascar.yaml -- -k

Fair warning, it needs a *lot* of RAM at the high concurrency, I have
96GB with 128GB of swap to spill into. It needs ~500GB of disk space if
it runs to completion and downloads ~15GB of tarballs when it starts.

Annoyingly it won't work if the system compiler is gcc-15 right now (the
verison of glib it has won't build, haven't had a chance to fix it yet).

> > > > Thanks,
> > > > Calvin
> 
> Sebastian
