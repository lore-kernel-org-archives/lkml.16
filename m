Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6A2228383
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 09:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738747118; cv=none; b=AMdoyVBmICZVmAcXE/4g6A3V7Z+gfrYU2u55pV3ircuUYm2VCdPViqtu+Bhh3M2Xm/Zk1DHEVm1Lgya3qevJdFxR/D5BEKpCg/SW7rIBC7wo5a+ic73ms6fzfxO3PD2gvOh8oU1LNAmI2ZO7YVVBjLEb4w+kKdnKOlkt6mCzcC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738747118; c=relaxed/simple;
	bh=ZTrw+eqXMb9fY1TmY5jb9dV7xwWdwwVtqwCuKzIeZks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=riNB3s5sMMFVm9zl/UmIr49T781qR/xTZeLOKD0ivQqD8y8N0zBEZH/BTjS+z0VBeBO4WtExVjV6RFPJb3Nqry6jvtJCMI8XJtoxEwmApjinT7FHxIyCjCGtXTyfq5EzGK0rvq8MGCiIZPrapnEM6PLiME6/y4unOseFRKlyvtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TRUX58dl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TRUX58dl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738747115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pvRGVNikjhLpjvxhSukAM7h/M6H6qv36CH/UV/2N8p0=;
	b=TRUX58dlBYDrd8KK7hQZoUZcyICUeiUs2kezt+DLKa1lYcjCAJsuY/bn4NJQSM+yW2sZ6H
	fLhh8b6ZWQI0Q0Kwoi8n4hKbLu2ioPnxYc8qM0fE60wZO8Vz64rlOkyWOPovqbBfTXzm6H
	HP6pUL2jBR7l0998Vby54lWJQtMqIxU=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-317-jdOD0sLWOZ2pwEAnAel9Kg-1; Wed,
 05 Feb 2025 04:18:31 -0500
X-MC-Unique: jdOD0sLWOZ2pwEAnAel9Kg-1
X-Mimecast-MFC-AGG-ID: jdOD0sLWOZ2pwEAnAel9Kg
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 665E71800873;
	Wed,  5 Feb 2025 09:18:29 +0000 (UTC)
Received: from localhost (unknown [10.72.112.190])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7F48B1800360;
	Wed,  5 Feb 2025 09:18:27 +0000 (UTC)
Date: Wed, 5 Feb 2025 17:18:22 +0800
From: Baoquan He <bhe@redhat.com>
To: Kairui Song <ryncsn@gmail.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	Chris Li <chrisl@kernel.org>, Barry Song <v-songbaohua@oppo.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Hugh Dickins <hughd@google.com>,
	Yosry Ahmed <yosryahmed@google.com>,
	"Huang, Ying" <ying.huang@linux.alibaba.com>,
	Nhat Pham <nphamcs@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>,
	Kalesh Singh <kaleshsingh@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 07/13] mm, swap: hold a reference during scan and
 cleanup flag usage
Message-ID: <Z6Ms3qRDXat31sKc@fedora>
References: <20241230174621.61185-1-ryncsn@gmail.com>
 <20241230174621.61185-8-ryncsn@gmail.com>
 <Z3jLMwGEDysnUWpd@MiWiFi-R3L-srv>
 <CAMgjq7CyHyoCjeBf0eNAWAFDLRf9AYbmMGG9=QTK5v5fFNm1pw@mail.gmail.com>
 <Z423RmT4SkoDuRXl@fedora>
 <CAMgjq7CiOFPRuxfEShkemJB9+tOJEw4sYFSndBE0pvNTEQH+YQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMgjq7CiOFPRuxfEShkemJB9+tOJEw4sYFSndBE0pvNTEQH+YQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 01/27/25 at 05:19pm, Kairui Song wrote:
