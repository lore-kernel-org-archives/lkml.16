Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D0828C020
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 17:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746637336; cv=none; b=V4jeONLbW4QtXFGXmH7QgAkIRdr27+ABRKNN2nJFftQZbuHt84gbrWEtbIZzZD3E81EV16rlVnJHnscnsI+diRelwrfhAU/5JJsCR1BKe2DzR3KHHoPesy+iRmKmDCTIbVCIedUcrPXeVaTUn1N8O4pr+GUM0q4WBEFgsHsDIvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746637336; c=relaxed/simple;
	bh=OcE+GoKOw7LhrCuLbrKh/LcbzJpz8rlGel67AsCJzTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rxMfnL2JyJgmkRoW9Wxfj7HmFvw5q0AtfrINmWqjApxO2Yjb54nnARAMB8BqZ+Us/HSD75XXxadKgFa9+y1bAgKfBJX3n4ncvztU8Za5QSuJu9UFxGGOc0uAvZ+eXjWSq5ESANdMDfN1MDhNPo1H3jQOlfisWKrNo4Xpf45teU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=riotgames.com; spf=pass smtp.mailfrom=riotgames.com; dkim=pass (1024-bit key) header.d=riotgames.com header.i=@riotgames.com header.b=IwX7XXVm; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=riotgames.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riotgames.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riotgames.com header.i=@riotgames.com header.b="IwX7XXVm"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-30aa79ee726so171640a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 10:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riotgames.com; s=riotgames; t=1746637332; x=1747242132; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=evCH9GiqYG33lbncK47MNfRK8jVnMEAaPU/9KW+jEKQ=;
        b=IwX7XXVmfZBHK1jv7uFvyWJPfH2Ob6HJJku8lJw8iIdD0Qy/IFOPLz8eL3mT2meOAe
         C7kXnRyzAekCUrv1sRAizd2SI6LAG2UFeqg8uPtb/Nn3qBvhNAu0Xz+h0sCFkB996HLf
         t3d0Oy4qyjyx4s0QJjog0S3kCwcuhp7Hbzsl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746637332; x=1747242132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=evCH9GiqYG33lbncK47MNfRK8jVnMEAaPU/9KW+jEKQ=;
        b=loBEKd2KVsFKKR2wP0gyg9Kby+k/Ptr9xVkT38AkODHJOmFu/lNNA5xCAB+x8S0R6x
         vPLrej1I7elZHJiZ24T0+MRwcP4ENRe+rj4KoKba90/cshIhKV3r8M3mTDYFJ8XiT8ap
         m9EOWg6h+aP7ki9kAAA05Fce2jhhqUutaHxLEBFa1t8G7TTYOdpEh7/AQtQEff9RwOrC
         trfuHUc6NvH7oDwQtEKKBipsbf5VpSmbMHFoFJNtjLf4aBYAEEfGbmnHUwztrha5L0fk
         7hxXZ6EmM3HAu03L6Eiy4ttL7QrjXTSxkuVe2ocEMHvxxrDydrZZs+KIXJOnCC1Hu6yf
         cLzA==
X-Forwarded-Encrypted: i=1; AJvYcCUMII+CKr+jhvRcp2At6zNvWvtv3g9MiB9YKuw9rozPRPjTZwu7WrPBBDf2GangBqSmHX4YDsWqnZpd5Ls=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSuYaN/TeDEC5s8rlmY/olJ/A8U7Njr8a/x4ckDJPlBDy2nWTx
	4Sla+rbnX35JJj/leziugUBDTFF1nUCBZeCsO/cZDyANPZ0y5SzXHH3fFvs20+crrnJIySznVMn
	aca0KmjGbD1L1Rn7ZPkSHIGa84foRzgdXDHB1zA==
X-Gm-Gg: ASbGncsWTUpAjKVjbrczw2jnT36Vurg3G3tmGEpz1aPsr90JRwRWtrDO71Nx70+GtEF
	Mex5I9kOgAsc4szxOAwz7TBPU4q5hH3OaHzitmjf9ehouHbc/JyTw3ubvjIZvOOGDY0y+p3oCjm
	gi189r7GViwKmhXEB5AWS8gQ==
