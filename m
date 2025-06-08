Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05ED8881E
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 19:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749412258; cv=none; b=QXbB7TjGfB1n5R+cjDW7yfNh+W8m4Wmz96ruXhjt3Ah+u70NJRPIOjjwt9JamjwrdjK5ngJKMzaOkqlHA9UmhP1Aq/6H54WPCZ/drns0KrJP/zwO6//ti+BB/Ch/MlRrKrBsvZ/Kv0nL0S1L0T/06JGxwQOZNPE9kQIin32mGBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749412258; c=relaxed/simple;
	bh=88AMdzoFBNDmcJryiNgWHCdeSzJ8LhZcwCy5uW/BCxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GUfB0lirBfLbRLkMyp8VLrIF7QUat+vP8xvcLuvTBM6v711tSBCvHMUr3gC3MNboPrrea6T/ldzd8qyvEgyYdZBXEQBb9ir/h0nA9mKtiT1dp5qrpx0BBJ8eKT9ATlU8u9OY4O2WpRFkOXo/Y7yPZm6zUKj7jcKKGRN5Uhven+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DOwPqHil; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DOwPqHil"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749412255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gasXKz9Jxw9/3PJAbVT23bLVIJ4As+DGQBJkm0aCWhY=;
	b=DOwPqHilIVf7mJEIxtqPO+x7o+M9GZ6zbMr0Zmvo+WWP9dinIlnTHXMIBNR/ocqN7KssDk
	YWdy0GzrJpb/O1PXuWU+rEZM53IjZl0+6sCLYmso2HKQfTR/pmWMxnd5vmKnAXxG6YldmQ
	QXqV8RPvecYxz+xtMbljPFYWrRGlHAU=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-c1al2WsqPomJUzmKWzN_1w-1; Sun, 08 Jun 2025 15:50:54 -0400
X-MC-Unique: c1al2WsqPomJUzmKWzN_1w-1
X-Mimecast-MFC-AGG-ID: c1al2WsqPomJUzmKWzN_1w_1749412254
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-70e86a2a1b8so53898657b3.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 12:50:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749412254; x=1750017054;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gasXKz9Jxw9/3PJAbVT23bLVIJ4As+DGQBJkm0aCWhY=;
        b=s7iR0B7zH7ODpbReJUsFYr0zbVGHkPjCe/thx+RDhRbw8b3hyi+vI6DK9n1uhPh+k1
         e2V56Pue2x/vPTk9DaaFI7xEF12K4woaKGwFvSxOaIx9PsarM3ckl2Bta01bOmPHpXOC
         HhvVrhW9ANBFfySorkNjZg6Dz5TFtxojzS/dffS8k7Svq0j0KtIUkefm9tUsrLaPb4MN
         C2wcsjwTXvtC1fL6TFFIQRD+irhhAeMhz4KXsFEQDP27Zt3nQHow2FrOFXgoRoI63K1P
         xsC/eao44NVCiDhgrGdpjQXHQBX8Em8QV54HX1/wsNRf8JfvXWxQGumDIKH4XRP+2boC
         /qhg==
X-Forwarded-Encrypted: i=1; AJvYcCVDi07uzfS5Bky+x4Ci6Isn51RVFqQhexj4Gvybgag8FJctWYaplBQjkl2aMnbmXWQ7+eOzOWZJv52kwRA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5LEk+FFnbSLz9/VIF9MhSZfLmrl9W3WD/SsnojTSY/mPP5tTI
	ckk6WfqdCKF8xKrOa30XKmUWvjQNWP3zYUdY7tMyBGrsH4mq3AiV96J+RDBJ5Evu3bHZf4U6Rzv
	q0zucmmIVQk95lolz6+PPx0SbII/TOkBNTvfUPsg95QELRxUsqjqgRLODbMcDQOD+ZRL1vtRDdt
	VUrIglqZCMUrMP5tZ29MdJNcVKc4gfH97Bc1rqEiij
X-Gm-Gg: ASbGncvy86l2i9vSkKfvbh7PXvRXiQcegUNiy8SvZXC1QQ4cGe7rWqyXqQtlhCRIQkw
	ujrlOsTmghuaPmsEDK5svDvtxICr8Z34slkKAdg3mhOamj8Ujp4JuR/L8TrUNyOPDCBd+GaA=
X-Received: by 2002:a05:690c:dca:b0:70c:a854:8384 with SMTP id 00721157ae682-710f76784cemr168534457b3.11.1749412254108;
        Sun, 08 Jun 2025 12:50:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWu7stkyjiQ0ZNuf8d9CDJ+dvYKVA2Wk959nktD4U5pqCa+ofumNklHDu4qFrTOBzjYxXs/wKaTDWnjxinMPk=
