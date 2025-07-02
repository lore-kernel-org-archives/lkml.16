Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C01715C0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 00:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751416293; cv=none; b=iOpDK5yh8uBqr7OAGNQaNdNKOfwhhHJF1SmWkkzq9terCPRGc6oGNsVI9DsCHqI0R5rpNHRIFKsqs3A2+D+cOoTOxfq/tQ66B40Ej3rTTh1rhtHNHjpGEwD3HtCo4k29zpXyKhOkUGjArXWUytTMZzWHES+LMhudlFKI5tw58iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751416293; c=relaxed/simple;
	bh=Ov216qcFdDqSzMPynzHq1eFzgwUstJ5GKuFYestz5Mw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ivqCRh63B6iqqrJLUr1bw4MD6MQFs8gY6zKdHSHJl9Jb2vA9NfdO7KVjlX2egT/LxIRL2TgMdH+QBjIxyRF5HqLNCOcruf5UG3iRdDV3dAfweSihrgaJEnw0EF8aFl1Q5AF6yXrN+bV6/uAAO5+lMvVKRPgH9OJhFt6xILCc5B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kbL7W6Rw; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kbL7W6Rw"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-237f270513bso274505ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 17:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751416291; x=1752021091; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNyRC6n8pZY3KnOpU1YR78OZYzfubaOPbY/4YQWNz6Y=;
        b=kbL7W6RwPCLOgmD7WMKK8Yqu86MTA5ECt7OrH2dIOxPN7aD2z9V74VdBv4SF8NUEku
         FS5emjihayD9OrsFXqrp/zVa0ojrHRMK53ejEvkrClMNrJkVrFLMUFVdExJULtIhfVpF
         Fwye6BRK/ku3w9zp+18SqEZ/oauWz/R9lEGZ1v6hbOOhSjBZzCsl7dKkMxeP+yC7aS4A
         VqsSB8z7vMg30bigOeFZr09q1BlQFwtZ+ER68GZ/5XXwlbFPxVxzKiwoxjUwEv0r7g8v
         /Oy1p6ARMit69nQ44meR8IIwB5D3ys6cIwEPGrIfe3ri5seL7Qi93IbI9jTv/fmOFnB3
         JkWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751416291; x=1752021091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UNyRC6n8pZY3KnOpU1YR78OZYzfubaOPbY/4YQWNz6Y=;
        b=CL0nqaCAuHLJQnL7AXfIP0MEH4vL/WnYcJ0gzu1eY6bFv/X+cLX2+mdB2OnaTUafSn
         ctvnYGVCjT8cuoOCPv9mXEpF37en3Le9DsSkmnVAQQOhs06RiXfwNz1xKe7nfKgdqiw8
         4pzlIFhC/v5It30CIZVnRh+Oen+TJ5stGxW4ghnIs7BJD+GdekZvyl05nsc+RqJoZuia
         jObwdLS7fFp9y1nwsUW1fCXMFvd4LCDzMWbLISjQtHllgUL9yF+HJPK3cRzoYuYK9Owj
         3dSHyw9bR4j0ySWo/iT5o0vgO0L5WMbHRTsT7gcLK9vFBEsnmmWoUXx3YzWb7+ywTuU+
         RywA==
X-Forwarded-Encrypted: i=1; AJvYcCVMju/Z15X0eAeu3mRJcLqHdpPnXGIBIrfJTtnxMv/UphSW+/5/FiIBhFhrSGjEzSg8mQXN8Yi6lb2yq5U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwczxlJrGF4KCIMADMvXfHaB9mCQDe9yiOObw3C8cLKB5CX1dAw
	JL1NQ0hZHKEKghHzDClHyxZZRWcHENsVMWo8WsZwRhZ+vf0g10S4ZzOhFOwIGtDD8VEYALM7rDL
	KcKd/JdD+gTs7DfOn+UaUktS+vCsMS4YskNdodOR9
X-Gm-Gg: ASbGncufkkqJepS/CEYZ4LZDL76bRO3kxrYQl3rItRx8Y7FmIr1DTVxf+UY/eTrnh0a
	dYSwyQymF7EPBW6b5hlBYv96vjRLBLttR5Ga2Uj5O9ym4uppUzmqNrNW0CEwfo5O+MPyWVLuZCJ
	V8C+lML6m2rRVPv68Cdltg25RqW9tXBYGqFdva0IWz+QM=
X-Google-Smtp-Source: AGHT+IGUumd5nbkwerjTRuTS5MsiUEJyQlxvPQ6oEN4zMddkaaHoI+CgrAbDk5gtjz0/RYY1Dc9FM675+CDe6jApn60=
X-Received: by 2002:a17:903:1112:b0:22c:3cda:df11 with SMTP id
 d9443c01a7336-23c5ff0723dmr4432595ad.10.1751416290521; Tue, 01 Jul 2025
 17:31:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630080603.36171-1-jiahao.kernel@gmail.com>
