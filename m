Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB677B3E1
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 16:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749141986; cv=none; b=f3HxQutGpaiJ+vYNJ1dGa24Yh9xjOj4HWLLbCddn8MVVJjNQ8U4IHIz2PieENYqVS/7zev6Yo9mEeldz5a5oC2jlpqEEV94GJAyPoUhOMJBxIvjMp28pRSFYgKf8KLOB5GtOIpNFeuVLLQ7XIQQR87Z5m8y+kjWlrMs3tEKZBtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749141986; c=relaxed/simple;
	bh=BXiBeNhLzw2rZ0VyjwDzCGb1mCptrpVt/lEFYWBMrVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l4lUX+0URnSExWaiwITiZr0Rd/K/rQ4gFBm3kvf2R++zVw8DAsWMSGtvV3bfYqClGe5xfLPMVuCbp2wIKeBoiNZBywvUAYFFdT9EVXOiYDDOly96wE30qne/K1raj/xpT2YXYFIWxHsfs+rD90/sZKl2tn6Cel+JWfZgrjqRVrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nKipXaIw; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nKipXaIw"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4a5ae2fdf4eso14656771cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 09:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749141984; x=1749746784; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XWHw+ieKLvAojbnHJxEwngMoW2Z5KJNSdkPLyrQpUXk=;
        b=nKipXaIwyKu2ms4Uq6zDhULNMkOXz6Ic9y1OQpIicXnIuYvgS+luHS/Nfq9dQy9BMs
         EPNcN/2CTsjZwqMqqidsyTI11emvYy0S6sWImQKT9J4RFeFjJA0fm2FxVy8Xxa7ZBTKh
         z+HObBEHvc7XUuLpKZLM9bwusx5rm0BRHTwNeqO7+lH9NsCsjhxWdrWHgD/213OCK+Fc
         d1Swpfh/y9SHro4+opPa7YMCeGUOv75BTx0XUeqwcFowdRWIwScyQPd9rmZ5QbBOD2AI
         +YYWceG7pgIrabQARCnTMpfkM/rINL6eLk70QyxYcZWylV+o738aAiPz55q6iiCMJHTm
         Fzrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749141984; x=1749746784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XWHw+ieKLvAojbnHJxEwngMoW2Z5KJNSdkPLyrQpUXk=;
        b=kL/yWnHg1RQhyUcFTcEl3mEq6+omQBtc1W8py8vonNjt9HJsiY/6SlzwL+Em14t0rc
         Nguxct/qoLygDSpGDRv6MH4+D3yhiqxCdxxRvMvkemIovdP7I5A1NKR+8TX8c+FufWK2
         3xwyKI9RUizzwYMWuOIOzsJ+6kihkdRJCcr4EP6eg16waV+5ZMi36ZvLNy6Je9J6Q1Xh
         L0wioE2m/sEJdRwXZwZ//CcfeekxSJCQPi4gyOEYLwn3IOB7aFNpmMj4m1DtByu9ZPNP
         /RbBmv7+JxjAYGk7ZahO8y5hygt7r+N8DvK/VlX/jlcor4EhdO4SlVr63Jp+WGsHz0CR
         of5g==
X-Forwarded-Encrypted: i=1; AJvYcCX5PLGH25YSGpgkuEvnoAM7YDQuwnuzoHgEvP+UrePH1zEk1zTGbWzZbP/FNmFTrEJiuE3R+RF3fkRz/j8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7qH5Pv5c3enF/anQ9paTyekMe6vpxV0vkqTeRNZeOXtx+mKdg
	AUmzGASgl+ZNmYxjLw9YU0F0+AsDQKmts8CQaGfxPJdc/w2DdF0c/O97dZ5uxNTQyisjw9nLNFK
	nBHoerxAnT1cei4YICV3ntu9+rM4i84IpLW5m6/Ql
X-Gm-Gg: ASbGnctCPj79UW3/VnNJuYkUG3BNUJVluyq5Ws5ljM64hpCpIBYFIZJdeiHqtwsci/t
	BGH5D85CQmwxr6nodIsU7Z97n1RQZI13oOV5ONzijhdiW+S2t6pnrPbtsqc9AuB18pnxaIZH4uA
	iyAd30qpzRcO+l3ZvsqtTH9veHhmwFaY2gQFcLN3LfXw==
X-Google-Smtp-Source: AGHT+IFqrPJvNW9iVjqMtiVGxxyxfOIHgXKwZV+dzGXNh2szHJk0PjHrH+NNe3mLT+cdIoCGgpanLE5d3wT07bR0Ro8=
X-Received: by 2002:a05:622a:5a8f:b0:494:a241:66b with SMTP id
 d75a77b69052e-4a5ae6c4c3bmr67310271cf.2.1749141983463; Thu, 05 Jun 2025
 09:46:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <9da42688-bfaa-4364-8797-e9271f3bdaef@hetzner-cloud.de> <87zfemtbah.fsf@toke.dk>
