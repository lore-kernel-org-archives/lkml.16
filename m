Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B6C2DFA36
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 23:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744760508; cv=none; b=cefzIqLdn1+kOs2MTxtt8SAF2D73pShBfTMMpLh7F8VGZ/Lh/ydeuoS4o+jcCAYhjnZO3z7FBjBwbexB6wIUX1GR9AlekqrdwpmuuDscsrrFK+rUk59z8OMHCNx+/slO1sFZHWCE8WJPj96isYfbnj52SOx3p3U82ZmwOnmgnsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744760508; c=relaxed/simple;
	bh=8iOaybz4lh7CVjrLSWP1+6uN1uHn2rPfgrnJm+wuOgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c1nk88IGzwj3YR/PeybFWzkDPrLENQ9u8arsdFqwNAsLOWBXPcgME5sxX9QpoSxytN0dNIQeiHZZSKwjEOWt5krvM9Zr2qwGQqR0hwEPbdLNjxmx7TQfogAXnjowNIrIXwjodC23CN9DUxrEZke1jZF8zH3J3o5u017jyWZxuR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NN2jNwkr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NN2jNwkr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744760505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cvgzNHXZT50bJulk6uZmAkTyNeKXSSJ3KJw3yi6lkN4=;
	b=NN2jNwkr476WyzGtSKmiUve3T0pwjrgPo32E8DPfqqlMyP9JDRaHGc1JpVIm2TWSNhTFbj
	YxyOX8gFX7IVFwHNjSw9ZBjQJDm9TXymum622x5nkTbVwgtjicH6+nGNJdFmLf0OrgzGN4
	PtDHOC9hDMD933UIBvHSUQIJVAHagNA=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-556-BGEJE8S6ON2Vm8eN0hLumg-1; Tue,
 15 Apr 2025 19:41:39 -0400
X-MC-Unique: BGEJE8S6ON2Vm8eN0hLumg-1
X-Mimecast-MFC-AGG-ID: BGEJE8S6ON2Vm8eN0hLumg_1744760499
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D410F19560B8;
	Tue, 15 Apr 2025 23:41:38 +0000 (UTC)
Received: from localhost (unknown [10.72.112.38])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A2DA2180B489;
	Tue, 15 Apr 2025 23:41:37 +0000 (UTC)
Date: Wed, 16 Apr 2025 07:41:33 +0800
From: Baoquan He <bhe@redhat.com>
To: Uladzislau Rezki <urezki@gmail.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] mm/vmalloc.c: find the vmap of vmap_nodes in reverse
 order
Message-ID: <Z/7urXUwO0sY3RQw@MiWiFi-R3L-srv>
References: <20250415023952.27850-1-bhe@redhat.com>
 <20250415023952.27850-3-bhe@redhat.com>
 <Z_56cxJLgnfYK9yY@pc636>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_56cxJLgnfYK9yY@pc636>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On 04/15/25 at 05:25pm, Uladzislau Rezki wrote:
> On Tue, Apr 15, 2025 at 10:39:49AM +0800, Baoquan He wrote:
> > When finding VA in vn->busy, if VA spans several zones and the passed
> > addr is not the same as va->va_start, we should scan the vn in reverse
> > odrdr because the starting address of VA must be smaller than the passed
> > addr if it really resides in the VA.
> > 
> > E.g on a system nr_vmap_nodes=100,
> > 
> >      <----va---->
> >  -|-----|-----|-----|-----|-----|-----|-----|-----|-----|-
> >     ...   n-1   n    n+1   n+2   ...   100     0     1
> > 
> > VA resides in node 'n' whereas it spans 'n', 'n+1' and 'n+2'. If passed
> > addr is within 'n+2', we should try nodes backwards on 'n+1' and 'n',
> > then succeed very soon.
> > 
> > Meanwhile we still need loop around because VA could spans node from 'n'
> > to node 100, node 0, node 1.
> > 
> > Anyway, changing to find in reverse order can improve efficiency on
> > many CPUs system.
> > 
> > Signed-off-by: Baoquan He <bhe@redhat.com>
> > ---
> >  mm/vmalloc.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index aca1905d3397..488d69b56765 100644
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -2436,7 +2436,7 @@ struct vmap_area *find_vmap_area(unsigned long addr)
> >  
> >  		if (va)
> >  			return va;
> > -	} while ((i = (i + 1) % nr_vmap_nodes) != j);
> > +	} while ((i = (i + nr_vmap_nodes - 1) % nr_vmap_nodes) != j);
> >  
> >  	return NULL;
> >  }
> > @@ -2462,7 +2462,7 @@ static struct vmap_area *find_unlink_vmap_area(unsigned long addr)
> >  
> >  		if (va)
> >  			return va;
> > -	} while ((i = (i + 1) % nr_vmap_nodes) != j);
> > +	} while ((i = (i + nr_vmap_nodes - 1) % nr_vmap_nodes) != j);
> >  
> >  	return NULL;
> >  }
> > -- 
> > 2.41.0
> > 
> It depends. Consider a below situation:
> 
>              addr
>               |
>         VA    V
>   <------------>
> <---|---|---|---|---|---|---|--->
>   0   1   2   3   0   1   2   3
> 
> basically it matters how big VA and how many nodes it spans. But i
> agree that an assumption to reverse back is more convinced in most
> cases.

Agree, on small system with few CPUs and big VA case, the advantage is
not apparent.

> 
> Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

Thanks.

