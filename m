Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072A7283FE6
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 20:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750193440; cv=none; b=nkCUgKJajrptoWY6b8+CkWLaxzDWAh6HTFlylQTvBGVxfx4fDZtJoghmyJBZX2JVtlTMjAd47KYgm1Y8N1NlfG+39Qxo1jWw1cNJB28HcEaIaiW1PA5Pp20mJywKJXWDxGo6+W/jsp2mAMz/BBq0ztxAKmQQFlXm+CwINMuoLkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750193440; c=relaxed/simple;
	bh=4bcCwaN5jKAqSH6DvVVNHKdZM3oQfNLDpnd/khiCLHY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jcicR38lk0trjH5kIoYy92lNW7r/hRLTDyW2UhMD8t3vosnud6V7b+KLqBFiijIbbH5D8ZSUQEgYWbIwemoFMZS53o1MTOfIm+U2kZrpxnqAGkKsk9LlJmjLnHR4CuJavT6OeAnQ5x5UIb2EV5xjIgbcEjm6kPG0wSbxbvpd/rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=r2Drjo8u; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="r2Drjo8u"
Received: from pps.filterd (m0167074.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55HKFdg7027109
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 16:50:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=pps01;
 bh=kHRW9Nu+63/GeEfAZ+I+V+utb3fXU8IH15wFHQNM6f0=;
 b=r2Drjo8uUKd73xclv/tSGiKeaCM7vYKjKI+7iApuS8jqigfIFZCpuinH4uB3tdRDHC57
 GjjLWhbucWERq+YBbNnimo9857Um/sB/5XhvIaFznS8ZrvzqJIozCTt6rz3oGlG6f/TV
 cJBiEMZB2+OkPrf8SQPuCVSIy4QbFD9W/9BM40mMbRvqpB74vbwIbTX59LkvlQ0qlNaW
 K+auqpCP9ZLLa0eE4Amfxn2SI6gROwf16PYnPGO/YEYp6MM4y85qZVoh6saIjPKnNFTp
 wKf0PlnR0LBLq0EsKMhNsFAcPXHlBPa+qFgQJUdwbeCPwI8YFGK+zBh9cN3Mt8UTvE1A yQ== 
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 47924h3e0h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 16:50:34 -0400
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-70e73d3c474so90735507b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 13:50:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750193434; x=1750798234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kHRW9Nu+63/GeEfAZ+I+V+utb3fXU8IH15wFHQNM6f0=;
        b=IkzYgTUCdpAtF1Ulw0ZkqWaNqxx1umXaQRUFL+weHewActEiH6SslGMHNb7gNMaPNq
         y6U56CuWyzhITyBJZPD598Yt/ho03MCYYTS/nMWewEEL5BslGxfOQrZB/Djwpd026Ybj
         3X9DTaAvY5l4XKtjwyc/xUSr2y+aNEbxXe6p4l/yFfvW4b21G2ULpm/XkkxSOo7/po0V
         vAwoAjMsq65dkhvdaUhHrKmLjOPFTJdTPjbQmHwgVqvFJwqm+CzYEz+eS6UMPg+eFX6o
         nWd1m8+rHSyepIRh1b8NWVdnZ2cgHc4rLgwTR0tBpTMCu3lDWr351m7xTN0oBZ46LrXt
         mPRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhAtuZN8VV49BUxsBfRAa7M7NaY0GIW4Qs7fhxc31qHXKk/SLv/NwpM4Pb4mX7/OYMEldqfZIFWRyBv/w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJE7/i3xTcr8mv1QbY/WBbpyO2U1+b0wm2GCAwBkP6KOau+mLr
	Jh5yA4aJO27wIiOLFEDYlNV4l+q+BgCgcotfyxVBkTP0wF+l5+35wXOCSFibHtEFF5HjiJv4hw1
	sewQnDG5kJ19p4sA0W0Ak84GVfcU6YJrAt5jjPBx3/hrY6lh01eWkC9q8SNL9vNpE9Kn62m2dH7
	l/+RO4sMsG/KEM3arHeK1idDp1Yf75LvDwC3eR
X-Gm-Gg: ASbGncsrqzd6kOUtNZJnOpa6Q6VB4AWvYiqX6056xJULtaZ6XXO2lmlhj3di/o/OlTH
	zYBJ99ermFuN4EWNVg+sq8AaU5E054a62ZFBtZSHQhvTVSuvLEGRNhrBcbCxTBAWLKiGaq6x98V
	EJPsoZ
X-Received: by 2002:a05:690c:7085:b0:711:33d3:92ed with SMTP id 00721157ae682-7117547e398mr196388497b3.38.1750193433823;
        Tue, 17 Jun 2025 13:50:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFkuwT+fLR4WKKPymtx1/7iwNyL7yTTLzuBi63mVvFMY8cCKDK7Li4VnZQgIqQeFSw0PwBNF7+bj2If0h+Nvk=
X-Received: by 2002:a05:690c:7085:b0:711:33d3:92ed with SMTP id
 00721157ae682-7117547e398mr196387977b3.38.1750193433443; Tue, 17 Jun 2025
 13:50:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250607-uffd-fixes-v2-0-339dafe9a2fe@columbia.edu>
 <20250607-uffd-fixes-v2-3-339dafe9a2fe@columbia.edu> <cb6f4acf-1eca-4d61-aa70-5edaf89d9763@redhat.com>
In-Reply-To: <cb6f4acf-1eca-4d61-aa70-5edaf89d9763@redhat.com>
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 17 Jun 2025 16:50:22 -0400
X-Gm-Features: AX0GCFuppgQNaMC-wQr2Mt5OwUGedRzgBMvE-W4xD5WFZ25ag1VCaucfpSNRTtk
Message-ID: <CAKha_soChL=TmSAK_yBQYnyjdNRpjp121N5F8XRA=4O9Q+_wvw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] userfaultfd: prevent unregistering VMAs through a
 different userfaultfd
