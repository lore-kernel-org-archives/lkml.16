Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41AF27F16D
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 17:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748367540; cv=none; b=tXkJRo4rIN3ogbcl999QrYwKRZJVKiAgjmslK6FltSal+dRQRse7p5hjZBYMbKWj77S61L5y2F9e5DnxQ/Ujddf+LQIzhI4wfDLMrLspdnCRjmBn/NKOgkU/Q6qJzuezhlyCUv2cVj3oB/DpNRh4yuBpgBcaBovN7iOVXVBbtIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748367540; c=relaxed/simple;
	bh=OJPMh5xqFYFnMRl0GDB91WM2PrQAsBt7zzx7fsTrIDk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VPj3gvuD1HLNFl7eN/QgtTuA2dwcRXZfxEQG3yy+d1HL8Q6XcdKV298Amp5G4KkKDMswO1KPq/ADhM1LUzR8wGI+TrIM6POH/SyPj/axpFNdNX4EobQeg4zutL/oez584WyVYSlPq+5yPsD1pVNL9nnLpX9I2ohPVt/+jdqMOn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qGr8IryR; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qGr8IryR"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2349068ebc7so23265ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 10:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748367537; x=1748972337; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/WR/TckUs20kb1rv4R5K8OG+YR6e/KXq2+5xOaVKOB4=;
        b=qGr8IryRKK5ShbqYVWakSqY+gvHv4kZUx6Lhr3beFsPEyod7P/w9AFw4XKFpTPAP1d
         /xEic2Xw7pt4J81Ilv7wTvQllmTI7qxHlNKXEXoTC+zIYsiuF95pOqZQhhYus9o8FkVj
         GcYnJGMiAutJw4f0CnPDnm6a+yS8nSbYlXMUvLt3tUWsQQyA/2VGYlGe1PcwYtkwdibi
         7r3UAO25uJ/82TKHf3zFKyeCJhDAiUswlr2tPdxMRNuuc4P8gdCRPWAg7Tqi7NpiLZEB
         BOGHKZopVE4HXTxgONWI3otwaLSIRqo0mY1Z5xwLq0Yapc4sA9ZAex/5tHmxVOrZl55T
         NOJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748367537; x=1748972337;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/WR/TckUs20kb1rv4R5K8OG+YR6e/KXq2+5xOaVKOB4=;
        b=cZxLEfc9y6/bGvYMR2688so6kD1RGVBwAgiKjzz5a5dv+McfI6ZP73F3ugjIYPXrtd
         HFvvjTJMMH/dYVAlCLqB+DPegugJ02h1o40CUVRa77SSruXZDmLAj9o8OV1ZjQ5Q3R31
         9RVMjbuhrKjILT9A0Cnlnt+0ixNYOlVbAKV2HXxNNLuM42e6a1ErpUkWE2o1Rrtb8gca
         Pl9vTdgZ/dNueHQi5LNfDAlWaNu4ldBTRirxOkD/W+K4ju42CQ6dTXUBqFeWuRVtzGfg
         Hn+0zE08zkRd2jZSxFZ9o4d7/D9LU2Cxi795lwFI7XMsDUud08iVJsrHTVKWrATjMUl9
         Pq0A==
X-Forwarded-Encrypted: i=1; AJvYcCUatxHWm37dG1avcKyM6Zg1hydq9QiOcCB1JMWOBXLBtrnSU6milCdsseloh2ZFd6rGPdnlNVsb0XxYjeU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8RjCijroCkJ7Y6b43aMUKuNQaYKc8jmgd3PPG/VBt6J9YyCUo
	aEJdt32oUXNFPksa5bLGlh+j9FVSOIZzuAgSGUFiaiqpqXsmPlj76uLUTqhuuVpoWoVicfF6BhD
	MsK8NC+rr38zIenlHcAXD8uqRPqdHYnCc9ukkxxVf
X-Gm-Gg: ASbGncv/eLhk9PvHl0voIjS0OhOQiHSYQZWjBAlNhClUKB3ROM2ngUn8JUZ0YZJQePR
	S5A326pddSiBYa+8b9MKc3+yVMTYX19z3KIjZb/uIdcoIGLCDtHni+6HhJRCD4X5mWUHSvRBElk
	E9QqrXGUTTZjgF5R/WjF/IcxwBjxHGL4mY3A/hEnzh9XHk8qtAKaEHiS+yLqk359wunwU7/sZG
