Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0BB5FEE6
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 19:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749152850; cv=none; b=KZNPMWZJCHpniXd7fJRSgzO2yfy3f7pXzV5OshAHTTUjfTgSD0rR1oJ9VCgxS3iQ98CM/JY487T2P/VUPTlSKOYGWw91/NAXezaOH5cDXGn+5qTukPf8NHh33Z7/wNOK4GZKkZJE1emq1Q9W0f0mlwRRBItrCHHRd2q4UcC6IQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749152850; c=relaxed/simple;
	bh=UCKucqpwIyXj8QqMkDicaIUSsgwwLiTElK59LUrl4fE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YCWvSBB3Y/YwiuunlUq4ZC5EijbMZSu07Lxg0118dbwhbQGpjyO4PXa3Y48k5pW4XsAtsTkMAZCG2WwGoxjIzrO58JfI5EpSXAORBsYuD+74MBLhR68WA8hzuuYzDVYpU/fb2AI4i9otTKiwfp1YWSAIi9J2IVxUAF8y57etQfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HkZRSyKy; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HkZRSyKy"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2357c61cda7so4975ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 12:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749152848; x=1749757648; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UCKucqpwIyXj8QqMkDicaIUSsgwwLiTElK59LUrl4fE=;
        b=HkZRSyKy1rL1pwe3LUs3LLl61kUzlQxWkvjm8DGMH0Jh1+YuGJ+VVhi7cx77uKFbBg
         Gnz0BDN8p9d9rzjxv1aUXQlPYomT18gULbI1Sg0884mf/SxaE0ViWcIdM4Le2N/d/WUk
         z3hWfH5ybmnBIdBHaP1f9yuyEWc3uVTCUzWpCBa5kNN9dor8zHrVEjokX3TXZGx2iZZr
         wZk6AmSJLK16W37apSBo1VmYyLncIpg3dCaCRVhVO3x3tc1fFrOYA9icQBw9tFcmqfPy
         nyZw1ZIYiEjHKQMJQ0Tof8z6lROTtXn26JffSpcK2hfYZcwbdR70IBWM7ZrxXEbl5cwk
         rF8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749152848; x=1749757648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UCKucqpwIyXj8QqMkDicaIUSsgwwLiTElK59LUrl4fE=;
        b=BFSYwjIY2nwVMdLeQ9lU2vCvzehVAzSwJfrdJpsARkzbH1HwUzIr/JlDf6qEyOXVmb
         gI5/3cKF/BqEBAb4zCydur0L1TSi2lNzFVU9bUMenwBJ+M5ZaUXyKuwDiEO7uoJp0Jo7
         2Us07S9yquAPmetxGdkFPbHDu6k9Qmu1iVix8f0tGPwNIVpN1mgXIdEmKWqwh/K2UcF7
         iJ3IYXNmlIazhR9Lr4sgIRVIaeR6e/LfEERuaHQRZxu45Dub89C5GQqAR4Ut13mENG1n
         fuhjjigBGS8VBU3dhPuWfEpzveC9ji438/hveflSbai/XuLWXKPPZUhKaYmIjmrG/3gg
         Em7w==
X-Forwarded-Encrypted: i=1; AJvYcCV7oxMD6Ty2pJItFXFglXnbq1RYGFbTRMWXDmWtw/X871BPhNJc0FKND1P/OOIF/hsniwqoSZvJEoFhUVg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRTaVhfK3zCst25A7lIlI+Ua5SmBylgzbBCInr9ZQ1QeHOuaB9
	OWCPVL6jCaqac3NtnJ5llZ4bTN5zhcYPXr5pStePp3EPqxjdR+/9txwSZ25ov9ISMtay5s9CST6
	gKRdjwyQyljCANCOUXdK+K7Anpnf/Upkm7duSHESs
