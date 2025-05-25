Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D5C141987
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 17:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748192958; cv=none; b=IIvvaSBlu1T7tUA0lflMK5OrO4Gjb1P9w5X2tIPzQF2M7IV1HVr77av6xfEB9LYxVyzduyfkMDoBiWNIdAT7Ok/9h9uCBjjq0pxxGseE3fEzVeuoIY0BjeI8WIhXvQKlyWdML1h7dTYSXJ7XfIgvevNQdq5GIgZ3z1Hi3p2Mbfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748192958; c=relaxed/simple;
	bh=N/Nb6Z98QE1h7opFxqcxfJBGI1w8NlOXvMkO3SDYkYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q8rKbKYOqOfCfbFDnsxXXIsf44w5mbx/BrVHnBPozXmlrulrpbAN82V/LBzBsQURbgZ2B0nr+YuEDh8qiCxbVV+eIiq4cY9ax8BNx4jop44AbW2Dnnj+yKnQRy2xxWfoN+kcieyZNS8NUd+gg05+PWYegxcjbSxNkyLYawwkuoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TcPG1U+w; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TcPG1U+w"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3280ce0795bso14270141fa.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 10:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748192954; x=1748797754; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gCupfkLLBRXyvgezOvk1m5uJBgj9564oL6KNWBNiFkc=;
        b=TcPG1U+wmagN0PfZX/VUUm8HLW+tCG3JGBDvvLZ3EVDHaGcsXJ3rb1IY6IkE/GNuNb
         ojVOx0kvoi2JeMn4zKF5+1DL05W6+kWZnLsZSTTyTE5mB5Eq7iK3D6EH7o21PGM9d525
         RdYZHr92PaAtC2L34oRomWqjRwO8FqjZbA0O319beEVrvJHizX4D5XCnakEoV3KPGcUF
         gaK/BeVzal/O07HeCmpETxrfqG0bPBO0k0PztcKFBugO+pOKT5BETAislZFfGzrjCOh9
         0X7iByPuHQqe3C3u7/Zc0cmsb1j/kd//BT7KvytzDYqM+4CBJVTZOagAF4KxaEAmg/0q
         eTSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748192954; x=1748797754;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gCupfkLLBRXyvgezOvk1m5uJBgj9564oL6KNWBNiFkc=;
        b=YS2s6MM+uaa8Jbbe9uwlDHru5OZ2DxC81O5YuEg/SXgOyT0MjLstuUHk8mbsdHiv4d
         iXp1YRB5t9e1YguU1XNTwoYOSsviDvt2ZogVzM2qNk0CO0iv8OFsVxrqRcsPWLFc7kJc
         orSndMg+aWcEbioC7cRtfdwShZ+w2/JPh7xpGJxpcZ1DaFJeekom403roD3Zf/4PFlN0
         1iYPKh8PuDG4KJzZGNyQVoHmXVnUSo8R7qSOsK3cEvtcPVaYP5dvUa0Z/llCNjx+qI+q
         9I8+aDPd0Ez/Dqy0Dubj938opOy86eUPb5GkZ4I+fFCidCDGxlA0c3z5XdZEutcekDbu
         pO2g==
X-Forwarded-Encrypted: i=1; AJvYcCVGEcVbYXxYlGZJ9clRNzGTCkVZKJpedAGgmxizVD9BFE0EoWbpNewSMXnMbpgbU0kV0aEnm7z/k7OTFj8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQBscr/OJNoDnwUAnxXt6v1I90RnFMGn1pEsgY/deE5VuSwSY9
	V8NtqOADFk2D7EedN8hXis1mlsZI3Ia+SrXEOsp9yCpYZCpd0CaIxeDhvKqUBAzXubfBBbx6hzP
	T1PpCgbmKg76lbVIM+67xxbE6eZe5t78=
