Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6BA1FFC74
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 21:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749158163; cv=none; b=i4lmFWXo5wvF3szunWyidqP8VZO0O56oc6BLBIVhR7bxusV8ieoXFj0Y7YBDVPs701IrC7/Zc6TVcO6k25O4sIW5kJ/WwpAYnwQMzJXo4VcisivzwuMWl2uKeZLYHQ0zLkn+OnnvsnrrcYzQ78B2vyFOKFK30L+JLFi8ljB8NmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749158163; c=relaxed/simple;
	bh=deJ8ujgYVXOLDRzPlJGjcrFyGqlX+2qP5XJVIPJC13c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aac8sUZKp0FXfnGbg4XFULY2n1J/24t6m3NOnDrfbfFkHRT6B/CGSZaXV7D57MBEz+BBqZ8sYPDYx7LeqiuA3T2EWowINoeIgh73dp2xrBT6g7d/hClmRdBRrbbdHleX6ZEpzCgGV8fuwo5HE38e+8t8q+vGVMkFp6yriBM7GbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=nlIddnrB; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="nlIddnrB"
Received: from pps.filterd (m0167069.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555L4tw1008045
	for <linux-kernel@vger.kernel.org>; Thu, 5 Jun 2025 17:16:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=pps01;
 bh=kYNh9HFT2uHBGBuTCKgX10WS8SJF8NGZEUcVRDSxRuQ=;
 b=nlIddnrBHoiqBQUxB3TXUWD9X49XJOdQ8+6EFQ5EkkzQBJ3Ia4xkx6p3xxL6htuwx2k2
 MilhN28kQAe1lMta4lgEf62GFMpuusvSIwB8OX959Du/kJ+7/9/udrZ+bsChklShmuvE
 R6UQOtySiL0jiZJxeEY+djwK81qUIFPntG2IP2HS3Y+jmPWute/Mc4Kr+ppfCYyQ0ctV
 fweOOaMHrYGDfqtcfq0Eh/KCeG4NoXFx7TLozSakYOPqBMRwehriUz0O/bdX9vPVsFig
 UnJ2V+4rnw+qKv6oYuaVKhdQY/eaEHZbO5kt0JyKfAxzbgH7oyDkFEFwxTRogKMnbpcm 8A== 
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 471ethd1cr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 17:16:01 -0400
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-70e649662deso20058987b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 14:16:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749158160; x=1749762960;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kYNh9HFT2uHBGBuTCKgX10WS8SJF8NGZEUcVRDSxRuQ=;
        b=BoXq7Mdbpm721HYmS3Rel2m5oXsjj8q2nqkPfzuI28keAJ4ry5yMw0HJm5yxadcDeU
         TwEo2o8vUxVXK6v1jFTL/UxpXm6A78pYPsheXVsiRbO6lSGx9OB8oT/AhvYBqDCFPuhB
         PoMXnAdJ8sFH4xJGR1zrftTUlI+0ewAemKdAs51mDU5R6jB+a7Pp10LmOrCafI7t1Zot
         yHTQG0I0Y6UTZV3FgQcbOuU3kObk2oRH1EMbKRBQ4eRbA439IDfPExmYA8m+gTPFbjbN
         RA0btHgdqj+8og8g9bvSxGi0P1AN4KmSlvIg/Gte5JPic5mPxXDEUHlDNLwh/qepxRuC
         c9Aw==
X-Forwarded-Encrypted: i=1; AJvYcCXTikZR5Ma8WCukpkymfXXzb1mCKU4MKuB0HuF+rWyjXc0bYFIlMjJBT9GQzVfA1Yik8OX3ACMjL6dKzzY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnlvP+pD5bUcB60IkttQrQn3dQ1/UCzt+athsiT7OhBkMLK+PQ
	QsrsUwN1m+vpomNQtw5KD3CHs+63mGJuX8DcFSSQzTNOHsceGMGkFbKMlaecasJa3fsgT/fXqQO
	A1yRrzy11G6NcsmFq/Xnx4Hei7VQj+o1zwhSnX1zaPvJGwlp8YdwcE2NQ3E5bSHZlyesW1WVDxT
	663+WbV5GRlCK3JmykvfmU/fQBKjrqPEtzMFdX
X-Gm-Gg: ASbGncsZjDAtLi81tzlheT2IRD0e+hVaYAqzG5BnlHPogNdefLfPMDMgH8DUUoqF2KF
	xPLsSvPbvt1fzt7+TGKBQh6cDjfC+jb77XJUuozD67KuQDnKjml92udWMuACDlecJIg9v3fHZwA
	/MI3FP
X-Received: by 2002:a05:6902:228d:b0:e81:9ebf:f5ed with SMTP id 3f1490d57ef6-e81a226a62dmr1945945276.1.1749158160143;
        Thu, 05 Jun 2025 14:16:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHb2rG2d+9fop1XPRUg94ju87oBPhimyPjoI4Ye2fKsZq+dhB515YFqLZyXsjORvVHzCfDPRC8LU2/J90no5JA=
X-Received: by 2002:a05:6902:228d:b0:e81:9ebf:f5ed with SMTP id
 3f1490d57ef6-e81a226a62dmr1945917276.1.1749158159774; Thu, 05 Jun 2025
 14:15:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603-uffd-fixes-v1-0-9c638c73f047@columbia.edu>
 <20250603-uffd-fixes-v1-2-9c638c73f047@columbia.edu> <84cf5418-42e9-4ec5-bd87-17ba91995c47@redhat.com>
 <aEBhqz1UgpP8d9hG@x1.local> <0a1dab1c-80d2-436f-857f-734d95939aec@redhat.com>
In-Reply-To: <0a1dab1c-80d2-436f-857f-734d95939aec@redhat.com>
From: Tal Zussman <tz2294@columbia.edu>
Date: Thu, 5 Jun 2025 17:15:49 -0400
X-Gm-Features: AX0GCFsgrid_kqSVQH8gQAr68i4R2zJRlWIOJnyZmu8rrEwiMxn2I5F4znJwQ4U
Message-ID: <CAKha_sovhM3ju9jV-d_2PgbWLhuCek5MgdVRVt24y7TQcmZvQg@mail.gmail.com>
Subject: Re: [PATCH 2/3] userfaultfd: prevent unregistering VMAs through a
 different userfaultfd
To: David Hildenbrand <david@redhat.com>
Cc: Peter Xu <peterx@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
        Andrea Arcangeli <aarcange@redhat.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: ArsyigDrO2xo_upDYsoyk2lNq4mtkvhP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE5MSBTYWx0ZWRfX57zoscl6W5AF Ad9eU8snyyrzL08cA61og76ji85izZa81iTmv+wL/Bb95hsofPzFseipHXkC7dM33UgTXyr08dK QPozlM7GeFnXntPOc6mv9qo+5+Ue+dia9CCA3KcQnz7ryI8x/mvoIKPrf7xxZ32yZDhPxMOIkE4
 2YLWh3t6k03RAWQF120y3PHfKaBGVng5jiDx98eFpQmgHKT+7NNQ/HZxWVKZIWjrBCemi4ixghu dcY3CILDxR1yuGiLmvbXdBdKI9xHPzkS5HIj8xbKJtwam2MwLDlj/oFIzqryScfn9poVBA+7eYw YgwW7wp8CjTD7fNAT5z4qYkDF2J94Ax02k0pUoKHLi/J18H+zznAoVxgYn+mggN9XGMFeKYhNvF uP/j8gSM
X-Proofpoint-ORIG-GUID: ArsyigDrO2xo_upDYsoyk2lNq4mtkvhP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_06,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=10 phishscore=0
 bulkscore=10 adultscore=0 priorityscore=1501 clxscore=1015 mlxscore=0
 mlxlogscore=844 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506050191

On Thu, Jun 5, 2025 at 5:06=E2=80=AFPM David Hildenbrand <david@redhat.com>=
 wrote:
>
> On 04.06.25 17:09, Peter Xu wrote:
> > On Wed, Jun 04, 2025 at 03:23:38PM +0200, David Hildenbrand wrote:
> >> On 04.06.25 00:14, Tal Zussman wrote:
> >>> Currently, a VMA registered with a uffd can be unregistered through a
> >>> different uffd asssociated with the same mm_struct.
> >>>
> >>> Change this behavior to be stricter by requiring VMAs to be unregiste=
red
> >>> through the same uffd they were registered with.
> >>>
> >>> While at it, correct the comment for the no userfaultfd case. This se=
ems
> >>> to be a copy-paste artifact from the analagous userfaultfd_register()
> >>> check.
> >>
> >> I consider it a BUG that should be fixed. Hoping Peter can share his
> >> opinion.
> >
> > Agree it smells like unintentional, it's just that the man page indeed
> > didn't mention what would happen if the userfaultfd isn't the one got
> > registered but only requesting them to be "compatible".
> >
> > DESCRIPTION
> >         Unregister a memory address range from userfaultfd.  The pages =
in
> >         the range must be =E2=80=9Ccompatible=E2=80=9D (see UFFDIO_REGI=
STER(2const)).
> >
> > So it sounds still possible if we have existing userapp creating multip=
le
> > userfaultfds (for example, for scalability reasons on using multiple
> > queues) to manage its own mm address space, one uffd in charge of a por=
tion
> > of VMAs, then it can randomly take one userfaultfd to do unregistration=
s.
> > Such might break.
>
> Not sure if relevant, but consider the following:
>
> an app being controlled by another process using userfaultfd.
>
> The app itself can "escape" uffd control of the other process by simply
> creating a userfaultfd and unregistering VMAs.

Yes, this is exactly what I was thinking. Or (less likely) a child process
that inherits a uffd from its parent can then mess with memory the parent
registers with a different uffd after the fork.

> --
> Cheers,
>
> David / dhildenb
>
