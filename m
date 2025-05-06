Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCE92B9BC
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 22:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746569146; cv=none; b=W8+HKwc5p54C0Ckxn5ItSI9WTcY0Jg2ugFg2tEeIXHzd5ORQ64WCthguryMgXnpqNbrjnBvkeXC04DmW8tVHbc8UDSErxLTWtazHvBQmUDQ026qZJY2TE9cFZR9nFUfANkMgPdrs0f/hqb55frw6RCsh/ZoRVm3p4ZCewlZ/nKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746569146; c=relaxed/simple;
	bh=KipRk4T764WfCmu0wFyxjVxI3EJCSRQ5r8frLRwrZrw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NBcy8P5cFh7dz01n5BHg/7zTZ96ztUAS+HFbdCFqj/3W73/GQ8XqQuxsAg7o8CtrXFq9D0334l04AcdLxmZ6xMWY/TO4R03Oz6PHWDIyzn6pwTTsw2ETNjZY/ZQHEeVN0EuwZ8kfBs9EzAaNj3ADq6+hw4GuPrixZxJRAxcAXIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hYnaYvuq; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hYnaYvuq"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso6669506f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 15:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746569142; x=1747173942; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KipRk4T764WfCmu0wFyxjVxI3EJCSRQ5r8frLRwrZrw=;
        b=hYnaYvuqP4S7fsyFgJmWk+JXzAAM+iq5MJK/rDyY/TNqS3FdM0w8i2qSHvmOJ+UChe
         sO51lMjVujJgU/UrlvoEWXuqb2/qux62C/PgSEuQqDsL7PhLyOyxNKa5c8OMc9Zyl9vx
         QW1oZlp4tOoxHKpPboQZ+CBXUZHIEVQK0H7TG+LwLOJxBNYO081d5t0RxyvL2eXanPi8
         nPD/MtJuCo3jHMJtLTkGb9WdjnZXnKZz/rRMkJrGwXXd8dXxiK9+GKAt+j7OnnD/SH94
         h2MkQLdqt5CGuZpT+D9SbflvRl+MmfB3WQGq1sOYvKR5O4s2phfx9DqAQEyW9JQfOiM8
         XcXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746569142; x=1747173942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KipRk4T764WfCmu0wFyxjVxI3EJCSRQ5r8frLRwrZrw=;
        b=CO/FUzwcB3Ka1Mv4AYdt7UxPEyQOlCCj8V37mSTUW3PZ/or82mP0rPFHpslxwyWGPj
         9IRA8bDnlhgdoAJHxfBr1gTRnpf4jaLU3AKHnabBtW3NeIitpkzUfX87Bgz0IwPZ07x4
         luMDHzY1+364s2CVTbhsYJSvrFto5fA6jfq9mKftcUhGFpkrZPs+QyuMsezaD9M32sMu
         qhj+Acsvu+z+0AYDs7JdAej1EjtDSPhisE3JLNzPvtBozajmCKp6ek7JOvkK9LNi+zi7
         tPZJ7dJJW1gl8f9WzKOt8ERYVBzZO30oNU96tqJEj45yPxAnz17ST4k0wHjV8HQWe4wb
         WnHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWe46GZY0JLkwdUbITOMlc1yk5IBlm7Pnhnx8/HYr7X5h2KMPgHQodn3KiMWclTtsz0bnGZuGFfTUowcLM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmH8IIh+AA99FeUPU3bVIe7AUHk9OPArJ/FyRBYOdOzZ57Gbg6
	aO7TieXolmbaKXeJj8uAzv5PVjK5goWNobFxGhO2GjOnTDLOCakydbWq1a9bGssoZxn1fKAZ9l+
	RDG6b4vcorKDKFHe18OhasWB2kDw=
X-Gm-Gg: ASbGncuGYSOIS9kYPDMvkNRFHK80HqfWM/r0KTiBdHU4pDFntOzhr1bKsclSOATyEGf
	Qj+BqsnkbtJyjdSpmX0OKzvDhpnqEXefiiQbrGbixFNh1jz+H/ukd3lB7S4VopFcSgFKvmTgwJe
	rNBIHjqAiPKsJCZ4uHCRIrwZCV+ECIcCaqiOXlFbkISrXxQ1jOeA==
X-Google-Smtp-Source: AGHT+IE25DZ//XnJlkjj3EH8ZFFd41BFs36NSpSFuQBE3faebw8bT1aWwOWkbgGGp64gVRd3F+KAiVR2q0MyqbOFdc8=
X-Received: by 2002:a05:6000:40cd:b0:3a0:8712:4f51 with SMTP id
 ffacd0b85a97d-3a0b4a14668mr771413f8f.40.1746569142426; Tue, 06 May 2025
 15:05:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506112509.905147-1-kirill.shutemov@linux.intel.com>
 <20250506112509.905147-2-kirill.shutemov@linux.intel.com> <CAADnVQJMNqeEGwcLDFw36KCY+wr_jQNtK2t4G5pLo=+wcDE0RQ@mail.gmail.com>
 <5loiv7lfplpruujplz7wmzj25g34rs2aezvrfsl55dsddrh7mo@rnqrlx5zccol>
In-Reply-To: <5loiv7lfplpruujplz7wmzj25g34rs2aezvrfsl55dsddrh7mo@rnqrlx5zccol>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 6 May 2025 15:05:31 -0700
X-Gm-Features: ATxdqUEFmKJx_9lHRGWUehox8hv3ijG1FV0mSYp85G8ha8fWtihliKeq8C6j3Ns
Message-ID: <CAADnVQ+jf+Z+7prRaK3LopmZLtKh6JGzvi2+WZcvLo1DGcLShQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm/page_alloc: Ensure try_alloc_pages() plays well
 with unaccepted memory
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <jackmanb@google.com>, Johannes Weiner <hannes@cmpxchg.org>, Borislav Petkov <bp@alien8.de>, 
	Thomas Gleixner <tglx@linutronix.de>, David Hildenbrand <david@redhat.com>, 
	Alexei Starovoitov <ast@kernel.org>, linux-mm <linux-mm@kvack.org>, linux-coco@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 12:00=E2=80=AFPM Kirill A. Shutemov
<kirill.shutemov@linux.intel.com> wrote:
>
> On Tue, May 06, 2025 at 10:18:21AM -0700, Alexei Starovoitov wrote:
> > On Tue, May 6, 2025 at 4:25=E2=80=AFAM Kirill A. Shutemov
> > <kirill.shutemov@linux.intel.com> wrote:
> > >
> > > try_alloc_pages() will not attempt to allocate memory if the system h=
as
> > > *any* unaccepted memory. Memory is accepted as needed and can remain =
in
> > > the system indefinitely, causing the interface to always fail.
> > >
> > > Rather than immediately giving up, attempt to use already accepted
> > > memory on free lists.
> > >
> > > Pass 'alloc_flags' to cond_accept_memory() and do not accept new memo=
ry
> > > for ALLOC_TRYLOCK requests.
> > >
> > > Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> > > Fixes: 97769a53f117 ("mm, bpf: Introduce try_alloc_pages() for opport=
unistic page allocation")
> >
> > Thanks for working on this, but the fixes tag is overkill.
> > This limitation is not causing any issues in our setups.
>
> Have you had chance to test it on any platform with unaccepted memory?
> So far it is only Intel TDX and AMD SEV guests.

We don't use them, and my understanding is that such
unaccepted memory will be there only during boot time.