> On Mon, Jan 20, 2025 at 10:39 AM Baoquan He <bhe@redhat.com> wrote:
> >
> > On 01/13/25 at 01:34pm, Kairui Song wrote:
> > > On Sat, Jan 4, 2025 at 1:46 PM Baoquan He <bhe@redhat.com> wrote:
> > > >
> > > > On 12/31/24 at 01:46am, Kairui Song wrote:
> > > > > From: Kairui Song <kasong@tencent.com>
> > > > >
> > > > > The flag SWP_SCANNING was used as an indicator of whether a device
> > > > > is being scanned for allocation, and prevents swapoff. Combined with
> > > > > SWP_WRITEOK, they work as a set of barriers for a clean swapoff:
> > > > >
> > > > > 1. Swapoff clears SWP_WRITEOK, allocation requests will see
> > > > >    ~SWP_WRITEOK and abort as it's serialized by si->lock.
> > > > > 2. Swapoff unuses all allocated entries.
> > > > > 3. Swapoff waits for SWP_SCANNING flag to be cleared, so ongoing
> > > > >    allocations will stop, preventing UAF.
> > > > > 4. Now swapoff can free everything safely.
> > > > >
> > > > > This will make the allocation path have a hard dependency on
> > > > > si->lock. Allocation always have to acquire si->lock first for
> > > > > setting SWP_SCANNING and checking SWP_WRITEOK.
> > > > >
> > > > > This commit removes this flag, and just uses the existing per-CPU
> > > > > refcount instead to prevent UAF in step 3, which serves well for
> > > > > such usage without dependency on si->lock, and scales very well too.
> > > > > Just hold a reference during the whole scan and allocation process.
> > > > > Swapoff will kill and wait for the counter.
> > > > >
> > > > > And for preventing any allocation from happening after step 1 so the
> > > > > unuse in step 2 can ensure all slots are free, swapoff will acquire
> > > > > the ci->lock of each cluster one by one to ensure all allocations
> > > > > see ~SWP_WRITEOK and abort.
> > > >
> > > > Changing to use si->users is great, while wondering why we need acquire =
> > > > each ci->lock now. After setup 1, we have cleared SWP_WRITEOK, and take
> > > > the si off swap_avail_heads list. No matter what, we just need wait for
> > > > p->comm's completion and continue, why bothering to loop for the
> > > > ci->lock acquiring?
> > > >
> > >
> > > Hi Baoquan,
> > >
> > > Waiting for p->comm's completion must be done after unuse is called
> > > (unuse will need to take the si->users refcound, so it can't be dead
> > > yet), but unuse must be called after no one will allocate any new
> > > entry. That is guaranteed by the loop ci->lock acquiring.
> >
> > Sorry for late response, Kairui. I went trought the code flow of swap
> > allocation several times, however haven't made clear how loop ci->lock
> > acquiring is needed here.  Once si->flags &= ~SWP_WRITEOK is executed in
> > del_from_avail_list() when swaping off, even though the allocation
> > action is still on going, it will be failed in cluster_alloc_range()
> > by the 'if (!(si->flags & SWP_WRITEOK))' checking. Then that allocation
> 
> Hi Baoquan,
> 
> Thanks for the careful review.
> 
> > requirement will be failed and returned, means no new swap entry|slot
> > allcation will be done. Then unuse won't be impacted at all. In this
> > case, why do we care about it?
> >
> > Please forgive my stupidity, could you elaborate in which case this kind
> > of still ongoging swap allocation will happen during its swap device's
> > off? Could you give an example of the concurrent execution flows?
> 
> There is no barrier or lock between clear the flag and try_to_unuse,
> so nothing guarantees the "if (!(si->flags & SWP_WRITEOK))" in
> cluster_alloc_range will see the updated flag. The loop ci->lock acts
> like a full memory barrier, ensuring any allocation after the loop
> lock will definitely see the updated flags, and try_to_unuse will only
> go on after all allocation have either stopped or will see the updated
> flags. In practice this problem is almost impossible to happen, but in
> theory possible.

Got it now. swap_avail_lock is not taken during allocation, and we don't
take it when accessing si->flags in cluster_alloc_range() becasue that
could bring in new lock contention.

Thanks a lot for patient explanation.

