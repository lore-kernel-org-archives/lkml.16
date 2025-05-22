Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEBB2914
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 04:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747887240; cv=none; b=mTcjlpP3FuiqRR4aZ006OqpN3sR9Bmsm1v3jBRLqE3ceDpZKnMCDYHHwuDvxC4jwYEBPIDep+kMVaLxxskmzXmkbulPMpEdf2aRRd9FZpFXVFHjZkv9JrcdKT1xQZs1/F/jE8g0Xb4kL+z95aM3SVIVKc9tfvRv+s3kycBYU3Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747887240; c=relaxed/simple;
	bh=Bte9CFdj+wrGfjA+R6p82brPFpWF/WUa3+uYva1Cp1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rqyiviEV07YKA188huham2e3CvJTMvOuLbO6+b2dlyxh0lqK8/hM7PNmh+0/GJZbadtB0HrafQPo21y9RWQucU5wFwMPJrPiqo3+Z4z73u0xTLy22ZSJWa+X6buHB07obK0E4cM2TAPDMaNsSZoTHHXFv6R3UA2pbKZ1Gp16Gqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YE7iz9Zq; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YE7iz9Zq"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-551f00720cfso5549335e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 21:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747887237; x=1748492037; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bte9CFdj+wrGfjA+R6p82brPFpWF/WUa3+uYva1Cp1I=;
        b=YE7iz9Zq/ddkLSbiHbKYONyF6aCP86RJS60NdPQYAh5nfI1Muvwqw3P7YRzVuTgtyK
         th8AO1AZoz8cbnp/xlDqA4VYPOlhKrQea4J1nYRfMTLa0SvE91bxQZb9852lfuQFnU2a
         ELaVlbtSagSXMJrDUWFkcAtSdPfjwNnUz0gTC450TGNVbrXHykPDwBMKejuPaN6OFLt8
         uqpOBulXQ94cb5FjnmW8ggLrFGD0x3HSN1SR9ne6zJOpgHqDEE5xcHVrlFYrUTKVfJ6k
         zFFdbdMa0RbW8NRnq6a+HxfzyfwmTnW4cu7zicIf+Iq4owIYEfDQN+VoYb9rctkGzNt8
         NeSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747887237; x=1748492037;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bte9CFdj+wrGfjA+R6p82brPFpWF/WUa3+uYva1Cp1I=;
        b=CYNVRCaZZjGrhp9cx4tf6TEJNuu6jhK38oFoOkz75qYvU2YzbEfuaaOtGC/0Czw72L
         qFi1acg8e+A51IobOpzmZkYGb7o3DgjB8tD1hxPoGloGNn70vIdi6dzuKmVQBn8GOGfp
         105O7bW/WFZY0Eacp/GHdOvk5REsraJV9UNkv0F+2xxbGq0hkcl7LCaqRXvaaQI1At/h
         iL3xaNvNN1iznH4o8mbbrdip6BjwQdONsqoj1A/rzlA8R6LeK8HQxvujc+ctlcy3g/BL
         zCNVK9WiWWNMOqDYa8EV4KnmDKqHIrmMeGo0FUE4iDfNeIre665B1moPT91HpY7zBeSK
         xOBw==
X-Forwarded-Encrypted: i=1; AJvYcCVMjl2QgBdbt5XuI8FRGQQT0TilPqAVi+pPXcDDduWIoRVVy1qMvXx0tx+7TAwd6j3lnunC8rXosTbYW9U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYEgCNfAWBeE1iJgfksce8x7/rn1mhRcfxmqALazPYeo2N+vHM
	S3IHWIQKhfB/O+I0U/w5QhErNS++7gi8FVEc6ryKYSCAU14odTYP/FfFBimNUTI+EKkozPCGw21
	aIxldQxxeLhclR3Lsz2WzZaKxgDy6GvA=
X-Gm-Gg: ASbGnctQdqD6a1w0vw2lHg9PnUpTQ/3tKnmlhGI2e/OU6m3/GkW/s+F1Gz50gI6/zX5
	md92/PkKP/ohZkaOscASvWOqP4/rbGGofYKeImO5EjQxX+wNUeQ6fyGPBSjr2fEuCZfBf5GDIgF
	Tmjlew9RTqjHhOVzP8xvNRp490BubP15u5LEonsHnk20c=
X-Google-Smtp-Source: AGHT+IHT28IBBwTi8/+xS4G/RjJiiVmRxQ0cf/TimQs9dpEiYDfpdr93GdWkjVmnq0QPAXPpzqIXR8XBFXD9AfS6Sk0=
X-Received: by 2002:a05:6512:671c:b0:54b:117b:b54b with SMTP id
 2adb3069b0e04-550e725bb73mr6915713e87.54.1747887236454; Wed, 21 May 2025
 21:13:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514201729.48420-1-ryncsn@gmail.com> <20250514201729.48420-29-ryncsn@gmail.com>
 <CAKEwX=MmD___ukRrx=hLo7d_m1J_uG_Ke+us7RQgFUV2OSg38w@mail.gmail.com>