X-Received: by 2002:a05:690c:dca:b0:70c:a854:8384 with SMTP id
 00721157ae682-710f76784cemr168534137b3.11.1749412253792; Sun, 08 Jun 2025
 12:50:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515032226.128900-1-npache@redhat.com> <20250515032226.128900-13-npache@redhat.com>
 <bc8f72f3-01d9-43db-a632-1f4b9a1d5276@arm.com> <CAA1CXcDOEdJRvZMu2Fyy4wsdy8k8nj4c45s4JanO9HzyJgyXOw@mail.gmail.com>
 <b09d7553-c3c6-453a-8e3a-86dc4caeb431@arm.com>
In-Reply-To: <b09d7553-c3c6-453a-8e3a-86dc4caeb431@arm.com>
From: Nico Pache <npache@redhat.com>
Date: Sun, 8 Jun 2025 13:50:27 -0600
X-Gm-Features: AX0GCFubrwAxCeJO6WQ3ctfkybHkm-zGqyO1Fes9K65B6S5xXXinZkRMQU9vx5Y
Message-ID: <CAA1CXcB-A9U8GEodPrm3QdndzB2MY7eZHnoojVYU5fi_DJBbcw@mail.gmail.com>
Subject: Re: [PATCH v7 12/12] Documentation: mm: update the admin guide for
 mTHP collapse
To: Dev Jain <dev.jain@arm.com>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	david@redhat.com, ziy@nvidia.com, baolin.wang@linux.alibaba.com, 
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, ryan.roberts@arm.com, 
	corbet@lwn.net, rostedt@goodmis.org, mhiramat@kernel.org, 
	mathieu.desnoyers@efficios.com, akpm@linux-foundation.org, baohua@kernel.org, 
	willy@infradead.org, peterx@redhat.com, wangkefeng.wang@huawei.com, 
	usamaarif642@gmail.com, sunnanyong@huawei.com, vishal.moola@gmail.com, 
	thomas.hellstrom@linux.intel.com, yang@os.amperecomputing.com, 
	kirill.shutemov@linux.intel.com, aarcange@redhat.com, raquini@redhat.com, 
	anshuman.khandual@arm.com, catalin.marinas@arm.com, tiwai@suse.de, 
	will@kernel.org, dave.hansen@linux.intel.com, jack@suse.cz, cl@gentwo.org, 
	jglisse@google.com, surenb@google.com, zokeefe@google.com, hannes@cmpxchg.org, 
	rientjes@google.com, mhocko@suse.com, rdunlap@infradead.org, 
	Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 7, 2025 at 8:35=E2=80=AFAM Dev Jain <dev.jain@arm.com> wrote:
>
>
> On 07/06/25 6:27 pm, Nico Pache wrote:
> > On Sat, Jun 7, 2025 at 12:45=E2=80=AFAM Dev Jain <dev.jain@arm.com> wro=
te:
> >>
> >> On 15/05/25 8:52 am, Nico Pache wrote:
> >>
> >> Now that we can collapse to mTHPs lets update the admin guide to
> >> reflect these changes and provide proper guidence on how to utilize it=
.
> >>
> >> Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
> >> Signed-off-by: Nico Pache <npache@redhat.com>
> >> ---
> >>   Documentation/admin-guide/mm/transhuge.rst | 14 +++++++++++++-
> >>   1 file changed, 13 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentatio=
n/admin-guide/mm/transhuge.rst
> >> index dff8d5985f0f..5c63fe51b3ad 100644
> >> --- a/Documentation/admin-guide/mm/transhuge.rst
> >> +++ b/Documentation/admin-guide/mm/transhuge.rst
> >>
> >>
> >> We need to modify/remove the following paragraph:
> >>
> >> khugepaged currently only searches for opportunities to collapse to
> >> PMD-sized THP and no attempt is made to collapse to other THP
> >> sizes.
> > On this version this is currently still true, but once I add Baolin's
> > patch it will not be true. Thanks for the reminder :)
>
> You referenced Baolin's patch in the other email too, can you send the li=
nk,
> or the patch?

He didn't send it to the mailing list, but rather off chain to all the
recipients of this series. You should have it in your email look for

Subject: "mm: khugepaged: allow khugepaged to check all anonymous mTHP
orders" and "mm: khugepaged: kick khugepaged for enabling
none-PMD-sized mTHPs"

-- Nico
>
> >
> > -- Nico
> >
>

