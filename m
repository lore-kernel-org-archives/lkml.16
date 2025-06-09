Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E491A227E9F
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 23:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749511088; cv=none; b=U2ddU5GPjerQVqqYPkIuC8oNyEbS3UHZu06+sxC9tyFHBQ5/bzOfo5hb9s1CnwzwwVmT9ghadCKwUjTCv9VSw5SBJ4TbYpSOzyoyJShcF21j+Zw2jLuIjs3vOLyIv7PWl4TmEqCDkKXVer/jvDNUKKE1ObqghmwaTW3eB2K3jyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749511088; c=relaxed/simple;
	bh=P3TK6Mheq9+1g52vTnQ2PzMWOScHLrwQd6e8pvQxArI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pBl1D8t+MJbYJOrrIEbYPlddc6Ob0R4vWn7fRvz37vhZBpMpSGcQidpwxNh0XlmLFSQWJisukofHXlDZ3wTYxgQufqqQOafoSLDy1R+ijPp77mVQSMKsuv1REkJd1p4xeXYy1yKMtaReS0c5HjuWfJtXMmLoIexnBSv/m1ZTYik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=erAZZhA/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="erAZZhA/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749511085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ijZeolarUTtqmy4GxxtNrTYwrNFMDVmIVcgrPMPb5JU=;
	b=erAZZhA/I+aZsO5E4aXQCdOK3oVh3+d7K/QLEbNcW+X4cHYNsY5SmUI+y9fh4IIMbPuJAj
	g01852yoLKug6JIN3gN9KumMNzFGnSR0wICVEcjRDolc21lt56oHnSEx8pWllYd7M08/ky
	6NKGQo8e4NhRns3cXC7rmudUYbifrbg=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-439-l06piRltPdW19Y3G1SVI6g-1; Mon,
 09 Jun 2025 19:18:03 -0400
X-MC-Unique: l06piRltPdW19Y3G1SVI6g-1
X-Mimecast-MFC-AGG-ID: l06piRltPdW19Y3G1SVI6g_1749511082
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E686A19560AD;
	Mon,  9 Jun 2025 23:18:01 +0000 (UTC)
Received: from localhost (unknown [10.72.112.181])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 84FDF19560A3;
	Mon,  9 Jun 2025 23:17:59 +0000 (UTC)
Date: Tue, 10 Jun 2025 07:17:55 +0800
From: Baoquan He <bhe@redhat.com>
To: Alexander Graf <graf@amazon.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	nh-open-source@amazon.com,
	Zhongkun He <hezhongkun.hzk@bytedance.com>, Bcc: bhe@redhat.com;
Subject: Re: [PATCH v4] kexec: Enable CMA based contiguous allocation
Message-ID: <aEdroxwd/TOyxxIr@MiWiFi-R3L-srv>
References: <20250521152934.48841-1-graf@amazon.com>
 <f609d5a0-99d5-4328-8a18-00f6a9e1a48c@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f609d5a0-99d5-4328-8a18-00f6a9e1a48c@amazon.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

On 06/09/25 at 09:03am, Alexander Graf wrote:
> 
> On 21.05.25 17:29, Alexander Graf wrote:
...... 
> > Using CMA allocations has two advantages:
> > 
> >    1) Faster by 4-50 ms per 100 MiB. There is no more need to copy in the
> >       hot phase.
> >    2) More robust. Even if by accident some page is still in use for DMA,
> >       the new kernel image will be safe from that access because it resides
> >       in a memory region that is considered allocated in the old kernel and
> >       has a chance to reinitialize that component.
> > 
> > Signed-off-by: Alexander Graf <graf@amazon.com>
> 
> 
> Ping? Not seeing this patch in Linus' master tree :)

I saw Andrew had added this to his mm-nonmem-unstable, it could be
dropped later because of new version posting.

I would like to ACK this patch, let's see how it's going. One thing is
if IOMMU is on, the devices of no .shutdown method could still be on
flight and look up the IO page table and corrupt kernel, that's another
story. 

Acked-by: Baoquan He <bhe@redhat.com>

