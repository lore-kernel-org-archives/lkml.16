Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462661804A;
	Mon, 12 May 2025 07:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747035337; cv=none; b=GzXp/6047j1TFdeQUddUA+XVFDFWKIlhPErAcXo8Gr7d46COsSKdX33fYUGmPVVQwO+lmN6pC987IcRdyjEY8DFCVoAbueQGTWfTvWVWAZFMbuBe1SNWTQznltUcxlS3uvqyNkOes2cBRO9iwGAZdSd5uaovMlI4RsBBZBopY44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747035337; c=relaxed/simple;
	bh=hPWMYcxU41JijYfcJjOwOtJuV6PhHwKi3+XcicvO7hI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eIYiciAVhAK3f4MaOR3wDzmF62d212Y7w2Xc1b0PUlghO184XlWSkSG4soQt1kfnJqDM9i5WPfLPFrAZ0MAp9JJry1MTNzUAMOSquTYKzc+w9vTLBvJA1b0ZPiOSI4bwp32i3OlLgOyZd6+CwmlNMsGhQGBKKGXbLlT//JStZRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WRwI31ZS; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WRwI31ZS"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3da785e3f90so26837895ab.2;
        Mon, 12 May 2025 00:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747035334; x=1747640134; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7t1dWi3hQjBjeU6rydPZpqp8JDi3vWu2oBT9hRbBwmI=;
        b=WRwI31ZSmD3qzrHrYAG+GL5qM3ogGB+UxfVhihfO6SNSpkqG6hQiLZM4qI84joK5KT
         BlCI/1PfUc0izgWr90w8jmNC5OD1dviKul6lM3s64+aiXxcU876zlnYrWybU1WtxlQQF
         T/IhYYDvUZBeQ1EG5rvkZ+Pkv2n+BP6M/SEB3Z1DLIUe7MSz34Gzjx5fXi7dkmxZLF6s
         ZnqH9BMEG5l2Wy2TOL1bShO4NeFuepkgqVqyxirswkLxizqhWsRWU0+cIKX/B1FUI3Ez
         UHIBEetVZa0CiYa41CN6KXEtKdlWk9Q6Inbwj0ETSrakCVljADEs9JDiefPnP3rArHuM
         fj1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747035334; x=1747640134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7t1dWi3hQjBjeU6rydPZpqp8JDi3vWu2oBT9hRbBwmI=;
        b=XQSWC7osjLUxwAyHY+yY74Dmvbkz5yYb1xAJ0RhxP0zH4LHcXMIQ3Pc94bEKF4PKm/
         J/Hz0UMTVlsOzAbastDXxKVXlaWTKFj8RUdEdIDxZ38usg7FiCabodP2ocEpqxxp9wF4
         RO4UMx2/gto8OCNW083+bO76zJWBwazq8J0EqXqaBnizxi334WncdxjJUpXK7lkfzJw1
         Wve+0GVDVY81Ywq9D2mUnUVe5PX5E+l47plTPcz0vXArfVLdbpGx+11ywbR2cv4X+L7l
         4f46eYXUaNDswb0Mp9n4ZSMP+J1gEZZoTr8AiB7QtcPbvU6n1Mkj5XUyuBkt7T+J5jT8
         byNw==
X-Forwarded-Encrypted: i=1; AJvYcCVMAm1fuR6bxRDBZQ6nIv5uioPZ8tmTx9gPNTxfsCGOJ8+MaCzGp2BNLbMymU4EiUOYr/nUSVU81D5gyuog@vger.kernel.org, AJvYcCWcE+Nk/BV1H68HhIwJzhCXvgpAuYIcMy4yy8566SDwGK5Azij3yShAyL62s9pVfh3i8abx+ihyBAw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVuSU29jGMMrg9B2XGSF90G1f5a5eypGDrfzcmsqg8eylkOlha
	1ZCiAshK0CfBHZQfR564yYzAcuPDHQ2b7u6KNYr8zGxkH0H3EtGflNF5ue4qYthhjD4QShJFWI4
	5lYdTobXU9G+mKOdSu7d2b+vP/susWa0a
X-Gm-Gg: ASbGncuNClon85IwFWZ2+tzKFNzwe7VUHGRYOSqok0UijV6EVOHUFmuBWpyn+lhQeoF
	/NXmzyj2kQXz6Yfe2IPJtNENypJr9PqTmZ1UPqx5kjlOIoBKk/sXfnF+zSrFlvDyk8su8fFXMkL
	JYZ8USE50tYvyJjxUTbPeBDOCKbpjLEFk=
X-Google-Smtp-Source: AGHT+IEbblZ03R3EQiiJQzYRLWN8mAps+z1o7ZzelYUeS62qdRu6O5mR94Lgpi7GopcBB1yxF5btKxN3+BJ7BnmttXI=
X-Received: by 2002:a05:6e02:144d:b0:3d6:cbad:235c with SMTP id
 e9e14a558f8ab-3da7e1ecb3emr129976035ab.6.1747035334274; Mon, 12 May 2025
 00:35:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAL+tcoCVjihJc=exL4hJDaLFr=CrMx=2JgYO_F_m12-LP9Lc-A@mail.gmail.com>
 <aCGR4EOcWRK6Rgfv@smile.fi.intel.com> <CAL+tcoDYOwmt+MqUouc=7DCpMyR3HfOhycgruX_n3+eKJxqv9Q@mail.gmail.com>
 <aCGhXcuqBDuceCqk@smile.fi.intel.com>
