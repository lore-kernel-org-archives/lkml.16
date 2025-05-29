Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17F51DDA09
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 04:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748491380; cv=none; b=HxGWBKK7S4pViKo1wsMh3dmvDUTzNIbwEhFR7AEI0KxvsVK+q5tjvsEKi1tQZPA2RUmd2Dkijxpee+Sw6t3Jl6XICB+0aHyk0YG+G/KyoxJVgihGtWaf9Py0tTFkIoY+7av2XJrQcDpbJQ2PU0SQPAoE0r/UKavDcjwUFvjG0hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748491380; c=relaxed/simple;
	bh=zhm2iJuKj8i0RfMXE3b2NN5iB3OT/qdLHRZamrHUNLk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b4aXtSKXR9aJqOTjRfdp6RoBliTBoIfUYx8zj2hi0UqYwobpPV15OY2PnkiHtgUHY3NpmBHm7C07kCLF/B1wHD9IPlMLzDKuZ769MM4WgJEZpqlZzYMUhlNz8baeASWXGuFRpSd2MIMCvIYwydCDrdNQEHE+PCdWYo1FQtOwuiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i6kCMFtt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i6kCMFtt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748491376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zhm2iJuKj8i0RfMXE3b2NN5iB3OT/qdLHRZamrHUNLk=;
	b=i6kCMFtt/CTgmexa4r1atwX6FBS+Fx8SQoHl6JLfpKk+6tVEEcdpJ+Nv206BepiP6OAZQK
	F4A2xxsyBcqvyWy2pJ1jKGrJX3ok3FKrFxZaPKTPEsRq0n7R8AYpYyHbjzKhaI7VeFWTfL
	OEHkm3VybT/8ywOISIM+sGJTedpAUpM=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-306-D7PZuVkVPwutDMKRsh3VhQ-1; Thu, 29 May 2025 00:02:52 -0400
X-MC-Unique: D7PZuVkVPwutDMKRsh3VhQ-1
X-Mimecast-MFC-AGG-ID: D7PZuVkVPwutDMKRsh3VhQ_1748491372
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-70ef969b06aso9329897b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 21:02:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748491372; x=1749096172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zhm2iJuKj8i0RfMXE3b2NN5iB3OT/qdLHRZamrHUNLk=;
        b=vuKf4vo2W+SDc2Bo4AvtY2FX+KbCICrumUNhgWacure1fqFaxpUkp+VLwME2MlCNF2
         ZreHG9Tt97h5Qujfg22IHSh+Gah4rg9AnGzmH7zOEyBHkeMdnU+xpHVskHtCL4CYqzY0
         pNxDp3EUC1rxRxuJ05VkLN1aRDXlS/yKWbhUDshLHxgLMty3CLgicmOrbWrpYgeMfWkl
         W/kKV4Q+REdcfGqcF2oGq6KYBih8FffdCmfMG5Jt+7aTlHKY+Vi8g+bBKELtQhI5CHmj
         hNeoL/TFLQkKIqMxX7fHxIJDkROwZtqqMCMTRPdWW9NOOcW/ijCUTTdkQEeVB02Zn/lG
         e9JA==
X-Forwarded-Encrypted: i=1; AJvYcCUraDzmiXDlilYkDYDMR2KnlOXUIK7HUa4r27rAtMZfs3WrP+ekatGac/0yQrStXGqTwa7fH47b4IoOygI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxvQjCOC03m6TvIOS1qvcCCUp+Req7u1080ICVVe50gCEfr6F2
	5ItMYHLCnEW7Qc+Le9yz4mpd+xRDybLzPOY5Da/C21I+86vQiHEB+QAk3tBqGRG/flD3jLjATls
	KBuMQHkZiYY8Y6njDg/fCQKLhwqg4GBS2MwirBBtg1rl4NKk2KPf1BDdtE3s/9+Lxx9/Vb5iAT7
	N5g0qinclxVWc+3UmjS/nhmsybce0Sl/H28vLl44IK
