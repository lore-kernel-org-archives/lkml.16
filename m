Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659388460
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 02:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745806549; cv=none; b=Nno3hYTC7k03FmQzlcOeLAVrHKEJKJstkSQ2Y6aMHCD+R9w914xYn1mpLChqhUijQgqYjfnsUD/w0AEk3sI3AwVBWrGs5w5cZ+la8jlpuC0r2kWPo9t2RJTmQ8cil3d6i2CSp2Vhf+m7vfvOyzBfRmZAz9pVn2cecayv/gkeK7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745806549; c=relaxed/simple;
	bh=mkfihHhDzMu1yOTFNsK8BI5As0FFvPyJ9uW5xzFEOEM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bHjNCkB4mfWkwBL0fJdbh4RS+ftCncNOt15Gx3Xxrk9TfRzCZKldnMHgnxMxgHIOdCoIMMFMZmCPNi4KB9exzNps9nzSTTqCQh/9gUuCXtWERV//aPV+gYkp6fXpDdO6+TAmjCk4KtR06BH5nhlJ/kmEIxrCbaRt1DArrfxHbAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kg0b0+n+; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kg0b0+n+"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30bf5d7d107so35557601fa.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 19:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745806545; x=1746411345; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jQ3SWGn27BCwgTlwVuWoagqo48udMIdPe40yMeKOuL0=;
        b=Kg0b0+n+jsLFeWE8H3lXjW6R7YTK4QRHAAL1ACRBPeukl7HNskgObnLkVI5H3c98cS
         FhoOPd078THVhFkGTB3PUDtMKFqw85jvd4pN9sq/qDlcXvpHiTpo9LyHMIxXhTlsRbTj
         549LGa7BYUrhpD7XhkHIUZXXRsUup+po9uOnF+bGbK07c2M+JI60O9jj7ix1DLa1fH5j
         zXE9F55YkcZr1lcHCn2+7EUHzGKlKmcBdv5NB7HJaPUF2psLgIsogq3v78pFWEBFzSeO
         TmEyseG6PiH7VOXZIMUMetRuGcFMaBgeLlVzg7HS1R7svUjnqWFOE86XpVuzW+uSQzye
         OZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745806545; x=1746411345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jQ3SWGn27BCwgTlwVuWoagqo48udMIdPe40yMeKOuL0=;
        b=EgOTRkbnpnfK0dvEcH3ofxCyilPQj6ol0ScTAXhj3ALXn6GAv8DBGZ3E9lPo+xJIqn
         D+vTWHSK6lJGCtl/sc7W5iTQj6YQhcTPXURwRNZqhDqrtcyqlHww8YWuqM4RuiMQrkDj
         I0dTI7Cd+fdjjzJ3gaWKIegYTeTQlW1yoJg/frWGV68ubuJ7M0XJFRtDOBwPSa66DfrH
         T6Wz4BkRA39lxBT7m9eHiCoGoueCig9tJyX/LSwGf17crEefDWR/Q85kgBgsIYGgzfWW
         AW6xDmXSVSZ/g4S3YZYTvf/Q4hPidCse9wWC9TvEMZWLxYy4QzVpmIHaqAIeDiZSKDpu
         6r4w==
X-Forwarded-Encrypted: i=1; AJvYcCUSaSPO8MN9BqG1gEIxChU9Z6Nfjep48fJ12lHGwBT5IALXucVJYT/YxEnhOVkMHF50Hzii4Sl8kHp78bg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+ZEstzeDE+Sp4FCy6hvPaeqbmxsijRF0Rc0mzmSrGhYWu41yt
	ZsFVYZ7P8xjrCWRh9gxIPZh4ng83NpOywWwuS5fDDb5clpwKIgjanfJfnAS6gkXP/US9QpihMCa
	EkV40Hh6QrY9Fmd9oqYP0yLyZVzg=
X-Gm-Gg: ASbGncvq+d0XKcMsqKzKtSgM+CEo4P4ykaYVYZqGxpMxhKcF2lFGger0YdMVTmntbFw
	qTYEy0eQs2vONAWsGYzzCtkdEseNB/180p9QLiwy2ppN0kO3AzZS6t0+kj5F64Ci6zvxFz1wh8y
	lEgkxOHK8vorfOTyHw/4BdDA==
X-Google-Smtp-Source: AGHT+IG7UEnKhmPX+T19gOKipnSGym71p6ZlEfKrJBpXtksc/IGjLyEnGyNHwrp/yB99kgRbdAkVwlfdHrJjXVhJiuw=
X-Received: by 2002:a2e:a362:0:b0:31a:ba1:2387 with SMTP id
 38308e7fff4ca-31a0ba1259dmr13521411fa.31.1745806545244; Sun, 27 Apr 2025
 19:15:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250427185908.90450-1-ryncsn@gmail.com> <20250427185908.90450-4-ryncsn@gmail.com>
 <aA7OuBS___7N4o8f@casper.infradead.org>
In-Reply-To: <aA7OuBS___7N4o8f@casper.infradead.org>
From: Kairui Song <ryncsn@gmail.com>
Date: Mon, 28 Apr 2025 10:15:28 +0800
X-Gm-Features: ATxdqUHA3mEQSXKaITqXynHJs1t56sCX-IGuXPrMu1ZBnnGmrsOauHofJ02bpR8
Message-ID: <CAMgjq7A-mO0vs3ZX1m9i+dPSuSURwJUWL-03dMzGbbwkj_mHjA@mail.gmail.com>
Subject: Re: [PATCH 3/6] f2fs: drop usage of folio_index
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Hugh Dickins <hughd@google.com>, Chris Li <chrisl@kernel.org>, 
	Yosry Ahmed <yosryahmed@google.com>, "Huang, Ying" <ying.huang@linux.alibaba.com>, 
	Nhat Pham <nphamcs@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>, linux-kernel@vger.kernel.org, 
	Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
	linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 8:41=E2=80=AFAM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Mon, Apr 28, 2025 at 02:59:05AM +0800, Kairui Song wrote:
> > folio_index is only needed for mixed usage of page cache and swap
> > cache, for pure page cache usage, the caller can just use
> > folio->index instead.
> >
> > It can't be a swap cache folio here.  Swap mapping may only call into f=
s
> > through `swap_rw` and that is not supported for f2fs.  So just drop it
> > and use folio->index instead.
> >
> > Signed-off-by: Kairui Song <kasong@tencent.com>
> > Cc: Jaegeuk Kim <jaegeuk@kernel.org> (maintainer:F2FS FILE SYSTEM)
> > Cc: Chao Yu <chao@kernel.org> (maintainer:F2FS FILE SYSTEM)
> > Cc: linux-f2fs-devel@lists.sourceforge.net (open list:F2FS FILE SYSTEM)
> > Signed-off-by: Kairui Song <kasong@tencent.com>
>
> Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
>
> > @@ -130,7 +130,7 @@ int f2fs_read_inline_data(struct inode *inode, stru=
ct folio *folio)
> >               return -EAGAIN;
> >       }
> >
> > -     if (folio_index(folio))
> > +     if (folio->index)
> >               folio_zero_segment(folio, 0, folio_size(folio));
> >       else
> >               f2fs_do_read_inline_data(folio, ipage);
>
> This hunk is going to conflict with a pair of patches I sent to f2fs-deve=
l
> a few weeks ago.  I don't think there's any escaping it, just a heads-up.
>

Thanks for the info, this patch is just converting folio_index to
folio->index so conflict should be easy to resolve I think? I can do a
rebase later if that series is merged first.
