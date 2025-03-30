Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D045372
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 22:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743374922; cv=none; b=rjyLIBlOX0cO3T5Nqg3fPEXf6Vn2gSTYA/PyJzMpsp/3Il9UE46S5dmxQYo69RDkpLNmwhtGzh77uaMmOa0WswoMiS/J7UrBWFj3rZf3UeprThuaSuHAhmO+JHCXJJ6zrJpPIEmA3oLvckpE086rfvv2hy9dVH3zZGQhOjSAm8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743374922; c=relaxed/simple;
	bh=GSHeV4GY8F3a3OyADkzs4ALyj2vGncolbX3UZuA82l0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NC17/sGBPpKlzquYdF7XUPZtevXz7DBdQraYRp9ZsisgXWbfF9+UVDydaAnbX7uP0I/IeTKe7HUXIWau/wSilmft8XVP+NqqdXNcSL80Uw1xVikhSifcTnGSbsdfb+ANlbalU3/meDX11AhCoXTnQu8KQw1/A52hC7xDLWUddFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rk728Yr5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rk728Yr5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743374919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YaJlaf98rhHCe11ajjzq1I4HYhbgpsC1gCyoPzQ+l9s=;
	b=Rk728Yr5MfiUoXQrNGp+gzuxi/5PMoKkIHMNTNWPGMNgjQ6IMWm7hYH4m51BaBQkLnSnIH
	uiKfB/Fsz7oI1l2gQ3UOm7nbyDQrP0zbf3nuOmIlEURlx8qolSBNhkuSDVxjMY63kj6Nbh
	5W7M1FrJa8rMLce2GTkDrgZTZ162E5s=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-159-fp7hAXMIOdKJNJnbrze05A-1; Sun,
 30 Mar 2025 18:48:37 -0400
X-MC-Unique: fp7hAXMIOdKJNJnbrze05A-1
X-Mimecast-MFC-AGG-ID: fp7hAXMIOdKJNJnbrze05A_1743374916
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 91D9E19560AA;
	Sun, 30 Mar 2025 22:48:36 +0000 (UTC)
Received: from localhost (unknown [10.72.112.9])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 38301180B492;
	Sun, 30 Mar 2025 22:48:34 +0000 (UTC)
Date: Mon, 31 Mar 2025 06:48:25 +0800
From: Baoquan He <bhe@redhat.com>
To: Zhu Yanjun <yanjun.zhu@linux.dev>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] mm/gup: fix wrongly calculated returned value in
 fault_in_safe_writeable()
Message-ID: <Z+nKOYxiTWGNI9FQ@MiWiFi-R3L-srv>
References: <20250330121718.175815-1-bhe@redhat.com>
 <20250330121718.175815-2-bhe@redhat.com>
 <bb3d749f-c82f-4ba8-b1d2-10a38efb6199@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bb3d749f-c82f-4ba8-b1d2-10a38efb6199@linux.dev>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On 03/30/25 at 09:43pm, Zhu Yanjun wrote:
> 在 2025/3/30 14:17, Baoquan He 写道:
> > Not like fault_in_writeable() or fault_in_writeable(), in
>                                    fault_in_readable()?
> 
> In the above, one of the 2 fault_in_writeable should be fault_in_readable()
> ?

You are right, I will fix it in v2. Thanks.

> > fault_in_safe_writeable() local variable 'start' is increased page
> > by page to loop till the whole address range is handled. However,
> > it mistakenly calcalates the size of handled range with 'uaddr - start'.
> > 
> > Fix it here.
> > 
> > Signed-off-by: Baoquan He <bhe@redhat.com>
> > ---
> >   mm/gup.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/mm/gup.c b/mm/gup.c
> > index 855ab860f88b..73777b1de679 100644
> > --- a/mm/gup.c
> > +++ b/mm/gup.c
> > @@ -2207,8 +2207,8 @@ size_t fault_in_safe_writeable(const char __user *uaddr, size_t size)
> >   	} while (start != end);
> >   	mmap_read_unlock(mm);
> > -	if (size > (unsigned long)uaddr - start)
> > -		return size - ((unsigned long)uaddr - start);
> > +	if (size > start - (unsigned long)uaddr)
> > +		return size - (start - (unsigned long)uaddr);
> >   	return 0;
> >   }
> >   EXPORT_SYMBOL(fault_in_safe_writeable);
> 
> 