To: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Peter Xu <peterx@redhat.com>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
        Andrea Arcangeli <aarcange@redhat.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: YF-zA8-ZJROkODX0SMDbbKun6RHw6yzH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDE2NiBTYWx0ZWRfX4rVvaoa6x4qW TkcMxAcqKRw7Iz+7wL3Wy8grZqJ70mCIJZJ8aml9uDYOBakTiWXfTkHyGOUsXzqsm00LS27Ius5 Fr+OQkqw5iqIDjmc/VkskcPqs5TGnE6w+bDd858uVD1GFVO4QsZE7BW6ysJvAMjDVCnxPw7w+0v
 A1witoi0S5t/O+Jw+Tq1iLjvs9iVEUv9LXr8s/ifSOIZuF4LZIpserURItIZqYPmD9Mi7BctDl9 1k5HOPFj2BN0xsiiw3Hct4ZDLDtABQN8Tp2GzDeQskijo7C9AIMedqvB+2yRUAHqTYircazYJqa 61qojYQ+F6l6UjSF1jONAQEj1kj2EtUFd2PjaXh4msZZjluKCJ7d6U2CHydE64EpAP87gQQPyuT okstoQuW
X-Proofpoint-GUID: YF-zA8-ZJROkODX0SMDbbKun6RHw6yzH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_09,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=10 bulkscore=10 clxscore=1015 adultscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506170166

