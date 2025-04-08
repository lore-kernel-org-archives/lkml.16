Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D8A20A5EE
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 23:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744153858; cv=none; b=QQIlZevQk4me/LmEU3g8Wlvn9xcAvvok6IgkoPcb4a8vv6bTxx1ZzttuRrdYmpXzq3g9Xwx4SnpK0rakU8RTph5UDzMtZMtBUG2dx8uUSrfvI7nAsLPyVbUdCJkOkDdrdAvveblwKQALlG/AeXJY3n8dzBguHoVZ6dYtvCWGlhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744153858; c=relaxed/simple;
	bh=AmHad/9/i/5F/5p9sUG9/4/r8US4xLS3IaPYNjUKK50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CmpdMPpXSwAwUU7contIkzDFgpcgJCDDu+4c0N0tCClbmfb2CN+Wk9hqWgV6CfjPPjGhq8opKvmgTm7pGzBjHWdYe/PZIpdhwUF/W6Ax1ZBNPayHpUewUJ+4Sq8RHzSLattgcmCn4dwwUziKY9R68qU19X4sv/w0gYu21U/4uqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FsbwV0Q8; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FsbwV0Q8"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cfe808908so26045e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 16:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744153855; x=1744758655; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1FIuCowBhNP8eAFX/hLBNl3HpsjGHnEOZ9EDbTavv8=;
        b=FsbwV0Q8peCUjUhkIGz/zw8afkDHcQBMdqkpiIWRsNvqpKpSNA2mgtVPst1lJ3HNy4
         0eKrxjkrODmdFDk8hpJtvmcdvIt/M0fImXeHgLPTyNRrkj+c7GYrrw4BJi4f/ZIYhig8
         4i1FekgGMgllBa6A2abw6huv+mOFs29Sgk+FfNZFES+bTMmOUbxnqpQzKm8BjFdxpXPL
         IrQwlMHWjn/6yIuQsPJGTEBs7gxlLQrb5cXExnl9kLqrrsPCTKnR+hPSC0EHDpAM0gEu
         uyt5fixW1fyBbc3lDpZVtbrWiW/fHUJRWSKQlriQH7ulzzzF2qjxS3XgWXfix0nDi9Q/
         fKOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744153855; x=1744758655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p1FIuCowBhNP8eAFX/hLBNl3HpsjGHnEOZ9EDbTavv8=;
        b=j2aomAHJLeWHX5u928wuWi5sh/FKFxDZNgS7h7UHJADKL9r0g/YBAVdlnW9r777rJH
         TjqQfzE/uM+B44mjxhhmyDUisaPUxcpF4UYRYnf0CcbXmRo45fT9eoZ+Y9p4u8kuybvY
         eJxsql/P6iREX9QQdu34PWJ4jGmigSHj6BsH3QoEVp37p2bQiY5oZQOaFy/3ZuAlKDXN
         dfD5NzBYH4PUECtv6MvKTfas0/NEHCJhl8YJo7ozJmXHrwynpD/7E37BbVPLVRb947nj
         lz8YgBoEIkgrKKg6aEdME+WQ2GupOxObEpqZhZePSVu/xdNNcl7+PQk2dQEtKQYoKvna
         4NWg==
X-Forwarded-Encrypted: i=1; AJvYcCWT/GCiUJSkt2cSY1Ae8l/82nKgeGZ/DFkfU+8dOl9BlFBm/E/YcRfHmC7jV7fqz09Yhj6TfDUodPjLYPc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqdFOArQzEPAi8OLOXJXPA1/6Ymo1koWwGA1htBfp1rvfMiBCQ
	VqJVfM4tP/GZ0psDWD/FWHvLI4MobigQUv1aqC1wyg7jcjStNlFtD82Zg/R8nvPLPevugC+iXM/
	ChoRoT6pUshm3MHvFntJItaTyKD2//Vwz+mpd
