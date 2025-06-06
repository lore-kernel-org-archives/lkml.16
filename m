Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B4C6A8D2
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 19:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749237335; cv=none; b=F18O4GO69IvOJ4w38HIJ3VTGeHBME9cSDhmL6gIqM1GwzxnVS766XhKmc/FffiJp6DcvsZhUYycdo15dyGtkZ7KEN1vUhROh6CFQujJ8/XreskZj7ao/JrF8QTnx7YB4U1yCh8pR4PAHZg6n+xNfVP1Q2zqx3vUswmmi4ZqbUlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749237335; c=relaxed/simple;
	bh=GPyJpQ0MM3+sCyiRNE8U4gRHQyAm8DS7ZnG7aizdKZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dx9FghTCRcrXodhQWk3jvPF+ITTX23MGwgWjw3R5XWNdZj/wpHHOjR9D5rFFl4wBG4XXg0fBYmP9S69lknzBi/6TXHnRDw5nfGFWYCDc9c14s/TatmCkAn0s3J97zs3Wi6rMPgqjFqcaT4fJzeo+WeTZRErHTvvo//AolqX/c2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=DkA7DbxK; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="DkA7DbxK"
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 556JFNbe019899
	for <linux-kernel@vger.kernel.org>; Fri, 6 Jun 2025 15:15:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=pps01;
 bh=hxKpvIwDJev2AQJKrOOsefY7R3fXf+i39zjL9smzWlg=;
 b=DkA7DbxKWkuSHI4iA1MT142Cpjb6/8TlBCIIakYVq0CquCP/OsqASktksi65uhVS3R0K
 pYAf0AWDlurGLVY0A7dax6S2OkNvYHys/MxWBNvZt5WywemKs+i2cp9KKyyX57XalUIB
 Z1wbzFseZeI904Snaxa0hDVP8qvYuw1r5I16/pG/SBkvCw0JxaURlW15Vmbafv8xFP9L
 aowr3D/GGER2+HZChR4zQDlQ5/fF8cCKxYAxA7ziPaETHJyOJZx+ckqWd+YNunLjeg6g
 LcvHQ8FAnOnAsP8auXLJCNtclMht8N8djMRGW4Ws17QR+WWlgUqS6xiy0vg9Tkz+yh9T oQ== 
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 473emdhyt4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 15:15:31 -0400
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-710f0e7eb19so23465087b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 12:15:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749237328; x=1749842128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hxKpvIwDJev2AQJKrOOsefY7R3fXf+i39zjL9smzWlg=;
        b=am/437zEV7/52X91d7oZ1FRXZY2PaMqkT3w8oaS0aF9tXf3S92zlchl8NSxGqs/2c7
         NKCO8QFvRBYjEaBCCurHR7s4jZzvY4+8tSfGFY1FhAl75wpXRCJLiyo9BaKOy6lhPcy2
         AB7db+34HUZBEw0c2gxnZmuEb0Bd7LCXtcU6U+OO50KPRA/YBZc7OBcrZqfSIdJg1FFE
         S8AkKjLLp5vwIG8eMijfRttfgvZxRSV8pk/ZKM2h6VgtAZR6ACN5Rqw5ydRh+c2ty46q
         VfarI94mJMirQL+2EDujR99pQUu8BzB0rc7f6FpoyfjO7v1P+cm9/1eKiZr2EqvWJ2Nt
         a6Ug==
X-Forwarded-Encrypted: i=1; AJvYcCUhve4ZsoRlC+AoBsSwyznhrkJiwC6AaLbgAidpIipKx+QgYsoyHMosZt0dbMzxIfRn8ZZTPfw2YvGh/dw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxR7d1ax6R7IgBNH1J7YhyRhoD5d/Ef4sDSm9AMxZEf6bTjQZy8
	kzLmBt1gbRe82iZxNmvtz3TTJs5SMMeQ1MtHgFj+muF0EvEL/ZmPPfttEOmmzvWtatLXOyVL57M
	TQrj65vTZfA8FT2RgwvqAmJDImpP9Q5ENFQi2+eCz5T1BLPjfeLFKOYHkTRGygwtYON7aRYOP2k
	bM1X0JxHCAvS5W1FITXr44xBTSbnayeCpCdfyS
X-Gm-Gg: ASbGnct6pV/ZhHQWTSYh5TscRKHWdYjXgVpE+bVlDYXV+o9nJxLBmzMwvXsMGUEmVha
	tOs8fHYmK4IGmc7tobivMGPnW7zfwHuOF+oNoGxBfgVOQO7eE0auYuCmmdnv2l9TZl3ssCe/sYZ
	CAP9Sy
