Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008551DE3C1
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 16:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747153629; cv=none; b=qBnkDuE10j48KSemFo9e7/iRGd9e82KvA2gWB+jM+burLF4R0OyuWJ2FsnKaIuz3i0Iwv0N221QoOtH61jaV+83c49aBDIsJ4G6U/9ecl8BA2I07K9J/cRiJRjD3E1k1znZp9s1B/YlZEaTF7HoqERNvs79JxDJL+zJeSgh0To0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747153629; c=relaxed/simple;
	bh=f11xxpBqASoIBdV7J+tFpMepaDu3cmruvi34LaWekeQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=av8LmWV89DvvSNM9MO42ZJJLdBz0ACOmggr60c4bX9v7GBsFDiip47TH04YLfa1BhdhZsOLiKFWN0Dy7l3PUKcfV+9hedUqCrQ7Zn+NLw3FIhbn3F/PeqNCnR+m9uU6c/Ap9eeiwYdI7xcot3Ult5eXHYurRqWpLfTiy5hR0Fzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pYFprkFm; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pYFprkFm"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-47666573242so221cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 09:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747153627; x=1747758427; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NuQTz0TAR0J0k0d+kCbHLEjYkbcSIL6zDuG3L4sBNQ8=;
        b=pYFprkFmTVWiK5IEwO9dD2rJqtjdCjbpSOr48W7x6kgM2TRaUCILbRgeWPeXLUZGup
         3bo8f8Kk7IIl6Jq2OevhVGGIQFukgydBdwO0BrD+kRrHN3px6aQIOhl96rfBFKDv4u3Y
         AsD1/75oZ77s9No72ynlwzESZrApDK3PwSivEEtBUfWeV4K8uIdi97JVT+Nu53g02oNl
         Dk+x5b7Oei4hZ5lYjUtcbC60D9IzsYOQdXic2a+a4gGGmo1KrsdvJUSlZRbF7u8wznSv
         jG9GG/5BgE7y8v26uj2Nqo/hhipqpCQuInanr+zYGWM8/wk2owjGNiumwS7Utw/JXgLK
         trig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747153627; x=1747758427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NuQTz0TAR0J0k0d+kCbHLEjYkbcSIL6zDuG3L4sBNQ8=;
        b=Sg+Y29MydO7lCs+uAjTqgOBRST5Uk4Psbl+wM+RDQy7Pfoax2u3SUIaw8jrAB2Jbgb
         CL3m6sxtwYWu9kujw+Mca4m44KsRub+VoBaPJhY2Csuw/NL8TOmTiT1w5dT4b3RFTqr1
         XTdUyEPlTpWkZf5P/UVc0fEUMoS1eQOItn8zVPjPETSMkgTjLN0tHcIAhOICe4t2QRIc
         +zYaZw+e4gMWn8TgYqLdjgNNkwlBVEyVDo62VyKTqcfXzM1MnqbZ0K1UFGyjPjjo2Hhs
         hfiPHOVcNPEwK3UXkF72KK7X6atndkCBRa/GC3y4MrmL9Qg4Tp57Lwj5IszLk1KESZQK
         Zikg==
X-Forwarded-Encrypted: i=1; AJvYcCXNY9cRgGm7S6NEFt/YEGO2ZHYcUfu2MobU0tvFZkdcHjQcKBbusE6vyJ41eNIunI3rGJmUqwJD0uupdVo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJGq30gEwMLRhbRBTVbmfACq2HpkxcrCG47NSVzzM3Pb6xvPr9
	jHxq38tXxU88BRT1FDimoZPUP7rS+F/NhlH2ZWAAfZpInE/IcU1aXeWibT5QAuNWm7GkwkaPl6M
	K0XE8fejs8GK0tE3leIyIG6BAT6jpBQuBnOixg3wb
