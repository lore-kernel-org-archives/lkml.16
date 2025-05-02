Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99561A5B8F
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 20:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746218111; cv=none; b=EV7yI665iAJgXONxImznPrmH4Fibjib4GSrqs3VnrIdk7VZ4e7QLq0Lw8lDYpcrjOdFVvfFFgnv8goh+pSFO1+X8Hy+edp/rO5EZzR/fsywec9NXZLwXJyrYXzu9bd7r1KNUhNMSW/lQ3BcPF7BUVZVmWDTzcA+NCCXI8oUpYgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746218111; c=relaxed/simple;
	bh=AL7owyBMWJAOZeenaVNUwkoD0U3ZSllU7CnXmN22cj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UybTtUqHgAfpaqSO5sWlX9ZG6v/l/EHEzgGmEaRn6WozNGN0i0sox+tLeAaV21oqgYJLTxv5P2ZS7HjQ5kVpgtIDV/bCGLTMUyToeNkWSGhGQg/uQeJlLtbbzy3JFOpskjsDi2vl8ULgFsFkW3zs5w/1fwTFQsVPwDQSC3jZ3/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=PCEzcqzz; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="PCEzcqzz"
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5305B3FFCD
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 20:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1746218105;
	bh=AL7owyBMWJAOZeenaVNUwkoD0U3ZSllU7CnXmN22cj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=PCEzcqzzriL85sEe/CsvdJF3j2pMo4RCEiwW35DpblRedwqaWtxl2LVRWbwlTe9pj
	 E/YZ293GB5KrLo5+IUjqPHVIzRRgLKCVsy+ORpUGpJOZmjas6vmBdWGaxiY0AFFfJZ
	 d8yB1J4FJ5f8ND8NZ6kB1myYgg5+0Y2TklroedqSSL8CsTUgC1UMJLrfPEBNbTg7Uf
	 uRh7lpgvOp92uk7iF4LNPubA1ztvw3lcZNbnuOAVfvP07mjA8ADh8J8rb3t2jScnl9
	 4JyYCHtsJSgwTIm/HqMMVjNS4kukii2q3juVmRBvpp2ol6QtufLRiDcOADbW/7sFF7
	 YXnsEwUe6Icgw==
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5f62d10ee03so2095952a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 13:35:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746218104; x=1746822904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AL7owyBMWJAOZeenaVNUwkoD0U3ZSllU7CnXmN22cj8=;
        b=nOlWyUsaxrrpYywWUE+G7iDkPM4Wg9iAkon8LJMEXUJ9KM6q4jMLJA5Z/1IN7WOcHo
         cWMqqizMkl2JHeS7xLYRy6qIYcdjky09AfiaSBpSlA4ov939076FqRPdwhW9cl4EU+M2
         owbs6g5GsOGrwERU3BTeRLRlDss7YABPb44RufamtE+5fPgchl89+FIkmgY1FPfzfF+T
         Ac9+zUSm3ACKGSxu9O7ZiuOhLiasGmkAtkouPd3WfMw7ln8dT7Y8WZ7jiqOlbqQoR9Zd
         u43e/O5yw0QKegYdoDpxkYNLAIePm2n3zb3/YNQQEMKzgM1XpgS8BOCx2hauaAYVxZSf
         b9nw==
X-Forwarded-Encrypted: i=1; AJvYcCU2CnljpXNtGe8L1sNbYlFgRaR3PsY5KzOK5u13Jk3jtdM3H6vWb+wYNc7BzSnY/JKilFyPnJrhRBZPIBc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiknGSCrzZztfc3DESobN3x1RaV2ZEhJqgftV9950ewmx1ukOs
	UzXAFMOjYyKfW9BrBNb7qzPNEaoikZFsJJlqaQBtgq6aaPBs058HOw8osu/KsgoFQlNwu5heATv
	Oid7k/2Fa3csYuX6mJ1l/HAdbSHMqTmPupntXpDlyfuqahtKTztWjSBZNZujqAfdMPivrvkxOkL
	pKnUYi3ziw9a3S8vhP6iNnuKxH4J9l/y7168dzSL2rDN8wSGaTuGbu
X-Gm-Gg: ASbGncuFKi/NlAjIeqgVvU8BWYW9ySnhytv66GarRuNfxiDT1SubA7CfnRe7QgqZCGO
	zQAIWkmTjbztbLwyy1x2rLZmb763w5/hnwi4Cso2ir6kfWKAZtuxlFu3m5JKbfZU6zUnuqmwTnT
	Q8McWIAoNIttXU4VFjhMy/euigg7o=
