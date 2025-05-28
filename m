Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A68F28C2D7
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 16:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748451571; cv=none; b=H5kWUErZvyQLFx1dttrk0SB4nSeCxyRK+Hc7zWcc26zf4f/O44OyTj0cc1Y5i+1LeJn6ysKl+vXXbbxCmU1JaUzIAoLULNVfn0GSbIsfaqKm+XEbj9K/c+DiJk0EWjqDlv4bmTrzsfaiYH75H5qFdptkSYM0n89phhrmEipLw2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748451571; c=relaxed/simple;
	bh=fhxfhD2VJr7N/NFA3EsShcZyUJOLpTJhxWDJrIillnI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p503NNT3ywkI4qo7rvx0PyAZEYjjRXAvbowvouXDmk4Frpb9vPGJkkoLRotXhLrYZhKW47/ps/+VDXm9oFkemlEHL1s8uw9R50MGGMWxjbh2qXftFwFvmD8DyXWzFF/DJeJev+fLptqpI/CwTmP/s0q27nNWSLI2cDvEDzru0H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3Yj1XlCb; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3Yj1XlCb"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2348ac8e0b4so1575ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 09:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748451568; x=1749056368; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AU+5V0D50sosAbJkKDzKL3jVUZ5FjJivIDtXJcMadFo=;
        b=3Yj1XlCbJRh4dz+XQ54jCMu6hEj/eJa3CO9xHnolvo3yhI/HuKIkkVxyKNwvSoiJ12
         vy9fOmfhtiiVAVwct8RZTfOZ7EY4VctfJrVmRswHrdR7n4cUi4ZqNY6q7OZBenrQa5kU
         Z13SE6uavKbInk0qRtWIocb8FKisp7qWsXJ3BM/qOfmK7AZhI43UaPJ0gRY0QXhzBubH
         nSe9QSbwcF1LZdo1dnlPTJlfltMPjHMHn9pLDHXPdbwQwwOJnDHVrmXN1xAqd7th6+3R
         O1IhO32L3wuh5e1HecH8MZJpP/PKWO+aR/2SrcCOnte5qr/0j5hgKSni2IRcjimyQR5s
         f1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748451568; x=1749056368;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AU+5V0D50sosAbJkKDzKL3jVUZ5FjJivIDtXJcMadFo=;
        b=rGdkAVMkxOGXKRgI/dmM8iDdRY1EE2LxT5B6/HZ21cyDPHjYezSpdrGpQ5DHMqRbUK
         mnjgZnF07PjcnItNL0aSpEqV79FUTnBE7OryLvorVH6KoyhDuJXWXp21GvOJtT90w7TY
         Jugd0EqExc7u7YB6dKyaekN4mLpypPxDxpquyLyMsjPj62qtvDiIvzB281z7Np0nwpCk
         NSm60S0oPCoUPB+C47BRXJ4PJ+O6U3WwvrTLVJxWeWlh7Eml3F80h030m5HklkXqyxSA
         fz0POkERCBXmUzOrTYyZn6LWB3VRfNbA7p60J6aNT/HBZiVgoCxghGwhA4OsmGChQVCZ
         z0iA==
X-Forwarded-Encrypted: i=1; AJvYcCVXDUsZHiIltZ9Dkrxjz1tq33tulvFKwcGmUDqJPpY8jST87mI/koJn1HL3//luKap+n7AHd6krwe+/QaU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlv/kJly166jlBskwDsMC9dio4m3Og3NJinkPdeTQl3vVbkhBv
	MY+mv3pR3qUFhTrdsMRzFjhCgnuGPt+jR5c1R3S+kTw9TIbFmiLnybAkIgvrYIOYQKcIPR5mURu
	goFur1VoN8ZLXf7A9O8wir89F9/Za364NXAwsKFPJ
X-Gm-Gg: ASbGncsqh1IFbwqWGXI0nirI8aG33kXENRQMAFtBP2SCZC9rROaXvIl0m91ui0Tm3Dy
	ZA7xRPQloCAF/cjQLqAmCNK3RR6OZVBJrse4OAUfcxEiflhT8GKqXuuJJV9HmLK179XHr4HWyZi
	zjE2ByaP+u80sd+lTvvfHdtaDvZDJG4Wjhf67+YMBWipY0e+iqZPOMtW4c6oSUVU5lxlcm4Z0/u
	mQGFfWPHTWg
X-Google-Smtp-Source: AGHT+IGH9FRqbmLXCu8WFJb6dVN46h/TnBW/MP1T5WeV0m8oyOEBp/rxcLIB9unWYsuTueREphw7MK8d9rPrgIGIBnE=
X-Received: by 2002:a17:903:1b63:b0:21f:2ded:bfc5 with SMTP id
 d9443c01a7336-234c55ab5aamr3548825ad.28.1748451567487; Wed, 28 May 2025
 09:59:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528022911.73453-1-byungchul@sk.com> <20250528022911.73453-17-byungchul@sk.com>
 <20250528060715.GE9346@system.software.com> <87v7plmbo9.fsf@toke.dk>
