Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DEB21324E
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 19:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747854545; cv=none; b=n9qblQdegPQOR7E02WgZzIOge/PYYsCAFW7wkAbTs7b+3wuSIpj2H5/Jog9u3whyeCPNSsz4e9RyWkovZ6+YUSnedJCWAj8O9+/Ee14XWn7Bbmp2A1Yi5/L9YvWoCEQTi/hgggd4R/LujRNWM29qVJ9n7T0AdNSexLjfN1izKnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747854545; c=relaxed/simple;
	bh=SJqs4V4Z4NrLdoa5NnRiq4ZO4scndXvarNLEsCzRCLI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dzDTR6nvwcyw1ABlslt5PPO/QEoacVaglGIFlFkOierXpnCnOcf2ox2j/lZX8UwBI+DhmV6OougzAYA+Nt7AyVY9lNb8xa25ADQ8wnnpT7qI8T3XJZCYI0DEB9i2iy9siyklLDrGvMVaosmv89MOhmtE97G1NENImVsWhyknyB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pc/3Wx9i; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pc/3Wx9i"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-231f37e114eso1084625ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 12:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747854543; x=1748459343; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rNrLNL//c/djngHHBKOCT2qv2jkA1BIgT8d0hjVFiq4=;
        b=pc/3Wx9iI1WFNA5zAipg6GqNp/CN26P5hRzmkbobNjblYRtKPyuV8kqChGvSpnGsqc
         Jw8P/MIhi3LybNjbkfvIhgiOSOlPwjfSpLFIQDzws9GEhGSSzS17zcPKl7/q/tEql5zp
         oC7LCD+FSSFRhbv3j4O5kQmdyqzxOmngnXVDEQoX5La9pjvVdzOALlxkxEGBIyEuxG/i
         UkJVyDxOCgxDcFhSmIzCeddnRTLrmDGNcYogw6h07eA0Mbv1LTDlUNOPI0Wr+TxZDewc
         g1Lx6EwRV5rTz0fnHFnXJnpkRxAJgM5VGohfWCPyz6w8omvoDm/ixWUiQNXKe38XvrHg
         AAMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747854543; x=1748459343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rNrLNL//c/djngHHBKOCT2qv2jkA1BIgT8d0hjVFiq4=;
        b=NAbEGSVOp2MG13vVCnylTHfZ5uFzO1Kq6XwuItxSFlpEWjWlpZsA8Cxd+jhUUyB1XK
         sbdE1qO/Yav2WRRzGEav6ZJSgn0RuicQuxnWyB16x0PKijr7jRd5Vy5XJY7W7r3blYiy
         c/j7DvXz3hwHig7PNFYBfnM1ce4OS6NsRkRslJ0S6lfdbyqM/MaYESTTQkllp6y+mH3l
         HSc3iSqbb2tFdEgutA8sWi0GLZAX4/6S9bKObItYQNJyZHUr48czgilUPdO0OibvNyde
         AX/FDRzwiO8tUMvaa898Mn95+syFKTXgLGXrY3nEcC3XpvLs6V3m/gsDZmo/SPY3wz4x
         sB8w==
X-Forwarded-Encrypted: i=1; AJvYcCV2j7pWMMTa4uvxKAum0eTmh6YCcKGBsVGlZ/ii8jw7kMJjYkRObdliTN8HjzF162DCXhW/iR0DOPsEepc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd0BEa6Mx95PbHaiAaFE0uvM0l7utKIgZF12s3Bc/w+i0QQ/2r
	FgnFs27TYlSTYw/3jfT6llG+E+ixUHj6R0CqmIKaIA93wUy/b+oXhHV7IPAzzpWKWd3Yn/iMjwg
	L0t7lPhi/Kvgc/NIwHocM9klY3wZUO9kNDHQVeMTE
X-Gm-Gg: ASbGncvGaCbIAQeYj7YjsGQ5PoiNhiND/AQTsa9UYp0McydsKLuuu79973nHl3sL6Jc
	sErSSjJ5KhFJiJL6Qq/Eu9rSCbU+Gd0esNthNupgIloKX9ySZI7LS1zvbnN9T3A4nS5abiKiecO
	/Wgh/bWelZhaNc2280benXnxiWqS0fkMBbmsza6efKvb2VhR6IDXKfyBPn2717kVaZMRPluTmsB
	w==
X-Google-Smtp-Source: AGHT+IHE9roNm/GU1ecC3oih87HtHR/ezayJ8NjLlKTqpuVjFpk3YUrcUNBMyu0ZPHDkuWuY9KPXnxBmD9oaZYRvboQ=
X-Received: by 2002:a17:903:182:b0:231:e321:1230 with SMTP id
 d9443c01a7336-231ffd35651mr12736555ad.16.1747854542525; Wed, 21 May 2025
 12:09:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520203044.2689904-1-stfomichev@gmail.com>
 <20250520203044.2689904-2-stfomichev@gmail.com> <CAHS8izNwpgf3ks1C6SCqDhUPnR=mbo-AdE2kQ3yk4HK-tFUUhg@mail.gmail.com>
 <aC4PtKAt5QF655uZ@mini-arch>
