Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F6214AD2D
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 18:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746038613; cv=none; b=BMl/4bgIKJ6TBDg7MABep/RUJqxa9lFzr7ZYj5ggFXS06MIgfNYPyhFqF1d+XHJTfJIOJ6z4oTcLoQTWGF9Pf4iQz9vRlnP9DV7JMhjONB3b2AFe/ifhCOd9lKRCb902u+n1CT+kWX34hBtbzgq3Vi7M0+Q0typn/sgW1wV8n+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746038613; c=relaxed/simple;
	bh=nwMy4TfEjOLeyl5MmrHOSLVf52aNii4S6d88xbFYX+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aJ1fh2/xRQpgSiIULiVGwdM0shkXPbGOj45US5ReKOW7FPUxYCv36CF5E1H6XgXSM4fCfYeHHXSRZxr5jNDAj3GNEWHoOQM+BYxcFV758gYtDuxxvVQgsktQsQ3+RLbPDvjxi8wmfrSz3WgtlHSfaqZcNbk+2KSXm49HYn4hkDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C1m5TLto; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C1m5TLto"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746038610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sGtyvAblPdq5h4RDZn9A53olL+bKAgVIn20wqzqV2vo=;
	b=C1m5TLtorFiTSlC9UZcrH0bJ3FZeZsPUNnOCbnlDdzPZF6bYE7fstNff9xLOX482rDCyIY
	pWq6Dvkr60JoB0uA8c5WlevEAIB8wia9nxVtA84HlpVSsJul+WZUDLz6e5xm8OaGu0gdTN
	gNsxk06KCIJjrnihUSwNtphs+Nhlkro=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-385-N3b85gIINiCYJGt6R_E9Ig-1; Wed, 30 Apr 2025 14:43:28 -0400
X-MC-Unique: N3b85gIINiCYJGt6R_E9Ig-1
X-Mimecast-MFC-AGG-ID: N3b85gIINiCYJGt6R_E9Ig_1746038608
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-6fda1dcbdf1so2718107b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 11:43:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746038608; x=1746643408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sGtyvAblPdq5h4RDZn9A53olL+bKAgVIn20wqzqV2vo=;
        b=NjwgeoztK0WgFtGaDwFD4zSEddYHtxRfwTiV8DsjGLQ2/f6mgawv417hiNGmYK8pac
         BJsabMHqL+CyRFdrf0aW/gsktN6p+lZER0F9kr+dvCXskX5PjHkHu/emB56W2tDW2HT4
         +DlKm/UKtDwQTIsrHH6+iSy/PJy9E9cLae0Qrzq+yuy9nwBx4bk67RctrYQulhGZw8kF
         aSPgmTr5yPaub9ZPZ9Kpde7Uwnv66RDvBXlSBT9uUr+wHwV/yCu94n6VJjTO88FSjfJ3
         IJtjaT98RXZr8yINP7nB+gKmdGF6HGwsRIIEW2WbDbqk01Z2eBlftlRtG44qzvfBhkXz
         MAXA==
X-Forwarded-Encrypted: i=1; AJvYcCWzxe8cBBQQP8ODregx1efnw3YzNOA3iZBccB5IyI4aR+Fr/m5wpQ6YfQyxVygsr3bUC/AdR57juSDTH5s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHgktySLImfYBhmA/LiH6QmG+/52a+AmRsfQxVPWJjOxFvdrQm
	fT3s7TH7TsJBFe0d9CaFESknFGx8ZhLKAAmJiCvVsrwUHB2vUeu0psxiJ3hj3rmSvy6sAbD2AQ4
	DdIW+Woyc5vPuFcUqCNSsy97XiCtNDTDzFuM5wWHMs/hCWfITYoD0UWKjS5UZfZ4GcYhWxNcvMX
	KCa91V3ql/uJO+dLdCyCCKUIDW/zGsnYPA43+n
