Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70172147EA
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 16:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743440152; cv=none; b=g3DDbpAPtY+dbdtfU3muNzvffPcbsx5jjKpKxVJoKwf/lzuLeHNRioiRmHyArf6wVsDXzj/6yHMJ1VMN4bkeqUqlg/DTYrRmPrZ0hxl0OhVz/ousGD0GSHdQPOqpPNykkw3P2FORn4wTi8Lfk0J2BGDmaFT32g6aMdqjb+M5BoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743440152; c=relaxed/simple;
	bh=nbbZ8G/enUVJMoOd8aC7hUU9KCHgeQrNZ7sTOkRuFAo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GEXEHvCwJJBh+SwvYXFm/Zq721EsKzPmqWA41s6tsXetZxfGS0kZczdzPp/djWORL54cKvvLMuDaOB/JD/NMEHVMCONTxWkIyMEC0tylrh6MnzsKT+ojAZKlCuvbJ/U9yUE9/chDXLaEFSCrzuyC9X8BMSHR+1fVPlM2RjmgV2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=UIOVn4p3; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="UIOVn4p3"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac2902f7c2aso819004466b.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 09:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743440149; x=1744044949; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nYwZCdqgU/HYxLtCJzRvtoajX2kMqfp4JL+kcV4obEM=;
        b=UIOVn4p3dAcUTmoImoEHvUdxVaalZirlcHHFONU9Tnzfwp+Vor9zmcPdiR2du0vbz5
         UnID1ZEIqevWMX9tv33LF0tUb5Nv4KlwqDh3ciZHrCOTGMB6GFKf9sdciLSf5NIZDZnp
         hSa4PkumVvZtMSF4YbKk8I3tBaF60esSmA4/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743440149; x=1744044949;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nYwZCdqgU/HYxLtCJzRvtoajX2kMqfp4JL+kcV4obEM=;
        b=BFcxXiiRs7KBxVu6/4utisyTmnEZePQlyKyc6KUrKdO3yLJScUGlyvLUutzp1LOq6R
         mPKiXPWcQ85oEq0HjqY6r0mmZSDzaYX4ShgtdYljvzICG/I29wMrI+kvYyd5IivXIhh2
         qj8bRsgjKmvYOgPnqvLScx+1KAIenfe8r/4j+V+GRyanlzRJJgdr31bMHYZWcwb7ddr7
         aYAV2wjo2s+5/Xs6kESDRCmS+oV++IwNI/IqW7Rl7++48SKRkgfc6mF9APjsb15H40cj
         oG6kNtk5Yx0hsm2lbefk0ow5ijuf2vQLQcNSsH62Adm9wOHhwfZ1Fo1xwlrwZNLccRku
         f+7w==
X-Gm-Message-State: AOJu0YwC95nQhB+3Fbj0uNJ77UZ+q8bVzppf3NoCFDQTX9+iF2wn5zKv
	e1wbyZQZg8qBy5lvs9fIPTLTW//PanQOjRX0lDSGOOhNX1IS99cSRwXdlbLZ9D+v+jgrmsMYm2d
	CiKk=
X-Gm-Gg: ASbGncuMC0sOOcQDR6K1VrX6ecUybeZ0AzsgvM4VOO/PHbKXQrg7FUV3RTkwgnqgmO9
	D3WdYR/DGZ5izasYQeoXaYt8Sr933VN00GqOUAbCWjHOErglonNOm57EKZvzO1DFBubk8/SquQG
	CcUpEPRBlMTF8Ntjowc62QH2HnhZDEDoiZHb+mgq8+N6n/QyHffssQ1gN+CHENutTHiVMKGkljh
	zg8O7NjQFfU+5JKAcqAijSlS/Pst9e8R09w7UhKlNzktTtGtTTRxkmDeTyN3hHb5cppFIJLMQG3
	+L4AqfcZy8S0uxstMSNysPwY2IqbO40urh5NUyiNPZs/LeDsUndEJe0BF1kLk5iSQBxBssVPUKA
	dgGN3fDNb8HCRsQR6Z0A=
X-Google-Smtp-Source: AGHT+IFSRd1P5zRejBNj7D1vnYoYvcFfVM0qpfNWKPFFu+Wpybei/kFAPn3Z5zchydO3f62pqLtpFA==
X-Received: by 2002:a17:906:5908:b0:ac7:3a23:569c with SMTP id a640c23a62f3a-ac73a235730mr760871066b.1.1743440148665;
        Mon, 31 Mar 2025 09:55:48 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7196ca988sm642848866b.150.2025.03.31.09.55.46
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 09:55:46 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e5e0caa151so8836850a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 09:55:46 -0700 (PDT)
X-Received: by 2002:a17:907:3f26:b0:ac4:3d4:50b with SMTP id
 a640c23a62f3a-ac738a95899mr973600566b.32.1743440145725; Mon, 31 Mar 2025
 09:55:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331143426.947281958@goodmis.org> <20250331143532.459810712@goodmis.org>
