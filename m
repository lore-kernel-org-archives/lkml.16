Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431C71DB366;
	Tue,  3 Jun 2025 14:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748961238; cv=none; b=f+Bw4uAMnsdmC1HgtB9uh9+ZWXEwEEqYsXkMNIH+lHNl6iYZFOMEJxoGBfe15GVQr3lv2BFlCsofCx1vaezLlBpHBAH7qdbYg9TGCxUbyvy8chEt1yx3NSmij2SKZpJ93i/Ak4Ke/RtmY/TyvMRR7/Tbe3KLv+MP5plIt8husNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748961238; c=relaxed/simple;
	bh=Pax7Wp8g4EBK5lfGZTNO6TWJfzNxTHPQp6fy7syi1Lk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Pq43idy+5Q6sNnf7mYkkgMcgJqrVQs/geFoqVzeNO+Agzdhgs5oCldYcHVRRiS2bDCJ2pO5u6MnY/Zc1fsVoVFtyVhqFNx3prxjE34e8F7qDIFKo0mnwe1WkuHqMt2Q5BEB4QwP+PNf7d+79S7TtxCZRvyTHE2pW1+qSz0Ikrp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=bjuvxdBO; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="bjuvxdBO"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2C74141ED0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1748961236; bh=xuzJ6pVHRkOA6mC6eSB047dEohJN/pd9soeYCZQRrNY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bjuvxdBOkFWFGc9lPwDAFgGPB1xqaSZmxICh+WhRoqYTpFzqQ3UsZtYRwl1o7W3XQ
	 1v09x5i1ajdt//pT9RuhWYc07eOq4VHR3IyVj2yrMi0V7GISj/1ScS2DBt5LzSV+xA
	 PhUR6ddS3kXbntmYGyH8Dih6G/UZb+FnrM8YF9eOT/BFNx2ixsOydPxunVxvNw/2x4
	 2pZy6hU8gIkML3r7FPR4YANeqSzl4gwELRxATwefXtl2phZVdRu1yc0U1QMzTHEmqD
	 u0ux7dcw8WXFX/+g6iDKHp2r6ecGLcx5Rk7gQJDGwy0HmBce7QdC9szyGV5aaF+CRI
	 O3Dduxgjs/8Ag==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 2C74141ED0;
	Tue,  3 Jun 2025 14:33:56 +0000 (UTC)
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
In-Reply-To: <28f53f7e-5ac2-4ef4-8944-6741161e6870@lucifer.local>
References: <20250602210710.106159-1-lorenzo.stoakes@oracle.com>
 <87bjr59634.fsf@trenco.lwn.net>
 <9fc9ac50-abce-48bd-979f-2e00b26917b5@lucifer.local>
 <38bcf562-86dc-42b2-9ffc-53cbc5d8ac22@lucifer.local>
 <877c1s9b6p.fsf@trenco.lwn.net>
 <28f53f7e-5ac2-4ef4-8944-6741161e6870@lucifer.local>
Date: Tue, 03 Jun 2025 08:33:55 -0600
Message-ID: <87y0u87v3g.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Lorenzo Stoakes <lorenzo.stoakes@oracle.com> writes:

>> OK ... If you look at what's going on, some of the functions will be
>> marked, others not.  The difference is that there is no markup for
>> functions where a cross-reference cannot be made (because they are
>> undocumented).
>>
>> We could easily change the automarkup code to always do the markup; the
>> problem with that (which is also a problem with the existing markup
>> under Documentation/mm) is you'll have rendered text that looks like a
>> cross-reference link, but which is not.  We also lose a clue as to which
>> functions are still in need of documentation.
>
> Isn't it a pretty egregious requirement to require documentation of every
> referenced function?
>
> I mean if that were a known requirement I'd simply not have written this
> document at all, frankly.

Who said anything about it being a requirement?  I think we have gone
way off track here.

Certainly it would be *nice* to have all of that stuff documented, and I
think there is value in giving a visual clue for stuff that lacks
documentation, but I never said anything about requirements.

>> The right answer might be to mark them up differently, I guess.
>
> But... what I'm doing here, and what mm does elsewhere works perfectly fine? Why
> do we need something new?

Because you're thinking in terms of the rendered docs, and not the
people who read the plain text.  "function()" is far more readable than
":c:func:`!function()`", don't you agree?  And rather easier to write as
well.

> Surely this cross-referencing stuff is more useful for API documentation
> that explicitly intends to describe functions like this?

The cross-referencing is *to* the API documentation.  Again, you are
mentioning a function, why would you *not* want to let the system
automatically link to that function's documentation?  Especially since
you're using markup that is explicitly provided for exactly that
purpose?  Does the link cause some sort of harm?

Thanks,

jon
