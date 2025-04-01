Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D243594F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 19:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743536932; cv=none; b=EdpLHFEW23cbQjoXJRMMhpCcADOvWp2ZtL2/RO+uCs9EHW0+II/6R12oeejOLUc5kF1z2XzuMx+cZNciseBe6zubxBcpck79pXDLTFgmD3Gbc8nfKxQBy5BmsJYwD2zVw47nch735LBEHV+SAUy4lLzFZLlbqwSbwh0rfMdOZhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743536932; c=relaxed/simple;
	bh=Ks7rJoeTgS2wol64YE9PvJ0vXal3OKI475KhOF8CNhk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DC+12iZkK4Ks1I0tsKQYIyeSADjqLhB6WiwHmMPRS6ATwE8UdC3hQZ9p6FaxSfZe9+5ibbKeemGAp3uuBse2UXLnV5FBnplWgK7t1ENFWyG0eN0fizDtOXkSgPaFre0CCwKvFNpQZWbgD0o/y9bh7LIpOTUW+OfHAFtLiRbvH2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eE99oGPA; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eE99oGPA"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2a01bcd0143so6382223fac.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 12:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743536929; x=1744141729; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rfO4E7eZUTHP3B8FesMK6uqI1PbbPXOrM+fmdJIE8vw=;
        b=eE99oGPAdheCCZvmRC2Z0n7O6tjAwcKRagbIo6iEUe4RJWb6XudNp664H1I/Ae881g
         fGIK8sqmjw6V2LNW1ScEEVq+H5OgPcwUEPHlnBYCjOqL48y7dwwyHXKYO/UyRPFEW5YD
         wtXjUQpJnII0VppRGBWD3GQZ1kb3bDEXsr2GzEiVUHPrM8Ub3Hx6RSGm43a57HtE3bP5
         LqNDyJH1TdAOZvYCl/GvV7C6M/QGjz9Dxkx8DUpF0HNKv9x30K3ufBgnnxuyJvcrrCns
         uW3KXWD/wZRzD1YJJ8jH9cw0PIVbZvRkQ9ackBE3gIYs+RL2BPk5OWQD2j+eBFW3OMDd
         K1Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743536929; x=1744141729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rfO4E7eZUTHP3B8FesMK6uqI1PbbPXOrM+fmdJIE8vw=;
        b=SvF4Ac1dAAKkE1kFKx1cd339ph6FMThC6QTV6GlXaguCPmaj5+mb5/rEjHdhJYRKij
         dD7IxORNVzAOOwPjSCEmI2u1qC96GR+vlQ2Lai9KdLTvIvW/2EN5ug+0QiwzlHamlrbi
         V/bUs0sN8R9Xh1vYUUQkIf57qnYO0ybih1lKcyiIacXWnHyOXFG0e0yjzFAweGEcp2PV
         IwNlkU6dvbVQjAA0ppvfIh8spw8jouJvkufETXtSav+ST+iveJUF5pca+0Oqijw4DNzx
         OETmDnLer37RVIJmpUBSUWZD4sDNbakfjqxXXwaSRAQxgk9pUFaTSoTkaxJ5zeBbnLUB
         vmDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgDcmM4Cje4EBWGR91S2Pm3H3XU7oKN5ryUB+KCcQLi79LfsUm7IpKGJ+NNMZwHcFIurfUR+ofKulHxN4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXzmv7UiegpEBgVhsY6v4TZLNqZd4XMLMAh2OoWTKElk5z2EXC
	9t2wvxM1b16QFMj6wo/bMo4xn6nLV2xDkNUWo9cvQtzz1XME//e8/LPAlX88U5SvLjiUVCDsVT2
	Jw1ElFMlrFkp0vd7TE+61UOJo++CGi6w+
X-Gm-Gg: ASbGncujol1wjITCXuu1Bej8/gKVkhvzOHhmH3yZjV04WW3R7eC5HOjNvr6zkQahG4T
	PftXdFP9Y2alF1+xMFI3VHR3GraxMsze7Fhz1Spnj37v4kTJ/ZTA32WUXfBxKSlB1m2tPbCffn/
	U2Og31nGNWICMq9uH087tbqWp20cMsEv+wYJJtxcHxhe4=
X-Google-Smtp-Source: AGHT+IEf13rYhRCu3emKUwYVhjhmU1fBl5KBmeELVWjG3BHNr5KvjzEubqZoe9/JVoQmNZ9QMet0TQpzbYHjduAB++s=
X-Received: by 2002:a05:6871:5ce:b0:29e:630d:bab8 with SMTP id
 586e51a60fabf-2cbcf51fda8mr8393286fac.17.1743536929154; Tue, 01 Apr 2025
 12:48:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250302191558.47180-1-suchitkarunakaran@gmail.com>
 <e495bf9c-9fba-44ce-99fe-04879f8dd0c2@oracle.com> <CAO9wTFgMCsS9L1PwpkDr48t9R4hO2UvFRwbPu2mMQMP0aqD+cQ@mail.gmail.com>
 <1f54efc6-045b-475f-a1f1-918377af8960@oracle.com>
