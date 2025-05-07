Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7187B28A1C6
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 15:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746630711; cv=none; b=tmFFWnJ6ADQR5VuJuh6Ap2XE7gnPdp4HafJEhcg5feSDN5vMoOSe+c1pFq+su7z9DoKkNzNl2gPvdEwLQ8CYzD+AWyWZM7RNK/SyDrYHivU9pJQy79S+4rtsiDMYMnB9HJBHC1V+ZZm5k5JGqzOH+pVc8JEC6vETiSuVH3U3j5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746630711; c=relaxed/simple;
	bh=CjmEIJ/13gJIIg7Ltp3T2i4Mqj7L0+SvLacjlnnTqok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IBxpzs1VLGyMIu13yxC2fOJwRG1k8v5zdN2vWxI4mbDUMZ8vorwwuzJT24TuiIG79LGl5d11b88BvBCzEkFvO4iD9itYT27C6iCkIjpfabw6xumwQ/KqF9MWiYfWiWib9KxtpdOMjBkwM6lxWO/isn5RKIqMTddnf86UYhcCT8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QF5ON9Pg; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QF5ON9Pg"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6f54584456fso74366d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 08:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746630708; x=1747235508; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zFsVVhebDK1NYCWoS7EgmVQ2tl6qP90tIWoC9j9TLlQ=;
        b=QF5ON9PgBWyPpJNzaasSuArDaLem5PfBTdu6IUdL5OuKdr100qI+fjwysV19+taIfy
         vSVSqhpaAOjwgX6CSnSYsEvGJI73+BnedMgRwMAJERtw/Lka2SXGjd6vxXRks56PE3n+
         n+M19W/mfuo3BvKMhZlc1V8zFYty3llIEjMauqS7Ufcg5XyQnh2966EaLVO51zBJ5lu8
         naqtCZAMWRv0ZAU9LFp/FbskYzaRv3m/+vbbprhxOv8pqF4ZyKz8VnQ7hzceG+CSHGxM
         9yvLrYtYfk9BUAX7Nu5Ngnxjh0Bqgi4EGZpVDZ05B/vtgqPL13VwTU+SmhD48CeWaYnZ
         BI8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746630708; x=1747235508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zFsVVhebDK1NYCWoS7EgmVQ2tl6qP90tIWoC9j9TLlQ=;
        b=G2rxToYtgFwcKEKEpWcPGkW8Njrr10/Eg1ERRJLsYjhZnDQuAgVukxfOqpefeXCt43
         42nz/iXGc3Y5Ui84GrkWJSZoEdxVu+G1vGdcHxW/5x0FMEoT3RevrpwAnTupCC8e8Uut
         zva8wGVWooB96PxazN+JXO+OiY6recTEToIRl6SossmFV8Ig9W4IEeniACXUf07wH1Th
         KI0rxhlN0liN/LkgTK0Ezz58N6+csh41fz9XfOifk2YCK0YINtxHeMVEEGN/LnEnFnrX
         yct652bTkaxoHn9SxirOg7Pk9B026Tm1o++43eMr7hWd5cRWM/5ys34XOTssCZ8dtddi
         gpyw==
X-Forwarded-Encrypted: i=1; AJvYcCW5vVoauBsLROzQY2WvxdYRfX5vo8v3/0UWdAx5rcT8PZ1ebYkVhWPT3oXlCgfeh8nf5prZs+55UIxBkqA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy+2efg2pBBln8aLuVYO/jrIB5fnTqxDr9FQ/Vjtd4EVMaNeQU
	9iaJ+2OisCAAEelfU+6Q+y4iQwh2NswxqcsYwFfHZKgDxgpTcw7sX5vHYLkZFQ4bR2xIBgP0koZ
	vUoQdBKA3qpq4OlMycphw8vNo3yc=
X-Gm-Gg: ASbGncsa7IkurIBQjWH4mKv5EShfQab7J+JdT2oGmpBW/g54nK+QkcqMavzG0MxUEOt
	/BqL6Cna40Y7Q1rrq0zeHox3Y2fprQ1WULVb1zsDpuDJNC3pgmJVnKetbLwHHemapZstTfZGBht
	UM0d7ZbC0+Lh+cQ6nGeNeF8dw=
X-Google-Smtp-Source: AGHT+IGgnreWVGqTX/OGt9t1yjfLukHeVyIawQ7JyQXO4oyNHOjm4AAmpDVZh+WGawWTYtY55suI3sZpRR9Poy5HWxA=
X-Received: by 2002:ad4:5f88:0:b0:6e4:4164:8baa with SMTP id
 6a1803df08f44-6f5429e303fmr49840626d6.6.1746630707997; Wed, 07 May 2025
 08:11:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430082651.3152444-1-qun-wei.lin@mediatek.com>
 <20250430145106.8ce79a05d35cec72aa02baa6@linux-foundation.org> <CAGsJ_4wLuJNe9uPE3-fBNLdiCPBpKt4a1ytuf7-+oiS5rBrg_w@mail.gmail.com>