X-Received: by 2002:a05:690c:360e:b0:70d:f3bb:a731 with SMTP id 00721157ae682-710f76949a7mr61381287b3.9.1749237328278;
        Fri, 06 Jun 2025 12:15:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmh5c+UyPtFHTyhFmv9SKnRfaGxEIhGfyJzFKAkpNJdzUL5OS8y0tgPWOcR4UTikcCpHWRgcH8NmKHKIpVeQg=
X-Received: by 2002:a05:690c:360e:b0:70d:f3bb:a731 with SMTP id
 00721157ae682-710f76949a7mr61380767b3.9.1749237327889; Fri, 06 Jun 2025
 12:15:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603-uffd-fixes-v1-0-9c638c73f047@columbia.edu>
 <20250603-uffd-fixes-v1-2-9c638c73f047@columbia.edu> <84cf5418-42e9-4ec5-bd87-17ba91995c47@redhat.com>
 <aEBhqz1UgpP8d9hG@x1.local> <CAKha_sqFV_0TsM1NgwtYYY0=ouDjkO7OOZc2WsR0X5hK5AUOJA@mail.gmail.com>
 <aELsIq2uOT5d1Tng@x1.local>
In-Reply-To: <aELsIq2uOT5d1Tng@x1.local>
From: Tal Zussman <tz2294@columbia.edu>
Date: Fri, 6 Jun 2025 15:15:17 -0400
X-Gm-Features: AX0GCFv-LebVJckbZYYmiOxBhz5geAlpM1m_LD3eRjbOgJZYzDANJjo8J0v__W4
Message-ID: <CAKha_sqRAW7AmZURC7f7hkja9XRxPkccMB17Gay5p8Qm+cojuQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] userfaultfd: prevent unregistering VMAs through a
 different userfaultfd
To: Peter Xu <peterx@redhat.com>
Cc: David Hildenbrand <david@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
        Andrea Arcangeli <aarcange@redhat.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDE2NiBTYWx0ZWRfX+Nzp/F2fS0g/ S9qs42AX6zkttOl7CawzeWM7Usj2XJRY62dJ7AiuY2oH/+eIGNAFmFYW7c1FrrMxhvaMBLmko4k +BDJ1Tf4Nl3D3vjznW/dluo3QoTyV7I5zAyq4z6LPpLleELFzIZAmue6NdNvlYJwrElbbS21s6d
 /LBhpdkCex5FnD+MtGh3kWd+ICIKeC9DP4CE7XYrcUlq+EzEbClQGG1c3klg2lHqalC/CjGeEpC m684NaadAcWS5hyCmuqWKq/NpZE25GljwCjU203OYIMGOsC6eZ8Oxqu2czD4AQjLPsMFz/pO1my eK6pT7VLWcjuueVmYTwqHZNOvHTJgiyeifyyek8FY8PjYKFu5Joh4xethmArPuVmuSy7ak2bTwf iZux2gN3
X-Proofpoint-ORIG-GUID: CGk941528oAxytYs6s7C9ZLcJ7coJKFj
X-Proofpoint-GUID: CGk941528oAxytYs6s7C9ZLcJ7coJKFj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_07,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 suspectscore=0 bulkscore=10 mlxlogscore=725 lowpriorityscore=10
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506060166

On Fri, Jun 6, 2025 at 9:25=E2=80=AFAM Peter Xu <peterx@redhat.com> wrote:
> On Thu, Jun 05, 2025 at 05:11:53PM -0400, Tal Zussman wrote:
> >
> > As I mentioned in my response to James, it seems like the existing beha=
vior
> > is broken as well, due to the following in in userfaultfd_unregister():
> >
> >     if (!vma_can_userfault(cur, cur->vm_flags, wp_async))
> >             goto out_unlock;
> >
> > where wp_async is derived from ctx, not cur.
> >
> > Pasting here:
> >
> > This also seems to indicate that the current behavior is broken and may=
 reject
> > unregistering some VMAs incorrectly. For example, a file-backed VMA reg=
istered
> > with `wp_async` and UFFD_WP cannot be unregistered through a VMA that d=
oes not
> > have `wp_async` set.
>
> This is true.  Meanwhile it seems untrivial to fix the flag alone with th=
e
> prior per-vma loop to check compatibility.  We could drop the prior check
> but then it slightly breaks the abi in another way..
>
> Then let's go with the change to see our luck.
>
> Could you mention more things when repost in the commit log?  (1) wp_asyn=
c
> bug, (2) explicitly mention that this is a slight ABI change, and (3) not
> needed to backport to stable.

Will do!

> Thanks,
>
> --
> Peter Xu
>
