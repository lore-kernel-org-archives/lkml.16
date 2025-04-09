Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74E61C3F02
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 22:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744236668; cv=none; b=reS/3ZNiTPMgWa9izpZ6JH9WTj3e99/mQuq8iTEY7JKklmLp/aUyQkQxjb5Evjq1GI7BL8yIhVZg5cgjEq15IxxrPqxCX7NrOUH67mC8JKhX92k8czaFdAeoA9/LrLxKtPCjtcWqJneKyjvmI9JMljEo4ieBSIbk1IQ/W+vOfqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744236668; c=relaxed/simple;
	bh=zyumJ8jwP8t9pasnZ8TVG+cN4bptk+lO+R2dpOPidP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cEuIqc/Hwchz2NeCYM0EG9MMgqlHlRCK9zaTl309tPmo2TsA7HCjhTsFp7kUIOs31BX40/bVwmYBYn09EptogmC/VVUYeTdeikW97mNkbFaP3lI3dlJPG2ss9PDwG9QkxaCkN9iPdbEfc2McV/aaSFG6L3nf7VBR+IJuoPgnxBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q0bRD4wq; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q0bRD4wq"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43d5f10e1aaso23625e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 15:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744236665; x=1744841465; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1WeMoI07MGM7m41ZJQjcw0OZDaYzBhtEXKaYLAMP5Fc=;
        b=Q0bRD4wqZAitJ67P7+94h8KBvnPLm9ry2uDuQiTvolLfn0tyx9JWNxcffMpqceh4PS
         8/EqXWuUSwjj80vv4oDMe29jVFI0Gy2xJ1lNqyI76n62MSAcUj5iT3CwSHXz4KKjN2jy
         U85LLpANutTsmtEfXJEBejUXtIdZGrGqgOYYrUpwwtsxOkQ7PfVqpGnjolxKOsSO8VGe
         O8DwsShkeWb1uI8anrxRIrIG3USlFU44N+CfckyDLtwSHeWNzNzHJQmEb/Pu/b5+cP34
         pxjoIgPUDpt6Uj66Bw9nchUuOuEtPf/AmOJkW4/3itHUMnW53evjqikhHpWrSOJ7nvfe
         cf1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744236665; x=1744841465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1WeMoI07MGM7m41ZJQjcw0OZDaYzBhtEXKaYLAMP5Fc=;
        b=HQntmJDKddjl6bc/qliC2DhDXF+G8DeBPuQDvqTZXuW70yrz0kk8BOJt/TiBb1YbtP
         7SjpzBTUNOe2MJdCJZvQmamnTRDUY9jtslAW/aoqiK6VHAf2b9ZiOUf8qjkPPMILKibo
         /F4CLusq57GpW9FQ6aTqI2phXJ7GV8iqsY63C6SyJ2h42xU1J2PCOgPBP2gPhuwzD2cO
         74ZoIvRfCHFkGLUW1ZX5hzuTHScVFXJwV78EfauflpbN0DVm/2HstXjpQHFW73Bg7Udi
         nX+9uBHSSuLA+V/AQ2gCfz/ldqlwnUx4Bgy9/Gz9RJXZqiD1retDE/ysvHYgPDbW9VeV
         NCtw==
X-Forwarded-Encrypted: i=1; AJvYcCVvtOoxrvyKQ1MOMtyfmkYxWxT534UrG1Y0hLqn801e215PTXBSPhNAK5Gg60azlZQxN6TssLW39XxmDgg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIngJWz23izUzJecjAKxU+JUZBCKJf/Df8ZKKkgpnfP7usCJRR
	xOVjVuGc7bOWPCDMVB6EyTmaskErr8NesBAUyksgZBZ8Od+5fXMxCHcwYv30N/CEAaJAaJxtH0O
	kHfqtHHqShbjn+neCRcrdZH8ExuW0RqVEK3Jc
X-Gm-Gg: ASbGncvyRzE2OgsRl/AbLc7gKdws0Sy4QrDPYtvezEScn35WLsU7z//HPthdGCdyjZM
	0k/sbqiCz5kgWSqNgpbrPSjX8JFYcUOLagVP92/C26lRHAnYeHgvzpZTpbbZS1IULhESxN6x7AS
	yTTKGZlbRkXvhI4o8xPzZyauXhjb4uyQ0sd2I/rJBz8NCtQEm6+RM=
