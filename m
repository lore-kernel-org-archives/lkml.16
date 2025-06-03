Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B151DB366;
	Tue,  3 Jun 2025 14:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748961446; cv=none; b=Ub0fjCR4IsboowVIhNwhohodS4ARvKVnkJQ+IlztUPg5sx43Nu55hfysEzj16IbRqALP/lhenjjhVxznPLX5fZE9TzaSIGRK186kahPE1tP18iiZT1oSsup+cPS8kYeUoL6CT0bcWDx7zyhPW0FSgINpGPqv3fZls4MV9jOlVBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748961446; c=relaxed/simple;
	bh=7F0XII4V5s2KPp1ioe9SOauygO51/G8Tc6KLSdROHo0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PJLHHKVOb2yWN1W9hLlR56xeGkMR2DYG/XnQUbft5qtslbvLFg7hEZhzLifB0DglWjs7fOT0aVL3eqGPsTv309XqGa83E1db1azgWg/67oEP4OAYgRuD4XLFR6bJGkXgp4DhUjX7F0td8DyoWkWAAHXBC+egTCjyc6b4m2Yl3MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Fzyv0y/d; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Fzyv0y/d"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3756041ED0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1748961444; bh=uw373KZqTxfYc7CgajAJm0hoPspIDINCwb6qNNb/b2c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Fzyv0y/daizC+CqsktU1eYw3qfqwRekvSQTdxZWnPgVQ4dTTO45tBy2VxZug9voGr
	 Vo2Oc2sPdIN9zD5H+wA1J8Zt7YjVSyTITU8TAXH4C7QrclLYAz33xAUuYXcSFvmxVb
	 yHGKsmXe4Ce58i9tfK01pZaqc3xTntavvgxWpKnZJsjNFZl0VKGvD4f8PdE539GgZY
	 RNGyEkQq4byV+byRM3wi4I/y9GJ4N3irjin11LWZduBaBEd5sft2tN/Cd/RAcuwp6U
	 ULdlp9Q1VSJq7HVGoS1AHAtbYUIiq6RSv9mmTHnQ8nWtITi1Gf0bdX84WDdy2LclZQ
	 4NyKT8ktuA/SA==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 3756041ED0;
	Tue,  3 Jun 2025 14:37:24 +0000 (UTC)
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
In-Reply-To: <ea8c2be9-0af0-445b-b7fe-fd9e80bd6a65@lucifer.local>
References: <20250602210710.106159-1-lorenzo.stoakes@oracle.com>
 <87bjr59634.fsf@trenco.lwn.net>
 <9fc9ac50-abce-48bd-979f-2e00b26917b5@lucifer.local>
 <8734cg9auh.fsf@trenco.lwn.net>
 <ea8c2be9-0af0-445b-b7fe-fd9e80bd6a65@lucifer.local>
Date: Tue, 03 Jun 2025 08:37:23 -0600
Message-ID: <87tt4w7uxo.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Lorenzo Stoakes <lorenzo.stoakes@oracle.com> writes:

> But to repeat - 'given C's weirdness with typing I really prefer to be
> explicit in referencing a struct vs. e.g. a typedef.'

...and I think that makes perfect sense.

>> Why would you *not* want to cross-reference something and make life easier
>> for your reader?
>
> Because it apparently requires me to document every function I reference?
> Unless I'm missing something?
>
> I may be misunderstanding you.
>
> If not then fine, I can delay this patch, go off and do a 'cleanup' patch
> first, that will drop the '!'s and come back to this.
>
> But if I need to document every referenced function that just isn't
> feasible for me with my current workload.
>
> Please clarify!

Hopefully I already have - I'm in no position to enforce such a
requirement, even if I thought it would be a good thing -- and I don't.
It's hard enough to get documentation written as it is, I certainly
don't want to make it harder.

My suggestion would be: proceed with your changes for now, it was never
my purpose to put obstacles there.  I'll look at having automarkup do
something a bit more useful for references that lack documentation, then
maybe I'll do a cleanup pass on some of the mm docs if nobody else gets
there first.

Thanks,

jon
