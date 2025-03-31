Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1121221884B
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 19:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743448352; cv=none; b=SZ+Yr9Yimht1qHEaKm2fsMjV5mxmur+7iDMWCzrk6BE/OEk9WkVUwhO3gaUQiRAqytnUJ1AJ7CC24G8pvPVk0HOTap0pqUkjWLpSFikRl//o5ljLYSh7nm0wEcmUieq22nHfk8jvx53LmU6PlIlBKLW4UD0xReUHGwpUMaOkDh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743448352; c=relaxed/simple;
	bh=PV4ZWuWia5BRoS43j+c6MY1tfA+wTbXjkY0S7EwOtLk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iNcjzZK0hifpOWqOicTQObcznnvBZW7NGC0JBkC8r8v+l05Y4C8CLCxDBAXx6e8vyjzUkNa6LCbS0nhpJm18L4qmkp5NYZI2bVc3TOlswPEDcRTDuOWbbg2hHHJw3oYnbRUzL9Rd3SZQ+KjecRpJHak879BIKiQIU1p7M/fzuv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Vsa683ZB; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Vsa683ZB"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e6ff035e9aso4482494a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 12:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743448348; x=1744053148; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CAyEvyF8shhlI0zeiTAETM+fQKaZCzqYYXdl5MvqdzQ=;
        b=Vsa683ZB2hVvUXWnoaqgPfiBn7IHSALcdfed06qMRB64uafo53zftf5vwHm/1Vt36D
         YpyGq2HX/umKc9m3HHTmrAtoJt63C4TOKi76VP5JCrPPn0o68y7KKJgF65cbvICzzHc1
         vakWHr4m4vaLzxOfpjW2/lrLe9zK4OpqLDlGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743448348; x=1744053148;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CAyEvyF8shhlI0zeiTAETM+fQKaZCzqYYXdl5MvqdzQ=;
        b=LPzTDY/OCNYsMev7mXpZ098kpixM/c2w7klCrAI4pOO7Otfzk9PWxr3MCbAeuBKtjB
         jBh8KVo1x1/u+sJDp65lBHf/wf5cfic5xYA82MEB8NlvdRxwqA+4Q1e2MT8OgEYbomIQ
         ypWFNIVB7Bq0bCW5AeI8mYL7vK8hV/QPSm9sfoWh7/1bJU01kc42r+B5s//i2aDsTdxS
         7V+uQGOhLJz0CmC2eNnd8MtYziWImNvsvGIcGgLodO6R8maWbDV54vH55OzsbMUxTFwj
         Jv9K9EU4XaHshuo/r3RBl2ECNBGS6BT6ne1+y7tOXtaBWIz5m6CSO4xjyAM7k6Zaz/Wx
         tZVA==
X-Gm-Message-State: AOJu0Yyts/nMuqLuvg8AJZwe9yqGFdlL6JrojJpJnhDX2Yhr+yGWiHyy
	7FuPGE5DiJ+IwWr56lrLig+blQa9ZMkwCY2aCn01XHHrx1IbNF6uxnGSxj+PDHbgbssyPxmjCRf
	pCR4=
X-Gm-Gg: ASbGncuoOv2ARq+NMdP6n9W+K3WsNpzPc9bVW0munKSDp2N7bGFowzE8CWULaz0EXaw
	6Ev1BJvGDoJgQZi69TUmSy4ehiIXL56+tb8RTApsbpvYsr6QT+ShAMbbU/LqJuv2zAlXYHJisbb
	yFLnV6ZKVTdVOqc+qRe/DYvJ+0ZRncCCdl1Mrjv43m3FXR4zN2/amv9I5sZjKQ6PGqmYnt1pp3U
	AfObqoxie4ennI9KCbMQMjudu480eWuX9xG5KkBzEPgbpTiyf7ix6xUGkSvcmzssX65uBNGbMag
	+l4qP37wxRcv5Lg9MIdwdRbQRdaHkDmFlpzTvcZRALuN8E9rKFsNitWLGmeBg/fSJ8hlV3ov0mU
	79oz4Rm2RM9F+5tj9gtwv40DTEbYT0A==
X-Google-Smtp-Source: AGHT+IHuW+NL/44wW6ongtudq2SHRSTOrTzw3LlW4gqZ0Q35miqWu19W5DUjkko2En6mdOFypFLurA==
X-Received: by 2002:a05:6402:34c8:b0:5eb:cc1b:773a with SMTP id 4fb4d7f45d1cf-5f02b333448mr196535a12.23.1743448348021;
        Mon, 31 Mar 2025 12:12:28 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17dfe1dsm5978741a12.69.2025.03.31.12.12.25
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 12:12:25 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e686d39ba2so4526237a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 12:12:25 -0700 (PDT)
X-Received: by 2002:a17:907:2cc5:b0:abf:73ba:fd60 with SMTP id
 a640c23a62f3a-ac782be130dmr33191366b.29.1743448345444; Mon, 31 Mar 2025
 12:12:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331143426.947281958@goodmis.org> <20250331143532.459810712@goodmis.org>
 <CAHk-=whUOfVucfJRt7E0AH+GV41ELmS4wJqxHDnui6Giddfkzw@mail.gmail.com> <20250331133906.48e115f5@gandalf.local.home>
