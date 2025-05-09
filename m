Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EB58632C
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 14:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746799771; cv=none; b=PF4v7WpvLvqJOHEBDr+vKvV+1IpfY4swvPKezwWcn3awFVBpnNSTuskHVOVnEfWQipb/nD3SmunQFLcN7ybBBJg4/qyIyyXNe/onTp+v/Xbm9BxXPtCy8JX52en7LT/ulmDku1O7dDJ+8X7oYTnSzObFtMQIvpYrjm/nJi8ODgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746799771; c=relaxed/simple;
	bh=vQwnaN5SIa/H+Y6ee37jwTVs6F3pxmGriu6KQ74VZEo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nAranQTlsUhwsCZZVGtF4tqqyjMBexuBP6F37Xl334Seh9sVfPJHmshmO+F18EM82GTIko35zppfnQBTrWaN80v7FaDmUQLVYwH6pqKHPb1boFWbjMlL2MYTOF/lNIINd/2U+o3guNx5uyz6RNnQD6xux5YlWq/8PWo4Sfwu2mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GCvkRk4k; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GCvkRk4k"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22e42641d7cso234755ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 07:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746799769; x=1747404569; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jCiKxL6LvoeyY9W6b3RA5blUeHU2Mmy1DhVz0FZzVWc=;
        b=GCvkRk4kEg52KvSZTakEcYv/YL0uT1qGB5CMIV23CBHwOIbUhemIDQ0yS0+Q/Td11Y
         A4QU4ZF2Xb5wuagf8xxURV7rp6OuO7UPDBzBroBxUF1umxlASerewXL2YsUaufAJ2VqU
         cfLIWXlDOzrbLimqmwWD4ghUt1fu1rVZuMWvfp30TSnaA8vEKP0I5NgGNwKWktK5yokD
         8GvLDqWEeAl1+Xz00br358GmhxA57hhABolgqf2FiZ17mzX0SFLv6rDRshdB1cuJfSGN
         YDuGAfyRWjnm5e8OYCYoy8arW7mDhbXVh7uexECpGojI8ZHO8pylz7C72XPF2lFATSn1
         EMyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746799769; x=1747404569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jCiKxL6LvoeyY9W6b3RA5blUeHU2Mmy1DhVz0FZzVWc=;
        b=R3FsJwkQZhXRXCS/zvNWl17fbjGVzWPazlGJLHaow60BP9Kx98KdYzlI3iUCVY6R93
         ebFkMtUgEYtY0PxNoEvoFROGtSdoTIMk+N4iAAXTPwSKL4ZKXfEWOgHEdxaLqjoL7Pvq
         A6YxHqHP6RdueSr/aIJy63ucil710sdly68Xzo7K6M9biAg+VPuRryia+SOZgsRPLVPQ
         9HFNU1Oa8828QcWdmx0tDbvTOEdYVWu6/fGTPpYgygryCd7G0AlFn716KLdkvxrbs4MS
         l3tU69ofmgxDUGaSqX5PsU9sfeVtedYtjz1Rs0M1MvQgLMJsj3xamtq7tMgQIzki9vVW
         fhYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUh/Ot74Hft23t/Co+AEJQEDfzvt1ZeOsJvW8IlK2homtzG5+Cgs+3EUXNrPFjLQFW1uuW6/LKK03EhNwI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVmS4JHO9P/zXUW1HBz+h5IEat1WJPXeNdJBlXKCt+wvRulrYV
	lp6E8NT6YWz90DfRknIGrQGlXD5ZlQ1e9jLvjv8Q+wC7FEAgayZNwtPWvyYYw0MJ62AbSRoJvq2
	oaJkHgMzTCeYsUriyTBz/tpdf6lOcFTKPht4x
X-Gm-Gg: ASbGncsZkX2ubH4v5Kzk425/kdCXJE6VJzWjwI/nlOHKEJ1MMf+UI/e5te/z6l9DTvj
	xk3BIs07iFWbJ8pWplYIOVH2cKwkTOpjx1v5JCfAZsaSctoHGU8g8a7z5vLtcou1DVXgCuUoFWn
	FM2WLs2b5IxuqpY1NVSDt6eoM=
X-Google-Smtp-Source: AGHT+IGMI/XDr8dUmvgSvSl1rg1l31oGTBGmNKBdui7zTK+cXuKqPn5F0+EqTjHwmKRPbjb5nSBKLROp6YQHQ8mm83g=
X-Received: by 2002:a17:903:1c3:b0:224:a93:704d with SMTP id
 d9443c01a7336-22fca87efcdmr3648795ad.2.1746799768696; Fri, 09 May 2025
 07:09:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509115126.63190-1-byungchul@sk.com>
In-Reply-To: <20250509115126.63190-1-byungchul@sk.com>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 9 May 2025 07:09:16 -0700
X-Gm-Features: ATxdqUEcD0TRlngE7OhKXE4b1mDY8XLhym2WmzKEPsqCbaP_I_Y7Ra0p4qdhPME
Message-ID: <CAHS8izPFiytN_bM6cu2X8qbvyVTL6pFMeobW=qFwjgHbg5La9Q@mail.gmail.com>
Subject: Re: [RFC 00/19] Split netmem from struct page
To: Byungchul Park <byungchul@sk.com>, Pavel Begunkov <asml.silence@gmail.com>
Cc: willy@infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, kernel_team@skhynix.com, kuba@kernel.org, 
	ilias.apalodimas@linaro.org, harry.yoo@oracle.com, hawk@kernel.org, 
	akpm@linux-foundation.org, ast@kernel.org, daniel@iogearbox.net, 
	davem@davemloft.net, john.fastabend@gmail.com, andrew+netdev@lunn.ch, 
	edumazet@google.com, pabeni@redhat.com, vishal.moola@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 4:51=E2=80=AFAM Byungchul Park <byungchul@sk.com> wr=
ote:
>
> The MM subsystem is trying to reduce struct page to a single pointer.
> The first step towards that is splitting struct page by its individual
> users, as has already been done with folio and slab.  This patchset does
> that for netmem which is used for page pools.
>
> Matthew Wilcox tried and stopped the same work, you can see in:
>
>    https://lore.kernel.org/linux-mm/20230111042214.907030-1-willy@infrade=
ad.org/
>
> Mina Almasry already has done a lot fo prerequisite works by luck, he
> said :).  I stacked my patches on the top of his work e.i. netmem.
>
> I focused on removing the page pool members in struct page this time,
> not moving the allocation code of page pool from net to mm.  It can be
> done later if needed.
>
> There are still a lot of works to do, to remove the dependency on struct
> page in the network subsystem.  I will continue to work on this after
> this base patchset is merged.
>
> This patchset is based on mm tree's mm-unstable branch.
>

This series largely looks good to me, but a couple of things:

- For deep changes like this to the page_pool, I think we need a
before/after run to Jesper's currently out-of-tree benchmark to see
any regressions:
https://lore.kernel.org/netdev/20250309084118.3080950-1-almasrymina@google.=
com/

- Also please CC Pavel on iterations related to netmem/net_iov, they
are reusing that in io_uring code for iouring rx rc as well.

--
Thanks,
Mina