X-Gm-Gg: ASbGncsVUgA5lct7WEDq/ROOkO3z8cTBDbaUF6Yh3S5RzvUHD+Qeg/GjvF1I0stjpam
	RJV9wgqJDB7JHM0zAUofqbBss4cUBKJpvm9D/z/u+g0md8pqlOmNwUHKklLqkmUNy2fDuJZWbQb
	bUHE7XBwXLdLb2QPwNOTnuwOPDorrHGBMC
X-Google-Smtp-Source: AGHT+IFqpNFA9RLARunHpODR6agkcc/Fqy/z67dPDN2eW1f1qIOvdHUMZ4vppO5dzOIZ1Ov5h7+WWThr6lGEwY6atmQ=
X-Received: by 2002:a05:651c:210c:b0:30b:d17b:269a with SMTP id
 38308e7fff4ca-3295b9aea2fmr14116971fa.7.1748192954065; Sun, 25 May 2025
 10:09:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250522122554.12209-1-shikemeng@huaweicloud.com> <20250522122554.12209-3-shikemeng@huaweicloud.com>
In-Reply-To: <20250522122554.12209-3-shikemeng@huaweicloud.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Mon, 26 May 2025 01:08:56 +0800
X-Gm-Features: AX0GCFufTR1qMhjI3981pwKPLYMy0g5s9XrhAvw9WjaIlvBoxWEgOqJ3JrPida4
Message-ID: <CAMgjq7AcMtsS-EX0065jvucLR=YiAvPkjp+rmr=hfxyv9JVW5g@mail.gmail.com>
Subject: Re: [PATCH 2/4] mm: swap: correctly use maxpages in swapon syscall to
 avoid potensial deadloop
