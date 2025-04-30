Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A63126C05
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 22:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746053404; cv=none; b=NRGFPsvSk5Y8rwaK7KLd1nvxEPGPFpJb2XniXy+FphSsrPFiBcRSVsuik4dlCQ7Ds/X2LzfZv/ifQ/Fv6YkGMJHJSgwDnejkHOb73WoglNn147t9x2TFNTZPT/wfXRKdSQjQyAuOojKAajGbaBH3VrKMAtd0QqTX3sTJsGKkHwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746053404; c=relaxed/simple;
	bh=9MGMOeD6EkUGwyYOX99XuRPkhol/Rk4nwiKNSB8UfBw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GcKRSA9XCD5gVh1yP8rmiRIbq/iamDxpA5M9PAAiYQqeOXp9t7Kdr81JGyWP++bsuov8TlCvvIq3NnlkN8G669tEg3nnCuMrSRH2018J8q/KG2LIRMHu0VUlK0M1koaLwWuANEhwyig3XbLBXqUeZpxZOy2g4uMGmw7Z2fXa5/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HLkgAuGQ; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HLkgAuGQ"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4dad6cc2be0so122727137.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 15:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746053401; x=1746658201; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nbpbINSrxfUumV9lwyjlqLA8g7akUpbSjiCjBJP9b4Q=;
        b=HLkgAuGQopxQuG4nVPS+1gEvY5p08oNWFwm7TWRJ/4SXcj1AFki/ga6rE9jLJ3NjSZ
         ucDSpFg3dg3jC+0jbKJr3tUnAjmLOdEfq8YlKB05XzvVY/itNVqCfzUy/UnhEx7yFMPn
         8rw8ezmUvMAFj1CIH94T5lfmluayeELlYrWeOlyvsYK+X+XfRsa35lVWJQnepc+DffqP
         sw5CyQXtGCGvsgcls1+8EsrbGFDdogGEikvaYYRcdN6CX2uIRrKfnh2ZIk8ALd1CNR4Z
         KbUGR6dF94ZkEXO53P/e30viGdZ+SI8l9Xbv7jcgpzosU+Vh880fnvG+rdWtqzNCEcwZ
         eMjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746053401; x=1746658201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nbpbINSrxfUumV9lwyjlqLA8g7akUpbSjiCjBJP9b4Q=;
        b=PWS9Q6Ndymwj//Zquvu4968qedVSFSt9TSAFd8v77eSsfRZFBEDE9Fasa43hx8olJx
         xwcOTCYtjUJC0CPG1JIM8vJYhIHFMWe05oyv6V0Z6LDQ9fIrNlvKacNn4A9RRzT+r2XS
         MxiBUa7vgC760/GY94ZO9OcHH5zvpr+9qYJuHI228DPu9Ku6NevTPs7C4xq2b6rSHuqr
         wOikbiOdpgJRmHrK0n353z7TUWaZ1u1957SexwzMhKOjPz6Ec8V/8O9Iv7XpDABoyGsw
         jYAp4l4VCmiuEXEy4SL3Nrh/HUsWPJGwa0lF6f7c9fRT7Gm8VUzrs4wVrkD5ziwWfcTK
         ew/Q==
X-Forwarded-Encrypted: i=1; AJvYcCV4E8F487SrCB4arRgH86B5muCyFgRhGW7Qv+lwdWWJnjvmXlnLmn1U1e9IZ0eaWrjdeASpDAmOkOZVEuo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNx0S9s1S5SvPRvRlX9MWxQhK1+rzyhhtupvGMKW8vJh+A4r+5
	xGhyBJWto7dkUnzzAInImTFSYbhUuu6eEfo0z55rZuZpp4FzLSwQdaNi4dFDeLfy0RlmvoRW3QA
	ShN3KNPQ/KUnbXbufWf/8HaRJzec=
X-Gm-Gg: ASbGncus8b5wvRiQfuyX0m2JDZCMJQ8RG3h0MH7UNMa+N2VnuonN7NwDaw3KPn3sod4
	caA+1CDNiVp0siaV5cnwwfFjOc1rPp1Bdw+k6VA0lULgRX5Cmk6Ui7dC8cNtCkjo/70iAdOCiiF
	EAtFAqZlKrt+jT1k1ir8egKYJNcroKw1rq
X-Google-Smtp-Source: AGHT+IGzkaGVgrKTVWAg6uYcHiRtwbA0R/supqUwGLiy3GtgazMGGDJF+F5gy1Ww2dKzbjTsV1APhcaThlpXeBvRPg8=
X-Received: by 2002:a05:6102:3e8d:b0:4c4:e018:326f with SMTP id
 ada2fe7eead31-4dae53bb727mr916415137.10.1746053401317; Wed, 30 Apr 2025
 15:50:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430082651.3152444-1-qun-wei.lin@mediatek.com> <20250430145106.8ce79a05d35cec72aa02baa6@linux-foundation.org>
