Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E154B60B8A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 00:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743468570; cv=none; b=Yslejt602FJZjq/7jybMh+cZnWrBIIvQG3CvF6rh2ULU2EU6lzV9tsJ3m/2+Xr3r/ZZjWrt6RSvuOnz13IF5I1r7FO0mj3Eyd5VkTC5Jdrfm59XB60ItxbyX7cWmZrF300X+ia56L5dizz/by7KEPXI5okK2GWVXTXqHcNylhNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743468570; c=relaxed/simple;
	bh=OUTcZq07JBkgTrYml5GuZJ2vQhCaARTC9w+Z21EM7tE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aYGNnIq/yi0AOuxqtHtrX8PDlhl/+s6QLuZlD5tU2lLzUefYR87pos0Ca8btJN7vZf6trNZk9TL29KkOMfYFTYOakgAbAHQorVrWhx3BnPpv0X62tWZQDSRaJph5sZiHD3EHqbSOYsD7SS/BG78T+uaGARHoblD/PTTLhs2sU84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=JMSjvEim; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="JMSjvEim"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac2dfdf3c38so897314366b.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 17:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743468567; x=1744073367; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vqJ2N3VREVt47VEa4RxuNWaTBMsssQWWo8kvJYNbQLk=;
        b=JMSjvEimfeVvK6Ju+6vG0doYXtbZr+obQ/lKWTg+5B4JU39n2c81VhVM8Pexl5P+6F
         t0wdZML6+jQVPbG2wfYR8r1F+iCdC4qmS46bVG11QXvD9R7QI5BKg0g21hrv5R+vaja8
         jZoFjP/M+DUoZq4oAcjiJTAvLDGt7ILO6KdIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743468567; x=1744073367;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vqJ2N3VREVt47VEa4RxuNWaTBMsssQWWo8kvJYNbQLk=;
        b=pIAjWWCEFop6EB0z4Y4IYz1XPkuc9QQEe2We+lMihjtTnfu4mYA2LclOXbEMGnwM0X
         B6fIlyZnmcZkNQzkmsbmb0Z+QTdAZzk84pFh0du2MsZurQcuKR0Gu60u3eZe/7r9XclQ
         nblY4+A/UwQg6CFLjvNHjM28AzxqaYlpEdqL+dBQFjBIxJS4/6WOGxzRi2+szO99WukT
         bOlnPhs/VOp0yANMCrDHdPQsQ1ceMwQfCS4Y3GPXTZpShwEHVfFGym2oeQEaQ/SZKkDC
         5zNgl6iIJc4LwKjDxCQkui/NgYenSIjV6K8BkV15m9q4Zh6LwIUPm12fn9dNW4ZbwnrE
         xdDA==
X-Gm-Message-State: AOJu0YyWpXKk7oohcCyncmViyW7xHvcGKES1tMqvCV14XSow4mlCPjR9
	mlXS5gF8QieaOtUjzsKWeZxRvFLLDY2NKceZqRlAmGFAgGHqNwDE+O7gAxWuhJFurahld3BPZ4D
	4cnw=
X-Gm-Gg: ASbGncthBNG05fr9VG9c0dcvgMrwIKNcKQ9QEK3mZ+oDU9ln31kfDNkyqWNbSxWoAe5
	3Kw2mhO8KYGJzF7NZJ1gJ1RFxrgItqIhkP/tCVyvDOsJRV5t4RVgwQ9kg/kBE8Oi4h6MaZz0o3t
	EJm5QgEq1OTx/79FJrfwISD0hTt/+OifXnt3tiqhR7fCzMMISUD2nLE3aE5lfWI/I9+mH5nUc2v
	TGeuTI48DIeeoZueiHmx/iW4vU6WvW+ppo22gRkNxbDuh6NsP44Vu/Rx1zGQ1dhMNZ+ofGKYbUt
	lQuXDmVGX/zoLOzCoD1WjpDoHw0ENQ8hdpuJ8RboZa6sV836vR+Yj7Bv74ukHIJyHcAQxv83Akq
	+4Y5fpCllK4bhz6HKiS0=
X-Google-Smtp-Source: AGHT+IGh98l1nYdcCjN3ve4ZF1S9DdNh1aIRVc01jF72wp1IWDtdKga1zXRaYEc9//aoguboIyER0A==
X-Received: by 2002:a17:907:6092:b0:ac1:fb27:d3a2 with SMTP id a640c23a62f3a-ac738a0f3camr1035767766b.5.1743468566836;
        Mon, 31 Mar 2025 17:49:26 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71961f9c4sm698139266b.99.2025.03.31.17.49.24
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 17:49:25 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac289147833so852075366b.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 17:49:24 -0700 (PDT)
X-Received: by 2002:a17:907:97c9:b0:ac3:3fe7:b254 with SMTP id
 a640c23a62f3a-ac738a152d0mr1032969566b.4.1743468563964; Mon, 31 Mar 2025
 17:49:23 -0700 (PDT)
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
 <20250331194251.02a4c238@gandalf.local.home> <CAHk-=wiDQpOeXi_GjKB7Mrh93Zbd__4k+FF_vJd+-prbaacEug@mail.gmail.com>
 <20250331203014.5108200c@gandalf.local.home> <CAHk-=wg0wQb+CbUk2GY0CeVuTQvq67-oYR0nL8wGgySia3ce7g@mail.gmail.com>
In-Reply-To: <CAHk-=wg0wQb+CbUk2GY0CeVuTQvq67-oYR0nL8wGgySia3ce7g@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 31 Mar 2025 17:49:07 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh4b8hNT5XRDj9M4damUmij2bJGaRamqQ_icEkVUv8svg@mail.gmail.com>
X-Gm-Features: AQ5f1JoBkC_QKfs81TmJ3LMb4XougE5RrROka215j19iecgzoAx9QaQPEIrhB0Y
Message-ID: <CAHk-=wh4b8hNT5XRDj9M4damUmij2bJGaRamqQ_icEkVUv8svg@mail.gmail.com>
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

 On Mon, 31 Mar 2025 at 17:38, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> So *this* is the kind of "bad in a different way" I could imagine:
> things that probably should be cleaned up and be available to generic
> code, but very few people have cared, and so they are used in ad-hoc
> places and haven't been sufficiently generalized and cleaned up.

Of course, the good news is that (a) few people care - which is why we
are in this situation - and (b) the people who *do* care about these
issues tend to be both responsible and responsive.

So not some unfixable morass, more of a "one or two architectures may
care, and we might have to extend interfaces that haven't been used
this way before".

For example, just adding flush_dcache_range() into
include/asm-generic/cacheflush.h should be more-or-less trivial, with
the same kinds of "architectures can make clear they have their own
optimized version".

              Linus