In-Reply-To: <aC4PtKAt5QF655uZ@mini-arch>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 21 May 2025 12:08:49 -0700
X-Gm-Features: AX0GCFvoyRF1S3GC8su89a3s63DdRZ_anIDgkI-bbwVWk8TOV23U5DQe7iZ1qvc
Message-ID: <CAHS8izMUuS95ksQSKUQgTwFU-i5xh4dyGwHRavNRON_rS=9FrA@mail.gmail.com>
Subject: Re: [PATCH net-next 2/3] selftests: ncdevmem: make chunking optional
To: Stanislav Fomichev <stfomichev@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, viro@zeniv.linux.org.uk, horms@kernel.org, 
	andrew+netdev@lunn.ch, shuah@kernel.org, sagi@grimberg.me, willemb@google.com, 
	asml.silence@gmail.com, jdamato@fastly.com, kaiyuanz@google.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 10:39=E2=80=AFAM Stanislav Fomichev
<stfomichev@gmail.com> wrote:
>
> On 05/21, Mina Almasry wrote:
> > On Tue, May 20, 2025 at 1:30=E2=80=AFPM Stanislav Fomichev <stfomichev@=
gmail.com> wrote:
> > >
> > > Add new -z argument to specify max IOV size. By default, use
> > > single large IOV.
> > >
> > > Signed-off-by: Stanislav Fomichev <stfomichev@gmail.com>
> > > ---
> > >  .../selftests/drivers/net/hw/ncdevmem.c       | 49 +++++++++++------=
--
> > >  1 file changed, 29 insertions(+), 20 deletions(-)
> > >
> > > diff --git a/tools/testing/selftests/drivers/net/hw/ncdevmem.c b/tool=
s/testing/selftests/drivers/net/hw/ncdevmem.c
> > > index ca723722a810..fc7ba7d71502 100644
> > > --- a/tools/testing/selftests/drivers/net/hw/ncdevmem.c
> > > +++ b/tools/testing/selftests/drivers/net/hw/ncdevmem.c
> > > @@ -82,6 +82,9 @@
> > >  #define MSG_SOCK_DEVMEM 0x2000000
> > >  #endif
> > >
> > > +#define MAX_IOV 1024
> > > +
> > > +static size_t max_chunk;
> > >  static char *server_ip;
> > >  static char *client_ip;
> > >  static char *port;
> > > @@ -834,10 +837,10 @@ static int do_client(struct memory_buffer *mem)
> > >         struct sockaddr_in6 server_sin;
> > >         struct sockaddr_in6 client_sin;
> > >         struct ynl_sock *ys =3D NULL;
> > > +       struct iovec iov[MAX_IOV];
> > >         struct msghdr msg =3D {};
> > >         ssize_t line_size =3D 0;
> > >         struct cmsghdr *cmsg;
> > > -       struct iovec iov[2];
> > >         char *line =3D NULL;
> > >         unsigned long mid;
> > >         size_t len =3D 0;
> > > @@ -893,27 +896,29 @@ static int do_client(struct memory_buffer *mem)
> > >                 if (line_size < 0)
> > >                         break;
> > >
> > > -               mid =3D (line_size / 2) + 1;
> > > -
> > > -               iov[0].iov_base =3D (void *)1;
> > > -               iov[0].iov_len =3D mid;
> > > -               iov[1].iov_base =3D (void *)(mid + 2);
> > > -               iov[1].iov_len =3D line_size - mid;
> > > +               if (max_chunk) {
> > > +                       msg.msg_iovlen =3D
> > > +                               (line_size + max_chunk - 1) / max_chu=
nk;
> > > +                       if (msg.msg_iovlen > MAX_IOV)
> > > +                               error(1, 0,
> > > +                                     "can't partition %zd bytes into=
 maximum of %d chunks",
> > > +                                     line_size, MAX_IOV);
> > >
> > > -               provider->memcpy_to_device(mem, (size_t)iov[0].iov_ba=
se, line,
> > > -                                          iov[0].iov_len);
> > > -               provider->memcpy_to_device(mem, (size_t)iov[1].iov_ba=
se,
> > > -                                          line + iov[0].iov_len,
> > > -                                          iov[1].iov_len);
> > > +                       for (int i =3D 0; i < msg.msg_iovlen; i++) {
> > > +                               iov[i].iov_base =3D (void *)(i * max_=
chunk);
> > > +                               iov[i].iov_len =3D max_chunk;
> >
> > Isn't the last iov going to be truncated in the case where line_size
> > is not exactly divisible with max_chunk?
>
> I have this for the last iov entry:
>
>    iov[msg.msg_iovlen - 1].iov_len =3D
>            line_size - (msg.msg_iovlen - 1) * max_chunk;
>
> I think that should correctly adjust it to the remaining 1..max_chunk
> len?
>

Thanks, I missed that line.

Reviewed-by: Mina Almasry <almasrymina@google.com>

--=20
Thanks,
Mina
