Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B813211
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 01:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743472565; cv=none; b=fce50ICFlwTNIHX9xY+PFVSd5Y2dkuNTUGE0Z9CDRUKUX/07J+MnOul609MF294wL6t5C7kmeHODcFs5S/u4o5QCh7k3KzQqFtvW6YpaMUypWtiHWHertUaUtCXlivNOh99ny5jZdJQaZAUIcsrvgbybAmrfrVx+NLcS+9xuZvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743472565; c=relaxed/simple;
	bh=oYdy5TUOKD3/QmBchtEfluPYVm4jH9Npv+xFiaubOWk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LPM6ge7Ln76c2s9cWZTG5uee+ugIvgJTwgoGntc2QBQZQKveRrwLwTL6olABCt3ntZHZW4crZx+0cXtGEoW1MMwWTBeak5iYAP7Ew+1QrjG8CgfIXDTM83HGmcS/TpR97A/UgLVdlcLaNivk60EvD1X6YNt/EDJHNfY6psAvbtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=WtslxSRy; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="WtslxSRy"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-abf3d64849dso775171866b.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 18:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743472561; x=1744077361; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xTFYf6OdHdCoXwqeAxP2OyQHhkHeGJVwqSUrO9x7fRM=;
        b=WtslxSRyhzzsK2LOiaQHHw34WovgEr064Ace9pk5ne6o+YSi4CQjKZhkY7ewfcEJp1
         4s2c85XfDrTgHa0vY/zLNBHyLg4AFHJJFb4tZqFPtaKeXrwVwzDhpTzxHTi3ew6AWEIc
         8LFBVtLGMXBD/OfJkkUl+8LRQMZSFnwP69j24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743472561; x=1744077361;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xTFYf6OdHdCoXwqeAxP2OyQHhkHeGJVwqSUrO9x7fRM=;
        b=D23kVsHPCRG70lY7+J5awcGabp8Bh2lYz/qsjXvtgONS7avJJNYldaAKFtaYc1xW9B
         JUyYDVOCfVAaK/rEquax+FOUz+X+2ABpRwz7bhdo+SA4+UE7MUrZ+ItTJ8D0n/RduId0
         LQXXN1NNgVBnNurPDa/qyQPOGNSzLAtBpzat3m5ukF4ZRw2TLoqSTj9tHEqSnMpoWXWP
         wIrNrnkSoprFk2zqBYWPCwf/L4vgorPLAEzrZKNVJUBkbUWLebW1uyHEY+V+HFvHrZ/D
         j5cqqvwm9SJPBSa3PbqbxJGEi2gxibA6Q33zpp2JGU4NavhCbpISppt+qOPlnBJTUa66
         H84Q==
X-Forwarded-Encrypted: i=1; AJvYcCV7Mfqe9ulrgKjHHJJenY0J15YRC5+ILklWBsb2guu1m2bFpSQOGrAY9+iur7F6Oaaspr+R1jsRzZPS70A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsrc+nt0JZqFtfCoitYyyNqXlTYLTPTiwBYtUQeJCtnWgu2TEn
	u+6VHOJoE6QYdTgJ2QXh+p/zBxQvZDaTLC8DlELVN7IZa4A2apLq0fSjP5GRxcIl4vfyX0k7P0j
	ZGHc=
X-Gm-Gg: ASbGncsij2NVfIL+PKewNuauyFEVa8D3qQEDPuJNnN3Rif0CjOCgHr551Fv5KrqXSM0
	HbSTklm6gwECNBGcr8s5nHJPfXIt2V/vNfEr94HqbTL3iCLPguUfIy4cIERuSMIbi8NkeMcBcvI
	xhCBo6m1xPzR7CZWeteEF7K5nGwy/77vyBlyppvb1jUn+J/roWLuiY1SmF6gCMGJuwSjhj8BNUB
	9pXdXNViT3CyL5JZ53lRLZaN2UqQrkK3+QYRy0PQM01lgJCzQfz7qyVo4BRtd/Zat60relX1oC9
	6pO4WyXZ5d350Rzh/Yv0J98Eq+ijqCMU8XGfuXZ/PbzigUmTNgZicsTzYE/E3gPFqUAL7jzqQnB
	WSZRvVzWpMz2tKIyvSDwLDKBz/c2yaQ==
