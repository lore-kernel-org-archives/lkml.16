Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795D8219312
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 22:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744237511; cv=none; b=DsED49nwshcUyNgYsbY17AOFVgnxt0UoZpCUt3QAOpHi8YphLaJ/Xqad63dRHgizR1T87YtuGDZGK90+2yd47TJcuG03r2spo7xhFJmrhj2MvQBY+4NEKXtxpsajN6eURGEacWCYGonFuaoyKneR6nbcWVzAP8ukRwr5eVcPpow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744237511; c=relaxed/simple;
	bh=V2eqXiCs4SpRA0SYhjL4O3Q/R8qXxXt+aFmNuivnOoU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qFZ7MZFrVRzfnMi/3W0iXGLxpic+uYdvI52QdsveQq1K43vDV7La3+p5G0ldFCJ4lzQ+n95x84hzQ4lgfjYevgEmH+Z1aDsHGm2UkSj1rZ/9VFGbYxy1B1zJvzgPBfB+h7QEDeyoHUSQlhFf9GqiyjKeMNLb8RvMzO9d5Jq5G90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wu3031ZS; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wu3031ZS"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4769e30af66so53001cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 15:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744237508; x=1744842308; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q6VkcL1eVjhOXy3NwPz+IIGJIZCrP2Xy4Qb57z8uV2s=;
        b=wu3031ZSSRV/VZLKh/qeDon1nq7Gim1eaklMmzRtSA+wGz+stFjIolxBW61oziR4e/
         407ECgvnQduj0H4vtbzQYNjwDanwo5FP2tcDp7WuJUTELlSoTM0kedI/QiYbLM30j0UK
         VidqtdUM51KARJ1P2fK9nBLgPLESR38PPRJu3E5iUs0okrHSlrxc6iYU/NxkgV+WncLb
         SU4aoTgIVaDa1YfF0uW1UrQZroSj7CztaeFMNaxQodhpN54hY8vanJCHhxYEcZyQ9JzW
         rqkQKpv60w6LivZb3+qLdNKFxY0mTtFhxWA5akAIdZk7R5J4y1FE0XM+vPvxUUSNkGz7
         v/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744237508; x=1744842308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q6VkcL1eVjhOXy3NwPz+IIGJIZCrP2Xy4Qb57z8uV2s=;
        b=Yyr4xQ5FwVu6U8X2hIceWXUZHGei5T1dZcbO8IjrS0NrmPeEw2stQpASFsApVdVWDb
         9RX+wAY0foxdHtPkE6WIq4eyuTqGZ7p5EzjMNyOxxBN48Mhli8Toq+Kx7yvEHllj2sYi
         dCaFi1UOa4UF8JaIQ3I2qTym6w+VQ3OOidcPr/WLJbyciXfsSocVTe7IWsOAtHXrq1Wi
         h1GKMkBeVUVReNKYBuK5HWo7p4vMVOWwabl02XXOb7Ik1mOrhG9+ALvlRFa6ppWpCnJF
         hREpwJ6M4hzIJQxQbRvCQu5mRKMyi3etBt3uX3ZiV34EVURex1j6grqsk2BUQcAkf82i
         2KTg==
X-Forwarded-Encrypted: i=1; AJvYcCWLN9tee3pXorElZcrgqnb216tyQp4+ndS66NhXzj59Aqj+WVhLTqDGYvFSEyGHrN33u3KoRpOyzyf37KM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeP2pjt8HnnJ2LAs3UruPwsSmj1OVZHHmUVzk5AmdNEUqbDA40
	5+1pIpSumR4rmYbA1nrpIkFu7HynWw6pgxDvMxwZPYaPI1/SQyAD0NQhmleHorgcHxHFCzVckKI
	lerrLWIFIfcTn1TUYQr1buQ9JAFPzSjpWzQ8D
X-Gm-Gg: ASbGnctqMg2k6DNfiNEElTlh3PmkSIRzKLv5Rsbl2mNrAtMXZZZmz/hsgJDLlWvwtrV
	InrHHUo0+edNQUx5VyLqUhlhbgv971wGo+/qVpBGL5pelLp83Fh4Ol/KB8gZwlpTQXJLeZ2NB7/
	uyA1TENWIkroST1KRwCEHn
