Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3145103F
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 01:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738806076; cv=none; b=MCFMznjwuonZu93x6eUqv85SBsRnUtb3PwcFbgnJ3/uQTUEZ/fV4j33Cj0zbP4cNwvsTWxihWLFKcLhdd5UGHcddOVDNeiJDjnLGzscEv7zKToZlDsgQlUwA0KbUIfmdtdCqkvKDaylqO+TVahfcKMS2iY7Hc3jXO6PitmzPWD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738806076; c=relaxed/simple;
	bh=jSlH/7nZKyceq4CboqjBJ/CZIDB2VRg/vgpybzHXuhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TTce6k9H0oW4A+UOVuLMJBC5j5vfRmdf2MwWqfXadVw8RQ5ubvUIN1eBdkoCHLX25yay7buqzN5NPLOi3N+/kzNA8rdlfrfbOJ3378ZdS+obo0z6Ekca4NbzPqBa+WIvx3utzwBle63AigvF5YxI/Guaj2+EKFETdUcYRKu8Y2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CFbi4n6+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CFbi4n6+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738806073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EM+fv56TZqxZiQy5TwGvsOnPrwrS/LPQ6Rsu0jcBzU4=;
	b=CFbi4n6+KQ3J1msgtmtPi3/wZoeGd3Wg8LNcthOVVr2hiVDQ+zh5jTK4UYBO/4izQ+3kSM
	tbQ770EbbIzJiIL2UI4R+c795pASDLSAA8HpJ+owHpfGBphgr0obYIoxx9O9PBRwKLx5e/
	Ph6vnEy09NkV9BZfqagbz8gVfLTfyn0=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-350-F5z-XJ0TNa-vffyGzskQdw-1; Wed,
 05 Feb 2025 20:41:05 -0500
X-MC-Unique: F5z-XJ0TNa-vffyGzskQdw-1
X-Mimecast-MFC-AGG-ID: F5z-XJ0TNa-vffyGzskQdw
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EBC601956088;
	Thu,  6 Feb 2025 01:41:03 +0000 (UTC)
Received: from localhost (unknown [10.72.112.43])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 92A081955BD4;
	Thu,  6 Feb 2025 01:41:02 +0000 (UTC)
Date: Thu, 6 Feb 2025 09:40:57 +0800
From: Baoquan He <bhe@redhat.com>
To: Kairui Song <ryncsn@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	akpm@linux-foundation.org, chrisl@kernel.org
Subject: Re: [PATCH 04/12] mm/swap: skip scanning cluster range if it's empty
 cluster
Message-ID: <Z6QTKQPKXDEpWWKb@fedora>
References: <20250205092721.9395-1-bhe@redhat.com>
 <20250205092721.9395-5-bhe@redhat.com>
 <CAMgjq7CYC4xfAkp9Y7g=3rw=iqTj_pQAjrnwDC1orkdUhnOCSQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMgjq7CYC4xfAkp9Y7g=3rw=iqTj_pQAjrnwDC1orkdUhnOCSQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On 02/06/25 at 01:07am, Kairui Song wrote:
> On Wed, Feb 5, 2025 at 5:27 PM Baoquan He <bhe@redhat.com> wrote:
> >
> > Since ci->lock has been taken when isolating cluster from
> > si->free_clusters or taking si->percpu_cluster->next[order],
> > it's unnecessary to scan and check the cluster range availability
> > if i'ts empty cluster, and this can accelerate the huge page
> > swapping.
> >
> > Signed-off-by: Baoquan He <bhe@redhat.com>
> > ---
> >  mm/swapfile.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/mm/swapfile.c b/mm/swapfile.c
> > index 9c9a4ec6d4c6..61efde853eea 100644
> > --- a/mm/swapfile.c
> > +++ b/mm/swapfile.c
> > @@ -729,6 +729,9 @@ static bool cluster_scan_range(struct swap_info_struct *si,
> >         unsigned long offset, end = start + nr_pages;
> >         unsigned char *map = si->swap_map;
> >
> > +       if (cluster_is_empty(ci))
> > +               return true;
> > +
> 
> Hi Baoquan,
> 
> Thanks for the series.

Thanks for your reviewing.

> 
> Most commits are looking great, but this one is a bit questionable.
> cluster_scan_range is only called by alloc_swap_scan_cluster, and it
> already checks if the cluster has enough empty slots to use, so this
> might be redundant.

Hmm, maybe no. Assume we want to allocate 2M space on system with 4K
page size. Even if a empty cluster is taken into consideration,
cluster_scan_range() will loop 512 times to check if each slot is
available. That for sure is not necessary in the case, while the added
empty cluster checking is very cheap.

> 
> It is possible that cluster_scan_range sees an empty cluster if the
> cluster lock was dropped for reclaiming HAS_CACHE, but the chance
> should be extremely low, that this might be a negative optimization.

It may be not like that. If it's empty cluster, the added checking will
return directly. Then 'need_reclaim' is kept false, there's no chance to
drop cluster lock to do reclaiming for HAS_CACHE. Means for empty
cluster scanning, the ci->lock is kept held. Not sure if I missed
anything.

Thanks
Baoquan