X-Google-Smtp-Source: AGHT+IGFj5vERsIsOzMMzWHx4KyiQNS3ACFY3x+qC86Qtz4zl4CEaYY14fFJaSflTT3GMneoxBCaK3B2zsphjb3Nipk=
X-Received: by 2002:a17:90b:4f46:b0:30a:9025:84d1 with SMTP id
 98e67ed59e1d1-30aac191600mr6879065a91.16.1746637332399; Wed, 07 May 2025
 10:02:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506125242.2685182-1-jon@nutanix.com> <aBpKLNPct95KdADM@mini-arch>
 <681b603ac8473_1e4406294a6@willemb.c.googlers.com.notmuch> <c8ad3f65-f70e-4c6e-9231-0ae709e87bfe@kernel.org>
In-Reply-To: <c8ad3f65-f70e-4c6e-9231-0ae709e87bfe@kernel.org>
From: Zvi Effron <zeffron@riotgames.com>
Date: Wed, 7 May 2025 10:02:00 -0700
X-Gm-Features: ATxdqUHeYs9_StQV2Ta3ALi0amyLtmj3B1nixRHGF-7WCF8a8jaznKs7hOx7vKA
Message-ID: <CAC1LvL3nE14cbQx7Me6oWS88EdpGP4Gx2A0Um4g-Vuxk4m_7Rw@mail.gmail.com>
Subject: Re: [PATCH net-next v3] xdp: Add helpers for head length, headroom,
 and metadata length
To: Jesper Dangaard Brouer <hawk@kernel.org>
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
	Stanislav Fomichev <stfomichev@gmail.com>, Jon Kohler <jon@nutanix.com>, Jason Wang <jasowang@redhat.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	Jacob Keller <jacob.e.keller@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 9:37=E2=80=AFAM Jesper Dangaard Brouer <hawk@kernel.=
org> wrote:
>
>
>
> On 07/05/2025 15.29, Willem de Bruijn wrote:
> > Stanislav Fomichev wrote:
> >> On 05/06, Jon Kohler wrote:
> >>> Introduce new XDP helpers:
> >>> - xdp_headlen: Similar to skb_headlen
>
> I really dislike xdp_headlen(). This "headlen" originates from an SKB
> implementation detail, that I don't think we should carry over into XDP
> land.
> We need to come up with something that isn't easily mis-read as the
> header-length.

... snip ...

>>> + * xdp_headlen - Calculate the length of the data in an XDP buffer

How about xdp_datalen()?

On Wed, May 7, 2025 at 9:37=E2=80=AFAM Jesper Dangaard Brouer <hawk@kernel.=
org> wrote:
>
>
>
> On 07/05/2025 15.29, Willem de Bruijn wrote:
> > Stanislav Fomichev wrote:
> >> On 05/06, Jon Kohler wrote:
> >>> Introduce new XDP helpers:
> >>> - xdp_headlen: Similar to skb_headlen
>
> I really dislike xdp_headlen().  This "headlen" originates from an SKB
> implementation detail, that I don't think we should carry over into XDP
> land.
> We need to come up with something that isn't easily mis-read as the
> header-length.
>
> >>> - xdp_headroom: Similar to skb_headroom
> >>> - xdp_metadata_len: Similar to skb_metadata_len
> >>>
>
> I like naming of these.
>
> >>> Integrate these helpers into tap, tun, and XDP implementation to star=
t.
> >>>
> >>> No functional changes introduced.
> >>>
> >>> Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
> >>> Signed-off-by: Jon Kohler <jon@nutanix.com>
> >>> ---
> >>> v2->v3: Integrate feedback from Stanislav
> >>> https://patchwork.kernel.org/project/netdevbpf/patch/20250430201120.1=
794658-1-jon@nutanix.com/
> >>
> >> Acked-by: Stanislav Fomichev <sdf@fomichev.me>
> >
> > Reviewed-by: Willem de Bruijn <willemb@google.com>
> >
>
> Nacked-by: Jesper Dangaard Brouer <hawk@kernel.org>
>
> pw: cr
>
