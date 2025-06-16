Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4D91D6DB5;
	Mon, 16 Jun 2025 14:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750083430; cv=none; b=nKyfYk4nHjNAfkwkEdScn2nvVU0J4R82nYDRN/TSVxI/7/bR6qstM4hElu6G/O4xErEMzi2oiuKdRymPoxYK1HeVnqdeStoxDC/809NZiTzvnAjLLprnUEXhH4VwfSJPhH0JsMvcnz5AnnSaR35ys/wBMF7AL8NaknLftXrIXFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750083430; c=relaxed/simple;
	bh=eP6PuM+64K5CWtrRCBbwXKZnsU5mxw6QkvsFbixFqYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T+b22kxJi0OnojXLHQbr5fhJVfWaNWfNJflNfmLTW9C3UaOvswpfk7sCkd6yA8hcywkBxuzIDgtFBVY1/FxRDN5e/7lqTpEUVlvfU7zGaA+dM9hv6Xv/frwcam0JoVItTOZ4X8z1wHCaPiaP9LqIy9/5EcMVbziW7Y9UNXTLnVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fAgauei0; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fAgauei0"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6095de12d62so1550265a12.1;
        Mon, 16 Jun 2025 07:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750083427; x=1750688227; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eP6PuM+64K5CWtrRCBbwXKZnsU5mxw6QkvsFbixFqYU=;
        b=fAgauei0P9Md/AapoGhTU8kqKKmKHOfCFxa7L33imhh5/YQYKY5ndu5M8QZSRvNXdG
         JU4y9gl/ZpZKBXqKvJrqte54BprYMno+nEHxlPFpWX6bd90bpm2YLAVobSLU9+CxiwWc
         fKKjJORzuetIjl93FFSo8+uqvfja/UV1ZIzTJnmqLMOnDXQDJiSPX85JcHc3CHxMtFOs
         RB0Qj7NkFgeVbViUOAW15ofJhvWVZphOKswWzzjuyicb+Q4sh/Mqx4I1c5c7MmQB0esj
         iKAN2u7kREfPgABnlO7CuJomySR5ujthTtRhxD3SM0jNJpsc3BjLhR5831vy3N+73SFR
         m+dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750083427; x=1750688227;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eP6PuM+64K5CWtrRCBbwXKZnsU5mxw6QkvsFbixFqYU=;
        b=PKG5H0rcw0suUK6pcoPCNHGSC2YCnLD66CBAy5tkuP/7zfzW5UPc+gVrb/IRfKon8A
         K9TxwEoa9/yPiaJiHi7f2pUrMChL0hVJ+VtGCP2SQtmNWMgCz7dxpFpTeMOLNwOlsoZs
         QGVYFpoQ7A6rTbeMFZo2+dnprnEV6l9OsVYzUaEN1MWxrOdD2FOC/sxh2VvYgznZaagM
         +hOWD2vVnYRi80HWOD+bSrqI3sacEj7808kyrN2lDDiUoaxEFQ3zt+sZJtwZlkvh7dTq
         0RygUdbGo5eAfVjQWeWygSiyGCq5leNhzo2/ZoN/F85/JFO/+2vwOaIvxsKfY+Z+Q9ys
         e5HA==
X-Forwarded-Encrypted: i=1; AJvYcCUm5GaySzNqqONrWo2mJFvkT2Bpr9bTWs4ht12a5PDc4gqR9psE1jeuynnQFDeCKbe9/GxB749hXaE=@vger.kernel.org, AJvYcCXq4d5z2N1jlrRe5DklLKBdwutSjN5OTZC5NZDvc+JK9yS1pA3CpiwxAstXD9/4dHMpyHDeVDYDkYkrK0ZZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxRf4Z/MHq+6Ao6gdYbX06LKs5616fRXrdWaTeTQApVs/Wm4Jcp
	Aq209PRG4DqwnPLTJOhn1Gc2l/zGgkZgAl1p25jXzOBW0WU0YeSWKFE/yYa2Szxl9DObEmZB4rg
	fZs0yVYyPFVQMBqp9vt+GMfw1WXfo8LE=
X-Gm-Gg: ASbGncvS1xSiAvrbx2MKwLqk/Lm/+w3m/ELJZE2AwDKxf+Ab8dgOwJrJvVJvCZBlQis
	S6LAJ2K5/nOvpM5ZQQmOtJtERwaBgC+6tATUFvJ/l7BuKxS1NsqM0KTZrUOBFlZvz0WXAIhImeY
	fKCByViH5z3wTbYWy402cZZsyIH4I8dHM7KbUMtWReBX/pr79acgBk2vKiFlDVJn9GJtWwHg462
	T8pJA==
