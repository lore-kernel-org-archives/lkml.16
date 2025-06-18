Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C13E28F5
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 07:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750231386; cv=none; b=diVH8VwUmvw8Dt8/p/bVQy3x3l18xjCJ3wyzEj0OHmzcwVG/mwyK+qfArf2EJVJsDgEkTBeBJSDFgGMQyJOZlByCPyCMutFuzsXQKiwWcJFfHQqXohMFVKdMdku62u/J490TJlpp7kC5/PpZRdJrSCKf4CuIX2WA3mrYVemBFIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750231386; c=relaxed/simple;
	bh=LWPblzHcUZO8aHruwRQ+bN/8y1uT3NNqyfkqgxSd40w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tTFUe/4Gv2Vh3P4w5fM4hO0ZpbB42Hni0n+/lGBAK9J0ZT6T6rUfReL0jMeGwlAHmWVHoQBCluA3FA99cbd8uoIa0Zlx6sQPHHMrxDqyZC7aXab6fUtzIZlVRVckMpmfxam47PnWmCBXlStDSgH698CA6NVVcQdPQAeUPX7pNPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FsrsTRZS; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FsrsTRZS"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-310447fe59aso69546871fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 00:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750231382; x=1750836182; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1YXATzCsfCLxnqFp7tGFkz9QRS5mCSR0gWU9uHVqyLM=;
        b=FsrsTRZSh0C7EIYy7jk7dmMm5idS4tbiHr6ohG1j+ylVTSqMsBZabsMIM3hRwPhef+
         D+zIE5SrOMA1l5Lp+UjDNYytm9XB2JRJSPMRYwdGqgzUfqFR2wwtd9XUOYAcVntxFzpZ
         UwTSwAlWoL0Lrmr8VDxLXGBF2xi3bp3N+5WUWT8LQx+iO8qXJ5CBS6HrRRwz4sTLPkg6
         myvcaHhNpVNI2De03GHDDXlky8r6O7czhUOgkGymGsKM5v7RFJ9Ix4zEiuPlt2m4gjsH
         Kx71cntlkNhHGxAS2S969K31ujxZK26SVytiQRUyF7RwpZYQ074Fm9s0M7c/rTCse7M0
         So+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750231382; x=1750836182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1YXATzCsfCLxnqFp7tGFkz9QRS5mCSR0gWU9uHVqyLM=;
        b=H2GCqDtBRldU8qyXszOyahfpv++M7WhS1GJOuc8dkrFiuEPVfQnVM4OrdANUmXMazp
         qDR9X0YnA8nLGRSv+SGvUgajrL5BBjqVnAGd2XhjHmWm2U8BTIJsaNVlOvG3rX9B1Bzl
         k9mjGfQHyHYfXGqiEOcCKqB3oH3uilGEkpAeHrxKqczt2SQ0FFc0VcZX2mv+k66cfBfD
         rOI4ofxVWvXZhsLKhlJqszYxNQFdNqhPECEJDrHyNlvuoU059fi3G3eB+6joA9/d23jn
         +t7MsaKVi8gH+Tt8B0IGmHEC+n4zMHQeWNa+rOHJ4hbSCQ68ZQX2XqKKlvUxfd6o/DgQ
         t97A==
X-Forwarded-Encrypted: i=1; AJvYcCWK3FCuDxssbj+fSELNV9MBd9OslcBGAoMsh+0OJg5orYl531Rwk6RZrq7RbaIz75kXxsCi4C/s6kYE428=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbo5j9LVDaOTOn3YQV8tV9SkyhcVrboTV/Qrd+HVf2xuFl+2T8
	s9mZN0ZMjtwa7Atp0HSTaOpF+39vnuFfouPCO5YdYIiUDglLePLFowm1oF4opN/QnWSfbC2gqnh
	i/uN7+eX4YEiBwMM/8R2S2KSS8T2XWss=
