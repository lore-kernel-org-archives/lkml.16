Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309FF1C2324
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 15:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744127327; cv=none; b=cdorZCRUis+x9jo3g7i7j49Qct8k/ZXZJvf6ihJAPCK9isCcjI383LtjTvFv2wwK0JxZxhgvgbXjiBiiTBACtPhuxIgQ9St3QOuv+01zcOrZF5UJdavnuC2yQse/Mb8t2lQFL6aTgyWv4hW9zuctzvE6tS7CPQNAwQJ/kztPW5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744127327; c=relaxed/simple;
	bh=RC6Cpx1V8yAPRFKIwkSicxdBp6XOQdt3wSek5RBuI/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O+6aW305PIJJFnMtx2v6ADSdYd6eGkPuV9iDd0WD/7E4hCquANj3BxzXLgOiBSOxCviqnMzUsPEoYbA41VlC48k2E6ZzmXFt2zUQlnTCzmy9rM5+oVtg5+u/9lxJBJREEViulLhPlUMfERN0u9tpVdZEvzsnj8ls1ECpHlrRuLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=y5vxAdCv; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="y5vxAdCv"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4774611d40bso324651cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 08:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744127325; x=1744732125; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HChHYMT19CAAjwRKcO44l6baW5S92cXq7xYcS0sntkc=;
        b=y5vxAdCvbvrmvQ2KizF0Aet2zEryzjUu6ndg8JtVXAGhbBeKwgzTD49utUx/LWPldP
         501zptnme4qpPh5Csq+vIQp+pj+J1Na5wtX1Z5gZyfr/YG9RCgIcMinK9z0s1gFe6ass
         EXgXa8lr6rijqy7pOhQDp32kYkMmdepcws20qsieRXCLDaN7h9T3SlDpN+lspw/BGhlJ
         aQtziV/pI56y0ErfB+mKJskEse/S8XihDYsUJVJG3gsRFsgRHKOgRZ9JIXGS6WWanpuV
         6FvBI7oS6D4ySh+FHMXZ+oYH4WKhZtMLKgarJR/wvzb5v6kAoszO4OJb/JZ+7gscjgnJ
         1yJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744127325; x=1744732125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HChHYMT19CAAjwRKcO44l6baW5S92cXq7xYcS0sntkc=;
        b=AjXxJ/9IsG6y9C876x0xhpCmnyBgMO9HaK2XnknqgPLEXUAtu7WMdkPM9wecW7CVBD
         hsL0k/udC+cMgrqqHrlqjkw5ZstzlX695t+cwpbn3iyPxPZcGkmgek5sbL4mQGSWSs8i
         BzrrAH22TcmOOtwUIvWqf2QUs1vejLaEAPlPXZJtQ8SUtIYpON27GIpF7ymGzQfBK60H
         1ZY/DkkC8wab2/n4o4zoURtyN7XKWVESUd2Ixtw5+BtFv2ng77m0NkNV0/IyQH1tq4nq
         J0iTqLEOgMtLPVb2JObvuRRuANAlY2MA4yKx8AGxsDNdF02f3sYQovXIKxfr/8Cm+zpE
         k8/A==
X-Forwarded-Encrypted: i=1; AJvYcCUD8/G+sDAhm7LY8zZaXOGGnXgO1sUTuI/MxKhBGVAkWnc9BswN2RWBAY+7/jN6q2nZEpqIZZShrxhV140=@vger.kernel.org
X-Gm-Message-State: AOJu0YzANqh45COxPLZlESn2KnhCtd3jDf8tvpHwW40/B0cQ8/cbigR+
	fVohh5ROKNzKgsOyISC/7O8iJICGFgEzCPW/0u2F7jP37504RLRg4irIAE9BJ13I04R73gWG53j
	4FO5Jfh+9sOI2FHrD7wUwyyp6Y0E7LDDGKCb2
X-Gm-Gg: ASbGncurspBRfdP7J1gcmej9mtHzpPSQrca838PqUoF2KfrwTFk8U6FIddntO8VSwFv
	v9gjpsneGOdHt65yoZezrOvhGIr+n8BX4hyreRzTh8rx6jfdRg1x4v6BV3riQ3hB7qVA+Z5cepo
	AqQnE3inQSY526mimz9H8QQmU=