X-Google-Smtp-Source: AGHT+IEsJ8CCoy1fpsu/63E7U9CaB6UWoIs5FAuxTzGAsoy+kQFfpjcbCaX9O4ryUbCd712o+KPaQMApElvTdzca8rA=
X-Received: by 2002:a05:600c:3d8d:b0:43b:bfe9:8b43 with SMTP id
 5b1f17b1804b1-43f2df42953mr309915e9.4.1744236664648; Wed, 09 Apr 2025
 15:11:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409195448.3697351-1-tjmercier@google.com>
 <20250409140848.da67768ac1f5e79d7296de4d@linux-foundation.org>
 <20250409141131.bd67f6b19ea7e770dce40ac7@linux-foundation.org>
 <CABdmKX3D-iCwkuAXLsFyyJD7LikoR0rygR6CnR4Fv-u9+OjnZg@mail.gmail.com> <kamspewougkeipnlpdhbzyhu63ildqmfpuw46loqcjohrbr6bf@enpp5occ33eo>
In-Reply-To: <kamspewougkeipnlpdhbzyhu63ildqmfpuw46loqcjohrbr6bf@enpp5occ33eo>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 9 Apr 2025 15:10:51 -0700
X-Gm-Features: ATxdqUGQ4NDgYljRmh8RkqWTri1UizwS_iIrkWzRlXDyd4XZqN2xYBpQHGLQ3Qw
Message-ID: <CABdmKX149kZUHpjM8CUb-eyJtkFxp04DngcAunuZZxaAM5Uwng@mail.gmail.com>
Subject: Re: [PATCH] alloc_tag: Handle incomplete bulk allocations in vm_module_tags_populate
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, Suren Baghdasaryan <surenb@google.com>, 
	Janghyuck Kim <janghyuck.kim@samsung.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 2:57=E2=80=AFPM Kent Overstreet
<kent.overstreet@linux.dev> wrote:
>
> On Wed, Apr 09, 2025 at 02:51:18PM -0700, T.J. Mercier wrote:
> > On Wed, Apr 9, 2025 at 2:11=E2=80=AFPM Andrew Morton <akpm@linux-founda=
tion.org> wrote:
> > >
> > > On Wed, 9 Apr 2025 14:08:48 -0700 Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
> > >
> > > > On Wed,  9 Apr 2025 19:54:47 +0000 "T.J. Mercier" <tjmercier@google=
.com> wrote:
> > > >
> > > > > alloc_pages_bulk_node may partially succeed and allocate fewer th=
an the
> > > > > requested nr_pages. There are several conditions under which this=
 can
> > > > > occur, but we have encountered the case where CONFIG_PAGE_OWNER i=
s
> > > > > enabled causing all bulk allocations to always fallback to single=
 page
> > > > > allocations due to commit 187ad460b841 ("mm/page_alloc: avoid pag=
e
> > > > > allocator recursion with pagesets.lock held").
> > > > >
> > > > > Currently vm_module_tags_populate immediately fails when
> > > > > alloc_pages_bulk_node returns fewer than the requested number of =
pages.
> > > > > This patch causes vm_module_tags_populate to retry bulk allocatio=
ns for
> > > > > the remaining memory instead.
> > > >
> > > > Please describe the userspace-visible runtime effects of this chang=
e.  In a way
> > > > which permits a user who is experiencing some problem can recognize=
 that this
> > > > patch will address that problem.
> > > >
> > > > ...
> > > >
> > > > Reported-by: Janghyuck Kim <janghyuck.kim@samsung.com>
> > >
> > > A Closes: link will presumably help with the above info.  checkpatch
> > > now warns about the absence of a Closes:
> >
> > Hi Andrew, This was reported on our internal bug tracker so there is
> > no public link I can provide here. If it's better not to add a
> > Reported-by in this case, then I will do that in the future.
>
> In that case perhaps cut and paste the info from your internal bug
> tracker?
>
> Commit messages can include quite a bit more than just a short
> description of the commit, when it's relevant - e.g. I try to include
> the literal log of the oops being fixed when appropriate.
>
> It really helps when looking at things weeks or months later and trying
> to remember "ok, exactly what was that code path I need to watch out
> for?"

Agreed, it would have been better to include this. I think the
modprobe errors I followed up with would be good to append to the
commit message.

Shall I send a v2?
