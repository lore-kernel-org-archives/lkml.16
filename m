Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882DF155A30
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 04:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747457633; cv=none; b=QqeAwhimIE47gfvTgwTgPu2zHHHmywo4EO4oaHbizTiLTba6gVvzcHsP1uMRyXAbLAoqYKF3ToAG0KEKdSdDlu29szMmQAFMJ5YLiluIqmn8dDmbkctarXO3JpvTWzDV/FOsrYO6JPYPPziVR6egw/iIHMXJ/J7qgKNQ5Fx4RhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747457633; c=relaxed/simple;
	bh=TqxPAsF2O5vZE3IPQhz9oqrLOFCwYO+zgm01pOCcPZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X3GnyoQ0Dd3fSkLNG1PKxKRUXqo1II5w8IRaTdqyPrBSZlQ5QzGiBvNHpEdSJVgIoCAu/SwKLPD9vtzIE3m2szUAdShhmdud6rj3HcI0t/MReZGp+hbFyF/44xDeIizNQ6mrqPdZQd+g742KKun2z91oTy2LaG/DUwqlPSA3eYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yD9t+QoT; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yD9t+QoT"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-231ba6da557so51145ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 21:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747457631; x=1748062431; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bLBC6DFCaMhDcBjh0CxDR7grbX7q8ka+MLLSJpzu+cc=;
        b=yD9t+QoTpJPnWbRpYxQU/z8ATFFJJvAP+XT7gnRRFlz7G+QYke0SbDuIjoSLtYbP96
         vFnewNw/+2fJOAyyBfNQMtPGLnPUWv8tN+lK6CM/Dl5obvNgMH3lMgCcTo5ztLcjzlmN
         ieeAQFdGbdWYCBA0iNHKfWyeVFTPwB2GvLVa41mLWP8HZOt0Icwz2f1KfO/u9+CM+fae
         T8Hc7y8z31VlXdP9Z4FQnP3AaRBXP9NObs6E5ePodgbi35vwiKSTQ+Mebjy5sy6IQW8P
         +FMR4+KHZzsW7t9miHGIvJdLVRIqq088mRUWbQEKq1EoUIu/5N1xUStdnO1DyWUnBkDl
         i6Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747457631; x=1748062431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bLBC6DFCaMhDcBjh0CxDR7grbX7q8ka+MLLSJpzu+cc=;
        b=pRERr06WNxbwoT59S/xZA2D6S2lQFs1qbxie0wdmDUOBL/lut8DPbHv9csSBs2mXCN
         lmg5CyZ68KjoCwpaBIZNkChMtSbUsr+C8QNvBb7b2TCUjWanUUBw4Fthtuck9ZE1l6YT
         V1i3k5CVDbA0d01Lvmz3KbfZQrgd4w/DLCIjk0oYNZDoHYWu2pKQ8i5r0cmDJfP/Da0i
         CVvQIbQsHZ6ctLUHha9Sn6phqR77lbGKjhm3sfG0q0VZbad3m2L/UyRd+I1ep6MYVqfp
         vzb2Xb1/o37uErCHhlkjldNWnTWC/HHE2DE2BlpC5O3zwilCEwPzVt0ZUGXj6zj37kTA
         /N6A==
X-Forwarded-Encrypted: i=1; AJvYcCU3NT9JNx5GLE0IxuyZ1GVdbeHU1H0pFy1Up2k/Kx3l1Ywx97SMJB2kK9eTOwvUwLYKad5P7P+M/mLsxMc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5cFFqdIwa6klcvqyuFET2RCcXuZT4U4hh89AC5OXw/Ux7f5nl
	YgGSTWJ+pWH6p+JCW2rPBVr4nBFrcuem2oLtKi9w5fkzQWTQ2iWiDW+hHq2QllBQriyfvTRN5aV
	RGL+JLqR70A6Tue8a/Z6UmecZbwyjmbMpE7Om+lr5
X-Gm-Gg: ASbGncuye6UOuGdUJrY6TZ7cMDWV93fScVWVnvFYJYKE68dTHUUHSmlsx7AXINpMLPV
	dTP3z1x40eJmC4BQz89igkgHq+flVGH9on7bFYnTh1uqvicqb87d9Dofz6nEISxsdb/o3vRj8aw
	QGI4GMRfTI8FXWTaECgOcdv4/Af4uNhjL3yw==
X-Google-Smtp-Source: AGHT+IEYQ75QOTBuWiuY/usXyl//AMAMWzV5ec/pBn5TK10hdDFrZ/2ZaQ1s7InlcVl53yl2kaY8inbWXVyHN+jTlDE=
X-Received: by 2002:a17:902:cecd:b0:231:d7cf:cf18 with SMTP id
 d9443c01a7336-23203eee503mr898975ad.1.1747457630360; Fri, 16 May 2025
 21:53:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250517000431.558180-1-stfomichev@gmail.com> <20250517000907.GW2023217@ZenIV>
 <aCflM0LZ23d2j2FF@mini-arch> <20250517020653.GX2023217@ZenIV>
 <aCfxs5CiHYMJPOsy@mini-arch> <20250517033951.GY2023217@ZenIV>
 <aCgIJSgv-yQzaHLl@mini-arch> <20250517040530.GZ2023217@ZenIV> <aCgQwfyQqkD2AUSs@mini-arch>
