Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A774B5AE
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 14:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744725919; cv=none; b=NXWRKpUhc5yoP62Ay23DBgLrHyQrQwbRaRMncvfeA5avmSozF8cCUziDeaHWbxiJ/NjAGDoBzBy7hhyyEgQXU7mUZGwHb5IENrLy+JrJReUkV2lGW0iYv0bU/d3ay+DOsNBYT2Rq1K2yN/hmK6/YmerT2VWYY7psaqsFLNfBJGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744725919; c=relaxed/simple;
	bh=rPq5FTY62Yk7GSsZIWl21owuCrohPT+iEs6WbpfaQjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uptbdybrcOC9Dnz3yGMsSjMCvlDhkQROy7u3oSW75xBaCFQCIsj2ZgCTSTjY6Z+LgpILjWRKbIA8EtZe8DWGnyQWN4scWeskYLpV+fG6s9Vf3JvBWtFuCYh0YMQkgsuDcx/DMJvk071eUOsfBTHNg4Is0vbTWsVs+qkeGd/4AWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BAOuxkb/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BAOuxkb/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744725914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DVw/fwmCgYx0Cg7SwmCqrTiKS8xbFPLobA4N74IFy5Y=;
	b=BAOuxkb/w6ZmS/IlwkoKYqRYzG067b9I6rC9yoPWq5fs0o0UU179QPMnSHmBLsx9pyOmvY
	m9uaGRFVE7QFA56P+zec5aHRAVgYomu+Y+hVDFpToaiiGkKjI4NQjyRmZlHiTTRfMnWtP1
	zcMH1zMGo2760PJaKS4sZvOyfE2rPW4=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-631-swZpw0o_NTCWVJGUWN06wQ-1; Tue,
 15 Apr 2025 10:05:11 -0400
X-MC-Unique: swZpw0o_NTCWVJGUWN06wQ-1
X-Mimecast-MFC-AGG-ID: swZpw0o_NTCWVJGUWN06wQ_1744725909
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9B4431955D80;
	Tue, 15 Apr 2025 14:05:09 +0000 (UTC)
Received: from localhost (unknown [10.72.112.38])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 664B4180B491;
	Tue, 15 Apr 2025 14:05:08 +0000 (UTC)
Date: Tue, 15 Apr 2025 22:05:04 +0800
From: Baoquan He <bhe@redhat.com>
To: Shivank Garg <shivankg@amd.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, urezki@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] mm/vmalloc.c: optimize code in decay_va_pool_node()
 a little bit
Message-ID: <Z/5nkPp3dlZYx2ls@fedora>
References: <20250415023952.27850-1-bhe@redhat.com>
 <20250415023952.27850-4-bhe@redhat.com>
 <8d83441f-9f67-4094-81b6-70cd5db88acb@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d83441f-9f67-4094-81b6-70cd5db88acb@amd.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On 04/15/25 at 03:59pm, Shivank Garg wrote:
> On 4/15/2025 8:09 AM, Baoquan He wrote:
> > When purge lazily freed vmap areas, VA stored in vn->pool[] will also be
> > taken away into free vmap tree partially or completely accordingly, that
> > is done in decay_va_pool_node(). When doing that, for each pool of node,
> > the whole list is detached from the pool for handling. At this time,
> > that pool is empty. It's not necessary to update the pool size each time
> > when one VA is removed and addded into free vmap tree.
> > 
> > Here change code to update the pool size when attaching the pool back.
> > 
> > Signed-off-by: Baoquan He <bhe@redhat.com>
> > ---
> >  mm/vmalloc.c | 23 +++++++++++------------
> >  1 file changed, 11 insertions(+), 12 deletions(-)
> > 
> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index 488d69b56765..bf735c890878 100644
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -2150,7 +2150,7 @@ decay_va_pool_node(struct vmap_node *vn, bool full_decay)
> >  	LIST_HEAD(decay_list);
> >  	struct rb_root decay_root = RB_ROOT;
> >  	struct vmap_area *va, *nva;
> > -	unsigned long n_decay;
> > +	unsigned long n_decay, len;
> >  	int i;
> >  
> >  	for (i = 0; i < MAX_VA_SIZE_PAGES; i++) {
> > @@ -2164,22 +2164,20 @@ decay_va_pool_node(struct vmap_node *vn, bool full_decay)
> >  		list_replace_init(&vn->pool[i].head, &tmp_list);
> >  		spin_unlock(&vn->pool_lock);
> >  
> > -		if (full_decay)
> > -			WRITE_ONCE(vn->pool[i].len, 0);
> > +		len = n_decay = vn->pool[i].len;
> > +		WRITE_ONCE(vn->pool[i].len, 0);
> >  
> >  		/* Decay a pool by ~25% out of left objects. */
> > -		n_decay = vn->pool[i].len >> 2;
> > +		if (!full_decay)
> > +			n_decay >>= 2;
> > +		len -= n_decay;
> >  
> >  		list_for_each_entry_safe(va, nva, &tmp_list, list) {
> > +			if (!n_decay)
> > +				break;
> >  			list_del_init(&va->list);
> >  			merge_or_add_vmap_area(va, &decay_root, &decay_list);
> > -
> > -			if (!full_decay) {
> > -				WRITE_ONCE(vn->pool[i].len, vn->pool[i].len - 1);
> > -
> > -				if (!--n_decay)
> > -					break;
> > -			}
> > +			n_decay--;
> >  		}
> >  
> >  		/*
> > @@ -2188,9 +2186,10 @@ decay_va_pool_node(struct vmap_node *vn, bool full_decay)
> >  		 * can populate the pool therefore a simple list replace
> >  		 * operation takes place here.
> >  		 */
> > -		if (!full_decay && !list_empty(&tmp_list)) {
> > +		if (!list_empty(&tmp_list)) {
> >  			spin_lock(&vn->pool_lock);
> >  			list_replace_init(&tmp_list, &vn->pool[i].head);
> > +			vn->pool[i].len = len;
> 
> Current logic uses WRITE_ONCE() to update vn->pool[i].len.
> Could this lead to consistency issues?

Seems no necessary to use WRITE_ONCE(). I can change back to use
WRITE_ONCE() just in case. Currently, it's only updated in
node_alloc(), decay_va_pool_node(), purge_vmap_node(). And the latter
two are inside vmap_purge_lock area.

> 
> >  			spin_unlock(&vn->pool_lock);
> >  		}
> >  	}
> 