In-Reply-To: <20250630080603.36171-1-jiahao.kernel@gmail.com>
From: Yuanchu Xie <yuanchu@google.com>
Date: Tue, 1 Jul 2025 17:31:13 -0700
X-Gm-Features: Ac12FXyKl7BufdimK-urCRewhoe1OH3xwr5f_fDhhkztRRmlCdR63ldZBaBfX2E
Message-ID: <CAJj2-QGHLRqY4mPyAPg2eT+y+4yNfNb__nON5ndkY8WG0UmKVQ@mail.gmail.com>
Subject: Re: [PATCH] mm/mglru: Stop try_to_inc_min_seq() if the oldest
 generation LRU lists are not empty
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, yuzhao@google.com, 
	kinseyho@google.com, david@redhat.com, mhocko@kernel.org, 
	zhengqi.arch@bytedance.com, shakeel.butt@linux.dev, 
	lorenzo.stoakes@oracle.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Hao Jia <jiahao1@lixiang.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 1:06=E2=80=AFAM Hao Jia <jiahao.kernel@gmail.com> w=
rote:
>
> From: Hao Jia <jiahao1@lixiang.com>
>
> In try_to_inc_min_seq(), if the oldest generation of LRU lists
> (anonymous and file) are not empty. Then we should return directly
> to avoid unnecessary subsequent overhead.
>
> Corollary: If the lrugen->folios[gen][type][zone] lists of both
> anonymous and file are not empty, try_to_inc_min_seq() will fail.
>
> Proof: Taking LRU_GEN_ANON as an example, consider the following two case=
s:
>
> Case 1: min_seq[LRU_GEN_ANON] <=3D seq (seq is lrugen->max_seq - MIN_NR_G=
ENS)
>
> Since min_seq[LRU_GEN_ANON] has not increased,
> so min_seq[LRU_GEN_ANON] is still equal to lrugen->min_seq[LRU_GEN_ANON].
> Therefore, in the following judgment:
> min_seq[LRU_GEN_ANON] <=3D lrugen->min_seq[LRU_GEN_ANON] is always true.
> So, we will not increase the seq of the oldest generation of anonymous,
> and try_to_inc_min_seq() will return false.
>
> case 2: min_seq[LRU_GEN_ANON] > seq (seq is lrugen->max_seq - MIN_NR_GENS=
)
>
> If min_seq[LRU_GEN_ANON] > seq, that is, lrugen->min_seq[LRU_GEN_ANON] > =
seq
This part doesn't make sense to me.
The code is as follows:

    /* find the oldest populated generation */
    for_each_evictable_type(type, swappiness) {
        while (min_seq[type] + MIN_NR_GENS <=3D lrugen->max_seq) {
            gen =3D lru_gen_from_seq(min_seq[type]);

            for (zone =3D 0; zone < MAX_NR_ZONES; zone++) {
                if (!list_empty(&lrugen->folios[gen][type][zone]))
                    goto next;
            }

            min_seq[type]++;
        }

Here, it could be that , min_seq[type] > lrugen->max_seq - MIN_NR_GENS
(what you refer to as seq)
However, this is a result of incrementing a copy of
lrugen->min_seq[type] as this piece of code finds the oldest populated
generation.

next:
        ;
    }

> Then min_seq[LRU_GEN_ANON] is assigned seq.
This is not necessarily true, because swappiness can be 0, and the
assignments happen to prevent one LRU type from going more than 1 gen
past the other.
so if `min_seq[LRU_GEN_ANON] > seq && min_seq[LRU_GEN_FILE] =3D=3D seq` is
true, then min_seq[LRU_GEN_ANON] is not assigned seq.


> Therefore, in the following judgment:
> min_seq[LRU_GEN_ANON] (seq) <=3D lrugen->min_seq[LRU_GEN_ANON] is always =
true.
> So, we will not update the oldest generation seq of anonymous,
> and try_to_inc_min_seq() will return false.
>
> It is similar for LRU_GEN_FILE. Therefore, in try_to_inc_min_seq(),
> if the oldest generation LRU lists (anonymous and file) are not empty,
> in other words, min_seq[type] has not increased.
> we can directly return false to avoid unnecessary checking overhead later=
.
Yeah I don't think this proof holds. If you think it does please
elaborate more and make your assumptions more clear.

>
> Signed-off-by: Hao Jia <jiahao1@lixiang.com>
> ---
>  mm/vmscan.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index f8dfd2864bbf..3ba63d87563f 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -3928,6 +3928,7 @@ static bool try_to_inc_min_seq(struct lruvec *lruve=
c, int swappiness)
>         int gen, type, zone;
>         bool success =3D false;
>         struct lru_gen_folio *lrugen =3D &lruvec->lrugen;
> +       int seq_inc_flags[ANON_AND_FILE] =3D {0};
>         DEFINE_MIN_SEQ(lruvec);
>
>         VM_WARN_ON_ONCE(!seq_is_valid(lruvec));
> @@ -3943,11 +3944,20 @@ static bool try_to_inc_min_seq(struct lruvec *lru=
vec, int swappiness)
>                         }
>
>                         min_seq[type]++;
> +                       seq_inc_flags[type] =3D 1;
>                 }
>  next:
>                 ;
>         }
>
> +       /*
> +        * If the oldest generation of LRU lists (anonymous and file)
> +        * are not empty, we can directly return false to avoid unnecessa=
ry
> +        * checking overhead later.
> +        */
> +       if (!seq_inc_flags[LRU_GEN_ANON] && !seq_inc_flags[LRU_GEN_FILE])
> +               return success;
> +
>         /* see the comment on lru_gen_folio */
>         if (swappiness && swappiness <=3D MAX_SWAPPINESS) {
>                 unsigned long seq =3D lrugen->max_seq - MIN_NR_GENS;
> --
> 2.34.1
>
>
I don't understand what problem this patch tries to solve.

Yuanchu