In-Reply-To: <1f54efc6-045b-475f-a1f1-918377af8960@oracle.com>
From: Suchit K <suchitkarunakaran@gmail.com>
Date: Wed, 2 Apr 2025 01:18:37 +0530
X-Gm-Features: AQ5f1Jp7IpjINNQ5Ws1KkdC-9qtltyiYNwUMfDDc9mx-DE3X5o_SEUL7X0Ehjig
Message-ID: <CAO9wTFiOXfjbM8UEKMQzK06JMcSiP_VJUxBx7BD2257jMvdc4w@mail.gmail.com>
Subject: Re: [PATCH] jfs: jfs_xtree: replace XT_GETPAGE macro with
 xt_getpage() function
To: Dave Kleikamp <dave.kleikamp@oracle.com>
Cc: jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Alright. I'll do as you suggest. Thanks


On Wed, 2 Apr 2025 at 00:40, Dave Kleikamp <dave.kleikamp@oracle.com> wrote=
:
>
> On 3/12/25 1:28PM, Suchit K wrote:
> > Hi Dave,
> > Thanks for the comments. I=E2=80=99m still a beginner so I wanted to sh=
are my
> > thoughts and check with you. Almost all references to the xt_getpage
> > function directly return the rc value obtained from it. I feel that
> > changing its return type to (xtpage_t *) might not be ideal, as it
> > would require modifying the code in multiple places. That said, if you
> > think changing the return value is the better approach, I=E2=80=99ll tr=
y to
> > change it. Also, I=E2=80=99ll update struct inode** ip to struct inode*=
 ip.
> > Thanks once again.
>
> Sorry for taking so long to respond.
>
> I really think that as long as we are replacing an ugly macro with a
> function, we should make the function actually return what we are
> interested in. A case could be made for either the metapage or the
> xtpage_t, but I would choose the xtpage_t. Of course, it should return
> an ERR_PTR if it fails. I know it's a little more work changing the
> callers to handle that, but the result would be a bit cleaner.
>
> Thanks,
> Shaggy
>
> >
> > On Tue, 11 Mar 2025 at 22:19, Dave Kleikamp <dave.kleikamp@oracle.com> =
wrote:
> >>
> >> On 3/2/25 1:15PM, Suchit Karunakaran wrote:
> >>> Replace legacy XT_GETPAGE macro with an inline function and update al=
l
> >>> instances of XT_GETPAGE in jfs_xtree.c file to use the new function.
> >>
> >> I like the idea, but as long as we are changing this to a function, I'=
d
> >> like to simplify it to return the xtpage (xtpage_t *). A NULL return
> >> would indicate a failure.
> >>
> >> Also, the first argument should just be "struct inode *ip". That shoul=
d
> >> eliminate your second patch.
> >>    >
> >>> Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
> >>> ---
> >>>    fs/jfs/jfs_xtree.c | 86 ++++++++++++++++++++++++++++--------------=
----
> >>>    1 file changed, 52 insertions(+), 34 deletions(-)
> >>>
> >>> diff --git a/fs/jfs/jfs_xtree.c b/fs/jfs/jfs_xtree.c
> >>> index 5ee618d17e77..fb736a06ea58 100644
> >>> --- a/fs/jfs/jfs_xtree.c
> >>> +++ b/fs/jfs/jfs_xtree.c
> >>> @@ -49,26 +49,6 @@
> >>>
> >>>    #define XT_PAGE(IP, MP) BT_PAGE(IP, MP, xtpage_t, i_xtroot)
> >>>
> >>> -/* get page buffer for specified block address */
> >>> -/* ToDo: Replace this ugly macro with a function */
> >>> -#define XT_GETPAGE(IP, BN, MP, SIZE, P, RC)                         =
 \
