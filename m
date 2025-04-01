Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E202E3398
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 00:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743466329; cv=none; b=kF5VCshSbm2kaWUVBxhyo3U0oDNmkey48ZuukYQvYCAEtucmSSem5MG2fC0QAfxIyT4sbkXIQ2SmeWM3YZnW6jkvUBIQ541hSgcBpkNitApVV8xLNmHxd2kEnhhnSxxaN+LnYMiLQQ8c3j22b+1EgVdgxWSCsa51OvjHBHbLrZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743466329; c=relaxed/simple;
	bh=4OBqz7wDraSoW0l6yq+0GpIDBxLW46dFRm5AL8c+8kg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lfVXIeDaacZlmu3bZ39l8/X5xow5eV31OQDaNnaHT3ZjAvCg3Xk06tbt7/R224OcbDITC4ypqlQa7/2dMZTzVoqVhV7JV2OYq4olIyvrQ+4oZHBHo8VZ2+SDvF8c9j233UGFVt5P6RaEI7bvBZrTvrf7LEt74FJTFz9dfTYZGAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=c3UGq60D; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="c3UGq60D"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e6194e9d2cso9704982a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 17:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743466326; x=1744071126; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JePFNkfbv8aLxrEPQhMGBSSVCyqR/ZwFXTbEBhcrHt4=;
        b=c3UGq60D+GvWqS4mdEzeDGDYzIpCTK4C4mXqsVTd44NWM7d7WZlbBjOHw+wZ+G2jHu
         ZgbXDIUQYtmGZY2swluO1FzEyXSxPuYX+6P6fQGGMlSsBlfLIyTNmy74sX6E+zvxSWj5
         ejWrm6tIynDuAuea2OwA8Q2H234bhSb+gYy8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743466326; x=1744071126;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JePFNkfbv8aLxrEPQhMGBSSVCyqR/ZwFXTbEBhcrHt4=;
        b=pQ/VdBQ97jmIKpZ2nZg2Gyflqios5H2lGj7J8za3YFqANySgisW1+JMGOo+zuSQytv
         jcBqm3+LXmb9/QG1X/9nxFBV59WHnAzzZ9fFJ5uFxPOMjBkxPXPAYvmtFHP9+JObQC77
         qtDBiabHHFgSau+zw2EquJS6eUy5YxgagB48bSAWNPcfWwyF8PGl125AvNtf7SZI2W/+
         b/92VJSzpwRy/GKuUxdL62qhHCBItGzJ28OukG+XxhnGb2vv+8RnqJF09PZQzcpuxR5S
         WnOMWWvvYSdyoQrSvDJ/4p6G/4cy+N7oYZy+O8VbERhrI0CcYTnTrkxI0RgvP7PDz+fG
         mPeA==
X-Gm-Message-State: AOJu0YwzaRcyutiAC6i/Fgp8KwPyxUcqElSkEuXCnbpyVXPS6xib9uF3
	RA0PYGrbEqYCKgBdMD+M22d9jBZqk6LdOf8Fp3Rp7lvOYLF7n+sNdYrMvJY9ByX1o5gddv9f/Vb
	9gB4=
X-Gm-Gg: ASbGncubuPcICU2Zl5uo1KLt6jAoAXJfRCx8RY5aWwXxA6co8Yb0Q2nA8Q0YzmSOsp/
	Nox81V4ju4Ir69/SnQsb9uUTHDqH419P7+TkO+LdBm/x97lYelOt8FvbnFRdPcUhRXMJeC3K4C9
	GChYiyEMCDVh/FbUbLwFaj+2tww4fk1xsBYteECeAJcrDHSedYITTKH2OLYPrcZ/V6itopccH3I
	vBZlN/WrVZDzoR/8936mFlLMZ1SZNL32V75yHQYanKyUIRf6h5zfXwr3ulkQDk++JS1hn9HA6C0
	TZJ7zo64GU/o5IBAXbsQGvUDtuJ4oUiqaNHdgeWXYbEEwRBIFySLOzdNyPk+97iWEp8u5gz9iVu
	1CBVMp+cU7dCbVCZ5C20=
X-Google-Smtp-Source: AGHT+IHleLj1aF8S03OiwlPs6QBoajM5kjphoH3BswGAbRxBLlfV0yslIsXr1UIDrIRC+DQF+XrKuw==
X-Received: by 2002:a05:6402:2547:b0:5ed:2762:727a with SMTP id 4fb4d7f45d1cf-5edfcd4b01amr8082902a12.11.1743466325868;
        Mon, 31 Mar 2025 17:12:05 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc18030afsm6504731a12.81.2025.03.31.17.12.02
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 17:12:04 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-abbb12bea54so1021084966b.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 17:12:02 -0700 (PDT)
X-Received: by 2002:a17:907:2cc7:b0:ac3:b50c:c95b with SMTP id
 a640c23a62f3a-ac738c6f05amr961651866b.56.1743466322604; Mon, 31 Mar 2025
 17:12:02 -0700 (PDT)
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
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 31 Mar 2025 17:11:46 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiDQpOeXi_GjKB7Mrh93Zbd__4k+FF_vJd+-prbaacEug@mail.gmail.com>
X-Gm-Features: AQ5f1JqK7DmBOcFeFBdcHQa56oLi7rko5ae58L-hQhqZ-SgnT-hvWfyBuLaYeuE
Message-ID: <CAHk-=wiDQpOeXi_GjKB7Mrh93Zbd__4k+FF_vJd+-prbaacEug@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] tracing: ring-buffer: Have the ring buffer code do
 the vmap of physical memory
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vincent Donnefort <vdonnefort@google.com>, Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, linux-hardening@vger.kernel.org, 
	Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 31 Mar 2025 at 16:41, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> Hmm, so if we need to map this memory to user space memory, then I can't
> use the method from this patch series, if I have to avoid struct page.
>
> Should I then be using vm_iomap_memory() passing in the physical address?

I actually think that would be the best option in general - it works
*regardless* of the source of the pages (ie it works for pages that
don't have 'struct page' backing, but it works for regular RAM too).

So it avoids any question of how the page was allocated, and it also
avoids the page reference counting overhead.

I thought you did that already for the user mappings - don't use you
remap_pfn_range()?

That's basically the equivalent of vmap_page_range() - you're mapping
a whole range based on physical addresses, not mapping individual
pages.

But I didn't go look, this is from dim and possibly confused memories
from past patches.

> As for architectures that do not have user/kernel data cache coherency, how
> does one flush the page when there's an update on the kernel side so that
> the user side doesn't see stale data?

So if you don't treat this as some kind of 'page' or 'folio' thing,
then the proper function is actually flush_cache_range().

I actually suspect that if you treat things just as an arbitrary range
of memory, it might simplify things in general.

For example, the whole flush_cache_page() thing obviously just flushes
one page. So then you have to artificially iterate over pages rather
than just use the natural range.

HOWEVER.

At this point I have to also admit that you will likely find various
holes in various architecture implementations.

Why?

Because sane architectures don't care (there's basically no testing of
any of this on x86, because x86 is typically always cache coherent
outside of some GPU oddities that are handled by the DRM layer
explicitly, so all of these functions are just no-ops on x86).

And so almost none of this gets any testing in practice. A missed
cache flush doesn't matter on x86 or arm64, and very seldom elsewhere
too.

We do have "flush_cache_range()" calls in the generic MM code, and so
it *should* all work, but honestly, I'd expect there to be bugs in
this area.

Of course, I would expect the same to be true of the page/folio cases,
so I don't think using flush_cache_range() should be any worse, but I
*could* imagine that it's bad in a different way ;)

              Linus
