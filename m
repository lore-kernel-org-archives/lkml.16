Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AAD18024
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 11:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749554464; cv=none; b=Ek5kCFcLnufl1yvGAHR7bzKb8AVukSEWwaw8yRcNRk0tkovSuw6Rboj1Qtx77E05awS2Yk3phSgSKbAV2MlU0oo9XWvOqKJke/RG7QraW5rpuz8lIvuVmlQppACtM4lpOGLt6U8UB7hhn79NrIb4/4fC/QL57w+ZIRAe80cpsXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749554464; c=relaxed/simple;
	bh=eiVe0V/eboS++dzPzJlI58twwnfED8FB58Ek1LHy3JI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DGXPrT3zni4MMf8jDffZ2cZ9vkHOSOaEQWkAh7E4yFQiWouNMw/ZH2hGTnDvHKqi9duS/liQ1mx+n254dl2A9LfIn5OGkt69hvCO9VlROMEfpcr9dJcjN61j8cP6aVpgRDipmjsh7YNiM7mku9hp0UZ9Q61EEzmLLb4RvM+WctY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=TN2rJSeJ; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="TN2rJSeJ"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4a5903bceffso68531771cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 04:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1749554461; x=1750159261; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hr6vkvNJmo2xkK9euicJYSo2Erx9EUnaEaDLPPm5ZFw=;
        b=TN2rJSeJ8VYaezM6XBHEBmPIGJDvaAZbJt/0FsEbpo6hcxa2JX8XrkEXYrvoETAML8
         YmNOfDK9n7rHt+lav0GipcoXWkJut3vPdcN5KOTD4SVY9UzxgxaNdw5FhRXw56koLgVY
         rE1f6w7GJeslOEVmVyX5xzg4qprv0Aplm5e/GQ2cvnn6vCPmGt91XEo0qwWQIXWtNse/
         seW3uXZALdPIKJr4nv4jkJjWAfYjf5p5EQ1U14+V+Le+vJDtL0Nxb7uESwjcdEVAcTE8
         f12HDuSHxM2E9vsxkn2EqYBHPJ/1WdNAAB79CjYHjMYqMg9WQqR7mjizmgsO6IbxLPXv
         DiSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749554461; x=1750159261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hr6vkvNJmo2xkK9euicJYSo2Erx9EUnaEaDLPPm5ZFw=;
        b=HHMa0xj3puuXqniMdFxvmLG9pAlyCjBObGhhsJlJApyQqHus7WqGi49xXFWSNZkEii
         Zj6qhM8LhJzPmR3vWOvOTxAuBDmTC/o4qRJCNB8bbqdvyl6PyiTXftXgqddn84lMwEB6
         e6hTVLHXhp0UM68ympM8NkT1IP2rx+k/ukfsIWtJ6T+6qUvEC8XP/1tpVSBDGqKssztQ
         WlsauSEFqMBg+C5T3x0Kq5rB3gL4hJ3TeWo+6+JLbwO2fY9jhnWY5hGVl4R/QknN8RcS
         m6QG0cpkYJX7r2kaE6WvJ7fnKoL5xO33iO0zlP71d9YIl+TU4Qjs7P8xHb6kVvYJ2Tu6
         Bz9g==
X-Forwarded-Encrypted: i=1; AJvYcCW0/tGpsUhQQccCQpnPMrcOY83rI5qtFMp54SyeV3iJu29PEMOq6ewglHnIFx/LLo2C45dkSYBMXOzbQXA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+RbkIvG5bcO4/QbOM0CNOoypknewppX2nSQHU7EiGGocxHK56
	rT+4VjdeuMDcAAMLe+S4IDIoDAYsv4N8zD7SnfluzVWjbGI3Nb2wkhHBuTv7DlmY5bmSI2NibcE
	JVkHNnifpgawMZhY+qXsc0vECH0GYMR06loGHkbedUA==
X-Gm-Gg: ASbGncth1Zy5PnZi7ee8awV/7MVxgk4jFa+S22YCphTDCWWm2GH0ty0qEpFdJeVzOx9
	RnFnHvaQ35BSiBH9dwwgXJ/o8rZoql54xOiOV4aeTE6u7LZvnvarq7JF7ZvyPdqupKkbEhizofZ
	NES+OvXwOFHTZtDe5AHEyr/XC4ekvoVPLFI2YH/4ow
X-Google-Smtp-Source: AGHT+IEYByUVl/yepIaYoB2uxlybeMfdVCnOM2tCCnTwmK/gNk4T3vDFpOGjgIevx5sWAC+4GR5rpfJ+v3CSPkSnqY4=
X-Received: by 2002:a05:622a:4d87:b0:4a4:39a6:93d6 with SMTP id
 d75a77b69052e-4a5b9dec472mr350827001cf.52.1749554461120; Tue, 10 Jun 2025
 04:21:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605171143.76963-1-pratyush@kernel.org> <aEKhF3HcrvG77Ogb@kernel.org>
 <mafs0jz5osutx.fsf@kernel.org> <aEc30BoLE9HRxiZm@kernel.org>
 <CA+CK2bAAbZjS2Og79xxLcDtNf-eM0up-8fwhd4fg_dp0j_TahA@mail.gmail.com> <aEfGTXrsEL5-DuF1@kernel.org>