X-Gm-Gg: ASbGncucPBfJECHqxi8IFRxtIN3I9HADgGzgdMTKZxvEs+cKWQwcitbtS0RWgyk8U8m
	+1YzVXVy0djgrJUm/kGaIhOGt0pT+XwCsYyiIwN072FZe0EV9CtpBisACHsiSZamqvF3jo4MGZr
	IJVrawTQUivp+jhTYVO8tt0+p4YBypCf0+E3z/x++ovpbY
X-Google-Smtp-Source: AGHT+IGEZRKG6xvZHogMtre77VgiSxDaYZdqjTk10sRxgiSBiBGpyaYgS/fptxzapbkZ7Jl7Refn+g7Umm+MVSkwFF8=
X-Received: by 2002:a17:903:22cf:b0:235:e1e4:efc4 with SMTP id
 d9443c01a7336-236021cbd7cmr556885ad.14.1749152847887; Thu, 05 Jun 2025
 12:47:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604025246.61616-1-byungchul@sk.com> <20250604025246.61616-19-byungchul@sk.com>
 <390073b2-cc7f-4d31-a1c8-4149e884ce95@gmail.com> <aEGEM3Snkl8z8v4N@hyeyoo>
In-Reply-To: <aEGEM3Snkl8z8v4N@hyeyoo>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 5 Jun 2025 12:47:14 -0700
X-Gm-Features: AX0GCFuQUodCCzxMMKtUv6I9nARNgb_4QREwvin7nUUsfjMZH4C0VBF2D5sefUE
Message-ID: <CAHS8izPvdKZncxARWUqUqjXgoMb2MmMy+PaYa8XCcWHCQT-CSg@mail.gmail.com>
Subject: Re: [RFC v4 18/18] page_pool: access ->pp_magic through struct
 netmem_desc in page_pool_page_is_pp()
To: Harry Yoo <harry.yoo@oracle.com>
Cc: Pavel Begunkov <asml.silence@gmail.com>, Byungchul Park <byungchul@sk.com>, willy@infradead.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	kernel_team@skhynix.com, kuba@kernel.org, ilias.apalodimas@linaro.org, 
	hawk@kernel.org, akpm@linux-foundation.org, davem@davemloft.net, 
	john.fastabend@gmail.com, andrew+netdev@lunn.ch, toke@redhat.com, 
	tariqt@nvidia.com, edumazet@google.com, pabeni@redhat.com, saeedm@nvidia.com, 
	leon@kernel.org, ast@kernel.org, daniel@iogearbox.net, david@redhat.com, 
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, horms@kernel.org, 
	linux-rdma@vger.kernel.org, bpf@vger.kernel.org, vishal.moola@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 4:49=E2=80=AFAM Harry Yoo <harry.yoo@oracle.com> wro=
te:
>
> On Thu, Jun 05, 2025 at 11:56:14AM +0100, Pavel Begunkov wrote:
> > On 6/4/25 03:52, Byungchul Park wrote:
> > > To simplify struct page, the effort to separate its own descriptor fr=
om
> > > struct page is required and the work for page pool is on going.
> > >
> > > To achieve that, all the code should avoid directly accessing page po=
ol
> > > members of struct page.
> >
> > Just to clarify, are we leaving the corresponding struct page fields
> > for now until the final memdesc conversion is done?
>
> Yes, that's correct.
>
> > If so, it might be better to leave the access in page_pool_page_is_pp()
> > to be "page->pp_magic", so that once removed the build fails until
> > the helper is fixed up to use the page->type or so.
>
> When we truly separate netmem from struct page, we won't have 'lru' field
> in memdesc (because not all types of memory are on LRU list),
> so NETMEM_DESC_ASSERT_OFFSET(lru, pp_magic) should fail.
>
> And then page_pool_page_is_pp() should be changed to check lower bits
> of memdesc pointer to identify its type.
>

Oh boy, I'm not sure that works. We already do LSB tricks with
netmem_ref to tell what kind of ref it is. I think the LSB pointer
tricks with netmem_ref and netmem_desc may trample each other's toes.
I guess we'll cross that bridge when we get to it...

--=20
Thanks,
Mina
