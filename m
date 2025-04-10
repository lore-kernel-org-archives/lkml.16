Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7501EB9F9
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 22:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744323644; cv=none; b=p9zhnOgZpZjWtnoHMFCCP0ORwIUyGFsPcylZrGVosM32C7OR3KVf6joghHR2HiXTUUQwrZ6cDK3qpwo9M3d+aFCmw6h9tzajeoBCgs4do1kig+b3X0Wgl0tipgszryE/bC8PJok6kXvMje8LwouigovKKM9lYjB9x5x2Rb9jhMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744323644; c=relaxed/simple;
	bh=zm3b8qqfkYLU75+NylqWtZmrmbY2NBuk778fP40n8Kw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tMJaPTcc8RbE+iiCloLMAiNtFbIx2NvXtJOvJuTloip7UNLepwSKGiBagVTzIGCqG98VeNW7Yk/Gns22Z3CNu1M7LSa5wL5X/kOZPK9oxTt1lqLL03iSQPWUYPwF4/1vBRqJquqjVlqLfaku904HJY1rbQ6Wc7NKc/4GrA6/w0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eQtbWuA7; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eQtbWuA7"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4769e30af66so64281cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 15:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744323641; x=1744928441; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YqV2ZMlryT3fPt4/zyn0rx+eu8iE116L2QZwsGoNxHQ=;
        b=eQtbWuA7pPIzv7bQ3VZK+Pq99xGBUK5DXRunuWO5yOfWK5kzBEg5Ya25BfL+8Si+60
         zXieSWS8pH+/u+aiHEVdHiOrC0xBqMsOnbikkmQDzfABOx/v7i8gdE4NmqUrhRDqlpUU
         iv5Lc7Uhs+XGOBn1AE7uumyS3eRSKofgze73aZA1xR/5//jbKnagqMjek2AJn7++i/dy
         5is8/D6AAY8nChY9fOHev9JR+e2M9sAnfVZNKi3ol9+v+XeE92cxz2UfKZ4pYBg0on19
         h+JY3gY+koLQ/Rk7dXJkVuet+lt25/2aOckc2y+EIVEKgLFDR0XbmTaE8OTfG3LNX91Z
         fpsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744323641; x=1744928441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YqV2ZMlryT3fPt4/zyn0rx+eu8iE116L2QZwsGoNxHQ=;
        b=AjmreA1vriGvmAPoM2GR/nGmtU+puIgdPd6MGJiFrEAOAPWGHfVG0mg9lwlSu2/Yrb
         s0dwouD8sBikuJKIuAOfGnFswdJ7GRNwDQR1DAmU67Z2UlXdC5YcMG5/AL9uej1S8qi9
         L+RieFRqA2Vq1eYMEzsds6nyh1aK7Iw1/YvLhRy7Ej38a3gUilhoVY4Pq4jQfjj4DfvS
         12uLP5EMAlLvL56KA5oexMlTht/ixHiELdh+9EoJBj3RoWFT4MXrZFSDqQqrBH8GQFGK
         DsRNrEpohhE8UEV9kcTp2XgRWTeR8K8+6EgV/AbgepBqhjxlNpupKJMmD+YaHCSRWFvu
         a36w==
X-Forwarded-Encrypted: i=1; AJvYcCWQkGTB6Z8o24/U61g1AHpTYU7bCrKFbiUEbycHWTmfwKBICXFtHMQYUYJGR9IvZt4VfgIqvCNNmNztLqU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhEvPM4dvaqn80YKVpQvR/Nn1oLA6xq7vipR/B7VyliwKac/I+
	E07Wz0EagM2IwUH1vCjWF/k86nQmDecLpqXWRUJ97B6tWJrahsdGe6TrB/GZwenjj3/eNuuSS8C
	+FlJlv1HHFSuMd6eFaMPS+PoX81B0ZnSp7Wxt
X-Gm-Gg: ASbGncs6btvDbqQBDxsncww/bpF/5ZAWvsyvN/Il0o/Z9xWX3zefPWpBOHelY27IoXI
	ToCT2djhR2fn86c4Z6FhIOpzwBni1cIT1pBBAS8yud2foB0MtX+v5OoyO+kb3Q5P7TYRRRuJIlO
	F5gcNXrvx+mds9/Q9e1VM5