X-Gm-Gg: ASbGnct49cub2c2OGVn1mc1UvxLoly6luzHGP9rVr/jP9R0H042oA3M/0rqHK1EIstQ
	xx7sDMivr0X0I6AcPOge6x9BQkBDIrkiE36kCYfKoYA2mSgU39p6mHMQJDNBS13uVHL/IGN4=
X-Received: by 2002:a05:690c:6e0a:b0:70c:b534:86b0 with SMTP id 00721157ae682-70f8b50bbabmr12814857b3.13.1748491372157;
        Wed, 28 May 2025 21:02:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwGJlK5MRnqhABRt1qihn9KAqIhm+LuBFcmX9h1Q1HwUofuAQIUVYJZCzpdmN/TvwDMjnTcYLYCFc1ZuD3UH8=
X-Received: by 2002:a05:690c:6e0a:b0:70c:b534:86b0 with SMTP id
 00721157ae682-70f8b50bbabmr12814387b3.13.1748491371794; Wed, 28 May 2025
 21:02:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515032226.128900-1-npache@redhat.com> <20250515032226.128900-7-npache@redhat.com>
 <9c54397f-3cbf-4fa2-bf69-ba89613d355f@linux.alibaba.com> <CAA1CXcC9MB2Nw4MmGajESfH8DhAsh4QvTj4ABG3+Rg2iPi087w@mail.gmail.com>
 <ed1d1281-ece3-4d2c-8e58-aaeb436d3927@linux.alibaba.com> <CAA1CXcAWcahkxzsvK_bcWei6or_gKBjt+97dqhuSem8N7cBAQw@mail.gmail.com>
 <1f00fdc3-a3a3-464b-8565-4c1b23d34f8d@linux.alibaba.com> <cf33ff99-ac97-4a33-9df0-01a59d5b8424@redhat.com>
 <e800189d-ad3d-409d-bfba-2c32a6ac66c0@linux.alibaba.com>
In-Reply-To: <e800189d-ad3d-409d-bfba-2c32a6ac66c0@linux.alibaba.com>
From: Nico Pache <npache@redhat.com>
Date: Wed, 28 May 2025 22:02:25 -0600
X-Gm-Features: AX0GCFumAmWLWAjszDpXEY6ePKI2IHSQqMTz5Qce_OEN6FILJEIdGvUcXeg58kI
Message-ID: <CAA1CXcAAbPXTHvBoSW5uxo5uH4NnQompMSsE-xG+VHGJhhiCew@mail.gmail.com>
Subject: Re: [PATCH v7 06/12] khugepaged: introduce khugepaged_scan_bitmap for
 mTHP support
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: David Hildenbrand <david@redhat.com>, David Rientjes <rientjes@google.com>, zokeefe@google.com, 
	linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, ziy@nvidia.com, 
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, ryan.roberts@arm.com, 
	dev.jain@arm.com, corbet@lwn.net, rostedt@goodmis.org, mhiramat@kernel.org, 
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