X-Google-Smtp-Source: AGHT+IE9cJ0R957z6emBwSL/0H8MpCdG3t2KLoGRI79qanmte0nEqEwBdO6vfidR0sLq9DMcN02mVg==
X-Received: by 2002:a17:907:724a:b0:ac4:85b:f973 with SMTP id a640c23a62f3a-ac738a64f00mr849360366b.34.1743472560858;
        Mon, 31 Mar 2025 18:56:00 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71971724csm706486166b.179.2025.03.31.18.55.59
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 18:55:59 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac298c8fa50so852491466b.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 18:55:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVv4Vs/13Yn9i8456MYJ8ZIUWrPaQ8fcQeST1EREx0+UG+j8DwwAxwqk+EpGXlltWlBRBkZUkt+6wSdd8Q=@vger.kernel.org
X-Received: by 2002:a17:907:3f11:b0:ac7:31a4:d4e9 with SMTP id
 a640c23a62f3a-ac73892d538mr981403666b.4.1743472559324; Mon, 31 Mar 2025
 18:55:59 -0700 (PDT)
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
 <20250331194251.02a4c238@gandalf.local.home> <CAG48ez3w0my4Rwttbc5tEbNsme6tc0mrSN95thjXUFaJ3aQ6SA@mail.gmail.com>
 <20250331210245.585fff23@gandalf.local.home> <CAHk-=wi=GNaLzNt5zjee6m9OHNvr=Sc1S-xsnS0cNMfdVp15hg@mail.gmail.com>
 <20250331214132.49622459@gandalf.local.home>
In-Reply-To: <20250331214132.49622459@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 31 Mar 2025 18:55:43 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjijTKpotANjhqoKrEFh=B=RLrfGWa7OFB2WJ9RU8jaaA@mail.gmail.com>
X-Gm-Features: AQ5f1Jo416MyRwMxGTnNWGGwQsK3CtyiS56wd70ogS4-q5i40HxlCHES0ZWgQ4M
Message-ID: <CAHk-=wjijTKpotANjhqoKrEFh=B=RLrfGWa7OFB2WJ9RU8jaaA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] tracing: ring-buffer: Have the ring buffer code do
 the vmap of physical memory
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Jann Horn <jannh@google.com>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Vincent Donnefort <vdonnefort@google.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Kees Cook <kees@kernel.org>, 
	Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
	linux-hardening@vger.kernel.org, Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 31 Mar 2025 at 18:40, Steven Rostedt <rostedt@goodmis.org> wrote:
> >
> > I think 'pfn' was introduced as a name ong long ago because it was
> > what the alpha architecture used in the VM documentation. It probably
> > predates that too, but it's where I got it from, iirc.
> >
>
> It is old, as I remember using it when I first started Linux kernel
> development back in 1998.

So I did the alpha port in '95, but I meant that the 'page frame
number' as a name may well have roots that go much further back. I
only know it from the alpha architecture docs.

Google only seems to find the modern Linux use, but I wouldn't be
surprised if the alpha architects got it from some much older use (I
would suspect VMS).

> But my memory of it was it was also used as an
> index into a struct page array.

So typically, the pfn is what is used to translate different kinds of addresses.

And yes, one such translation is "turn virtual address into physical
address, then turn that into the pfn, and then use that to index the
array of 'struct page'.

Few places use the pfn itself as the primary thing, but one of those
few things is the low-level page table code. Because page table
entries are literally a combination of the pfn and various per-page
information (protection bits, cacheability, stuff like that).

So to the page table code, 'pfn' is kind of fundamental.

Example: the actual low-level "create a page table entry" is
"pfn_pte()" which takes a pfn and the protection bits.

That's the basis from which all the other page table entry functions
are based on, even if you often have wrapper helpers to hide the 'pfn'
part from users, and you might have seen mk_pte() which takes a
'struct page' and the protection bits. That one just turns the page
into a pfn and then used pfn_pte().

            Linus