X-Google-Smtp-Source: AGHT+IHwADXMs6qQ3nDUgcJ0NYP2Vl4CNhd7gecjcysD9CcCEf1z+TL8Zl+UcA/rAZmsRQ3BtXfCEXiYkQ54ngVEBaI=
X-Received: by 2002:ac8:7c4f:0:b0:476:77bb:687a with SMTP id
 d75a77b69052e-47977894b4cmr511231cf.21.1744323641024; Thu, 10 Apr 2025
 15:20:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409225111.3770347-1-tjmercier@google.com>
 <20250409171238.494fd49979b4607bff9791b7@linux-foundation.org>
 <CAJuCfpHaocOVHf673X1nn_R0cpz=GtDZEZ+ceo+5OptRcBUjcw@mail.gmail.com> <04f4cff4-be7c-48d8-b24e-535ccc67d908@huawei.com>
In-Reply-To: <04f4cff4-be7c-48d8-b24e-535ccc67d908@huawei.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 10 Apr 2025 15:20:30 -0700
X-Gm-Features: ATxdqUHfHaEyJNVqpBNRufpxneK936qhnpUHUFniBD_AS_aYP6_DNoLrort5z0E
Message-ID: <CAJuCfpFcE0tGnWYwkfCr20MyEHSruz+nnJ=uj1RdCtkiBrvHZQ@mail.gmail.com>
Subject: Re: [PATCH v2] alloc_tag: handle incomplete bulk allocations in vm_module_tags_populate
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "T.J. Mercier" <tjmercier@google.com>, 
	kent.overstreet@linux.dev, janghyuck.kim@samsung.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 7:52=E2=80=AFPM Yunsheng Lin <linyunsheng@huawei.com=
> wrote:
>
> On 2025/4/10 9:44, Suren Baghdasaryan wrote:
> > On Thu, Apr 10, 2025 at 12:12=E2=80=AFAM Andrew Morton
> > <akpm@linux-foundation.org> wrote:
> >>
> >> On Wed,  9 Apr 2025 22:51:11 +0000 "T.J. Mercier" <tjmercier@google.co=
m> wrote:
> >>
> >>> alloc_pages_bulk_node may partially succeed and allocate fewer than t=
he
> >>> requested nr_pages. There are several conditions under which this can
> >>> occur, but we have encountered the case where CONFIG_PAGE_OWNER is
> >>> enabled causing all bulk allocations to always fallback to single pag=
e
> >>> allocations due to commit 187ad460b841 ("mm/page_alloc: avoid page
> >>> allocator recursion with pagesets.lock held").
> >>>
> >>> Currently vm_module_tags_populate immediately fails when
> >>> alloc_pages_bulk_node returns fewer than the requested number of page=
s.
> >>> When this happens memory allocation profiling gets disabled, for exam=
ple
> >>>
> >>> [   14.297583] [9:       modprobe:  465] Failed to allocate memory fo=
r allocation tags in the module scsc_wlan. Memory allocation profiling is d=
isabled!
> >>> [   14.299339] [9:       modprobe:  465] modprobe: Failed to insmod '=
/vendor/lib/modules/scsc_wlan.ko' with args '': Out of memory
> >>>
> >>> This patch causes vm_module_tags_populate to retry bulk allocations f=
or
> >>> the remaining memory instead of failing immediately which will avoid =
the
> >>> disablement of memory allocation profiling.
> >>>
> >>
> >> Thanks.  I'm assuming we want cc:stable on this?
> >>
> >> btw, it looks like the "Clean up and error out" code in
> >> vm_module_tags_populate() could use release_pages().
>
> For the 'Clean up and error out' part:
> next_page[] array might need to be reset to NULL if user is able to
> reenable the memory allocation profiling when the above happens as the
> current page bulk alloc API are only populating NULL elements.

We shouldn't be able to re-enable memory allocation profiling once
vm_module_tags_populate() fails. In that case shutdown_mem_profiling()
call disables memory allocation profiling and sets
mem_profiling_support=3Dfalse. I might have to modify
memory_allocation_profiling_sysctls to prevent users from trying to
re-enable profiling via sysfs if mem_profiling_support is set to
false. Will take a closer look at that but regarding your comment,
re-enabling profiling once it's shut down is not a valid usecase.

>
> >
> > True. I'll add that into my TODO list. Thanks!
> >
> >>
> >
