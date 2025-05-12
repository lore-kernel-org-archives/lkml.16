Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CDB185E4A;
	Mon, 12 May 2025 06:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747032983; cv=none; b=gPnCt4TYftXfcSS4mP6MHdaQTWP/cNYwtxTEWQcQMlzShljg+GF8hT07ya5HlwPe7vBhn0xc/JCsn42ic8RsJyLg7EEwYJAtUqZL4Zrqc9kKo1GoyFGr9oksYlMcsUO+R6sbI35MN5cK76C9gwVBpD3j4ia6YnwlglWYwoyXCkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747032983; c=relaxed/simple;
	bh=JScEE0sqpFGbRHc2CWcKwMrOfDcxQMU0VBJzQxhA6GY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PH8+HYuotha6r3Blkn6dN1a5nTaAMSLO6yzBsKptOazO4486osA0t8gjviJ0K1NxvlRrBybRsKq5XuR65+8GF8byJp0iD9HUoyfjF57kCbtM4Tpc+Bi21xI0Lrn2koDP/rgvav3OkC6MRPcMTaJiMxukwfGLvo9ioS8F+F2bpkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MNYLdDfK; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MNYLdDfK"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3d817bc6eb0so21038705ab.1;
        Sun, 11 May 2025 23:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747032981; x=1747637781; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JScEE0sqpFGbRHc2CWcKwMrOfDcxQMU0VBJzQxhA6GY=;
        b=MNYLdDfK5SRGFwq2bPbmbbGdLoKh8P78YDtfsKhE/w4FLqsw9AiN/jfuPaod983QKL
         IGmALDDbR9jnLf+9KOQ4Bz+urgWUApgxeG1p5iSQEIeqFYzs7KXZLREpvA/6cbT3vcEx
         IXHYU9lYyi9kbJstB0LbXEV15AL9V7/F2lKPJOeJfqhtFpgBlXEpHeWDIXuEr4W8N93t
         tCWiAkeNZnNINK+jPThIwqqk0VfMG5ADH5KfFuSNWpNbeftM4pFXaVriAA1CnKw6wc/b
         Hk5pFHoXtZeLYicM/mb5VnarP/6snrA3ZYU8+5Rfv82RWCVnY+PDpEAChVrCuJQ74C3p
         nctQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747032981; x=1747637781;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JScEE0sqpFGbRHc2CWcKwMrOfDcxQMU0VBJzQxhA6GY=;
        b=IUW2Li35i3qXhCL6MTc/qEOn1yOp0RXp7CBp0C9aJFLZq5Kv3kDArR0D4lHquTd9to
         LSoSL1+F2JLalzTfagWWa+EEGGWLYaNaSDgXig6Zq1CAYEOTsxlnUPeGLvgxJV3cjjYM
         UEw/ixLTcwUcEHcjUU2KRH4YpQQl2UPEAA0fcl9fND+N7UwGJE4P5zBAK5DrAxyTCD1M
         NwJSvUuipohrdz4xt+n9ie7XntRKe298ZuXbffh/u3PkYDwSHXOMzr1uwXrh0ZXXDbdU
         cFsWUAmpjgIDPX9+sifw0ufwbuVjFHJLHgyGDGv5CQZKbOr7Y+FB0WwyR3naoGHgn51p
         rghg==
X-Forwarded-Encrypted: i=1; AJvYcCX/4Hf7Q1ebqKhsyAe1igDkLpekaCCyn1lfI1/vG+7vFYtKeskUzl8TDRhGpYo9dEMEZob0vhXcPm7g/Xcs@vger.kernel.org, AJvYcCXBKxBBkHdzakGkfE+349ZZB1ppSzsADOSfBcZ61ih8uVGaTi4ItCowKVbnPC4WN0TAKKwyJDvsqGs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNNdBfQTTAS47/cq1/uCrz5BgxSCymkOtZWgkOPcANDWM8TRXi
	Ig9EcNxbadcB9ymE2S7UiaJEPwRBSFkt55SbjdXn4U2ESeNhIERAsvEtIidPLsmjrcIaA7eYG08
	O2sKsNPjN+UYLFYr2FetW/If/69s=
