Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DDB296FA2
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748023120; cv=none; b=QqRCxl3MkaOTMYXlNjXeVd4iL/wAaU/M+k8BxsbW30Z8YqZcW9wQbI1SUTIKCniLfsqbUgNd9KtgV5J3qhcW4NBgzA4CO9yobLgNjTkaEBAFh/NhZWt65VX74iPAWgnODHlh94ZtBOkfDUw2cOUwA2nWWEg4LGFnmpW6GwHTPaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748023120; c=relaxed/simple;
	bh=yYUi1udmfUYcJ5YKVRKseXClYrhNKbYP3F+XpHNtIHo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hBb84UqDB11DHLVXoDnW3V8HV386KHb+TDgA9arNO6w6Z2Unsx4CrbDQVmnbAe0JKtpS+miTpbUeQ+8OBLIZuDL7tXytdS9PCbLGzz96sbA7QJSUgekl4RCnv1Sf0dgYp1UJqgvoOA+TYKDMDNdJ4tDqFDwRnXrFTk8lZcq5+pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=roTzoKLv; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="roTzoKLv"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-231f61dc510so22545ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 10:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748023119; x=1748627919; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2MyXWu6zLRMWPH6yHtJnpQrGvuPbRE3t03DXROyNghU=;
        b=roTzoKLv/gm1v6/kWWqvdHmTclgVlQ8sdIfGcvud2iKzJisAuFpgYguGRNoW+Rt7HO
         vGPxQudwoWpOlLxRCjqG3Xq/s7DzrMVTSkUq4LpGTxx6uRAKH6NTLzV/aK2R5NY9Lntm
         xD97LMueOW+TauoAYhqm+y7AbqeOraExpmFRgl3J6fnxLruzxonfBmshbaszpMbeqcQH
         Tv4y3Gq5/vqi6qwWTGfDiJqbmyVRy7oG5FqF+C4PyXedMZsUtBg9ghf0L/uwUl1P7RGF
         c8AR+196rw9aYb9aM9T/Pk0O+KvHMLbH9S6HyHhWXGBXeretaxIDmUU11r0EEbGsLDw6
         Pcxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748023119; x=1748627919;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2MyXWu6zLRMWPH6yHtJnpQrGvuPbRE3t03DXROyNghU=;
        b=p3EPcezHCVa01BJK3CkDVxiwn6SHiL5m+3A/RyHNGeYN4a5QDxAAd3MhmIQpOpv92q
         ZiRlipz3llB8sQXrS+1tqwB357cAvOCj5XwQ2rXwSn/M1ChBNktM+zCL+5e23qIFJwUP
         UDkUaopLY0/sjcADJLJHvipLoCtfkYMCGKzUTXiXDgW5ZrqnNIeK4fLg5xKejZQGTfqa
         s1WRag1YkmuFU26DZi/G65vbDi9/GihNlLcUxnbEnsFkJODuMWbzieN/DP+fxpLZ70rl
         iMVOwehAQsT+4WjAchc5pEd90liW7HT1X0j2TkWOCvvfRaToHbEQoBPCwn6zd/l/Yi9J
         oODw==
X-Forwarded-Encrypted: i=1; AJvYcCX5VKdom6HG/+t3GqMLhMQzwEkKh1KzRqeNiL8pDjGPtuT/Ho/6rQ0vfy1bXgKl0CBJrqHafAfdPjsHmc4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3mqJoPeIeqVsvqBlSV2B6oTDYoBUSm5yOAwVqKjZ8X/6gwXSl
	9aCJr1eNgoI/Tv/qAewaijHy1tUsAEFsnlBc/gddIxsd1Dkzr5bRPhRJ3hHmM706ZAePXxTj5Js
	vg3ImMmZKxUM2V0doWwOAiMbX+WMIE78a0TFPHsul
X-Gm-Gg: ASbGnctvoU3WNMxmHovXWzUlxshItL1bTZz2l2TG6/s/ZqeiM5/TCnqg+/P9Up4v3HY
	MQunlTAfQ/HqDKh2LBTqYUo2gZWOucGUqa+JdMPibcBME5WvzC6PuZv7Z2TW2YQFXM5ittVg3pZ
	MiFlp7YtpS7nHRgCznG5vo5mghpShMlUBvmLiYVrZjiMT2RA7cQ1S/NVs6lqCSxcC/usqtmdDdc
	A==
X-Google-Smtp-Source: AGHT+IEGY8dDXdk00hKfZkhUxriQXpiPPCR5IyFq/kqB79PhLQHBbOU2os91yMCjpc3IjFgm69TOwCQHLx4ADvLhU5w=
X-Received: by 2002:a17:903:2f85:b0:215:7152:36e4 with SMTP id
 d9443c01a7336-233f345f871mr2976175ad.27.1748023118552; Fri, 23 May 2025
 10:58:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1747950086-1246773-1-git-send-email-tariqt@nvidia.com>
 <1747950086-1246773-9-git-send-email-tariqt@nvidia.com> <CAHS8izNeKdsys4VCEW5F1gDoK7dPJZ6fAew3700TwmH3=tT_ag@mail.gmail.com>
 <aC-5N9GuwbP73vV7@x130>
In-Reply-To: <aC-5N9GuwbP73vV7@x130>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 23 May 2025 10:58:23 -0700
X-Gm-Features: AX0GCFtIQeUuZYzja1a1q1Km_umu-mPBIVJSyoxOHOUHS4AXUOAmnwmC0suSjaI
Message-ID: <CAHS8izNgY3APhLZWjYwEWyq3g=JiCBWFUcnY4nrXpntnp8zKhw@mail.gmail.com>
Subject: Re: [PATCH net-next V2 08/11] net/mlx5e: Convert over to netmem
To: Saeed Mahameed <saeed@kernel.org>
Cc: Tariq Toukan <tariqt@nvidia.com>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Saeed Mahameed <saeedm@nvidia.com>, 
	Leon Romanovsky <leon@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, netdev@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	Moshe Shemesh <moshe@nvidia.com>, Mark Bloch <mbloch@nvidia.com>, Gal Pressman <gal@nvidia.com>, 
	Cosmin Ratiu <cratiu@nvidia.com>, Dragos Tatulea <dtatulea@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 4:54=E2=80=AFPM Saeed Mahameed <saeed@kernel.org> w=
rote:
> >>  static inline void
> >>  mlx5e_copy_skb_header(struct mlx5e_rq *rq, struct sk_buff *skb,
> >> -                     struct page *page, dma_addr_t addr,
> >> +                     netmem_ref netmem, dma_addr_t addr,
> >>                       int offset_from, int dma_offset, u32 headlen)
> >>  {
> >> -       const void *from =3D page_address(page) + offset_from;
> >> +       const void *from =3D netmem_address(netmem) + offset_from;
> >
> >I think this needs a check that netmem_address !=3D NULL and safe error
> >handling in case it is? If the netmem is unreadable, netmem_address
> >will return NULL, and because you add offset_from to it, you can't
> >NULL check from as well.
> >
>
> Nope, this code path is not for GRO_HW, it is always safe to assume this =
is
> not iov_netmem.
>

OK, thanks for checking. It may be worth it to add
DEBUG_NET_WARN_ON_ONCE(netmem_address(netmem)); in these places where
you're assuming the netmem is readable and has a valid address. It
would be a very subtle bug later on if someone moves the code or
something and suddenly you have unreadable netmem being funnelled
through these code paths. But up to you.

--=20
Thanks,
Mina
