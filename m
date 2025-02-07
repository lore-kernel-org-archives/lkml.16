Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074818F4A
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 02:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738896399; cv=none; b=hXW3GK50WWiSlOBEcKz1j54UXOvh4qLcH6pd9lbqN+TsWTe7EqzA7abFdCKLog6hvUvNsD1zb5VpTiWcLH4oFs+np8i6GafzQQp/1CFa9C8lRxaI7CFznOEQdlqWhwO/MTjBpmtKAdWEZ/unaTtPtV/aIA40k8dsJ9A77MvGmC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738896399; c=relaxed/simple;
	bh=ZJdvlGs4crMKaBj/SifsNV0LPjiP0y+A37oSlyc6GRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X4tgHhy5Gfndj2Fw8/jZQmGdV1i9PBbvcmicbE1rg7LvOJU1z3PkoUgo6+aYsLsGD+u9hPByOLV1Z7vnmpQTpCwR3dhz2dvpd7FODnIXtPcMO1B/p+YAB6MrK77LADAYp7Ug24s+9XVkKWr0ntSMPMk9MnP5s26YZBsVXQJAya8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WbWijki4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WbWijki4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738896395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XshCRkcmNwuT/euYxqOTUA+A6AWBxcJxcyOmEZR6oEo=;
	b=WbWijki4Xptc9w7EqbvOZAfE1qlh+t7UkT3gDxPke3hHv5KnatSHbuxzxPxQ4KOwFT8Yd+
	REo7GRjV/v4/7yQ5O1Lplveg5zoQEiNV20DT1jTVwa6m1v5+2RvDTmFp0sGpbvs4RA6S/s
	I9Ui0cq8QQ4i0j9JrWbQ7fYxDJwWhUg=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-608-lBuVdnwAM5KLvc1qTpQu6A-1; Thu,
 06 Feb 2025 21:46:32 -0500
X-MC-Unique: lBuVdnwAM5KLvc1qTpQu6A-1
X-Mimecast-MFC-AGG-ID: lBuVdnwAM5KLvc1qTpQu6A
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B9EC81800879;
	Fri,  7 Feb 2025 02:46:30 +0000 (UTC)
Received: from localhost (unknown [10.72.112.206])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6015419560AE;
	Fri,  7 Feb 2025 02:46:28 +0000 (UTC)
Date: Fri, 7 Feb 2025 10:46:24 +0800
From: Baoquan He <bhe@redhat.com>
To: Kairui Song <ryncsn@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	akpm@linux-foundation.org, chrisl@kernel.org
Subject: Re: [PATCH 06/12] mm/swapfile.c: update the code comment above
 swap_count_continued()
Message-ID: <Z6V0APCLWxkWF0/r@fedora>
References: <20250205092721.9395-1-bhe@redhat.com>
 <20250205092721.9395-7-bhe@redhat.com>
 <CAMgjq7CHrN4cmS-JACUphQHKwv7gQdcCbzYRQ_H+ORBa4tJ7uQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMgjq7CHrN4cmS-JACUphQHKwv7gQdcCbzYRQ_H+ORBa4tJ7uQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

On 02/06/25 at 03:50pm, Kairui Song wrote:
> On Wed, Feb 5, 2025 at 5:28 PM Baoquan He <bhe@redhat.com> wrote:
> >
> > Now, swap_count_continued() has two callers, __swap_duplicate() and
> > __swap_entry_free_locked(), the relevant code comment is stale.
> > Update it to reflect the current situation.
> >
> > Signed-off-by: Baoquan He <bhe@redhat.com>
> > ---
> >  mm/swapfile.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/mm/swapfile.c b/mm/swapfile.c
> > index bf284ba16198..9ee2238042a5 100644
> > --- a/mm/swapfile.c
> > +++ b/mm/swapfile.c
> > @@ -3789,8 +3789,8 @@ int add_swap_count_continuation(swp_entry_t entry, gfp_t gfp_mask)
> >   * into, carry if so, or else fail until a new continuation page is allocated;
> >   * when the original swap_map count is decremented from 0 with continuation,
> >   * borrow from the continuation and report whether it still holds more.
> > - * Called while __swap_duplicate() or swap_entry_free() holds swap or cluster
> > - * lock.
> > + * Called while __swap_duplicate() or caller of __swap_entry_free_locked()
> > + * holds swap or cluster lock.
> 
> It should be only "cluster lock" not "swap or cluster lock" now?

You are right, I will update.

> 
> >   */
> >  static bool swap_count_continued(struct swap_info_struct *si,
> >                                  pgoff_t offset, unsigned char count)
> > --
> > 2.41.0
> >
> 

