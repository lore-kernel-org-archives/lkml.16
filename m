Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0AD623
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 00:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743466190; cv=none; b=iOXPJCeG72IeiIn/f54qB3y7wIaY1gqKcbSd5WBJFrheDLV5RwYE0jFtvV0LaPfX2ZmQHu17kYXCa1Pv8C5eOuOOe6EfTYNN2NGC7+LItdzBBUbBrVSMSbnnUXUcIlVJZgsGsBx9il65oCtxElTB5eh9lzOkTXkmhMc3JedUn+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743466190; c=relaxed/simple;
	bh=wPyTGkQawqkLpSGDotx6rkJZMEfb8YqJiwVvYcCr+/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HwD0VKDTWTBiJLTD5ztMVIO4xS0NzhM8xz+m/5wFFsT7gJ3ha4Hh1VMNceTLCU8ImqdO3+v5RLOvk2OAg/1wPgH0BwNqmerTlo5SAHksfj7l5Rmr59Q07roTBcqqDL+OPa1XJXsJ1B7pcE/pxCwHLXpuHOUDE6kiTLzMyjrpRWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YhhWFXwX; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YhhWFXwX"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e5cbd8b19bso2312a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 17:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743466187; x=1744070987; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wPyTGkQawqkLpSGDotx6rkJZMEfb8YqJiwVvYcCr+/s=;
        b=YhhWFXwXynF1qnSL0ZuSa8MR11ZMGiVuAeifVtUefoe2Y6+3t2DiEuIBcVQP2Oged/
         kSHU8rB+9glccoMHwvWnAy1jDvYBK38OlCAUU/o9gX9Fp5/b/ptZrB+BcSeQNDl/A3A8
         h5Bk6OI8vyCZ2vA0JyfxAiEBbXiig65To8M9LyvsKhsvEwspPBzLCg/Gqk8DT+o845b6
         WxfuQ0cQRGQdrJuiAhx7D+lvrSO/9Vm8+xaXUnUUDJ1ibPy7YXP0CvpXaCCHsGBKcgG9
         9jUzOqxqTvp3tLi0W7RZipDnd4oOkzil4eECNvkxL6FPugJuNul9P3jcQ7YtWjv9HYeJ
         kcqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743466187; x=1744070987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wPyTGkQawqkLpSGDotx6rkJZMEfb8YqJiwVvYcCr+/s=;
        b=f7n33rHA4SZVHQJASIP8sFixfmphYw8GJLjMMJmo1x1JkvCw2pIYmuh7BpTYxh9ERq
         WFeMPZHiMLRd11QZToLM9PherzerPPfGVqfFwmk7EO4bkPbgt7Uww3dveunwWINz4RKG
         OfdzTkt2aOahiO4jWYAgveaEMRXGjgp0TzlporhXqMRfHt8FtvbDu9LM8MCO+s55OrfI
         VLO4eV7lSDOt7KePli3zsm+XFlOVJ3eIZln2z3dAY+afNSvM46IMVBaP7S0DElcC/Mf+
         bMCUGW4D6UTnEV1r502WvMesvf8lWY83wOg9nPVASdBSVxuOeiX4bEOdktMGPf1H+Nte
         WHpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLgsHvb+WMeG6ITKRpRLsgHaC3s0WA+9VlexCupDnphEKj6J5xTMK/CLzmB/3TUL+GcTRrDVXLLwpa3ic=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaQCNyUqtWbGAOq4v6zTwAxK/NbGg7J80/YwrgeMubWAE+WTXo
	IxtV/mAACs2ByHHFTn17bMEGUkpiFqn3uoTw9pIcgivNntdyFLVuPfn80z5HNgktWEgXk9MtgXn
	RqxgW/WHN4XELxRC/avS+V815SdYxBMREHxzBcbCxrrqzJ87644dz
