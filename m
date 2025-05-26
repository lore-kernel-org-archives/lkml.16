Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAF11F1921
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 09:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748253282; cv=none; b=tu96LC88DteMsxyPx8tBZ6XiqLrkBo2BpLpw04uApIXKIL58BM9jk99lI0rZCaQnLc9GUszxm0Xb6O+qFi/ccWQDE+Uthi8YCjLvKzVzbLbbVY9NKZPFtnROi6Rtmt5yIDv4B56xFDXUwQW2qo4pT9BxPZVn2njPUXFYg5A4vfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748253282; c=relaxed/simple;
	bh=kD211Oy2EHW/gbr+iQCEUkM/lwARmu9Fp6jVXRBFF74=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LAQNyQ1OzzWG97GH3AF/5pRQtg5yMPaKkGLDZRTVNi+zHNJxLz9w5H0FsI3LANu6oabFFhlhOyI7Nx2prvdlG5FVqoyVAj4KeGoYL9EZL5CSzxKmeCIT/oj/nJZ8wO7q3ieV9AX6KhhwN+RbHLCmLyNx0kGn2vsmGQxYLDmnrro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G8ceGO8y; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G8ceGO8y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748253279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rbkf5SXMEt07fFLjzJMCpshPrtgBoRho3TpNiZRvX78=;
	b=G8ceGO8yUeTK7smI23EMaY43TYqWTOrYshsnH5WY3crGjAbIsg8CXkVEtRRNBR5si6UmWa
	WawQTibg5vQQjJHSda1vSfQOtFMgTz8LbLgcSsxRAazRZmDjnasN4c4lG3Q6rmE5/FqKd6
	tu0tN0pXS/0pcwmcH/7xj1cC1QRGPdo=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-91-u6s2cJZmNlyNaq3AMXEpwA-1; Mon, 26 May 2025 05:54:37 -0400
X-MC-Unique: u6s2cJZmNlyNaq3AMXEpwA-1
X-Mimecast-MFC-AGG-ID: u6s2cJZmNlyNaq3AMXEpwA_1748253276
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-5532369bde4so308026e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 02:54:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748253276; x=1748858076;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rbkf5SXMEt07fFLjzJMCpshPrtgBoRho3TpNiZRvX78=;
        b=g+JU4bkBrc8rOqJ61f2x5DjrahVjuq+Ex85lqlxCrjZd9gDrL4r89VVbTEPaYLEp08
         iBjZe9kmybrieeiHTBD04RtUQcpIzsJIY92EsU3Z7sYTuzR6tRb5NBuawAdsfJ3RjmPm
         6KpOgjHttfFJS9UVL4V5mbZbeRwpLtuY0/5QQ57OfO6NSRe2oZQUUKNQalDvd9pbtmQh
         UJO/Ckm9ZZT/+fuYQjy8nWgvzqDvxpCZd8FlZvJEjzYiR2YoX+bClKPFn0bBTixfmsF3
         dZXUBG7j4bqvCpnP4547iuzbK5lDATi3WYDYQlefvgPAYr2uluFUZDzHfY0v9EVud50I
         /pww==
X-Forwarded-Encrypted: i=1; AJvYcCUZH2ws/BcLoV8fMUbmVMrLVj+UalP+NyPzP8yDBnod71P21hxP0i22BCR7GuJuNeGnpTmOaxtfd3Dvbjk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUpjYoaF1d+Pyfvj5XLfX0OhYYswRCZ7J2JBCgPlmmHsVjDpOS
	8xfARlbdzD1EKLFqRtLglIQkMunIAzPIv1Y0o22GbPHI722fSfa87K7nUTz9BcWrFXU1X1t+tRo
	+1SPGKcgJOS+k8EieDkcd28cAVws5URp/aiuGnzhQo7J7exvT736vuVQQG99Uz7tKhA==
X-Gm-Gg: ASbGncsfE8I0PVNhjrxG/RzVlxFb2G67yjMTT9MLZOO1U9pfkJ2V9BOBojBwNiAIy2i
	ViwEonVlDmgPXDFbpjI9Xd2dB0B8vG7jRdt2ikVxAVSBHV/EbDL2ENXiX1ez1FM4Wxx+8MAIf6L
	CpiHqo9ddH6msaH82kndnNPYHWkB5ZsT/SyEF3pDx+RhPl/1c66GBAxDOC4Ylm5TpoHwbQOzDsf
	ouLM+ZFNqF6kuR3jUoF6K732eGDAhbmoGAzd/xeDljKsVQkXp9MiaGpb3R3+WkdPzmZqO59b09N
	VLFky076
X-Received: by 2002:a05:6512:4150:b0:552:20e1:ee25 with SMTP id 2adb3069b0e04-55220e1ef6amr937493e87.55.1748253275973;
        Mon, 26 May 2025 02:54:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkPECe1NVeXWiPUcDqM4DGhgBrZ5f5uYScFTI8314epzyCSBb2KXwKVqpiQCkibcuen2wvqA==
X-Received: by 2002:a05:6512:4150:b0:552:20e1:ee25 with SMTP id 2adb3069b0e04-55220e1ef6amr937461e87.55.1748253275480;
        Mon, 26 May 2025 02:54:35 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532503cd79sm84170e87.207.2025.05.26.02.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 02:54:34 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id BF6291AA3EFC; Mon, 26 May 2025 11:54:33 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Byungchul Park <byungchul@sk.com>
