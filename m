Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E141B67A
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 03:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747711907; cv=none; b=sgShQZtXhAxdWbDnTen7vFEXUi/JobUwc7ybExK6VLcz58xyEj2l8UQ7VU+OVwrtnq0C5X1sUkI+CHe+2sDV5E2RPkVKyWZL2TZFCam0kvwo5t83weAd9hOL/wTVTqEOc8GI4VDOHp8HzcIlZJjXqE2kd1+JTDUP8yL4mo96ctY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747711907; c=relaxed/simple;
	bh=X8ZE0IMD4f4Zvcmg0Nlq+WAKM12IVgif4WUOWd/lCqA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k8ddVy+pQR94Jw1+grYR0E3GmRs9dkuFyRb0lVrVVT02ZhgNvHsjgjBchVBytC0djoNEAvXtfM/tUxI1SxBTOO8qF3pELejB2z5miv7aeCIObxe9xnrCzKbkkxq7ms2xoOlVunvrqFYbarpUojBCb2LVo8JXseHwe7MrSRQXHVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S+dQvhIJ; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S+dQvhIJ"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3292aad800aso885341fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 20:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747711903; x=1748316703; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uj5duSIn2gmfsncTogIgvyhtWkcPgMLCLHq+csGoNcE=;
        b=S+dQvhIJdg0avb20qkpeYcIy98CKQjSdHbq6APfszsCtOZFX4C1OJd9yOrfySHRF85
         ORd3RYI1cPe3dLTiCMUHpUGN+idS+rUMjFao5T7qcXrLsl02Symd41dF+n5nxaYQbn+3
         62fgCksVwxdjVDr/6rJYidWYVHJmqJsrPTY28BwM3GMQ6o/FEiwnc0DvLSbYO83YUjVb
         s06eZyyKJhz66JXRW6VPo1pehaKuP9GCaJRlx0HXHmRnLHIgFzH9xiEUOKFHrwh3W3IF
         vy8wOAWbtfcvxZ6R5EMI5eXUeuOlosc1MKYcRy+grhrEy6WUdc2es8PQt1EuyKVPFP25
         SNdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747711903; x=1748316703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uj5duSIn2gmfsncTogIgvyhtWkcPgMLCLHq+csGoNcE=;
        b=bxWri+rX+tmI2bK97wo32D7qEKY73DqBAfNIacAC/8BMkGfgxJACkNyb+IdLu059PG
         8aWtPbqEa0ZuK1zaC5+UirhfKwFxKbUpUD+4bChNlBuNJ8ghysJPg281MmY0XMwaYiCw
         WZq6DxyaYIE3pic5iak564UwKLEXYdpSUsRsCOYuuGGfzikRWBwxzAUK9hWeTrgazxet
         DTJHtE2TZl8vxM1NpJdSfxPjLGgtrvuUGuAV4P5q6eu3AyrdXNuSFSMEQACNlXctC/FJ
         pGJpBsljbGjjhST1QzUulYJ+XdQ9pQyCVyUAcvdhshR4yMqiusSztDjYwnARneIeLa0j
         ZJKw==
X-Forwarded-Encrypted: i=1; AJvYcCXDNg/yHEknNSMxWRjJ5gD24VoCxXrGekq7BSeiDZRHjVLRNNslhR+ih5/1QJys67VWs2FLx4lGqbT4DGk=@vger.kernel.org
X-Gm-Message-State: AOJu0YypMUz0cM/33cCeYLhe/j/z2xcwyRi/srK/NaLIi2YOt//2C7c2
	R8f1PkmtqTBk8gl8OLXpEDJPEtMf6evUKyOwafofqhBmBfQ3IK1TmoGrVZcy7LGau/1fMPDjXiF
	bkCGKv9N4wQgV2fPHRiYA4Z1HXl7EwtM=