In-Reply-To: <aEfGTXrsEL5-DuF1@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 10 Jun 2025 07:20:23 -0400
X-Gm-Features: AX0GCFuL7c_RAoZ4ZCdyX1YlCD0SjPG2cCCnRF6R-Ws5F5HXOirJt-HVRYtvgUQ
Message-ID: <CA+CK2bDXOWzrTsNtbCCK2rabNysf0JFQT5VfAjYrX5oSoiLmSQ@mail.gmail.com>
Subject: Re: [PATCH] kho: initialize tail pages for higher order folios properly
To: Mike Rapoport <rppt@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Alexander Graf <graf@amazon.com>, 
	Changyuan Lyu <changyuanl@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Baoquan He <bhe@redhat.com>, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 1:44=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Mon, Jun 09, 2025 at 04:07:50PM -0400, Pasha Tatashin wrote:
> > On Mon, Jun 9, 2025 at 3:36=E2=80=AFPM Mike Rapoport <rppt@kernel.org> =
wrote:
> > >
> > > Hi Pratyush,
> > >
> > > On Fri, Jun 06, 2025 at 06:23:06PM +0200, Pratyush Yadav wrote:
> > > > Hi Mike,
> > > >
> > > > On Fri, Jun 06 2025, Mike Rapoport wrote:
> > > >
> > > > > On Thu, Jun 05, 2025 at 07:11:41PM +0200, Pratyush Yadav wrote:
> > > > >> From: Pratyush Yadav <ptyadav@amazon.de>
> > > > >>
> > > > >> --- a/kernel/kexec_handover.c
> > > > >> +++ b/kernel/kexec_handover.c
> > > > >> @@ -157,11 +157,21 @@ static int __kho_preserve_order(struct kho=
_mem_track *track, unsigned long pfn,
> > > > >>  }
> > > > >>
> > > > >>  /* almost as free_reserved_page(), just don't free the page */
> > > > >> -static void kho_restore_page(struct page *page)
> > > > >> +static void kho_restore_page(struct page *page, unsigned int or=
der)
> > > > >>  {
> > > > >> -  ClearPageReserved(page);
> > > > >
> > > > > So now we don't clear PG_Reserved even on order-0 pages? ;-)
> > > >
> > > > We don't need to. As I mentioned in the commit message as well,
> > > > PG_Reserved is never set for KHO pages since they are reserved with
> > > > MEMBLOCK_RSRV_NOINIT, so memmap_init_reserved_pages() skips over th=
em.
> > >
> > > You are right, I missed it.
> > >
> > > > That said, while reading through some of the code, I noticed anothe=
r
> > > > bug: because KHO reserves the preserved pages as NOINIT, with
> > > > CONFIG_DEFERRED_STRUCT_PAGE_INIT =3D=3D n, all the pages get initia=
lized
> > > > when memmap_init_range() is called from setup_arch (paging_init() o=
n
> > > > x86). This happens before kho_memory_init(), so the KHO-preserved p=
ages
> > > > are not marked as reserved to memblock yet.
> > > >
> > > > With deferred page init, some pages might not get initialized early=
, and
> > > > get initialized after kho_memory_init(), by which time the KHO-pres=
erved
> > > > pages are marked as reserved. So, deferred_init_maxorder() will ski=
p
> > > > over those pages and leave them uninitialized.
> > > >
> > > > So we need to either also call init_deferred_page(), or remove the
> > > > memblock_reserved_mark_noinit() call in deserialize_bitmap(). And T=
BH, I
> > > > am not sure why KHO pages even need to be marked noinit in the firs=
t
> > > > place. Probably the only benefit would be if a large chunk of memor=
y is
> > > > KHO-preserved, the pages can be initialized later on-demand, reduci=
ng
> > > > bootup time a bit.
> > >
> > > One benefit is performance indeed, because in not deferred case the
> > > initialization of reserved pages in memmap_init_reserved_pages() is r=
eally
> > > excessive.
> > >
> > > But more importantly, if we remove memblock_reserved_mark_noinit(), w=
ith
> > > CONFIG_DEFERRED_STRUCT_PAGE_INIT we'd loose page->private because the
> > > struct page will be cleared after kho_mem_deserialize().
> > >
> > > > What do you think? Should we drop noinit or call init_deferred_page=
()?
> > > > FWIW, my preference is to drop noinit, since init_deferred_page() i=
s
> > > > __meminit and we would have to make sure it doesn't go away after b=
oot.
> > >
> > > We can't drop noinit and calling init_deferred_page() after boot just=
 won't
> > > work because it uses memblock to find the page's node and memblock is=
 gone
> > > after init.
> > >
> > > The simplest short-term solution is to disable KHO when
> > > CONFIG_DEFERRED_STRUCT_PAGE_INIT is set and then find an efficient wa=
y to
> > > make it all work together.
> >
> > This is what I've done in LUOv3 WIP:
> > https://github.com/soleen/linux/commit/3059f38ac0a39a397873759fb429bd5d=
1f8ea681
>
> I think it should be the other way around, KHO should depend on
> !DEFERRED_STRUCT_PAGE_INIT.

Agreed, and this is what I first tried, but that does not work, there
is some circular dependency breaking the build. If you feel
adventurous you can try that :-)

> > We will need to teah KHO to work with deferred struct page init. I
> > suspect, we could init preserved struct pages and then skip over them
> > during deferred init.
>
> We could, but with that would mean we'll run this before SMP and it's not
> desirable. Also, init_deferred_page() for a random page requires

We already run KHO init before smp_init:
start_kernel() -> mm_core_init() -> kho_memory_init() ->
kho_restore_folio() -> struct pages must be already initialized here!

While deferred struct pages are initialized:
start_kernel() -> rest_init() -> kernel_init() ->
kernel_init_freeable() -> page_alloc_init_late() ->
deferred_init_memmap()

If the number of preserved pages that is needed during early boot is
relatively small, that it should not be an issue to pre-initialize
struct pages for them before deferred struct pages are initialized. We
already pre-initialize some  "struct pages" that are needed during
early boot before the reset are initialized, see deferred_grow_zone()

Pasha
