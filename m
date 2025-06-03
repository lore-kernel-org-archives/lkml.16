Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8B4239090;
	Tue,  3 Jun 2025 14:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748959706; cv=none; b=pWYG6b0LfwCoFS/2dTkEOaQJ1a0y5o+z2U9OBEqDlPKrP6/FgqwsEIVPIYE8ReLjbQ6PB/y8LR784sMIGPfhhy+0yVWoXmQKCVdmjfJEL9Tn/un+zPhXfMBU+BlImkUFjnl7CZkC7rL4cGdVyGerJEJDr9oLgU30hsEjcJnUw5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748959706; c=relaxed/simple;
	bh=IGHl6mgtMPm/WARHB875ORoxrLBWMkfhUmfHv0MTJb8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=n7KyDlfNGXTmCQnKtzvyUNJs49q4KsNBjrHuJsDQy3eFLsfA1VmCqBestUJuJOKx55rIpjMZxFOueaXxhjwDJVD4uoQLsL/Drj+luqfbcBQ+4SJtcXFql3QYuuZ1m2P4zu7qzp8WQf5Q1bYfpaJbQXiPKAGgVHvwDubUZIniDr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=AuUCoHVF; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="AuUCoHVF"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 00F8241ED0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1748959703; bh=kPV8PzmODhGoCbC5F8Uzo9NG4JabbIz25OZ6D+Zy0Y0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=AuUCoHVFyP/+6UWarP9xJqL7C2WXKUBUpyIAN0K4+AG0tawllQExHgh2sRNEpcEuR
	 6s4Ttz3NjxVz42xza4rj5t/zXrJIUqVOyRGhRBzKZE7OPMyQMaMqwAp7aQNZ67azwX
	 9SqQj/7Z80bRxCRiX8xwXhtQYKBA0zaDvOkn7F/bA73Hre/11vG5oGssvzxui9xXlQ
	 5zQB2rgfcezVs+0CLAHJ4jUVooRvD/FrIPpjkcGwwUDpkUPwkQG0d8p5WiH05MwhP+
	 M565Ol68KibHzRpc1nXPqpjWFvsr+b9tBjWPHOexXBdAYTpTboiEMNzBtNwUHcFA8b
	 9ir1HmuW1S2IA==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 00F8241ED0;
	Tue,  3 Jun 2025 14:08:22 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Suren Baghdasaryan
 <surenb@google.com>, "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Shakeel Butt <shakeel.butt@linux.dev>,
 Jann Horn <jannh@google.com>, Qi Zheng <zhengqi.arch@bytedance.com>,
 linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/mm: expand vma doc to highlight pte freeing,
 non-vma traversal
In-Reply-To: <9fc9ac50-abce-48bd-979f-2e00b26917b5@lucifer.local>
References: <20250602210710.106159-1-lorenzo.stoakes@oracle.com>
 <87bjr59634.fsf@trenco.lwn.net>
 <9fc9ac50-abce-48bd-979f-2e00b26917b5@lucifer.local>
Date: Tue, 03 Jun 2025 08:08:22 -0600
Message-ID: <8734cg9auh.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Lorenzo Stoakes <lorenzo.stoakes@oracle.com> writes:

> On Mon, Jun 02, 2025 at 03:38:55PM -0600, Jonathan Corbet wrote:
>> Lorenzo Stoakes <lorenzo.stoakes@oracle.com> writes:
>>
>> > --- a/Documentation/mm/process_addrs.rst
>> > +++ b/Documentation/mm/process_addrs.rst
>> > @@ -303,7 +303,9 @@ There are four key operations typically performed on page tables:
>> >  1. **Traversing** page tables - Simply reading page tables in order to traverse
>> >     them. This only requires that the VMA is kept stable, so a lock which
>> >     establishes this suffices for traversal (there are also lockless variants
>> > -   which eliminate even this requirement, such as :c:func:`!gup_fast`).
>> > +   which eliminate even this requirement, such as :c:func:`!gup_fast`). There is
>> > +   also a special case of page table traversal for non-VMA regions which we
>>
>> The "!gup_fast" caught my attention - I was unaware that Sphinx had such
>> a thing.  Its purpose would be to appear to suppress the generation of the
>> link that turns the cross reference into a cross reference.
>>
>> The MM docs are full of these, do we know why?
>
> Removing it from the struct vm_area_struct struct immediately give:
>
> /home/lorenzo/kerndev/kernels/mm/Documentation/mm/process_addrs.rst:11: WARNING: Unparseable C cross-reference: 'struct vm_area_struct'
> Invalid C declaration: Expected identifier in nested name, got keyword: struct [error at 6]
>   struct vm_area_struct
>
> And given C's weirdness with typing I really prefer to be explicit in
> referencing a struct vs. e.g. a typedef.

That's because the :c:struct: markup doesn't want the word "struct" in
there.  In this case, the "!" is being used, essentially, to hide the
fact that the Sphinx markup is being entirely misused here.  You would
be far better off just saying:

  **struct vm_area_struct**

and avoiding the uglier markup in this case.

Once again, taking out the markup entirely will cause the automarkup
code to do the right thing, with the proviso that undocumented
structures (which, tragically, includes struct vm_area_struct) won't be
marked up in the current implementation.  By far the best solution here
is to remove all of the markup and add a kerneldoc comment for this
rather important structure.

> At any rate I'm not sure it's all that useful to cross-reference these?

Why would you *not* want to cross-reference something and make life easier
for your reader?

Thanks,

jon