On Wed, May 28, 2025 at 8:04=E2=80=AFAM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
>
>
> On 2025/5/28 17:26, David Hildenbrand wrote:
> > On 22.05.25 11:39, Baolin Wang wrote:
> >>
> >>
> >> On 2025/5/21 18:23, Nico Pache wrote:
> >>> On Tue, May 20, 2025 at 4:09=E2=80=AFAM Baolin Wang
> >>> <baolin.wang@linux.alibaba.com> wrote:
> >>>>
> >>>> Sorry for late reply.
> >>>>
> >>>> On 2025/5/17 14:47, Nico Pache wrote:
> >>>>> On Thu, May 15, 2025 at 9:20=E2=80=AFPM Baolin Wang
> >>>>> <baolin.wang@linux.alibaba.com> wrote:
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> On 2025/5/15 11:22, Nico Pache wrote:
> >>>>>>> khugepaged scans anons PMD ranges for potential collapse to a
> >>>>>>> hugepage.
> >>>>>>> To add mTHP support we use this scan to instead record chunks of
> >>>>>>> utilized
> >>>>>>> sections of the PMD.
> >>>>>>>
> >>>>>>> khugepaged_scan_bitmap uses a stack struct to recursively scan a
> >>>>>>> bitmap
> >>>>>>> that represents chunks of utilized regions. We can then determine
> >>>>>>> what
> >>>>>>> mTHP size fits best and in the following patch, we set this
> >>>>>>> bitmap while
> >>>>>>> scanning the anon PMD. A minimum collapse order of 2 is used as
> >>>>>>> this is
> >>>>>>> the lowest order supported by anon memory.
> >>>>>>>
> >>>>>>> max_ptes_none is used as a scale to determine how "full" an order
> >>>>>>> must
> >>>>>>> be before being considered for collapse.
> >>>>>>>
> >>>>>>> When attempting to collapse an order that has its order set to
> >>>>>>> "always"
> >>>>>>> lets always collapse to that order in a greedy manner without
> >>>>>>> considering the number of bits set.
> >>>>>>>
> >>>>>>> Signed-off-by: Nico Pache <npache@redhat.com>
> >>>>>>
> >>>>>> Sigh. You still haven't addressed or explained the issues I
> >>>>>> previously
> >>>>>> raised [1], so I don't know how to review this patch again...
> >>>>> Can you still reproduce this issue?
> >>>>
> >>>> Yes, I can still reproduce this issue with today's (5/20) mm-new
> >>>> branch.
> >>>>
> >>>> I've disabled PMD-sized THP in my system:
> >>>> [root]# cat /sys/kernel/mm/transparent_hugepage/enabled
> >>>> always madvise [never]
> >>>> [root]# cat
> >>>> /sys/kernel/mm/transparent_hugepage/hugepages-2048kB/enabled
> >>>> always inherit madvise [never]
> >>>>
> >>>> And I tried calling madvise() with MADV_COLLAPSE for anonymous memor=
y,
> >>>> and I can still see it collapsing to a PMD-sized THP.
> >>> Hi Baolin ! Thank you for your reply and willingness to test again :)
> >>>
> >>> I didn't realize we were talking about madvise collapse-- this makes
> >>> sense now. I also figured out why I could "reproduce" it before. My
> >>> script was always enabling the THP settings in two places, and I only
> >>> commented out one to test this. But this time I was doing more manual
> >>> testing.
> >>>
> >>> The original design of madvise_collapse ignores the sysfs and
> >>> collapses even if you have an order disabled. I believe this behavior
> >>> is wrong, but by design. I spent some time playing around with madvis=
e
> >>> collapses with and w/o my changes. This is not a new thing, I
> >>> reproduced the issue in 6.11 (Fedora 41), and I think its been
> >>> possible since the inception of madvise collapse 3 years ago. I
> >>> noticed a similar behavior on one of my RFC since it was "breaking"
> >>> selftests, and the fix was to reincorporate this broken sysfs
> >>> behavior.
> >>
> >> OK. Thanks for the explanation.
> >>
> >>> 7d8faaf15545 ("mm/madvise: introduce MADV_COLLAPSE sync hugepage
> >>> collapse")
> >>> "This call is independent of the system-wide THP sysfs settings, but
> >>> will fail for memory marked VM_NOHUGEPAGE."
> >>>
> >>> The second condition holds true (and fails for VM_NOHUGEPAGE), but I
> >>> dont know if we actually want madvise_collapse to be independent of
> >>> the system-wide.
> >>
> >> This design principle surprised me a bit, and I failed to find the
> >> reason in the commit log. I agree that "never should mean never," and =
we
> >> should respect the THP/mTHP sysfs setting. Additionally, for the
> >> 'shmem_enabled' sysfs interface controlled for shmem/tmpfs, THP collap=
se
> >> can still be prohibited through the 'deny' configuration. The rules he=
re
> >> are somewhat confusing.
> >
> > I recall that we decided to overwrite "VM_NOHUGEPAGE", because the
> > assumption is that the same app that triggered MADV_NOHUGEPAGE triggers
> > the collapse. So the app decides on its own behavior.
> >
> > Similarly, allowing for collapsing in a VM without VM_HUGEPAGE in the
> > "madvise" mode would be fine.
> >
> > But in the "never" case, we should just "never" collapse.
>
> OK. Let's fix the "never" case first. Thanks.
Great, I will update that in the next version!
>