X-Gm-Gg: ASbGncveOPY7vIkuvm+CV3Bc2qm9/56eGSwEpql6ASOdj3ezEARtrzT7ysiGZwK+lNr
	EcL3O5MIh+J/By/tjcUtu2QYa2K+OAr7wx71X9rq4m80ZVoU9ngvDXViQdPVvYU2LyDbV5nv+u0
	W0+g+D8tsUtjyeSTkUJFa/KlUeljon39UFfTzVt6e7vDpeoCm6f4LpOEGT
X-Google-Smtp-Source: AGHT+IHtmJsZweKCrbbqwaUHqVQ1I9oMcMfjxlUv4b9n4peqYq8L26ce4QJf6P66ACUUpyd7QK/r7U1/kKhWroPfCG8=
X-Received: by 2002:a05:600c:4306:b0:439:7fc2:c7ad with SMTP id
 5b1f17b1804b1-43f201a31bcmr166515e9.7.1744153855212; Tue, 08 Apr 2025
 16:10:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407225953.1540476-1-tjmercier@google.com> <803bf3ec-08ff-49c5-8bf1-1fa27f2477e7@linuxfoundation.org>
In-Reply-To: <803bf3ec-08ff-49c5-8bf1-1fa27f2477e7@linuxfoundation.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 8 Apr 2025 16:10:43 -0700
X-Gm-Features: ATxdqUG1OoE2CMkkaqsYCCXq5FVoSq_bvFdrW8lZVpZuUolfHdkXToOu7iRDnOA
Message-ID: <CABdmKX2ijnYtoJnSoXQOboNrsuyRvT6KoUqdD4koPBu4LtRy6g@mail.gmail.com>
Subject: Re: [PATCH] tests/pid_namespace: Add missing sys/mount.h
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Christian Brauner <brauner@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Alexander Mikhalitsyn <alexander@mihalicyn.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 3:48=E2=80=AFPM Shuah Khan <skhan@linuxfoundation.or=
g> wrote:
>
> On 4/7/25 16:59, T.J. Mercier wrote:
> > pid_max.c: In function =E2=80=98pid_max_cb=E2=80=99:
> > pid_max.c:42:15: error: implicit declaration of function =E2=80=98mount=
=E2=80=99
> >                                         [-Wimplicit-function-declaratio=
n]
> >     42 |         ret =3D mount("", "/", NULL, MS_PRIVATE | MS_REC, 0);
> >        |               ^~~~~
> > pid_max.c:42:36: error: =E2=80=98MS_PRIVATE=E2=80=99 undeclared (first =
use in this
> >                                    function); did you mean =E2=80=98MAP=
_PRIVATE=E2=80=99?
> >     42 |         ret =3D mount("", "/", NULL, MS_PRIVATE | MS_REC, 0);
> >        |                                    ^~~~~~~~~~
> >        |                                    MAP_PRIVATE
> > pid_max.c:42:49: error: =E2=80=98MS_REC=E2=80=99 undeclared (first use =
in this function)
> >     42 |         ret =3D mount("", "/", NULL, MS_PRIVATE | MS_REC, 0);
> >        |                                                 ^~~~~~
> > pid_max.c:48:9: error: implicit declaration of function =E2=80=98umount=
2=E2=80=99; did
> >                 you mean =E2=80=98SYS_umount2=E2=80=99? [-Wimplicit-fun=
ction-declaration]
> >     48 |         umount2("/proc", MNT_DETACH);
> >        |         ^~~~~~~
> >        |         SYS_umount2
> > pid_max.c:48:26: error: =E2=80=98MNT_DETACH=E2=80=99 undeclared (first =
use in this
> >                                                                 functio=
n)
> >     48 |         umount2("/proc", MNT_DETACH);
> >
> > Fixes: 615ab43b838b ("tests/pid_namespace: add pid_max tests")
> > Signed-off-by: T.J. Mercier <tjmercier@google.com>
>
> Change the short log to include the subsystem. Send v2 with this
> change.
>
> selftests: pid_namespace: Add missing sys/mount.h
>
> thanks,
> -- Shuah

Done, thanks!
https://lore.kernel.org/all/20250408230204.2775226-1-tjmercier@google.com/