On Tue, Jun 10, 2025 at 3:31=E2=80=AFAM David Hildenbrand <david@redhat.com=
> wrote:
>
> On 07.06.25 08:40, Tal Zussman wrote:
> > Currently, a VMA registered with a uffd can be unregistered through a
> > different uffd associated with the same mm_struct.
> >
> > The existing behavior is slightly broken and may incorrectly reject
> > unregistering some VMAs due to the following check:
> >
> > if (!vma_can_userfault(cur, cur->vm_flags, wp_async))
> > goto out_unlock;
> >
> > where wp_async is derived from ctx, not from cur. For example, a file-b=
acked
> > VMA registered with wp_async enabled and UFFD_WP mode cannot be unregis=
tered
> > through a uffd that does not have wp_async enabled.
> >
> > Rather than fix this and maintain this odd behavior, make unregistratio=
n
> > stricter by requiring VMAs to be unregistered through the same uffd the=
y
> > were registered with. Additionally, reorder the WARN() checks to avoid
> > the aforementioned wp_async issue in the WARN()s.
> >
> > This change slightly modifies the ABI. It should not be backported to
> > -stable.
>
> Probably add that the expectation is that nobody really depends on this
> behavior, and that no such cases are known.
>
> >
> > While at it, correct the comment for the no userfaultfd case. This seem=
s to
> > be a copy-paste artifact from the analogous userfaultfd_register() chec=
k.
> >
> > Fixes: 86039bd3b4e6 ("userfaultfd: add new syscall to provide memory ex=
ternalization")
>
> Fixes should come before anything else in a series (Andrew even prefers
> a separate series for fixes vs. follow-up cleanups).
>
> > Signed-off-by: Tal Zussman <tz2294@columbia.edu>
> > ---
> >   fs/userfaultfd.c | 17 +++++++++++++----
> >   1 file changed, 13 insertions(+), 4 deletions(-)
> >
> > diff --git a/fs/userfaultfd.c b/fs/userfaultfd.c
> > index 80c95c712266..10e8037f5216 100644
> > --- a/fs/userfaultfd.c
> > +++ b/fs/userfaultfd.c
> > @@ -1466,6 +1466,16 @@ static int userfaultfd_unregister(struct userfau=
ltfd_ctx *ctx,
> >   VM_WARN_ON_ONCE(!!cur->vm_userfaultfd_ctx.ctx ^
> >   !!(cur->vm_flags & __VM_UFFD_FLAGS));
> >
> > + /*
> > + * Check that this VMA isn't already owned by a different
> > + * userfaultfd. This provides for more strict behavior by
> > + * preventing a VMA registered with a userfaultfd from being
> > + * unregistered through a different userfaultfd.
> > + */
>
> Probably we can shorted to:
>
> /*
>   * Prevent unregistering through another userfaultfd than used for
>   * registering.
>   */
>
> ?
>
> > + if (cur->vm_userfaultfd_ctx.ctx &&
> > +    cur->vm_userfaultfd_ctx.ctx !=3D ctx)
> > + goto out_unlock;
> > +
> >   /*
> >   * Check not compatible vmas, not strictly required
> >   * here as not compatible vmas cannot have an
> > @@ -1489,15 +1499,14 @@ static int userfaultfd_unregister(struct userfa=
ultfd_ctx *ctx,
> >   for_each_vma_range(vmi, vma, end) {
> >   cond_resched();
> >
> > - VM_WARN_ON_ONCE(!vma_can_userfault(vma, vma->vm_flags, wp_async));
> > -
> >   /*
> > - * Nothing to do: this vma is already registered into this
> > - * userfaultfd and with the right tracking mode too.
> > + * Nothing to do: this vma is not registered with userfaultfd.
> >   */
>
> Maybe
>
> /* VMA not registered with userfaultfd. */
>
> The "skip" below is rather clear. :)
>
> >   if (!vma->vm_userfaultfd_ctx.ctx)
> >   goto skip;
> >
> > + VM_WARN_ON_ONCE(vma->vm_userfaultfd_ctx.ctx !=3D ctx);
> > + VM_WARN_ON_ONCE(!vma_can_userfault(vma, vma->vm_flags, wp_async));
> >   WARN_ON(!(vma->vm_flags & VM_MAYWRITE));
> >
> >   if (vma->vm_start > start)
> >
>
> Acked-by: David Hildenbrand <david@redhat.com>

Thanks! Will update with the suggested comment + commit message changes and=
 move
this patch before the VM_WARN changes.

> --
> Cheers,
>
> David / dhildenb
>