In-Reply-To: <87v7plmbo9.fsf@toke.dk>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 28 May 2025 09:59:14 -0700
X-Gm-Features: AX0GCFuxRFdaXnvFJo88yADv-joqzgj8xrel-S60sB-_CFIsIQuQGzHBPdDTD9k
Message-ID: <CAHS8izOJVRu=qvsqZyXERKxA-fcqGuNVfiVsXsszQYAjD4d00g@mail.gmail.com>
Subject: Re: [PATCH v2 16/16] mt76: use netmem descriptor and APIs for page pool
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc: Byungchul Park <byungchul@sk.com>, willy@infradead.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, kernel_team@skhynix.com, 
	kuba@kernel.org, ilias.apalodimas@linaro.org, harry.yoo@oracle.com, 
	hawk@kernel.org, akpm@linux-foundation.org, davem@davemloft.net, 
	john.fastabend@gmail.com, andrew+netdev@lunn.ch, asml.silence@gmail.com, 
	tariqt@nvidia.com, edumazet@google.com, pabeni@redhat.com, saeedm@nvidia.com, 
	leon@kernel.org, ast@kernel.org, daniel@iogearbox.net, david@redhat.com, 
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, horms@kernel.org, 
	linux-rdma@vger.kernel.org, bpf@vger.kernel.org, vishal.moola@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 12:34=E2=80=AFAM Toke H=C3=B8iland-J=C3=B8rgensen <=
toke@redhat.com> wrote:
>
> Byungchul Park <byungchul@sk.com> writes:
>
> > On Wed, May 28, 2025 at 11:29:11AM +0900, Byungchul Park wrote:
> >> To simplify struct page, the effort to separate its own descriptor fro=
m
> >> struct page is required and the work for page pool is on going.
> >>
> >> Use netmem descriptor and APIs for page pool in mt76 code.
> >>
> >> Signed-off-by: Byungchul Park <byungchul@sk.com>
> >> ---
> >>  drivers/net/wireless/mediatek/mt76/dma.c      |  6 ++---
> >>  drivers/net/wireless/mediatek/mt76/mt76.h     | 12 +++++-----
> >>  .../net/wireless/mediatek/mt76/sdio_txrx.c    | 24 +++++++++---------=
-
> >>  drivers/net/wireless/mediatek/mt76/usb.c      | 10 ++++----
> >>  4 files changed, 26 insertions(+), 26 deletions(-)
> >>
> >> diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wi=
reless/mediatek/mt76/dma.c
> >> index 35b4ec91979e..cceff435ec4a 100644
> >> --- a/drivers/net/wireless/mediatek/mt76/dma.c
> >> +++ b/drivers/net/wireless/mediatek/mt76/dma.c
> >> @@ -820,10 +820,10 @@ mt76_add_fragment(struct mt76_dev *dev, struct m=
t76_queue *q, void *data,
> >>      int nr_frags =3D shinfo->nr_frags;
> >>
> >>      if (nr_frags < ARRAY_SIZE(shinfo->frags)) {
> >> -            struct page *page =3D virt_to_head_page(data);
> >> -            int offset =3D data - page_address(page) + q->buf_offset;
> >> +            netmem_ref netmem =3D netmem_compound_head(virt_to_netmem=
(data));
> >> +            int offset =3D data - netmem_address(netmem) + q->buf_off=
set;
> >>
> >> -            skb_add_rx_frag(skb, nr_frags, page, offset, len, q->buf_=
size);
> >> +            skb_add_rx_frag_netmem(skb, nr_frags, netmem, offset, len=
, q->buf_size);
> >>      } else {
> >>              mt76_put_page_pool_buf(data, allow_direct);
> >>      }
> >> diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/w=
ireless/mediatek/mt76/mt76.h
> >> index 5f8d81cda6cd..f075c1816554 100644
> >> --- a/drivers/net/wireless/mediatek/mt76/mt76.h
> >> +++ b/drivers/net/wireless/mediatek/mt76/mt76.h
> >> @@ -1795,21 +1795,21 @@ int mt76_rx_token_consume(struct mt76_dev *dev=
, void *ptr,
> >>  int mt76_create_page_pool(struct mt76_dev *dev, struct mt76_queue *q)=
;
> >>  static inline void mt76_put_page_pool_buf(void *buf, bool allow_direc=
t)
> >>  {
> >> -    struct page *page =3D virt_to_head_page(buf);
> >> +    netmem_ref netmem =3D netmem_compound_head(virt_to_netmem(buf));
> >>
> >> -    page_pool_put_full_page(page->pp, page, allow_direct);
> >
> > To Mina,
> >
> > They touch ->pp field.  That's why I thought they use page pool.  Am I
> > missing something?
>
> It does, since commit: 2f5c3c77fc9b ("wifi: mt76: switch to page_pool all=
ocator")
>

I am very sorry, I was clearly hallucinating when I first looked at
this. In my defence it was kinda late at night in my time zone :-D

Since this driver supports page_pool, I think it's reasonable to
convert it to netmem. It may not be intreseted in supporting devmem or
io_uring zcrx but there may be more netmem features in the future and
future proofing it sounds good to me.

Reviewed-by: Mina Almasry <almasrymina@google.com>

(although I would like to see a virt_to_head_netmem helper FWIW).

--=20
Thanks,
Mina