In-Reply-To: <aCgQwfyQqkD2AUSs@mini-arch>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 16 May 2025 21:53:36 -0700
X-Gm-Features: AX0GCFv05ogkNccah3Tcx0t_520Ll67PUCfBoUsGgefZcK03_LvVsfsR3n0m3B8
Message-ID: <CAHS8izOSZS8F7vbNVS4VeyxdNBbjcaC47_GXYKTe-0t6qorcTQ@mail.gmail.com>
Subject: Re: [PATCH net-next] net: devmem: remove min_t(iter_iov_len) in sendmsg
To: Stanislav Fomichev <stfomichev@gmail.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, netdev@vger.kernel.org, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	willemb@google.com, sagi@grimberg.me, asml.silence@gmail.com, 
	kaiyuanz@google.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 9:29=E2=80=AFPM Stanislav Fomichev <stfomichev@gmai=
l.com> wrote:
>
> On 05/17, Al Viro wrote:
> > On Fri, May 16, 2025 at 08:53:09PM -0700, Stanislav Fomichev wrote:
> > > On 05/17, Al Viro wrote:
> > > > On Fri, May 16, 2025 at 07:17:23PM -0700, Stanislav Fomichev wrote:
> > > > > > Wait, in the same commit there's
> > > > > > +       if (iov_iter_type(from) !=3D ITER_IOVEC)
> > > > > > +               return -EFAULT;
> > > > > >
> > > > > > shortly prior to the loop iter_iov_{addr,len}() are used.  What=
 am I missing now?
> > > > >
> > > > > Yeah, I want to remove that part as well:
> > > > >
> > > > > https://lore.kernel.org/netdev/20250516225441.527020-1-stfomichev=
@gmail.com/T/#u
> > > > >
> > > > > Otherwise, sendmsg() with a single IOV is not accepted, which mak=
es not
> > > > > sense.
> > > >
> > > > Wait a minute.  What's there to prevent a call with two ranges far =
from each other?
> > >
> > > It is perfectly possible to have a call with two disjoint ranges,
> > > net_devmem_get_niov_at should correctly resolve it to the IOVA in the
> > > dmabuf. Not sure I understand why it's an issue, can you pls clarify?
> >
> > Er...  OK, the following is given an from with two iovecs.
> >
> >       while (length && iov_iter_count(from)) {
> >               if (i =3D=3D MAX_SKB_FRAGS)
> >                       return -EMSGSIZE;
> >
> >               virt_addr =3D (size_t)iter_iov_addr(from);
> >
> > OK, that's iov_base of the first one.
> >
> >               niov =3D net_devmem_get_niov_at(binding, virt_addr, &off,=
 &size);
> >               if (!niov)
> >                       return -EFAULT;
> > Whatever it does, it does *NOT* see iov_len of the first iovec.  Looks =
like
> > it tries to set something up, storing the length of what it had set up
> > into size
> >
> >               size =3D min_t(size_t, size, length);
> > ... no more than length, OK.  Suppose length is considerably more than =
iov_len
> > of the first iovec.
> >
> >               size =3D min_t(size_t, size, iter_iov_len(from));
> > ... now trim it down to iov_len of that sucker.  That's what you want t=
o remove,
> > right?  What happens if iov_len is shorter than what we have in size?
> >
> >               get_netmem(net_iov_to_netmem(niov));
> >               skb_add_rx_frag_netmem(skb, i, net_iov_to_netmem(niov), o=
ff,
> >                                     size, PAGE_SIZE);
> > Still not looking at that iov_len...
> >
> >               iov_iter_advance(from, size);
> > ... and now that you've removed the second min_t, size happens to be gr=
eater
> > than that iovec[0].iov_len.  So we advance into the second iovec, skipp=
ing
> > size - iovec[0].iov_len bytes after iovev[1].iov_base.
> >               length -=3D size;
> >               i++;
> >       }
> > ... and proceed into the second iteration.
> >
> > Would you agree that behaviour ought to depend upon the iovec[0].iov_le=
n?
> > If nothing else, it affects which data do you want to be sent, and I do=
n't
> > see where would anything even look at that value with your change...
>
> Yes, I think you have a point. I was thinking that net_devmem_get_niov_at
> will expose max size of the chunk, but I agree that the iov might have
> requested smaller part and it will bug out in case of multiple chunks...
>
> Are you open to making iter_iov_len more ubuf friendly? Something like
> the following:
>
> static inline size_t iter_iov_len(const struct iov_iter *i)
> {
>         if (iter->iter_type =3D=3D ITER_UBUF)
>                 return ni->count;
>         return iter_iov(i)->iov_len - i->iov_offset;
> }
>
> Or should I handle the iter_type here?
>
> if (iter->iter_type =3D=3D ITER_IOVEC)
>         size =3D min_t(size_t, size, iter_iov_len(from));
> /* else
>         I don think I need to clamp to iov_iter_count() because length
>         should take care of it */

Sorry about this, I was worried about testing multiple io_vecs because
I imagined the single io_vec is just a subcase of that. I did not
expect a single iov converts into a different iter type and the iter
type behaves a bit differently.

I think both approaches Stan points to should be fine. The generic
change may break existing users of ITER_UBUF though.

Lets have some test coverage of this in ncdevmem, if possible.

--=20
Thanks,
Mina
