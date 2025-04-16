Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44D8212D8D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 16:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744821184; cv=none; b=d9c7PtwVinl6htyqbvqJmcxjTNIu/C3+JcQ8gVtnS+iyuZMn7oKOpuWMWGwzN7tG4LRF5QeUe9FE+88C3s7+M7+HrB9crtqAoZeAnMLx8tX8eB8P/esHxYeU6HBbtD5E4zB6WXyri/WYbsoEuyTEMe3lxTNokvh1CcDDUt/U2es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744821184; c=relaxed/simple;
	bh=z4sYUnk3RVn3eT8s9+D0SbpGl6UdSZQtvkzjKzBRH80=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZbW9RMw1IyAh/Bra6wDD/22dZAr1A7IAruaQNh8x6u3KWUgHfuJc49KvKoBW2CL97IeE7Ll/m9jddTgE1Td9URotJ9ki7QpKXcTyX0eP1xLVJ32eFA4oLfugNrAUdZhhLd7PMEjYclFraHnIZ07GGnNnix7keeMS53iaFQfYTnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VAQc+QN3; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VAQc+QN3"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-47666573242so1741cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 09:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744821182; x=1745425982; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z4sYUnk3RVn3eT8s9+D0SbpGl6UdSZQtvkzjKzBRH80=;
        b=VAQc+QN3v6DhncnBAB0nmgaB8YbIE/e50TgZRrT6rM1uwsYdKpXFC7a4Utz6wh12yZ
         gC6ZaEKHky2efz8ec82hAyOk1bugM6M8ao1fYI7lyiKuYW8Dd7Ibo7jK8IL+hGoNpmqx
         6vMqH2XkWXrtXAoITO3gEA4yyZKksPzWqYQX/5RaWOUpjVaoIdFSyD4u3bSGg6pbXqwc
         gtMkhgGFH6qbqovexCT2NE4W77lAEk/GGTMadH0GNUlEU1cL5nC44PftzL8ipfeMdMwa
         r90r4Ed+13yTpr8rGaQLk93Uy/pL4XxY9J9FlqC6M1Kj/gH5yKIiYRI9LGXvskLxR/5j
         26tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744821182; x=1745425982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z4sYUnk3RVn3eT8s9+D0SbpGl6UdSZQtvkzjKzBRH80=;
        b=Qz1fF2U8amoMl8uq4cJw3teRAWqxQWEjrGl+Bll7ygOT6F4QHbMWGNGXttGnkX/Nsz
         WC8+UMowzekII0fTiboZFHkdRQq1AvkL32zGlcGqo0RCxrHQgvtqH6Js6Ea5rZNgaIAQ
         KePggWnuDDGHgEp95VrlcTuRQsWzJwNXAPfo3W7fppng4S9p9HfIkPe351F3xecy6JPp
         /BVMjK2QLmh5wdl15/5ipr9+HaeO9LtMKh7/O3EtDD7YKQbbQ6nOK4c5pWoj/mxwVdtj
         tD6/ls0UF3ylUd97Fskz6IoVdWt0XI+B+P9HJyBBAjqkzY7XFFUxm+MoN8x7Ll/5sPYD
         YEGw==
X-Forwarded-Encrypted: i=1; AJvYcCXVe7vphC5ri61IB/vqthCN6hYg3v8itdH7G3i3yNf/aJic6UT49JHwJFaHprI/+mqe58ZYOQbew1O9z10=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQZlH4xoTDCE3sPkg4Kz1aeZl7qe/Kz4ZNm6LQsBSlZj479eo7
	/lUyezLYYq1MO2FQFB4GzQuxztWzPanSHCUCxQW/AI8p5sgpdO34E8agZemewcYXiBmVk5/2XUn
	sem0VEK9oOQSxfQD6u11BAdzHvEXe+3Fun+Aa/lT0qwTetvQv+De8
X-Gm-Gg: ASbGnctOJ32MrqAjsRRVVL2FcR6J9/0IOHijx6KsJiGlRajQLT5LoUa6rKe7nN4v2ZD
	4J5JGc9AEoeO+aiAdNniyfNSXr2wjpcCp4pFmp55Zeodq+5U4n/xTBdkf0neVL68ZVpS1kwSr94
	lb6rRz49noJQEYgYZYGgs=
X-Google-Smtp-Source: AGHT+IFGLnrLi/pwVwS4hx+CL/KHOR7ZtP9NwSL0/fGZLW+5ujtOUmbOivnbfb8MDwVDtXWQCQTdIlvr99JtHYGtvDg=
X-Received: by 2002:ac8:5d41:0:b0:46c:7cf2:d7b2 with SMTP id
 d75a77b69052e-47ad7b5f143mr3120371cf.18.1744821181350; Wed, 16 Apr 2025
 09:33:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402205613.3086864-1-fvdl@google.com> <a7f5a4f7-1ec6-42dc-a93d-af043a01044f@redhat.com>
In-Reply-To: <a7f5a4f7-1ec6-42dc-a93d-af043a01044f@redhat.com>
From: Frank van der Linden <fvdl@google.com>
Date: Wed, 16 Apr 2025 09:32:50 -0700
X-Gm-Features: ATxdqUGiWah_jJFCkaeSjW57PdesJqsrGy_N98VG-_dxVs0MnOaWnZcw0S6lIuA
Message-ID: <CAPTztWa4Q+E7ytKyorP1wg8Cq02_PWiKW1w+AHXZ_XzL4D5TNg@mail.gmail.com>
Subject: Re: [PATCH] mm/hugetlb: use separate nodemask for bootmem allocations
To: Luiz Capitulino <luizcap@redhat.com>
Cc: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, david@redhat.com, osalvador@suse.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 6:08=E2=80=AFPM Luiz Capitulino <luizcap@redhat.com=
> wrote:
>
> On 2025-04-02 16:56, Frank van der Linden wrote:
> > Hugetlb boot allocation has used online nodes for allocation since
> > commit de55996d7188 ("mm/hugetlb: use online nodes for bootmem
> > allocation"). This was needed to be able to do the allocations
> > earlier in boot, before N_MEMORY was set.
>
> Honest question: I imagine there's a reason why we can't move
> x86's hugetlb_cma_reserve() and hugetlb_bootmem_alloc() calls
> in setup_arch() to after x86_init.paging.pagetable_init() (which
> seems to be where we call zone_sizes_init())? This way we could
> go back to using N_MEMORY and avoid this dance.
>
> I'm not familiar with vmemmap if that's the reason...
>

Yeah, vmemmap is the reason. pre-HVO (setting up vmemmap HVO-style)
requires the hugetlb bootmem allocations to be done before
sparse_init(), so the ordering you propose wouldn't work.

I originally looked at explicitly initializing N_MEMORY earlier,
figuring that all that was needed was having memblock node information
available. But there seems to be a history there - N_MEMORY indicates
that buddy allocator memory is available on the node, and several
comments referenced the fact that zone init and rounding may end up
not setting N_MEMORY on NUMA nodes with a tiny amount of memory. There
is also code that sets N_MEMORY temporarily in
find_zone_movable_pfns_for_nodes().

Some of the commits went back a long time ago, and I can't quite judge
if the comments still apply without looking at the code more. So, I
chickened out, and did a hugetlb only change to fix the hugetlb
issues.

But it does seem like setting N_MEMORY can be cleaned up a bit, it's
definitely something to follow up on.

- Frank
