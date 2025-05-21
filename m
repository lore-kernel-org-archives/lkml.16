Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C100921D5B0
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 17:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747848082; cv=none; b=KMedfjT1C64/CfN1843YlP7i93IoziBqEVIuN4JZvCZq96lHOhbAW8006tdLmIIB3UzJcV/HbRNqzQQFOuPfUsWjEzl5YkdDj7papWa/OdbmbS2N6r7JhnyxmIo5wnNiH8i+PtsJtE7US0gM3AQDrAxsxsVjmlEWnz54J3NRH68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747848082; c=relaxed/simple;
	bh=cqtVnYMwytU621vRDMWnywFjE3FJFp4m1Fu1HokVKxE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pPrIHLi+mIucLCXl4E99Dw0rAPAwRiVtmivTUUAxA3TielLLrtB/FG7h1eiCWCBhzNSE68K4XmmsR2YsxoL52azUAqTBupv6T17ECivUHp6um6ZXEu085hG8++Skh7ESQRvdbhmmteft1KusBmagj2IBVB+HXz19QUgkS5FzHiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GPDeNWWG; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GPDeNWWG"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-231f37e114eso1056755ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 10:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747848080; x=1748452880; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8TzRULGTaOq2SCZGYjVrgxuJH6Vmk6OskDH6n5154vg=;
        b=GPDeNWWGsboLyTXFd3gYxjrakkGWca4DBDpTVsUqSi9QHLMAsJVXJ1vBMxpjOPdm+S
         /c8KWZetjQmL/qToPir7B9lz8FZXukFpaP9OTpdgILJZ44YI+pGCDs6X7vb/MGqXDJ1x
         P0hlTQJf9VGztFGiaoYRMo27tsokfmSvd6qbCquT3fxoTdvXko3qp8yR8smpEhNmuLUw
         twsCAykf74gh3XpQdqmuFS3AWTO4cmhmOKpaXcJX0oUo0PpvEyiCDt61YmLSupYdox5M
         XyW3bmVsuRG6JuwwvwA9Mvml5rhdW+Ik4KwUmScbChAfFK7mDt+SMR0aPdBZyN9JPzph
         XXLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747848080; x=1748452880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8TzRULGTaOq2SCZGYjVrgxuJH6Vmk6OskDH6n5154vg=;
        b=FjJuZhCov0vD82nIkRQUVLH6RqqPqFJGKFqnPBEeyKDORhwkNBIw7TyNF+gfnfg7Kk
         CZxmv/l5KBW/Z9bsKXzoPhILD0/e0cLBydrZXm/GwGdbgILGEI3jnhQzihqXVvQN8FpL
         QkpRKu8rHmQpIpxPzs+uavLzDzK8xbI+4QY7f6p8Fc0J9QKtETDKrl8wWEqNE/Kw3Agg
         EdmH55UhdOxtRLendqaAQ0qKTQJFpotCEp6mjncFcbQygcT5h92FOq9dB+OyPYJEugle
         nJ7ldxAEyOgU5A9qeP/VAYwKEBPnV+TZcpTQgAUZDqb935Q/IBeU8YEPzJ9HiNGCCD5S
         Nitw==
X-Forwarded-Encrypted: i=1; AJvYcCWxmYgQQMBU/wPtnVLknjq+9yFwkYe3hIGiufBDE8pkRxG29uzQHs/Ys5lbjWxKzfgUnojOBo0QOyrhMdE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmClLoo0eLtY5SLlON7TffInD9k5X+pRrWdPFaCNr8Omk74Isy
	lw6giy2EPYbq2p0QqFMJ4py7ZQ2JEp0CKAIMEOYVxJrIVPrd4yVY0VGEXwsIM7Vdgb2CBiTnEqH
	2EhVY7g1GGqQBtuoTt33epXLfqVdbnZEmOxhgsi8u
X-Gm-Gg: ASbGncvWTe5Bq0EsOTTix5zlZzdsM574qfxyJxIsTTkVabmWiALm1ry7JVr3unzzcv6
	P3GzqjESQrpXRDRcRt2UsiED4EXuxtEG/UxwdzAhih9HB9JsW6wJno7tzhzjdipyRthLUnqsIZ7
	r3WP2YM3HQQzbcIc6tVE9+4OR1BN5eUqQN57Yb79yWoNqwrfIEOJch0dEmaFK5yvEc7FJGx+CW
X-Google-Smtp-Source: AGHT+IHXSLEh1ng48lSqSLKU62F5dm1IpyqVjnrXWcmc9Cn5aEIx79tGlkJf4Cvd8k/BEpZgaiZIo4LCPAtmC17HrN4=
X-Received: by 2002:a17:902:f68a:b0:231:e976:a829 with SMTP id
 d9443c01a7336-232041664fbmr11191355ad.27.1747848079650; Wed, 21 May 2025
 10:21:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520203044.2689904-1-stfomichev@gmail.com> <20250520203044.2689904-2-stfomichev@gmail.com>
In-Reply-To: <20250520203044.2689904-2-stfomichev@gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 21 May 2025 10:21:06 -0700
X-Gm-Features: AX0GCFvIb1Mor4qHBJWuRsulh2MAvDR01XTEdcXxYf4IzCEkeO4dm8bvfQxtp1k
Message-ID: <CAHS8izNwpgf3ks1C6SCqDhUPnR=mbo-AdE2kQ3yk4HK-tFUUhg@mail.gmail.com>
Subject: Re: [PATCH net-next 2/3] selftests: ncdevmem: make chunking optional
To: Stanislav Fomichev <stfomichev@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, viro@zeniv.linux.org.uk, horms@kernel.org, 
	andrew+netdev@lunn.ch, shuah@kernel.org, sagi@grimberg.me, willemb@google.com, 
	asml.silence@gmail.com, jdamato@fastly.com, kaiyuanz@google.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 1:30=E2=80=AFPM Stanislav Fomichev <stfomichev@gmai=