X-Gm-Gg: ASbGncttoNb8t99AuQOyjXX/PSRheCdV3rv+MS1nNVeRs7s0Kn3yaZ+a2LNnto8F2yu
	0TmLpwvFkAEUD3y0TM5q6GzNgkyqM+D9MzTxsoMiv0a9ZD0ZRLrcTrIxe5RruXBZqg3K9BrKS/P
	IuSOwfQ8C6BDQIpA0a4Ieqpz4gcO+Cy9d2P8+ITDN9R7FqVg/y1/sqBBtLlZu7
X-Google-Smtp-Source: AGHT+IGX7Kqbc/9iS6oAhft81hs/6vUWLIjSWsLx/2g2xLA2lhit/YesUfUX8TJwqOvXCB7ryvQgeS0j4JHMcc4+Cdg=
X-Received: by 2002:a05:622a:190a:b0:477:1f86:178c with SMTP id
 d75a77b69052e-494880f4d18mr4807641cf.26.1747153626350; Tue, 13 May 2025
 09:27:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416082405.20988-1-zhangtianyang@loongson.cn>
 <aAYXP4f417_bx6Is@harry> <025e3f51-2ab5-bc58-5475-b57103169a82@loongson.cn>
 <20250422171116.f3928045a13205dc1b9a46ea@linux-foundation.org>
 <CAJuCfpHbXmjAr2Rt0Mo_i32hpGOyXnVtXUd4qFjXriH9eYFDkQ@mail.gmail.com> <20250510200740.b7de2408e40be7ad5392fed9@linux-foundation.org>
In-Reply-To: <20250510200740.b7de2408e40be7ad5392fed9@linux-foundation.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 13 May 2025 09:26:53 -0700
X-Gm-Features: AX0GCFt6vJVoKJRdrVpwo3tcFnZXDX33w-FdV7zGJCqzg0tjXGvAgkiCFXMIJ4E
Message-ID: <CAJuCfpFdC6hgFSPy3M2sagkFobWeCuxLdcWiyV5pnzB55dgjZg@mail.gmail.com>
Subject: Re: [PATCH] mm/page_alloc.c: Avoid infinite retries caused by cpuset race
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Tianyang Zhang <zhangtianyang@loongson.cn>, Harry Yoo <harry.yoo@oracle.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>, 
	Michal Hocko <mhocko@suse.com>, Brendan Jackman <jackmanb@google.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 10, 2025 at 8:07=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Tue, 22 Apr 2025 17:22:04 -0700 Suren Baghdasaryan <surenb@google.com>=
 wrote:
>
> > On Tue, Apr 22, 2025 at 5:11=E2=80=AFPM Andrew Morton <akpm@linux-found=
ation.org> wrote:
> > >
> > > On Tue, 22 Apr 2025 20:10:06 +0800 Tianyang Zhang <zhangtianyang@loon=
gson.cn> wrote:
> > >
> > > >
> > > > ...
> > > >
> > > > >>
> > > > >> Simultaneously starting multiple cpuset01 from LTP can quickly
> > > > >> reproduce this issue on a multi node server when the maximum
> > > > >> memory pressure is reached and the swap is enabled
> > > > >>
> > > > >> Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
> > > > >> ---
> > > > > What commit does it fix and should it be backported to -stable?
> > > > >
> > > > > There's a new 'MEMORY MANAGEMENT - PAGE ALLOCATOR' entry (only in
> > > > > Andrew's mm.git repository now).
> > > > >
> > > > > Let's Cc the page allocator folks here!
> > > >
> > > > We first identified this issue in 6.6.52-stable , and through root =
cause
> > > > analysis,
> > > >
> > > > it appears the problem may have existed for a significant period.
> > > >
> > > > However It is recommended that the fix should be backported to at l=
east
> > > > Linux kernel versions after 6.6-stable
> > >
> > > OK, thanks,
> > >
> > > This has been in mm-hotfixes-unstable for six days.  Hopefully we'll
> > > see some review activity soon (please).
> >
> > I reviewed and provided my feedback but saw neither a reply nor a
> > respin with proposed changes.
>
> OK, thanks.  Do you have time to put together a modified version of this?

I think the code is fine as is. Would be good to add Fixes: tag but it
will require some investigation to find the appropriate patch to
reference here.
