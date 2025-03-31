Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7535622156F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 15:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743434386; cv=none; b=ILEqCamK4cxzi999ePpm69cwf75WGVasGU7KpHj+Kx2NKcnVH+HZy0eCbKege1gweCifoJMZ5u6VRQ3wXFcXEi+nQHAsKfGqUm+KyE4y7/NslotZOs3zEtUxUW/X/PrQpLFKckdOBO5NcVUvsK70Y0zcYaC5nhgMo/uu6CfA/Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743434386; c=relaxed/simple;
	bh=XGAQM6GpfSCyFaD3vcOh0HxJVIDFC/IjBmRvyaqD8m8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y93p7KQsv8PtWEUdPXdnZRkXUSv08nkA1h/f77PGQQx+Bk8MJThiS+sQ2/l8Alvqu0s8ifiyYt26+d7MuqDOltwb11wiRXGViREXkGm7bxNj8STeymR2poAr9oG9A6TR1n6myfKf84h+6htzkrekLzUUFwAwyr0FYifsVpZDs9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K1TNjMn0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K1TNjMn0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743434382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fwTyXp3rS+4S8gP/lz0Bj0kULSAr5fxq/70sl6mUr24=;
	b=K1TNjMn02tJ4uDRxlubpmkROVwXlq3e0AbEt1Xm8Sdqm9F9NsitLjCu8RP9pgxdXFsm6Jx
	ot+4TOrU2rfefUD0NowowEYwvLpM36LpSNYaCzCAFu7/eEWRFd3Rbt6UuSQrsJGQramhfS
	tXkGeGr7sabxximWSPtRDtYSLxPN/80=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-675-DXiJ7LEvNKCMMy60WETe5A-1; Mon,
 31 Mar 2025 11:19:38 -0400
X-MC-Unique: DXiJ7LEvNKCMMy60WETe5A-1
X-Mimecast-MFC-AGG-ID: DXiJ7LEvNKCMMy60WETe5A_1743434377
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8F693195608D;
	Mon, 31 Mar 2025 15:19:36 +0000 (UTC)
Received: from localhost (unknown [10.72.112.9])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1A4331955DCE;
	Mon, 31 Mar 2025 15:19:34 +0000 (UTC)
Date: Mon, 31 Mar 2025 23:19:28 +0800
From: Baoquan He <bhe@redhat.com>
To: Oscar Salvador <osalvador@suse.de>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] mm/gup: Fix the outdated code comments above
 get_user_pages_unlocked()
Message-ID: <Z+qygOF2kueozxk0@MiWiFi-R3L-srv>
References: <20250330121718.175815-1-bhe@redhat.com>
 <20250330121718.175815-4-bhe@redhat.com>
 <Z-qfflDA8pEn7HZ5@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-qfflDA8pEn7HZ5@localhost.localdomain>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On 03/31/25 at 03:58pm, Oscar Salvador wrote:
> On Sun, Mar 30, 2025 at 08:17:13PM +0800, Baoquan He wrote:
> > Since commit f0818f472d8d ("mm: gup: add get_user_pages_locked
> > and get_user_pages_unlocked"), get_user_pages() doesn't need to have
> > mmap_lock held anymore. It calls __get_user_pages_locked() which
> > can acquire and drop the mmap_lock internaly.
> 
> Yes, __get_user_pages_locked() can aquire and drop the lock, but AFAICS
> get_user_pages() always calls __get_user_pages_locked() with locked=1,
> which means that is holding the lock, right?

Ah, You are right. Thanks for looking into this, Oscar. I incredibly
missed the local virable definition "int locked = 1;" line. I will drop
this patch, or wrap the code comment fix into other patch about the
obsolete reference with "get_user_pages(mm, ..., pages, NULL)".

> 
> > Hence remove the incorrect code comments now.
> > 
> > Signed-off-by: Baoquan He <bhe@redhat.com>
> > ---
> >  mm/gup.c | 16 +++-------------
> >  1 file changed, 3 insertions(+), 13 deletions(-)
> > 
> > diff --git a/mm/gup.c b/mm/gup.c
> > index 8788105daee8..3345a065c2cb 100644
> > --- a/mm/gup.c
> > +++ b/mm/gup.c
> > @@ -2702,19 +2702,9 @@ long get_user_pages(unsigned long start, unsigned long nr_pages,
> >  EXPORT_SYMBOL(get_user_pages);
> >  
> >  /*
> > - * get_user_pages_unlocked() is suitable to replace the form:
> > - *
> > - *      mmap_read_lock(mm);
> > - *      get_user_pages(mm, ..., pages, NULL);
> > - *      mmap_read_unlock(mm);
> > - *
> > - *  with:
> > - *
> > - *      get_user_pages_unlocked(mm, ..., pages);
> > - *
> > - * It is functionally equivalent to get_user_pages_fast so
> > - * get_user_pages_fast should be used instead if specific gup_flags
> > - * (e.g. FOLL_FORCE) are not required.
> > + * get_user_pages_unlocked() is functionally equivalent to
> > + * get_user_pages_fast so get_user_pages_fast should be used instead
> > + * if specific gup_flags (e.g. FOLL_FORCE) are not required.
> >   */
> >  long get_user_pages_unlocked(unsigned long start, unsigned long nr_pages,
> >  			     struct page **pages, unsigned int gup_flags)
> > -- 
> > 2.41.0
> > 
> > 
> 
> -- 
> Oscar Salvador
> SUSE Labs
> 

