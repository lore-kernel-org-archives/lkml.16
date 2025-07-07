Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B111A9B24
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 10:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751883098; cv=none; b=fXaHoTxMPRNUJEupSYE2aIOAtUMBLuudufA9MvxAgTCZZyt04tAS2NjBHfltlnVYiyGr0irbZtpeZBKtZamliRxrIyMJ9p+1og1nCto9yObQtXxaTnLBZAgE3L+9+Lk2TQCdIiyDRsLQEsssmUu2ay6JV1+ezW6vM61Jg/7tiYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751883098; c=relaxed/simple;
	bh=apeHThVLY33ysys0ns2kQdX7kZDYMyRR2zqYSSLG+UE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QYuvofkf5bFVPVobtTVUwDk6/V3ztDdGIbb7iUtoVwAoRus5RDT705jG0k+TbfwocG6K36fyWBrU4xg8Fp5Xs+elzOYbF9+FoTt8hotyWyqfYj8voHcuI3wTMekUGDWgy+k7Q36hUMzZfV1IzkyLk/IvZ6won1h8oXOCx5DWzYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BuEkIO8h; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BuEkIO8h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751883094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F7tRsSnoKak3zvgw3Q/K9RVvMM3Z3IUg0Nhn/aNMlKY=;
	b=BuEkIO8hx6IJGViBTnXTWLO5cCY4FDtvo12hcvFP2ZTYqYw6RG13cAosgo35BUPRwqOdSR
	juc+wIZqz8TQ3+KeTpsIqQwNa6BmmTya6R5TSmU5ICZLNZrVYfY/wcgtEcRKI5eSM+YPbq
	2JBvECzFUPj+kCVYRgc6EC+ktT23vBY=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-126-4FxG0vEYO_emLcDFN7zQDg-1; Mon, 07 Jul 2025 06:11:32 -0400
X-MC-Unique: 4FxG0vEYO_emLcDFN7zQDg-1
X-Mimecast-MFC-AGG-ID: 4FxG0vEYO_emLcDFN7zQDg_1751883091
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-87f21c86defso75558241.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 03:11:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751883091; x=1752487891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F7tRsSnoKak3zvgw3Q/K9RVvMM3Z3IUg0Nhn/aNMlKY=;
        b=arSwQbiyw5BjWjPpCvLeI7nGfHrd5F5W2ix4/l78YSoi/lcS6sbFh/9EhF7YsVVT4B
         6majaBXjT9EU0nwBbbt93vw3ILY+LAYQYJQGiSGrHifTnV5NEx59Ht1KG9fSXReIQGze
         tiKY/VU7iDOurDjqMLPNks/mRAGXn1bVDf4QmoOsB0uXVNT0K75cCWHOEVMqYxS6G/KM
         LLQLY3bYb2Ty00uT/dyp3bb6n8ybVRixhsiNPuEUFuYUqY01PSgH1fMKXg1nH7/q5RGL
         D1xCeN6eT81lJfoH6RoEdEWznRhFZumyH9Pmmv8TTD0eci0chTt/GSpIuLiEMUhC+34s
         44gg==
X-Forwarded-Encrypted: i=1; AJvYcCWwvFdrvGgDqJt6Wm/wLzoBEhNYxu7xsW/0u/tqej6l1PLlyWM2CPjsCueRNYmGugEIh6ocRdxXz3gPouc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz85JzMQnSt1efngwKFpKxFTU3xDtdtawJd/cQbcH29GFMAoW1F
	tbtYkCLqjEKIGyDeLr4DuEY2W97ZMrsVeCNIG1PaCS/lZXGsgjxxuzSI6gpmhuJ+HcV/VtZSgSb
	4RP61ppgjVmR11eLGOC0kRLucFd4sMNKAvSPjlVallRTY+s8zGJ1YA5f5DnLU5hUcH5e8HAD2Nf
	jyBNDrODV2TUTQhFlg1fX8ej/RWGY5Yap8DK0xB+jhJQzveHVgJFCqwg==
X-Gm-Gg: ASbGncs809CbLtccvSvvasPPnrwn+uYAQ/qp0JFtPG/4aWqLnVIKN3/Rf+VKhx2IW1b
	3sbIx3y4YPmvObInwwKuNbqBebHVPr8/FMyIktebSSwf/ajLANnPWrt1yGw+Xr23huzEVWNVLJU
	FZ+Svp
