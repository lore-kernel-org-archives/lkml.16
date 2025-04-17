Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71E517A2EB
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 02:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744858315; cv=none; b=R32zD9vPk0ufY4n0dM6Fvd07DLMCeR8Ck7OdIThQlL/zQM5GT3upYszYFDqE+0xyRKEYjr3lPjwG9btz4F0T7psTfurmTT4B/bA1/e3Dbt2V2yXW8zSi+x+Sgd6Q2texSb5E8kTUwG5uahjezCgU6If1MRqw7+W3+NZi1hDMxmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744858315; c=relaxed/simple;
	bh=HthTZrW1fFlDP7peSxbU7m3AZR6L8cuFXO9yDWb+kIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a7CIoGKNnve/fpz9+rE/PmO/Vg537uXyaJ+EBBFOb20Dikugdo6VQr/7xP2XOikjq36DtUFAami4TvwKKQjzqBkOrV5MweVZkztPDSG3r/zI6WAS4TG/A0LfrYdMJ6FYnRj8MQALtOt2zXWlZ48vZE+GdBLqIsXzWaTmioA0fB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L7P2CCYp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L7P2CCYp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744858312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ec8d2eZYYN3bmIE5DgcqPHjtkZ1mFIafiLgKn16k8Po=;
	b=L7P2CCYpITngDDfDX0cO0ddBq1jGLLhJRh1vSxZBsoQEhaYVdTXxJF/mrf5WntG0wGtGkh
	OZAc1kmGeZhydtnXS5u1+zpNppmRBy2oD92Pl5vIJH7WbJjfA5Zl/CGJ/+vHvTRUr+36Do
	Fmuor4HWG4snKlJN6j/yao58VGeK4LQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-167-xMZjQky3OMyOfkf1U10anw-1; Wed,
 16 Apr 2025 22:51:51 -0400
X-MC-Unique: xMZjQky3OMyOfkf1U10anw-1
X-Mimecast-MFC-AGG-ID: xMZjQky3OMyOfkf1U10anw_1744858310
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0B00C19560A1;
	Thu, 17 Apr 2025 02:51:50 +0000 (UTC)
Received: from localhost (unknown [10.72.112.38])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BFF6530001A1;
	Thu, 17 Apr 2025 02:51:48 +0000 (UTC)
Date: Thu, 17 Apr 2025 10:51:44 +0800
From: Baoquan He <bhe@redhat.com>
To: Uladzislau Rezki <urezki@gmail.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] mm/vmalloc.c: optimize code in decay_va_pool_node()
 a little bit
Message-ID: <aABswErLwX7o7OXa@MiWiFi-R3L-srv>
References: <20250415023952.27850-1-bhe@redhat.com>
 <20250415023952.27850-4-bhe@redhat.com>
 <Z_-1ozajrbaVLq6m@pc636>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_-1ozajrbaVLq6m@pc636>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On 04/16/25 at 03:50pm, Uladzislau Rezki wrote:
> On Tue, Apr 15, 2025 at 10:39:50AM +0800, Baoquan He wrote:
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
> >  			spin_unlock(&vn->pool_lock);
> >  		}
> >  	}
> > -- 
> > 2.41.0
> > 
> Which Linux version this patch is based on? I can not apply it.

I can apply them on the latest mainline kernel, next/master and
mm-new branch of akpm/mm.git. I checked just now.

> 
> Small nits:
> 
> <snip>
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index c909b8fea6eb..0ae53c997219 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -2150,7 +2150,7 @@ decay_va_pool_node(struct vmap_node *vn, bool full_decay)
>  	LIST_HEAD(decay_list);
>  	struct rb_root decay_root = RB_ROOT;
>  	struct vmap_area *va, *nva;
> -	unsigned long n_decay, len;
> +	unsigned long n_decay, pool_len;
>  	int i;
>  
>  	for (i = 0; i < MAX_VA_SIZE_PAGES; i++) {
> @@ -2164,21 +2164,20 @@ decay_va_pool_node(struct vmap_node *vn, bool full_decay)
>  		list_replace_init(&vn->pool[i].head, &tmp_list);
>  		spin_unlock(&vn->pool_lock);
>  
> -		len = n_decay = vn->pool[i].len;
> +		pool_len = n_decay = vn->pool[i].len;
>  		WRITE_ONCE(vn->pool[i].len, 0);
>  
>  		/* Decay a pool by ~25% out of left objects. */
>  		if (!full_decay)
>  			n_decay >>= 2;
> -		len -= n_decay;
> +		pool_len -= n_decay;
>  
>  		list_for_each_entry_safe(va, nva, &tmp_list, list) {
> -			if (!n_decay)
> +			if (!n_decay--)
>  				break;
>  
>  			list_del_init(&va->list);
>  			merge_or_add_vmap_area(va, &decay_root, &decay_list);
> -			n_decay--;
>  		}
>  
>  		/*
> @@ -2190,7 +2189,7 @@ decay_va_pool_node(struct vmap_node *vn, bool full_decay)
>  		if (!list_empty(&tmp_list)) {
>  			spin_lock(&vn->pool_lock);
>  			list_replace_init(&tmp_list, &vn->pool[i].head);
> -			vn->pool[i].len = len;
> +			vn->pool[i].len = pool_len;
>  			spin_unlock(&vn->pool_lock);
>  		}
>  	}
> <snip>
> 
> on top of this?
> 
> a) decay in "if" statement, no need extra line;
> b) rename len to something obvious - pool_len.

All look good, will add them to this patch 3 of v2. Thanks a lot.

