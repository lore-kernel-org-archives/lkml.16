Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BCE258CD3
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 05:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749448618; cv=none; b=FTRqrixKRHvBQrBbveYD2VW7RZcS8TEB8Mi9Ca6+z+1yOGreehT7FbO6fi8nfNWvT4sKVIgpw8GQZPnwNJ8QDKBbg2A5oCx6Wvtmh3gvVkYuiUZ7P93ka23MnznG6Jledyb1SfvahR22SWorTqYWT4PfldOwFIxWVGz5QjEx534=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749448618; c=relaxed/simple;
	bh=vNS158ShG2B7yjPCeukEDeEpTS5lNOwR1UkTuUQ56Fs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iB4REOro/1tT3u8LXOZBa4mumDd8YGJ1jBoqkbROhrTmsaQ4cW56F7ZxWlX0/n7sZsyBB1AKZDP4TBw+0bqmqfAbhPzNNhSZNv0AUCVV6STj8pzu+USCiUJYI4KkbWbY4G5bHS2WO+fqL9t0A3I9LHlxnQSlvkX/7L4e/pL2tU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eRuifbxy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eRuifbxy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749448615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vqm3xxVv+/VjKrDURC+Ycvj54gttmx3jtmmQVDlPcko=;
	b=eRuifbxyTnLZOmbzdz2DheAkR44NEvU0slvbMwi+2uCC+TVQdqprU6Lq7iMr1x2ew1lfq8
	1O/KpaCORZbU9CnIj5twitTgl3Y6QDV+S0qWOPpBjspkG6IspKa+TP2rAvvLbjHmRNCJq5
	2ScbqLx6lYMlMlCCIIvMGBnl+w4hKvE=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-266-k70Vw2--One8Z4E75-hjmw-1; Mon, 09 Jun 2025 01:56:52 -0400
X-MC-Unique: k70Vw2--One8Z4E75-hjmw-1
X-Mimecast-MFC-AGG-ID: k70Vw2--One8Z4E75-hjmw_1749448612
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-70e5e6ab756so56701787b3.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 22:56:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749448612; x=1750053412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vqm3xxVv+/VjKrDURC+Ycvj54gttmx3jtmmQVDlPcko=;
        b=MU/tV7scqq+nr3DKT9CxKVIv0HdDLSwYf3QmzBn9cg4asfuGlGuT6o05vDerZLusk2
         j+DE70NqyCeJzdJ33z+j5vNz+vXIZqsLlbz+CKDiR1eHHKmqm41hifxj/ptDUiLABzJb
         wIT5Mw9H5kSxHKaomPxpZkMqvYnuOz2I8dWqV5Fgsc7hlGIUd24JLH+hqGOpMWhundpU
         dScAflPEHqpzdNPCxnPi2u2GiczLG5GJIUug2f5kQltB1+5tOE3uCaNDhyecWfIjcXHm
         nbYn4XgtRWCqYJwf8AdmS7oMly6jeXGqr1SNIyjwef+hbsehc547/JlXf/R1t/XSSXss
         TdJw==
X-Forwarded-Encrypted: i=1; AJvYcCUfpxZC73mYdJnZlRcFtsUaIxKvp8HSTHMQO+SHzwPW1PWjENQN0XIRYO4OW5bbiyD0eXfFv5OlQvfjkR8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuKWQUnDk14X1Gpy9QYQv4vxRJ/p3k/cGPC8sWegzy66LimEV7
	LyAoj4WJaPaUc9FAuw59qzJ3syYbXQUQixlUwRVIdinxUe/HygOMsrDlmkID7J8EDRFvCM6fqm/
	IvPMYuR0xhswfzHOr6KFgWeKAiEEjA7OcB1gELRxCFf34pCzGyYo1B/Qduz7gXwNGSUc+bVxI2K
	cl2xbbMidzjkQ2N0fp0bBQchPec0+YpLq7Xayq5KKD
X-Gm-Gg: ASbGncs5u80N6u/QVU7qdXrk+b6D52t/5hVusPLufPMOkTD8EoJnq8RK5OVE7ArY2tf
	7kVsNgcaez22Vj9QT4rdNguL7lysqRp+be7T1C+Rb4yLfp+9PzpJ3O7CLFUC8LRX/5u1gZ0mLI8
	iFQ2ORZg==
X-Received: by 2002:a05:690c:6405:b0:70e:719e:75e with SMTP id 00721157ae682-710f764c725mr159460497b3.9.1749448611774;
        Sun, 08 Jun 2025 22:56:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3C11sjnjbTZhny9xnmroD6QMw7j0geEYJv4f/FkqQZmNJJLMcJ6M9t7YznoNmfL2tiNujdo8+9UaKO9hzluo=
