Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0485ABA33
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 00:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743467286; cv=none; b=i9QkP9gcqzHFcrl1BIZrWKRnMPSOSuPyQWP/jzPjoZcj2n9xJ91amApnUIRGOqhh0P+W8N3/Q+VcljEhjdwjUiwdnnjLx8+QokG5EE8B4Eg2PSDfyKBjgWcih1WTcGXIyivXw164rtuz4mApk+6PWFxNAARwUWFxYYJK6JdlmP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743467286; c=relaxed/simple;
	bh=26+GYqb2X3NwLsu1qFcx4SuY1JzDD5ReS/TzARaJw1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XVOl7rurzuKz54mHx585OQB40sKI2gb72cB6PoOTn/O5LKhMl5dx5GTszOYEDn3TDohG47f8o+m5nHJo1qU1jB591Gf9eaLLCgA6Q/wTo0+N5GgPYg2bYDvoEz0gO3escKIaWqHAlTi7f/n7lmelCdlz/gPlBMWPr+3dBX7KFh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=b6d0bxvw; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="b6d0bxvw"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac29af3382dso786199166b.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 17:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743467282; x=1744072082; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qGbH0NonJSxr19KvUYelWs1NH940om4VboO0W8M328o=;
        b=b6d0bxvwjqgc/HSvnzH6kgg7RmZT/60rKgO4TMPyWk4oibXIuf+nLidRlYw0BnjDEx
         XcUQdHiPrs4VFXHCnMsUHmaXsneg8anEDdfTeIzs/qQaxdfPbx8XyzXGqRpvT+iVR5I/
         KKlMEgB1E5rcVB2i1U5G8N8ZGFKXmkUtNKRec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743467282; x=1744072082;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qGbH0NonJSxr19KvUYelWs1NH940om4VboO0W8M328o=;
        b=ZSDLMEuKa7jedqPBcgox4/kWeLNLnnMlPkP89RADFBovLhMNq8C4a7OWmudjbSf0XR
         miPSu1dB5nPqTygBzOt5+SqDcMi8lNheY+cQyHgBtGAaEyD13YCU7j5wdLg65EK/SEFn
         GyquyjBeyAgmqTewE2DvcOA32W3w5kpQ28OLi1TZJ3ygOtaT9wCfvgbwG7QTYxsJEeMO
         WqZCiR0td5JhZJRdLi85ogjD/EwcCnlq9J4PbEZHdgB2tX7gMNz5otTDoROB7QMKOIGu
         bJf/qwS0eTHvuuDI4fbkq6Vk3JfU1TMhUOM69tbekPwSFgNqz33kVRrIrU+0PC0bXc3d
         G3Kg==
X-Gm-Message-State: AOJu0YymDeN5n2j9gDnGxwGKqn9Io9IU2WAOQfDKKz4OCaGCDCzmLTob
	XBrtwT+eyPxAs3WiT/pXEtusXXXqL6oJaoSmFFaY2EbaYQ9BgyaqB06ru2pu2d10pSYRRozKO46
	MhC4=
X-Gm-Gg: ASbGncsMVcUO6BrvA6lLm3RgvKdSJ5kT7Tq3VDTg8iCeqO+DIVCtxEB9DHE2KPyKvK1
	hlLlCNWWmvWvcQ4ns5gIlYM3ZMNJl9OYWN2ZUhjCbYwZLjNqr3VqHKnrDWYyLakOlvotRAnZz/D
	bJqD5U7J3+9qxiqogJ9rc+yha1aeBqb4sb1xOwryJjG2tCVRJmYbE6/HBCSOPjPFq6B5a+MseNy
	s1iCb5sTt7jD/vUEU0VvOk55fIiCrn43r4lOa/iqdHiq+kZvU2SNYkH4kCGiRvveF+VMZ4PWxcO
	UrbJi89RD6GKAIqVS7n3f7CfvdDXC09xn9/JrxOfUY//DkfznsETJvDENAEErQvn5NgGb7z7nmj
	y2qWUHV+1kqtTGEfQh9c=
X-Google-Smtp-Source: AGHT+IF0Noe9YPipinjnKpwP7i/ttU3EwWWlsUl+Bb9WumyMSX/eRm2s78/usbtesB8emvFZkBXyiA==
X-Received: by 2002:a17:907:d05:b0:ac2:774c:36ee with SMTP id a640c23a62f3a-ac738c27ebbmr1078784166b.56.1743467282166;
        Mon, 31 Mar 2025 17:28:02 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7196c8281sm699421566b.149.2025.03.31.17.28.00
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 17:28:01 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac29fd22163so840720466b.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 17:28:00 -0700 (PDT)
X-Received: by 2002:a17:907:7eaa:b0:ac3:45c6:a1ec with SMTP id
 a640c23a62f3a-ac738a841a3mr1257375966b.25.1743467280043; Mon, 31 Mar 2025
 17:28:00 -0700 (PDT)
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
In-Reply-To: <CAHk-=wiDQpOeXi_GjKB7Mrh93Zbd__4k+FF_vJd+-prbaacEug@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 31 Mar 2025 17:27:43 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjQ=ZY5K+tSF1xui3aoL2Vkzsvp8W1mQ9iVeTQ9Cnbc7Q@mail.gmail.com>
X-Gm-Features: AQ5f1Joik-SCEnqhzDRblUTUj3BDSsq66RHEyMLggTfPfjoeXEo8UparowVcV48
Message-ID: <CAHk-=wjQ=ZY5K+tSF1xui3aoL2Vkzsvp8W1mQ9iVeTQ9Cnbc7Q@mail.gmail.com>
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

On Mon, 31 Mar 2025 at 17:11, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I thought you did that already for the user mappings - don't use you
> remap_pfn_range()?
>
> That's basically the equivalent of vmap_page_range() - you're mapping
> a whole range based on physical addresses, not mapping individual
> pages.

Btw, if you are wondering why this isn't consistent: for user space
mapping 'remap_pfn_range()' takes a starting physical 'pfn' and a
size, while for kernel space 'vmap_page_range()' takes a 'phys_addr_t'
and a size, then I have no answers for you.

Except just "random historical accidents".

There are a lot more "map into user space" cases, and it's the much
more common case, and it's the one that a lot of drivers have used for
a long time.

The 'vmap' code in contrast really started out as just "vmalloc()"
which allocated the pages while mapping and "ioremap()" which mapped
in IO areas into kernel virtual memory.

And then the interface has very occasionally gotten updated over the
years and we *have* had some unification, but it's been driven not by
"let's make this a kernel version of user mappings", but by "random
odd use cases".

You can see this just in the statistics: remap_pfn_range() has hundreds of uses.

In contrast, vmap_page_range() has something like five uses - when you
grep for it, half of the hits for it are in the mm/vmalloc.c
implementation and the header file declaration).

So I do think vmap_page_range() is the right thing to do here, but it
is *so* rare that maybe it has issues. There simply generally isn't
any reason to map contiguous pages into kernel space.

The *typical* use for kernel virtual mappings is either

 (a) turn physically discontiguous allocations into a contiguous
virtual mapping (ie "vmalloc" like things, sometimes with
pre-allocated arrays of pages)

or

 (b) map device pages into kernel space (ie "ioremap()" kinds of things)

so vmap_page_range() is kind of an odd and unusual duck, which is why
people may not be all that aware of it.

And being an odd and unusual duck might mean it has bugs, but the good
news is that "vmap_page_range()" is actually the underlying
implementation of "ioremap()", so it *does* actually get tested that
way.

           Linus
