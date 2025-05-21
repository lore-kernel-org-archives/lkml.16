Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15AD1A238F
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 18:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747852583; cv=none; b=cmKZ/7S0vKSA+2QSaeRH4qWFVaJ3uTw535GTmbKbptsDydHtGD1ll/06NYkV25C3ipjSorRimArC97DP4i6IPv6awkO80EAUxR5XSWwzdtjdHD+89+etRAS+/mdW4Yb0JOiA8fRUj7uQ0CpXM5eZOxSL0JLUGa+PzmEaUqG1A0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747852583; c=relaxed/simple;
	bh=d3SVSn80A89VtHlOJJwihePJqkplewKhlFr2+GPhkBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uXTwPmgCQ2AUvFw8ma5mfcjsmIegQ70zv32YsyK7UC9g853zXGSKGJyfglprDJS1E+E5N/OsoUd1zK1fecvLS9k8ivRLVo70GoiuopEha6snl/wty4k/uqBLI920WKoPhkWBUgGz2NYq6fmPBIWxP4F3W29WzU+ogDQ88rRg6nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DunNqXxQ; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DunNqXxQ"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6f8c53aeedbso96683966d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 11:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747852580; x=1748457380; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d3SVSn80A89VtHlOJJwihePJqkplewKhlFr2+GPhkBM=;
        b=DunNqXxQVOC2VjYUjcpYGvRddoa8OPb28dqouGBDd05pNmc72+Citrd8w4GsFkgqvk
         u46ntXtolGnM480JwE9Z3Ho5GZHHNw/W2hhB36S6kDjuBhjgirc7xEa9Xs2RINP4U322
         jK7soTEv2RAvA5zIcdkPlEXO/9KfFVK76bIP1qR+8e56zGkc/jrUQK6uVz1JMcMXoHYX
         ken4ZzRUsrh2+i6+6MxI2j3Y8tID+O1yhx5mJGTXSUq5hMxhqECxlQdmqMezDYxYGfE8
         oEkDnZ2LzLnFZDAycwRhGN/iQMZnEVX7u4hTytaZsdQcKGFYU5VuQdT9WDxMrdPXbZlB
         wnZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747852580; x=1748457380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d3SVSn80A89VtHlOJJwihePJqkplewKhlFr2+GPhkBM=;
        b=SbrTa3rRpUg3yBrC/MpuYJIHEnCmoJcHpYAVnkF19HNEUxIEpv7A2JinzLPaloOgpf
         Sm8h0pk00RvPl7Ol34oYaDIC6nFkSL06misTNh9OEAr14pr0oALyYETk9G48z45r/pjh
         zYM2CLhaZJVEkKxtFpIANh5eeShfTd5LCz+leQnqKDOwXFJI2lWiCjMX/MVJIg4OzdS0
         89p8pAtQZoHaXLq5EOuTv09klNpOUEs/k4x9fDrlisXMmlhRv9upETILBXZuuHKS+UVp
         FgvsG7IkXvO6L/rsb8tjU2RBGUjJvwu3cxmaQEEALmZeOKLr3ikCTtWIU9TlEddda+cg
         zF6A==
X-Forwarded-Encrypted: i=1; AJvYcCVZHNbtRHzRqRu6snO2kTTORN5pN3TfeM6sEwWI+WOOgxTH3w+YFfp28YBEo3VidlYW6g6xbwcjMJG8jok=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrsvswY5L1AZZjbJkTa/Aavjb2t/wzhIY9cx28bgBvTI62ys78
	2o1Msx1rTnUXlb48nXtN4xqQyc2cw/+zjEZTJNLKQ219MitvZVrQrlb/cQBhyZV1tsW3TIfiYwF
	VEnnSv5LPwGxqVMKr5mpUPN7UO0CJlnE=
X-Gm-Gg: ASbGncuYcM/6jE1UAp4D4ms62fXm8UpRzHHay4nwFjMRvHxKL25t2jUHqR2DhZ+nCo5
	DCbTmhE+9EnZNl4vCIFveV6L+9nvsU/jhMhcd+jBLtYB36w3ftFmuPhDu9JfvffpFpPYfP6ywxU
	2UdqPyUQ/lcojwb3iWGKiFczxH414yPtAcBA==
X-Google-Smtp-Source: AGHT+IE8Iza4954QdCbMrwJijNWRK7AMVEUlTp1V/uCTwoWWz3UsGzoDHW7UKvwUVQpAfgciyAvqnSfWKp3QDZrnxaA=
X-Received: by 2002:a05:6214:226e:b0:6d4:dae:6250 with SMTP id
 6a1803df08f44-6f8b2d15075mr394285706d6.34.1747852580529; Wed, 21 May 2025
 11:36:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514201729.48420-1-ryncsn@gmail.com> <20250514201729.48420-29-ryncsn@gmail.com>
In-Reply-To: <20250514201729.48420-29-ryncsn@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 21 May 2025 11:36:09 -0700
X-Gm-Features: AX0GCFtgXDGcFnhZPDoJcbzmoW65Hwzramks9leMjiZTXzojzSJvlilAmNu1kE0
Message-ID: <CAKEwX=MmD___ukRrx=hLo7d_m1J_uG_Ke+us7RQgFUV2OSg38w@mail.gmail.com>
Subject: Re: [PATCH 28/28] mm, swap: implement dynamic allocation of swap table
To: Kairui Song <kasong@tencent.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Matthew Wilcox <willy@infradead.org>, Hugh Dickins <hughd@google.com>, Chris Li <chrisl@kernel.org>, 
	David Hildenbrand <david@redhat.com>, Yosry Ahmed <yosryahmed@google.com>, 
	"Huang, Ying" <ying.huang@linux.alibaba.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Baoquan He <bhe@redhat.com>, 
	Barry Song <baohua@kernel.org>, Kalesh Singh <kaleshsingh@google.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Tim Chen <tim.c.chen@linux.intel.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 1:20=E2=80=AFPM Kairui Song <ryncsn@gmail.com> wrot=
e:
>
> From: Kairui Song <kasong@tencent.com>
>
> Now swap table is cluster based, which means free clusters can free its
> table since no one should modify it.
>
> There could be speculative readers, like swap cache look up, protect
> them by making them RCU safe. All swap table should be filled with null
> entries before free, so such readers will either see a NULL pointer or
> a null filled table being lazy freed.
>
> On allocation, allocate the table when a cluster is used by any order.
>
> This way, we can reduce the memory usage of large swap device
> significantly.
>
> This idea to dynamically release unused swap cluster data was initially
> suggested by Chris Li while proposing the cluster swap allocator and
> I found it suits the swap table idea very well.
>
> Suggested-by: Chris Li <chrisl@kernel.org>
> Signed-off-by: Kairui Song <kasong@tencent.com>

Nice optimization!

However, please correct me if I'm wrong - but we are only dynamically
allocating the swap table with this patch. What we are getting here is
the dynamic allocation of the swap entries' metadata (through the swap
table), which my virtual swap prototype already provides. The cluster
metadata struct (struct swap_cluster_info) itself is statically
allocated still (at swapon time), correct? That will not work for a
large virtual swap space :( So unfortunately, even with this swap
table series, swap virtualization is still not trivial - definitely
not as trivial as a new swap device type...

Reading your physical swapfile allocator gives me some ideas though -
let me build it into my prototype :) I'll send it out once it's ready.
