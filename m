Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D289D4315A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 19:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749151182; cv=none; b=GoqxmzbQ2OXU2bzkxA31ds3cvrUOLIPbRVG3q5X+I9Cfqn6obVEtMQ+li+Z2q17MSJfousuziMCZVdy5Gb1Q+gk5mK153abu/CSFDQ2wIt/ndK987KB8rw966jqByCkaC8Et8idtQqqSD+9FM2Zk4sd3O5bBnAxV5EMFbKRnI8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749151182; c=relaxed/simple;
	bh=RbgPHeMZvQzL3m80JGIpPWf4bxoO1tcc6Q2HUvzFDuI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SpVTeCiNW3IbGZweWGbrV3sTp7RrTswz1TJppsdd0XJFnZDmMzkSoAImQdndbZ6MbQoxWzrNkaE4AQSVF+SbIoLoaYUgJ1tn2MIvyF8M9vM1NnZDNuPg9umBjsxFBSRKZmt6leCl12LZj5Ugg4qsWcqpoofxxj3NDO+Hy0mnG0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eZh7kqjm; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eZh7kqjm"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6024087086dso2670a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 12:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749151179; x=1749755979; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RbgPHeMZvQzL3m80JGIpPWf4bxoO1tcc6Q2HUvzFDuI=;
        b=eZh7kqjmToUxTAe2TUNEQYUQfF5h5vQFI6qGAyt3JbuNxzCpGQM8HeTBN1W7JIdhVS
         ZYqONlAW5QoNJE8guhiH5T3E5CXs9GjvDnYMbOtgyrARR+uoFB3mt1sqnJpr52doh9Mh
         a7b3BP1873Y1AlBRC9Iq7BlXNSD5RywqXGRVMEqMBagJhMbLF4vLyLYkLgpBOEQa5d8L
         TPo4nKktLcNRxwso9BjuRCGg3g62F87T29DDR040ufd0zv8MpycKqAA/JjocJyTmS8Pm
         y+A/jiWW4qdDfOP1n3rmQs/SodD3jYXkMEwniNN6TygOniGUivuoIMJaAGsg5Y8kSImb
         Ho6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749151179; x=1749755979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RbgPHeMZvQzL3m80JGIpPWf4bxoO1tcc6Q2HUvzFDuI=;
        b=O6reNfNndXQtzAvR5UUS6peP9/seHUNef9xgXCJwoZOWwrmeWg5OYtdyLehLwl+R30
         5MmhuzIzZhxVV9cewnMYRf8P6I1uxicLLSqSDWubOTPNkBndY450Dhc4VrCDtodLmUdB
         1e1eoR5+TVmwlf7wy0OqTr8/pXm6zbjiIfG/bEs7nx/6Dm2eIyaKFDUWbq5frsDBHmQ4
         v3POI2XEjrsXzhG9DXjr9gBR6vU6LRArlaqU3IINMSnsUsaBa1F3TOXDw7Unvv/aymfU
         e+1ls4AnBYlUIPOBkvDmeXGiAA9TfqlufAl7mGmPUYvoFqwLNDLCfsenms5+bvsATn/o
         Ns2A==
X-Forwarded-Encrypted: i=1; AJvYcCU2SeKsDv8khzxXq5Cml3iwFx6Ix3ZbaiRkXAqDEF4Q84vCr7HMP0qKv2I/8EDuaOfUAx608gTiwxzP9/8=@vger.kernel.org
X-Gm-Message-State: AOJu0YycH1pc0WEvFYpStn5fBAn+EgkOFr+E8O2tm1ZExMAJoYPbdxFd
	1T4uKJj/xeDzeUJTF4qVuF1+4NttTQ1CCy96/0eXjh0wimlW1BomGEZKIJIpGjl90F+MQ2/FBGO
	r9Du6hKBffrRkEZarDCWEEC+OJSBuck703tERQCyo
X-Gm-Gg: ASbGnct+F+OCHEjP0t6KGivH0BUq8ODVznWM5+wmJP0s3q4HnjJhsCFJCqhG62cNrNF
	+KyESbQUmK8gFNOklI6Lmi/ZPHuEBIYHpdnMLcEGU04CALG+iITWlxS6YeTLEakkBsWbhRQFm9p
	qLyh+MCrx+ybRbOCkZi3CM/iEyCkXvWZLrMeRxcdUba+qQ/j2m9UELIrst310J6GZFsubxpAI=
X-Google-Smtp-Source: AGHT+IE6xDvvoQteJJ/eDt9iDCFywxEWUs1nTALJvRPrcfNFm/URqn6kru8JdI2hpKXp5O/+usizGPrxFzABOYx39mY=
X-Received: by 2002:a50:aa88:0:b0:607:bd2:4757 with SMTP id
 4fb4d7f45d1cf-60774f7ea9dmr10567a12.1.1749151178729; Thu, 05 Jun 2025
 12:19:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604141958.111300-1-lorenzo.stoakes@oracle.com>
In-Reply-To: <20250604141958.111300-1-lorenzo.stoakes@oracle.com>
From: Jann Horn <jannh@google.com>
Date: Thu, 5 Jun 2025 21:19:02 +0200
X-Gm-Features: AX0GCFsuwLolzPDsrZ1E3v9TrRqv1LcU4kqKEWMPeICbN8OYkLkFBNdY22dpC_A
Message-ID: <CAG48ez3hvPbfc2dapQQu9TKrjdi5mhZ4tAWi+m0tNZeEtSZBrQ@mail.gmail.com>
Subject: Re: [PATCH v2] mm/pagewalk: split walk_page_range_novma() into
 kernel/user parts
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Barry Song <baohua@kernel.org>, 
	David Hildenbrand <david@redhat.com>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 4:21=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
> The walk_page_range_novma() function is rather confusing - it supports tw=
o
> modes, one used often, the other used only for debugging.
>
> The first mode is the common case of traversal of kernel page tables, whi=
ch
> is what nearly all callers use this for.
>
> Secondly it provides an unusual debugging interface that allows for the
> traversal of page tables in a userland range of memory even for that memo=
ry
> which is not described by a VMA.
>
> It is far from certain that such page tables should even exist, but perha=
ps
> this is precisely why it is useful as a debugging mechanism.
>
> As a result, this is utilised by ptdump only. Historically, things were
> reversed - ptdump was the only user, and other parts of the kernel evolve=
d
> to use the kernel page table walking here.

Just for the record, copy-pasting my comment on v1 that was
accidentally sent off-list:
```
Sort of a tangential comment: I wonder if it would make sense to give
ptdump a different page table walker that uses roughly the same safety
contract as gup_fast() - turn off IRQs and then walk the page tables
locklessly. We'd need basically no locking and no special cases
(regarding userspace mappings at least), at the cost of having to
write the walker code such that we periodically restart the walk from
scratch and not being able to inspect referenced pages. (That might
also be nicer for debugging, since it wouldn't block on locks...)
```
