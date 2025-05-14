Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8EA61DED42
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 04:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747198412; cv=none; b=PJWejXA1tdwH0VyVjLiSDdBPxtRxDCHOqAva9lNjsjha+a/Yks4psH0oEBqZ43HAFBORQ+H53utaKpApyqY31UbaZUgBe3be/M91CwgbrsISK/noIigflospIG+/aRU7NjjUMj/zXjjHxuo4lyUyBJyElKYrNF9n2/Ocbv+86vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747198412; c=relaxed/simple;
	bh=scaLK0QNi8fqUNyUJYYoet94evFpv1Bfa/LcQt+JZNA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sk9DllDEVo5GCs4ENgmVphP5dLmsM2xbSaAC9SeQq4AwB4HY2XHa28lzti+X7u9aHVoiE9nWR1X7lfdlSQMybmrH4gRw6uKkP/SO0aU2TgrXke7hSpGd8Cw0ecDtSOtqI4wvbFjH2GLb/jPB4TjN4pcHLx3vvRwWk0pKu62UalI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S2Ks03jE; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S2Ks03jE"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30db1bd3bddso59634651fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 21:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747198409; x=1747803209; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9VatfoGN8EjQ/GKTWjg4Ue8P1TEMRp9B79UMIcmB3JY=;
        b=S2Ks03jEj0+cOEdApO/AWLi3yLv/cspykYlw41j3+ZaR646qB6YhoSX6dhvS8UGOa7
         75BE2Mq+3QYVjG+wf0KM/qX3DDXUp+BjIpmkMxW/JpOHgF7Cz+77NKQw7hFfUHtR6aZQ
         HDKrVs8s/WyKL0SonvCeTGIhDhRR+jTRRSLAXk8KqKvL/kqliCGMdsPDBU8UOBELPIb1
         yRERrXpnqas2fcLwdmkHSjNZW5PpbMc7XUfy4xAsHFLKQXjAZAHSSrfbRaGMZeW5FTNR
         RJF4mxj3K3qAiPuuOn5z6ZYcNjv1VTwbIcGkgeVnevGWyuTj3wCsQxNxM+m/JqkAEyeG
         bKhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747198409; x=1747803209;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9VatfoGN8EjQ/GKTWjg4Ue8P1TEMRp9B79UMIcmB3JY=;
        b=Opw9rCcLDrxhLW3za9Rmk6rViNr8iL2yW6RO/8sZ8vcLDvnhVFoHVbh1K3Z9EEwDId
         +b+pbAB65nXfKENzv6CYR5/py04ILhD5TQrvoxWeC3Xg6XDIzpAawYu0GLGI9DekKtCm
         mOFHJedb7nEbVz7wZ/MEixsL4FmKmMixS7BZMipgEvLaAposWyYBIJ2/VYEVeYqE6qZp
         G12IqQLNz7B+iesHhE7SEbQtw7Whjxbk5k1KNUBl88Ej8XhT4wDI1aeHKtf6Mkj+3+Ol
         92kQGbMoiVvnDeomo06lyofopz+HwZ4JaigaVBT1wFluIMAWVV0/oPzcNqlzOeiocpzx
         +aXg==
X-Forwarded-Encrypted: i=1; AJvYcCVHspOYFCTqxA75UF1JAu9IkkkHIDh8Qe4Vi2lW5oSUfRB/2CKe4bWhLEZp16FKtHjAcpjp8ViTmiH+JwY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsVof87VGW1velPqVTeqEw8ma+S+M4u1vNx4qy1CCEg92pNPOB
	763i2B6NaMzuPxIcGD2virvb7j/byWzUsRc0xllYOmyjKsPMYbRPWPWVrotRH5LM8Q6YhtAJEjR
	wMZwZTyWj+KmIrYNcvnhTTJ7XBXDucTGS1j7Q
X-Gm-Gg: ASbGncuI/pKINyDn/EpoYxPUyk+4hyY1Fx4H4wuqbL/QT5wnq4TsiZ2TpYc7Jj3ReSI
	LiQcHEJwWGvZHRBd0e1lCajH6A1ereDxMBLE29fxq0VQ+xOMTjENH8rhgm1Scy565QNxGYPQ+4Q
	mGleunWmR8ckdWdptkZ1+vzdYooR3dEWNWfpfhuM4Ar1NB/IPxrhGszpWIgdDn0LrIiA==
