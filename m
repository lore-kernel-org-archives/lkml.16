Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCFC235065
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 16:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748623508; cv=none; b=ZWQUbhfbpQZGz655aUThp+a1mM+kTqV0kkpKBy8/KwrD4YiyxUwGUPQrAsJlVWGEkSVFuPDWAaZYKxLXvsVZn2vp1BQgUeUHmixU5vdMZZRwgwq4mpUMgaH2v1s38yQhd7jxUV+bZ9R4hfdAe2ssAGiubhk/3OCQBM2FB6EV9mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748623508; c=relaxed/simple;
	bh=UKEpceSp1AdCJrTKG4/wDs3+PUHkmw4/OcqerA3gUMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nwlF9vpkM1lMHwRbGMO2xj+WjcgLERB+6fcZN2FKE458h5sEJwGls2HLDJ8bnRZVn8xlQGARVwwqMYeI4u4JwftrNWQvyHoC0HR0narPwBd5trp2uKlRjVYiIZWoHYyuXPoYmph6TPMpFAFOWNvu7VBGJbrvdIrninkZH9hw1II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AFjIeFaC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AFjIeFaC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748623505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sE03iNOBKodbG+yUa8w4eDdllwosn3xeMgEa1GhZb9I=;
	b=AFjIeFaCfZfuR8AZBb2TM3AUyTxrCR02+KtuOwvxg1YKvgbL8rooqAy/EzyCqyw2WliMrZ
	ZLiSKHRvAcli1HRTpd888QceppgwB4zslwLo1k4db7qgQxn4ULsICJZD6hL7MH5eqSg8Wn
	GWvnKyivjQsEPaNq+7o6wX2Phd3U+vE=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-184-HIWAqgUIMFSaTG3M_w51aQ-1; Fri,
 30 May 2025 12:45:02 -0400
X-MC-Unique: HIWAqgUIMFSaTG3M_w51aQ-1
X-Mimecast-MFC-AGG-ID: HIWAqgUIMFSaTG3M_w51aQ_1748623500
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9C3B619560B1;
	Fri, 30 May 2025 16:44:59 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.224.37])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 6ECAC30001B7;
	Fri, 30 May 2025 16:44:53 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Fri, 30 May 2025 18:44:18 +0200 (CEST)
Date: Fri, 30 May 2025 18:44:11 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Pu Lehui <pulehui@huaweicloud.com>, mhiramat@kernel.org,
	peterz@infradead.org, akpm@linux-foundation.org,
	Liam.Howlett@oracle.com, vbabka@suse.cz, jannh@google.com,
	pfalcato@suse.de, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, pulehui@huawei.com
Subject: Re: [PATCH v1 2/4] mm: Expose abnormal new_pte during move_ptes
Message-ID: <20250530164411.GB25160@redhat.com>
References: <20250529155650.4017699-1-pulehui@huaweicloud.com>
 <20250529155650.4017699-3-pulehui@huaweicloud.com>
 <ed72c0c8-a511-483a-be44-edf7432a4782@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed72c0c8-a511-483a-be44-edf7432a4782@lucifer.local>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On 05/30, Lorenzo Stoakes wrote:
>
> > --- a/mm/mremap.c
> > +++ b/mm/mremap.c
> > @@ -237,6 +237,8 @@ static int move_ptes(struct pagetable_move_control *pmc,
> >
> >  	for (; old_addr < old_end; old_pte++, old_addr += PAGE_SIZE,
> >  				   new_pte++, new_addr += PAGE_SIZE) {
> > +		WARN_ON_ONCE(!pte_none(*new_pte));
> > +
>
> I mean, we really really should not ever be seeing a mapped PTE here, so I think
> a WARN_ON_ONCE() is fine.
>
> We unmap anything ahead of time, and only I think this uprobe breakpoint
> installation would ever cause this to be the case.
>
> We can make this a VM_WARN_ON_ONCE() too I suppose, just in case there's
> something we're not thinking of, but I'd say at some point we'd want to change
> it to a WARN_ON_ONCE().

Note also that move_normal_pmd/move_normal_pud use WARN_ON_ONCE(!xxx_none(...)),
not VM_WARN_ON_ONCE().

Oleg.

