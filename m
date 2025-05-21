Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B4425F7BB
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 10:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747824150; cv=none; b=cFAsrU2Lth7qoCdH7YYuArDjyOUoYFoW4b49Y0zc9YutAmgBSC+l4zXEsGyWmTZCdZd9LiaugWrjoRPncr+yBnKbPNtoiam2yt7ie25q4+4uxPE2y6EJo6X+GZN3PvOCdcTCjCO+onLlMkEUS6bgrHzQf01RG4s0iBgb3nGF4DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747824150; c=relaxed/simple;
	bh=7V5FOBnbdEjhg/qebWmb24tVnwXm8b3CB8u6kNZ4Ges=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=scJBMTIvt6pmJDMSqkHnPtYHnbKbD/bwcZoQld6MB9jMatJEBMWwrmg8txqvbY+a4nGdlgwhpZml1FuoRVkG9UQtOV5lpG6ChGvRKiFwAXRV9OxJquuUduGcIoJMZJCMKXhEEJHVt/kUKraSFiRrJ9cAzkCwhvNnZvZWU4cDoIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=deaO/UA7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="deaO/UA7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747824147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CKNmbB10vcbsW4zmbX/wZ2PtRPWlG9QOl8Yo9wDdnoM=;
	b=deaO/UA7aG8eZdQnr5qLShxSOZiSQEhOhmic99s3htV0+gvBCWncxnzG1ekVaow0HpjPvQ
	pxhBMyOqCz1wEjz6mHWDjq0KM0MghyUqCv/aVXKJsaEJUdtfpm4rJdQ4drnZU7cA58/xNQ
	OsJxvY0bk46LSUDU1r82b/NeRvIu8CY=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621--XxUzQ4IOReXcBdQlTeZPA-1; Wed, 21 May 2025 06:42:21 -0400
X-MC-Unique: -XxUzQ4IOReXcBdQlTeZPA-1
X-Mimecast-MFC-AGG-ID: -XxUzQ4IOReXcBdQlTeZPA_1747824141
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-70ccfe62843so53162057b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 03:42:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747824141; x=1748428941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CKNmbB10vcbsW4zmbX/wZ2PtRPWlG9QOl8Yo9wDdnoM=;
        b=Zfos9RysihDnQXoSJBrrtONTfVFvZxvjeV+waIF8gdeg2jTm2WIiCA/3GhvUSkv8eJ
         r1+WwQ8bwr5mFMaJN8OfzHpT4kw4klZRhZ0QLlejTyGxlxuZp3znrmSGCkQFKAV7aikD
         bt2PZ4pw1095PJkKuaYqR5TkmNOWw0hBdiotDRa4YKomatEY2lXffXSlTau2KoGulmOW
         vWw8Ya7LNwRYoDXidN2Me1VpyQfWCisX+/aHcKi+HmAZTe7/4A3PaeK9A+mjxsP77zee
         K61rEtqxWnVc8sdGG7v+fGBrlPjJsVzJYMqfXD58hFbZX+hFzIOED6C2KW2+cXQLumlA
         0giw==
X-Forwarded-Encrypted: i=1; AJvYcCU3OahwjAgyjYzav/KNV7PdC5qfFe42X5Dx1RVMRM8B14ekehkupJoLhSsoCjCThjeiRyb/TOple84Fxuc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIlcSwI9ovGbcpbVltPqQoA8jeUQMr1Cnhjnkl5GAwFgU4boVy
	redLB5NXFy3T219bafgQx1CdiKIicYUBAdUWnEHZPomtsHY6MGs5h3w8CTNL5aYKY+BmE66eGvC
	7GA0bOViUEiHKLCSxhWyS9G4RnGZfaiwByv6mRmAiwKJgw1XYmjSRFytO6Eqvl53W6xSa6Jlt4T
	U+NrGo8MLn2r8ZHtf4XZLQxgfWTXHRKt+AWQxKQ1ZI
X-Gm-Gg: ASbGncssdW9m7mAxsYEmakCw6MOl0scOaW/k0Epp6Bo9PD03w4o2jYNakd5wWwAhKwF
	/aglvdUvPyZM9ndSMg+CmUKU2Zlp0PfcFQzS6hZ5lNECkxACOj+ATAXV8eI/4lDw8LYAy3K0=
X-Received: by 2002:a05:690c:7489:b0:70c:ceba:16 with SMTP id 00721157ae682-70cceba054emr174587567b3.17.1747824141110;
        Wed, 21 May 2025 03:42:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFc7itCFV8Xw+8JFZwPZvK43iKB77KRF0fgP5X10fayvh+Qx9isOV/fA63yAJNt9cpK5i7uTHoJVNBN1jb2w5w=
