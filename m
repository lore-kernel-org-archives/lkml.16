Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDD922F757
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 15:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746806206; cv=none; b=vEMHg8ViI+I6Lrc59rIJmaDAHNuGG1qeZFRX1lr2opE9JvByx6Oz3uInfiXZC5Sk9PcP6pjdzesKXH0MLhfWy41tgp60rJKs0HGsyaZ0WKzpuaQTo8CE72NOZSbVMHYJZBhHi8ZwdTigrfE98CsF9kzhHmed5g9cLYADHsqp9Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746806206; c=relaxed/simple;
	bh=Ohl1DbecWK9wm5AboaoOPjniTBNMpH8OVl5obFEny/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LfosCb5/G51uDltapG99wUo99v8mrwXiJ/2j4B4UAJn6S/JzoepAQoWEisqTanGZMjyr/x/O/jWLdZrXjxSjCHoQEApDEU7McP7jq3u/IIcjBSTZMBUjRu/x+/B1hVujMAlorfTXwYoDMDyhDMiiWcRaHexjtPoJjBaaQjD+CEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G3Y9EvOy; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G3Y9EvOy"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-47666573242so381711cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 08:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746806204; x=1747411004; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/7P/kwB0pd/F//SejZhT29UJTUOJeXgDtbzoXnQqWI=;
        b=G3Y9EvOyKekz+Rujb4F/9wfZUBhp7+Q35SMxprnwdyjQOmTdiy7MT1H7QxQujK6U0C
         5ubXr0oP/BESdWSYNvQaO4EG6KIM7/z9u/dpbSP/F/P71LGVenjjwIIM9KkFpspmBEOw
         sfIj+VjKHX98RyU/pDnOFaveS273AR8z454zIC4kaCIShtYgZFWWpnn94U2MsNCEuWgn
         kIIBPVNOuzDMv8Ai0TWxgZcVuVWPRBocvp2nr3owvifHoeBF4Mc82X0xwk6xnVNq+q7m
         v8czlfl5UsF302yVkXJ3pVzD5ba6RfgVHYgyPJNhTpacQrAYZs2PY4vemeQBaZFXS4GG
         nvnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746806204; x=1747411004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m/7P/kwB0pd/F//SejZhT29UJTUOJeXgDtbzoXnQqWI=;
        b=ri3YUAw3HYn9VkJET826HpRKxch0MMcs3ksHmVAsIk/aSNA1hw6xmo0KQuydrGXaHt
         mOeEVj2s3wvkbX9j03+SO/NroolaCk8xQMY6U6BDTDRQ+clWBJ0XEFy9rxGtpelsxeUx
         PdbDTNsWPwJvNjMx4p1U5GteGM2JByloEXXCRsb3TFiMLLUpCQi9v5CuuHR1s0OfZ5Ij
         WmSnTgjG2GurDDprXpaZfyRkNxJLHDGyoG9LmM2jjpqObvRtjLJtJ3AY5sHtXgmdUj5O
         e7/k00GyS4arE61hhYZi3r6GJaDFemlio4K6XJGqekGAQ2Sc4qRBYPcPIYb9DaJ7nbu9
         ntnw==
X-Forwarded-Encrypted: i=1; AJvYcCXckSmm0n9yApkRQIlmMPJmuRiNXwm964jq1k8MZK6a6LRq9sBx/1Z64SEitQ0Dcf3rAT/WvhEmSvGpgpQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkMoOcwtOa4/RB6P83U8trvRUlE2qF1Yy47LqI+fUvIYGwrfx8
	fbThToaQWkCsPUS58InaKPBsisX0O5N5Clk3I4WdZ7tLdxeiXojtb10nz/VzEEJzIa7utYoqgkM
	kJLfU/8zP9tTI2b3F7jKx11kPgdgRwntU5QGRHRAqEi/miz6QOZ7HyAE=
X-Gm-Gg: ASbGncubmkUMY+b4rAGD+M1XAw6pJLeiooaTlqEFvcdIP5gGr7nOZtP3dDA1dELDEXV
	e5NXq1fQkbvC4o/cTKD2XH3u0EGXaID0dVF9lT5YeARFgL/XoJKmkiasPNnOu6mR6v/7H4MUkbR
	ZfnV29pkRoknWGC1JxURXM
