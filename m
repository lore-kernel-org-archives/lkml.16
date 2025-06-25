Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765751F30CC
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 20:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750882650; cv=none; b=HYItsypFHvgQIND8mgtDC9dwAmmZDBciuRp5PE9EECUO0FB2C/POH1KH2YAq618xeRqosym5YiiM9exGe/cZH2b4KnIue8fEbBSxy2Y5kYGNPTN0iwAoaW0v4SofnbCsd8MZEGk90IeQJGSZ0Fs2dwaStFwhdEpyYc5i521dmk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750882650; c=relaxed/simple;
	bh=28FlqPLPtVG8kpxqAeHefuAkTeBFt8espZeyTyhZ390=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AfhegATsWv6XUw+JQbbUXozTeizpIjReY3Ku7ZNjpoZZp/v61pHdzb8r3HaUN673UO9Uz96HI96hddH4VavG1IlNh1wv6FFGu6RRy5vvOY6tRpnmxr9Tkz86pbYqRWuO0GzKX3bszrnDfiiYQoi7XIUe8B5M2gDgInCKvKBgdFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AhIDNQWF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AhIDNQWF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750882647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KlmQIXJkSLHoHX0VDek2rLWbw4e0y5vAiIw+rJY/aIU=;
	b=AhIDNQWFd5HCx8qaNsIYVhNjl8KXaVEtN/WCFj4Smwzf+GxVVOlD+0am6i6267r3+7+sMT
	V1/pnHN7zmRsDU8lFij+21Wn/+7zjwsrbrQeDrLGHl3BFG/h8+tWL5aXLD5CyGMfcPv6Ox
	ptUJGqn/+CkT4HUpIb5T9817ed1+Mkc=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-62-oCdYpsmlPs6F6i9ZTjhDyg-1; Wed, 25 Jun 2025 16:17:26 -0400
X-MC-Unique: oCdYpsmlPs6F6i9ZTjhDyg-1
X-Mimecast-MFC-AGG-ID: oCdYpsmlPs6F6i9ZTjhDyg_1750882645
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5e2a31f75so65793885a.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 13:17:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750882645; x=1751487445;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KlmQIXJkSLHoHX0VDek2rLWbw4e0y5vAiIw+rJY/aIU=;
        b=Jlaa26x+mBxBGrEDxSHewjCJYItHvKlPOU8/MKTUUCfZ+bHfRF3vjBIdNZJhKZbEhb
         Jf5ZUwI5vzqT2FrjX288UwFbXjnKfjqJQjmuUHFxRik4vbOgmzJ7fstv4/2f+q+ztQCZ
         sIr31mjyXZiKAqH/c6LhgGk54BtWYK/jkUKxnErgLN/QiWf/EMNJy23TUuWp2hQt3vaz
         WCOuvbiLteXhbI0fhni+iShJY6eDno6kTsSSA3kS8JKRoW6JJ3AY0IMyGf5u2MHs7Y9m
         0V6gd+UaaWiMPDEYfAvzOmV8Qhb/lsQIKp1FCSJxTD+Tg7qmGTrWzsmPxIhfYiMEKuks
         wJQg==
X-Forwarded-Encrypted: i=1; AJvYcCWPHRQqr5sSBp88llvfCBvgJnd422BYKammPw1GXrFossOgyvs3xXi3/pEwa5fQeIK0OMjnU12ah+RftLQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YylD5IVb+JtvZzMuj/BkgT85MaqX1+xP28klJOdjOv23ZaKlv1d
	GJtWGK/0Ww2EX3DNEvrtDX2bBmKBj1/AC90E2TzH3y5j8fzMJtnW4ZEYeVZqb35uvM+V4sxIQid
	bV9Z2ziaHrOKJoYzg7QRpzlXZYKz4cNyD0/EyMrPSQQqkD57ljqYLaI/NscLzHxHpUA==