In-Reply-To: <CAGsJ_4wLuJNe9uPE3-fBNLdiCPBpKt4a1ytuf7-+oiS5rBrg_w@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 7 May 2025 08:11:36 -0700
X-Gm-Features: ATxdqUEcu4e-_kxqbjUBLr1u_eNqQEaHZr7zcbF_KTN22201A4BiR4YT9uX5Xs0
Message-ID: <CAKEwX=PW4YdCx77ZycvqkeW9JXL2PnxyjpseSy3ddtg8QtAKWQ@mail.gmail.com>
Subject: Re: [PATCH] mm: Add Kcompressd for accelerated memory compression
To: Barry Song <21cnbao@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Qun-Wei Lin <qun-wei.lin@mediatek.com>, 
	Mike Rapoport <rppt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Casper Li <casper.li@mediatek.com>, 
	Chinwen Chang <chinwen.chang@mediatek.com>, Andrew Yang <andrew.yang@mediatek.com>, 
	James Hsu <james.hsu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 3:50=E2=80=AFPM Barry Song <21cnbao@gmail.com> wrot=
e:
>
> On Thu, May 1, 2025 at 9:51=E2=80=AFAM Andrew Morton <akpm@linux-foundati=
on.org> wrote:
> >
> > On Wed, 30 Apr 2025 16:26:41 +0800 Qun-Wei Lin <qun-wei.lin@mediatek.co=
m> wrote:
> >
> > > This patch series introduces a new mechanism called kcompressd to
> > > improve the efficiency of memory reclaiming in the operating system.
> > >
> > > Problem:
> > >   In the current system, the kswapd thread is responsible for both sc=
anning
> > >   the LRU pages and handling memory compression tasks (such as those
> > >   involving ZSWAP/ZRAM, if enabled). This combined responsibility can=
 lead
> > >   to significant performance bottlenecks, especially under high memor=
y
> > >   pressure. The kswapd thread becomes a single point of contention, c=
ausing
> > >   delays in memory reclaiming and overall system performance degradat=
ion.
> > >
> > > Solution:
> > >   Introduced kcompressd to handle asynchronous compression during mem=
ory
> > >   reclaim, improving efficiency by offloading compression tasks from
> > >   kswapd. This allows kswapd to focus on its primary task of page rec=
laim
> > >   without being burdened by the additional overhead of compression.
> > >
> > > In our handheld devices, we found that applying this mechanism under =
high
> > > memory pressure scenarios can increase the rate of pgsteal_anon per s=
econd
> > > by over 260% compared to the situation with only kswapd. Additionally=
, we
> > > observed a reduction of over 50% in page allocation stall occurrences=
,
> > > further demonstrating the effectiveness of kcompressd in alleviating =
memory
> > > pressure and improving system responsiveness.
> >
> > It's a significant change and I'm thinking that broader performance
> > testing across a broader range of machines is needed before we can
> > confidently upstream such a change.
>
> We ran the same test on our phones and saw the same results as Qun-Wei.
> The async compression significantly reduces allocation stalls and improve=
s
> reclamation speed. However, I agree that broader testing is needed, and
> we=E2=80=99ll also need the zswap team=E2=80=99s help with testing zswap =
cases.

The warning aside (which I got around by setting and unsetting
PF_MEMALLOC in kcompressd()), I run kernel building tests with zswap.
There is not much performance difference with and without kcompressd.
That probably means kernel building is a mediocre benchmark more than
anything. Ideally, I want to experiment with some real workloads, but
that is a bit more involved to set up, unfortunately :(

I can try again once you have sent v2 that incorporates our review, at
least to make sure everything is stable and there is no obvious
regression. Hopefully I can set up a proper experiment at some point
too...

>
> >
> > Also, it's presumably a small net loss on single-CPU machines (do these
> > exist any more?).  Is it hard to disable this feature on such machines?
>
> A net loss is possible, but kswapd can sometimes enter sleep contexts,
> allowing the parallel kcompressd thread to continue compression.
> This could actually be a win. But I agree that additional testing on
> single-CPU machines may be necessary.
>
> It could be disabled by the following if we discover any regression on
> single-CPU machines?
>
> if (num_online_cpus() =3D=3D 1)
>      return false;
>
> >
> > >
> > > +static bool swap_sched_async_compress(struct folio *folio)
> > > +{
> > > +     struct swap_info_struct *sis =3D swp_swap_info(folio->swap);
> > > +     int nid =3D numa_node_id();
> > > +     pg_data_t *pgdat =3D NODE_DATA(nid);
> > > +
> > > +     if (unlikely(!pgdat->kcompressd))
> > > +             return false;
> > > +
> > > +     if (!current_is_kswapd())
> > > +             return false;
> > > +
> > > +     if (!folio_test_anon(folio))
> > > +             return false;
> >
> > Are you sure the above three tests are really needed?
>
> Currently, it runs as a per-node thread mainly to accelerate asynchronous
> reclamation, which effectively reduces direct reclamation. Since direct
> reclamation already follows the slow path, asynchronous compression offer=
s
> limited additional benefit in that context. Moreover, it's difficult
> to determine
> the optimal number of threads for direct reclamation, whereas the  compre=
ssion
> in the current direct reclamation allows it to utilize all CPUs.
>
> The first condition checks whether kcompressd is present. The second
> ensures that we're in kswapd asynchronous reclamation, not direct
> reclamation. The third condition might be optimized or dropped, at least =
for
> swap-backed shmem, and similar cases.
>
> Thanks
> Barry