> >>> -do {                                                                =
 \
> >>> -     BT_GETPAGE(IP, BN, MP, xtpage_t, SIZE, P, RC, i_xtroot);       =
 \
> >>> -     if (!(RC)) {                                                   =
 \
> >>> -             if ((le16_to_cpu((P)->header.nextindex) < XTENTRYSTART)=
 || \
> >>> -                 (le16_to_cpu((P)->header.nextindex) >              =
 \
> >>> -                  le16_to_cpu((P)->header.maxentry)) ||             =
 \
> >>> -                 (le16_to_cpu((P)->header.maxentry) >               =
 \
> >>> -                  (((BN) =3D=3D 0) ? XTROOTMAXSLOT : PSIZE >> L2XTSL=
OTSIZE))) { \
> >>> -                     jfs_error((IP)->i_sb,                          =
 \
> >>> -                               "XT_GETPAGE: xtree page corrupt\n"); =
 \
> >>> -                     BT_PUTPAGE(MP);                                =
 \
> >>> -                     MP =3D NULL;                                   =
   \
> >>> -                     RC =3D -EIO;                                   =
   \
> >>> -             }                                                      =
 \
> >>> -     }                                                              =
 \
> >>> -} while (0)
> >>> -
> >>>    /* for consistency */
> >>>    #define XT_PUTPAGE(MP) BT_PUTPAGE(MP)
> >>>
> >>> @@ -114,6 +94,44 @@ static int xtSplitPage(tid_t tid, struct inode *i=
p, struct xtsplit * split,
> >>>    static int xtSplitRoot(tid_t tid, struct inode *ip,
> >>>                       struct xtsplit * split, struct metapage ** rmpp=
);
> >>>
> >>> +/*
> >>> + *   xt_getpage()
> >>> + *
> >>> + * function: get the page buffer for a specified block address.
> >>> + *
> >>> + * parameters:
> >>> + *   ip      - pointer to the inode
> >>> + *   bn      - block number (s64) of the xtree page to be retrieved;
> >>> + *   mp      - pointer to a metapage pointer where the page buffer i=
s returned;
> >>> + *   size    - size parameter to pass to BT_GETPAGE;
> >>> + *   p       - pointer to an xtpage_t pointer mapping the page's dat=
a.
> >>> + *
> >>> + * returns:
> >>> + *   0 on success, or -EIO if the page is corrupt or an error occurs=
.
> >>> + */
> >>> +
> >>> +static inline int xt_getpage(struct inode **ip, s64 bn, struct metap=
age **mp,
> >>> +                     unsigned int size, xtpage_t **p)
> >>> +{
> >>> +     int rc;
> >>> +
> >>> +     BT_GETPAGE(ip, bn, *mp, xtpage_t, size, *p, rc, i_xtroot);
> >>> +
> >>> +     if (!rc) {
> >>> +             if ((le16_to_cpu((*p)->header.nextindex) < XTENTRYSTART=
) ||
> >>> +                     (le16_to_cpu((*p)->header.nextindex) >
> >>> +                             le16_to_cpu((*p)->header.maxentry)) ||
> >>> +                     (le16_to_cpu((*p)->header.maxentry) >
> >>> +                             ((bn =3D=3D 0) ? XTROOTMAXSLOT : PSIZE =
>> L2XTSLOTSIZE))) {
> >>> +                     jfs_error(ip->i_sb, "xt_getpage: xtree page cor=
rupt\n");
> >>> +                     BT_PUTPAGE(*mp);
> >>> +                     *mp =3D NULL;
> >>> +                     rc =3D -EIO;
> >>> +             }
> >>> +     }
> >>> +     return rc;
> >>> +}
> >>> +
> >>>    /*
> >>>     *  xtLookup()
> >>>     *
> >>> @@ -252,7 +270,7 @@ static int xtSearch(struct inode *ip, s64 xoff,  =
 s64 *nextp,
> >>>         */
> >>>        for (bn =3D 0;;) {
> >>>                /* get/pin the page to search */
> >>> -             XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
> >>> +             rc =3D xt_getpage(ip, bn, &mp, PSIZE, &p);
> >>>                if (rc)
> >>>                        return rc;
> >>>
> >>> @@ -807,7 +825,7 @@ xtSplitUp(tid_t tid,
> >>>                 * insert router entry in parent for new right child p=
age <rp>
> >>>                 */
> >>>                /* get/pin the parent page <sp> */
> >>> -             XT_GETPAGE(ip, parent->bn, smp, PSIZE, sp, rc);
> >>> +             rc =3D xt_getpage(ip, parent->bn, &smp, PSIZE, &sp);
> >>>                if (rc) {
> >>>                        XT_PUTPAGE(rcmp);
> >>>                        return rc;
> >>> @@ -1062,7 +1080,7 @@ xtSplitPage(tid_t tid, struct inode *ip,
> >>>         * update previous pointer of old next/right page of <sp>
> >>>         */
> >>>        if (nextbn !=3D 0) {
> >>> -             XT_GETPAGE(ip, nextbn, mp, PSIZE, p, rc);
> >>> +             rc =3D xt_getpage(ip, nextbn, &mp, PSIZE, &p);
> >>>                if (rc) {
> >>>                        XT_PUTPAGE(rmp);
> >>>                        goto clean_up;
> >>> @@ -1417,7 +1435,7 @@ int xtExtend(tid_t tid,         /* transaction =
id */
> >>>                        return rc;
> >>>
> >>>                /* get back old page */
> >>> -             XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
> >>> +             rc =3D xt_getpage(ip, bn, &mp, PSIZE, &p);
> >>>                if (rc)
> >>>                        return rc;
> >>>                /*
> >>> @@ -1433,7 +1451,7 @@ int xtExtend(tid_t tid,         /* transaction =
id */
> >>>                        XT_PUTPAGE(mp);
> >>>
> >>>                        /* get new child page */
> >>> -                     XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
> >>> +                     rc =3D xt_getpage(ip, bn, &mp, PSIZE, &p);
> >>>                        if (rc)
> >>>                                return rc;
> >>>
> >>> @@ -1711,7 +1729,7 @@ int xtUpdate(tid_t tid, struct inode *ip, xad_t=
 * nxad)
> >>>                        return rc;
> >>>
> >>>                /* get back old page */
> >>> -             XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
> >>> +             rc =3D xt_getpage(ip, bn, &mp, PSIZE, &p);
> >>>                if (rc)
> >>>                        return rc;
> >>>                /*
> >>> @@ -1727,7 +1745,7 @@ int xtUpdate(tid_t tid, struct inode *ip, xad_t=
 * nxad)
> >>>                        XT_PUTPAGE(mp);
> >>>
> >>>                        /* get new child page */
> >>> -                     XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
> >>> +                     rc =3D xt_getpage(ip, bn, &mp, PSIZE, &p);
> >>>                        if (rc)
> >>>                                return rc;
> >>>
> >>> @@ -1788,7 +1806,7 @@ int xtUpdate(tid_t tid, struct inode *ip, xad_t=
 * nxad)
> >>>                XT_PUTPAGE(mp);
> >>>
> >>>                /* get new right page */
> >>> -             XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
> >>> +             rc =3D xt_getpage(ip, bn, &mp, PSIZE, &p);
> >>>                if (rc)
> >>>                        return rc;
> >>>
> >>> @@ -1864,7 +1882,7 @@ printf("xtUpdate.updateLeft.split p:0x%p\n", p)=
;
> >>>                        return rc;
> >>>
> >>>                /* get back old page */
> >>> -             XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
> >>> +             rc =3D xt_getpage(ip, bn, &mp, PSIZE, &p);
> >>>                if (rc)
> >>>                        return rc;
> >>>
> >>> @@ -1881,7 +1899,7 @@ printf("xtUpdate.updateLeft.split p:0x%p\n", p)=
;
> >>>                        XT_PUTPAGE(mp);
> >>>
> >>>                        /* get new child page */
> >>> -                     XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
> >>> +                     rc =3D xt_getpage(ip, bn, &mp, PSIZE, &p);
> >>>                        if (rc)
> >>>                                return rc;
> >>>
> >>> @@ -2268,7 +2286,7 @@ s64 xtTruncate(tid_t tid, struct inode *ip, s64=
 newsize, int flag)
> >>>         * first access of each page:
> >>>         */
> >>>          getPage:
> >>> -     XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
> >>> +     rc =3D xt_getpage(ip, bn, &mp, PSIZE, &p);
> >>>        if (rc)
> >>>                return rc;
> >>>
> >>> @@ -2506,7 +2524,7 @@ s64 xtTruncate(tid_t tid, struct inode *ip, s64=
 newsize, int flag)
> >>>
> >>>        /* get back the parent page */
> >>>        bn =3D parent->bn;
> >>> -     XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
> >>> +     rc =3D xt_getpage(ip, bn, &mp, PSIZE, &p);
> >>>        if (rc)
> >>>                return rc;
> >>>
> >>> @@ -2791,7 +2809,7 @@ s64 xtTruncate_pmap(tid_t tid, struct inode *ip=
, s64 committed_size)
> >>>                 * first access of each page:
> >>>                 */
> >>>          getPage:
> >>> -             XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
> >>> +             rc =3D xt_getpage(ip, bn, &mp, PSIZE, &p);
> >>>                if (rc)
> >>>                        return rc;
> >>>
> >>> @@ -2836,7 +2854,7 @@ s64 xtTruncate_pmap(tid_t tid, struct inode *ip=
, s64 committed_size)
> >>>
> >>>        /* get back the parent page */
> >>>        bn =3D parent->bn;
> >>> -     XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
> >>> +     rc =3D xt_getpage(ip, bn, &mp, PSIZE, &p);
> >>>        if (rc)
> >>>                return rc;
> >>>
> >>
>