X-Google-Smtp-Source: AGHT+IGWI5/b9cOfBFheelRw4n+oO84a5XCmIcEiVogc43ubFfGVTAGLlpcCInk36k9/pJEJQCGOl6TobnF4b01806Y=
X-Received: by 2002:a05:622a:190b:b0:47a:e803:da1 with SMTP id
 d75a77b69052e-49453c2a4e5mr4276261cf.5.1746806203404; Fri, 09 May 2025
 08:56:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509061013.922944-1-00107082@163.com>
In-Reply-To: <20250509061013.922944-1-00107082@163.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 9 May 2025 08:56:32 -0700
X-Gm-Features: AX0GCFsMdLDnzOrM1u-bX27pj3ymDaC5ki_OxbK2gXBQqAFlPQG0LJ3qC96eyss
Message-ID: <CAJuCfpH4eiSgZqdMTCUOU2VfYezZuLoJefc0wuOWor9eeNzNTA@mail.gmail.com>
Subject: Re: [BUG?]Data key in /proc/allocinfo is a multiset
To: David Wang <00107082@163.com>
Cc: kent.overstreet@linux.dev, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 11:10=E2=80=AFPM David Wang <00107082@163.com> wrote=
:
>
> Just start a new thread for this[1].
> There are duplications in /proc/allocinfo where same [file:line]
> shows up several times:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>            0        0 ./include/crypto/kpp.h:185 func:kpp_request_alloc
>            0        0 ./include/crypto/kpp.h:185 func:kpp_request_alloc
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>            0        0 ./include/net/tcp.h:2548 func:tcp_v4_save_options
>            0        0 ./include/net/tcp.h:2548 func:tcp_v4_save_options
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>            0        0 drivers/iommu/amd/../iommu-pages.h:94 func:iommu_al=
loc_pages_node
>            0        0 drivers/iommu/amd/../iommu-pages.h:94 func:iommu_al=
loc_pages_node
>            0        0 drivers/iommu/amd/../iommu-pages.h:94 func:iommu_al=
loc_pages_node
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>            0        0 drivers/iommu/intel/../iommu-pages.h:94 func:iommu_=
alloc_pages_node
>            0        0 drivers/iommu/intel/../iommu-pages.h:94 func:iommu_=
alloc_pages_node
>            0        0 drivers/iommu/intel/../iommu-pages.h:94 func:iommu_=
alloc_pages_node
>            0        0 drivers/iommu/intel/../iommu-pages.h:94 func:iommu_=
alloc_pages_node
>            0        0 drivers/iommu/intel/../iommu-pages.h:94 func:iommu_=
alloc_pages_node

Yep, that happens when an inlined function allocates memory. It ends
up inlined in different locations. Usually that's done by allocation
helper functions.
To fix this we need to wrap these allocator helpers with alloc_hooks:

-static inline void *iommu_alloc_pages_node(int nid, gfp_t gfp, int order)
+static inline void *iommu_alloc_pages_node_noprof(int nid, gfp_t gfp,
int order)
{
-        struct page *page =3D alloc_pages_node(nid, gfp | __GFP_ZERO,
order);  struct skcipher_request *req;
+        struct page *page =3D alloc_pages_node_noprof(nid, gfp |
__GFP_ZERO, order);  struct skcipher_request *req;
...
}
+#define iommu_alloc_pages_node(...)
alloc_hooks(iommu_alloc_pages_node_noprof(__VA_ARGS__))

See 2c321f3f70bc "mm: change inlined allocation helpers to account at
the call site" for examples of how this was done before.
Thanks,
Suren.

> ...
>
> The duplication make parsing tools a little bit more complicated:
> the numbers need to be added up, group by key
>        81920       20 drivers/iommu/amd/../iommu-pages.h:94 func:iommu_al=
loc_pages_node 20
>      1441792      352 drivers/iommu/amd/../iommu-pages.h:94 func:iommu_al=
loc_pages_node 352
>
> The script for checking:
> ```
> #!/bin/env python
> def fetch():
>     r =3D {}
>     with open("/proc/allocinfo") as f:
>         for l in f:
>             f =3D l.strip().split()[2]
>             if f not in r: r[f]=3D[]
>             r[f].append(l)
>     keys =3D []
>     for f, ls in r.items():
>         if len(ls) > 1: keys.append(f)
>     keys.sort()
>     for f in keys:
>         print "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D"
>         for l in r[f]: print l,
>
> fetch()
> ```
>
> Thanks
> David
>
> [1]. https://lore.kernel.org/lkml/531adbba.b537.196b0868a8c.Coremail.0010=
7082@163.com/
>
