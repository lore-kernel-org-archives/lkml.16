Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157122AE8D;
	Tue,  3 Jun 2025 14:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748959266; cv=none; b=Xkli0SyPJZnQOq80MvbhH9eYVYZof222BcLxTBO3AIagqn8352jy4DUoWpdPjgisTmqkfmQCbMKl+AbqPjl41NTYT9jUbonFpAR52CcGKs+d5FxcATj9b5Y/eu6xi1MCuw74VingFSUhbJLBsovqhUmBvJAqIo/8Rh8IEBYNsyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748959266; c=relaxed/simple;
	bh=SvFJ05RAnyGbskOSqhSoo7yM02PL9fGa0NvU2AiQ9Ok=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=a8LBPdmsoYSkN3md5CucLo02L98bD1uz57Uy8/Ox/DX82/0lVS9ueKTm1rkwjjxPGW0F1M4sWxvbZ/ksNl5y69mhHEDDtAMWeMwNwjFzX6fUWv3is2W1dMtGXjXF09L6x6bo7CC4e5ov+iKSUH/BXxRYk3i6jaQQOxiDUvmqHtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=F93Y/bpn; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="F93Y/bpn"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D571F41ED0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1748959264; bh=uOyNUmXYmGjvQ8M6ifu04w16RP5byp/ebrZPnuwV0QI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=F93Y/bpnWL4BxMcfbzMXUVjpLlzjzDrdmpEj/FZcpS9d4LazP5I/V92Hk4Szna1V3
	 oL+bMlZ23kHsdrqVWowvjQ4inyGrUdMx7zW5xTEk/vkdPDqtokWvtsF+gmUwSJ7wzo
	 CEov2CzSe1ze2h8J20GaTId8iIPX03ApU5Xjtu+vpn2ytirpqW5zmeYaixQ12QHMrA
	 Xz8Xryed0VVyuXRE4HVBlLyV2g/612fqFqLTGPx1O/TmdfZUh8q6I0J+9p1SaA2mdE
	 qQo9LX4IhKUfmkBq8Du6hLSrdorBvfNM4EA1BqjXSoO1WWfDxcDmrtcymOpUPGLGVO
	 N3L1EbKYrSTdg==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id D571F41ED0;
	Tue,  3 Jun 2025 14:01:03 +0000 (UTC)
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
In-Reply-To: <38bcf562-86dc-42b2-9ffc-53cbc5d8ac22@lucifer.local>
References: <20250602210710.106159-1-lorenzo.stoakes@oracle.com>
 <87bjr59634.fsf@trenco.lwn.net>
 <9fc9ac50-abce-48bd-979f-2e00b26917b5@lucifer.local>
 <38bcf562-86dc-42b2-9ffc-53cbc5d8ac22@lucifer.local>
Date: Tue, 03 Jun 2025 08:01:02 -0600
Message-ID: <877c1s9b6p.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Lorenzo Stoakes <lorenzo.stoakes@oracle.com> writes:

>> Re: the c:func: stuff -
>>
>> Well, the right thing is making function + type names clearly discernable, and
>> it just putting in the function name like that absolutely does not do the right
>> thing in that respect.
>>
>> I feel strongly on this, as I've tried it both ways and it's a _really_ big
>> difference in how readable the document is.
>>
>> I spent a lot of time trying to make it as readable as possible (given the
>> complexity) so would really rather not do anything that would hurt that.
>>
>
> Somebody told me that in _other_ .rst's, seemingly, it does figure out xxx() ->
> function and highlights it like this.
>
> But for me, it does not... :)

OK ... If you look at what's going on, some of the functions will be
marked, others not.  The difference is that there is no markup for
functions where a cross-reference cannot be made (because they are
undocumented).

We could easily change the automarkup code to always do the markup; the
problem with that (which is also a problem with the existing markup
under Documentation/mm) is you'll have rendered text that looks like a
cross-reference link, but which is not.  We also lose a clue as to which
functions are still in need of documentation.

The right answer might be to mark them up differently, I guess.

jon
