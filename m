Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A8D1EB5C2
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 17:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749056645; cv=none; b=XIB4GlvXmmZFYNbytWAkivamw5nohE66fenWjNgpipxP74cL87zzVRbWdZixi1EENRxsTKXgccrWf90sPAed+a/B/f6/FBj7wrtovwVJ9NaQLYNyhh55oruQj12YsLb8A2eRnSaOO+BBTVeSYEEp79nOzfajyO8vWx0DKwJhiO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749056645; c=relaxed/simple;
	bh=dg9wIJkOGB/TKSx73q31T7Hr/V6bVEWMbnLOupX7Qq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KzTImIgK/xJvJySfr3m3gDiIclOf+mz9g2Sueb1d9o9XkLtbHc4hhdX58pQDhWv3DolpjPLt1jqnz4m2y+OmoRH9iNGH72gOBIL37S2Krou1HaHZJHF6AYGFeLObXQGxfADVmyYtNZRzwOsxhKlTJ4CuiUDhgPk8xspj6aNQCaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E37B+14x; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E37B+14x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749056642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KXYECtp31evftfpREsHH1UacYDYuxjJZpbQfu51cYzw=;
	b=E37B+14x8lR4DmHP31JwKpkC4pHocEfR2/DP8arVjYlIv5I0+Xgwxv5aBZoar427O6qTxg
	jFVf0js+uP6/RfsfgWqe+2b5bZ8ZjoP2G+PZwXwjsw41yCqVVFvfHsjZv4W+QyRARAnxYU
	yTv9ShF0Os/T4GA+DOTqbWVW3Khvd80=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-yIz9q067NjmcHf5YU4VP2w-1; Wed, 04 Jun 2025 13:04:01 -0400
X-MC-Unique: yIz9q067NjmcHf5YU4VP2w-1
X-Mimecast-MFC-AGG-ID: yIz9q067NjmcHf5YU4VP2w_1749056640
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7ceb5b5140eso14417385a.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 10:04:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749056640; x=1749661440;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KXYECtp31evftfpREsHH1UacYDYuxjJZpbQfu51cYzw=;
        b=sgRiiSwVNr6uWFLnfPi8zs1s4A/vPUGkFv+sDmn4mHgIECbK7qCcbI54EATXDUJ4rY
         DwVY1Dq4jywXU19ITrYvRYcdpgT99QyjPy644jhf9HnCUq3CEayLB/etdsh8U41tSQnr
         vevvelvG35LGUA3tyc5vPFNLXhmiCqoBTuad/zd0mbjS2I/nkwC7NFoEnv870K60vLVP
         xhZOa8IXO1m12/X+C67jlClzRPFJFk+i32rbv9/wlN9mg67gHCMJfGpwQb67bUf8NR69
         fhtGRVF88yZm30LHdF97ynxRSltZU/xMyaOwGUjiA7LfArSxMZquI6foRxZT8Uoecw94
         hXIg==
X-Forwarded-Encrypted: i=1; AJvYcCW8Drfl/DmiXV7oKEq9PkE7YwA42wHXBWaf/BhAWcD1Rw7N5Mxm7OPmxp4pw1dMFM9QGux08rlrY3ZJCGk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi86uMXXee7ZIG/rwDvPeyb7NNOGoLDccDlddM1WsfaOEhsF/5
	TOL3oypoL4wCqhWbV4Gt9njvpW8aSnWmsL4CI3FMczo7/hl/mqPsqBZoD+5ghmJuVQED5D2DWIL
	sGSmyS1qYAI1vy65T3/iKYa+Ndbe+cD7x4FWtDWlRRufzekdHsgCbgC5E6SXiGdiiBw==
X-Gm-Gg: ASbGnctrXja+hN3CD3jdcKg+lMuh7vFZ2tSHjUCs6C0Sh8YAxTQCFaIE8OOUgscApVu
	MKInM9eDHmgms/5e8g8WvnmEUny+znrJVfLjaEkf5cIqmwgqV9R/ZYeZFL25p2rDMFF+4Z5vk2e
	J5F5z2Io4ameMVHmvW19ZGN5wgmBRlvSy2NbtraS5CQmm+XjdeLW4ELYcHVoa9d8VFZ7P3NPEz4
	RAmQHqt+VxmDwztosw/nwmNmC9Mfd7cGIbYt+EW9/dEEvwxt8nwVdmYDcQoLs/DsIwehAr77iMk
	qP8yrir+/PxXVw==
X-Received: by 2002:ad4:5dec:0:b0:6fa:9baa:face with SMTP id 6a1803df08f44-6faf6fc3deamr54288826d6.35.1749056640000;
        Wed, 04 Jun 2025 10:04:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOvQDaKnUU3r62FtrvsKHhJElDFbbpfiXfuDmF6cUSLcZ7REl/ix2InFDElBeDf4MxXpK8jw==