In-Reply-To: <20250430145106.8ce79a05d35cec72aa02baa6@linux-foundation.org>
From: Barry Song <21cnbao@gmail.com>
Date: Thu, 1 May 2025 10:49:50 +1200
X-Gm-Features: ATxdqUGvtOD0hW5rJBr5f2DF6ZxtN6Be6JTfSzIEhz5_WOzsDzAADbdK5XApyCE
Message-ID: <CAGsJ_4wLuJNe9uPE3-fBNLdiCPBpKt4a1ytuf7-+oiS5rBrg_w@mail.gmail.com>
Subject: Re: [PATCH] mm: Add Kcompressd for accelerated memory compression
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Qun-Wei Lin <qun-wei.lin@mediatek.com>, Mike Rapoport <rppt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Nhat Pham <nphamcs@gmail.com>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Casper Li <casper.li@mediatek.com>, 
	Chinwen Chang <chinwen.chang@mediatek.com>, Andrew Yang <andrew.yang@mediatek.com>, 
	James Hsu <james.hsu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 1, 2025 at 9:51=E2=80=AFAM Andrew Morton <akpm@linux-foundation=
.org> wrote:
>
> On Wed, 30 Apr 2025 16:26:41 +0800 Qun-Wei Lin <qun-wei.lin@mediatek.com>=
 wrote:
>
> > This patch series introduces a new mechanism called kcompressd to
> > improve the efficiency of memory reclaiming in the operating system.
> >
> > Problem:
> >   In the current system, the kswapd thread is responsible for both scan=
ning
> >   the LRU pages and handling memory compression tasks (such as those
> >   involving ZSWAP/ZRAM, if enabled). This combined responsibility can l=
ead
> >   to significant performance bottlenecks, especially under high memory
> >   pressure. The kswapd thread becomes a single point of contention, cau=
sing
> >   delays in memory reclaiming and overall system performance degradatio=
n.
> >
> > Solution:
> >   Introduced kcompressd to handle asynchronous compression during memor=
y
> >   reclaim, improving efficiency by offloading compression tasks from
> >   kswapd. This allows kswapd to focus on its primary task of page recla=
im
> >   without being burdened by the additional overhead of compression.
> >
> > In our handheld devices, we found that applying this mechanism under hi=
gh
> > memory pressure scenarios can increase the rate of pgsteal_anon per sec=
ond
> > by over 260% compared to the situation with only kswapd. Additionally, =
we
> > observed a reduction of over 50% in page allocation stall occurrences,
> > further demonstrating the effectiveness of kcompressd in alleviating me=
mory
> > pressure and improving system responsiveness.
>
> It's a significant change and I'm thinking that broader performance
> testing across a broader range of machines is needed before we can
> confidently upstream such a change.

We ran the same test on our phones and saw the same results as Qun-Wei.
The async compression significantly reduces allocation stalls and improves
reclamation speed. However, I agree that broader testing is needed, and
we=E2=80=99ll also need the zswap team=E2=80=99s help with testing zswap ca=
ses.

>
> Also, it's presumably a small net loss on single-CPU machines (do these
> exist any more?).  Is it hard to disable this feature on such machines?

A net loss is possible, but kswapd can sometimes enter sleep contexts,
allowing the parallel kcompressd thread to continue compression.
This could actually be a win. But I agree that additional testing on
single-CPU machines may be necessary.

It could be disabled by the following if we discover any regression on
single-CPU machines?

if (num_online_cpus() =3D=3D 1)
     return false;

>
> >
> > +static bool swap_sched_async_compress(struct folio *folio)
> > +{
> > +     struct swap_info_struct *sis =3D swp_swap_info(folio->swap);
> > +     int nid =3D numa_node_id();
> > +     pg_data_t *pgdat =3D NODE_DATA(nid);
> > +
> > +     if (unlikely(!pgdat->kcompressd))
> > +             return false;
> > +
> > +     if (!current_is_kswapd())
> > +             return false;
> > +
> > +     if (!folio_test_anon(folio))
> > +             return false;
>
> Are you sure the above three tests are really needed?

Currently, it runs as a per-node thread mainly to accelerate asynchronous
reclamation, which effectively reduces direct reclamation. Since direct
reclamation already follows the slow path, asynchronous compression offers
limited additional benefit in that context. Moreover, it's difficult
to determine
the optimal number of threads for direct reclamation, whereas the  compress=
ion
in the current direct reclamation allows it to utilize all CPUs.

The first condition checks whether kcompressd is present. The second
ensures that we're in kswapd asynchronous reclamation, not direct
reclamation. The third condition might be optimized or dropped, at least fo=
r
swap-backed shmem, and similar cases.

Thanks
Barry
