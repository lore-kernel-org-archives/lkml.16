Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E1C1DE3A8
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744370138; cv=none; b=dsIjASTRgayTVrfKYDAT/sLKd7JdizROknVssh0Qa5/NGptFpfETWUxwPpacnhVcO0pXnM0U84tq3D/BXVFIiOqNd6T19y9l94O/JEIszWX6sm4BwmdU82gnHRKFjq2+t9+AsPVPWcpCmFBwCq9BEqXjXGKUnvDUnDMC1QG0VKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744370138; c=relaxed/simple;
	bh=t/3syKxztlxyYt+6x5hxHB8q6nWyGfHeYF3kRejueTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s/LgCHf7xjuNUNLajzvKY9jwc+nFPHzrVxLK7cm+edUVQTmmRMSSCXjGO1BVjxtnMlu+SmL8KuMFzRiEI+cJJnEVtDgsW4G9jQvisic9Ph22GUuBIHVjbp/5mRHZuJDztwln2fwdndIs3e5NSePjlhPoswEGtJTr8hkD08/Ft6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZTrHqxTO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZTrHqxTO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744370135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CA31YbKQ9t+xwlWojz0Bu12fhPmL96OxavjpM95pz3I=;
	b=ZTrHqxTOnAzo68CsHk61S3ta5+gMzTyIJWoU6CsLHt2DzKodrKkUssnRUFZGuz42CZMvL+
	WB2i4QMNmDadm1YNdE0Cq2H+ooyhubAG8shQbwVj7eA/sLhK6SkJBHOMErfNfssg5w8fqD
	IwxX06jULLuMW7eaKp+nuWPVSt0WPs8=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-382-6tv7J8avPSGWnMDhrjdRhA-1; Fri,
 11 Apr 2025 07:15:32 -0400
X-MC-Unique: 6tv7J8avPSGWnMDhrjdRhA-1
X-Mimecast-MFC-AGG-ID: 6tv7J8avPSGWnMDhrjdRhA_1744370131
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D5B9D195608A;
	Fri, 11 Apr 2025 11:15:30 +0000 (UTC)
Received: from localhost (unknown [10.72.112.38])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 787E01955DCE;
	Fri, 11 Apr 2025 11:15:28 +0000 (UTC)
Date: Fri, 11 Apr 2025 19:15:23 +0800
From: Baoquan He <bhe@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, osalvador@suse.de,
	yanjun.zhu@linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] mm/gup: clean up codes in fault_in_xxx() functions
Message-ID: <Z/j5y6frIT2jIsv7@MiWiFi-R3L-srv>
References: <20250410035717.473207-1-bhe@redhat.com>
 <20250410035717.473207-5-bhe@redhat.com>
 <f03f7e13-3d37-4d4a-87a6-61731744f476@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f03f7e13-3d37-4d4a-87a6-61731744f476@redhat.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On 04/11/25 at 10:54am, David Hildenbrand wrote:
> On 10.04.25 05:57, Baoquan He wrote:
> > The code style in fault_in_readable() and fault_in_writable() is a
> > little inconsistent with fault_in_safe_writeable(). In fault_in_readable()
> > and fault_in_writable(), it uses 'uaddr' passed in as loop cursor. While
> > in fault_in_safe_writeable(), local variable 'start' is used as loop
> > cursor. This may mislead people when reading code or making change in
> > these codes.
> > 
> > Here define explicit loop cursor and use for loop to simplify codes in
> > these three functions. These cleanup can make them be consistent in
> > code style and improve readability.
> > 
> > Signed-off-by: Baoquan He <bhe@redhat.com>
> > ---
> >   mm/gup.c | 65 +++++++++++++++++++++++---------------------------------
> >   1 file changed, 26 insertions(+), 39 deletions(-)
> > 
> > diff --git a/mm/gup.c b/mm/gup.c
> > index 77a5bc622567..a76bd7e90a71 100644
> > --- a/mm/gup.c
> > +++ b/mm/gup.c
> > @@ -2113,28 +2113,24 @@ static long __get_user_pages_locked(struct mm_struct *mm, unsigned long start,
> >    */
> >   size_t fault_in_writeable(char __user *uaddr, size_t size)
> >   {
> > -	char __user *start = uaddr, *end;
> > +	const unsigned long start = (unsigned long)uaddr;
> > +	const unsigned long end = start + size;
> > +	unsigned long cur = start;
> 
> I would initialize cur in the for loop header, makes the loop easier to
> read.

Both is fine to me. It's to satisfy checkpatch.sh which complains about
exceeding 80 char in the line.

> 
> >   	if (unlikely(size == 0))
> >   		return 0;
> > +
> 
> Would not add that line to keep it like fault_in_readable() below.

Will remove it.

> 
> >   	if (!user_write_access_begin(uaddr, size))
> >   		return size;
> > -	if (!PAGE_ALIGNED(uaddr)) {
> > -		unsafe_put_user(0, uaddr, out);
> > -		uaddr = (char __user *)PAGE_ALIGN((unsigned long)uaddr);
> > -	}
> > -	end = (char __user *)PAGE_ALIGN((unsigned long)start + size);
> > -	if (unlikely(end < start))
> > -		end = NULL;
> > -	while (uaddr != end) {
> > -		unsafe_put_user(0, uaddr, out);
> > -		uaddr += PAGE_SIZE;
> > -	}
> > +
> > +	/* Stop once we overflow to 0. */
> > +	for (; cur && cur < end; cur = PAGE_ALIGN_DOWN(cur + PAGE_SIZE))
> > +		unsafe_put_user(0, (char __user *)cur, out);
> 
> Staring at fault_in_safe_writeable(), we could also do
> 
> /* Stop once we overflow to 0. */
> end = PAGE_ALIGN(end)
> if (start < end)
> 	end = 0;
> 
> for (cur = start; cur != end; cur = PAGE_ALIGN_DOWN(cur + PAGE_SIZE))
> 	unsafe_put_user(0, (char __user *)cur, out);
> 
> Essentially, removing the "cur" check from the loop condition. Not sure if
> that is better.

The current code is simpler. Your now saying may save the CPU execution
instructions a little bit. Both is fine to me.

I don't have strong preference, I can make v4 to address these concerns
if decided. Thanks for careful checking. 

> 
> In any case, if all functions later look similar and clearer it's a big win.

Agreed.