l.com> wrote:
>
> Add new -z argument to specify max IOV size. By default, use
> single large IOV.
>
> Signed-off-by: Stanislav Fomichev <stfomichev@gmail.com>
> ---
>  .../selftests/drivers/net/hw/ncdevmem.c       | 49 +++++++++++--------
>  1 file changed, 29 insertions(+), 20 deletions(-)
>
> diff --git a/tools/testing/selftests/drivers/net/hw/ncdevmem.c b/tools/te=
sting/selftests/drivers/net/hw/ncdevmem.c
> index ca723722a810..fc7ba7d71502 100644
> --- a/tools/testing/selftests/drivers/net/hw/ncdevmem.c
> +++ b/tools/testing/selftests/drivers/net/hw/ncdevmem.c
> @@ -82,6 +82,9 @@
>  #define MSG_SOCK_DEVMEM 0x2000000
>  #endif
>
> +#define MAX_IOV 1024
> +
> +static size_t max_chunk;
>  static char *server_ip;
>  static char *client_ip;
>  static char *port;
> @@ -834,10 +837,10 @@ static int do_client(struct memory_buffer *mem)
>         struct sockaddr_in6 server_sin;
>         struct sockaddr_in6 client_sin;
>         struct ynl_sock *ys =3D NULL;
> +       struct iovec iov[MAX_IOV];
>         struct msghdr msg =3D {};
>         ssize_t line_size =3D 0;
>         struct cmsghdr *cmsg;
> -       struct iovec iov[2];
>         char *line =3D NULL;
>         unsigned long mid;
>         size_t len =3D 0;
> @@ -893,27 +896,29 @@ static int do_client(struct memory_buffer *mem)
>                 if (line_size < 0)
>                         break;
>
> -               mid =3D (line_size / 2) + 1;
> -
> -               iov[0].iov_base =3D (void *)1;
> -               iov[0].iov_len =3D mid;
> -               iov[1].iov_base =3D (void *)(mid + 2);
> -               iov[1].iov_len =3D line_size - mid;
> +               if (max_chunk) {
> +                       msg.msg_iovlen =3D
> +                               (line_size + max_chunk - 1) / max_chunk;
> +                       if (msg.msg_iovlen > MAX_IOV)
> +                               error(1, 0,
> +                                     "can't partition %zd bytes into max=
imum of %d chunks",
> +                                     line_size, MAX_IOV);
>
> -               provider->memcpy_to_device(mem, (size_t)iov[0].iov_base, =
line,
> -                                          iov[0].iov_len);
> -               provider->memcpy_to_device(mem, (size_t)iov[1].iov_base,
> -                                          line + iov[0].iov_len,
> -                                          iov[1].iov_len);
> +                       for (int i =3D 0; i < msg.msg_iovlen; i++) {
> +                               iov[i].iov_base =3D (void *)(i * max_chun=
k);
> +                               iov[i].iov_len =3D max_chunk;

Isn't the last iov going to be truncated in the case where line_size
is not exactly divisible with max_chunk?

> +                       }
>
> -               fprintf(stderr,
> -                       "read line_size=3D%ld iov[0].iov_base=3D%lu, iov[=
0].iov_len=3D%lu, iov[1].iov_base=3D%lu, iov[1].iov_len=3D%lu\n",
> -                       line_size, (unsigned long)iov[0].iov_base,
> -                       iov[0].iov_len, (unsigned long)iov[1].iov_base,
> -                       iov[1].iov_len);
> +                       iov[msg.msg_iovlen - 1].iov_len =3D
> +                               line_size - (msg.msg_iovlen - 1) * max_ch=
unk;
> +               } else {
> +                       iov[0].iov_base =3D 0;
> +                       iov[0].iov_len =3D line_size;
> +                       msg.msg_iovlen =3D 1;
> +               }

Do you need to special case this? Shouldn't this be the same as max_chunk=
=3D=3D1?

>
>                 msg.msg_iov =3D iov;
> -               msg.msg_iovlen =3D 2;
> +               provider->memcpy_to_device(mem, 0, line, line_size);
>
>                 msg.msg_control =3D ctrl_data;
>                 msg.msg_controllen =3D sizeof(ctrl_data);
> @@ -934,7 +939,8 @@ static int do_client(struct memory_buffer *mem)
>                 fprintf(stderr, "sendmsg_ret=3D%d\n", ret);
>
>                 if (ret !=3D line_size)
> -                       error(1, errno, "Did not send all bytes");
> +                       error(1, errno, "Did not send all bytes %d vs %zd=
", ret,
> +                             line_size);
>
>                 wait_compl(socket_fd);
>         }
> @@ -956,7 +962,7 @@ int main(int argc, char *argv[])
>         int is_server =3D 0, opt;
>         int ret;
>
> -       while ((opt =3D getopt(argc, argv, "ls:c:p:v:q:t:f:")) !=3D -1) {
> +       while ((opt =3D getopt(argc, argv, "ls:c:p:v:q:t:f:z:")) !=3D -1)=
 {
>                 switch (opt) {
>                 case 'l':
>                         is_server =3D 1;
> @@ -982,6 +988,9 @@ int main(int argc, char *argv[])
>                 case 'f':
>                         ifname =3D optarg;
>                         break;
> +               case 'z':
> +                       max_chunk =3D atoi(optarg);
> +                       break;
>                 case '?':
>                         fprintf(stderr, "unknown option: %c\n", optopt);
>                         break;
> --
> 2.49.0
>


--=20
Thanks,
Mina
