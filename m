Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7822D204C3E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 14:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743516720; cv=none; b=Z6HRi1Iy2gSjJHGr0TSlHjhhc/Tch7tH5BegcxUnCNJHFpNZM8K5PeOXRMrTozY52QvCWTo3TBiL11pfMoCSS6k8EuC6fQKFrjGaGjgRyPu0YJNgqjmYEKxW1d9CM588557cussWpdFo25oe5fpxqfa9NHbUHHM2420Qa6CGt2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743516720; c=relaxed/simple;
	bh=GO+ERojZJ5qf/t5ROmOD9Lr2F6iO2Gb5d2Ond4j5Na8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VXhocOZsJuNiOUgqxmvQVjNZw+eeA8BQfV3HuX1QV8DFg+QiRqpp+AQggtGo5lTHIaiR9+b7zzn1PU+CRSHVW4+ztO8UVu/+gFCgfVOmxqlYiHRwsk3m4OssVebWMcLGGhAJwA7mC0wE6jlt+usw012Z+GH0KWW9NkGY5KfMTTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H58zNYJo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H58zNYJo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743516717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=suAxeaNpOjK2xWYvWoyiGhS57tRLw1UbrXfTqrCY4sY=;
	b=H58zNYJohPPrJxMZL0xhNTOMv85OSVgvL7gY33EgUjCJEnXVr+JgO0xAgZ8V+PZewPjrXX
	Jz+0qvnM13+JSeoWpLxx1mdNdUbl+ld++hJZ9Cbb99P7N3y3+hw/s7Yg0Ta+RHqugbU9u8
	jsZTknCpYMyFPxBKK4k/w4fLWv6e/e0=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-423-5HaEc5wiP2Cp8mbFAb_PfA-1; Tue,
 01 Apr 2025 10:11:54 -0400
X-MC-Unique: 5HaEc5wiP2Cp8mbFAb_PfA-1
X-Mimecast-MFC-AGG-ID: 5HaEc5wiP2Cp8mbFAb_PfA_1743516713
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E6E14180882E;
	Tue,  1 Apr 2025 14:11:52 +0000 (UTC)
Received: from localhost (unknown [10.72.112.12])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1F6481955D81;
	Tue,  1 Apr 2025 14:11:50 +0000 (UTC)
Date: Tue, 1 Apr 2025 22:11:46 +0800
From: Baoquan He <bhe@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, yanjun.zhu@linux.dev
Subject: Re: [PATCH v2 1/7] mm/gup: fix wrongly calculated returned value in
 fault_in_safe_writeable()
Message-ID: <Z+v0IghIBLwha/oX@MiWiFi-R3L-srv>
References: <20250331081327.256412-1-bhe@redhat.com>
 <20250331081327.256412-2-bhe@redhat.com>
 <a1f69754-776f-47eb-980e-8a12991f4865@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1f69754-776f-47eb-980e-8a12991f4865@redhat.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On 04/01/25 at 10:10am, David Hildenbrand wrote:
> On 31.03.25 10:13, Baoquan He wrote:
> > Not like fault_in_readable() or fault_in_writeable(), in
> > fault_in_safe_writeable() local variable 'start' is increased page
> > by page to loop till the whole address range is handled. However,
> > it mistakenly calcalates the size of handled range with 'uaddr - start'.
> > 
> > Fix it here.
> 
> Fixes: ? Do we know of user-visible effects?

I believe it should impact, while I didn't hear of any complaint.
Yeah, it's worth to have one Fixes.

> 
> > 
> > Signed-off-by: Baoquan He <bhe@redhat.com>
> > ---
> > v1->v2:
> > - Fix a patch log typo caused by copy-and-paste error. Thanks
> >    to Yanjun.
> > 
> >   mm/gup.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/mm/gup.c b/mm/gup.c
> > index 855ab860f88b..73777b1de679 100644
> > --- a/mm/gup.c
> > +++ b/mm/gup.c
> > @@ -2207,8 +2207,8 @@ size_t fault_in_safe_writeable(const char __user *uaddr, size_t size)
> >   	} while (start != end);
> >   	mmap_read_unlock(mm);
> > -	if (size > (unsigned long)uaddr - start)
> > -		return size - ((unsigned long)uaddr - start);
> > +	if (size > start - (unsigned long)uaddr)
> > +		return size - (start - (unsigned long)uaddr);
> >   	return 0;
> >   }
> >   EXPORT_SYMBOL(fault_in_safe_writeable);
> 
> Can we instead just use the uaddr and start variables like in
> fault_in_readable?
> 
> That is, turn "start" into a const and adjust uaddr instead.

Sounds good to me, that makes these similar blocks own consistent code
style. Will change in v3. Thanks for reviewing.

> 
> (maybe we should also handle the types of these variables similar to as in
> fault_in_readable)
> 
> -- 
> Cheers,
> 
> David / dhildenb
> 

