Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE775CA4E
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 01:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750467753; cv=none; b=bBoiZWVkV1nGzWTD/2GQZXNtRO6ODgaqs4Ss4uF8CVl6npcI4DGAMc5Ai/uBz2pJvchBh+SHY4ynROLTG69FDKju3Cvk/onUPTmbx9wMOj7sOM1Wo4i2OGT1c2ghqbltMLuMrBsVQfKV8u1WpRsGtVqsuKgsLSUQu3eP3Uj2KIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750467753; c=relaxed/simple;
	bh=af6FzFhXi8gv+jRzJqZHDG09GWwcquWKzA8vb6aEbB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VzmqzW1unmIIAs9+2oXG8kpCWQciQpA84lHLsHxuAXdUwh76/6yqRk9kiw7F/mbTVFcCUHs+2igYlwa6x/tJB2hrDlGGXQxUVSg2O0i6yU/bEmU3D46s7/3PNm/L5L2ZDALgLaDNPXgMAa5a18zPdDJPLRWU8lL91fgv5j031s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wbinvd.org; spf=pass smtp.mailfrom=wbinvd.org; dkim=pass (2048-bit key) header.d=wbinvd.org header.i=@wbinvd.org header.b=LyKh585Q; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wbinvd.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wbinvd.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wbinvd.org header.i=@wbinvd.org header.b="LyKh585Q"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2350fc2591dso21217215ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 18:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wbinvd.org; s=wbinvd; t=1750467751; x=1751072551; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CnfTENJhbN9QXEW9wztMGXyJgUjoEFZj9FwbTqXby3Y=;
        b=LyKh585Q5tgFEmxDZCMBTBgQwm6jk0yA27Lwg6iHPBisC6WlikYYO8BGwWNoC/WtBF
         HZh0lgEXoIMlcbPSIuXotaCFlqbcgsCfH4V9WuwWSAeHFy9FdIGtDkJz75tpWAXJoRVV
         fBYcO/jUNOAXdsa3eygHDn5SOlFV3eeZmCpNOPOSxIYgbZhdhTr2Wgb/bSLoW4Okpzns
         YMQO0I3nPRYjtUpVD8JttvsMgL0va9rZRb5VeYv2aAn9sDUxmBColMBrfFp7OGJEawtC
         c6TyT/lZyFhVHcG82wXM7P56vV3lvHtw65suP0wYQuBPnkU87L9XV6RmPS/n7/B31T4k
         f40w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750467751; x=1751072551;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CnfTENJhbN9QXEW9wztMGXyJgUjoEFZj9FwbTqXby3Y=;
        b=ZPEiKEJOCPGE9JaNr/NjDbBiWw/qCApMpGtn7gcKI5CLcfkrahgZ8PjbBy43+epy77
         tAJcLhTLbNvi1SjamTvaXxu/GHry3qVenRon2Ebq3dZQAQTTePm6rsxBALvVo7vyMFca
         1AwDafl6hkOOL1KSGng2L1MzJt2q2ZPlqCC8rz0uWsw+yY32POL0Skb3KYmmyKxF/CCM
         cNxfUQVtn1UuHYEilX1PIXtpLl8oZAus2xgC1q8TdhlwRrKiboMUMuLLYokwRmAdHctL
         wL3hX6nYGTF9jQhuV5kV93Gc5iXrBVlvhslkqG3hRGMH1xsJNcxteh934C779qLN7Af2
         8l/g==
X-Gm-Message-State: AOJu0YzSZI2/Dgx6m2QJIqxMoQHkJnvAL7SWdSbe2QpJ3ZLbGBPUPsw1
	lZtyrrwchqha8DvpR3JaygdEcbC6k4KNxFBNwIlIqFwalxzIn7pvvpUU9jVMocWzCgk=