X-Google-Smtp-Source: AGHT+IF9VVNpziqW+dyk31xqzQBcnnW7MNMprL13YRhaXAX0XIZc2Ds4SBXJT8rQq90Zgkg2HrJYH8ieK1DCEoRHkfg=
X-Received: by 2002:a05:622a:19a7:b0:476:f4e9:314e with SMTP id
 d75a77b69052e-47956378b7amr4383311cf.25.1744127324824; Tue, 08 Apr 2025
 08:48:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402205613.3086864-1-fvdl@google.com> <Z_Uqiu75bXhqpwm4@localhost.localdomain>
In-Reply-To: <Z_Uqiu75bXhqpwm4@localhost.localdomain>
From: Frank van der Linden <fvdl@google.com>
Date: Tue, 8 Apr 2025 08:48:33 -0700
X-Gm-Features: ATxdqUERDLs5ZmGAg6XIviO_kdQUuaBhgMOkQJccFFxKfnrrT-WebuFMeWNu_UI
Message-ID: <CAPTztWZCEvgoy-s553nTcd_qyRknaEcw3OU56H_kfePHzi3WdA@mail.gmail.com>
Subject: Re: [PATCH] mm/hugetlb: use separate nodemask for bootmem allocations
To: Oscar Salvador <osalvador@suse.de>
Cc: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, david@redhat.com, luizcap@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 6:54=E2=80=AFAM Oscar Salvador <osalvador@suse.de> w=
rote:
>
> On Wed, Apr 02, 2025 at 08:56:13PM +0000, Frank van der Linden wrote:
> > Hugetlb boot allocation has used online nodes for allocation since
> > commit de55996d7188 ("mm/hugetlb: use online nodes for bootmem
> > allocation"). This was needed to be able to do the allocations
> > earlier in boot, before N_MEMORY was set.
> >
> > This might lead to a different distribution of gigantic hugepages
> > across NUMA nodes if there are memoryless nodes in the system.
> >
> > What happens is that the memoryless nodes are tried, but then
> > the memblock allocation fails and falls back, which usually means
> > that the node that has the highest physical address available
> > will be used (top-down allocation). While this will end up
> > getting the same number of hugetlb pages, they might not be
> > be distributed the same way. The fallback for each memoryless
> > node might not end up coming from the same node as the
> > successful round-robin allocation from N_MEMORY nodes.
> >
> > While administrators that rely on having a specific number of
> > hugepages per node should use the hugepages=3DN:X syntax, it's
> > better not to change the old behavior for the plain hugepages=3DN
> > case.
> >
> > To do this, construct a nodemask for hugetlb bootmem purposes
> > only, containing nodes that have memory. Then use that
> > for round-robin bootmem allocations.
> >
> > This saves some cycles, and the added advantage here is that
> > hugetlb_cma can use it too, avoiding the older issue of
> > pointless attempts to create a CMA area for memoryless nodes
> > (which will also cause the per-node CMA area size to be too
> > small).
>
> Hi Frank,
>
> Makes sense.

Hi Oskar, thanks for looking at the patch.

>
> There something I do not quite understand though
>
> > @@ -5012,7 +5039,6 @@ void __init hugetlb_bootmem_alloc(void)
> >
> >       for_each_hstate(h) {
> >               h->next_nid_to_alloc =3D first_online_node;
> > -             h->next_nid_to_free =3D first_online_node;
>
> Why are you unsetting next_nid_to_free? I guess it is because
> we do not use it during boot time and you already set it to
> first_memory_node further down the road in hugetlb_init_hstates.

Yes, that's exactly it - it's not used, so there was no need to set
it, and I made sure it's set later.
>
> And the reason you are leaving next_nid_to_alloc set is to see if
> there is any chance that first_online_node is part of hugetlb_bootmem_nod=
es?

next_nid_to_alloc is used to remember the last node that was allocated
from in __alloc_bootmem_huge_page(), so that the next call will
continue at the node after the one that was successfully allocated
from. The code there looks a bit confusing, since the macro
for_each_node_mask_to_alloc is used there not really as a for loop,
but simply as a way of saying "try this node and remember the next
one".

I've been meaning to clean that code up for several reasons, but
didn't get around to it, it's a separate issue.

- Frank