X-Received: by 2002:a05:690c:7489:b0:70c:ceba:16 with SMTP id
 00721157ae682-70cceba054emr174587387b3.17.1747824140736; Wed, 21 May 2025
 03:42:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515033857.132535-1-npache@redhat.com> <a8bc6012-578b-412a-8dc9-fa9349feaa8b@lucifer.local>
In-Reply-To: <a8bc6012-578b-412a-8dc9-fa9349feaa8b@lucifer.local>
From: Nico Pache <npache@redhat.com>
Date: Wed, 21 May 2025 04:41:54 -0600
X-Gm-Features: AX0GCFtHdsofhzIiCk03cEhb4MTgnqpC3s_PCMaCZSWego9Gx5BB4HSyLT-TgIE
Message-ID: <CAA1CXcD8FCdCsBkyW=Ppbr-ZRD8PNmPu-3khipX0fVK3mxs-EQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] mm: introduce THP deferred setting
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	rientjes@google.com, hannes@cmpxchg.org, rdunlap@infradead.org, 
	mhocko@suse.com, Liam.Howlett@oracle.com, zokeefe@google.com, 
	surenb@google.com, jglisse@google.com, cl@gentwo.org, jack@suse.cz, 
	dave.hansen@linux.intel.com, will@kernel.org, tiwai@suse.de, 
	catalin.marinas@arm.com, anshuman.khandual@arm.com, dev.jain@arm.com, 
	raquini@redhat.com, aarcange@redhat.com, kirill.shutemov@linux.intel.com, 
	yang@os.amperecomputing.com, thomas.hellstrom@linux.intel.com, 
	vishal.moola@gmail.com, sunnanyong@huawei.com, usamaarif642@gmail.com, 
	wangkefeng.wang@huawei.com, ziy@nvidia.com, shuah@kernel.org, 
	peterx@redhat.com, willy@infradead.org, ryan.roberts@arm.com, 
	baolin.wang@linux.alibaba.com, baohua@kernel.org, david@redhat.com, 
	mathieu.desnoyers@efficios.com, mhiramat@kernel.org, rostedt@goodmis.org, 
	corbet@lwn.net, akpm@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 3:43=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Wed, May 14, 2025 at 09:38:53PM -0600, Nico Pache wrote:
> > This series is a follow-up to [1], which adds mTHP support to khugepage=
d.
> > mTHP khugepaged support is a "loose" dependency for the sysfs/sysctl
> > configs to make sense. Without it global=3D"defer" and  mTHP=3D"inherit=
" case
> > is "undefined" behavior.
>
> How can this be a follow up to an unmerged series? I'm confused by that.
Hi Lorenzo,

follow up or loose dependency. Not sure the correct terminology.

Either way, as I was developing this as a potential solution for the
THP internal fragmentation issue, upstream was working on adding
mTHPs. By adding a new THP sysctl entry I noticed mTHP would now be
missing the same entry. Furthermore I was told mTHP support for
khugepaged was a desire, so I began working on it in conjunction. So
given the undefined behavior of defer globally while any mix of mTHP
settings, it became dependent on the khugepaged support. Either way
patch 1 of this series is the core functionality. The rest is to fill
the undefined behavior gap.
>
> And you're saying that you're introducing 'undefined behaviour' on the
> assumption that another series which seems to have quite a bit of
> discussion let to run will be merged?
This could technically get merged without the mTHP khugepaged changes,
but then the reviews would probably all be pointing out what I pointed
out above. Chicken or Egg problem...
>
> While I'd understand if this was an RFC just to put the idea out there,
> you're not proposing it as such?
Nope we've already discussed this in both the MM alignment and thp
upstream meetings, no one was opposing it, and a lot of testing was
done-- by me, RH's CI, and our perf teams. Ive posted several RFCs
before posting a patchset.
>
> Unless there's a really good reason we're doing this way (I may be missin=
g
> something), can we just have this as an RFC until the series it depends o=
n
> is settled?
Hopefully paragraph one clears this up! They were built in
conjunction, but posting them as one series didn't feel right (and
IIRC this was also discussed, and this was decided).
>
> >
> > We've seen cases were customers switching from RHEL7 to RHEL8 see a
> > significant increase in the memory footprint for the same workloads.
> >
> > Through our investigations we found that a large contributing factor to
> > the increase in RSS was an increase in THP usage.
> >
> > For workloads like MySQL, or when using allocators like jemalloc, it is
> > often recommended to set /transparent_hugepages/enabled=3Dnever. This i=
s
> > in part due to performance degradations and increased memory waste.
> >
> > This series introduces enabled=3Ddefer, this setting acts as a middle
> > ground between always and madvise. If the mapping is MADV_HUGEPAGE, the
> > page fault handler will act normally, making a hugepage if possible. If
> > the allocation is not MADV_HUGEPAGE, then the page fault handler will
> > default to the base size allocation. The caveat is that khugepaged can
> > still operate on pages that are not MADV_HUGEPAGE.
> >
> > This allows for three things... one, applications specifically designed=
 to