In-Reply-To: <87zfemtbah.fsf@toke.dk>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 5 Jun 2025 09:46:12 -0700
X-Gm-Features: AX0GCFtgnPEohGZ2uVye2RKfYCm-6BKWMKZxucSpWjZyosvCAx__0IlxI54G-Og
Message-ID: <CANn89i+7crgdpf-UXDpTNdWfei95+JHyMD_dBD8efTbLBnvZUQ@mail.gmail.com>
Subject: Re: [BUG] veth: TX drops with NAPI enabled and crash in combination
 with qdisc
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc: Marcus Wichelmann <marcus.wichelmann@hetzner-cloud.de>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, bpf@vger.kernel.org, netdev@vger.kernel.org, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Jamal Hadi Salim <jhs@mojatatu.com>, Cong Wang <xiyou.wangcong@gmail.com>, 
	Jiri Pirko <jiri@resnulli.us>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 9:15=E2=80=AFAM Toke H=C3=B8iland-J=C3=B8rgensen <to=
ke@redhat.com> wrote:
>
> Marcus Wichelmann <marcus.wichelmann@hetzner-cloud.de> writes:
>
> > Hi,
> >
> > while experimenting with XDP_REDIRECT from a veth-pair to another inter=
face, I
> > noticed that the veth-pair looses lots of packets when multiple TCP str=
eams go
> > through it, resulting in stalling TCP connections and noticeable instab=
ilities.
> >
> > This doesn't seem to be an issue with just XDP but rather occurs whenev=
er the
> > NAPI mode of the veth driver is active.
> > I managed to reproduce the same behavior just by bringing the veth-pair=
 into
> > NAPI mode (see commit d3256efd8e8b ("veth: allow enabling NAPI even wit=
hout
> > XDP")) and running multiple TCP streams through it using a network name=
space.
> >
> > Here is how I reproduced it:
> >
> >   ip netns add lb
> >   ip link add dev to-lb type veth peer name in-lb netns lb
> >
> >   # Enable NAPI
> >   ethtool -K to-lb gro on
> >   ethtool -K to-lb tso off
> >   ip netns exec lb ethtool -K in-lb gro on
> >   ip netns exec lb ethtool -K in-lb tso off
> >
> >   ip link set dev to-lb up
> >   ip -netns lb link set dev in-lb up
> >
> > Then run a HTTP server inside the "lb" namespace that serves a large fi=
le:
> >
> >   fallocate -l 10G testfiles/10GB.bin
> >   caddy file-server --root testfiles/
> >
> > Download this file from within the root namespace multiple times in par=
allel:
> >
> >   curl http://[fe80::...%to-lb]/10GB.bin -o /dev/null
> >
> > In my tests, I ran four parallel curls at the same time and after just =
a few
> > seconds, three of them stalled while the other one "won" over the full =
bandwidth
> > and completed the download.
> >
> > This is probably a result of the veth's ptr_ring running full, causing =
many
> > packet drops on TX, and the TCP congestion control reacting to that.
> >
> > In this context, I also took notice of Jesper's patch which describes a=
 very
> > similar issue and should help to resolve this:
> >   commit dc82a33297fc ("veth: apply qdisc backpressure on full ptr_ring=
 to
> >   reduce TX drops")
> >
> > But when repeating the above test with latest mainline, which includes =
this
> > patch, and enabling qdisc via
> >   tc qdisc add dev in-lb root sfq perturb 10
> > the Kernel crashed just after starting the second TCP stream (see outpu=
t below).
> >
> > So I have two questions:
> > - Is my understanding of the described issue correct and is Jesper's pa=
tch
> >   sufficient to solve this?
>
> Hmm, yeah, this does sound likely.
>
> > - Is my qdisc configuration to make use of this patch correct and the k=
ernel
> >   crash is likely a bug?
> >
> > ------------[ cut here ]------------
> > UBSAN: array-index-out-of-bounds in net/sched/sch_sfq.c:203:12
> > index 65535 is out of range for type 'sfq_head [128]'
>
> This (the 'index 65535') kinda screams "integer underflow". So certainly
> looks like a kernel bug, yeah. Don't see any obvious reason why Jesper's
> patch would trigger this; maybe Eric has an idea?
>
> Does this happen with other qdiscs as well, or is it specific to sfq?

This seems like a bug in sfq, we already had recent fixes in it, and
other fixes in net/sched vs qdisc_tree_reduce_backlog()

It is possible qdisc_pkt_len() could be wrong in this use case (TSO off ?)