X-Received: by 2002:a05:6102:3c83:b0:4e9:b793:1977 with SMTP id ada2fe7eead31-4f2f198657bmr6730569137.0.1751883091014;
        Mon, 07 Jul 2025 03:11:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZk9HP7WquLGz9hJIU3/iitkGK7pyQmFnsHBnwFPfQZvCp3nE527tvdBQMCbV6WsFIk6+2pDQHk5bu0nJ/J4w=
X-Received: by 2002:a05:6102:3c83:b0:4e9:b793:1977 with SMTP id
 ada2fe7eead31-4f2f198657bmr6730560137.0.1751883090654; Mon, 07 Jul 2025
 03:11:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250705155422.802775-1-abinashsinghlalotra@gmail.com>
In-Reply-To: <20250705155422.802775-1-abinashsinghlalotra@gmail.com>
From: Alex Markuze <amarkuze@redhat.com>
Date: Mon, 7 Jul 2025 13:11:19 +0300
X-Gm-Features: Ac12FXzhZJHBc-jmWn_1riw6N5tTCNRIyO2xwvpd_kNSDAAuVz1F2T4p4yggCpY
Message-ID: <CAO8a2Shw=pkQN21+nzHWQyfF5ygGMtHG1uVn2Cqqi6Bhm8Mhfg@mail.gmail.com>
Subject: Re: [PATCH RFC] fs/ceph : fix build warning in ceph_writepages_start()
To: Abinash Singh <abinashlalotra@gmail.com>
Cc: xiubli@redhat.com, idryomov@gmail.com, ceph-devel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Abinash Singh <abinashsinghlalotra@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Abinash,

Thanks for your patch, you=E2=80=99ve correctly identified a real concern
around stack usage in ceph_writepages_start().

However, dynamically allocating ceph_writeback_ctl inside .writepages
isn't ideal. This function may be called in memory reclaim paths or
under writeback pressure, where any GFP allocation (even GFP_NOFS)
could deadlock or fail unexpectedly.

Instead of allocating the struct on each call, I=E2=80=99d suggest one of t=
he following:

Add a dedicated kmem_cache for ceph_writeback_ctl, initialized during
Ceph FS client init.
This allows reuse across calls without hitting the slab allocator each time=
.

Embed a ceph_writeback_ctl struct inside ceph_inode_info, if it's
feasible to manage lifetimes and synchronization. Note that
.writepages can run concurrently on the same inode, so this approach
would require proper locking or reuse guarantees.

