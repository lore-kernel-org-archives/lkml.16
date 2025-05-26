Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D1723D2A0
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 16:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748277038; cv=none; b=F6TEQpOU3jr3WDdIbq8QxUhxsdilvg7+AQA++eAhbO48nCgMHXuRAN2KD+mJ78WVlGxcjxSBXFs6Vzk76hwd2gxpLXeK49UaplO9tDvdEbbIXk2ml/blQrD/ROaMwtq2gZb5tyzbkONBl6yJg6hX76JGKAQQezpUqCVhKZZNLhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748277038; c=relaxed/simple;
	bh=NBvrMK19KSp/CiSx2kvd5/A5fAYRmLTfpOnBN4783vc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ctjvFld7vjgN/l9yJ54TaYVz6E2pV770pWzrRw/2+3RI8t0Xi+G7wsoLnjqg1/IZuJ+52hW3PUojl3GQGYj+fBN2lOcKr4H9t/D+CzHSa5SDUtgBt8hlRT8y2xmOeb7uFRsY5SlBTCulqzrvo/QuebHZ8GtVzXcJLy22yIvKyNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MNpbybb4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MNpbybb4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748277036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NBvrMK19KSp/CiSx2kvd5/A5fAYRmLTfpOnBN4783vc=;
	b=MNpbybb4jHRsvWj3kocxyCzgFKe0Scb2T9zrDIVYX22s+3gG+b18Ly+hD2Fx/rrfDcwW3e
	r0NOfERiExOTjSA+U2UooqmqOMEJCkvBko2pygrJj4giuBYpVAAQAma1Em7yUlbFSQoVTG
	oxkBdkM+E4hYTx3vq7d2XCxiOW4rcPk=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-388-nUvMjtZ7PB6awxYb-O0jmQ-1; Mon,
 26 May 2025 12:30:31 -0400
X-MC-Unique: nUvMjtZ7PB6awxYb-O0jmQ-1
X-Mimecast-MFC-AGG-ID: nUvMjtZ7PB6awxYb-O0jmQ_1748277029
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EE5C51800570;
	Mon, 26 May 2025 16:30:28 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.44.32.4])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 41B4B19560A3;
	Mon, 26 May 2025 16:30:22 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Mon, 26 May 2025 18:29:48 +0200 (CEST)
Date: Mon, 26 May 2025 18:29:41 +0200
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
Message-ID: <20250526162940.GB4156@redhat.com>
References: <20250521092503.3116340-1-pulehui@huaweicloud.com>
 <20250524164516.GA11642@redhat.com>
 <e8a679eb-e40c-481d-b65a-d16f9e66c19a@redhat.com>
 <20250525095926.GA5391@redhat.com>
 <e6b657c6-98b9-4690-9a26-27db0fa7c794@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6b657c6-98b9-4690-9a26-27db0fa7c794@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

On 05/25, David Hildenbrand wrote:
>
> On 25.05.25 11:59, Oleg Nesterov wrote:
> >
> >OK. But do you see any reason why uprobe_mmap() should be ever called during
> >mremap() ?
>
> Only when growing a VMA: we might now cover a part with a uprobe, which we
> have take care of.

Ah, indeed, thank you...

But. What if mremap() expands and moves a VMA? it seems to me that in
this case uprobe_mmap() won't be called? I'll try to make the test-case
to check...

Oleg.

