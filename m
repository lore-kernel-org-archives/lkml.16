Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8169C23D285
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 10:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747823020; cv=none; b=GNpB2Zio697MvrONdZ/arAhduLTeulaj4fBILb3vQIQHxYd5W3oEhdZ8nkBYxPOF9g5Y0+0BxXJe6aNSupBIPTntCbmmT99vD1d0MCZsOC1qjcColTmBafulwRIGi1TZBlQAJA3JHPMM3mlwnkvyEldmRkFQIm0ochnds6s1+5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747823020; c=relaxed/simple;
	bh=xv7tt/66OIkABhuEjqwsZTzTH6t5qT8pLzWmTfIJKYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QcUZA/z3hB+iSZ6vkRofyYf7mDBzSG7IO6cmjy/Rc86RPpVwA/QGV4NB2MfxnjPbKmoDHOioPoivwiTS3hNbdrMZv09FIZZ/7aLGVqZbvWwCcaRaNLmFdFRtWTeEnaqBJNhRCJB2HnYRuw16+KI12P/xoo9A4AdD4YEOWLTZGzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dKeU1zGx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dKeU1zGx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747823017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xv7tt/66OIkABhuEjqwsZTzTH6t5qT8pLzWmTfIJKYY=;
	b=dKeU1zGxt+C1zQNg2rT6ggZmGNcHaiInuRneAD/neCF4u1DV9Xrg079u0t7oOJKauvSp+s
	n1zltSHsMcNDX5K6QSk7ZQUPB1H5Z1uVvINvwpsaNhUuqHdOgfC2m1Dl4HCler4G7N58nf
	eapFR7rohAeiMnFThULLYOWvDo439tQ=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-364-YE8BP2Q2PCOdyvYVSxImVg-1; Wed, 21 May 2025 06:23:36 -0400
X-MC-Unique: YE8BP2Q2PCOdyvYVSxImVg-1
X-Mimecast-MFC-AGG-ID: YE8BP2Q2PCOdyvYVSxImVg_1747823015
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-708ad18b8daso86450377b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 03:23:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747823015; x=1748427815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xv7tt/66OIkABhuEjqwsZTzTH6t5qT8pLzWmTfIJKYY=;
        b=Fgy75p/Ezu+aqu5LBo//WVTZ81qwagpV5SJjDt4Vp+zY8XMAgIf3IaSX329lbFyGIg
         zCWP73P/PZGr5wAv8XOZ49p9l0sTkHKGD8nenf30RymrvdE6REgs5W4Hf2vfnXtexUw1
         Xs5ivl0ixsoOnKUe2mI/OM53M8rOelVNHcFextxGONlVHfDmRMdyZq/oELId3B98opJx
         1mi55wSIVjLFFoIbE90iP2QaWyvfGhdas8tvqHdV5nuHxMtxP54ckXoIqOHSgrR7uQo8
         USMY9nHWP8zHMhD6vFRvd4UhBXCP8aTFoWdx0JRBMgqavRvN0c2h205Lj/t86chRLLNe
         FldQ==
X-Forwarded-Encrypted: i=1; AJvYcCXU6sGGuUgI97nA4bfisgpJSbk8YgT+MAUEaaScx5i5mvJxYFOMMJOMhnfYtP1Hw/GVqtfL+YRl4bCS9Qg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/Rrd7UX7tZBMcpwr4epU7GK1XcsSQE/FcwybA/VZ92nvRNxaz
	WJT688b3J7KLAXggfQYKTLaBK1pJESkhSrpwhzruO1l1vqaSHsZMzy0JQp1spky006MBpOqKgtO
	NwhzOQHCUCaescNp2utKoM2F+q0v5AGdI1LubjGzkVQy29SWYnT00tm37+oAtA5R7pBMpsaebhS
	qi6iAMAplZkdKe2OcOk0M1rA/ciYtJvUWx48BrcGFr
X-Gm-Gg: ASbGncsugr5OGi5DUBWd2zhJvPVRP5Qrqo/QA2m7ABK7Y5bMAbP8gECX50jSZ70448N
	tWYTah0Zyw4NVIjBpcgQdoSx8icgs0jAd9dWYR13sLiLTom1WPVAh57B432cbWjR3CuZxVUg=
X-Received: by 2002:a05:690c:6a0d:b0:70c:b882:303 with SMTP id 00721157ae682-70cb88204e8mr227629477b3.20.1747823015558;
        Wed, 21 May 2025 03:23:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJAC7UDK2Ml5NUGsHXm/FBxPtG8D9yeyHOKNsViVb/TA8VxWOTgFky2CFZp36oD7EqilO5iH57ODdygTR3gfE=
X-Received: by 2002:a05:690c:6a0d:b0:70c:b882:303 with SMTP id
 00721157ae682-70cb88204e8mr227628957b3.20.1747823015210; Wed, 21 May 2025
 03:23:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515032226.128900-1-npache@redhat.com> <20250515032226.128900-7-npache@redhat.com>
 <9c54397f-3cbf-4fa2-bf69-ba89613d355f@linux.alibaba.com> <CAA1CXcC9MB2Nw4MmGajESfH8DhAsh4QvTj4ABG3+Rg2iPi087w@mail.gmail.com>
 <ed1d1281-ece3-4d2c-8e58-aaeb436d3927@linux.alibaba.com>
In-Reply-To: <ed1d1281-ece3-4d2c-8e58-aaeb436d3927@linux.alibaba.com>
From: Nico Pache <npache@redhat.com>
Date: Wed, 21 May 2025 04:23:09 -0600
X-Gm-Features: AX0GCFum_mHPuN2v2FqWBQ4JkPTMjA_oDiuLTJ8VITx5jEG1VUxuZREHd37-1c0
Message-ID: <CAA1CXcAWcahkxzsvK_bcWei6or_gKBjt+97dqhuSem8N7cBAQw@mail.gmail.com>
Subject: Re: [PATCH v7 06/12] khugepaged: introduce khugepaged_scan_bitmap for
 mTHP support