X-Gm-Gg: ASbGncvleVzrgXAy+ORTf8rJb4tm8xvygNbfPHpiIVU0mdXWLODQW/L1auiotYlEoa4
	Ek1zg3xF7vP41c1CBweVUto3+tfBk5wX+qVNIUxRNNvxSN8HW6P0FkiT4R94sOOB1tbytWX5qhe
	ZYgt9OLIZxryRco4fCE+jkYUWBSWv2YINbAzC/fsSZZVx3LVBt3r8b8KUcvybeIlLD
X-Google-Smtp-Source: AGHT+IGEfc/o4rZDLBV4UTZfPGbmzzxGSYaiV1F5ZnIE+a4cQJYdyPrPGUXjOZRNCUEGgEhZf27v3IolyxOGkRjFV7A=
X-Received: by 2002:a50:d692:0:b0:5dc:5ae8:7e1 with SMTP id
 4fb4d7f45d1cf-5f02b1fda43mr53204a12.6.1743466186566; Mon, 31 Mar 2025
 17:09:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331143426.947281958@goodmis.org> <20250331143532.459810712@goodmis.org>
 <CAHk-=whUOfVucfJRt7E0AH+GV41ELmS4wJqxHDnui6Giddfkzw@mail.gmail.com>
 <20250331133906.48e115f5@gandalf.local.home> <CAHk-=wi5pLoe3szxLREQGGJuWU0w_POK9Sv6717UH3b7OvvfjQ@mail.gmail.com>
 <20250331165801.715aba48@gandalf.local.home> <CAHk-=whRNxdkLC6Z91g-_RbrRsUo6K6+nvRWqccjsOycwUe_JQ@mail.gmail.com>
 <20250331194251.02a4c238@gandalf.local.home>
In-Reply-To: <20250331194251.02a4c238@gandalf.local.home>
From: Jann Horn <jannh@google.com>
Date: Tue, 1 Apr 2025 02:09:10 +0200
X-Gm-Features: AQ5f1JpUrW2lj0TfrSE6BTXIbjBh2EGzMdTMoZ84opNiVKnrWGQgwOyns_oePeU
Message-ID: <CAG48ez3w0my4Rwttbc5tEbNsme6tc0mrSN95thjXUFaJ3aQ6SA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] tracing: ring-buffer: Have the ring buffer code do
 the vmap of physical memory
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Vincent Donnefort <vdonnefort@google.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Kees Cook <kees@kernel.org>, 
	Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
	linux-hardening@vger.kernel.org, Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 1, 2025 at 1:41=E2=80=AFAM Steven Rostedt <rostedt@goodmis.org>=
 wrote:
> On Mon, 31 Mar 2025 14:42:38 -0700
> Linus Torvalds <torvalds@linux-foundation.org> wrote:
>
> > .. and *after* you've given it back to the memory allocator, and it
> > gets allocated using the page allocators, at that point ahead and use
> > 'struct page' as much as you want.
> >
> > Before that, don't. Even if it might work. Because you didn't allocate
> > it as a struct page, and for all you know it might be treated as a
> > different hotplug memory zone or whatever when given back.
>
> Hmm, so if we need to map this memory to user space memory, then I can't
> use the method from this patch series, if I have to avoid struct page.
>
> Should I then be using vm_iomap_memory() passing in the physical address?

For mapping random physical memory ranges into userspace, we have
helpers like remap_pfn_range() (the easy option, for use in an mmap
handler, in case you want to want to map one contiguous physical
region into userspace) and vmf_insert_pfn() (for use in a page fault
handler, in case you want to map random physical pages into userspace
on demand).

> As for architectures that do not have user/kernel data cache coherency, h=
ow
> does one flush the page when there's an update on the kernel side so that
> the user side doesn't see stale data?

flush_kernel_vmap_range() (and invalidate_kernel_vmap_range() for the
other direction) might be what you want... I found those by going
backwards from an arch-specific cache-flushing implementation.

> As the code currently uses flush_dcache_folio(), I'm guessing there's an
> easy way to create a folio that points to physical memory that's not part
> of the memory allocator?

Creating your own folio structs sounds like a bad idea; folio structs
are supposed to be in specific kernel memory regions. For example,
conversions from folio* to physical address can involve pointer
arithmetic on the folio*, or they can involve reading members of the
pointed-to folio.
