Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE87D248869
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 19:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749842385; cv=none; b=kgrAHHEwiTVtg0GQaqw9P8+hiRjU/cP3H7xIwm+hQvkcuhTyf2oMoMdoBt8GInWX+/r79nyFX2T/ofC4Mx+6uBFPCmRUA2qciaN6EOd/WPs2rtOeyymwBzFu5dPZw/GvvK51knl/IlSPtI0Z8lic6D6jX2N7JfhielFmiNaRO8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749842385; c=relaxed/simple;
	bh=pM17luptOPApGFcmRyWk1htxZ0mNvfQwmub7ljr5iN4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nn9Fho2qL15gN23Oex6/siM95hYi+bkDQYwfraDbKTmvY9UmWvHK+tF7ONVf1TBuMqkV3T53HivQlbH3SQCuWD7JVPuCA69bdVLdfTd06Tgy8NrBTUjORsg9yqNw7fq7Ca7MZFR39Ks3Tl7VLTRZgVACxOO4hi059IMoWulTVc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cYfTCe6B; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cYfTCe6B"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4a58ef58a38so30491cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 12:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749842383; x=1750447183; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ls4Y9HoT9VEjZR6n9L8mMlDWt5VvuU4t30VU2btZu64=;
        b=cYfTCe6BSap1DF4SsVBI841wROw4zSvbrq/0JCSnzXSJicRhZYepPjyOkmDrwtmRKX
         XLl62YpTdzbSkzwjEPYKQj5uBssIsQAWHwvxQS/Di0OUXys5i6XHvsmOOD30EUFTN3Y7
         uwNhHbIyQ7k2CIlNpqnwkEUqj9rsQiv6fB11urZ0i8rS3ztJeKcX51lAXBUqDn3WpCDy
         guZttu+N++AU4QECKygrXiqNjbTwxz9hgZZJPv25pK0ljGb84kooDVQqapnozCW1gxqB
         qrYsgJi57gqeAUQq5cGDVS2TXW8Ws+FfR3OLK/jDeTjdKujoS1mUQQzoykto2/SV1gJF
         uEKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749842383; x=1750447183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ls4Y9HoT9VEjZR6n9L8mMlDWt5VvuU4t30VU2btZu64=;
        b=OW6/4NIqeG2JpMP5w9IItpMk+kmsQ9Ua72gVTCX1HJk8FKChAWIXEeCdKZtUJhfzKW
         nPgA9cfw9LQIRazQQkHo4He0b5XIuedtHKwzdfKyRADJlci0wbaNRnuvcyksEwt8PJoL
         xocDMsLQKqLxCCrBpWZNQ2lnkmkdC+kAUKvcpdTfeLvb/m4k9XAM+kSHqLM6qwCOpnCc
         i1us88B1TCendPWGzvhtNFyvm4vDQ5+RhIdBBaU+Cb2jJomD/eX4lEY2yYIoGn4/MOOJ
         vmADFMlXEV0qjlVAV4NujrhHXsDyFJdrkT/zPZIFBJYLStlxN5ULzvS4Eq6Aw7g7EMwg
         yWzA==
X-Forwarded-Encrypted: i=1; AJvYcCXwVcf1iu+fxnVdQ2c3rbGZWfkh7dNZrKjEd7EAyjxDClNYTtOk/rWSRtIbGfx8S8IOKgzSI6xNsdJYyUg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKVByPUt0KMq3OLlzgZMCGnEQdU66+zeFhAVhumDyEW0MxFeoN
	ZC/ZFTd0T0fdd8jlTulnj9G6ZUitmJmVSjahjG0Ohs9Er19PHooRPgXUsCKwlNHUz6qEzgfP7p2
	4dcP3aSehoGZX6gGbqZ3vUpPfnyDrbreZrZ5DbVFl
X-Gm-Gg: ASbGncsWa6DCbKJrLpLKHOghwstv9xwS8ZlSbEryGbXhGkY+hFry9CRcZfmaAkeh+wi
	1WrJw78Y2kEPZXKef2z7OkyDmHYi/x8Sh6emhAUqnoo4HtevpghCDwfPQ5vqg0s89XWU2eEFyiT
	e5isNjO+KowsgK/vhvE18zoguL0eYAso2vvWVzeGiYtXa8urxvuQI6
X-Google-Smtp-Source: AGHT+IHbm2b0b8YGHX28r7f2pzl1NXSMck+kvuJZCJIVk1NshA3nbRdTcXcdIfx+F3Jou0xe6PXvnume9QxDaU2tiYc=
X-Received: by 2002:a05:622a:1829:b0:476:f1a6:d8e8 with SMTP id
 d75a77b69052e-4a73c737c96mr390081cf.11.1749842382290; Fri, 13 Jun 2025
 12:19:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1749779391.git.gehao@kylinos.cn>
