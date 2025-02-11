Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F301324C66E
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 12:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739275918; cv=none; b=F6iFcc15w5l0Yzn0HB0bAf69H2t6wFgIV+DFqL9NHjvDrms6Vat2ybY3dbKT0ohjyo0jCrgtQHyrXfydvqEgBX8p9oyA45lus3TvDzjcy4gdN6GpmWiFkK0D3LGGl0SLUIHD1WWBv6nm0xp4fIfGRgclVhNB9feB+fBAiz0Fl68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739275918; c=relaxed/simple;
	bh=9kUhc7xl6mK6FtG9qv/EtCxmuNix+RvSOrWwAt/0ImY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=awIencfbKfH1rR0xhUAYVElMTm7DrJo0XdG5/ps7Bm/FsVgj0N4IrZ+Y2F/unKN2PBftJKklvgXaJGdwmYyZBezGA7/vgLZqvVdzXqkYK4yH6Z36ANpquxkk2p9DQkhjK6iKfSi9rjqEwDpUKdoB2Aw3m+Mj+HjmN8CcVka+gV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FWzCX/nN; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FWzCX/nN"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5de47cf9329so6779253a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 04:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739275915; x=1739880715; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=noORodC8eJauXHSwu7JFMsa7CCMymPsH7IaAfTCYkT8=;
        b=FWzCX/nNJRdhr9beVdlLQJKSYGmQoWrLnlUVihL7Ezz3AMKvguGtxyEP9n9cyFRD7d
         IGN7Gbr+3qja/Cn8G/ysubw1SVBMaQDQeXFzqejvBv07hA7lZPsbPWr/ZUZL388s/GPx
         4AZ8/iZmV+whrqmWIBwQ3LCP3lnVKACI8D6ZUhYuciZ0/DjVKEaMSo/0MlFAjFMLpPwt
         FQQFrGhD4kFdXSlp6/1mOvq9G1jIdv5NbNGoTYPCvfaxdbHIkjsYEB5FykTAX0nb+mcG
         ugx9O/FHKFsiOri1Ah/Mr05gfSGM8m87e0rja2Xa9cQZWLpFz/KKTQH4IXaU7avQ6nWr
         yaVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739275915; x=1739880715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=noORodC8eJauXHSwu7JFMsa7CCMymPsH7IaAfTCYkT8=;
        b=csm3z5DtUagb6P5bWt/kas+fty9dNdr1SENzIUcRJoyes56/IUa/lO+iorttVtQa4l
         WeCaFfIMpktJ1DEz0vMFf9vEFiNfwGPyULOBhE8aauDDidwBiwSRCFA/QRPKLWqBm2xP
         RvNezNJbHpEKO6LJc75bTjqKXO4CNINr3CZfHA9Qr6MGW0hXWityUMeGrjJgatCrGd61
         3pTO09r+9ttluVeR6kKSMhhScOTxrxt9YRQyYhFDdUV00a7BDGfbVb+XxLTC82v4+WOS
         rBTYcOYH2SnscnmXyKeGNuXhujpKQelJOyFEDJJsYFtQYa7FDteaJ2d3T0Mwn7lD+R1V
         Qu1A==
X-Forwarded-Encrypted: i=1; AJvYcCUGjh/mggXwZYH1wbR4z+gMu99U69nu1a/ZeaAPZm/6b14jO1poA9lUYGKTj+bF6fg3tlplsdS09ESZ1ks=@vger.kernel.org
X-Gm-Message-State: AOJu0YyU8G7vtjiPhnZ3EzLk7CvbPlcq9XrLoNbrk3ggriQeLUNZHn0I
	f3MfCjI9ZnVu5dV8YtbecRp+kRPegp1WCKDAoEB/uGfC+8UDsFWykW2kE+TkV6lsZZO0G7tmtkp
	GEx69P7VfBmOVjUctMqgzSgavzN5wdIYXNtR5
X-Gm-Gg: ASbGncvaSkxrp/kBko0XTstLmzoEI8ZCC0xU6MMqsWrYRtZYshgnJhcEdGgAM3TS4yo
	QXkbce7h4BHloh5puwHq03JnSXgK9XvzY8S+OgmIrQJc3vutDGD1bHNfF0sc1CBUe02rzvyo=
X-Google-Smtp-Source: AGHT+IFBxztBYpfICsyJIWE1dpWOwhxEB7LLhq6al5vWh0ZOYPHdFhb048EfHLyedbvE6WIgBTPV4R+XdwEIM3DCXhA=
X-Received: by 2002:a05:6402:254e:b0:5dc:7374:2638 with SMTP id
 4fb4d7f45d1cf-5de9a394514mr3181412a12.7.1739275915228; Tue, 11 Feb 2025
 04:11:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <SY8P300MB0421A0CA0D6C69A8BE4767A7A1FD2@SY8P300MB0421.AUSP300.PROD.OUTLOOK.COM>
In-Reply-To: <SY8P300MB0421A0CA0D6C69A8BE4767A7A1FD2@SY8P300MB0421.AUSP300.PROD.OUTLOOK.COM>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 11 Feb 2025 13:11:44 +0100
X-Gm-Features: AWEUYZkkWwiCaZee0oA7l-edrRXJciPS57JSeEV9SVREQ1J2ULGF-WM2UrxXs84
Message-ID: <CANn89i+7cj3y05h9ee1ha1dykbSx6J=7QubBp7NMphQqtpA1iA@mail.gmail.com>
Subject: Re: BUG: corrupted list in nsim_fib6_rt_destroy
To: YAN KANG <kangyan91@outlook.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"syzkaller@googlegroups.com" <syzkaller@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 1:04=E2=80=AFPM YAN KANG <kangyan91@outlook.com> wr=
ote:
>
> Dear maintainers,
>
> I found a kernel  bug titiled "BUG: corrupted list in nsim_fib6_rt_destro=
y " while using modified syzkaller fuzzing tool. I Itested it on the latest=
 Linux upstream version (6.13.0-rc7) .
>
>
> After preliminary analysis, the bug is triggerd in  nsim_fib6_rt_destroy =
function  drivers/net/netdevsim/fib.c
> when kernel try to delete node from list :  list_del(&fib_rt->list);
> the node has already unlink from the list.

This analysis seems to be AI generated, this is literally rephrasing
the call stack.

>
>
> If you fix this issue, please add the following tag to the commit:
> Reported-by: yan kang <kangyan91@outlook.com>
> Reported-by: yue sun <samsun1006219@gmail.com
>
>
> I hope it helps.
> Best regards
> yan kang
>
> Kernel crash log  and reproducer are listed below.
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Syzkaller hit 'BUG: corrupted list in nsim_fib6_rt_destroy' bug.
>
> netdevsim netdevsim0 netdevsim0 (unregistering): unset [1, 0] type 2 fami=
ly 0 port 6081 - 0
> list_del corruption. prev->next should be ffff888112b16f28, but was 00000=
00000000000. (prev=3Dffff8881083184a8)
> ------------[ cut here ]------------
> kernel BUG at lib/list_debug.c:62!
> Oops: invalid opcode: 0000 [#1] PREEMPT SMP KASAN PTI
> CPU: 0 UID: 0 PID: 9911 Comm: kworker/u8:4 Not tainted 6.13.0-rc1 #5

This is not 6.13.0-rc7
