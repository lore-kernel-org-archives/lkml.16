Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266451A2396
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 18:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748628616; cv=none; b=syXj6eMtCSeafr44sfW1YIDu1Xr4qqImtJ+glGLUuDjyfvcYnJgRy3ebKh7INcY3LDyOsE+vqhNMY7hdhSRv767a8K2Uf0sbdImzBaEoAtTtBd6KjQY7fLTcQUgKJAO6ph+1h+Iz0fZQJ5QK1PMs2z4SNmwrQsG01+iPPE8TN/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748628616; c=relaxed/simple;
	bh=yRjJ2w6qFcNgcp0qJrYKU5VYAk4HCyqH+ZOe5vU0k6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=su3MWhGvYeii+/UhZeDtQRm8fgGat/jX/aJGycVbIfufN9wHqsL1Q9c3p0NDRrCVUDlbma0IBhOP/APMFahTkvVk+oTfb8kpeGiW1St1KparZMzuEp47WnrkPHcsIKgQujyxYDVbPW36Of7OYuFyuRM+Q/8Ctc2KTw74G1uUBC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bIxlQZj5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bIxlQZj5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748628613;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yRjJ2w6qFcNgcp0qJrYKU5VYAk4HCyqH+ZOe5vU0k6U=;
	b=bIxlQZj58q53MCBMiSont/0ry7BbQBQ4sEuTEcHD+Eve0iKxxJpJtDkAL7393KkL4a6FYM
	JzaMTE75KUzdwxp5e8tlliVpv+k8ntjIwqi4J+BeUJk236zEvKIS5s+rvR85yGJAkkMZim
	llBft72t62GZ72BN7zcK82xoNO82cr8=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-125-5txLKz2pPzi2D8PZTinHuA-1; Fri,
 30 May 2025 14:10:09 -0400
X-MC-Unique: 5txLKz2pPzi2D8PZTinHuA-1
X-Mimecast-MFC-AGG-ID: 5txLKz2pPzi2D8PZTinHuA_1748628608
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 231AF1956096;
	Fri, 30 May 2025 18:10:07 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.224.37])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 806B418001DA;
	Fri, 30 May 2025 18:10:02 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Fri, 30 May 2025 20:09:26 +0200 (CEST)
Date: Fri, 30 May 2025 20:09:20 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: Pu Lehui <pulehui@huaweicloud.com>, lorenzo.stoakes@oracle.com,
	mhiramat@kernel.org, peterz@infradead.org, Liam.Howlett@oracle.com,
	akpm@linux-foundation.org, vbabka@suse.cz, jannh@google.com,
	pfalcato@suse.de, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	pulehui@huawei.com
Subject: Re: [RFC PATCH] mm/mmap: Fix uprobe anon page be overwritten when
 expanding vma during mremap
Message-ID: <20250530180920.GC25160@redhat.com>
References: <62b5ccf5-f1cd-43c2-b0bc-f542f40c5bdf@redhat.com>
 <afe53868-5542-47d6-8005-71c1b3bec840@huaweicloud.com>
 <13c5fe73-9e11-4465-b401-fc96a22dc5d1@redhat.com>
 <4cbc1e43-ea46-44de-9e2b-1c62dcd2b6d5@huaweicloud.com>
 <20250526154850.GA4156@redhat.com>
 <06bd94c0-fefe-4bdc-8483-2d9b6703c3d6@redhat.com>
 <57533126-eb30-4b56-bc4d-2f27514ae5ad@huaweicloud.com>
 <cba0155e-d2b9-41fa-bc51-f3738ae73cff@redhat.com>
 <956124be-c73c-4023-9edd-25372f3f865a@huaweicloud.com>
 <ccf359b0-8baa-4209-b2c3-75e3813ca804@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ccf359b0-8baa-4209-b2c3-75e3813ca804@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Well, let me say this again ;) I can't really comment, I don't understand
this code enough.

That said...

On 05/30, David Hildenbrand wrote:
>
> I wonder if there might be a clean way to move the uprobe_mmap() out of
> vma_complete().

Me too.

Not only the uprobe_mmap() calls in vma_complete() doesn't look right
"in general" (at least to me).

To remind, vma_complete/uprobe_mmap/install_breakpoint is not even called
in, say, this case when VMA grows and moves. See
https://lore.kernel.org/all/20250526173845.GC4156@redhat.com/
I guess we don't really care, but still...


But just in case... I agree with Lehui and Lorenzo in that we need a short
term fix, and the last patch from Lehui seems to fix the immediate problem.

Oleg.

