Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C431F12FC
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 23:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747696422; cv=none; b=EQuGtlFIHf/JEhkWfkuVxoKCHdV/tYnzgFmVPH0Z8p2v6/jfRuK6eOhHBL8QqQ+HmI8Lkb7qgKucZD8THfiJgAzj6C3TkQ6YRmNYsCL9hluVx0taSZENHABl1PM9fLgYwjtOKIRLXDQYFHmx2lxScHSiSxOKHZqXYu/jbkq7cnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747696422; c=relaxed/simple;
	bh=sk98ETwQCNP+ju99Zd4OlMq0oZtYzOhgMGIJ7g3qOls=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CCeQthAHEpeFU95m0jv0sKBIzFrd8B54s1gVzRM15uWSuwmifOgydXsZ+1s7RUzHuWjVLHYfjH70rpXRVtkEi4PO/UsidBeg3Q6kvUKfB6xgUwES5tAoQrdGABFCoMQuEnKuNXrrs3QPJm2z/cKqyZh9COgCq7XaO+Mg3TZn3/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1+AbPifz; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1+AbPifz"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-47e9fea29easo948861cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747696419; x=1748301219; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=96QhpfT7HLpgu1bm5sM7t0c4BUdOSmJYmksk0t5SGLk=;
        b=1+AbPifz1tHNM/Ohxn3a3BSNnMQRl9OIIQqv6FRepg5kJ0rx55unn8hSM8Qwuhw5gw
         jySKmc3vQn+Xqr94/9gWvwGw2wfVsj8EZJw84LBNN4nCaHGr9IqojcnvxpSwlmTztdqD
         ZHMoKNZhIXYFuqwjhjLE7LxFdHrOgqOPkNtIDj0uxeaIz++DG4KSKuTNeBsWUXRw4DjL
         YXIhBI8fTlECjO+XV8BYvDqypgdJ20H5nKBQNERntbaaP8lXxgpfAJ271QAEPUdGnAL4
         J9Dga9Fnwz6oG05Me9AVCtcNzrXhx/ZSE9dC/gqG6F8OO/AY//mvJXOGl/eccBpClerc
         acTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747696419; x=1748301219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=96QhpfT7HLpgu1bm5sM7t0c4BUdOSmJYmksk0t5SGLk=;
        b=luCwjtjxMPWGuOxflxfCjaHQGWch63/1W1m8TymtPqH1sPCla9dpkmIpCly64J3VQK
         vE2nxUwRqmGAtrn8x/6Foh8ZYQelb95mCytR+R8SUjmteOjc31MOGjaYDKafWLIv4mHU
         H3MhhAdZKrFR1e+AxiPcPud7tV7OPGYlCZgNI91+YFFZbVEiYcHbTvKfDI8+ZTYby4Su
         ZlenBMgqjf7XmlXbLuD0+e8Xd12yTsqMsrFUzneYhFgbRxdIie6PfXDjEhyLnTzimMEj
         ZbnQGq0sAcljw43Jvgu4gGk6hFq8Cp5BuweD/isGDFxe0Hw1UcIZQp7q2ew+ENbDaZDx
         jn3A==
X-Forwarded-Encrypted: i=1; AJvYcCVC3SC5TWSL43tCmcV3ZoDcRYnrMQ+KOBUMKCMOXZ3gQ9kP5SXPkozFzlhAxhDnE8c5DaDBh+CrzIgBE9I=@vger.kernel.org
X-Gm-Message-State: AOJu0YznteNYWfgo9j5n/+szmqJabUQy9Kwz8Gvk/YkXMwk1Dlc5ij7W
	spzPV4/I6HddTYicvCoxXn823OCqO8MKz2hUUazahB8f49M75Gf2YTe5syp4yT480nEZOiRbOGq
	KxF/5sBRUxK7tt4BMh3o6Ksp1qf6j3TYEeV34FSaW
X-Gm-Gg: ASbGncub7WVStWlX0/rlCM5pls0Q479yNWZBwTb1oThipgakOGeL1sXRwlHJBKDGCdr
	spmT6EJIshS4tYLXoJWfVXFxCC9UMG0RnrvjEPkxoRmjITpl+beSDyrJdRRm442MplcWcciQDL7
	Uh4gwBmPkd1fwPSNGjhPQWFMjH3HcDqNKXI0BnlKXuPMuX/NXSFeTC
X-Google-Smtp-Source: AGHT+IF57nfwe9+Ni9aS4cql01icCikdr/rObzQditniv4g0OFPrlzoeR9R2prMBSzAR9w7nlZ6VQZBdTeONO1Fh0lA=
X-Received: by 2002:a05:622a:28c:b0:47e:b278:2e07 with SMTP id
 d75a77b69052e-49595c5da5bmr8030691cf.20.1747696419118; Mon, 19 May 2025
 16:13:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250517000739.5930-1-surenb@google.com> <20250519155145.8378a397a755c1cc5a3e2d4e@linux-foundation.org>
In-Reply-To: <20250519155145.8378a397a755c1cc5a3e2d4e@linux-foundation.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 19 May 2025 16:13:28 -0700
X-Gm-Features: AX0GCFtyKbje5C9HGVN9HvLhSgtRMvDYAmrBJ9ZPORcHkDdOH464cLAvkeUee8Y
Message-ID: <CAJuCfpGgwkAVZJJ-ffLdkBfmggm3=d+Z450matW=TzeQZJ=LDQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] alloc_tag: allocate percpu counters for module tags dynamically
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kent.overstreet@linux.dev, 00107082@163.com, dennis@kernel.org, 
	tj@kernel.org, cl@gentwo.org, pasha.tatashin@soleen.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 3:51=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Fri, 16 May 2025 17:07:39 -0700 Suren Baghdasaryan <surenb@google.com>=
 wrote:
>
> > When a module gets unloaded it checks whether any of its tags are still
> > in use and if so, we keep the memory containing module's allocation tag=
s
> > alive until all tags are unused. However percpu counters referenced by
> > the tags are freed by free_module(). This will lead to UAF if the memor=
y
> > allocated by a module is accessed after module was unloaded. To fix thi=
s
> > we allocate percpu counters for module allocation tags dynamically and
> > we keep it alive for tags which are still in use after module unloading=
.
> > This also removes the requirement of a larger PERCPU_MODULE_RESERVE whe=
n
> > memory allocation profiling is enabled because percpu memory for counte=
rs
> > does not need to be reserved anymore.
> >
> > Fixes: 0db6f8d7820a ("alloc_tag: load module tags into separate contigu=
ous memory")
> > Reported-by: David Wang <00107082@163.com>
> > Closes: https://lore.kernel.org/all/20250516131246.6244-1-00107082@163.=
com/
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > ---
> >  include/linux/alloc_tag.h | 12 ++++++
> >  include/linux/codetag.h   |  8 ++--
> >  include/linux/percpu.h    |  4 --
> >  lib/alloc_tag.c           | 87 +++++++++++++++++++++++++++++++--------
> >  lib/codetag.c             |  5 ++-
> >  5 files changed, 88 insertions(+), 28 deletions(-)
>
> Should we backport this fix into -stable kernels?  I'm thinking yes.

Yes, I should have CC'ed stable. The patch this one is fixing was
first introduced in 6.13. I just tried and it applies cleanly to
stable linux-6.13.y and linux-6.14.y.
Should I forward this email to stable or send a separate patch to them?
