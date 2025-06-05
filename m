Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA70A20330
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 21:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749157934; cv=none; b=UCyhWZDAGPQU7lg6LWDOjk8xpaEVm8g/jHpWuZ8PyoSG6/aaOL0fWD+JX1zklnRFIAliEXQwKbwihkMYS69flrtgi4HgNPxtSsW4hlcgz9Y3xFRPlIu39WaN/gmN5LntGWmEIboaicYtv1JAY6dR+7HQLTiiDe6JnkQ8VONIHkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749157934; c=relaxed/simple;
	bh=gTZMr9FFvh7ZnKKmJNpD5keOOw5IKZJT22AQLOzvWk4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YOeIQOU7ZobFzG4L9cFjUPouoKZbkuq24eMBKriqpt1pGPnuta1tl529Yn09qRBcS/1WpWmOeixgxfdsfk54T9sZecnzH2b1lZRxVixynXS/iAc74g6TV403E5dbgFG4VqhTJrmA9ICmo4KQMCgmiO+D8OlDAnCQQ2evrkXyFV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=u7Zb2tJH; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="u7Zb2tJH"
Received: from pps.filterd (m0167074.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555L4f4G020724
	for <linux-kernel@vger.kernel.org>; Thu, 5 Jun 2025 17:12:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=pps01;
 bh=Kush5qwyq9/DqRN+b1m8jN+XUrL2KXoC8QLXMDNE4wU=;
 b=u7Zb2tJHdwTWrw7lpbKds/xt7Ei0B3C3pjxluA4tCdj2klqhfEqXfphJPtOmNpniGDSm
 yTWk8eExyo6xnS7CVppsVtSoWfZvuWKcDFVGWHxaG94vdKKXG4NeIMUMLWmx9R0xKsmW
 /3qeeHtzVauQFcuwVw/viETMVeKcs2pRm7StYauVtOXjbd4bCp4yP4d1CZw3gjDqjZal
 GUTHKxZEWITolJ5ss57kuU+RLHCNgR4NIVnZFCRLVwsITLD4wnlGbThmoiL32j2ZWt5X
 YlriJmFTuowwMIqvq2/j8iAJ5GA6SRXCGMCMqzjR3rBP5oT1dvxTSlEakXZtlJZmBgn0 gA== 
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 472ycqr878-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 17:12:05 -0400
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-710ee127c79so14094307b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 14:12:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749157925; x=1749762725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kush5qwyq9/DqRN+b1m8jN+XUrL2KXoC8QLXMDNE4wU=;
        b=FMrWpNjQQLSpx0f61IoysupeQ4yTKzqj93IBiN0lrSwCKg0FHHsRdu0iH2ZJT7P86p
         cVNFQfTeZKEphvg+egu4922q0iNMMt1fa5yEFerRb9DodKnjvHJmMNWP4PeJl1HXNl3s
         Za/44ERlqf7L8HXt29977M/X1cq3QYojgC9SFKJsBZqhWdEJ9xEpALlNfJaVm3BVOgwg
         giC7u4dmch5KgtHiILSL3v6TVunCBJAqZKN3OTseIRwmrSPBN5sFTjJHouo1/xRYKUym
         sOnPaFLD8nII9C1QZIvPpdmb2rX247ychM6c6qHthWlx9fN6kOrpMB0P831JDV7TiE6g
         L6DA==
X-Forwarded-Encrypted: i=1; AJvYcCVipW7IiA8yuLdiVwOrCPQOnEwCzLDPhcZqqU+Yq1m0gCyJzeFHlfD5TT8mxcHuwcLKLTKoMY1dOPhgwlQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjGMN2zZH+7SzlejtLB56JQcV1PHBNTsUDrHcoS4K6a+Nu80W/
	SKMui7iVVn/wxG0sYnw0Iw5Arfwjq+sUwDzuUywMOCoj8whWm+FsjbAMBkskUNRy6QmynpIhKHY
	EFn8SEllqHAU1Bjk7GVsjc5ZBCJhhzJpufFeGPHNV/IcNH0WuwlazTPtmNWUNLUhHSmJEMc0EP7
	0cBfKcU/VcPEt/0kOWJaBkZX2YYcd7MtW0rCXC
X-Gm-Gg: ASbGncvFTMK2aKvebbohQ6clGopF5m97eYgFWxE+psevxde+HKl696N5ZQwFrT4UxQC
	WUeMVTsl+cswaxEUvU+VKG1m56DL8JWKs4F8Wg0uTf86a26RfMj8huGcueDsDngnHeWmqMw==
X-Received: by 2002:a05:6902:1889:b0:e7f:6edc:9a3f with SMTP id 3f1490d57ef6-e81a2546617mr1663379276.38.1749157924966;
        Thu, 05 Jun 2025 14:12:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHG8hbIKU02qfpnzheLHwAIRLhIadezcTaFiXw/C6Jl6lhZS+eyurv6XraXAjePAIr+pl3aGIG62PRNxJdNgig=
X-Received: by 2002:a05:6902:1889:b0:e7f:6edc:9a3f with SMTP id
 3f1490d57ef6-e81a2546617mr1663348276.38.1749157924576; Thu, 05 Jun 2025
 14:12:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603-uffd-fixes-v1-0-9c638c73f047@columbia.edu>
 <20250603-uffd-fixes-v1-2-9c638c73f047@columbia.edu> <84cf5418-42e9-4ec5-bd87-17ba91995c47@redhat.com>
 <aEBhqz1UgpP8d9hG@x1.local>
In-Reply-To: <aEBhqz1UgpP8d9hG@x1.local>
From: Tal Zussman <tz2294@columbia.edu>
Date: Thu, 5 Jun 2025 17:11:53 -0400
X-Gm-Features: AX0GCFtlF25ewvTNublXIrjrXRtQHMeIQW9tEnZzcZQU9P8wEJHvMPcfMh1lDXs
Message-ID: <CAKha_sqFV_0TsM1NgwtYYY0=ouDjkO7OOZc2WsR0X5hK5AUOJA@mail.gmail.com>
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
X-Proofpoint-ORIG-GUID: DF3_NwIFx8CtIsWL1Q0_Dbxdiqj4iNvQ
X-Proofpoint-GUID: DF3_NwIFx8CtIsWL1Q0_Dbxdiqj4iNvQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE5MSBTYWx0ZWRfX676yWF14/3pK VGReDdk+9SwFgDZRzqOUEV0LmPKwlAtMF9Po8TL8o7/leEXpdl0ra5uHljqWVws6HXispcc9Hqo 0cDXYXV7MpeW3Ilrg/aq4/la3xvdq1TuEzdXSTSYNjSjjF4A6opDPYmpdGPHFuVt49rGeS/RdQt
 4j+OXvbNCtSFzAaZS+t+gkvcJAveXNSlmmgnkT5RqxJQru2wqMXZk2fIIud18Wwc075KgJgw9eR c6ciOKfd2VjmLFRKkkO/ZGIZrvrtynW9qKW4SyEh+9QNH3LRsFbEJLSWbiTmJRojXEWDcKnz7bu GfTS9qpt0Tk7LtqPBRDTcFX63/JTXuGO0CpukW03PxOBhSAeMXJAIXpSPKYQsj0+UW6g4GRtuiC evsh+VO5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_06,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 mlxscore=0 impostorscore=0 mlxlogscore=999 bulkscore=10 spamscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 lowpriorityscore=10
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506050191

On Wed, Jun 4, 2025 at 11:10=E2=80=AFAM Peter Xu <peterx@redhat.com> wrote:
>
> On Wed, Jun 04, 2025 at 03:23:38PM +0200, David Hildenbrand wrote:
> > On 04.06.25 00:14, Tal Zussman wrote:
> > > Currently, a VMA registered with a uffd can be unregistered through a
> > > different uffd asssociated with the same mm_struct.
> > >
> > > Change this behavior to be stricter by requiring VMAs to be unregiste=
red
> > > through the same uffd they were registered with.
> > >
> > > While at it, correct the comment for the no userfaultfd case. This se=
ems
> > > to be a copy-paste artifact from the analagous userfaultfd_register()
> > > check.
> >
> > I consider it a BUG that should be fixed. Hoping Peter can share his
> > opinion.
>
> Agree it smells like unintentional, it's just that the man page indeed
> didn't mention what would happen if the userfaultfd isn't the one got
> registered but only requesting them to be "compatible".
>
> DESCRIPTION
>        Unregister a memory address range from userfaultfd.  The pages in
>        the range must be =E2=80=9Ccompatible=E2=80=9D (see UFFDIO_REGISTE=
R(2const)).
>
> So it sounds still possible if we have existing userapp creating multiple
> userfaultfds (for example, for scalability reasons on using multiple
> queues) to manage its own mm address space, one uffd in charge of a porti=
on
> of VMAs, then it can randomly take one userfaultfd to do unregistrations.
> Such might break.

As I mentioned in my response to James, it seems like the existing behavior
is broken as well, due to the following in in userfaultfd_unregister():

    if (!vma_can_userfault(cur, cur->vm_flags, wp_async))
            goto out_unlock;

where wp_async is derived from ctx, not cur.

Pasting here:

This also seems to indicate that the current behavior is broken and may rej=
ect
unregistering some VMAs incorrectly. For example, a file-backed VMA registe=
red
with `wp_async` and UFFD_WP cannot be unregistered through a VMA that does =
not
have `wp_async` set.

> >
> > >
> > > Fixes: 86039bd3b4e6 ("userfaultfd: add new syscall to provide memory =
externalization")
> > > Signed-off-by: Tal Zussman <tz2294@columbia.edu>
> > > ---
> > >   fs/userfaultfd.c | 15 +++++++++++++--
> > >   1 file changed, 13 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/fs/userfaultfd.c b/fs/userfaultfd.c
> > > index 22f4bf956ba1..9289e30b24c4 100644
> > > --- a/fs/userfaultfd.c
> > > +++ b/fs/userfaultfd.c
> > > @@ -1477,6 +1477,16 @@ static int userfaultfd_unregister(struct userf=
aultfd_ctx *ctx,
> > >   if (!vma_can_userfault(cur, cur->vm_flags, wp_async))
> > >   goto out_unlock;
> > > + /*
> > > + * Check that this vma isn't already owned by a different
> > > + * userfaultfd. This provides for more strict behavior by
> > > + * preventing a VMA registered with a userfaultfd from being
> > > + * unregistered through a different userfaultfd.
> > > + */
> > > + if (cur->vm_userfaultfd_ctx.ctx &&
> > > +    cur->vm_userfaultfd_ctx.ctx !=3D ctx)
> > > + goto out_unlock;
> >
> > So we allow !cur->vm_userfaultfd_ctx.ctx to allow unregistering when th=
ere
> > was nothing registered.
> >
> > A bit weird to set "found =3D true" in that case. Maybe it's fine, just
> > raising it ...
>
> This part should be ok, as found is defined as:
>
> /*
> * Search for not compatible vmas.
> */
> found =3D false;
>
> So it's still compatible VMA even if not registered.
>
> It's just that I'm not yet sure how this change benefits the kernel
> (besides the API can look slightly cleaner).  There seems to still have a
> low risk of breaking userapps.  It could be a matter of whether there can
> be any real security concerns.
>
> If not, maybe we don't need to risk such a change for almost nothing (I
> almost never think "API cleaness" a goal when it's put together with
> compatilibities).
>
> Thanks,
>
> --
> Peter Xu
>