Cc: Mina Almasry <almasrymina@google.com>, willy@infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 kernel_team@skhynix.com, kuba@kernel.org, ilias.apalodimas@linaro.org,
 harry.yoo@oracle.com, hawk@kernel.org, akpm@linux-foundation.org,
 davem@davemloft.net, john.fastabend@gmail.com, andrew+netdev@lunn.ch,
 asml.silence@gmail.com, tariqt@nvidia.com, edumazet@google.com,
 pabeni@redhat.com, saeedm@nvidia.com, leon@kernel.org, ast@kernel.org,
 daniel@iogearbox.net, david@redhat.com, lorenzo.stoakes@oracle.com,
 Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, horms@kernel.org,
 linux-rdma@vger.kernel.org, bpf@vger.kernel.org, vishal.moola@gmail.com
Subject: Re: [PATCH 12/18] page_pool: use netmem APIs to access
 page->pp_magic in page_pool_page_is_pp()
In-Reply-To: <20250526094305.GA29080@system.software.com>
References: <20250523032609.16334-1-byungchul@sk.com>
 <20250523032609.16334-13-byungchul@sk.com>
 <CAHS8izN6QAcAr-qkFSYAy0JaTU+hdM56r-ug-AWDGGqLvHkNuQ@mail.gmail.com>
 <20250526022307.GA27145@system.software.com>
 <20250526023624.GB27145@system.software.com> <87o6vfahoh.fsf@toke.dk>
 <20250526094305.GA29080@system.software.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Mon, 26 May 2025 11:54:33 +0200
Message-ID: <87ldqjae92.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Byungchul Park <byungchul@sk.com> writes:

> On Mon, May 26, 2025 at 10:40:30AM +0200, Toke H=C3=B8iland-J=C3=B8rgense=
n wrote:
>> Byungchul Park <byungchul@sk.com> writes:
>>=20
>> > On Mon, May 26, 2025 at 11:23:07AM +0900, Byungchul Park wrote:
>> >> On Fri, May 23, 2025 at 10:21:17AM -0700, Mina Almasry wrote:
>> >> > On Thu, May 22, 2025 at 8:26=E2=80=AFPM Byungchul Park <byungchul@s=
k.com> wrote:
>> >> > >
>> >> > > To simplify struct page, the effort to seperate its own descripto=
r from
>> >> > > struct page is required and the work for page pool is on going.
>> >> > >
>> >> > > To achieve that, all the code should avoid accessing page pool me=
mbers
>> >> > > of struct page directly, but use safe APIs for the purpose.
>> >> > >
>> >> > > Use netmem_is_pp() instead of directly accessing page->pp_magic in
>> >> > > page_pool_page_is_pp().
>> >> > >
>> >> > > Signed-off-by: Byungchul Park <byungchul@sk.com>
>> >> > > ---
>> >> > >  include/linux/mm.h   | 5 +----
>> >> > >  net/core/page_pool.c | 5 +++++
>> >> > >  2 files changed, 6 insertions(+), 4 deletions(-)
>> >> > >
>> >> > > diff --git a/include/linux/mm.h b/include/linux/mm.h
>> >> > > index 8dc012e84033..3f7c80fb73ce 100644
>> >> > > --- a/include/linux/mm.h
>> >> > > +++ b/include/linux/mm.h
>> >> > > @@ -4312,10 +4312,7 @@ int arch_lock_shadow_stack_status(struct t=
ask_struct *t, unsigned long status);
>> >> > >  #define PP_MAGIC_MASK ~(PP_DMA_INDEX_MASK | 0x3UL)
>> >> > >
>> >> > >  #ifdef CONFIG_PAGE_POOL
>> >> > > -static inline bool page_pool_page_is_pp(struct page *page)
>> >> > > -{
>> >> > > -       return (page->pp_magic & PP_MAGIC_MASK) =3D=3D PP_SIGNATU=
RE;
>> >> > > -}
>> >> >=20
>> >> > I vote for keeping this function as-is (do not convert it to netmem=
),
>> >> > and instead modify it to access page->netmem_desc->pp_magic.
>> >>=20
>> >> Once the page pool fields are removed from struct page, struct page w=
ill
>> >> have neither struct netmem_desc nor the fields..
>> >>=20
>> >> So it's unevitable to cast it to netmem_desc in order to refer to
>> >> pp_magic.  Again, pp_magic is no longer associated to struct page.
>> >
>> > Options that come across my mind are:
>> >
>> >    1. use lru field of struct page instead, with appropriate comment b=
ut
>> >       looks so ugly.
>> >    2. instead of a full word for the magic, use a bit of flags or use
>> >       the private field for that purpose.
>> >    3. do not check magic number for page pool.
>> >    4. more?
>>=20
>> I'm not sure I understand Mina's concern about CPU cycles from casting.
>> The casting is a compile-time thing, which shouldn't affect run-time
>
> I didn't mention it but yes.
>
>> performance as long as the check is kept as an inline function. So it's
>> "just" a matter of exposing struct netmem_desc to mm.h so it can use it
>
> Then.. we should expose net_iov as well, but I'm afraid it looks weird.
> Do you think it's okay?

Well, it'll be ugly, I grant you that :)

Hmm, so another idea could be to add the pp_magic field to the inner
union that the lru field is in, and keep the page_pool_page_is_pp()
as-is. Then add an assert for offsetof(struct page, pp_magic) =3D=3D
offsetof(netmem_desc, pp_magic) on the netmem side, which can be removed
once the two structs no longer shadow each other?

That way you can still get rid of the embedded page_pool struct in
struct page, and the pp_magic field will just be a transition thing
until things are completely separated...

-Toke

