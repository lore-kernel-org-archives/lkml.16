Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FE51F3D3F
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 10:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739268590; cv=none; b=dkRJvT7PdAX0ezrV3WQeho+MVNTHILVX1RjNvJwQNW/E0o/o1kpW4Eqv89V/AqmLsYNvD7/fujdIe8SUtWV5TAv5RCLGvRLIyl+meCYQSKbLOzY3Hue4ZUbgmgBAOKhk3w29pgKfS/64E3LwYe806zr8ITJYIts0Q5sZzeTUJg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739268590; c=relaxed/simple;
	bh=3SVaCUJpmBmyHpjbiiMclK0GKRb3ZxuXNR64+E4ChAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=umfzW55BmCdzVLuayp80EgXtqSSaATfqE7Ywx/uoB67uruL1ofEFk5rvR9AaCaIA3EWbRV6rPirXwZhchwMJB3TcLaSdNJYgE4VtPb7TT3iEgFSu6HmNaRnovLHByNa4wdHA5A89ZgTOm8Mz+72GO9xoDOCLL8Qn93sAnM1bYF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U40jKk+N; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U40jKk+N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739268587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vESXwtruJGbx+75bPYc0hWkP4ffIGUWG2LusBWyhBXg=;
	b=U40jKk+NvBH3O+SaM9gVPmR/UpncpTCnMi93yTfziNgh5Nr+CsH1tt/Gh/iW71K6nt7mEk
	jjnXnV5kwWsYAs1m6AgsBI4vZqMSViSegXTOsMdt1VmVO/sC36pobKo0CA2LQdpscdCNcy
	JmtkwNRSAMBz8A8sRX+WwPSp09rAVPI=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-686-Q0vgbHaEMyqFbqtab1GcOA-1; Tue,
 11 Feb 2025 05:09:44 -0500
X-MC-Unique: Q0vgbHaEMyqFbqtab1GcOA-1
X-Mimecast-MFC-AGG-ID: Q0vgbHaEMyqFbqtab1GcOA
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4E07B195608E;
	Tue, 11 Feb 2025 10:09:42 +0000 (UTC)
Received: from localhost (unknown [10.72.112.8])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 957DC19560A3;
	Tue, 11 Feb 2025 10:09:39 +0000 (UTC)
Date: Tue, 11 Feb 2025 18:09:36 +0800
From: Baoquan He <bhe@redhat.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, will@kernel.org,
	aneesh.kumar@kernel.org, npiggin@gmail.com, peterz@infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mm/mmu_gather: remove unused __tlb_remove_page()
Message-ID: <Z6sh4BydNRi9iarR@MiWiFi-R3L-srv>
References: <20250211034348.39531-1-bhe@redhat.com>
 <616b5fdd-0f15-485a-b5fd-cdd6d7fc9d45@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <616b5fdd-0f15-485a-b5fd-cdd6d7fc9d45@bytedance.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

On 02/11/25 at 03:45pm, Qi Zheng wrote:
> 
> 
> On 2025/2/11 11:43, Baoquan He wrote:
> > Nobody is using __tlb_remove_page() now, clean it up.
> > 
> > Signed-off-by: Baoquan He <bhe@redhat.com>
> > ---
> >   include/asm-generic/tlb.h | 6 ------
> >   1 file changed, 6 deletions(-)
> > 
> > diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
> > index e402aef79c93..9ae4ca02f29f 100644
> > --- a/include/asm-generic/tlb.h
> > +++ b/include/asm-generic/tlb.h
> > @@ -489,12 +489,6 @@ static inline void tlb_remove_page_size(struct mmu_gather *tlb,
> >   		tlb_flush_mmu(tlb);
> >   }
> > -static __always_inline bool __tlb_remove_page(struct mmu_gather *tlb,
> > -		struct page *page, bool delay_rmap)
> > -{
> > -	return __tlb_remove_page_size(tlb, page, delay_rmap, PAGE_SIZE);
> > -}
> > -
> >   /* tlb_remove_page
> >    *	Similar to __tlb_remove_page but will call tlb_flush_mmu() itself when
> 
>                    ^
>                    please update this too

Good catch, will remove the unneeded code comment. Thanks for reviewing.

> 
> Otherwise:
> 
> Reviewed-by: Qi Zheng <zhengqi.arch@bytedance.com>
> 
> >    *	required.
> 

