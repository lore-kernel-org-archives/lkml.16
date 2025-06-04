Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9140928F51B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 15:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749049783; cv=none; b=Pw9xDA8aDTT81x8xSpOX8Z08zJyocmjNC3tXdtxWOD8Uxj68r7GdEB+Q24E5zZZl3QT8PPjkyAB5YOuYteh6tizIXsrGxePPlOGvJ4Bl6AWwF5BBclQ4izxjoxjhxXs01hxOKTJpN63t3KjBBSeXJBdPMRxnNl/o4T4/pU6qMjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749049783; c=relaxed/simple;
	bh=MStiwnmTKTIxDYoiFZ0DxSnXZqv5tV3Q2Nw8sIyap1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j7zB33/ng0KNBNx0LXxhKH8ubz8D2JQD3j+dEfE/6BwNvT3vZYzJb0fLh4CiL4Xh0OUYNZk6D4Imi6AJKqOL+g9GG9rrEp4r5YcZnMkqcLglXgcB6dRuGSrFT0BklDVT9YVPUdVdW/UrkNl6HrScT/kLn16SxOif2DAC2Rb19c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hzOQ2KLr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hzOQ2KLr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749049780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K0Z14f5Dv0sEBCQzCT+N5xWNS5ySL+Tzir6TJSSZ+3Q=;
	b=hzOQ2KLrlpDOZ1hXZQf0AD6fcXY3j7jIkzh6D9aEwmPbinWIRAkGLLplLKt0cxN8JJZj55
	4WYEblgqbglTSB2vqRLK8L9Ka9i91M7XbGtpBQ/Pw+34gXtFPowQS5m2VZPjrJMBz3AIqN
	NLVwH/G271VLnexk2Q/d0x8PBLfh6TY=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-RISzvFFuOyKZxk0zCkyARQ-1; Wed, 04 Jun 2025 11:09:37 -0400
X-MC-Unique: RISzvFFuOyKZxk0zCkyARQ-1
X-Mimecast-MFC-AGG-ID: RISzvFFuOyKZxk0zCkyARQ_1749049777
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6facf4cf5e1so84465946d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 08:09:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749049777; x=1749654577;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K0Z14f5Dv0sEBCQzCT+N5xWNS5ySL+Tzir6TJSSZ+3Q=;
        b=rAWOo47gL1k6z8dVxuwuffEH7LpIfHWSvkvAYyZgo0/5PHfb6WhYGQHkYlHD0UO6f1
         sdLBpXzjEgfsVtXSWXB31db5e7vhn0eo67aIsUxUR7AduEKLRew8sRAoTZQdUxtuDt4L
         k+qnwmBQI3gd9203IGXPPoxhvX+V3wTVAZT7ge2LixKpcHS9kVMN11qdcgDOPLKxSd1C
         3S1BrrYBmaXMA/jR0w1zeUCHMGKF+R/vVeLOntkHJukg5DgbP2c/YV6fKoirQ7ia+BAZ
         mSXGHRje2YwBzIPPdbTqeO77u1WQUmJ1iuucDQfIaRLyezBvdDX3NhmgxaCcEiPVKbKE
         Ioag==
X-Forwarded-Encrypted: i=1; AJvYcCXIS31mnKcwVAQch5Ok7PWRF50MgUUdoo7+qubxfjH1HLyUBHSRUyy7a9xocVeXViRfvcDP0V+FAsD+LGg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6oz7zqPiWmSd9VOYJZqFhrf5g3IVQfEzkozZitmu6SAWWE93O
	m7YSMf1zF2XNJxWOLh6bPCHC76k+L6BgM0doFuiriUyPSA3ZJ/HomMYf4yI5a5ia0t3bmlYHQj+
	8DnX/lA3RDaBgdDA4M6qh9uINgo1TV2D4d0+NDiKbO2uyiPi+mgnjeqLoPjMgZ8+0lw==
X-Gm-Gg: ASbGncuP7+3oiugPTWGKorOfSgAB916S5UoxiEqGLzFiRh/H2WSx3dENRUDvvMOmCNo
	1gBNWdnKAoJA3q5gLQafFkEw+g8KJblaGj0/jHC1tCHH6Ac5PbXRa0K76ziQF5MIbxbKPr4CPeY
	OIrc5D5l/U/WkJH+opMXDEmGdcL/9Co+PZOsvXPHdqKp5PpEYq4axCfNhxPDNTiP4wKKLjXyq/R
	FAjOvGc7uzWAIZzpGw1KArMTp0L41zTNF42wc6uYxq0Siuu/2jG/Rw7B1rVML/w5kuZMaB7yAiF
	XJk=