In-Reply-To: <20250331133906.48e115f5@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 31 Mar 2025 12:12:08 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi5pLoe3szxLREQGGJuWU0w_POK9Sv6717UH3b7OvvfjQ@mail.gmail.com>
X-Gm-Features: AQ5f1JpTB-4kVjtmNv0aborYt6qti1nP5IpkPDDowc_-kPaTaqaDeELjzSuvoaw
Message-ID: <CAHk-=wi5pLoe3szxLREQGGJuWU0w_POK9Sv6717UH3b7OvvfjQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] tracing: ring-buffer: Have the ring buffer code do
 the vmap of physical memory
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vincent Donnefort <vdonnefort@google.com>, Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 31 Mar 2025 at 10:38, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> I just did this to be robust in case what was passed in was not aligned. In
> all my use cases, it is.

I really think that ALIGN() is absolutely the opposite of robust.

It silently just makes incorrect values generate incorrect code.

Robust is dealing correctly with incorrect values, not making it
incorrect data just create even more incorrect data.

> OK, so I did copy this from fs/pstore/ram_core.c as this does basically the
> same thing as pstore. And it looks like pstore should be updated too.

Please just stop copying code from random drivers or filesystems.

Christ.

I've said this before: core kernel code has higher quality
requirements than random drivers (or even random filesystems).

You can't copy crazy incorrect snippets from random sources and put it
in core kernel code.

> This is due to what the "reserve_mem" kernel command line feature gives
> back. It reserves physical memory that is not part of the kernel memory
> allocator (it also works with memmap ie. memmap=12M$0x284500000, which also
> requires physical memory addresses that are not part of the memory
> allocator).

Yeah, so in that case turning those into "struct page *" is
horrendously wrong, because you've literally taken it away from the
memory management.

If it's not part of the kernel memory allocator, it does not
necessarily have a "struct page *" associated with it. Using a pointer
to 'struct page' and passing it off is just fundamentally more than a
bug: it's seriously and deeply broken.

It's probably much more obviously broken if the physical addresses
came from a PCI device, and this all just happens to work because it's
actually real RAM and we ended up having a 'struct page []' for it for
some random reason.

But the generral rule is that if all you have physical RAM addresses,
you can use them as phys_addr_t (or turn them into pfn's, which is
just the page index of the physical address).

I think that *completely* bogus code worked only entirely due to luck
- the 'struct page *' was never actually dereferenced, and it got
turned back into a pfn and then a page table entry by the vmap code
using purely address arithmetic (page_to_phys() and page_to_pfn()).

So it probably only ever used pointer calculations, although some of
those actually can end up depending on dereferencing 'struct page' (to
find the base zone of the page, to find the mapping).

Add even with just pointer games, that should actually have triggered
a warning in vmap_pages_pte_range() from this:

                if (WARN_ON(!pfn_valid(page_to_pfn(page))))

which I suspect means that we actually *do* end up having 'struct
page' backing for those..

Looking closer...

I think what happened is that reserve_mem() actually does end up
giving you pages that have the 'struct page' backing store even if
they aren't mapped. Which makes the 'struct page' pointer stuff work,
and those pages end up working as 'reserved pages'.

And I suspect that happens exactly because we had users that mis-used
these 'struct page *' things, so it might even be intentional.

Or it might just be because that memory *has* been in the E280 memory
map before it was reserved, and the 'strict page' arrays may have been
sized for the original E280 information, not the "after stealing"
information.

I didn't go look into that early memory reservation code, but I would
not be surprised if there have been fixups to work around bugs like
this. I haven't had to look at it in ages, but maybe the bootmem code
knows that bootmem allocations then might be given back to the VM and
need to have those 'struct page' backing store things

Or - and this is also entirely possible - maybe you were just very
lucky indeed because the code to allocate the 'struct page' regions
ends up intentionally over-allocating and rounding things up.

Because of how the buddy allocator works, each 'struct page' array
needs to be rounded up to the maximum page allocation, so I think we
always allocate the page arrays of a memory zone up to at least
PAGE_SIZE << NR_PAGE_ORDERS boundaries (so 8MB-aligned, I think). So
there's fundamnetally some slop in there.

Anyway, if you allocated them as physical addresses outside of the
regular MM code, you should not use 'struct page' in *any* form.  You
really can't just turn any random physical address into a page, unless
it came from the page allocator.

And yes, I'm not at all surprised that we'd have other mis-users of
this. We have some very historical code that depends on reserved pages
going back all the way to linux-0.01 I suspect, because things like
the original VGA code knew that the physical addresses were in the
BIOS hole region that was backed by 'struct page'.

                Linus