In-Reply-To: <CAKEwX=MmD___ukRrx=hLo7d_m1J_uG_Ke+us7RQgFUV2OSg38w@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Thu, 22 May 2025 12:13:37 +0800
X-Gm-Features: AX0GCFuXRYMgoPNwD3rP7zPji66BkOaor9fW7saRZdo0olNBGsFnKTY6nd02tFc
Message-ID: <CAMgjq7CM8-ZyQ5E-6Qwky5uwx+w=nrc4_nMX0oWHzv3Q3xz=Lg@mail.gmail.com>
Subject: Re: [PATCH 28/28] mm, swap: implement dynamic allocation of swap table
To: Nhat Pham <nphamcs@gmail.com>
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

On Thu, May 22, 2025 at 3:38=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrote=
:
>
> On Wed, May 14, 2025 at 1:20=E2=80=AFPM Kairui Song <ryncsn@gmail.com> wr=
ote:
> >
> > From: Kairui Song <kasong@tencent.com>
> >
> > Now swap table is cluster based, which means free clusters can free its
> > table since no one should modify it.
> >
> > There could be speculative readers, like swap cache look up, protect
> > them by making them RCU safe. All swap table should be filled with null
> > entries before free, so such readers will either see a NULL pointer or
> > a null filled table being lazy freed.
> >
> > On allocation, allocate the table when a cluster is used by any order.
> >
> > This way, we can reduce the memory usage of large swap device
> > significantly.
> >
> > This idea to dynamically release unused swap cluster data was initially
> > suggested by Chris Li while proposing the cluster swap allocator and
> > I found it suits the swap table idea very well.
> >
> > Suggested-by: Chris Li <chrisl@kernel.org>
> > Signed-off-by: Kairui Song <kasong@tencent.com>
>
> Nice optimization!

Thanks!

>
> However, please correct me if I'm wrong - but we are only dynamically
> allocating the swap table with this patch. What we are getting here is
> the dynamic allocation of the swap entries' metadata (through the swap
> table), which my virtual swap prototype already provides. The cluster
> metadata struct (struct swap_cluster_info) itself is statically
> allocated still (at swapon time), correct?

That's true for now, but noticing the static data is much smaller and unifi=
ed
now, and that enables more work in the following ways:
(I didn't include it in the series because it is getting too long already..=
)

The static data is only 48 bytes per 2M swap space, so
for example if you have a 1TB swap device / space, it's only 20M
in total, previously it would be at least 768M (could be much higher
as I'm only counting swap_map and cgroup array here).
Now the memory overhead is 0.0019% of the swap space.

And the static data is now only an intermediate cluster table, and only
used in one place (si->cluster_info), so reallocating is doable now:
Readers of the actual swap table are protected by RCU and won't
modifying the cluster metadata, the only updater of cluster metadata
is allocation/freeing, and they can be organized in better ways to
allow the cluster data to be reallocated.

And due to the low memory overhead of cluster metadata, it's totally
acceptable to preallocate a much larger space now, for example we can
always preallocate a 4TB space on boot, tha't 80M in total. Might
seems not that trivial, but there is another planned series to make
the vmalloc space dynamic too, leverage the page table directly, so
the 20M per TB overhead can be avoided too. Not sure if it will be
needed though, the overhead is so tiny already.

So in summary what I have in mind is we can either:
- Extend the cluster data when it's not enough (or getting fragmented),
since the table data is still accessible during the reallocate and copied
data is minimal, so it shouldn't be a heavy lifting operation.
- Preallocate a larger amount of cluster data on swapon, the
overhead is still very controllable.
- (Once we have a dynamic vmalloc) preallocate a super large space
for swap and allocate each page when needed.

These ideas can be somehow combined, or related to each other.

> That will not work for a
> large virtual swap space :( So unfortunately, even with this swap
> table series, swap virtualization is still not trivial - definitely
> not as trivial as a new swap device type...
>
> Reading your physical swapfile allocator gives me some ideas though -
> let me build it into my prototype :) I'll send it out once it's ready.
>

Yeah, a virtual swap is definitely not trivial, instead it's
challenging and very important, just like you have demonstrated.
It requires quite some work other than just metadata level things,
I never expected it to be just as simple as a "just another swap
table entry type" :)
What I meant is that to be done with minimal overhead and better
flexibility, swap needs better infrastructures, which this series is workin=
g on.