In-Reply-To: <20250331143532.459810712@goodmis.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 31 Mar 2025 09:55:28 -0700
X-Gmail-Original-Message-ID: <CAHk-=whUOfVucfJRt7E0AH+GV41ELmS4wJqxHDnui6Giddfkzw@mail.gmail.com>
X-Gm-Features: AQ5f1JofnGlZZIBzRL8nqNouUuwr3wJtpcwy6ycYi9xaYeiAa4GGLQMcoE3H27Y
Message-ID: <CAHk-=whUOfVucfJRt7E0AH+GV41ELmS4wJqxHDnui6Giddfkzw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] tracing: ring-buffer: Have the ring buffer code do
 the vmap of physical memory
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vincent Donnefort <vdonnefort@google.com>, Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="UTF-8"

On Mon, 31 Mar 2025 at 07:34, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> Instead, rename ring_buffer_alloc_range() to ring_buffer_alloc_physical()
> where contiguous physical memory is passed to the ring buffer code,

The concept looks like an improvement, but:

> +static unsigned long map_pages(unsigned long *start, unsigned long *end)
> +{
> +       struct page **pages;
> +       phys_addr_t page_start;
> +       unsigned long size;
> +       unsigned long page_count;
> +       unsigned long i;
> +       void *vaddr;
> +
> +       /* Make sure the mappings are page aligned */
> +       *start = ALIGN(*start, PAGE_SIZE);

The above is *completely* unacceptable.

There is no way in hell that ALIGN() can ever be right.

You don't even fix up the low bits of the returned virtual address, so
you literally return the virtual address of something that doesn't
match what was passed in.

So if you pass it a starting area that isn't page-aligned, it now
randomly gives you complete crap back, and includes some random
unrelated part in the mapping.

So no. That needs to be a

        if (*start & PAGE_MASK)
                return NULL;

or whatever. Because just randomly corrupting the base address by
ignoring the low bits is not ok.

> +       /* The size must fit full pages */
> +       page_count = size >> PAGE_SHIFT;

This part works, simply because truncating the size is fine. It won't
all get mapped, but that's the caller's problem, at least the code
isn't returning random crap that has random other data in it.

That said, I don't see the point. If you want to virtually map
physical pages, they need to be full pages, otherwise the end result
gets randomly truncated. So I think that while this is much better
than the "return random crap that doesn't make any sense", it should
be the same rule: just don't allow mapping partial pages.

So make it be

        if (size & PAGE_MASK)
                return NULL;

instead, and just enforce the fact that allocations have to be sanely
aligned for vmap.

Anyway, that takes care of the horrific interface. However, there's
another issue:

> +       pages = kmalloc_array(page_count, sizeof(struct page *), GFP_KERNEL);

you create this pointless array of pages. Why? It's a physically
contiguous area.

You do that just because you want to use vmap() to map that contiguous
area one page at a time.

But this is NOT a new thing. It's exactly what every single PCI device
with a random physical memory region BAR needs to do. And no, they
don't create arrays of 'struct page *', because they use memory that
doesn't even have page backing.

So we actually have interfaces to do linear virtual mappings of
physical pages that *predate* vmap(), and do the right thing without
any of these games.

Yes, the legacy versions of interfaces are all for IO memory, but we
do have things like vmap_page_range() which should JustWork(tm).

Yeah, you'll need to do something like

        unsigned long vmap_start, vmap_end;

        area = get_vm_area(size, VM_IOREMAP);
        if (!area)
                return NULL;

        vmap_start = (unsigned long) area->addr;
        vmap_end = vmap_start + size;

        ret = vmap_page_range(vmap_start, vmap_end,
                *start, prot_nx(PAGE_KERNEL));

        if (ret < 0) {
                free_vm_area(area);
                return NULL;
        }

and the above is *entirely* untested and maybe there's something wrong
there, but the concept should work, and when you don't do it a page at
a time, you not only don't need the kmalloc_array(), it should even do
things like be able to use large page mappings if the alignment and
size work out.

That said, the old code is *really* broken to begin with. I don't
understand why you want to vmap() a contiguous physical range. Either
it's real pages to begin with, and you can just use "page_address()"
to get a virtual address, it's *not* real pages, and doing
"pfn_to_page()" is actively wrong, because it creates a fake 'struct
page *' pointer that isn't valid.

Is this all just for some disgusting HIGHMEM use (in which case you
need the virtual mapping because of HIGHMEM)? Is there any reason to
support HIGHMEM in this area at all?

So I'm not sure why this code does all this horror in the first place.
Either it's all just confused code that just didn't know what it was
doing and just happened to work (very possible..) or there is
something odd going on.

          Linus