X-Gm-Gg: ASbGncvwGSCf1CmpO4K/LE5JE/V8+YFWQ+f7fngFj42tKSDI/405Zngy3gZfx8QKlcU
	yH1KzcSgy5kOfKr59w/CGqZPBnLjXJMEK9OHIIAAvlOW4bCYiqS0ptrttiLQ3mL+xpx6SO38sbt
	4TGUnXWsKgnRgK31tO99bsA67PgwUEUtXK
X-Google-Smtp-Source: AGHT+IHOwNV/ROHaarvVVjjxiHBO8PcJTHdlYpa18GYBvmtjxh0w7NDl/facyDKOPJX60enKUhk0dIKsPlTY5Qlgdo8=
X-Received: by 2002:a05:651c:50e:b0:329:1f6a:3222 with SMTP id
 38308e7fff4ca-3291f6a3460mr18368461fa.7.1747711903077; Mon, 19 May 2025
 20:31:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514201729.48420-6-ryncsn@gmail.com> <20250519043847.1806-1-21cnbao@gmail.com>
In-Reply-To: <20250519043847.1806-1-21cnbao@gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Tue, 20 May 2025 11:31:25 +0800
X-Gm-Features: AX0GCFvroQlyfTT8oJOQql283cMjz0f6cqhQDOST_Liy09pVOHKGMSiyGdGMOEw
Message-ID: <CAMgjq7BpfueOn9ms8apRX-6dF8rZGtbC=MuZzSD7hbZxtw=Kdg@mail.gmail.com>
Subject: Re: [PATCH 05/28] mm, swap: sanitize swap cache lookup convention
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, baohua@kernel.org, 
	baolin.wang@linux.alibaba.com, bhe@redhat.com, chrisl@kernel.org, 
	david@redhat.com, hannes@cmpxchg.org, hughd@google.com, 
	kaleshsingh@google.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	nphamcs@gmail.com, ryan.roberts@arm.com, shikemeng@huaweicloud.com, 
	tim.c.chen@linux.intel.com, willy@infradead.org, ying.huang@linux.alibaba.com, 
	yosryahmed@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 12:38=E2=80=AFPM Barry Song <21cnbao@gmail.com> wro=
te:
>
> > From: Kairui Song <kasong@tencent.com>
>
> > diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
> > index e5a0db7f3331..5b4f01aecf35 100644
> > --- a/mm/userfaultfd.c
> > +++ b/mm/userfaultfd.c
> > @@ -1409,6 +1409,10 @@ static int move_pages_pte(struct mm_struct *mm, =
pmd_t *dst_pmd, pmd_t *src_pmd,
> >                               goto retry;
> >                       }
> >               }
> > +             if (!folio_swap_contains(src_folio, entry)) {
> > +                     err =3D -EBUSY;
> > +                     goto out;
> > +             }
>
> It seems we don't need this. In move_swap_pte(), we have been checking pt=
e pages
> are stable:
>
>         if (!is_pte_pages_stable(dst_pte, src_pte, orig_dst_pte, orig_src=
_pte,
>                                  dst_pmd, dst_pmdval)) {
>                 double_pt_unlock(dst_ptl, src_ptl);
>                 return -EAGAIN;
>         }

The tricky part is when swap_cache_get_folio returns the folio, both
folio and ptes are unlocked. So is it possible that someone else
swapped in the entries, then swapped them out again using the same
entries?

The folio will be different here but PTEs are still the same value to
they will pass the is_pte_pages_stable check, we previously saw
similar races with anon fault or shmem. I think more strict checking
won't hurt here.

>
> Also, -EBUSY is somehow incorrect error code.

Yes, thanks, I'll use EAGAIN here just like move_swap_pte.


>
> >               err =3D move_swap_pte(mm, dst_vma, dst_addr, src_addr, ds=
t_pte, src_pte,
> >                               orig_dst_pte, orig_src_pte, dst_pmd, dst_=
pmdval,
> >                               dst_ptl, src_ptl, src_folio);
> >
>
> Thanks
> Barry
