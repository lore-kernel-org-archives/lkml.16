Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FC8231854
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 20:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749067813; cv=none; b=LUOoVNCD1AjU/Y9uw0JHH3AkGW4uB4vPtIIJJWi7SzBV6J12ZWOYESU6oMgAngOPyzq4lU8xxckjPZcoRaBrn86hXlxTVNjjIWxmFa65NqO/r9Knz5gcKJBCdyMF7PhuplevwfYqssyApiUI5r1iVvm8gIMaCcvEpzLwHaeaVHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749067813; c=relaxed/simple;
	bh=npOsTPElb+7lFo0mivlFSkNlSYrnaISXvTaP0g9wdAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rtt5EEUFbht2c5Qe2OV6B+mw9iMHwVAi0rm3gVd9vTph1dppJ97iOW8sFwHOYH1Ib8vduRNZ7XSpoZlArXQwyB111s7cezXsbjEuqSZqWUE23TSHLybwECUgp8DJUIU80ASZfNAjWJZgUl4bC6nrRLRe6JO2/4Dqp3Z7htqfZEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eMbViv9J; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eMbViv9J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749067809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q9BN5xXgT88bSXulA/FeIPqelXeL/Un5XhFATUvSjD8=;
	b=eMbViv9JVVNarVfqr7Lwb4/oWsz4yrqyOMyPKqsPbjosxka57mmyB+dt66qR9dfGYxAo9k
	LA6VSNhqtz7vgEliiXop0HoSQj6sK7eCC+5/efUTe8xQsNH5hof9AAPW2wFBpAiJt4WsHV
	skkcPU2H0hbdj89BrJNZVUX9iD8GK7I=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-nyUVFMc4Pl6uT-vMO_jwRA-1; Wed, 04 Jun 2025 16:10:08 -0400
X-MC-Unique: nyUVFMc4Pl6uT-vMO_jwRA-1
X-Mimecast-MFC-AGG-ID: nyUVFMc4Pl6uT-vMO_jwRA_1749067808
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fad4f82182so4424116d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 13:10:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749067808; x=1749672608;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q9BN5xXgT88bSXulA/FeIPqelXeL/Un5XhFATUvSjD8=;
        b=jjPEcR9ap+EJFfQGVH2W1/PpEl+c0MZWGa6MmP5CqfHDLb38L9tPq8URQ8OPtK0cgq
         rDgN59QAwIicmfgM4G5ea+CzDIe4DBM2LACi9Ppqx0Buu7DBAhhNDjJnaSsgzk8e4Hol
         7kgyWOKbQBWjeQNAjwBgMRrjVKV60qrImwMu/+q5yseg00G6TBuG7iscSlm9S1NxZcJP
         vNeSZAb8oXehtGVmzjOZPJxXFwpO65EO3X7dfT7Xo8UaES8TvuRylSe+uHlwnsxVSTz1
         RlDV63NwASAT629G+tlzZtt4x8lNmZX8qxXPyZk+V8qm45NJk31hvUKb9wPcTxgIaMDU
         Z3rA==
X-Forwarded-Encrypted: i=1; AJvYcCX1FEi9WRpRRFW1mbZiZnSiMKkkMI5nOHRjQkQ2nzjRNfvcJrncm8BMVZhD9DA8fJ/hhFlyBqxGXWkUSuE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqLQzUgSlHenrgB/rtvQRw0JCViAh/QQs5svkN1QOf52oG5JTK
	0YvYQPHJtoFtPJ8W1Gpaf/LhhDZz4Th06hCNxMT6uWj9PWpf4Eq7QcKc554gAogFRWVWsBMr24t
	dahEjrvX2ilkG9gWvcxxlxYVvuqSpvUqeYsu4VyghYyMgs8pjkJ7VWqwHiOM9ij+O1A==
X-Gm-Gg: ASbGncvqcbqjwu6sFgCOWSHsU0mVtZjoD0O18ZcwqGjLD+MM+HHNmx8Fs/fBn+VR0vu
	CcPdHHKNtASbxBWhUUikYZgAMs5eSshj1iGyo5zm47+7gCy+oPxF8ChKkTJ3JuASR7BpyAR5SGS
	qd4bK6obWzOEDy8pvyJ3JOXY8Wq6BnhPTlSOke1hew36Dv9Hj2i89IRu3OviT27nh/RR2k7BAMS
	jTama7R1hXfGPOXaD2ViwX6SwL2dccNnWkzz2VJAVBF5ClgSL2Hew6MHUlQBQBqq9cZRihgJGFF
	fmg=
X-Received: by 2002:ad4:5ecd:0:b0:6fa:cdc9:8b02 with SMTP id 6a1803df08f44-6faf6f9e8f2mr61152116d6.16.1749067807565;
        Wed, 04 Jun 2025 13:10:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE405MytDVz3s6Kc/HX1eBXRVHVZoZtFmEhwF86+X8cjETvPQ/GL8LxPX1fmGW9kIB8AVLnFg==
X-Received: by 2002:ad4:5ecd:0:b0:6fa:cdc9:8b02 with SMTP id 6a1803df08f44-6faf6f9e8f2mr61151716d6.16.1749067807154;
        Wed, 04 Jun 2025 13:10:07 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6d5b59asm105134686d6.65.2025.06.04.13.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 13:10:06 -0700 (PDT)
