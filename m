Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7F9156677
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 14:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743518090; cv=none; b=Ig2LLkQUOlrqFve9DYVAVXQU2DB8u74Z0qxGgFpKe5JMaRricv3PAKzGzlf9DtUdUfVuZ/q5o+LIJ/1m8G2rXDfbiFwhacXNyl2juqZew26B/vgj76bV5xKGpowKIbzUD0Y5njqiBR0G0YSCOWcP/od0LMnHLXTyhfMOhbdVqZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743518090; c=relaxed/simple;
	bh=+oVMCTnKGGB1IvnXZTphKRV0saQlY6sd9zIB39VDNio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q6qKcX/ctXckx6sIjuc4/K5mQoMULOqesK1+nBL4C2H9VAcnTkZgWbfxRXhPhufk3EKURRfW1brj+DLCzRmxrqBmeSEkB3ozQsm3GW8tzcRrdU70iwmz4juPxIc5wq4CTF/JjD7czCEcGb33o0VkdNOq6n8WXbfGRdMtjnPq9JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QxSZhWMO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QxSZhWMO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743518087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KQr7Spkn5jgMIpaUUK0pwqzc54g+Diw9wD954oFdkTg=;
	b=QxSZhWMOlOWJGMK5ay+wejSn212N/tBeJJFJKlgCtxDKPk5byjEQ30dStu3Rao2HUALQvQ
	e1MKxVDBRKxPwiP/jzPyaE8NzmFvE8EN39/QZ01SHum3MMQ6GBSLlFzuZN7ivCGiXzVSVX
	+XM8xVHKLVI+6mvovjMm4wColAYV26c=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-654-aSxuQ6FfNIm2jgE3tKnyzQ-1; Tue,
 01 Apr 2025 10:34:46 -0400
X-MC-Unique: aSxuQ6FfNIm2jgE3tKnyzQ-1
X-Mimecast-MFC-AGG-ID: aSxuQ6FfNIm2jgE3tKnyzQ_1743518085
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EBFA718001FC;
	Tue,  1 Apr 2025 14:34:44 +0000 (UTC)
Received: from localhost (unknown [10.72.112.12])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 90425195DF83;
	Tue,  1 Apr 2025 14:34:42 +0000 (UTC)
Date: Tue, 1 Apr 2025 22:34:38 +0800
From: Baoquan He <bhe@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, yanjun.zhu@linux.dev
Subject: Re: [PATCH v2 2/7] mm/gup: check if both GUP_GET and GUP_PIN are set
 in __get_user_pages() earlier
Message-ID: <Z+v5fguHjl5DiaZm@MiWiFi-R3L-srv>
References: <20250331081327.256412-1-bhe@redhat.com>
 <20250331081327.256412-3-bhe@redhat.com>
 <e6b8481f-0bf6-4acf-9ebc-9b4f28c0be08@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6b8481f-0bf6-4acf-9ebc-9b4f28c0be08@redhat.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On 04/01/25 at 10:02am, David Hildenbrand wrote:
> On 31.03.25 10:13, Baoquan He wrote:
> > In __get_user_pages(), it will traverse page table and take a reference
> > to the page the given user address corresponds to if GUP_GET or GUP_PIN
> > is et. However, it's not supported both GUP_GET and GUP_PIN are set.
> > This check should be done earlier, but not doing it till entering into
> > follow_page_pte() and failed.
> > 
> > Here move the checking to the beginning of __get_user_pages().
> > 
> > Signed-off-by: Baoquan He <bhe@redhat.com>
> > ---
> > v1->v2:
> > - Fix code bug caused by copy-and-paste error, this is reported by
> >    lkp test robot.
> > 
> >   mm/gup.c | 10 +++++-----
> >   1 file changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/mm/gup.c b/mm/gup.c
> > index 73777b1de679..f9bce14ed3cd 100644
> > --- a/mm/gup.c
> > +++ b/mm/gup.c
> > @@ -847,11 +847,6 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
> >   	pte_t *ptep, pte;
> >   	int ret;
> > -	/* FOLL_GET and FOLL_PIN are mutually exclusive. */
> > -	if (WARN_ON_ONCE((flags & (FOLL_PIN | FOLL_GET)) ==
> > -			 (FOLL_PIN | FOLL_GET)))
> > -		return ERR_PTR(-EINVAL);
> > -
> >   	ptep = pte_offset_map_lock(mm, pmd, address, &ptl);
> >   	if (!ptep)
> >   		return no_page_table(vma, flags, address);
> > @@ -1434,6 +1429,11 @@ static long __get_user_pages(struct mm_struct *mm,
> >   	VM_BUG_ON(!!pages != !!(gup_flags & (FOLL_GET | FOLL_PIN)));
> > +	/* FOLL_GET and FOLL_PIN are mutually exclusive. */
> > +	if (WARN_ON_ONCE((gup_flags & (FOLL_PIN | FOLL_GET)) ==
> > +			 (FOLL_PIN | FOLL_GET)))
> > +		return -EINVAL;
> > +
> 
> We already have that check in is_valid_gup_args(), that catches all external
> users that could possibly mess this up.

Right.

> 
> So we can just convert that into a VM_WARN_ON_ONCE(), and while doing that,
> we should convert the VM_BUG_ON() above to a VM_WARN_ON_ONCE() as well.

Sounds great to me, will put below change into this patch of v3 as suggested.
Thanks.

diff --git a/mm/gup.c b/mm/gup.c
index 9e4ed09c578b..d551da9549b1 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1427,10 +1427,10 @@ static long __get_user_pages(struct mm_struct *mm,
 
 	start = untagged_addr_remote(mm, start);
 
-	VM_BUG_ON(!!pages != !!(gup_flags & (FOLL_GET | FOLL_PIN)));
+	VM_WARN_ON_ONCE(!!pages != !!(gup_flags & (FOLL_GET | FOLL_PIN)));
 
 	/* FOLL_GET and FOLL_PIN are mutually exclusive. */
-	if (WARN_ON_ONCE((gup_flags & (FOLL_PIN | FOLL_GET)) ==
+	if (VM_WARN_ON_ONCE((gup_flags & (FOLL_PIN | FOLL_GET)) ==
 			 (FOLL_PIN | FOLL_GET)))
 		return -EINVAL;