On Sat, Jul 5, 2025 at 6:54=E2=80=AFPM Abinash Singh <abinashlalotra@gmail.=
com> wrote:
>
> The function `ceph_writepages_start()` triggers
> a large stack frame warning:
> ld.lld: warning:
>         fs/ceph/addr.c:1632:0: stack frame size (1072) exceeds limit (102=
4) in function 'ceph_writepages_start.llvm.2555023190050417194'
>
> fix it by dynamically allocating `ceph_writeback_ctl` struct.
>
> Signed-off-by: Abinash Singh <abinashsinghlalotra@gmail.com>
> ---
> The high stack usage of ceph_writepages_start() was further
> confirmed by using -fstack-usage flag :
> ...
> fs/ceph/addr.c:1837:ceph_netfs_check_write_begin        104     static
> fs/ceph/addr.c:1630:ceph_writepages_start       648     static
> ...
> After optimzations it may go upto 1072 as seen in warning.
> After allocating `ceph_writeback_ctl` struct it is reduced to:
> ...
> fs/ceph/addr.c:1630:ceph_writepages_start       288     static
> fs/ceph/addr.c:81:ceph_dirty_folio      72      static
> ...
> Is this fun used very frequently ?? or dynamic allocation is
> a fine fix for reducing the stack usage ?
>
> Thank You
> ---
>  fs/ceph/addr.c | 82 ++++++++++++++++++++++++++------------------------
>  1 file changed, 43 insertions(+), 39 deletions(-)
>
> diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
> index 60a621b00c65..503a86c1dda6 100644
> --- a/fs/ceph/addr.c
> +++ b/fs/ceph/addr.c
> @@ -1633,9 +1633,13 @@ static int ceph_writepages_start(struct address_sp=
ace *mapping,
>         struct inode *inode =3D mapping->host;
>         struct ceph_fs_client *fsc =3D ceph_inode_to_fs_client(inode);
>         struct ceph_client *cl =3D fsc->client;
> -       struct ceph_writeback_ctl ceph_wbc;
> +       struct ceph_writeback_ctl *ceph_wbc __free(kfree) =3D NULL;
>         int rc =3D 0;
>
> +       ceph_wbc =3D kmalloc(sizeof(*ceph_wbc), GFP_NOFS);
> +       if (!ceph_wbc)
> +               return -ENOMEM;
> +
>         if (wbc->sync_mode =3D=3D WB_SYNC_NONE && fsc->write_congested)
>                 return 0;
>
> @@ -1648,7 +1652,7 @@ static int ceph_writepages_start(struct address_spa=
ce *mapping,
>                 return -EIO;
>         }
>
> -       ceph_init_writeback_ctl(mapping, wbc, &ceph_wbc);
> +       ceph_init_writeback_ctl(mapping, wbc, ceph_wbc);
>
>         if (!ceph_inc_osd_stopping_blocker(fsc->mdsc)) {
>                 rc =3D -EIO;
> @@ -1656,7 +1660,7 @@ static int ceph_writepages_start(struct address_spa=
ce *mapping,
>         }
>
>  retry:
> -       rc =3D ceph_define_writeback_range(mapping, wbc, &ceph_wbc);
> +       rc =3D ceph_define_writeback_range(mapping, wbc, ceph_wbc);
>         if (rc =3D=3D -ENODATA) {
>                 /* hmm, why does writepages get called when there
>                    is no dirty data? */
> @@ -1665,55 +1669,55 @@ static int ceph_writepages_start(struct address_s=
pace *mapping,
>         }
>
>         if (wbc->sync_mode =3D=3D WB_SYNC_ALL || wbc->tagged_writepages)
> -               tag_pages_for_writeback(mapping, ceph_wbc.index, ceph_wbc=
.end);
> +               tag_pages_for_writeback(mapping, ceph_wbc->index, ceph_wb=
c->end);
>
> -       while (!has_writeback_done(&ceph_wbc)) {
> -               ceph_wbc.locked_pages =3D 0;
> -               ceph_wbc.max_pages =3D ceph_wbc.wsize >> PAGE_SHIFT;
> +       while (!has_writeback_done(ceph_wbc)) {
> +               ceph_wbc->locked_pages =3D 0;
> +               ceph_wbc->max_pages =3D ceph_wbc->wsize >> PAGE_SHIFT;
>
>  get_more_pages:
> -               ceph_folio_batch_reinit(&ceph_wbc);
> +               ceph_folio_batch_reinit(ceph_wbc);
>
> -               ceph_wbc.nr_folios =3D filemap_get_folios_tag(mapping,
> -                                                           &ceph_wbc.ind=
ex,
> -                                                           ceph_wbc.end,
> -                                                           ceph_wbc.tag,
> -                                                           &ceph_wbc.fba=
tch);
> +               ceph_wbc->nr_folios =3D filemap_get_folios_tag(mapping,
> +                                                           &ceph_wbc->in=
dex,
> +                                                           ceph_wbc->end=
,
> +                                                           ceph_wbc->tag=
,
> +                                                           &ceph_wbc->fb=
atch);
>                 doutc(cl, "pagevec_lookup_range_tag for tag %#x got %d\n"=
,
> -                       ceph_wbc.tag, ceph_wbc.nr_folios);
> +                       ceph_wbc->tag, ceph_wbc->nr_folios);
>
> -               if (!ceph_wbc.nr_folios && !ceph_wbc.locked_pages)
> +               if (!ceph_wbc->nr_folios && !ceph_wbc->locked_pages)
>                         break;
>
>  process_folio_batch:
> -               rc =3D ceph_process_folio_batch(mapping, wbc, &ceph_wbc);
> +               rc =3D ceph_process_folio_batch(mapping, wbc, ceph_wbc);
>                 if (rc)
>                         goto release_folios;
>
>                 /* did we get anything? */
> -               if (!ceph_wbc.locked_pages)
> +               if (!ceph_wbc->locked_pages)
>                         goto release_folios;
>
> -               if (ceph_wbc.processed_in_fbatch) {
> -                       ceph_shift_unused_folios_left(&ceph_wbc.fbatch);
> +               if (ceph_wbc->processed_in_fbatch) {
> +                       ceph_shift_unused_folios_left(&ceph_wbc->fbatch);
>
> -                       if (folio_batch_count(&ceph_wbc.fbatch) =3D=3D 0 =
&&
> -                           ceph_wbc.locked_pages < ceph_wbc.max_pages) {
> +                       if (folio_batch_count(&ceph_wbc->fbatch) =3D=3D 0=
 &&
> +                           ceph_wbc->locked_pages < ceph_wbc->max_pages)=
 {
>                                 doutc(cl, "reached end fbatch, trying for=
 more\n");
>                                 goto get_more_pages;
>                         }
>                 }
>
> -               rc =3D ceph_submit_write(mapping, wbc, &ceph_wbc);
> +               rc =3D ceph_submit_write(mapping, wbc, ceph_wbc);
>                 if (rc)
>                         goto release_folios;
>
> -               ceph_wbc.locked_pages =3D 0;
> -               ceph_wbc.strip_unit_end =3D 0;
> +               ceph_wbc->locked_pages =3D 0;
> +               ceph_wbc->strip_unit_end =3D 0;
>
> -               if (folio_batch_count(&ceph_wbc.fbatch) > 0) {
> -                       ceph_wbc.nr_folios =3D
> -                               folio_batch_count(&ceph_wbc.fbatch);
> +               if (folio_batch_count(&ceph_wbc->fbatch) > 0) {
> +                       ceph_wbc->nr_folios =3D
> +                               folio_batch_count(&ceph_wbc->fbatch);
>                         goto process_folio_batch;
>                 }
>
> @@ -1724,38 +1728,38 @@ static int ceph_writepages_start(struct address_s=
pace *mapping,
>                  * we tagged for writeback prior to entering this loop.
>                  */
>                 if (wbc->nr_to_write <=3D 0 && wbc->sync_mode =3D=3D WB_S=
YNC_NONE)
> -                       ceph_wbc.done =3D true;
> +                       ceph_wbc->done =3D true;
>
>  release_folios:
>                 doutc(cl, "folio_batch release on %d folios (%p)\n",
> -                     (int)ceph_wbc.fbatch.nr,
> -                     ceph_wbc.fbatch.nr ? ceph_wbc.fbatch.folios[0] : NU=
LL);
> -               folio_batch_release(&ceph_wbc.fbatch);
> +                     (int)ceph_wbc->fbatch.nr,
> +                     ceph_wbc->fbatch.nr ? ceph_wbc->fbatch.folios[0] : =
NULL);
> +               folio_batch_release(&ceph_wbc->fbatch);
>         }
>
> -       if (ceph_wbc.should_loop && !ceph_wbc.done) {
> +       if (ceph_wbc->should_loop && !ceph_wbc->done) {
>                 /* more to do; loop back to beginning of file */
>                 doutc(cl, "looping back to beginning of file\n");
>                 /* OK even when start_index =3D=3D 0 */
> -               ceph_wbc.end =3D ceph_wbc.start_index - 1;
> +               ceph_wbc->end =3D ceph_wbc->start_index - 1;
>
>                 /* to write dirty pages associated with next snapc,
>                  * we need to wait until current writes complete */
> -               ceph_wait_until_current_writes_complete(mapping, wbc, &ce=
ph_wbc);
> +               ceph_wait_until_current_writes_complete(mapping, wbc, cep=
h_wbc);
>
> -               ceph_wbc.start_index =3D 0;
> -               ceph_wbc.index =3D 0;
> +               ceph_wbc->start_index =3D 0;
> +               ceph_wbc->index =3D 0;
>                 goto retry;
>         }
>
> -       if (wbc->range_cyclic || (ceph_wbc.range_whole && wbc->nr_to_writ=
e > 0))
> -               mapping->writeback_index =3D ceph_wbc.index;
> +       if (wbc->range_cyclic || (ceph_wbc->range_whole && wbc->nr_to_wri=
te > 0))
> +               mapping->writeback_index =3D ceph_wbc->index;
>
>  dec_osd_stopping_blocker:
>         ceph_dec_osd_stopping_blocker(fsc->mdsc);
>
>  out:
> -       ceph_put_snap_context(ceph_wbc.last_snapc);
> +       ceph_put_snap_context(ceph_wbc->last_snapc);
>         doutc(cl, "%llx.%llx dend - startone, rc =3D %d\n", ceph_vinop(in=
ode),
>               rc);
>
> --
> 2.43.0
>
>