In-Reply-To: <aCGhXcuqBDuceCqk@smile.fi.intel.com>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Mon, 12 May 2025 15:34:58 +0800
X-Gm-Features: AX0GCFtKa8BjmKWe0nLEU6UOb7AmPi4r_jZDikX-dTQSfkB7BgEqJFihSFOkfEA
Message-ID: <CAL+tcoAgNyOb0vRzJBvzoSH2NrxZyWBWfnOV0D5KJL8jBJ=vAw@mail.gmail.com>
Subject: Re: [PATCH] relay: Remove unused relay_late_setup_files
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, corbet@lwn.net, linux-doc@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, linux@treblig.org, viro@zeniv.linux.org.uk, 
	Jens Axboe <axboe@kernel.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 3:22=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, May 12, 2025 at 02:53:56PM +0800, Jason Xing wrote:
> > On Mon, May 12, 2025 at 2:15=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Mon, May 12, 2025 at 09:12:56AM +0800, Jason Xing wrote:
> > > >
> > > > I noticed this patch "relay: Remove unused relay_late_setup_files"
> > > > appears in the mm branch already[1], which I totally missed. Sorry =
for
> > > > joining the party late.
> > > >
> > > > I have a different opinion on this. For me, I'm very cautious about
> > > > what those so-called legacy interfaces are and how they can work in
> > > > different cases and what the use case might be... There are still a
> > > > small number of out-of-tree users like me heavily relying on relayf=
s
> > > > mechanism. So my humble opinion is that if you want to remove
> > > > so-called dead code, probably clearly state why it cannot be used
> > > > anymore in the future.
> > > >
> > > > Dr. David, I appreciate your patch, but please do not simply do the
> > > > random cleanup work __here__. If you take a deep look at the relayf=
s,
> > > > you may find there are other interfaces/functions no one uses in th=
e
> > > > kernel tree.
> > > >
> > > > I'm now checking this kind of patch in relayfs one by one to avoid
> > > > such a thing happening. I'm trying to maintain it as much as possib=
le
> > > > since we internally use it in the networking area to output useful
> > > > information in the hot paths, a little bit like blktrace. BTW, rela=
yfs
> > > > is really a wonderful one that helps kernel modules communicate wit=
h
> > > > userspace very efficiently. I'm trying to revive it if I can.
> > >
> > > Jason, with all of the respect, if you are interested in keeping thin=
gs going
> > > on, please add yourself to the MAINTAINERS. It will makes the users o=
f the
> > > legacy code, Andrew and others, who are doing maintainer's/reviewer's=
 job,
> > > and you happy.
> >
> > I didn't subscribe to LKML because they're too many emails everyday.
> > Because of this, I missed most of changes in relayfs.
>
> And how is this relevant to my proposal?

Well, I was just murmuring.

>
> Moreover with `lei` you can filter out from time to time the lore archive=
 for
> these, no need to be subscribed and read LKML in full.

Oh, thanks for the guidance.

>
> > Sure, I'm happy to do so, but I'm not sure how/what the detailed
> > process is here. I would like to ask the core maintainers/developers
> > in advance.
> >
> > Any thoughts on this? Andrew, Jens.
>
> Just send a patch to the LKML which adds a relevant record into MAINTAINE=
RS.
> I believe all stakeholders here will be happy to accept that kind of chan=
ge.
>
> At least you can get my Ack, FWIW (I am not a stakeholder here).

Got it. I think I'm going add like this with you acked-by tag:
diff --git a/MAINTAINERS b/MAINTAINERS
index 890699d937b6..208c46416760 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20481,6 +20481,15 @@ L:     linux-wireless@vger.kernel.org
 S:     Orphan
 F:     drivers/net/wireless/rsi/

+RELAY SUBSYSTEM
+M:     Andrew Morton <akpm@linux-foundation.org>
+M:     Jens Axboe <axboe@kernel.dk>
+M:     Jason Xing <kernelxing@tencent.com>
+S:      Maintained
+F:     Documentation/filesystems/relay.rst
+F:     include/linux/relay.h
+F:     kernel/relay.c
+
 REGISTER MAP ABSTRACTION
 M:     Mark Brown <broonie@kernel.org>
 L:     linux-kernel@vger.kernel.org

It would be good if Andrew and Jens approve this first.

>
> > > Also note, we usually do not care about the out-of-tree users. The ma=
in Q here
> > > why are they out-of-tree for so long time?
> >
> > It's due to the history problem. Back then, developers were trying to
> > develop various file systems to add more debuginfo. As you may notice,
> > blktrace is the one which manifests the answer.
>
> Then provide a roadmap on the upstreaming the necessary parts. Otherwise
> there is no room for a dead code in the Linux kernel. This is the rule:
> we do not add one, and we do not leave it dangling after removing the las=
t
> user.

Got it. Will do that. Thanks for the reminder.

Thanks,
Jason


>
> > > > [1]: https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/co=
mmit/?h=3Dmm-everything&id=3D46aa76118ee365c25911806e34d28fc2aa5ef997
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