> > use hugepages will get them, and two, applications that don't use
> > hugepages can still benefit from them without aggressively inserting
> > THPs at every possible chance. This curbs the memory waste, and defers
> > the use of hugepages to khugepaged. Khugepaged can then scan the memory
> > for eligible collapsing. Lastly there is the added benefit for those wh=
o
> > want THPs but experience higher latency PFs. Now you can get base page
> > performance at the PF handler and Hugepage performance for those mappin=
gs
> > after they collapse.
> >
> > Admins may want to lower max_ptes_none, if not, khugepaged may
> > aggressively collapse single allocations into hugepages.
> >
> > TESTING:
> > - Built for x86_64, aarch64, ppc64le, and s390x
> > - selftests mm
> > - In [1] I provided a script [2] that has multiple access patterns
> > - lots of general use.
>
> OK so this truly is dependent on the unmerged series? Or isn't it?
>
> Is your testing based on that?
Most of the testing was done in conjunction, but independent testing
was also done on this series (including by a large customer that was
itching to try the changes, and they were very satisfied with the
results).
>
> Because again... that surely makes this series a no-go until we land the
> prior (which might be changed, and thus necessitate re-testing).
>
> Are you going to provide any of these numbers/data anywhere?
There is a link to the results in this cover letter
[3] - https://people.redhat.com/npache/mthp_khugepaged_defer/testoutput2/ou=
tput.html
>
> > - redis testing. This test was my original case for the defer mode. Wha=
t I
> >    was able to prove was that THP=3Dalways leads to increased max_laten=
cy
> >    cases; hence why it is recommended to disable THPs for redis servers=
.
> >    However with 'defer' we dont have the max_latency spikes and can sti=
ll
> >    get the system to utilize THPs. I further tested this with the mTHP
> >    defer setting and found that redis (and probably other jmalloc users=
)
> >    can utilize THPs via defer (+mTHP defer) without a large latency
> >    penalty and some potential gains. I uploaded some mmtest results
> >    here[3] which compares:
> >        stock+thp=3Dnever
> >        stock+(m)thp=3Dalways
> >        khugepaged-mthp + defer (max_ptes_none=3D64)
> >
> >   The results show that (m)THPs can cause some throughput regression in
> >   some cases, but also has gains in other cases. The mTHP+defer results
> >   have more gains and less losses over the (m)THP=3Dalways case.
> >
> > V6 Changes:
> > - nits
> > - rebased dependent series and added review tags
> >
> > V5 Changes:
> > - rebased dependent series
> > - added reviewed-by tag on 2/4
> >
> > V4 Changes:
> > - Minor Documentation fixes
> > - rebased the dependent series [1] onto mm-unstable
> >     commit 0e68b850b1d3 ("vmalloc: use atomic_long_add_return_relaxed()=
")
> >
> > V3 Changes:
> > - Combined the documentation commits into one, and moved a section to t=
he
> >   khugepaged mthp patchset
> >
> > V2 Changes:
> > - base changes on mTHP khugepaged support
> > - Fix selftests parsing issue
> > - add mTHP defer option
> > - add mTHP defer Documentation
> >
> > [1] - https://lore.kernel.org/all/20250515032226.128900-1-npache@redhat=
.com/
> > [2] - https://gitlab.com/npache/khugepaged_mthp_test
> > [3] - https://people.redhat.com/npache/mthp_khugepaged_defer/testoutput=
2/output.html
> >
> > Nico Pache (4):
> >   mm: defer THP insertion to khugepaged
> >   mm: document (m)THP defer usage
> >   khugepaged: add defer option to mTHP options
> >   selftests: mm: add defer to thp setting parser
> >
> >  Documentation/admin-guide/mm/transhuge.rst | 31 +++++++---
> >  include/linux/huge_mm.h                    | 18 +++++-
> >  mm/huge_memory.c                           | 69 +++++++++++++++++++---
> >  mm/khugepaged.c                            |  8 +--
> >  tools/testing/selftests/mm/thp_settings.c  |  1 +
> >  tools/testing/selftests/mm/thp_settings.h  |  1 +
> >  6 files changed, 106 insertions(+), 22 deletions(-)
> >
> > --
> > 2.49.0
> >
>