X-Google-Smtp-Source: AGHT+IG36AYu/aqp41xnF1pJkXFnqEk2HCgmA8jDS9zdCLJ74WU28G5N0cZpsN3g7yXaxRPiI8ZvSI/MMogdMmVSBfg=
X-Received: by 2002:a17:906:9fc5:b0:ad8:6dc0:6a8a with SMTP id
 a640c23a62f3a-adf9bfdd52fmr854559366b.1.1750083426656; Mon, 16 Jun 2025
 07:17:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612181330.31236-1-bijan311@gmail.com> <20250612181330.31236-2-bijan311@gmail.com>
 <5a50eeba-b26d-4913-8016-45278608a1ee@redhat.com> <CAMvvPS5U8exSvy0fknfhv8ym_dKgMVa7cfMOqn0fGyd+NSjSuQ@mail.gmail.com>
 <e40aa590-f0a2-4666-84b0-c33c8f4fef87@redhat.com>
In-Reply-To: <e40aa590-f0a2-4666-84b0-c33c8f4fef87@redhat.com>
From: Bijan Tabatabai <bijan311@gmail.com>
Date: Mon, 16 Jun 2025 09:16:55 -0500
X-Gm-Features: AX0GCFtYGWGWkDqtRWR9qfiUop7Yc8zxOn5BNjJ8enw3Dihp3CCnDxICYmQLo6k
Message-ID: <CAMvvPS5bTUfAXy4g79tAq+1DWKX79b33Jt=UNBg-xR9BDa7FdA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] mm/mempolicy: Expose policy_nodemask() in include/linux/mempolicy.h
To: David Hildenbrand <david@redhat.com>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sj@kernel.org, akpm@linux-foundation.org, 
	corbet@lwn.net, ziy@nvidia.com, matthew.brost@intel.com, 
	joshua.hahnjy@gmail.com, rakie.kim@sk.com, byungchul@sk.com, 
	gourry@gourry.net, ying.huang@linux.alibaba.com, apopple@nvidia.com, 
	bijantabatab@micron.com, venkataravis@micron.com, emirakhur@micron.com, 
	ajayjoshi@micron.com, vtavarespetr@micron.com, damon@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 4:46=E2=80=AFAM David Hildenbrand <david@redhat.com=
> wrote:
>
> On 13.06.25 18:33, Bijan Tabatabai wrote:
> > On Fri, Jun 13, 2025 at 8:45=E2=80=AFAM David Hildenbrand <david@redhat=
.com> wrote:
> >>
> >> On 12.06.25 20:13, Bijan Tabatabai wrote:
[...]
> Hi,
>
> >
> > I did not use get_vma_policy or mpol_misplaced, which I believe is the
> > closest function that exists for what I want in this patch, because
> > those functions
>
> I think what you mean is, that you are performing an rmap walk. But
> there, you do have a VMA + MM available (stable).
>
> > seem to assume they are called inside of the task that the folio/vma
> > is mapped to.
>
> But, we do have a VMA at hand, so why would we want to ignore any set
> policy? (I think VMA policies so far only apply to shmem, but still).
>
> I really think you want to use get_vma_policy() instead of the task polic=
y.

Sorry, I think I misunderstood you before. You are right, we should
consider the VMA policy before using the task policy. I will do this
in the next revision.

>
> > More specifically, mpol_misplaced assumes it is being called within a
> > page fault.
> > This doesn't work for us, because we call it inside of a kdamond proces=
s.
>
> Right.
>
> But it uses the vmf only for ...
>
> 1) Obtaining the VMA
> 2) Sanity-checking that the ptlock is held.
>
> Which, you also have during the rmap walk.

There is another subtle dependency in get_vma_policy.
It first checks if a VMA policy exists, and if it doesn't, it uses the
task policy of the current task, which doesn't make sense when called
by a kdamond thread.

However, I don't think this will change what seems to be our consensus
of adding a new helper function.

>
> So what about factoring out that handling from mpol_misplaced(), having
> another function where you pass the VMA instead of the vmf?
>
> >
> > I would be open to adding a new function that takes in a folio, vma,
> > address, and
> > task_struct and returns the nid the folio should be placed on. It could=
 possibly
> > be implemented as a function internal to mpol_misplaced because the two=
 would
> > be very similar.
>
> Good, you had the same thought :)
>
> >
> > How would you propose we handle MPOL_BIND and MPOL_PREFFERED_MANY
> > in this function? mpol_misplaced chooses a nid based on the node and
> > cpu the fault
> > occurred on, which we wouldn't have in a kdamond context. The two optio=
ns I see
> > are either:
> > 1. return the nid of the first node in the policy's nodemask
> > 2. return NUMA_NO_NODE
> > I think I would lean towards the first.
>
> I guess we'd need a way for your new helper to deal with both cases
> (is_fault vs. !is_fault), and make a decision based on that.
>
>
> For your use case, you can then decide what would be appropriate. It's a
> good question what the appropriate action would be: 1) sounds better,
> but I do wonder if we would rather want to distribute the folios in a
> different way across applicable nodes, not sure ...

Yes, I was thinking about that too, but I felt that adding state
somewhere or using randomness to distribute the folios was incorrect,
especially since those policies are not the focus of this patchset.

I think I'll move forward with option 1 for now.

Thanks,
Bijan
