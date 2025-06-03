Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4151DA23;
	Tue,  3 Jun 2025 15:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748963137; cv=none; b=hFf2d2zmDvP4FTsuKttw+p5BT1vt2L3RYsd9K1EspAtaBl7lHpm9DD+ua7R7yW/iTCydDP0JPdBYGPvMTVKPggto5koGQZWJ/CM/jRrPFwCtfyMQFpPV4DF2pss1rwDI6ijmFYE8vBkUacCQECsceBZU55zTfqW52o8CsjCKGgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748963137; c=relaxed/simple;
	bh=FxnkA/aVDrvUgAFOoBDT+AXrYzOamGDJS6lZtY1GVK0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=e1Bn962N7Ud26qAEb/6eJ+sA6bKgep4oqo9fKDSS8oPeRspDvI+8wH4F2eSdSeA/eWdSZt/PZ3NEj+wn5/srry+pTc/0kcnZjTjkKrb+goeJQC2RsfaHLwfAdSU47sKIzsv9yTuUKBErjhAnm5xhBpj2QmbuhVdBbJjRm6f5aS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Lu7WMOiH; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Lu7WMOiH"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 722A641ED0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1748963133; bh=u75W7CrJry5PSsWILVQUlbbLDjglIU1VsldGoh1HdL0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Lu7WMOiHQ70LdZl5nv3BhlYL1rAbVKibnwb/foSODhZW3F2E5RHWrPy/VfE2mYyXh
	 IGAd9y5ZMnwUjIysaIgE3YpLlJY87aagUYrBYC9U3UjcpKsYxUIysV06lKORiKXzLg
	 fBCU1IvBKX2CScnaFejNKg5YPRjZvilgYM4e1+Nnp1zcaz1+wq6Y0UnZoxhZnUNdEV
	 i4wxN0fJ/gjEqugyryjhusx6MiwVQsSSez2nZcqCf5RjfxDM2aFXhrKKggUYo00saJ
	 1P/BvUuYOOz+Ccs0VjOzH9+rmJdFHkKMttTdFA5R6FniC0p0inKL8C0ItnDGRTggfL
	 aRchLLoGELZaw==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 722A641ED0;
	Tue,  3 Jun 2025 15:05:33 +0000 (UTC)
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
In-Reply-To: <1b340b71-6664-48ff-b783-aa89fa5b0b16@lucifer.local>
References: <20250602210710.106159-1-lorenzo.stoakes@oracle.com>
 <87bjr59634.fsf@trenco.lwn.net>
 <9fc9ac50-abce-48bd-979f-2e00b26917b5@lucifer.local>
 <8734cg9auh.fsf@trenco.lwn.net>
 <ea8c2be9-0af0-445b-b7fe-fd9e80bd6a65@lucifer.local>
 <87tt4w7uxo.fsf@trenco.lwn.net>
 <1b340b71-6664-48ff-b783-aa89fa5b0b16@lucifer.local>
Date: Tue, 03 Jun 2025 09:05:32 -0600
Message-ID: <87ldq87tmr.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Lorenzo Stoakes <lorenzo.stoakes@oracle.com> writes:

> Thanks, I appreciate that. So I want to address your concerns as well as I
> can. I think I have misunderstood you a little bit here too (text is a poor
> medium, yada yada) so let me try to nail down what I feel is the sensible
> way forward:
>
> 1. Once I am confident I have correctly addressed Jann's feedback I'll
>    respin a v2 with the various 'sins' in place for the time being.
>
> 2. I will also drop the 'since v6.14' stuff you rightly raised in this
> respin.

So far so good

> 3. I will create a follow-up series to address these issues in this file
> -in general-:
>
> - Drop '!' from every reference so we get automated cross-referencing - I
>   think now I understand the point (hopefully!) that Sphinx with
>   automagically link every unique reference to a function/struct/etc. to
>   one another.

If you just drop the "!" you'll run into the "struct" problem you
mentioned before.  You'll need to take out "struct" as well if you go
this route...

> - Perhaps hack in a **struct ** prefix so we get the 'best of both worlds'
>   on this for types...?

...so yes you'd need to do that.

> I think my misapprehension about defining functions was not realising that
> by doing :c:func:etc without the ! would automatically provide that
> definition upon first reference to that function/struct/etc.?
>
> Is that correct/sensible?
>
> Would you want me to only use the :c:func: stuff in the _first_ mention of
> a function and then to not use it from then on?
>
> I wonder if the _appropriate_ use of :c:func:...: is in the actual
> definition, but since it's not really practical to do that right now* is
> simply doing it upon first mention a sensible 'least worst' approach here?

Here, I think, we've gone a bit off track again.  The goal of the
automarkup code was to *never* need to use the :c:func: markup.  Let's
just say that ... certain members of our community ... found that markup
entirely intolerable - and, in truth, it is ugly.  So I wrote the
initial automarkup extension; now, any time that the docs build sees
function(), it looks for documentation for that function and creates a
cross-reference if that documentation is found.

The goal is that you should never need the :c:gunk: ever.

Thanks,

jon