X-Google-Smtp-Source: AGHT+IGpK1nTv3QYV69BKXwAms+Br0nl0lvJ5Uk9xf/xohJG6OR08FIXXFBC0PNGoHrQSjTfkCUmTt1Yrbf+S0p5cKM=
X-Received: by 2002:ac8:5acd:0:b0:477:2c1e:d252 with SMTP id
 d75a77b69052e-4796c96f058mr1059021cf.20.1744237508081; Wed, 09 Apr 2025
 15:25:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409195448.3697351-1-tjmercier@google.com>
 <20250409140848.da67768ac1f5e79d7296de4d@linux-foundation.org>
 <20250409141131.bd67f6b19ea7e770dce40ac7@linux-foundation.org>
 <CABdmKX3D-iCwkuAXLsFyyJD7LikoR0rygR6CnR4Fv-u9+OjnZg@mail.gmail.com>
 <kamspewougkeipnlpdhbzyhu63ildqmfpuw46loqcjohrbr6bf@enpp5occ33eo> <CABdmKX149kZUHpjM8CUb-eyJtkFxp04DngcAunuZZxaAM5Uwng@mail.gmail.com>
In-Reply-To: <CABdmKX149kZUHpjM8CUb-eyJtkFxp04DngcAunuZZxaAM5Uwng@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 9 Apr 2025 15:24:57 -0700
X-Gm-Features: ATxdqUHGt-53GL_coL_36lwwjJpL5XL3-y4ysraGJcyYVXampYsTl_5Q3Qg6o3Q
Message-ID: <CAJuCfpEKjoQkhTTX3fdm-_2AuagjDdKne1+eN0rCeHYCN=UMTQ@mail.gmail.com>
Subject: Re: [PATCH] alloc_tag: Handle incomplete bulk allocations in vm_module_tags_populate
To: "T.J. Mercier" <tjmercier@google.com>
Cc: Kent Overstreet <kent.overstreet@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Janghyuck Kim <janghyuck.kim@samsung.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 3:11=E2=80=AFPM T.J. Mercier <tjmercier@google.com> =
wrote:
>
> On Wed, Apr 9, 2025 at 2:57=E2=80=AFPM Kent Overstreet
> <kent.overstreet@linux.dev> wrote:
> >
> > On Wed, Apr 09, 2025 at 02:51:18PM -0700, T.J. Mercier wrote:
> > > On Wed, Apr 9, 2025 at 2:11=E2=80=AFPM Andrew Morton <akpm@linux-foun=
dation.org> wrote:
> > > >
> > > > On Wed, 9 Apr 2025 14:08:48 -0700 Andrew Morton <akpm@linux-foundat=
ion.org> wrote:
> > > >
> > > > > On Wed,  9 Apr 2025 19:54:47 +0000 "T.J. Mercier" <tjmercier@goog=
le.com> wrote:
> > > > >
> > > > > > alloc_pages_bulk_node may partially succeed and allocate fewer =
than the
> > > > > > requested nr_pages. There are several conditions under which th=
is can
> > > > > > occur, but we have encountered the case where CONFIG_PAGE_OWNER=
 is
> > > > > > enabled causing all bulk allocations to always fallback to sing=
le page
> > > > > > allocations due to commit 187ad460b841 ("mm/page_alloc: avoid p=
age
> > > > > > allocator recursion with pagesets.lock held").
> > > > > >
> > > > > > Currently vm_module_tags_populate immediately fails when
> > > > > > alloc_pages_bulk_node returns fewer than the requested number o=
f pages.
> > > > > > This patch causes vm_module_tags_populate to retry bulk allocat=
ions for
> > > > > > the remaining memory instead.
> > > > >
> > > > > Please describe the userspace-visible runtime effects of this cha=
nge.  In a way
> > > > > which permits a user who is experiencing some problem can recogni=
ze that this
> > > > > patch will address that problem.
> > > > >
> > > > > ...
> > > > >
> > > > > Reported-by: Janghyuck Kim <janghyuck.kim@samsung.com>
> > > >
> > > > A Closes: link will presumably help with the above info.  checkpatc=
h
> > > > now warns about the absence of a Closes:
> > >
> > > Hi Andrew, This was reported on our internal bug tracker so there is
> > > no public link I can provide here. If it's better not to add a
> > > Reported-by in this case, then I will do that in the future.
> >
> > In that case perhaps cut and paste the info from your internal bug
> > tracker?
> >
> > Commit messages can include quite a bit more than just a short
> > description of the commit, when it's relevant - e.g. I try to include
> > the literal log of the oops being fixed when appropriate.
> >
> > It really helps when looking at things weeks or months later and trying
> > to remember "ok, exactly what was that code path I need to watch out
> > for?"
>
> Agreed, it would have been better to include this. I think the
> modprobe errors I followed up with would be good to append to the
> commit message.
>
> Shall I send a v2?

Yes please and add the userspace visible effect you posted earlier along wi=
th:

Fixes: 0f9b685626da "alloc_tag: populate memory for module tags as needed"

With that added:

Acked-by: Suren Baghdasaryan <surenb@google.com>