X-Received: by 2002:ad4:5dec:0:b0:6fa:9baa:face with SMTP id 6a1803df08f44-6faf6fc3deamr54288406d6.35.1749056639598;
        Wed, 04 Jun 2025 10:03:59 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6d33ab1sm102398986d6.2.2025.06.04.10.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 10:03:59 -0700 (PDT)
Date: Wed, 4 Jun 2025 13:03:56 -0400
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
Message-ID: <aEB8fFEXKPR54LdA@x1.local>
References: <20250603-fork-tearing-v1-0-a7f64b7cfc96@google.com>
 <20250603-fork-tearing-v1-2-a7f64b7cfc96@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250603-fork-tearing-v1-2-a7f64b7cfc96@google.com>

On Tue, Jun 03, 2025 at 08:21:03PM +0200, Jann Horn wrote:
> It is not currently documented that the child of fork() should receive a
> coherent snapshot of the parent's memory, or how we get such a snapshot.
> Add a comment block to explain this.
> 
> Signed-off-by: Jann Horn <jannh@google.com>
> ---
>  kernel/fork.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/kernel/fork.c b/kernel/fork.c
> index 85afccfdf3b1..f78f5df596a9 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -604,6 +604,40 @@ static void dup_mm_exe_file(struct mm_struct *mm, struct mm_struct *oldmm)
>  }
>  
>  #ifdef CONFIG_MMU
> +/*
> + * Anonymous memory inherited by the child MM must, on success, contain a
> + * coherent snapshot of corresponding anonymous memory in the parent MM.

Should we better define what is a coherent snapshot?  Or maybe avoid using
this term which seems to apply to the whole mm?

I think it's at least not a snapshot of whole mm at a specific time,
because as long as there can be more than one concurrent writers (hence, it
needs to be at least 3 threads in the parent process, 1 in charge of fork),
this can happen:

  parent writer 1      parent writer 2    parent fork thr
  ---------------      ---------------    ---------------
                                          wr-protect P1
  write P1                                                  <---- T1
  (trapped, didn't happen)
                       write PN                             <---- T2
                       (went through)
                                          ...
                                          wr-protect PN

The result of above would be that child process will see a mixture of old
P1 (at timestamp T1) but updated P2 (timestamp T2).  I don't think it's
impossible that the userapp could try to serialize "write P1" and "write
PN" operations in a way that it would also get a surprise seeing in the
child PN updated but P1 didn't.

I do agree it at least recovered the per-page coherence, though, no matter
what is the POSIX definition of that.  IIUC an userapp can always fix such
problem, but maybe it's too complicated in some cases, and if Linux used to
at least maintain per-page coherency, then it may make sense to recover the
behavior especially when it only affects pinned.

Said that, maybe we still want to be specific on the goal of the change.

Thanks,

> + * (An exception are anonymous memory regions which are concurrently written
> + * by kernel code or hardware devices through page references obtained via GUP.)
> + * We effectively snapshot the parent's memory just before
> + * mmap_write_unlock(oldmm); any writes after that point are invisible to the
> + * child, while attempted writes before that point are either visible to the
> + * child or delayed until after mmap_write_unlock(oldmm).
> + *
> + * To make that work while only needing a single pass through the parent's VMA
> + * tree and page tables, we follow these rules:
> + *
> + *  - Before mmap_write_unlock(), a TLB flush ensures that parent threads can't
> + *    write to copy-on-write pages anymore.
> + *  - Before dup_mmap() copies page contents (which happens rarely), the
> + *    parent's PTE for the page is made read-only and a TLB flush is issued, so
> + *    subsequent writes are delayed until mmap_write_unlock().
> + *  - Before dup_mmap() starts walking the page tables of a VMA in the parent,
> + *    the VMA is write-locked to ensure that the parent can't perform writes
> + *    that won't be visible in the child before mmap_write_unlock():
> + *      a) through concurrent copy-on-write handling
> + *      b) by upgrading read-only PTEs to writable
> + *
> + * Not following these rules, and giving the child a torn copy of the parent's
> + * memory contents where different segments come from different points in time,
> + * would likely _mostly_ work:
> + * Any memory to which a concurrent parent thread could be writing under a lock
> + * can't be accessed from the child without risking deadlocks (since the child
> + * might inherit the lock in a locked state, in which case the lock will stay
> + * locked forever in the child).
> + * But if userspace is using trylock or lock-free algorithms, providing a torn
> + * view of memory could break the child.
> + */
>  static __latent_entropy int dup_mmap(struct mm_struct *mm,
>  					struct mm_struct *oldmm)
>  {
> 
> -- 
> 2.49.0.1204.g71687c7c1d-goog
> 

-- 
Peter Xu

