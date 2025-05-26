Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91671F37D4
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 15:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748274585; cv=none; b=DOSgkkpsMVS8LXZr+TRvFOHfijBUCxw2tV0SCMBFwjvbUzYcibDfKXDmb+yCUG3386y0GA5PrkXkpoeSoELzGREKHy7ciZo9Pk5JtUyh8DpcOoeErn4h/FnmFs/oLfIZy2RTy5rET+mw4WBzic7zGAyDigoPAnoeNmVw1bD4iCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748274585; c=relaxed/simple;
	bh=esfR/7E9RzNnrtv3HQf3a0vNmNHimAlYwcMIVFZe6Z4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P+Wi3sXQWI86cqgirsuTpj3XaLCi5dNB78HSPTbYlBzyrXN4xHCfu8Lh4wCkzOXhgkPWHNJ/3TlzQwlwNxc5V5WbSGCRUXI+ZVjzrg7DRUdq5/X4XTUtHGUvttIsVQH2JFlv0ieGkSYVYEPbYx74PBqE1PXOlt0zRsafHPDK8wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cOjbiuJB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cOjbiuJB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748274582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=71sBxG+HNn06KJZZiyUhTeRS7hpVP19g02Rul7ZiNbM=;
	b=cOjbiuJBrWvwGE9OSta8UhBPt6YZTqeG4kSR0Tpolfr5dRzOYrn46tB2Yg34VYAMRZxZvI
	8ZFtt4EwfIXdqtRWygLubzfTihWXk4Vzkt3blKbns8N7rvZz584t4USdwcJBvBUSXtokvs
	M/GbGuTG3DmHzAC11oG6HpU72E3depk=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-156-YiTpz-tYOrCvnBpakVAylA-1; Mon,
 26 May 2025 11:49:41 -0400
X-MC-Unique: YiTpz-tYOrCvnBpakVAylA-1
X-Mimecast-MFC-AGG-ID: YiTpz-tYOrCvnBpakVAylA_1748274579
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5130B19560B5;
	Mon, 26 May 2025 15:49:38 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.44.32.4])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 0FE69195608D;
	Mon, 26 May 2025 15:49:32 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Mon, 26 May 2025 17:48:57 +0200 (CEST)
Date: Mon, 26 May 2025 17:48:51 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: David Hildenbrand <david@redhat.com>, lorenzo.stoakes@oracle.com,
	mhiramat@kernel.org, peterz@infradead.org, Liam.Howlett@oracle.com,
	akpm@linux-foundation.org, vbabka@suse.cz, jannh@google.com,
	pfalcato@suse.de, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	pulehui@huawei.com
Subject: Re: [RFC PATCH] mm/mmap: Fix uprobe anon page be overwritten when
 expanding vma during mremap
Message-ID: <20250526154850.GA4156@redhat.com>
References: <20250521092503.3116340-1-pulehui@huaweicloud.com>
 <62b5ccf5-f1cd-43c2-b0bc-f542f40c5bdf@redhat.com>
 <afe53868-5542-47d6-8005-71c1b3bec840@huaweicloud.com>
 <13c5fe73-9e11-4465-b401-fc96a22dc5d1@redhat.com>
 <4cbc1e43-ea46-44de-9e2b-1c62dcd2b6d5@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4cbc1e43-ea46-44de-9e2b-1c62dcd2b6d5@huaweicloud.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Hi Lehui,

As I said, I don't understand mm/, so can't comment, but...

On 05/26, Pu Lehui wrote:
>
> To make things simpler, perhaps we could try post-processing, that is:
>
> diff --git a/mm/mremap.c b/mm/mremap.c
> index 83e359754961..46a757fd26dc 100644
> --- a/mm/mremap.c
> +++ b/mm/mremap.c
> @@ -240,6 +240,11 @@ static int move_ptes(struct pagetable_move_control
> *pmc,
>                 if (pte_none(ptep_get(old_pte)))
>                         continue;
>
> +               /* skip move pte when expanded range has uprobe */
> +               if (unlikely(pte_present(*new_pte) &&
> +                            vma_has_uprobes(pmc->new, new_addr, new_addr +
> PAGE_SIZE)))
> +                       continue;
> +

I was thinking about

	WARN_ON(!pte_none(*new_pte))

at the start of the main loop.

Obviously not to fix the problem, but rather to make it more explicit.

This matches the similar xxx_none() checks in the move_pgt_entry() paths,
say, move_normal_pmd().

Oleg.