In-Reply-To: <cover.1749779391.git.gehao@kylinos.cn>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 13 Jun 2025 12:19:31 -0700
X-Gm-Features: AX0GCFuV7BnvCEvakQqnTD_G0pwn3IuNvCBiUSnYUaTsvkP-nXz7XbXoATM8nbs
Message-ID: <CAJuCfpHhVhAEPqGXR=b6gdykZTtZsOA7cXX2CJKcX3TX++bs6w@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] mm: Restrict the static definition of the per-CPU
 variable _shared_alloc_tag to s390 and alpha architectures only
To: Hao Ge <hao.ge@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Kent Overstreet <kent.overstreet@linux.dev>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-s390@vger.kernel.org, Hao Ge <gehao@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 8:06=E2=80=AFPM Hao Ge <hao.ge@linux.dev> wrote:
>
> From: Hao Ge <gehao@kylinos.cn>
>
> Recently discovered this entry while checking kallsyms on ARM64:
> ffff800083e509c0 D _shared_alloc_tag
>
> If ARCH_NEEDS_WEAK_PER_CPU is not defined((it is only defined for
> s390 and alpha architectures),there's no need to statically define
> the percpu variable _shared_alloc_tag. As the number of CPUs
> increases,the wasted memory will grow correspondingly.
>
> Therefore,we need to implement isolation for this purpose.
>
> However,currently ARCH_NEEDS_WEAK_PER_CPU is a #define and
> is enclosed within the #if defined(MODULE) conditional block.
>
> When building the core kernel code for s390 or alpha architectures,
> ARCH_NEEDS_WEAK_PER_CPU remains undefined (as it is gated
> by #if defined(MODULE)). However,when building modules for these
> architectures,the macro is explicitly defined.
>
> Therefore,we need to make ARCH_NEEDS_WEAK_PER_CPU a Kconfig option.
> And replace all instances of ARCH_NEEDS_WEAK_PER_CPU in the kernel
> code with MODULE_NEEDS_WEAK_PER_CPU,MODULE_NEEDS_WEAK_PER_CPU might
> be a more accurate description,because it was only needed for modules.
> Then,when defining the percpu variable _shared_alloc_tag,wrap it with the
> CONFIG_ARCH_NEEDS_WEAK_PER_CPU condition.
>
> The following version can be regarded as the most original version:
> https://lore.kernel.org/all/20250529073537.563107-1-hao.ge@linux.dev/
> But unfortunately,it caused build errors on s390.
> Based on Suren's guidance and suggestions,
> I've refined it into this patch series.
> Many thanks to Suren for his patient instruction.

I think the first two patches in your patchset should be merged together.

>
> Verify:
>      1. On Arm64:
>         nm vmlinux | grep "_shared_alloc_tag",no output is returned.
>      2. On S390:
>         Compile tested.
>         nm vmlinux | grep "_shared_alloc_tag"
>         00000000015605b4 r __crc__shared_alloc_tag
>         0000000001585fef r __kstrtab__shared_alloc_tag
>         0000000001586897 r __kstrtabns__shared_alloc_tag
>         00000000014f6548 r __ksymtab__shared_alloc_tag
>         0000000001a8fa28 D _shared_alloc_tag
>         nm net/ceph/libceph.ko | grep "_shared"
>         U _shared_alloc_tag
>      3. On alpha
>         Compile tested.
>         nm vmlinux | grep "_shared_alloc_tag"
>         fffffc0000b080fa r __kstrtab__shared_alloc_tag
>         fffffc0000b07ee7 r __kstrtabns__shared_alloc_tag
>         fffffc0000adee98 r __ksymtab__shared_alloc_tag
>         fffffc0000b83d38 D _shared_alloc_tag
>         nm crypto/cryptomgr.ko | grep "_share"
>         U _shared_alloc_tag
>
> v2:
>     Heiko pointed out that when defining MODULE_NEEDS_WEAK_PER_CPU,
>     the CONFIG_ARCH_NEEDS_WEAK_PER_CPU condition in the v1 version
>     should be removed,as it is always true for s390 and alpha
>     architectures.And He also pointed out that patches 2-4 need to
>     be merged into one patch. Modify the code according to the suggestion=
s
>     and update the corresponding commit message.
>
> Hao Ge (3):
>   mm/Kconfig: add ARCH_NEEDS_WEAK_PER_CPU Option and enable it for
>     s390/alpha
>   mm: replace ARCH_NEEDS_WEAK_PER_CPU with MODULE_NEEDS_WEAK_PER_CPU
>   mm/alloc_tag: add the CONFIG_ARCH_NEEDS_WEAK_PER_CPU macro when
>     statically defining the percpu variable _shared_alloc_tag
>
>  arch/alpha/Kconfig              | 1 +
>  arch/alpha/include/asm/percpu.h | 2 +-
>  arch/s390/Kconfig               | 1 +
>  arch/s390/include/asm/percpu.h  | 2 +-
>  include/linux/alloc_tag.h       | 6 +++---
>  include/linux/percpu-defs.h     | 4 ++--
>  lib/alloc_tag.c                 | 2 ++
>  mm/Kconfig                      | 4 ++++
>  8 files changed, 15 insertions(+), 7 deletions(-)
>
> --
> 2.25.1
>
