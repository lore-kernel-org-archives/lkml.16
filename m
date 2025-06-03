Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86051A2643
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 22:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748991135; cv=none; b=hTYczSVuyuf2skQIYKUxQ1KTVnX1HTPs9pR2WFVL7vyHx9EKM6Yrn8X+vJaHz/m7sYVNbLpN1HFwLaHzrrTy3K/gP/obxpHylPA5pguZTM8HA2WEF/ShTpjb0nxRK/pKBdmnHv4O/VwaL9uAFRhpPsaYrigILvViuuFMqnQ/lOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748991135; c=relaxed/simple;
	bh=rBJESAen2/336gzkRJUKRf4MYNXtUStN64nk0QAbCAs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gGsSQQtRL6BvvKVl52Bxa4JQ+1oBO2JWeb1D+QySaknlFqK1GMaaShwQDv1LdZQrMa6TsQ/AwNSDMWT9Sw1iCErCGb+6B+p48dZ9LU8ebHIH23b0OjCq4ahEyi5ezd+hypPsT7YMni/d6BlrRtYClb1ObL5tYhOsoZeQBmF5tTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=qHbA2fdT; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="qHbA2fdT"
Received: from pps.filterd (m0167075.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553MjB6i020861
	for <linux-kernel@vger.kernel.org>; Tue, 3 Jun 2025 18:52:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=pps01;
 bh=FVSotnmnXR4SmQn/DBaX0Q1rjfCHRW+1YsxRp5tC60E=;
 b=qHbA2fdTqJRkHHzntkOvbjSmKGwK5HZAlnEIAuNyeR9jJ/l/r7czeTHSx8mReqcKF2G6
 HUGIhFkx/pI5+pHOVBiwEjszLVhJXkMAMqpgb4b2WFwagJNotYgkSvq1OH3y4GJYbVng
 OCwWLYWVPLujFS70cXRH3QbRmIxTo+G0y6chgb5qhDSkDUHOgjdm0DUuV6D+2reP44ar
 q0fXjdlW3zNceJGWplmOUlS7JDxAWupomwQbHeay78yaO+L77gYNZIz2ficzuvQnRkCY
 WrKHq+PjZ2lN/VkrzMrTlLjAF/sbwWAaX5nYHu+QJsIvGNC9Q6p8ICDkd8SHWdU7lAgT tA== 
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 470ewnmvuh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 18:52:12 -0400
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-70e74da64f0so92060957b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 15:52:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748991132; x=1749595932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FVSotnmnXR4SmQn/DBaX0Q1rjfCHRW+1YsxRp5tC60E=;
        b=LfOIrQqd0w8H3tjtYJFph3hN+/5Ry7MVS0JUqoxXmUlXltxwbdIqLcJDtBM5MkzaRF
         4x1tHXtOsrS5SXJkT92WjXUrk+JKjAOGNzIqkRNiqBUIzJzx4FbvKbHKBCUK692c8w2Z
         G6UTHuY3lwp25yo9quuM+odLscPnaY1JCWQyg1bRlIct9R9Uz21HbrZvrrkppQNgP1Ci
         ZoBSIu1pWiL0xC3RXFM8HMb9wCHwD4bFjv5ecjfutFZpIKZ66mHDrE4XMWw6Z+lgyatL
         bDTG6UchgbG9uwHry5sGwfk5S1k4V987zwQM7k2LINS89Shx9wwihOmqwQqhY2yCmDDS
         HWIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdRrbW1/aLU32Y+/cPoHEHy+VM1NRK9kyF7ZdZjbjqckV3xyO8z69X3pXXp8Mcf2ivt1QlHb3GpW9ROaU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnGh75ohMZ1QvdkZRKcEkXbYbeZ6VQGXLCeFWAhpqt9E8UFFEI
	UXY36wZhz5Trrq8pwCnQEjK1GGWpOPbx6EBgH4+un1hEC0ESQ66nGl7kVUoc8nqUOXgRKgwuMc6
	xU+1uObhes2rsdairJRgp4FBlcJdYB/2tcgtkZAZW1GquNSg/VUqhKZBDSxEDIUwJROO8lrYAnM
	gk1qktP+icxheif1zFa/xvmrX6SXXIqMRuC5pq
X-Gm-Gg: ASbGncvEirLAtlxSFCL3Yzu3Obte1ObBtB5fkSCN2bVEAHndhyNyZxSEf/Bh8puxyas
	ODgfJrSd4f1iSdU0SaXBcE8m8EpD9IukGjjuzUWecZBdYAH/07R7BHwPw3cd0reKapxINz/2EWg
	RlVEU=
X-Received: by 2002:a05:690c:6408:b0:70e:86a:ae1e with SMTP id 00721157ae682-710d9afcef2mr8600777b3.22.1748991131961;
        Tue, 03 Jun 2025 15:52:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQ8exRmH1gDSzLvdylKgTYA2DJ2Au5CkYn+G3oI2WkdeKhka06CmsxC9VBY8GcCo46KqJfEvgUwE5AP+avdh0=
X-Received: by 2002:a05:690c:6408:b0:70e:86a:ae1e with SMTP id
 00721157ae682-710d9afcef2mr8600477b3.22.1748991131612; Tue, 03 Jun 2025
 15:52:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528-tlb-trace-fix-v1-0-2e94c58f450d@columbia.edu> <ce048e11-f79d-44a6-bacc-46e1ebc34b24@redhat.com>
In-Reply-To: <ce048e11-f79d-44a6-bacc-46e1ebc34b24@redhat.com>
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 3 Jun 2025 18:52:01 -0400
X-Gm-Features: AX0GCFvlcvk6GZ5vr9c9WM9ggD6hEwhQPwTxd6NWVo7g3KskF8CKB6yJVu2Zysw
Message-ID: <CAKha_sp8xoB3nYjot0_iZvE3UT1KQgWJ2BynoxUy-=_y1mhqZg@mail.gmail.com>
Subject: Re: [PATCH 0/2] x86, mm: minor tlb_flush tracepoint adjustments
To: David Hildenbrand <david@redhat.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Ingo Molnar <mingo@kernel.org>, Rik van Riel <riel@surriel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        x86@kernel.org, Will Deacon <will@kernel.org>,
        "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
        Nick Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>,
        linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: opyuf8wvu6UN6_j-J2BCQ6tjgV4OXiN1
X-Proofpoint-ORIG-GUID: opyuf8wvu6UN6_j-J2BCQ6tjgV4OXiN1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDE5NyBTYWx0ZWRfX2JKYSSFPiE9l XsndAW5cjg1NBMGhnC2qRaOnZ/+VHDC7Gt6gVlne72CXHtYtUuHEvSPetjCZj7vZ7oYeGMSPaJc Fu5bT+DImxEJxa8M04kArBcGlhtuCD+XY+Em0s3dXoQAex3dl1TjicEakKtKKYgRsNAEYHX61d9
 hqC+SjLhFLQQ1cK47XYlc1csSGQUKiJGnIyTbRQEuG9ncNAXDq8DDQVYZKjFjx4PE9qVS301EYN Nm2FVA0iwu17MENkxl83/s4HiOTi+JA9uYxxLUX1X5eznoV+H9iStOs1t8wiPsAVOSnqi33xH5o TD/g0WfcOqhd2QEizsxV4LQBvvJkRtztMRm1eCQ4BbOqZi6LD2wQ0o3USamX4kwVx60s4Wjrwo9 CQ/kAymW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=10
 mlxlogscore=790 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501
 bulkscore=10 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506030197

Sent a patch here:
https://lore.kernel.org/linux-mm/20250603-tlb-maintainers-v1-1-726d193c6693=
@columbia.edu/

Thanks!

On Wed, May 28, 2025 at 5:09=E2=80=AFAM David Hildenbrand <david@redhat.com=
> wrote:
>
> On 28.=E2=80=8A05.=E2=80=8A25 07:=E2=80=8A35, Tal Zussman wrote: > One mi=
nor fix and one minor cleanup related to the tlb_flush tracepoint. > > As a=
n aside, include/trace/events/tlb.=E2=80=8Ah isn't covered by MAINTAINERS, =
> along with other mm related files under
> ZjQcmQRYFpfptBannerStart
> This Message Is From an External Sender
> This message came from outside your organization.
>
> ZjQcmQRYFpfptBannerEnd
>
> On 28.05.25 07:35, Tal Zussman wrote:
> > One minor fix and one minor cleanup related to the tlb_flush tracepoint=
.
> >
> > As an aside, include/trace/events/tlb.h isn't covered by MAINTAINERS,
> > along with other mm related files under include/trace/events/. Flagging
> > this since I see there's a recent effort to overhaul the mm MAINTAINERS
> > entries.
>
> Thanks for pointing that out.
>
> It should likely go under "MMU GATHER AND TLB INVALIDATION"
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0ecc6063b2b5e..0e88ea5de5b73 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16509,6 +16509,7 @@ L:      linux-mm@kvack.org
>   S:     Maintained
>   F:     arch/*/include/asm/tlb.h
>   F:     include/asm-generic/tlb.h
> +F:     include/trace/events/tlb.h
>   F:     mm/mmu_gather.c
>
>   MN88472 MEDIA DRIVER
>
>
> --
> Cheers,
>
> David / dhildenb
>
