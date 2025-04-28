Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC525279911
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 15:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745855082; cv=none; b=q9h2XXGjW07OLJyub8MPbsx00InuzC08xlUGjU3DtNIjatQqNUR8d/W3MtSEdmGMAZ7L/F4c1rMoo1YyjwvqgtXcF7XERB6Yt2ywZV27wDdMqE9dmYALOeBWzPFkTfnatbsEPAeVs+xsygIwrjRq/w2uOnRAIvwzpExzkzGD7rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745855082; c=relaxed/simple;
	bh=JRoFg1ifrt/ihL83AT1Ka7YY9StfO8fc3iHKwc1eEVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h4VTlesyzxAPYVWVrqJao3R8w3+lJQmdUoEwv4QkGHgjk9jcKXib5ZJ6+1JuYTZpuyOYfbU+/v/gU+6vwwWhh1l9ETRFaZ9fpIeD6xMP5AO6ms2nQHa9V5YO2UQh4YqD6Aqh59YW+cw5GKhB55QEbLP8zWWIgNHJw9vwzO1Uct0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WW3YURQy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WW3YURQy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745855078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pxbbN4qJN6Ru59aJPa/Q4S65KBGqqKkgsmmSWCFTdOU=;
	b=WW3YURQyJugjSroH4gZrtDImnGWHmT1q6+777CO7nm+UWN1lKj90ZbaPH/BlOBUEpicKFD
	JKjAxht73Ln92wZoIlsgWcWlerjqElOIdRb2XJL5xNH2m8CUEY2cZvc5AvJw0J3nDMZs35
	4iIwtQc7WalpeovpUYCe4x2j3j4XgoU=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-FmNsl47TODCVYYf0dE0BQA-1; Mon, 28 Apr 2025 11:44:37 -0400
X-MC-Unique: FmNsl47TODCVYYf0dE0BQA-1
X-Mimecast-MFC-AGG-ID: FmNsl47TODCVYYf0dE0BQA_1745855077
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-70552c16b9eso62045947b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 08:44:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745855076; x=1746459876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pxbbN4qJN6Ru59aJPa/Q4S65KBGqqKkgsmmSWCFTdOU=;
        b=r/CrSdMiDeaNoJM9P6Ao75xU+FTcSoA99fV6y3f8YdHuOmXkwkGTqvteMhmnrMJRI0
         BboFy2BBMVvRrNGl7vdWfeV2b2NDl4Nm1GD+p5WlmxwjwiEhq5b2eL73Mj7bQTBwDFqJ
         HFNFeBHtT69TJwfdWhtZCQ4KrjTDXWHA0JjOFIM+85aGnEa4AmP6ZEyMAhFtiXgYvA4p
         ilC/aX59ChIHUpOjqcP7spvkyySvwv27td5c6wfL+HaHPCoe+NcS1aqwwED5NFHhVJYg
         ZdxNJTfcN7LOSOzoOxhdXHc1cjlOvfstBFGfDOcPtu73rHjXDYbm/OAqMIJKjQdspFyO
         pExw==
X-Forwarded-Encrypted: i=1; AJvYcCWGd6up16JNvLeglKeBAUS3JaA5zkAj6l7b6gcqMtj7sQpiZ5Wm3hpYEN9zcWD9QePOEPsSoJMxfCfI99U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlKYECLyHkpoqU1p5DPlMv75NBcTUvHD8pv/QDMiY7ADXBeGZR
	aicTy78CtKx3msvMaZLxGIbvVj3Wo1kKoClNPL/FbTSVc+xEtnZNuvUhFO4IA4+E0ra+57PcDPF
	Lf0W4Jpv79b4Ym/6Pj/TBv3q8F3ol9NPhFsWlhpeHsGfGX98YQcRI53utdZkXM4cRx27aCXv0oi
	/+eO8p+HXYIIwAEwImuxtdm3BTlemSap8t0/OB
X-Gm-Gg: ASbGncv9eqWr8TgfB0VbktwsvWhTQTCT8g5km5W6Ct7aDi1YoF37TzM6oQUO5f6RQ4x
	Ks4/fUhojGRWFbo/0bihgXlV9qMP6Wz1YI8kDIoQkuhJ1E67WyQ9BP14NghbwvOciiPNKVJwh/o
	3lMcajqJU=
