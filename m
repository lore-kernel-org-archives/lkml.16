Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD8D15278E
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 10:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748167227; cv=none; b=F7UvpdBYAkRprYEKK2nvS5VoueMhCRmPiZEg4gNJfh+3JaW3U3o2lIrPC8tC7dBlkSVM2RJtztibQDRFNvYZ+7ZD2gHZqhv+r/wg/41aLfDi1gBDNqNegJc+Wu0k649OYDR9NOrdjhe655IATpRGCOzlhCyXYC4rF8rOQZ2Nm7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748167227; c=relaxed/simple;
	bh=cx8Hk+YhW0dcI/wiCkLp/Kgb7M9NuEEhLnAN+AwvZqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B/Kxi0c1pfpFm2kD2riyfg/+7V3eIxVK34HgjcAgnLmFdcDR7AXF4i5oFzLr+a/0iqbmjpQV17t6wPp+2phhfiO7FvqnjCEHOCzqGMH3/kt/G3JgJq7TL9TgIKt6SVvrAUG24lBwdRCeuJhjXBUS5MbWZoBc0VWlTBb+ykdtqmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JMAMDw2u; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JMAMDw2u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748167224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cx8Hk+YhW0dcI/wiCkLp/Kgb7M9NuEEhLnAN+AwvZqA=;
	b=JMAMDw2uRCYJKTvuDG+ICMAzYykENDAwqvA1p3H4/Yz6gbhBuVd9uSYEKY6m5PucufU62M
	0HuTNHvEyxRB7/6k9beEGE3nTkD5NUv2+5amKPQhF//dkC/3HGrchgfOai98YcTihW1QF4
	CMoPxZLylpTXjKIxidwAErPQacbTvuc=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-411-NAkunapPOTuADtSfAGyKcA-1; Sun,
 25 May 2025 06:00:18 -0400
X-MC-Unique: NAkunapPOTuADtSfAGyKcA-1
X-Mimecast-MFC-AGG-ID: NAkunapPOTuADtSfAGyKcA_1748167216
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D07781800446;
	Sun, 25 May 2025 10:00:15 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.44.32.4])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 095E419560AF;
	Sun, 25 May 2025 10:00:09 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Sun, 25 May 2025 11:59:35 +0200 (CEST)
Date: Sun, 25 May 2025 11:59:27 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: Pu Lehui <pulehui@huaweicloud.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, mhiramat@kernel.org,
	peterz@infradead.org, akpm@linux-foundation.org,
	Liam.Howlett@oracle.com, vbabka@suse.cz, jannh@google.com,
	pfalcato@suse.de, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	pulehui@huawei.com, Andrii Nakryiko <andrii@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>
Subject: Re: [RFC PATCH] mm/mmap: Fix uprobe anon page be overwritten when
 expanding vma during mremap
Message-ID: <20250525095926.GA5391@redhat.com>
References: <20250521092503.3116340-1-pulehui@huaweicloud.com>
 <20250524164516.GA11642@redhat.com>
 <e8a679eb-e40c-481d-b65a-d16f9e66c19a@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8a679eb-e40c-481d-b65a-d16f9e66c19a@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

On 05/24, David Hildenbrand wrote:
>
> On 24.05.25 18:45, Oleg Nesterov wrote:
> >
> >To be honest, I can't even understand this part due to my ignorance.
> >What does "the old uprobe anon page to be orphan" actually mean?
> >How can the unnecessary uprobe_mmap() lead to an "unbalanced"
> >inc_mm_counter(MM_ANONPAGES) ? Or what else can explain the
> >"BUG: Bad rss-counter state" from check_mm() ? Or there are more problems?
>
> Essentially, we end up mapping an anonymous page (when install the uprobe)
> after preparing the new VMA, but before moving over the pages from the old
> VMA.
>
> So when we then move over the pages from the old VMA, we overwrite the PTE
> mapping an anonymous page (due to uprobe).
>
> As we simply overwrite the PTE that is mapping an anonymous page, we run
> into inconsistency later: RSS counter mismatch, memory leak, etc.

Ah, I seem to start understand... move_ptes() doesn't even check *new_pte,
I guess it assumes pte_none(ptep_get(new_pte), right? So the old anonymous
page is simply leaked after set_pte_at(mm, new_addr, new_pte, pte)...

Correct?

> We should never be installing an anonymous page (due to uprobe) into a VMA
> during mremap() before moving over the pages from the old VMA.

OK. But do you see any reason why uprobe_mmap() should be ever called during
mremap() ? not to mention munmap() ...

Thanks!

Oleg.