X-Gm-Gg: ASbGncuTfQYjEziEC3JFTRJPFbmlNlLI43XVYiKm4zmoJ8IMIYEE7gAEuOtCWQXRmbx
	SenqvH1F2iJumbN3hv9HkXTyh6yb3BuQZIMKQqXeEmCgJVF5mD7xVa3s7lW1k6luVn+i3M82y7+
	34YK/25ICUK72zehv4b/xO4AuOwCZf4mtP1TpbI7ItSqk=
X-Google-Smtp-Source: AGHT+IHSN2R9fQh0yj5PkzqCGz5w5B5CbKOWeSaCELf/IqOZOfEcdyQYIfEPjt48z0kNcsNXT4Q+oaa8+PA9aDwU42o=
X-Received: by 2002:a05:651c:546:b0:32a:7a12:9286 with SMTP id
 38308e7fff4ca-32b4a5d9b09mr44605481fa.31.1750231382220; Wed, 18 Jun 2025
 00:23:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617183503.10527-1-ryncsn@gmail.com> <20250617183503.10527-3-ryncsn@gmail.com>
 <c9503955-36a0-48eb-aa4c-73a85b2da2ca@arm.com>
In-Reply-To: <c9503955-36a0-48eb-aa4c-73a85b2da2ca@arm.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Wed, 18 Jun 2025 15:22:44 +0800
X-Gm-Features: AX0GCFvLPhbbBuiIVjeNxyLFjBm4UxtNl9e06S--OExxrdUKkphBuDWeGdwqU8k
Message-ID: <CAMgjq7BmJ1fqWsDgkbiCt++_uA1D0kxfDOdKVjtHCS9Y4jfKWg@mail.gmail.com>
Subject: Re: [PATCH 2/4] mm/shmem, swap: avoid redundant Xarray lookup during swapin
To: Dev Jain <dev.jain@arm.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Matthew Wilcox <willy@infradead.org>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Chris Li <chrisl@kernel.org>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, 
	Barry Song <baohua@kernel.org>, linux-kernel@vger.kernel.org, 
	Ryan Roberts <ryan.roberts@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 3:17=E2=80=AFPM Dev Jain <dev.jain@arm.com> wrote:
>
>
> On 18/06/25 12:05 am, Kairui Song wrote:
> > From: Kairui Song <kasong@tencent.com>
> >
> > Currently shmem calls xa_get_order to get the swap radix entry order,
> > requiring a full tree walk. This can be easily combined with the swap
> > entry value checking (shmem_confirm_swap) to avoid the duplicated
> > lookup, which should improve the performance.
>
> Nice spot!
>
> >
> > Signed-off-by: Kairui Song <kasong@tencent.com>
> > ---
> >   mm/shmem.c | 33 ++++++++++++++++++++++++---------
> >   1 file changed, 24 insertions(+), 9 deletions(-)
> >
> > diff --git a/mm/shmem.c b/mm/shmem.c
> > index 4e7ef343a29b..0ad49e57f736 100644
> > --- a/mm/shmem.c
> > +++ b/mm/shmem.c
> > @@ -505,15 +505,27 @@ static int shmem_replace_entry(struct address_spa=
ce *mapping,
> >
> >   /*
> >    * Sometimes, before we decide whether to proceed or to fail, we must=
 check
> > - * that an entry was not already brought back from swap by a racing th=
read.
> > + * that an entry was not already brought back or split by a racing thr=
ead.
> >    *
> >    * Checking folio is not enough: by the time a swapcache folio is loc=
ked, it
> >    * might be reused, and again be swapcache, using the same swap as be=
fore.
> > + * Returns the swap entry's order if it still presents, else returns -=
1.
> >    */
> > -static bool shmem_confirm_swap(struct address_space *mapping,
> > -                            pgoff_t index, swp_entry_t swap)
> > +static int shmem_swap_check_entry(struct address_space *mapping, pgoff=
_t index,
> > +                               swp_entry_t swap)
>
> I think the function name shmem_confirm_swap is already good enough? Anyh=
ow the
> changed name should at least be shmem_check_entry_is_swap.
>

Good, I can keep the function name unchanged or follow your
suggestion, I thought a `confirm` function returning non-binary return
value may look strange. I'm terrible at naming things :P