X-Received: by 2002:a05:6402:274c:b0:5f6:218d:34f3 with SMTP id 4fb4d7f45d1cf-5fa7893cb0fmr3609954a12.28.1746218104450;
        Fri, 02 May 2025 13:35:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5ZB4rcimVvhRfIqBZRnBNqZIKmSTEpmCJg3WD0Z9wvupiBmdeZ4AIOI+CN0thxnXOCV4bc8GdDmUp1pZ6B6A=
X-Received: by 2002:a05:6402:274c:b0:5f6:218d:34f3 with SMTP id
 4fb4d7f45d1cf-5fa7893cb0fmr3609932a12.28.1746218104070; Fri, 02 May 2025
 13:35:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHTA-uav+jc9WKr+Ye0zoR+niczZLbTKdX1LisR3YSLtoLJ5Dw@mail.gmail.com>
 <CAA1CXcBwO77=4ki8kG93rNhB1BUpGqfvo3UbRt0WQ5pFMDyVWw@mail.gmail.com> <CAHTA-uZeFEbQw-9UUPEpOQ-tATxnD+-up9=PUhi0dVH8T86yag@mail.gmail.com>
In-Reply-To: <CAHTA-uZeFEbQw-9UUPEpOQ-tATxnD+-up9=PUhi0dVH8T86yag@mail.gmail.com>
From: Mitchell Augustin <mitchell.augustin@canonical.com>
Date: Fri, 2 May 2025 15:34:53 -0500
X-Gm-Features: ATxdqUH4_8QdQdqJC--y8ol1sVUifcSl2Yk3zPMG7EMrXD3fm5W1v6WJwEzhJCE
Message-ID: <CAHTA-uYrY_3-NsQGAz2eghEdiMHdE1vP5ORfECrwGnJCTe0=7g@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] khugepaged: Asynchronous mTHP collapse
To: Nico Pache <npache@redhat.com>
Cc: akpm@linux-foundation.org, 
	20250211152341.3431089327c5e0ec6ba6064d@linux-foundation.org, 
	21cnbao@gmail.com, aneesh.kumar@kernel.org, anshuman.khandual@arm.com, 
	apopple@nvidia.com, baohua@kernel.org, catalin.marinas@arm.com, cl@gentwo.org, 
	dave.hansen@linux.intel.com, david@redhat.com, dev.jain@arm.com, 
	haowenchao22@gmail.com, hughd@google.com, ioworker0@gmail.com, jack@suse.cz, 
	jglisse@google.com, John Hubbard <jhubbard@nvidia.com>, kirill.shutemov@linux.intel.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, mhocko@suse.com, 
	Peter Xu <peterx@redhat.com>, ryan.roberts@arm.com, srivatsa@csail.mit.edu, 
	surenb@google.com, vbabka@suse.cz, vishal.moola@gmail.com, 
	wangkefeng.wang@huawei.com, will@kernel.org, willy@infradead.org, 
	yang@os.amperecomputing.com, zhengqi.arch@bytedance.com, 
	Zi Yan <ziy@nvidia.com>, zokeefe@google.com, 
	Jacob Martin <jacob.martin@canonical.com>, 
	=?UTF-8?Q?Vanda_Hendrychov=C3=A1?= <vanda.hendrychova@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nico,

As suggested, I did some new runs of my workloads with your
recommended configurations (on akpm/mm-new this time). The results for
the subset that my team is most interested in still do not show
significant improvements (in the context of the delta between the
control test and the thp=3Dalways case).

On the bright side, I did observe that the Rodinia OpenMP tests show
slightly more noticeable performance improvements when defer+collapse
are in use than without, and I also did not observe any concerning
regression indicators in any of these results.

My report for these tests is attached if you'd like to take a look. [0] Tha=
nks!

[0] https://pastebin.ubuntu.com/p/432KtgnXH3/