X-Received: by 2002:a05:690c:6b87:b0:6ef:5c57:904 with SMTP id 00721157ae682-708540ce38amr156786607b3.7.1745855076652;
        Mon, 28 Apr 2025 08:44:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6qCK0RP1Osqb6P+Q+6TNekm7P5LWk3+X90KpMgq7ufBwRs3S0yE0ZPxUoRWXjGPRpcWW70ryslqWVN+3xc60=
X-Received: by 2002:a05:690c:6b87:b0:6ef:5c57:904 with SMTP id
 00721157ae682-708540ce38amr156785937b3.7.1745855076172; Mon, 28 Apr 2025
 08:44:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417000238.74567-1-npache@redhat.com> <20250417000238.74567-9-npache@redhat.com>
 <fb932eac-86ce-4f7d-8eed-8dc44f5a40c1@linux.alibaba.com>
In-Reply-To: <fb932eac-86ce-4f7d-8eed-8dc44f5a40c1@linux.alibaba.com>
From: Nico Pache <npache@redhat.com>
Date: Mon, 28 Apr 2025 09:44:09 -0600
X-Gm-Features: ATxdqUE76Pjv3zn_HiGc1qM-i1cE-erjrnyMNKG7-H8ENZEIid857QeclmukKN8
Message-ID: <CAA1CXcCEsdW+k96DX3LZ6J4MmNEnugyxCXcHkneqxV4-nahmsg@mail.gmail.com>
Subject: Re: [PATCH v4 08/12] khugepaged: skip collapsing mTHP to smaller orders
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, corbet@lwn.net, rostedt@goodmis.org, 
	mhiramat@kernel.org, mathieu.desnoyers@efficios.com, david@redhat.com, 
	baohua@kernel.org, ryan.roberts@arm.com, willy@infradead.org, 
	peterx@redhat.com, ziy@nvidia.com, wangkefeng.wang@huawei.com, 
	usamaarif642@gmail.com, sunnanyong@huawei.com, vishal.moola@gmail.com, 
	thomas.hellstrom@linux.intel.com, yang@os.amperecomputing.com, 
	kirill.shutemov@linux.intel.com, aarcange@redhat.com, raquini@redhat.com, 
	dev.jain@arm.com, anshuman.khandual@arm.com, catalin.marinas@arm.com, 
	tiwai@suse.de, will@kernel.org, dave.hansen@linux.intel.com, jack@suse.cz, 
	cl@gentwo.org, jglisse@google.com, surenb@google.com, zokeefe@google.com, 
	hannes@cmpxchg.org, rientjes@google.com, mhocko@suse.com, 
	rdunlap@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 1:49=E2=80=AFAM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
>
>
> On 2025/4/17 08:02, Nico Pache wrote:
> > khugepaged may try to collapse a mTHP to a smaller mTHP, resulting in
> > some pages being unmapped. Skip these cases until we have a way to chec=
k
> > if its ok to collapse to a smaller mTHP size (like in the case of a
> > partially mapped folio).
> >
> > This patch is inspired by Dev Jain's work on khugepaged mTHP support [1=
].
> >
> > [1] https://lore.kernel.org/lkml/20241216165105.56185-11-dev.jain@arm.c=
om/
> >
> > Co-developed-by: Dev Jain <dev.jain@arm.com>
> > Signed-off-by: Dev Jain <dev.jain@arm.com>
> > Signed-off-by: Nico Pache <npache@redhat.com>
> > ---
> >   mm/khugepaged.c | 7 ++++++-
> >   1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > index ece39fd71fe6..383aff12cd43 100644
> > --- a/mm/khugepaged.c
> > +++ b/mm/khugepaged.c
> > @@ -625,7 +625,12 @@ static int __collapse_huge_page_isolate(struct vm_=
area_struct *vma,
> >               folio =3D page_folio(page);
> >               VM_BUG_ON_FOLIO(!folio_test_anon(folio), folio);
> >
> > -             /* See hpage_collapse_scan_pmd(). */
> > +             if (order !=3D HPAGE_PMD_ORDER && folio_order(folio) >=3D=
 order) {
> > +                     result =3D SCAN_PTE_MAPPED_HUGEPAGE;
> > +                     goto out;
> > +             }
>
> Should we also add this check in hpage_collapse_scan_pmd() to abort the
> scan early?
No I dont think so, we can't abort there because we dont know the
attempted collapse order, and we dont want to miss potential mTHP
collapses (by bailing out early and not populating the bitmap).

-- Nico
>

