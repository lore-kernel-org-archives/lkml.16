Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FAF2989A7
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 10:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751019581; cv=none; b=XZJdvhU1ivsM9JD+3xOxCQ/CSi5Lvd8e9YhaK3ZcM5v/XBf2NzRoMazZ5PTHFZXPUj6iO00jukg3FtcL4DuEPsW4ax6nKs7C3/7QCaw+Hb3CoiJSYcFySsLYUh4GVznOyHOoBQmDOWhml1UjE2Xxco/2/AxBR6TQWc0Ymarmsf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751019581; c=relaxed/simple;
	bh=VT0SNElymWMyAmHo/BlHqxqUjs2SuhiKv/mBEoBfRe0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oy2i2BkLCz3wDkdGhGGMROSIU8p76PC6L3LR/1QZMg89b8wbgBPePfzXY7IswHTme+zsYGP9iko21mXQUcNJIWwxRNIhte5txq8ZiD5odh/LfqSjDdB/VJ1XWM34dm9z2CYlgf0xVv9BewHW29Dp56XADKzciG6upF9mo4MdKdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VE8XFQX/; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VE8XFQX/"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7d21cecc11fso318996985a.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 03:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751019578; x=1751624378; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4W27Bdrl+lJBvU0tDOv/G18DYor/BrpM+MFHb+g+6E4=;
        b=VE8XFQX/75BtcYLSXterYAbvaupMBVdsEtiy+6rsAxuZLiTeV0nA+h9UZlX90WfMKS
         jYGfCy2Y/zUXLAlaGPtsEWTlIoN/Z+7VB6wDxhc8sKNrvuq4mfX9LvwTmWWirdLOUN3P
         /vwW63jaJim6e0wCwhWEtamdy/pp0Y1QmuWcEVrxfyMIljRQivBaheScYddXYVQ0wAkl
         aZ92NcQGLbFuCywwRSJSejXc9VA3fVBWFadwOLFsQiw/s2LFyUZJPb8xC2r+VA/EAwhB
         4zjI+/Vf06k5/xbZs+Y3GMCNLzsYuCFixAzXhzUcvWxjdE/H+bTwY8N9S2pLDGpmIMj7
         6QOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751019578; x=1751624378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4W27Bdrl+lJBvU0tDOv/G18DYor/BrpM+MFHb+g+6E4=;
        b=MPKAS4+a7oLO2CeUfVxAEBHcz01oGJvenwKJ1ZpqNgFg3/sUJr1WsknC6NRU8QVzZd
         P7TW79KWkXIXjDGO4uJfElKzEKCDbtB12HcuqMy3SSEZ2Cj1lMIopZsazaKDgBgGUSLl
         mX1uQQagcpHfEbhhd5p3HUclbYXjlqk/anTNAkjPFlgfeCADE02zI02oNsFtTroV/lf8
         rXVLdsP7VpvwhQQT5ltAObaP4ZrlY3mCzE6Utn8l4vYVpqN3H4kAlgNQP8XF+F/MEbKd
         sUuJUdmrK75eWUXA3EL9jSja5Qfg5tQK0xnJ03Jo41O3DnUxTigz+uldpBRYswTMMRvw
         vyCw==
X-Forwarded-Encrypted: i=1; AJvYcCXSoJP3UkcPyQjszw8Jj6s/32G0FgQWuWkM7+vuhDq0KgJZLqortP+erK9xpVRFpJfj6qOjVjjtmsXVX5w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiIt2ZTzmG7qogzojie7SGsr2bBthayw+RSe0Pd3fzCLa7Bbpz
	d1wv4EBPk24cp7r3wc2ELzBKduhvj0biVnhQDj4ac4OKnYHUe8AJG04Zo3cGpgs/Kc8xYHHXnKQ
	dYZvZI9TAbQ/9ax5G2s/Ro9wWr8xdtMIAMAkQMkk/
X-Gm-Gg: ASbGnctxtZzMAPE9wVnEjezeOLNKYKz3qqRwM1ShzGyWd5GmYnOZzO1ff7ftM4maGSq
	fUuq1ow8kzXQlwQZKy/zDC7wEiidSYqGaDqF0YfgiNeN+dr78inr3k7ie+9hwSHMohPro5OoiEd
	YZBBoeaa0nWc0wx22a/3XlSTdHppcCPc44Hiu7oudTgw==
X-Google-Smtp-Source: AGHT+IGhssF/7OwJw+s/lmqvSRhKlybAUXJRtUQ5h6FWADwBZyzZMTJ8Pf6cmRE/TiIyagH7u4kAOPO7J2gAwcqURbc=
X-Received: by 2002:a05:620a:3624:b0:7d4:219:50d4 with SMTP id
 af79cd13be357-7d443992b74mr269767885a.34.1751019578183; Fri, 27 Jun 2025
 03:19:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627094406.100919-1-yangfeng59949@163.com>
In-Reply-To: <20250627094406.100919-1-yangfeng59949@163.com>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 27 Jun 2025 03:19:27 -0700
X-Gm-Features: Ac12FXw-auM3OX9rpgkyk_nstk8T5gkiOxE7Zr8Bgud1mZDhXjqhjvhmZDAmdJ4
Message-ID: <CANn89i+JziB6-WTqyK47=Otn8i6jShTz=kzTJbJdJgC0=Kfw6A@mail.gmail.com>
Subject: Re: [PATCH v2] skbuff: Improve the sending efficiency of __skb_send_sock
To: Feng Yang <yangfeng59949@163.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	willemb@google.com, almasrymina@google.com, kerneljasonxing@gmail.com, 
	ebiggers@google.com, asml.silence@gmail.com, aleksander.lobakin@intel.com, 
	stfomichev@gmail.com, yangfeng@kylinos.cn, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025 at 2:44=E2=80=AFAM Feng Yang <yangfeng59949@163.com> w=
rote:
>
> From: Feng Yang <yangfeng@kylinos.cn>
>
> By aggregating skb data into a bvec array for transmission, when using so=
ckmap to forward large packets,
> what previously required multiple transmissions now only needs a single t=
ransmission, which significantly enhances performance.
> For small packets, the performance remains comparable to the original lev=
el.
>
> When using sockmap for forwarding, the average latency for different pack=
et sizes
> after sending 10,000 packets is as follows:
> size    old(us)         new(us)
> 512     56              55
> 1472    58              58
> 1600    106             79
> 3000    145             108
> 5000    182             123
>
> Signed-off-by: Feng Yang <yangfeng@kylinos.cn>

Instead of changing everything, have you tried strategically adding
MSG_MORE in this function ?