X-Gm-Gg: ASbGncud/NNeyf7spVKDcmNr6VjbCIaYX6Q3BovI87dtXSto4zKLhDdLESTLfdZ3t1r
	+vdqzxXaVtrJ5gJSdAPGo8TW2RBIHdbQ2EJndmNccCgpDS7WIp8OV1jK1SJMdvPE7aTaan/aKLS
	+2bIlH23g=
X-Received: by 2002:a05:690c:6e01:b0:6ef:5097:5daa with SMTP id 00721157ae682-708abe4b425mr66866107b3.34.1746038608282;
        Wed, 30 Apr 2025 11:43:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsC2vZql3Dxhu844riBX0qx5iUsGKJcDpqIjlHOQ18tsV7lZm4AquyInHqSFrwH5gRENp1Np1sxc9yUD6IIdY=
X-Received: by 2002:a05:690c:6e01:b0:6ef:5097:5daa with SMTP id
 00721157ae682-708abe4b425mr66865567b3.34.1746038608003; Wed, 30 Apr 2025
 11:43:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428181218.85925-1-npache@redhat.com> <20250428181218.85925-10-npache@redhat.com>
 <ba59d6aa-ade3-4440-a0ed-ef276b45f9d2@linux.alibaba.com>
In-Reply-To: <ba59d6aa-ade3-4440-a0ed-ef276b45f9d2@linux.alibaba.com>
From: Nico Pache <npache@redhat.com>
Date: Wed, 30 Apr 2025 12:43:01 -0600
X-Gm-Features: ATxdqUFWtHWq5aUrqZ9Adf9gtcRPQJMwNnkBweD5j20SDmerE4jyu4OMpWWRzi8
Message-ID: <CAA1CXcAqGxVHdwos4bdZ8kR3PS=iqs2UgQ+DKdTejo5jUm_5ww@mail.gmail.com>
Subject: Re: [PATCH v5 09/12] khugepaged: avoid unnecessary mTHP collapse attempts
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
	rdunlap@infradead.org, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 4:12=E2=80=AFAM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
>
>
> On 2025/4/29 02:12, Nico Pache wrote:
> > There are cases where, if an attempted collapse fails, all subsequent
> > orders are guaranteed to also fail. Avoid these collapse attempts by
> > bailing out early.
> >
> > Signed-off-by: Nico Pache <npache@redhat.com>
> > ---
> >   mm/khugepaged.c | 17 +++++++++++++++++
> >   1 file changed, 17 insertions(+)
> >
> > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > index 86d1153ce9e8..5e6732cccb86 100644
> > --- a/mm/khugepaged.c
> > +++ b/mm/khugepaged.c
> > @@ -1365,6 +1365,23 @@ static int khugepaged_scan_bitmap(struct mm_stru=
ct *mm, unsigned long address,
> >                               collapsed +=3D (1 << order);
> >                               continue;
> >                       }
> > +                     /*
> > +                      * Some ret values indicate all lower order will =
also
> > +                      * fail, dont trying to collapse smaller orders
> > +                      */
> > +                     if (ret =3D=3D SCAN_EXCEED_NONE_PTE ||
> > +                             ret =3D=3D SCAN_EXCEED_SWAP_PTE ||
> > +                             ret =3D=3D SCAN_EXCEED_SHARED_PTE ||
> > +                             ret =3D=3D SCAN_PTE_NON_PRESENT ||
> > +                             ret =3D=3D SCAN_PTE_UFFD_WP ||
> > +                             ret =3D=3D SCAN_ALLOC_HUGE_PAGE_FAIL ||
> > +                             ret =3D=3D SCAN_CGROUP_CHARGE_FAIL ||
> > +                             ret =3D=3D SCAN_COPY_MC ||
> > +                             ret =3D=3D SCAN_PAGE_LOCK ||
> > +                             ret =3D=3D SCAN_PAGE_COUNT)
> > +                             goto next;
> > +                     else
> > +                             break;
>
> Better to merge this patch into patch 6, which can be helped to
> understand your logic.
Sounds good, it wasnt part of the original logic/RFCs so i separated
it out to get some review on it.
>