On Thu, Apr 24, 2025 at 2:45=E2=80=AFPM Mitchell Augustin
<mitchell.augustin@canonical.com> wrote:
>
> Hi Nico,
>
> Thank you for the quick response and suggestions! I'll see if we can
> find some time to test our workload out with your suggested settings
> and will let you know what we find (although it may be a few weeks).
>
> -Mitchell Augustin
>
> On Thu, Apr 24, 2025 at 1:57=E2=80=AFPM Nico Pache <npache@redhat.com> wr=
ote:
> >
> > On Thu, Apr 24, 2025 at 12:18=E2=80=AFPM Mitchell Augustin
> > <mitchell.augustin@canonical.com> wrote:
> > >
> > > Hello,
> > >
> > > I realize this is an older version of the series, but @Vanda
> > > Hendrychov=C3=A1 and I started on a benchmark effort of this version =
prior
> > > to the most recent revision's introduction and wanted to provide our
> > > results as feedback for this discussion.
> > >
> > > For context, my team and I previously identified that some of the
> > > benchmarks outlined in this phoronix benchmark suite [0] perform more
> > > poorly with thp=3Dmadvise than thp=3Dalways - so I suspected that the
> > > THP=3Ddefer and khugepaged collapse functionality outlined in this
> > > article [6] might yield performance in between madvise and always for
> > > the following benchmarks from that suite:
> > > - GraphicsMagick (all tests), which were substantially improved when
> > > switching from thp=3Dmadvise to thp=3Dalways
> > > - 7-Zip Compression rating, which was substantially improved when
> > > switching from thp=3Dmadvise to thp=3Dalways
> > > - Compilation time tests, which were slightly improved when switching
> > > from thp=3Dmadvise to thp=3Dalways
> > >
> > > There were more benchmarks in this suite, but these three were the
> > > ones we had previously identified as being significantly impacted by
> > > the thp setting, and thus are the primary focus of our results.
> > >
> > > To analyze this, we ran the benchmarks outlined in this article on th=
e
> > > upstream 6.14 kernel with the following configurations:
> > > - linux v6.14 thp=3Ddefer-v1: Transparent Huge Pages: defer
> > > - linux v6.14 thp=3Ddefer-v2: Transparent Huge Pages: defer
> > > - linux v6.14 thp=3Dalways: Transparent Huge Pages: always
> > > - linux v6.14 thp=3Dnever: Transparent Huge Pages: never
> > > - linux v6.14 thp=3Dmadvise: Transparent Huge Pages: madvise
> > >
> > > "defer-v1" refers to the thp collapse implementation by Nico Pache
> > > [3], and "defer-v2" refers to the implementation in this thread [4].
> > > Both use defer as implemented by series [5].
> > >
> > >
> > > Ultimately, we did observe that some of the GraphicsMagick tests
> > > performed marginally better with Nico Pache's khugepaged collapse
> > > implementation and thp=3Ddefer than with just thp=3Dmadvise, which al=
igns
> > > a bit with my theory - however, these improvements unfortunately did
> > > not appear to be statistically significant and gained only marginal
> > > ground in the performance gap between thp=3Dmadvise and thp=3Dalways =
in
> > > our workloads of interest.
> > >
> > > Results for other benchmarks in this set also did not show any
> > > conclusive performance gains from mTHP=3Ddefer (however I was not
> > > expecting those to change significantly with this series, since they
> > > weren=E2=80=99t heavily impacted by thp settings in my prior tests).
> > >
> > > I can't speak for the impact of this series on other workloads - I
> > > just wanted to share results for the ones we were aware of and
> > > interested in.
> > Hi Mitchell,
> >
> > Thank you very much for both testing and sharing the results! I'm glad
> > no major regressions were noted, and in some cases performance was
> > marginally better. Another good set of workloads to test for defer
> > would be latency tests... THP=3Dalways can increase PF latencies, while
> > "defer" should eliminate that penalty, with the hopes of regaining
> > some of the THP benefits after the khugepaged collapse.
> >
> > I wanted to note one thing, with the default of max_ptes_none=3D511 and
> > no mTHP sizes configured, the khugepaged series' (both mine and Devs)
> > should have very little impact. This is a good test of the defer
> > feature, while confirming that neither me nor Dev regressed the legacy
> > PMD khugepaged case; however, this is not a good test of the actual
> > mTHP collapsing.
> >
> > If you plan on testing the mTHP changes for performance changes, I
> > would suggest enabling all the mTHP orders and setting max_ptes_none=3D=
0
> > (Devs series requires 0 or 511 for mTHP collapse to work). Given this
> > is a new feature, it may be hard to find something to compare it to,
> > other than each other's series'. enabling defer during these tests has
> > the added benefit of pushing everything to khugepaged and really
> > stressing its mTHP collapse performance.
> >
> > Once again thank you for taking the time to test these features :)
> > -- Nico
> >
> >
> > >
> > > Full results from our tests on the DGX A100 [1] and Lenovo SR670v2 [2=
]
> > > are linked below.
> > >
> > > [0]: https://www.phoronix.com/review/linux-os-ampereone/5
> > > [1]: https://pastebin.ubuntu.com/p/SDSSj8cr6k/
> > > [2]: https://pastebin.ubuntu.com/p/nqbWxyC33d/
> > > [3]: https://lwn.net/ml/all/20250211003028.213461-1-npache@redhat.com
> > > [4]: https://lwn.net/ml/all/20250211111326.14295-1-dev.jain@arm.com
> > > [5]: https://lwn.net/ml/all/20250211004054.222931-1-npache@redhat.com
> > > [6]: https://lwn.net/Articles/1009039/
> > > --
> > > Mitchell Augustin
> > > Software Engineer - Ubuntu Partner Engineering
> > >
> >
>
>
> --
> Mitchell Augustin
> Software Engineer - Ubuntu Partner Engineering



--=20
Mitchell Augustin
Software Engineer - Ubuntu Partner Engineering