X-Gm-Gg: ASbGnctF2QHF7QD9rlnBLSxSLuLcl55Yv50Ikz5o8aTNNUKZhIHSilewZYQJtLn4tck
	xEMh1XJAXXNbhUhlBgI2OunRjJaRmXp7M2bW980IeESuQnlSS7nu/ZlV8zf2YuOP8P5x7z4NtQu
	oRzzxnntJiUu8YJrrdiS+Mc4vqs76oEo2Tjvjroi3rtf5hjqFnq5fxD8I3QMNxidehlV0L89yP1
	4j2qzjAVQbub8IIltE6vcP0RnlhlSN9QnZAOglWRAcFKyKhG6MSZxK3xORXLqsZKwrcv+YMiiko
	3m6Lo9Yenv0LTA==
X-Received: by 2002:a05:620a:1903:b0:7d4:295c:884c with SMTP id af79cd13be357-7d4296ca085mr688766885a.7.1750882645403;
        Wed, 25 Jun 2025 13:17:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEp93M4ZUN89rndoxAUp30wqRTw8qx2vuSj51L3iHO6Dl7nqKChlv50/E34qKZIK2pVZnw5og==
X-Received: by 2002:a05:620a:1903:b0:7d4:295c:884c with SMTP id af79cd13be357-7d4296ca085mr688762585a.7.1750882645053;
        Wed, 25 Jun 2025 13:17:25 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3f99fbe3esm653012085a.89.2025.06.25.13.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 13:17:24 -0700 (PDT)
Date: Wed, 25 Jun 2025 16:17:20 -0400
From: Peter Xu <peterx@redhat.com>
To: Nikita Kalyazin <kalyazin@amazon.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Hugh Dickins <hughd@google.com>, Oscar Salvador <osalvador@suse.de>,
	Michal Hocko <mhocko@suse.com>,
	David Hildenbrand <david@redhat.com>,
	Muchun Song <muchun.song@linux.dev>,
	Andrea Arcangeli <aarcange@redhat.com>,
	Ujwal Kundur <ujwal.kundur@gmail.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	James Houghton <jthoughton@google.com>,
	Mike Rapoport <rppt@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Axel Rasmussen <axelrasmussen@google.com>
Subject: Re: [PATCH 0/4] mm/userfaultfd: modulize memory types
Message-ID: <aFxZUHcQh3hSraqe@x1.local>
References: <20250620190342.1780170-1-peterx@redhat.com>
 <114133f5-0282-463d-9d65-3143aa658806@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <114133f5-0282-463d-9d65-3143aa658806@amazon.com>

On Wed, Jun 25, 2025 at 05:56:23PM +0100, Nikita Kalyazin wrote:
> 
> 
> On 20/06/2025 20:03, Peter Xu wrote:
> > [based on akpm/mm-new]
> > 
> > This series is an alternative proposal of what Nikita proposed here on the
> > initial three patches:
> > 
> >    https://lore.kernel.org/r/20250404154352.23078-1-kalyazin@amazon.com
> > 
> > This is not yet relevant to any guest-memfd support, but paving way for it.
> 
> Hi Peter,

Hi, Nikita,

> 
> Thanks for posting this.  I confirmed that minor fault handling was working
> for guest_memfd based on this series and looked simple (a draft based on
> mmap support in guest_memfd v7 [1]):

Thanks for the quick spin, glad to know it works. Some trivial things to
mention below..

> 
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 5abb6d52a375..6ddc73419724 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -5,6 +5,9 @@
>  #include <linux/pagemap.h>
>  #include <linux/anon_inodes.h>
>  #include <linux/set_memory.h>
> +#ifdef CONFIG_USERFAULTFD

This ifdef not needed, userfaultfd_k.h has taken care of all cases.

> +#include <linux/userfaultfd_k.h>
> +#endif
> 
>  #include "kvm_mm.h"
> 
> @@ -396,6 +399,14 @@ static vm_fault_t kvm_gmem_fault(struct vm_fault *vmf)
>  		kvm_gmem_mark_prepared(folio);
>  	}
> 
> +#ifdef CONFIG_USERFAULTFD

Same here.  userfaultfd_minor() is always defined.

I'll wait for a few more days for reviewers, and likely send v2 before next
week.

Thanks,

-- 
Peter Xu

