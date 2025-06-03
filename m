Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207FC22F770;
	Tue,  3 Jun 2025 15:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748964514; cv=none; b=TxaXN24B0Ya+1Cfeaj8JwdbvLCB5aGyeQhkE6pjIQukcjib9kQiaQzgMkbC2lMVNZ/+q4dbrNwzXeqMXkMJTq8PBauIeg1d/9LI5FQ5R3uSXyKmXweMJfLCMwZ1OuaZWYJbUE8QZl5sPx3ZJTa0ZUZFnQ8/CvlW/OcerXkJRYzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748964514; c=relaxed/simple;
	bh=RQYoR9q7weFmEpLoxRlV5vuOX4M623nbX7QdC5Pgbas=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=H+5PkMlHUnb40jVZDjQP3zxGSOso1nRjet4JuSkuATURzPQg4epNUgSWLhvFQY21aT0YcfpiYAdwoA/rRNSwzMQN3/aMgnWoJ8T59qTuZEE3xNsWlLIpjcnMEZCFOAfkH5GG0hX3aYoJ6Cj5IGgN3aBUT7c9VE4hRl6ieJ2t5gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=s1ybJjFr; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="s1ybJjFr"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1915D41ED0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1748964512; bh=cFEuxrACn2RIdjxvK8dTxNQyuRrUj671AkYFigBqf0g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=s1ybJjFrFJHy22uuXPs+8VncyaHlDpCvd2LTlFpxfzn4KkTW+Cvs229egVFFKRz9b
	 lATeAHjqKx/yIwtxhXTqxgeARDCV7lrHXL0TEif0RIvbpTKME6JyFdf7RgEY1BCz3U
	 gT3ia2zSFClbsBG04xl4qcZNY3OA9FxC6Tx/TFGW5J/XaQqkPgzV6wT2msVGEqZctx
	 eq7YoO0SWDkeWydDeZ1FxxO7cCr3Ji+0rp5ljYNFRe9ZPLefAYGMzevl1MED/qcMW4
	 +Hy3WzcIuMo2JqrjM4f2SIbcd+terefOQun2PQbOjGfUzrLAKq+D+kWcshAma1Ec5g
	 osnXWEDDwMRbA==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 1915D41ED0;
	Tue,  3 Jun 2025 15:28:32 +0000 (UTC)
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
In-Reply-To: <334c9145-0adc-4fb6-ab0e-4ef7d6e09952@lucifer.local>
References: <20250602210710.106159-1-lorenzo.stoakes@oracle.com>
 <87bjr59634.fsf@trenco.lwn.net>
 <9fc9ac50-abce-48bd-979f-2e00b26917b5@lucifer.local>
 <8734cg9auh.fsf@trenco.lwn.net>
 <ea8c2be9-0af0-445b-b7fe-fd9e80bd6a65@lucifer.local>
 <87tt4w7uxo.fsf@trenco.lwn.net>
 <1b340b71-6664-48ff-b783-aa89fa5b0b16@lucifer.local>
 <87ldq87tmr.fsf@trenco.lwn.net>
 <334c9145-0adc-4fb6-ab0e-4ef7d6e09952@lucifer.local>
Date: Tue, 03 Jun 2025 09:28:31 -0600
Message-ID: <874iww7skg.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Lorenzo Stoakes <lorenzo.stoakes@oracle.com> writes:

> OK thanks for clarifying, so let's do a take 2 of the action items:
>
> 1. Once I am confident I have correctly addressed Jann's feedback I'll
>    respin a v2 with the various 'sins' in place for the time being.
>
> 2. I will also drop the 'since v6.14' stuff you rightly raised in this
> respin.
>
> 3. I will create a follow-up series to address these issues in this file
>    -in general-.
>
> 4. Drop '!' from every reference so we get automated cross-referencing (with the
>    ** struct ** hack as needed).
>
> 5. Where possible see if we have functions documented, and if so avoid the
>    :c:... noise. If we can't avoid it for now, note down the functions and add
>    to todo to get documented. We can remove the gunk as we go...

This one I don't get - what is the noise you are talking about?  Again,
you shouldn't need :c:func: at all...?

There will surely be functions (and structs) that are not documented;
trying to do them all probably leads to a point of diminishing returns.
But forward progress on the more important ones is always good.

> A couple questions on point 5:
>
> - When you say 'documentation', do you mean the /** kernel-doc stuff?

Yes, that is the documentation that will be cross-referenced.

> - Does running `make SPHINXDIRS=mm htmldocs` suffice to have this script run? As
>   this is how I've been previewing my changes so far!

Yes, the automarkup extension runs with any Sphinx build.

Thanks,

jon
