Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0695923D289
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 22:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744757772; cv=none; b=UyKMe9cZV33Ez6/1oolXywgwLeag7tw/QOVS6kp+6ixV+EZH5xPCdMcJAX1stdO78Cci0bgseJaGRcloQ7/qfDAkxrtyquW4yc+Xx0R9v26/cPgyK//P6gSqD24LM79Mxw2TOCTOgrF4YZwQY5uVAKq0k7PCVPzqgZCcOq/RaYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744757772; c=relaxed/simple;
	bh=w5i2IRFUkGLsQ19deGxJE5v1fCHoAGpp7uciDOfDVEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lXA0tomniXNL1CZ0ccO/crSOqZ4vwA1/q3AbshVe59oMUJxHBMXrsYvCsOdGLdTcYKQ3rN4ityWA8pYWBle0nEOotbRR5iAYvW5qfrUoRhk3enBMloilug/hxSiKmwGdCVvLKMfeXFcQVUtyQnODLZMNOpNwMaoiS/bzrUO49r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HRCF+mY3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HRCF+mY3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744757764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=imz0uv/7rUHpG5Wek2+5ECUg21ZObIxgPfHBxFulP7I=;
	b=HRCF+mY3UmjU+oykoARqe2HrUDJ1hl1EIM0L84EJvShdMnMTUbRHhIYwLJOQRO/FvAOYTE
	5nfGLJg/jcbhJWNzuIVTT/jRuSE2Y4grmqsSQrJWzADV+Llbhr3li7rdVphFtaIU0jFbCf
	Cy/VLBMHhFZFGc4Z+YCD+OwFw7y4gVo=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-100-e5qYF_mWO66aDl3gjCpCaw-1; Tue,
 15 Apr 2025 18:56:03 -0400
X-MC-Unique: e5qYF_mWO66aDl3gjCpCaw-1
X-Mimecast-MFC-AGG-ID: e5qYF_mWO66aDl3gjCpCaw_1744757762
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D4F6119560AB;
	Tue, 15 Apr 2025 22:56:01 +0000 (UTC)
Received: from localhost (unknown [10.72.112.38])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A49F01955BC0;
	Tue, 15 Apr 2025 22:56:00 +0000 (UTC)
Date: Wed, 16 Apr 2025 06:55:51 +0800
From: Baoquan He <bhe@redhat.com>
To: Uladzislau Rezki <urezki@gmail.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] mm/vmalloc.c: code cleanup and improvements
Message-ID: <Z/7j9yKX6yJ/Axd9@MiWiFi-R3L-srv>
References: <20250415023952.27850-1-bhe@redhat.com>
 <Z_57RKPhHm24kMRu@pc636>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_57RKPhHm24kMRu@pc636>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

On 04/15/25 at 05:29pm, Uladzislau Rezki wrote:
> On Tue, Apr 15, 2025 at 10:39:47AM +0800, Baoquan He wrote:
> > These were made from code inspection in mm/vmalloc.c.
> > 
> > Baoquan He (5):
> >   mm/vmalloc.c: change purge_ndoes as local static variable
> >   mm/vmalloc.c: find the vmap of vmap_nodes in reverse order
> >   mm/vmalloc.c: optimize code in decay_va_pool_node() a little bit
> >   mm/vmalloc: optimize function vm_unmap_aliases()
> >   mm/vmalloc.c: return explicit error value in alloc_vmap_area()
> > 
> >  mm/vmalloc.c | 68 +++++++++++++++++++++++++---------------------------
> >  1 file changed, 32 insertions(+), 36 deletions(-)
> > 
> > -- 
> > 2.41.0
> > 
> I have review some patches, the rest i will check tomorrow!

Thanks a lot for your quick and careful reviewing.