To: Baolin Wang <baolin.wang@linux.alibaba.com>, David Rientjes <rientjes@google.com>, 
	zokeefe@google.com
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	david@redhat.com, ziy@nvidia.com, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, ryan.roberts@arm.com, dev.jain@arm.com, 
	corbet@lwn.net, rostedt@goodmis.org, mhiramat@kernel.org, 
	mathieu.desnoyers@efficios.com, akpm@linux-foundation.org, baohua@kernel.org, 
	willy@infradead.org, peterx@redhat.com, wangkefeng.wang@huawei.com, 
	usamaarif642@gmail.com, sunnanyong@huawei.com, vishal.moola@gmail.com, 
	thomas.hellstrom@linux.intel.com, yang@os.amperecomputing.com, 
	kirill.shutemov@linux.intel.com, aarcange@redhat.com, raquini@redhat.com, 
	anshuman.khandual@arm.com, catalin.marinas@arm.com, tiwai@suse.de, 
	will@kernel.org, dave.hansen@linux.intel.com, jack@suse.cz, cl@gentwo.org, 
	jglisse@google.com, surenb@google.com, hannes@cmpxchg.org, mhocko@suse.com, 
	rdunlap@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 4:09=E2=80=AFAM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
> Sorry for late reply.
>
> On 2025/5/17 14:47, Nico Pache wrote:
> > On Thu, May 15, 2025 at 9:20=E2=80=AFPM Baolin Wang
> > <baolin.wang@linux.alibaba.com> wrote:
> >>
> >>
> >>
> >> On 2025/5/15 11:22, Nico Pache wrote:
> >>> khugepaged scans anons PMD ranges for potential collapse to a hugepag=
e.
> >>> To add mTHP support we use this scan to instead record chunks of util=
ized
> >>> sections of the PMD.
> >>>
> >>> khugepaged_scan_bitmap uses a stack struct to recursively scan a bitm=
ap
> >>> that represents chunks of utilized regions. We can then determine wha=
t
> >>> mTHP size fits best and in the following patch, we set this bitmap wh=
ile
> >>> scanning the anon PMD. A minimum collapse order of 2 is used as this =
is
> >>> the lowest order supported by anon memory.
> >>>
> >>> max_ptes_none is used as a scale to determine how "full" an order mus=
t
> >>> be before being considered for collapse.
> >>>
> >>> When attempting to collapse an order that has its order set to "alway=
s"
> >>> lets always collapse to that order in a greedy manner without
> >>> considering the number of bits set.
> >>>
> >>> Signed-off-by: Nico Pache <npache@redhat.com>
> >>
> >> Sigh. You still haven't addressed or explained the issues I previously
> >> raised [1], so I don't know how to review this patch again...
> > Can you still reproduce this issue?
>
> Yes, I can still reproduce this issue with today's (5/20) mm-new branch.
>
> I've disabled PMD-sized THP in my system:
> [root]# cat /sys/kernel/mm/transparent_hugepage/enabled
> always madvise [never]
> [root]# cat /sys/kernel/mm/transparent_hugepage/hugepages-2048kB/enabled
> always inherit madvise [never]
>
> And I tried calling madvise() with MADV_COLLAPSE for anonymous memory,
> and I can still see it collapsing to a PMD-sized THP.
Hi Baolin ! Thank you for your reply and willingness to test again :)

I didn't realize we were talking about madvise collapse-- this makes
sense now. I also figured out why I could "reproduce" it before. My
script was always enabling the THP settings in two places, and I only
commented out one to test this. But this time I was doing more manual
testing.

The original design of madvise_collapse ignores the sysfs and
collapses even if you have an order disabled. I believe this behavior
is wrong, but by design. I spent some time playing around with madvise
collapses with and w/o my changes. This is not a new thing, I
reproduced the issue in 6.11 (Fedora 41), and I think its been
possible since the inception of madvise collapse 3 years ago. I
noticed a similar behavior on one of my RFC since it was "breaking"
selftests, and the fix was to reincorporate this broken sysfs
behavior.

7d8faaf15545 ("mm/madvise: introduce MADV_COLLAPSE sync hugepage collapse")
"This call is independent of the system-wide THP sysfs settings, but
will fail for memory marked VM_NOHUGEPAGE."

The second condition holds true (and fails for VM_NOHUGEPAGE), but I
dont know if we actually want madvise_collapse to be independent of
the system-wide.

So I'll ask the authors
+David Rientjes +zokeefe@google.com
Was this brought up as a concern when this feature was first
introduced, was there any pushback, what was the outcome of the
discussion if so?
I can easily fix this and it would further simplify the code (by
removing the is_khugepaged and friends). As David H. has brought up in
other discussions around similar topics, never should mean never, is
this the only exception we should allow?

Thanks!
>
> > I can no longer reproduce this issue, that's why I posted... although
> > I should have followed up, and looked into what the original issue
> > was. Nothing really sticks out so perhaps something in mm-new was
> > broken and pulled out... not sure.
> >
> > It should now follow the expected behavior, which is that no mTHP
> > collapse occurs because if the PMD size is disabled so is khugepaged
> > collapse.
> >
> > Lmk if you are still experiencing this issue please.
> >
> > Cheers,
> > -- Nico
> >>
> >> [1]
> >> https://lore.kernel.org/all/83a66442-b7c7-42e7-af4e-fd211d8ed6f8@linux=
.alibaba.com/
> >>
>