Date: Wed, 4 Jun 2025 16:10:04 -0400
From: Peter Xu <peterx@redhat.com>
To: Jann Horn <jannh@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mm/memory: Document how we make a coherent memory
 snapshot
Message-ID: <aECoHDM3l2dKTfDw@x1.local>
References: <20250603-fork-tearing-v1-0-a7f64b7cfc96@google.com>
 <20250603-fork-tearing-v1-2-a7f64b7cfc96@google.com>
 <aEB8fFEXKPR54LdA@x1.local>
 <CAG48ez3cgG-PikyO7a84CFdPFvPY9BSNJOZ7wZVQ7Q9Qju_6Ng@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG48ez3cgG-PikyO7a84CFdPFvPY9BSNJOZ7wZVQ7Q9Qju_6Ng@mail.gmail.com>

On Wed, Jun 04, 2025 at 08:11:08PM +0200, Jann Horn wrote:
> On Wed, Jun 4, 2025 at 7:04 PM Peter Xu <peterx@redhat.com> wrote:
> > On Tue, Jun 03, 2025 at 08:21:03PM +0200, Jann Horn wrote:
> > > It is not currently documented that the child of fork() should receive a
> > > coherent snapshot of the parent's memory, or how we get such a snapshot.
> > > Add a comment block to explain this.
> > >
> > > Signed-off-by: Jann Horn <jannh@google.com>
> > > ---
> > >  kernel/fork.c | 34 ++++++++++++++++++++++++++++++++++
> > >  1 file changed, 34 insertions(+)
> > >
> > > diff --git a/kernel/fork.c b/kernel/fork.c
> > > index 85afccfdf3b1..f78f5df596a9 100644
> > > --- a/kernel/fork.c
> > > +++ b/kernel/fork.c
> > > @@ -604,6 +604,40 @@ static void dup_mm_exe_file(struct mm_struct *mm, struct mm_struct *oldmm)
> > >  }
> > >
> > >  #ifdef CONFIG_MMU
> > > +/*
> > > + * Anonymous memory inherited by the child MM must, on success, contain a
> > > + * coherent snapshot of corresponding anonymous memory in the parent MM.
> >
> > Should we better define what is a coherent snapshot?  Or maybe avoid using
> > this term which seems to apply to the whole mm?
> >
> > I think it's at least not a snapshot of whole mm at a specific time,
> > because as long as there can be more than one concurrent writers (hence, it
> > needs to be at least 3 threads in the parent process, 1 in charge of fork),
> > this can happen:
> >
> >   parent writer 1      parent writer 2    parent fork thr
> >   ---------------      ---------------    ---------------
> >                                           wr-protect P1
> >   write P1                                                  <---- T1
> >   (trapped, didn't happen)
> >                        write PN                             <---- T2
> >                        (went through)
> >                                           ...
> >                                           wr-protect PN
> >
> > The result of above would be that child process will see a mixture of old
> > P1 (at timestamp T1) but updated P2 (timestamp T2).  I don't think it's
> > impossible that the userapp could try to serialize "write P1" and "write
> > PN" operations in a way that it would also get a surprise seeing in the
> > child PN updated but P1 didn't.
> 
> If the write at T1 hits a page fault, then it doesn't actually happen
> at T1. The write instruction starts doing something at T1, but it does
> not fully retire, and the architectural register state does not
> change, and in particular the instruction pointer does not advance
> past this instruction; just like when speculative execution is aborted
> after a branch misprediction, except that the CPU raises an exception
> and we enter the page fault handler. The write actually happens when
> the instruction is executed a second time after page fault handling
> has completed after the mmap lock is dropped. (Unless something during
> page fault handling raises a signal, in which case the instruction
> might never architecturally execute.)

Fair enough.  So maybe that's something like a best-effort whole mm
snapshot anytime happened during the fork() but before releasing mmap write
lock.

Your comment did mention one exception on the kernel, is it still pretty
easy to happen?  I'm thinking this use case of trying to load some data
from a O_DIRECT fd and then set the var to show it's loaded:

  bool data_read=0
  read(...);
  data_read=1;

Then IIUC this can happen:

    parent thread 1                        parent fork thr
    ---------------                        ---------------
    read(...)
      using O_DIRECT on priv-anon buffers P1
      pin_user_pages
                                           fork() happens
                                             Sees P1 pinned
                                             P1 early COW (child sees no data loaded)
      memcpy()
    set data_read=1
    (data_read can be a global private var on P2)
                                             P2 wr-protected (child sees data_read=1)

Hence in child even if it sees data_read=1 it is possible the buffer may be
uninitialized, or the buffer is partly loaded, still racing with the kernel
early COW.

I'm not sure if I understand it correct this time as you discussed in the
comment. If so, should we still not emphasize too much on the kernel
providing coherent mm snapshot, at least emphasize the best-effort part
(both in comment of patch 2, but also in patch subjects)?  After all, it
seems it isn't straightforward for any userapp to see when that coherency
will be violated.

From that POV, maybe it's better we should still suggest the undefined
behavior, even if it'll recover the old behavior some existing use case?

Thanks,

-- 
Peter Xu