X-Gm-Gg: ASbGncvFysLd4QybZuPTZ7XxSt2d+68kTS2Vi8ajLRUOgJ+045p64Apavmslp6mpGXS
	7mWQcKZa/Sw2vO6ZJi7fZobP+dFUwNXwtxOUPQ3QgYQf6x14jranCOSwp4PRGFo0SPiQwu9NE7L
	+TVAIqTMG5tRyy7EzTpNJMVtGLl/GzhLcwsuN/9uzMO5hZUHUJEJVusyMZZmmuMS6nntJ9UZPF3
	dUBeQpJZqtnfLar2uwD2thYg/W1F++Flbg6jLI9ppAdFZ8/XXd3KSLi4ScQAHdblxYQIn/5ME9w
	M2ZPWVmDXpOuSu3RHFhCvWRnPW/w9XUyGPi/fbmqJHkoAYzhvrRTa6IvheUGj0oTj2KHVjgnL9i
	ch0Wo9C4RabwGNlWHdvJWKr2FMOd/R7s=
X-Google-Smtp-Source: AGHT+IFiV9KrNMeL+P3XxxvghYZ1D1JdEgxJi7NSH6wNu23RBOPJ8fT//tjREayQKPkBPv4FWrZUhA==
X-Received: by 2002:a17:903:2443:b0:221:89e6:ccb6 with SMTP id d9443c01a7336-237db124344mr66605805ad.25.1750467751047;
        Fri, 20 Jun 2025 18:02:31 -0700 (PDT)
Received: from mozart.vkv.me (192-184-162-253.fiber.dynamic.sonic.net. [192.184.162.253])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8393541sm28592345ad.27.2025.06.20.18.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 18:02:30 -0700 (PDT)
Date: Fri, 20 Jun 2025 18:02:28 -0700
From: Calvin Owens <calvin@wbinvd.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, "Lai, Yi" <yi1.lai@linux.intel.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org
Subject: Re: [tip: locking/urgent] futex: Allow to resize the private local
 hash
Message-ID: <aFYEpPIwhlL1WvR0@mozart.vkv.me>
References: <20250617095037.sOnrJlPX@linutronix.de>
 <aFGTmn_CFkuTbP4i@mozart.vkv.me>
 <20250618160333.PdGB89yt@linutronix.de>
 <aFLuDoX9BGBUC3tW@mozart.vkv.me>
 <20250618170924.Z34OXf1E@linutronix.de>
 <aFMoDcWy-OzE3yoV@mozart.vkv.me>
 <aFNCHS-5LLywIAC7@mozart.vkv.me>
 <aFR8EuMg82aMCvjo@mozart.vkv.me>
 <20250620103110.xd5CEFDs@linutronix.de>
 <aFWuwdJUEUD8VcTJ@mozart.vkv.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aFWuwdJUEUD8VcTJ@mozart.vkv.me>

On Friday 06/20 at 11:56 -0700, Calvin Owens wrote:
> On Friday 06/20 at 12:31 +0200, Sebastian Andrzej Siewior wrote:
> > On 2025-06-19 14:07:30 [-0700], Calvin Owens wrote:
> > > > Machine #2 oopsed with the GCC kernel after just over an hour:
> > > > 
> > > >     BUG: unable to handle page fault for address: ffff88a91eac4458
> > > >     RIP: 0010:futex_hash+0x16/0x90
> > …
> > > >     Call Trace:
> > > >      <TASK>
> > > >      futex_wait_setup+0x51/0x1b0
> > …
> > 
> > The futex_hash_bucket pointer has an invalid ->priv pointer.
> > This could be use-after-free or double-free. I've been looking through
> > your config and you don't have CONFIG_SLAB_FREELIST_* set. I don't
> > remember which one but one of the two has a "primitiv" double free
> > detection. 
> > 
> > …
> > > I am not able to reproduce the oops at all with these options:
> > > 
> > >     * DEBUG_PAGEALLOC_ENABLE_DEFAULT
> > >     * SLUB_DEBUG_ON
> > 
> > SLUB_DEBUG_ON is something that would "reliably" notice double free.
> > If you drop SLUB_DEBUG_ON (but keep SLUB_DEBUG) then you can boot with
> > slab_debug=f keeping only the consistency checks. The "poison" checks
> > would be excluded for instance. That allocation is kvzalloc() but it
> > should be small on your machine to avoid vmalloc() and use only
> > kmalloc().
> 
> I'll try slab_debug=f next.