X-Google-Smtp-Source: AGHT+IF/YUphTOq2qApG/QTq2ysQCVRzN8tUnHQDos1RBFiU6DmBKCfBPDEY9ICeQxb6HH5Oiq92IQta10KjdIhfij0=
X-Received: by 2002:a2e:a781:0:b0:31f:8c3c:605b with SMTP id
 38308e7fff4ca-327ed26e493mr7027311fa.39.1747198408758; Tue, 13 May 2025
 21:53:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2025050940-marrow-roundish-8b98@gregkh> <CACT4Y+aiQcbHfj2rB6pGKevUbUoYwrHMu+aC-xh0BCKE8D-8sQ@mail.gmail.com>
 <2025050924-marmalade-overfill-fc5a@gregkh> <CACT4Y+ZqToLK5R__x8O1ZctsG3wQtRn36JWF2MPRYqY+Zy_CUA@mail.gmail.com>
 <20250509121036.GA92783@mit.edu> <CACT4Y+Z8ANddFCpNHvNqq6u6=s_aWoYPwu_1HmH19OWeLBi47A@mail.gmail.com>
 <20250512144402.GA200944@mit.edu> <CACT4Y+as-Uy_BUjLDxfNwC2+78U3kJdaaKL=vbUNMZH9VcLiGQ@mail.gmail.com>
 <20250513120549.GA9943@mit.edu> <CACT4Y+Y+E6xnOOJ8zwSdy09FT-OLPPYVFLvZsdpEOkYQ2vsTRg@mail.gmail.com>
 <20250513214314.GA6368@mit.edu>
In-Reply-To: <20250513214314.GA6368@mit.edu>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 14 May 2025 06:53:15 +0200
X-Gm-Features: AX0GCFvxLW_Q0iG0cF-KB2knxW-MExQvJmtSD2GWeVPMxllTRGOegnGCjarAsoc
Message-ID: <CACT4Y+boJEGtmFsKzi326ra+-ck7oV9oq1T561_VAjiE9OCVjQ@mail.gmail.com>
Subject: Re: REJECTED: CVE-2025-0927: heap overflow in the hfs and hfsplus
 filesystems with manually crafted filesystem
To: "Theodore Ts'o" <tytso@mit.edu>
Cc: Greg KH <gregkh@linuxfoundation.org>, cve@kernel.org, 
	linux-cve-announce@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 May 2025 at 23:43, Theodore Ts'o <tytso@mit.edu> wrote:
>
> On Tue, May 13, 2025 at 06:09:24PM +0200, Dmitry Vyukov wrote:
> >
> > Ted, have you read what this thread is about? :)
> > I was talking only about images that fail fsck.
>
> If it fails fsck, don't mount the !@?@# image.  For ext4, we can fix
> pretty much any corrption, so using fsck.ext4 -y should work for nearly all
> file system images.
>
> > Re headcount, if we want that to ever happen, shouldn't we do what I proposed?
>
> Do what?  Tell users that they should be able to mount untrusted file
> systems that fail fsck, and after we have a catastrophic security
> failure, hope that someone will fund it?  I don't think that's very
> responsible.

The other way around: if it passes fsck, but still triggers a kernel
bug, then the bug should get CVE.

> Or did you mean spamming open source volunteers with syzbot reports
> hoping that you can shame/abuse them to do the work for free?  Sorry,
> that's not going to work.  It's just way too much of a lift ---
> multiple SWE-years worth of work is not something that I'm going to do
> after midnight or on weekends.
>
> If you really want to mount file systesms that fail fsck, or you're
> too lazy to run fsck on untrusted images (and this shouldn't be hard
> to teach the desktop software check the file system automatically
> before auto-mounting it), then another possibility is:
>
> > > If you want to be even more paranoid (or the proprietary file system
> > > doesn't have a good fsck), you could mount the file system via a guest
> > > kernel running in a VM, where the VM is locked down using a seccomp
> > > sandbox, and which provides file system services via 9pfs to the host
> > > kernel.  9pfs is a remote file system which is easy to audit, and this
> > > is a key part of the security strategy used by gVisor.
>
>                                            - Ted