To: Kemeng Shi <shikemeng@huaweicloud.com>
Cc: akpm@linux-foundation.org, bhe@redhat.com, hannes@cmpxchg.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 11:32=E2=80=AFAM Kemeng Shi <shikemeng@huaweicloud.=
com> wrote:
>
> We use maxpages from read_swap_header() to initialize swap_info_struct,
> however the maxpages might be reduced in setup_swap_extents() and the
> si->max is assigned with the reduced maxpages from the
> setup_swap_extents().
>
> Obviously, this could lead to memory waste as we allocated memory based o=
n
> larger maxpages, besides, this could lead to a potensial deadloop as
> following:
> 1) When calling setup_clusters() with larger maxpages, unavailable pages
> within range [si->max, larger maxpages) are not accounted with
> inc_cluster_info_page(). As a result, these pages are assumed available
> but can not be allocated. The cluster contains these pages can be moved
> to frag_clusters list after it's all available pages were allocated.
> 2) When the cluster mentioned in 1) is the only cluster in frag_clusters
> list, cluster_alloc_swap_entry() assume order 0 allocation will never
> failed and will enter a deadloop by keep trying to allocate page from the
> only cluster in frag_clusters which contains no actually available page.
>
> Call setup_swap_extents() to get the final maxpages before swap_info_stru=
ct
> initialization to fix the issue.
>
> Fixes: 661383c6111a3 ("mm: swap: relaim the cached parts that got scanned=
")
>
> Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
> ---
>  mm/swapfile.c | 47 ++++++++++++++++++++---------------------------
>  1 file changed, 20 insertions(+), 27 deletions(-)
>
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index 75b69213c2e7..a82f4ebefca3 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -3141,43 +3141,30 @@ static unsigned long read_swap_header(struct swap=
_info_struct *si,
>         return maxpages;
>  }
>
> -static int setup_swap_map_and_extents(struct swap_info_struct *si,
> -                                       union swap_header *swap_header,
> -                                       unsigned char *swap_map,
> -                                       unsigned long maxpages,
> -                                       sector_t *span)
> +static int setup_swap_map(struct swap_info_struct *si,
> +                         union swap_header *swap_header,
> +                         unsigned char *swap_map,
> +                         unsigned long maxpages)
>  {
> -       unsigned int nr_good_pages;
>         unsigned long i;
> -       int nr_extents;
> -
> -       nr_good_pages =3D maxpages - 1;   /* omit header page */
>
> +       swap_map[0] =3D SWAP_MAP_BAD; /* omit header page */
>         for (i =3D 0; i < swap_header->info.nr_badpages; i++) {
>                 unsigned int page_nr =3D swap_header->info.badpages[i];
>                 if (page_nr =3D=3D 0 || page_nr > swap_header->info.last_=
page)
>                         return -EINVAL;
>                 if (page_nr < maxpages) {
>                         swap_map[page_nr] =3D SWAP_MAP_BAD;
> -                       nr_good_pages--;
> +                       si->pages--;
>                 }
>         }
>
> -       if (nr_good_pages) {
> -               swap_map[0] =3D SWAP_MAP_BAD;
> -               si->max =3D maxpages;
> -               si->pages =3D nr_good_pages;
> -               nr_extents =3D setup_swap_extents(si, span);
> -               if (nr_extents < 0)
> -                       return nr_extents;
> -               nr_good_pages =3D si->pages;
> -       }
> -       if (!nr_good_pages) {
> +       if (!si->pages) {
>                 pr_warn("Empty swap-file\n");
>                 return -EINVAL;
>         }
>
>
> -       return nr_extents;
> +       return 0;
>  }
>
>  #define SWAP_CLUSTER_INFO_COLS                                         \
> @@ -3217,7 +3204,7 @@ static struct swap_cluster_info *setup_clusters(str=
uct swap_info_struct *si,
>          * Mark unusable pages as unavailable. The clusters aren't
>          * marked free yet, so no list operations are involved yet.
>          *
> -        * See setup_swap_map_and_extents(): header page, bad pages,
> +        * See setup_swap_map(): header page, bad pages,
>          * and the EOF part of the last cluster.
>          */
>         inc_cluster_info_page(si, cluster_info, 0);
> @@ -3354,6 +3341,15 @@ SYSCALL_DEFINE2(swapon, const char __user *, speci=
alfile, int, swap_flags)
>                 goto bad_swap_unlock_inode;
>         }
>
> +       si->max =3D maxpages;
> +       si->pages =3D maxpages - 1;
> +       nr_extents =3D setup_swap_extents(si, &span);
> +       if (nr_extents < 0) {
> +               error =3D nr_extents;
> +               goto bad_swap_unlock_inode;
> +       }
> +       maxpages =3D si->max;

There seems to be a trivial problem here, previously the si->pages
will be seen by swap_activate after bad blocks have been counted and
si->pages means the actual available slots. But now si->pages will be
seen by swap_active as `maxpages - 1`.

One current side effect now is the span value will not be updated
properly so the pr_info in swap on may print a larger value, if the
swap header contains badblocks and swapfile is on nfs/cifs.

This should not be a problem but it's better to mention or add
comments about it.

And I think it's better to add a sanity check here to check if
si->pages still equal to si->max - 1,  setup_swap_map_and_extents /
setup_swap_map assumes the header section was already counted. This
also helps indicate the setup_swap_extents may shrink and modify these
two values.

BTW, I was thinking that we should get rid of the whole extents design
after the swap table series is ready, so mTHP allocation will be
usable for swap over fs too.

>         /* OK, set up the swap map and apply the bad block list */
>         swap_map =3D vzalloc(maxpages);
>         if (!swap_map) {
> @@ -3365,12 +3361,9 @@ SYSCALL_DEFINE2(swapon, const char __user *, speci=
alfile, int, swap_flags)
>         if (error)
>                 goto bad_swap_unlock_inode;
>
> -       nr_extents =3D setup_swap_map_and_extents(si, swap_header, swap_m=
ap,
> -                                               maxpages, &span);
> -       if (unlikely(nr_extents < 0)) {
> -               error =3D nr_extents;
> +       error =3D setup_swap_map(si, swap_header, swap_map, maxpages);
> +       if (error)
>                 goto bad_swap_unlock_inode;
> -       }
>
>         /*
>          * Use kvmalloc_array instead of bitmap_zalloc as the allocation =
order might
> --
> 2.30.0
>

Other than that:

Reviewed-by: Kairui Song <kasong@tencent.com>
