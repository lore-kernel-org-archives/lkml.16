Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97404F4ED
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 01:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743471056; cv=none; b=EXdZHSiLjwbY1M6Zn+52vpC0qZknk5vZLDchachdw6BpORXO95ENXXk++3Ab5lGFuAkX1bIL6AJxZdI9GKyI0HvgxQ03H96SBrF8lztIjLBAuWaqiYD/uM5q1VfcfDODNVlmhVeM6wVicJee/DSfH5lTo+5xYOt4QACkGIUVj8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743471056; c=relaxed/simple;
	bh=ZrZnWSEQfOVCXfCXId9BoQTQz62E8du+T3QQHmnRCcw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YovJRAKg4aFTE0dgoFNGieH8i8Yn42MJ8+KBHHMUEUkzMD8nVNvxPwEwMg6E2yRZBUssRYaI4bNtwvdiCu64me5l5v1dqfat6BHT5U6+ZDoY9mYygyr6pgAbP2S6/XJKenraWZ43GMZPwpeM8xj+eUyBOnls8DGrY0oJuRBadxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ENRriU99; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ENRriU99"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac3fcf5ab0dso809799566b.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 18:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743471053; x=1744075853; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hobhqw8HB8gJ+OpvQWZBbfhBUu6vl3N3/WGeelA1Yck=;
        b=ENRriU99VtSrBlAypHPMkdwsoepkd8sja/HhtntVr/O3B2bdXa+Se48/nkZnzPaHTO
         lKrBt3LIw1tV3DbUK1YX4CQpHr5O5u865/k2TMrEUCR2eWaCcKAQt6RWg0h00DBVzwot
         29zYZmQ5vLbDKEkthdwItgVLjUxE8MYrqP+5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743471053; x=1744075853;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hobhqw8HB8gJ+OpvQWZBbfhBUu6vl3N3/WGeelA1Yck=;
        b=E7vsxKYNFDNzSoaLZwo9mYsfGJEV08oTg9tIq68zRYV0oFW4iqwwCwOPhTUYl75JGt
         NvOLVs42Cv2hHlmOmiroclj2EupEp33SMhyqGEMhrad2K2E2P9sbC6LPmo4ak5+ZqIQ/
         XhkLWfXCeGQZ+5XHXB9YviZYq8BLSThyWBe76mephlfAx1ivtu38l0dOFiKPWWVHmDfj
         Fwg4LKNinxZVZSU8zvRBOAdApsWmGOj3gdGHJwtMZksjPmM0dnc7mzyY6G5gSEaSktzb
         dGyuUkUHcLjtzGmiSCOzKIZua2N4aYdM63e9JnSbqYtHwi9DNTbnzxA1AfLRcaaCy9n/
         OKzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpQ1cCVkS4/aZIn9cJwNhgYh7bkluruLp5Q/iOYOPJJogEgQ+DNpRG+EsS9M1MRZqAG/i0Sym8bIXSVGw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUB0qiSGX/tCP7AhOzMfK2A1T1qKgYHSqfLGNc2rpSI/2Mqrnj
	J3M67ythXp6lWLt0DxtCtSUP6rnROyYBmuis91jr9IBWdBItzcYziH3ZyDgrgHQo8BOMAaya61p
	GlFo=
X-Gm-Gg: ASbGnctH+qYmH/2UIizeHSLtq0+xTDk3krVY2jDh4eGunDoIQn61amZwbzUbssOb+OX
	UjCL0OIXlGPtB23g40WZq0l5biYyN6VhKI1AYpaT6s9aVhBqCTWtM/d+PwojcF5Of0aWOv+F8pj
	qaK7h9R1myHlwipAXTf4pig4R7fNtqKUL7TwmJCx//iMCWGvKCRp/n1nMO6w4qsRv4xLqpKEvs6
	qdiVYBAShnE3kwwWRRN+G5xugJRBgDGy33nEAEGJl+aRpOcM5Lpw0q98M3IxihFVF8HvoGtd0o/
	OWeT5ziWG8rn82Jqk2qe82R25XYEbLY9ScFIAEf161GJWI3pb1MmsGnKwbM90e432CGUDkVcVJ/
	MKhFTQk116W9mY2ibhTs=
X-Google-Smtp-Source: AGHT+IFYFypSD7cRJawyqRwA59ClvyodNkhYr8U4XbE5ovUJsvY+t9foJ5WayS5GB4oveaP6wXiCHg==
X-Received: by 2002:a17:907:9693:b0:ac3:24bb:f1ca with SMTP id a640c23a62f3a-ac738975cfbmr1165044066b.7.1743471052719;
        Mon, 31 Mar 2025 18:30:52 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71927b027sm688805466b.47.2025.03.31.18.30.50
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 18:30:51 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac2af2f15d1so658861666b.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 18:30:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXiZoqGMicH0dY2QrzrXXG1QP+WFrN+eDwehZ/FFsd1yGfktyG/uHOJ3VLYitNh5FZf/yugrQ1IYNCGS30=@vger.kernel.org
X-Received: by 2002:a17:906:94e:b0:ac7:7e2c:68e9 with SMTP id
 a640c23a62f3a-ac77e2c72ecmr169045266b.25.1743471050531; Mon, 31 Mar 2025
 18:30:50 -0700 (PDT)
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
 <20250331210245.585fff23@gandalf.local.home>
In-Reply-To: <20250331210245.585fff23@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 31 Mar 2025 18:30:33 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi=GNaLzNt5zjee6m9OHNvr=Sc1S-xsnS0cNMfdVp15hg@mail.gmail.com>
X-Gm-Features: AQ5f1JqTHDgiJbxdZ1rnfePfFiTU7-9XsI1CRh3n0IspxIqnhuyKNGYHhQ9hJTY
Message-ID: <CAHk-=wi=GNaLzNt5zjee6m9OHNvr=Sc1S-xsnS0cNMfdVp15hg@mail.gmail.com>
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

On Mon, 31 Mar 2025 at 18:01, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> Note, I believe that Linus brought up the issue that because this physical
> memory is not currently part of the memory allocator (it's not aware of it
> yet), that the getting struct page or a "pfn" for it may not be reliable.

'pfn' is always reliable.

The pfn ('page frame number') is literally just the physical address
expressed in 'page units', ie just shifted down by the page shift.

So pfn and phys_addr_t are interchangeable when it comes to mapping
pages. The pfn is in fact often the preferred form, because on 32-bit
architectures a pfn is 32-bit, but a phys_addr_t is often 64-bit and
generates extra code.

I think 'pfn' was introduced as a name ong long ago because it was
what the alpha architecture used in the VM documentation. It probably
predates that too, but it's where I got it from, iirc.

              Linus
