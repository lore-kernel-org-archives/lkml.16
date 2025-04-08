Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5531B4236
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 14:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744124397; cv=none; b=RwX+T3wrPjxenLnLvvWcx1S8pVPWi0mXLfhi0UHBZTcevCow2JrhYW72MALAfv+hsbflNSSspEkM960EIJs1oJ5lQdT6P5uD00OpOc52rFxBtIsR0FXEOzySm1zUEgkADpce2dxqzrk+kMIAFHWoQOp3xvAOuCPheT3LqDuDEkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744124397; c=relaxed/simple;
	bh=p8dKZ65tvucZM1XDmZCpozybfoCjSwXeod2LVONknYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=izHzPJcFeQi4RC+iRxHXMmTt380pAxC6wtTA9zWOTMF1td9NJfiR9D2GigEipfG3NKtyhDNrlBt5GVoR5NZ7qC2Qrw+AJeKrxBJQTaH+g26h+LPjCqEMLX6SBQGBfN/W1OEIP5/xIhY8tLcujN/UFItRjfeN8g3wCJGbBpl+8LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NpewxpTg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NpewxpTg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744124394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pCzzTtjq/nn0G4yumyj10VB3i1Cs8+HpPixzKePPsUI=;
	b=NpewxpTgXh/hX+8z3QP+BZg3Bw/BdQx9Nn5qskoKPg+EiHMcMEyf9DuVw1rBA8mIvQazqQ
	xqFpOoiCnYl7XOh25afhficezudO91dneU8zLjPYyaVyg1+XUqi5QBswuA7xY+QtVkyfN0
	p1n/JedurLwck5wyOhqeZhS92rpYDIQ=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-496-3IDcwIyKNOeoWZ9-SbmMhA-1; Tue,
 08 Apr 2025 10:59:51 -0400
X-MC-Unique: 3IDcwIyKNOeoWZ9-SbmMhA-1
X-Mimecast-MFC-AGG-ID: 3IDcwIyKNOeoWZ9-SbmMhA_1744124390
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C761619560B0;
	Tue,  8 Apr 2025 14:59:49 +0000 (UTC)
Received: from localhost (unknown [10.72.112.61])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 15CBB18009BC;
	Tue,  8 Apr 2025 14:59:47 +0000 (UTC)
Date: Tue, 8 Apr 2025 22:59:41 +0800
From: Baoquan He <bhe@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, osalvador@suse.de,
	mingo@kernel.org, yanjun.zhu@linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] mm/gup: fix wrongly calculated returned value in
 fault_in_safe_writeable()
Message-ID: <Z/U53RWWutke333z@MiWiFi-R3L-srv>
References: <20250407030306.411977-1-bhe@redhat.com>
 <20250407030306.411977-2-bhe@redhat.com>
 <c8bc199d-30e1-4f0c-868c-6cbab1fbc747@redhat.com>
 <a29827bd-39f6-4645-a5af-fed3c92f85d5@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a29827bd-39f6-4645-a5af-fed3c92f85d5@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 04/08/25 at 12:00pm, David Hildenbrand wrote:
> On 08.04.25 11:52, David Hildenbrand wrote:
> > On 07.04.25 05:03, Baoquan He wrote:
> > > Not like fault_in_readable() or fault_in_writeable(), in
> > > fault_in_safe_writeable() local variable 'start' is increased page
> > > by page to loop till the whole address range is handled. However,
> > > it mistakenly calcalates the size of handled range with 'uaddr - start'.
> > > 
> > > Here fix the code bug in fault_in_safe_writeable(), and also adjusting
> > > the codes in fault_in_readable() and fault_in_writeable() to use local
> > > variable 'start' to loop so that codes in these three functions are
> > > consistent.
> > > 
> > 
> > I probably phrased it poorly in my other reply: the confusing part (to
> > me) is adjusting "start". Maybe we should have unsigned long start,end,cur;
> > 
> > Maybe we should really split the "fix" from the cleanups, and tag the
> > fix with a Fixes:.

> > 
> > I was wondering if these functions could be simplified a bit. But the
> > overflow handling is a bit nasty.
> 
> FWIW, maybe the following could work and clarify things. Just a thought.

The code simplification looks great to me. I will make a patch to only
contains the code bug fixing with Fixes so that it's eaiser to back port
to stable kernel, and make another patch as below to refactor codes in
fault_in_readable/writable/safe_writable(). Thanks for suggestion.

> 
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index 92351e2fa876b..7a3f78a209f8b 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -2223,30 +2223,23 @@ EXPORT_SYMBOL(fault_in_safe_writeable);
>   */
>  size_t fault_in_readable(const char __user *uaddr, size_t size)
>  {
> -       const char __user *start = uaddr, *end;
> +       const unsigned long start = (unsigned long)uaddr;
> +       const unsigned long end = start + size;
> +       unsigned long cur;
>         volatile char c;
>         if (unlikely(size == 0))
>                 return 0;
>         if (!user_read_access_begin(uaddr, size))
>                 return size;
> -       if (!PAGE_ALIGNED(uaddr)) {
> -               unsafe_get_user(c, uaddr, out);
> -               uaddr = (const char __user *)PAGE_ALIGN((unsigned long)uaddr);
> -       }
> -       end = (const char __user *)PAGE_ALIGN((unsigned long)start + size);
> -       if (unlikely(end < start))
> -               end = NULL;
> -       while (uaddr != end) {
> -               unsafe_get_user(c, uaddr, out);
> -               uaddr += PAGE_SIZE;
> -       }
> -
> -out:
> +       /* Stop once we overflow to 0. */
> +       for (cur = start; cur && cur < end; cur = PAGE_ALIGN_DOWN(cur + PAGE_SIZE))
> +               unsafe_get_user(c, (const char __user *)cur, out);
>         user_read_access_end();
>         (void)c;
> -       if (size > uaddr - start)
> -               return size - (uaddr - start);
> +out:
> +       if (size > cur - start)
> +               return size - (cur - start);
>         return 0;
>  }
>  EXPORT_SYMBOL(fault_in_readable);
> 
> 
> -- 
> Cheers,
> 
> David / dhildenb
> 