I just hit the oops with SLUB_DEBUG and slab_debug=f, but nothing new
was logged.

> > > I'm also experimenting with stress-ng as a reproducer, no luck so far.
> > 
> > Not sure what you are using there. I think cargo does:
> > - lock/ unlock in a threads
> > - create new thread which triggers auto-resize
> > - auto-resize gets delayed due to lock/ unlock in other threads (the
> >   reference is held)
> 
> I've tried various combinations of --io, --fork, --exec, --futex, --cpu,
> --vm, and --forkheavy. It's not mixing the operations in threads as I
> understand it, so I guess it won't ever do anything like what you're
> describing no matter what stressors I run?
> 
> I did get this message once, something I haven't seen before:
> 
>     [33024.247423] [    T281] sched: DL replenish lagged too much
> 
> ...but maybe that's my fault for overloading it so much.
> 
> > And now something happens leading to what we see.
> > _Maybe_ the cargo application terminates/ execs before the new struct is
> > assigned in an unexpected way.
> > The regular hash bucket has reference counting so it should raise
> > warnings if it goes wrong. I haven't seen those.
> > 
> > > A third machine with an older Skylake CPU died overnight, but nothing
> > > was logged over netconsole. Luckily it actually has a serial header on
> > > the motherboard, so that's wired up and it's running again, maybe it
> > > dies in a different way that might be a better clue...
> > 
> > So far I *think* that cargo does something that I don't expect and this
> > leads to a memory double-free. The SLUB_DEBUG_ON hopefully delays the
> > process long enough that the double free does not trigger.
> > 
> > I think I'm going to look for a random rust packet that is using cargo
> > for building (unless you have a recommendation) and look what it is
> > doing. It was always cargo after all. Maybe this brings some light.
> 
> The list of things in my big build that use cargo is pretty short:
> 
>     === Dependendency Snapshot ===
>     Dep    =mc:house:cargo-native.do_install
>     Package=mc:house:cargo-native.do_populate_sysroot
>     RDep   =mc:house:cargo-c-native.do_prepare_recipe_sysroot
>             mc:house:cargo-native.do_create_spdx
>             mc:house:cbindgen-native.do_prepare_recipe_sysroot
>             mc:house:librsvg-native.do_prepare_recipe_sysroot
>             mc:house:librsvg.do_prepare_recipe_sysroot
>             mc:house:libstd-rs.do_prepare_recipe_sysroot
>             mc:house:python3-maturin-native.do_prepare_recipe_sysroot
>             mc:house:python3-maturin-native.do_populate_sysroot
>             mc:house:python3-rpds-py.do_prepare_recipe_sysroot
>             mc:house:python3-setuptools-rust-native.do_prepare_recipe_sysroot
> 
> I've tried building each of those targets alone (and all of them
> together) in a loop, but that hasn't triggered anything. I guess that
> other concurrent builds are necessary to trigger whatever this is.
> 
> I tried using stress-ng --vm and --cpu together to "load up" the machine
> while running the isolated targets, but that hasn't worked either.
> 
> If you want to run *exactly* what I am, clone this unholy mess:
> 
>     https://github.com/jcalvinowens/meta-house
> 
> ...setup for yocto and install kas as described here:
> 
>     https://docs.yoctoproject.org/ref-manual/system-requirements.html#ubuntu-and-debian
>     https://github.com/jcalvinowens/meta-house/blob/6f6a9c643169fc37ba809f7230261d0e5255b6d7/README.md#kas
> 
> ...and run (for the 32-thread machine):
> 
>     BB_NUMBER_THREADS="48" PARALLEL_MAKE="-j 36" kas build kas/walnascar.yaml -- -k
> 
> Fair warning, it needs a *lot* of RAM at the high concurrency, I have
> 96GB with 128GB of swap to spill into. It needs ~500GB of disk space if
> it runs to completion and downloads ~15GB of tarballs when it starts.
> 
> Annoyingly it won't work if the system compiler is gcc-15 right now (the
> verison of glib it has won't build, haven't had a chance to fix it yet).
> 
> > > > > Thanks,
> > > > > Calvin
> > 
> > Sebastian
