Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3742F22
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749823417; cv=none; b=NhcbIx8T1Yr0ICYTssub0FfiOOf5YwTrc77SyRc68FqBQj42kohsSALFlu7KvuZsmyWSt9ynClhKSY6Q3bkERvuiLeVNBBkMXKBobcBoOgpQxFSWYWqhO/s4Dy2yA6VwcDuesKqW6uP3sy2pMOkn1msHVSA1AQKMArieoi1iL80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749823417; c=relaxed/simple;
	bh=HopVd7PYFeifmCq+jRHH62vbsQymTb83IS98tgV9b8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MVXKQtLtDKgRAR9ec0u5uh14RUFczuFDRWAG0/aYT69osijpaALnZR8U5AXZta/17QdmKMZ+T9vtuKnqkaMribXb6qskpR3YIRrMFYqqSqEO/1sikVz8spxOlehi+L2LXvIjb+ZMOi3W3jiHCAQvMGGcgAeI/QU68pSFriUVcFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=lNLBNUF4; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="lNLBNUF4"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c5b8d13f73so244235485a.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 07:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1749823415; x=1750428215; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jfez9m8g9eXcV1XbFnxKvEJ2+SXiyTgBGjYdJ4K2MFU=;
        b=lNLBNUF4Q6UNp6cOcRJY1Ts4IpO5zBI1MWzfxZd1SoNAI0qyx12WOLp8dgmTWWNthk
         XsG4pR9iX4loctggEdkb1Jm75jq5EEjNU+E2BvfnBWKYgcd4kj8vjahmsLdaMp1Gh6GW
         /sI0gmbseJyFIUHCsp5hF6s//Omb04irzuPD1sLiGLTlOhvpmwrhNIQo/PAl0uEscJ6V
         d9VjtomLjHfxEJcsukRh42QH5he+VbUcI4q1nnue1jwumQw16a53faWkz2Rh/Cc41g+K
         oyAVHZ3iweI7oFWV4PMSw2kh50OfX0f9pSI8cTpwNceIzlJKd+54Rv7xMB0FSsawOPrs
         rCDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749823415; x=1750428215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jfez9m8g9eXcV1XbFnxKvEJ2+SXiyTgBGjYdJ4K2MFU=;
        b=QdSvHzq3nKMfgUC2UNcFlKuNzQCD7tlJXWK2m2bDa337Q99JL/UdUU1cGsRymcecTO
         SKmd8bm929JWWKmo4NaNKuJy0IqSXNLbtYauhCaIadE+JdhSY9gQxG0/s+DaiSa1SOWW
         1WxD8bMtHBLZyqdblp5035xP9Xu0xZceRxy9kFeossCQVhofNvOXgXBLzf7fNN/GxMf2
         GJuuYpN544M23yif4MKKkTqgr1wStu7B2Ergg4tgSbK20qJcTRdzaWf5ISsROUzZi1F4
         fU+NdyNDpJFlVya5w8uIf1Mmbh6xsSbMPfdB20ogQbA5bHBwxGCKvJc/sAiYlIlhuwXU
         XaoA==
X-Forwarded-Encrypted: i=1; AJvYcCWLV5n/MFYkQgV/FQ23S1cDDImBwPQKD0o5kT5OdKqIZRkvN7fJjmm+9xM2SeeBkgVXpW/j9vc7DhcUK1s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8kx0BRcuCqrWTWsnmDDJtUhRrbWwJdz8bLbOq08CPh/m3tcZR
	tgifpfBIvBIwwYlu0od67iPUuijMKkvjY9v3yIk9UJeyMvsaB+ROa2QePC1ukAcYiT1rcgPoHSg
	NNfJyt8/78Yv4Mzt2xYHO1MgMMtr+TT+65KV2h0any2YaVm8f25jkiCQ=
X-Gm-Gg: ASbGnctUFsiof+O5NQExJ2x8BeROgeLatqhCkoZH4eMMfwXq2uZVOXjZePM00aQQOag
	s6PvfKes1nA6a7gUcC8XeL2cQNLuSiuirYcrZtoDpPVra6M1ylT7BdSZG19dSrBuDu4iRs8w51/
	92LdnEVOPPuiQkWRRYE4HwdmfQwPa+b53iVAdBXmpc
X-Google-Smtp-Source: AGHT+IEYtrF3JeWGspY0IB/x4ptpkv6RjcW9iWzE02RebZefIVkzcRcfsOf0K/L+k0JZSqJS9wd1O9/eT89BbTYNJmI=
X-Received: by 2002:a05:620a:390a:b0:7cd:31ca:d81 with SMTP id
 af79cd13be357-7d3bc47669dmr499779585a.27.1749823414616; Fri, 13 Jun 2025
 07:03:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613125916.39272-1-pratyush@kernel.org>
In-Reply-To: <20250613125916.39272-1-pratyush@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Fri, 13 Jun 2025 10:02:57 -0400
X-Gm-Features: AX0GCFtynq6uZkJCevICxm6uo_i_e5E0E4kzTiNB65e-YQ2MVftwAmOZ1grw1MI
Message-ID: <CA+CK2bCyTi+C+JaOjbaMhX=vnD7NTW-T4VDb9xJcTZTjwTJr6A@mail.gmail.com>
Subject: Re: [PATCH v2] kho: initialize tail pages for higher order folios properly
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Alexander Graf <graf@amazon.com>, Mike Rapoport <rppt@kernel.org>, 
	Changyuan Lyu <changyuanl@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Baoquan He <bhe@redhat.com>, Pratyush Yadav <ptyadav@amazon.de>, kexec@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 8:59=E2=80=AFAM Pratyush Yadav <pratyush@kernel.org=
> wrote:
>
> From: Pratyush Yadav <ptyadav@amazon.de>
>
> Currently, when restoring higher order folios, kho_restore_folio() only
> calls prep_compound_page() on all the pages. That is not enough to
> properly initialize the folios. The managed page count does not
> get updated, the reserved flag does not get dropped, and page count does
> not get initialized properly.
>
> Restoring a higher order folio with it results in the following BUG with
> CONFIG_DEBUG_VM when attempting to free the folio:
>
>     BUG: Bad page state in process test  pfn:104e2b
>     page: refcount:1 mapcount:0 mapping:0000000000000000 index:0xffffffff=
ffffffff pfn:0x104e2b
>     flags: 0x2fffff80000000(node=3D0|zone=3D2|lastcpupid=3D0x1fffff)
>     raw: 002fffff80000000 0000000000000000 00000000ffffffff 0000000000000=
000
>     raw: ffffffffffffffff 0000000000000000 00000001ffffffff 0000000000000=
000
>     page dumped because: nonzero _refcount
>     [...]
>     Call Trace:
>     <TASK>
>     dump_stack_lvl+0x4b/0x70
>     bad_page.cold+0x97/0xb2
>     __free_frozen_pages+0x616/0x850
>     [...]
>
> Combine the path for 0-order and higher order folios, initialize the
> tail pages with a count of zero, and call adjust_managed_page_count() to
> account for all the pages instead of just missing them.
>
> In addition, since all the KHO-preserved pages get marked with
> MEMBLOCK_RSRV_NOINIT by deserialize_bitmap(), the reserved flag is not
> actually set (as can also be seen from the flags of the dumped page in
> the logs above). So drop the ClearPageReserved() calls.
>
> Fixes: fc33e4b44b271 ("kexec: enable KHO support for memory preservation"=
)
> Signed-off-by: Pratyush Yadav <ptyadav@amazon.de>

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
