Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617F01C8639
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 14:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743516773; cv=none; b=c/Qui351dyNu75H/5IWcLDXJ8sh7HHtiM12o56JEv0XxHDuntxeAUMD53xuSqtdHToqKrY3LLOWy3EqPa608nMaIglqAGkYv2nfCaq27Oi6DUWXMsDyhUqWEiTzIlp46uOcm0hkRc6bfZdh2crjEv5bF+A4Hgl9VvcUL0QxnDvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743516773; c=relaxed/simple;
	bh=PodygEgxQnqzjaGcysLEMrWxFMjYpAGzBknFX2MJI3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FJLyKuUGx38xugbw8XNOgyEa3GLl9Ymd/VOagcDiumAB8/DL+/Y2bYhF0M64+rCi/0vogBhQkpbui2oIhg79A+GK9Lpg9yuhN14slx16pvqyDptzFAh62ZrldW1GlanQ6oaAu0pvHO9kXqlmQBbv9yD0k/x6ROmZr2Vg/5yqBQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Po5hOxFf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Po5hOxFf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743516771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KyD2voQ6zuHONU7Sh+hNY5XHjhTh/bMpnXzkNNLhsXA=;
	b=Po5hOxFfo2LR9tEd5O20/Ruge+hPQ6nLzbJ04r4FuUpPEvFHXw/68DTzexItyQw9vVyqVb
	o/oErS0ZJBTPl9lPLMAw5GSXLz/c8ZBGLfOU421Ka0u1IVH/Ttnw0D7PIu6XoPUoTKO8JE
	hXpCUKJ9Fg+yuL61r0MOiSsPe/Drbog=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-149-uBatfReWOpeHENLN0_YlXg-1; Tue,
 01 Apr 2025 10:12:45 -0400
X-MC-Unique: uBatfReWOpeHENLN0_YlXg-1
X-Mimecast-MFC-AGG-ID: uBatfReWOpeHENLN0_YlXg_1743516763
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6387F19560B0;
	Tue,  1 Apr 2025 14:12:43 +0000 (UTC)
Received: from localhost (unknown [10.72.112.12])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 976A31801A69;
	Tue,  1 Apr 2025 14:12:41 +0000 (UTC)
Date: Tue, 1 Apr 2025 22:12:37 +0800
From: Baoquan He <bhe@redhat.com>
To: Oscar Salvador <osalvador@suse.de>
Cc: David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	yanjun.zhu@linux.dev
Subject: Re: [PATCH v2 1/7] mm/gup: fix wrongly calculated returned value in
 fault_in_safe_writeable()
Message-ID: <Z+v0VTq0YD3+9bMB@MiWiFi-R3L-srv>
References: <20250331081327.256412-1-bhe@redhat.com>
 <20250331081327.256412-2-bhe@redhat.com>
 <a1f69754-776f-47eb-980e-8a12991f4865@redhat.com>
 <Z-vxZQn3VAQoiRp3@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-vxZQn3VAQoiRp3@localhost.localdomain>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 04/01/25 at 04:00pm, Oscar Salvador wrote:
> On Tue, Apr 01, 2025 at 10:10:03AM +0200, David Hildenbrand wrote:
> > On 31.03.25 10:13, Baoquan He wrote:
> > > --- a/mm/gup.c
> > > +++ b/mm/gup.c
> > > @@ -2207,8 +2207,8 @@ size_t fault_in_safe_writeable(const char __user *uaddr, size_t size)
> > >   	} while (start != end);
> > >   	mmap_read_unlock(mm);
> > > -	if (size > (unsigned long)uaddr - start)
> > > -		return size - ((unsigned long)uaddr - start);
> > > +	if (size > start - (unsigned long)uaddr)
> > > +		return size - (start - (unsigned long)uaddr);
> > >   	return 0;
> > >   }
> > >   EXPORT_SYMBOL(fault_in_safe_writeable);
> > 
> > Can we instead just use the uaddr and start variables like in
> > fault_in_readable?
> > 
> > That is, turn "start" into a const and adjust uaddr instead.
> 
> Yes, I think that would be much cleaner.
> 
> Otherwise, this looks good to me. 

Will change in v3 as both of you suggested, thanks for reviewing this v2
series.