X-Gm-Gg: ASbGncvCnKgFUo0YqvPLiFDajmWVHajtrfvdYsrD2Nm5NSP3Amn/x7gY8K3PfHyxVZN
	m4rlokOW33EtdpdcTTUmfBCU4K2h0Q0CJ+VfoSekb5RmnXASnoIot+yhzPFROwIoKrGK/B6sChz
	004asYcvsPonjuDtCfLhhapN0MvH7F8uU=
X-Google-Smtp-Source: AGHT+IFCVmt2yhLHz1OOXNXp2NZPofmH5H8CUnhJUNACcNhm+UnZiugUjwFuMX4sSfnJDaj2aINqqLH67Ds7+SY+UaY=
X-Received: by 2002:a05:6e02:1a8d:b0:3d8:20fb:f060 with SMTP id
 e9e14a558f8ab-3da7e1e2b95mr133494045ab.4.1747032981279; Sun, 11 May 2025
 23:56:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAL+tcoCVjihJc=exL4hJDaLFr=CrMx=2JgYO_F_m12-LP9Lc-A@mail.gmail.com>
 <aCGR4EOcWRK6Rgfv@smile.fi.intel.com> <aCGSYSDwDZiJmOtD@smile.fi.intel.com>
In-Reply-To: <aCGSYSDwDZiJmOtD@smile.fi.intel.com>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Mon, 12 May 2025 14:55:45 +0800
X-Gm-Features: AX0GCFtmwz4Q1yV8vCtioEK7fWYLfBkoJ4OHC48jCzLzwO_T-QWXkpHMvzLfEvk
Message-ID: <CAL+tcoAkrtH3NYX+X+6WcvBgGWDW8POnENjbtxStMLRyPORf-A@mail.gmail.com>
Subject: Re: [PATCH] relay: Remove unused relay_late_setup_files
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, corbet@lwn.net, linux-doc@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, linux@treblig.org, viro@zeniv.linux.org.uk, 
	Jens Axboe <axboe@kernel.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 2:17=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, May 12, 2025 at 09:14:56AM +0300, Andy Shevchenko wrote:
> > On Mon, May 12, 2025 at 09:12:56AM +0800, Jason Xing wrote:
> > > Hi All,
> > >
> > > I noticed this patch "relay: Remove unused relay_late_setup_files"
> > > appears in the mm branch already[1], which I totally missed. Sorry fo=
r
> > > joining the party late.
> > >
> > > I have a different opinion on this. For me, I'm very cautious about
> > > what those so-called legacy interfaces are and how they can work in
> > > different cases and what the use case might be... There are still a
> > > small number of out-of-tree users like me heavily relying on relayfs
> > > mechanism. So my humble opinion is that if you want to remove
> > > so-called dead code, probably clearly state why it cannot be used
> > > anymore in the future.
> > >
> > > Dr. David, I appreciate your patch, but please do not simply do the
> > > random cleanup work __here__. If you take a deep look at the relayfs,
> > > you may find there are other interfaces/functions no one uses in the
> > > kernel tree.
> > >
> > > I'm now checking this kind of patch in relayfs one by one to avoid
> > > such a thing happening. I'm trying to maintain it as much as possible
> > > since we internally use it in the networking area to output useful
> > > information in the hot paths, a little bit like blktrace. BTW, relayf=
s
> > > is really a wonderful one that helps kernel modules communicate with
> > > userspace very efficiently. I'm trying to revive it if I can.
> >
> > Jason, with all of the respect, if you are interested in keeping things=
 going
> > on, please add yourself to the MAINTAINERS. It will makes the users of =
the
> > legacy code, Andrew and others, who are doing maintainer's/reviewer's j=
ob,
> > and you happy.
> >
> > Also note, we usually do not care about the out-of-tree users. The main=
 Q here
> > why are they out-of-tree for so long time?
> >
> > > [1]: https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/comm=
it/?h=3Dmm-everything&id=3D46aa76118ee365c25911806e34d28fc2aa5ef997
>
> With the above being said, I am +1 for the patch to stay. Feel free to se=
nd
> a revert with a good justification of why it should stay. Note, out-of-tr=
ee
> is not enough argument.

Thanks for the vote. Let me seriously think of the possible use case
here. If I find one, I think I would revert it as soon as possible.

Thanks,
Jason
