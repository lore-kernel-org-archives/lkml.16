Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B1324BD1F
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 19:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749842506; cv=none; b=jdBlcPVKY+32eDjFHbBTUShWNSrFzZg23a/rxUUtL4my4ky6ofdF+1tphIv/A/aAYLqgDJogRuNuxmLz+bosduZ4lVHVJKQNlpqfJuNIlg9ZXaVpJKKmjXRFJwnwsBHNudVZpRWfxe8KfB7kJBB1OG0fnUct+k3M0NsP36siFbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749842506; c=relaxed/simple;
	bh=YLKpZILOwVtOfA0AbaKsPcVtXLdl14+iX8YDYOFnlek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DTU4CJOcgAI0z4NM9Wc7E6cvkudcCAlpf2jkGZsvH8pqWrIzfv91hchrDorMh5jpbJf5jKuGajjkDpl2DlD1KI5me1xp9lK+3cXmA31/+FaSeJLkSnECk4cmMcRyelIztpJh5gs0hozda+uCJ7eXjCSbRc5hPDvQnfBbnANn8l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ObXxzX29; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ObXxzX29"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-47e9fea29easo72671cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 12:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749842503; x=1750447303; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SwsnYZZ63LvvlkMeoABDBQxLgrkaQY4fLJ1Enbyh2EY=;
        b=ObXxzX29rZndd1MbjB6+7vqnl/35j6kXZZSxI803hD3AlyUcxnG4uoUeZ2BMbch15U
         dZQfU1FIitEgdFJb+8FkQvqWoH4IhH6IX+jNPdFNnSSdqmSyhuqVwZTXgZdTTUpu+tOT
         8Ya5f75I3Nqfi4N9gnv5+khvSLMMgjpQDNROa5maDl/yI/WuzTLsb8rBD1S5vXiNVP+O
         V7SLh8PDQcodamaBmnAx9ioXgNtCb2OoFakp1cPw5EuGcMChNsz7kAGxOjn6BLfuZBGs
         ldLuU8DmvcMc82QIQuWc3CWnyRu5AuvxIgUxFymCe2c1YKZIEujUm3a41SI4G1UzNUwT
         8JJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749842503; x=1750447303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SwsnYZZ63LvvlkMeoABDBQxLgrkaQY4fLJ1Enbyh2EY=;
        b=j/iZAFl30DDKp7AyrdFyZ3z5X4YYtAoSInDm5gA60fyFI9kkEymliLMqfKm0HbValx
         huGO7iEBorv6y5d7ErkXDgwm9ULtbegk4U6BEcsiV5fGW02MLX6Ci0MRgJ1lM5GSjis1
         w+gFKl0o/BJ3593pUmuOMSZD76sqJj35KtM7HGYzRw7IjRLBZO/veCKZc9KmBvRI9qIs
         RA2tZOkvLRhssV7ZDV4ve1lmGH9bGNNqMlbfgBmolbI/z/FPtnO4FMfbhRNY4/8Z6zk6
         csxK3BT0D5CwiPb047wGSoabeFLPH7HXPICgJ2kVYS9jQJIYtLN3kmJot0fVIolLbJkM
         gHfw==
X-Forwarded-Encrypted: i=1; AJvYcCVvlII7COhgRoiyxOqCzWYDJFdhg0nNSUykVHscde9x1St81Z367pS+RddmpvF5kzB//Qt/6jVsZze3Nqo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCnjhI5Xu9PmyJOvLxe3hzlqxFNs1L33AtbHzBNyVjt6OUtUYB
	n7Kx3ZEA8YffhQlqdo+rBqQUegcezCvUxpXk1Mp+PSkNhH98iSvD9hgSQ4PBopTPOkVuPMT3dE7
	BTMT60dieM3Es5Np4Lts0yB7sZjJQ7K1kly+AX+5H
X-Gm-Gg: ASbGncsZfbmDf2puAw1vXwugmnKeh7vpWSsqgEoa7fX3yWpHrdtRT1EQReDPSGd8XHJ
	t3tYVsgYPHaBZGFuv3IkdgHDDAfYWOFTnTrcCGEuGP5cHUChYUYaHbmcNJXFzJ3KJWiL7FgbpYy
	II4MPzY1tI+RiEQTSJIh8meCCCZXzOEjs5HLycCjZ7Fw==
X-Google-Smtp-Source: AGHT+IEO+7tih5cXcAlJg0Vw2/Sois18XRurWIS2/frgQdC8+3vTxmNKORl6AWRcNFb2EewoNPpA6PIVNKd9BEEx0hI=
X-Received: by 2002:ac8:5883:0:b0:47b:840:7f5b with SMTP id
 d75a77b69052e-4a73c763a87mr516731cf.29.1749842503097; Fri, 13 Jun 2025
 12:21:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1749779391.git.gehao@kylinos.cn> <099651f46b0b57f6c7890a64608dc7ca44df7764.1749779391.git.gehao@kylinos.cn>
In-Reply-To: <099651f46b0b57f6c7890a64608dc7ca44df7764.1749779391.git.gehao@kylinos.cn>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 13 Jun 2025 12:21:32 -0700
X-Gm-Features: AX0GCFu-OOwfRLFxcwNjR_GNWx_Buv2sRyKB524WUep1Vz9r7UOBtNhv2b7PdpU
Message-ID: <CAJuCfpGkUk5RXm-HDLB2mr_mRbSxPV+kx116FFBhyYsf6pXNCg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mm/alloc_tag: add the CONFIG_ARCH_NEEDS_WEAK_PER_CPU
 macro when statically defining the percpu variable _shared_alloc_tag
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
> If CONFIG_ARCH_NEEDS_WEAK_PER_CPU is not defined(it is only defined for
> s390 and alpha architectures),there's no need to statically define
> the percpu variable _shared_alloc_tag. As the number of CPUs
> increases,the wasted memory will grow correspondingly.

I don't think this patch needs all this background. Just say that
_shared_alloc_tag is not used when CONFIG_ARCH_NEEDS_WEAK_PER_CPU=3Dn,
so you want to compile it out.

>
> Enclose the definition of _shared_alloc_tag within the
> CONFIG_ARCH_NEEDS_WEAK_PER_CPU condition.
>
> Suggested-by: Suren Baghdasaryan <surenb@google.com>
> Signed-off-by: Hao Ge <gehao@kylinos.cn>
> ---
>  lib/alloc_tag.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> index c7f602fa7b23..14fd66f26e42 100644
> --- a/lib/alloc_tag.c
> +++ b/lib/alloc_tag.c
> @@ -24,8 +24,10 @@ static bool mem_profiling_support;
>
>  static struct codetag_type *alloc_tag_cttype;
>
> +#ifdef CONFIG_ARCH_NEEDS_WEAK_PER_CPU
>  DEFINE_PER_CPU(struct alloc_tag_counters, _shared_alloc_tag);
>  EXPORT_SYMBOL(_shared_alloc_tag);
> +#endif
>
>  DEFINE_STATIC_KEY_MAYBE(CONFIG_MEM_ALLOC_PROFILING_ENABLED_BY_DEFAULT,
>                         mem_alloc_profiling_key);
> --
> 2.25.1
>