X-Google-Smtp-Source: AGHT+IGlIr7J8YJSwpRcVxrHFh5rOhycHbkimev6L+7ipabq6YlVDkyK6jP8QhgZxpxx7fuXS/9mzfcWIKEJwxvntUE=
X-Received: by 2002:a17:903:2347:b0:234:9fd6:9796 with SMTP id
 d9443c01a7336-2349fd697d0mr2491535ad.19.1748367536832; Tue, 27 May 2025
 10:38:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250523032609.16334-1-byungchul@sk.com> <20250523032609.16334-19-byungchul@sk.com>
 <CAHS8izM-ee5C8W2D2x9ChQz667PQEaYFOtgKZcFCMT4HRHL0fQ@mail.gmail.com>
 <20250526013744.GD74632@system.software.com> <cae26eaa-66cf-4d1f-ae13-047fb421824a@gmail.com>
 <20250527010226.GA19906@system.software.com> <651351db-e3ec-4944-8db5-e63290a578e8@gmail.com>
In-Reply-To: <651351db-e3ec-4944-8db5-e63290a578e8@gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 27 May 2025 10:38:43 -0700
X-Gm-Features: AX0GCFvRt9aQZeYORlkyaIrNxbnGXdJdrXvs5uYh9N33ch8nvjT6wHfGGjABJxk
Message-ID: <CAHS8izNYmWTgb+QDA72RYAQaFC15Tfc59tK3Q2d670gHyyKJNQ@mail.gmail.com>
Subject: Re: [PATCH 18/18] mm, netmem: remove the page pool members in struct page
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: Byungchul Park <byungchul@sk.com>, willy@infradead.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, kernel_team@skhynix.com, 
	kuba@kernel.org, ilias.apalodimas@linaro.org, harry.yoo@oracle.com, 
	hawk@kernel.org, akpm@linux-foundation.org, davem@davemloft.net, 
	john.fastabend@gmail.com, andrew+netdev@lunn.ch, toke@redhat.com, 
	tariqt@nvidia.com, edumazet@google.com, pabeni@redhat.com, saeedm@nvidia.com, 
	leon@kernel.org, ast@kernel.org, daniel@iogearbox.net, david@redhat.com, 
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, horms@kernel.org, 
	linux-rdma@vger.kernel.org, bpf@vger.kernel.org, vishal.moola@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2025 at 10:29=E2=80=AFPM Pavel Begunkov <asml.silence@gmail=
.com> wrote:
>
> On 5/27/25 02:02, Byungchul Park wrote:
> ...>> Patch 1:
> >>
> >> struct page {
> >>      unsigned long flags;
> >>      union {
> >>              struct_group_tagged(netmem_desc, netmem_desc) {
> >>                      // same layout as before
> >>                      ...
> >>                      struct page_pool *pp;
> >>                      ...
> >>              };
> >
> > This part will be gone shortly.  The matters come from absence of this
> > part.
>
> Right, the problem is not having an explicit netmem_desc in struct
> page and not using struct netmem_desc in all relevant helpers.
>
> >> struct net_iov {
> >>      unsigned long flags_padding;
> >>      union {
> >>              struct {
> >>                      // same layout as in page + build asserts;
> >>                      ...
> >>                      struct page_pool *pp;
> >>                      ...
> >>              };
> >>              struct netmem_desc desc;
> >>      };
> >> };
> >>
> >> struct netmem_desc *page_to_netmem_desc(struct page *page)
> >> {
> >>      return &page->netmem_desc;
> >
> > page will not have any netmem things in it after this, that matters.
>
> Ok, the question is where are you going to stash the fields?
> We still need space to store them. Are you going to do the
> indirection mm folks want?
>

I think I see some confusion here. I'm not sure indirection is what mm
folks want. The memdesc effort has already been implemented for zpdesc
and ptdesc[1], and the approach they did is very different from this
series. zpdesc and ptdesc have created a struct that mirrors the
entirety of struct page, not a subfield of struct page with
indirection:

https://elixir.bootlin.com/linux/v6.14.3/source/mm/zpdesc.h#L29

I'm now a bit confused, because the code changes in this series do not
match the general approach that zpdesc and ptdesc have done.
Byungchul, is the deviation in approach from zpdesc and ptdecs
intentional? And if so why? Should we follow the zpdesc and ptdesc
lead and implement a new struct that mirrors the entirety of struct
page?

[1] https://kernelnewbies.org/MatthewWilcox/Memdescs/Path

--
Thanks,
Mina