X-Received: by 2002:a05:690c:6405:b0:70e:719e:75e with SMTP id
 00721157ae682-710f764c725mr159460177b3.9.1749448611470; Sun, 08 Jun 2025
 22:56:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515032226.128900-1-npache@redhat.com> <20250515032226.128900-13-npache@redhat.com>
 <bc8f72f3-01d9-43db-a632-1f4b9a1d5276@arm.com> <CAA1CXcDOEdJRvZMu2Fyy4wsdy8k8nj4c45s4JanO9HzyJgyXOw@mail.gmail.com>
 <b09d7553-c3c6-453a-8e3a-86dc4caeb431@arm.com> <CAA1CXcB-A9U8GEodPrm3QdndzB2MY7eZHnoojVYU5fi_DJBbcw@mail.gmail.com>
 <4a2c359e-79d9-447b-a43e-164333d08319@linux.alibaba.com>
In-Reply-To: <4a2c359e-79d9-447b-a43e-164333d08319@linux.alibaba.com>
From: Nico Pache <npache@redhat.com>
Date: Sun, 8 Jun 2025 23:56:25 -0600
X-Gm-Features: AX0GCFvmuZajSTbsu_WiqNIkiQcNxDc31lsw2O8E2jnjV1KK5u2qYW0RnE8tmzQ
Message-ID: <CAA1CXcAqAQ=WazLc=s3bQEbjLah27-fPTGgofZ55h7+rtFacJQ@mail.gmail.com>
Subject: Re: [PATCH v7 12/12] Documentation: mm: update the admin guide for
 mTHP collapse
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Dev Jain <dev.jain@arm.com>, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	david@redhat.com, ziy@nvidia.com, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, ryan.roberts@arm.com, corbet@lwn.net, 
	rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	akpm@linux-foundation.org, baohua@kernel.org, willy@infradead.org, 
	peterx@redhat.com, wangkefeng.wang@huawei.com, usamaarif642@gmail.com, 
	sunnanyong@huawei.com, vishal.moola@gmail.com, 
	thomas.hellstrom@linux.intel.com, yang@os.amperecomputing.com, 
	kirill.shutemov@linux.intel.com, aarcange@redhat.com, raquini@redhat.com, 
	anshuman.khandual@arm.com, catalin.marinas@arm.com, tiwai@suse.de, 
	will@kernel.org, dave.hansen@linux.intel.com, jack@suse.cz, cl@gentwo.org, 
	jglisse@google.com, surenb@google.com, zokeefe@google.com, hannes@cmpxchg.org, 
	rientjes@google.com, mhocko@suse.com, rdunlap@infradead.org, 
	Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 8, 2025 at 9:06=E2=80=AFPM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
>
>
> On 2025/6/9 03:50, Nico Pache wrote:
> > On Sat, Jun 7, 2025 at 8:35=E2=80=AFAM Dev Jain <dev.jain@arm.com> wrot=
e:
> >>
> >>
> >> On 07/06/25 6:27 pm, Nico Pache wrote:
> >>> On Sat, Jun 7, 2025 at 12:45=E2=80=AFAM Dev Jain <dev.jain@arm.com> w=
rote:
> >>>>
> >>>> On 15/05/25 8:52 am, Nico Pache wrote:
> >>>>
> >>>> Now that we can collapse to mTHPs lets update the admin guide to
> >>>> reflect these changes and provide proper guidence on how to utilize =
it.
> >>>>
> >>>> Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
> >>>> Signed-off-by: Nico Pache <npache@redhat.com>
> >>>> ---
> >>>>    Documentation/admin-guide/mm/transhuge.rst | 14 +++++++++++++-
> >>>>    1 file changed, 13 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentat=
ion/admin-guide/mm/transhuge.rst
> >>>> index dff8d5985f0f..5c63fe51b3ad 100644
> >>>> --- a/Documentation/admin-guide/mm/transhuge.rst
> >>>> +++ b/Documentation/admin-guide/mm/transhuge.rst
> >>>>
> >>>>
> >>>> We need to modify/remove the following paragraph:
> >>>>
> >>>> khugepaged currently only searches for opportunities to collapse to
> >>>> PMD-sized THP and no attempt is made to collapse to other THP
> >>>> sizes.
> >>> On this version this is currently still true, but once I add Baolin's
> >>> patch it will not be true. Thanks for the reminder :)
> >>
> >> You referenced Baolin's patch in the other email too, can you send the=
 link,
> >> or the patch?
> >
> > He didn't send it to the mailing list, but rather off chain to all the
> > recipients of this series. You should have it in your email look for
> >
> > Subject: "mm: khugepaged: allow khugepaged to check all anonymous mTHP
> > orders" and "mm: khugepaged: kick khugepaged for enabling
> > none-PMD-sized mTHPs"
>
> You can find them at the following link:
> https://lore.kernel.org/all/ac9ed6d71b439611f9c94b3506a8ce975d4636e9.1748=
435162.git.baolin.wang@linux.alibaba.com/
Ah whoops you did send them on-chain. I'm so used to seeing the
mailing lists as the first recipients on the CC list xD
>

