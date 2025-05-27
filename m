Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147A61E89C
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 17:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748366475; cv=none; b=ZaGqe+Xx5wLO7kM2y2mFlJ1i0oO9k0eErh5aQS2m26J6yOO3xjPNl2wr5cQyDFSQt8dAT+EGhIZCLXdeRFYKynNxCtt6y2DTiV3RAJhuVR5LKL3qXk8XJaNjfMqmhLEp5yAVqoak1NpA/ogaUjB7FeBtBJ3yQh+RxsRbGk9SKOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748366475; c=relaxed/simple;
	bh=rLoxYjgktHbpLuYm3OXYKwEcEpT2v2z0Dc9OOGELQok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bGFV1yHsflo63VBesChdTSBoQIfaDrN0K8758i1gvKOT4CDoSVBxYvbwfRDPyWtwmk6fsXl/nWUg8qaMjpfJ2yHWE+zHuYybdaj62ubUpBtRxlsY2JP8GWpHJufdO/ZKKtq8A0ov7A4a4WguH/kADG3YYdgy/xf9s+xYcIi//Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YK1TZjy8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YK1TZjy8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748366472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wNmQxhzq/FF3MG71l3pLSG1OCC7OzHf2ouNx32BNQ6Y=;
	b=YK1TZjy8bwtkMUaJzROwluOjgIQ46BA4rF97wfcEooeJlcZVqsd/LeB4ZiYPsWBgs6GWSF
	wXBwUpGXCMLQoIsxk2ITBk0bVX7idsTfh272uHRS6loDASkn1WxCe2z4JmWBuAk3JI888D
	IojO+1yMSgDwyCcM9DwMNqR5QIgA9QY=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-586-qxPJ_SE-NSeBdhZYWjxwsQ-1; Tue,
 27 May 2025 13:21:08 -0400
X-MC-Unique: qxPJ_SE-NSeBdhZYWjxwsQ-1
X-Mimecast-MFC-AGG-ID: qxPJ_SE-NSeBdhZYWjxwsQ_1748366466
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BED1119560BC;
	Tue, 27 May 2025 17:21:05 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.44.32.4])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 6BE851944A89;
	Tue, 27 May 2025 17:20:59 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Tue, 27 May 2025 19:20:25 +0200 (CEST)
Date: Tue, 27 May 2025 19:20:18 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: mhiramat@kernel.org, peterz@infradead.org, akpm@linux-foundation.org,
	Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
	jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, pulehui@huawei.com
Subject: Re: [RFC PATCH v2 1/2] mm/mremap: Fix uprobe anon page be
 overwritten when expanding vma during mremap
Message-ID: <20250527172018.GF8333@redhat.com>
References: <20250527132351.2050820-1-pulehui@huaweicloud.com>
 <20250527132351.2050820-2-pulehui@huaweicloud.com>
 <20250527142314.GA8333@redhat.com>
 <fcb3b061-ca4b-44d7-a9fc-ecd0713c3fda@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fcb3b061-ca4b-44d7-a9fc-ecd0713c3fda@huaweicloud.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Hi Lehui,

On 05/28, Pu Lehui wrote:
>
> On 2025/5/27 22:23, Oleg Nesterov wrote:
> >Well, I leave this to you / Lorenzo / David, but...
> >
> >On 05/27, Pu Lehui wrote:
> >>
> >>Fixes: 78a320542e6c ("uprobes: Change valid_vma() to demand VM_MAYEXEC rather than VM_EXEC")
> >
> >I don't think that commit could cause this problem.
>
> Hi Oleg,
>
> Me too! I was test that before and after commit 78a320542e6c, so call it the
> `directly related commit`.

I feel I am totally confused...

but _may be_ you have used the initial reproducer which used PROT_NONE in

	void *addr2 = mmap(NULL, 2 * 4096, PROT_NONE, MAP_PRIVATE, fd, 0);

?

If yes. I _think_ we should have the same problem with or without 78a320542e6c,
just you need to s/PROT_NONE/PROT_EXEC/.

> In fact, I think the issue was introduced in the
> original commit 2b1444983508 ("uprobes, mm, x86: Add the ability to install
> and remove uprobes breakpoints") # v3.5-rc1.

probably yes... Damn I don't know ;)

Oleg.