X-Received: by 2002:a05:6214:5086:b0:6fa:ce1e:3a4a with SMTP id 6a1803df08f44-6faf6f9312emr40237106d6.6.1749049776243;
        Wed, 04 Jun 2025 08:09:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSDUs50177E/rrZpx+xC+0iIv+BIQc1aieeX4oFfx7XS0nPA0qJB8ecAAJUv8L53J89ePgrw==
X-Received: by 2002:a05:6214:5086:b0:6fa:ce1e:3a4a with SMTP id 6a1803df08f44-6faf6f9312emr40235876d6.6.1749049774940;
        Wed, 04 Jun 2025 08:09:34 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6e00d42sm99700586d6.85.2025.06.04.08.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 08:09:34 -0700 (PDT)
Date: Wed, 4 Jun 2025 11:09:31 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: Tal Zussman <tz2294@columbia.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Pavel Emelyanov <xemul@parallels.com>,
	Andrea Arcangeli <aarcange@redhat.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 2/3] userfaultfd: prevent unregistering VMAs through a
 different userfaultfd
Message-ID: <aEBhqz1UgpP8d9hG@x1.local>
References: <20250603-uffd-fixes-v1-0-9c638c73f047@columbia.edu>
 <20250603-uffd-fixes-v1-2-9c638c73f047@columbia.edu>
 <84cf5418-42e9-4ec5-bd87-17ba91995c47@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <84cf5418-42e9-4ec5-bd87-17ba91995c47@redhat.com>

On Wed, Jun 04, 2025 at 03:23:38PM +0200, David Hildenbrand wrote:
> On 04.06.25 00:14, Tal Zussman wrote:
> > Currently, a VMA registered with a uffd can be unregistered through a
> > different uffd asssociated with the same mm_struct.
> > 
> > Change this behavior to be stricter by requiring VMAs to be unregistered
> > through the same uffd they were registered with.
> > 
> > While at it, correct the comment for the no userfaultfd case. This seems
> > to be a copy-paste artifact from the analagous userfaultfd_register()
> > check.
> 
> I consider it a BUG that should be fixed. Hoping Peter can share his
> opinion.

Agree it smells like unintentional, it's just that the man page indeed
didn't mention what would happen if the userfaultfd isn't the one got
registered but only requesting them to be "compatible".

DESCRIPTION
       Unregister a memory address range from userfaultfd.  The pages in
       the range must be “compatible” (see UFFDIO_REGISTER(2const)).

So it sounds still possible if we have existing userapp creating multiple
userfaultfds (for example, for scalability reasons on using multiple
queues) to manage its own mm address space, one uffd in charge of a portion
of VMAs, then it can randomly take one userfaultfd to do unregistrations.
Such might break.

> 
> > 
> > Fixes: 86039bd3b4e6 ("userfaultfd: add new syscall to provide memory externalization")
> > Signed-off-by: Tal Zussman <tz2294@columbia.edu>
> > ---
> >   fs/userfaultfd.c | 15 +++++++++++++--
> >   1 file changed, 13 insertions(+), 2 deletions(-)
> > 
> > diff --git a/fs/userfaultfd.c b/fs/userfaultfd.c
> > index 22f4bf956ba1..9289e30b24c4 100644
> > --- a/fs/userfaultfd.c
> > +++ b/fs/userfaultfd.c
> > @@ -1477,6 +1477,16 @@ static int userfaultfd_unregister(struct userfaultfd_ctx *ctx,
> >   		if (!vma_can_userfault(cur, cur->vm_flags, wp_async))
> >   			goto out_unlock;
> > +		/*
> > +		 * Check that this vma isn't already owned by a different
> > +		 * userfaultfd. This provides for more strict behavior by
> > +		 * preventing a VMA registered with a userfaultfd from being
> > +		 * unregistered through a different userfaultfd.
> > +		 */
> > +		if (cur->vm_userfaultfd_ctx.ctx &&
> > +		    cur->vm_userfaultfd_ctx.ctx != ctx)
> > +			goto out_unlock;
> 
> So we allow !cur->vm_userfaultfd_ctx.ctx to allow unregistering when there
> was nothing registered.
> 
> A bit weird to set "found = true" in that case. Maybe it's fine, just
> raising it ...

This part should be ok, as found is defined as:

	/*
	 * Search for not compatible vmas.
	 */
	found = false;

So it's still compatible VMA even if not registered.

It's just that I'm not yet sure how this change benefits the kernel
(besides the API can look slightly cleaner).  There seems to still have a
low risk of breaking userapps.  It could be a matter of whether there can
be any real security concerns.

If not, maybe we don't need to risk such a change for almost nothing (I
almost never think "API cleaness" a goal when it's put together with
compatilibities).

Thanks,

-- 
Peter Xu

