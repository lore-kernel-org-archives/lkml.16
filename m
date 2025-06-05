Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06B620B207
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 21:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749160277; cv=none; b=a1ScoMUDyvKwrK2M0XA2lcv4hYC04q8xKIFSTJGIuqXvVZvhTflTbJfdmAUrzoERevgvznEhCyaGaL1ASGgw6R8A9GGwhIqhPHfCpzC2JrpyOTPTZ5szKIkDnYPoz/I1luVykAFAb562haaaNgMYpCNjf+ZUNyzOqyUcrlrV5+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749160277; c=relaxed/simple;
	bh=755S9h4e3lhJ7G6Amq1GHJNIb3T3WttwHIsYDZsZMa0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n7Q2zTyFu4472IWM682uGHUooL4CXTzSGUvhl3S6PxVyOnnTWwjmB5KGkOobBtoKIxjZEqItbU1ms9j/aHqS5aw42JHZA709SU989BbXzn6lj6L4D5ckCLEsjv6PWvZrZcG5hvwAgkhFlcgp9Xn7dF1xpaDmcvjODLWh4p/D+mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=Sr3oS6Gd; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="Sr3oS6Gd"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-70e5599b795so16318347b3.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 14:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1749160275; x=1749765075; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q73clLkN9MkZDXUIYnVM17RaAmlbhc3zBqb9kmZ99dU=;
        b=Sr3oS6GdEGYwsE2mi0S60CgNYia4G4b0ul2nB281p+/nMSQfB3n8EZ4dgxfPR/f7LB
         Jx2O/CGEgNAPGxokX1CdblB3WRb0q+Yi7MDicT2g5CCr3aFRo+dBiwooSe19L9NtJkTk
         DYibl+RIxvrZ4Cow9NjwH4s8HF6NnfUg6kTBFZW2krQdLtg71Oe+sOFVy0QZt3E4Ijo2
         Rvpw2oIe2I1nyzwm4EIpJ/+IKJuAkMj8FL90mJ3YFA61G7dNsswSa89nJrTmT927KMR8
         oHsGaFefU7/KEHEA5HUCvXbjqO4Lxno7Iv3fo8WAndI73ASstq+fRBt0O5e7xms8wIFL
         17SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749160275; x=1749765075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q73clLkN9MkZDXUIYnVM17RaAmlbhc3zBqb9kmZ99dU=;
        b=HY9TWv/S/WTYlSrkGfi+qq8RveSUkyQUGRc6M4OFU/GGioYW1O8jB9KINxmD/vd97j
         HjfngWS9HcSjnVt/YsipC1uZoyIrvWMuh9wvR8pWeu6IpU5uzGgbSfhm4D7241avWXb9
         UkL4c+tViwCjnbay6lAS4BR6ipzXKZCPMUTF0ApNqJMmszzR73if+/P3K4WT6yHfW5Pc
         HV01onKxfXNC4MnusmjB6r7bVW3mDZwIM3EkaJdcVRfMeHMqtMEbuB5ge759f/UxqPst
         9LLX7UWoUOz4IQkOS6n4dfFeEVdXSaqiAwju/vLbS1B2pWBd8FXh9watfes5pL3sqhRC
         9+8A==
X-Forwarded-Encrypted: i=1; AJvYcCW6SdPcCr+IzVPGg5ktTj2hsbnJ4zCFNeRBDw77E1JnriszBVnlFycayKigYt/QR489l6YsVcWWx6hk9Fs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCfsc/T/w6NXnM6e0y4BkvtONrkLFEXG8fymNBqDFjW8rMgEL1
	vwLv4aIAtRfQraEXZPbh4LI677zp/cxIhA9xja5MZRd0WvKUjeLNXN5U4+d/2rCOIBqIm09LEgK
	h1o0vZAGLo1D0sz68GgIBzhSVDKNlMLcx0oXe8M+Y
X-Gm-Gg: ASbGncvERNFa3RPk040V6fdsnbXTTxcdm9uMDks4prC1ADbjsm7INNPwEgVLxDhGPpg
	DtHu/FPzcYRBOj4oW7SNWTyKaJbY/rAPT4QqfqWTWTb0DJsMQ8BcEW5qiv2EVEeLQq/1KP0yO3E
	//egaPyaKP7MIRg7mvY84dC1XWfSEQ6ftFaWh+A5UfN3Y=
X-Google-Smtp-Source: AGHT+IH8rWmL3NURj++utqdkH+5GRnHoJxWmeuuvsdqQh8WxSx0oAPFT99bO6nYMRzPjhD6n87qofS6a5Gelido0y7s=
X-Received: by 2002:a05:6902:2b06:b0:e81:9cbd:d184 with SMTP id
 3f1490d57ef6-e81a2562ab9mr2014351276.47.1749160274822; Thu, 05 Jun 2025
 14:51:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605164852.2016-1-stephen.smalley.work@gmail.com> <CAHC9VhQ-f-n+0g29MpBB3_om-e=vDqSC3h+Vn_XzpK2zpqamdQ@mail.gmail.com>
In-Reply-To: <CAHC9VhQ-f-n+0g29MpBB3_om-e=vDqSC3h+Vn_XzpK2zpqamdQ@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 5 Jun 2025 17:51:04 -0400
X-Gm-Features: AX0GCFtSaj5dP0qo5NwUElUF5HvPHPlbkWWjHsO-9fmw1SjRtP1N3S6_O6Cdmgs
Message-ID: <CAHC9VhRUqpubkuFFVCfiMN4jDiEhXQvJ91vHjrM5d9e4bEopaw@mail.gmail.com>
Subject: Re: [PATCH] fs/xattr.c: fix simple_xattr_list()
To: Stephen Smalley <stephen.smalley.work@gmail.com>, linux-fsdevel@vger.kernel.org
Cc: brauner@kernel.org, linux-kernel@vger.kernel.org, selinux@vger.kernel.org, 
	collin.funk1@gmail.com, eggert@cs.ucla.edu, bug-gnulib@gnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 5:40=E2=80=AFPM Paul Moore <paul@paul-moore.com> wro=
te:
> On Thu, Jun 5, 2025 at 12:49=E2=80=AFPM Stephen Smalley
> <stephen.smalley.work@gmail.com> wrote:
> >
> > commit 8b0ba61df5a1 ("fs/xattr.c: fix simple_xattr_list to always
> > include security.* xattrs") failed to reset err after the call to
> > security_inode_listsecurity(), which returns the length of the
> > returned xattr name. This results in simple_xattr_list() incorrectly
> > returning this length even if a POSIX acl is also set on the inode.
> >
> > Reported-by: Collin Funk <collin.funk1@gmail.com>
> > Closes: https://lore.kernel.org/selinux/8734ceal7q.fsf@gmail.com/
> > Reported-by: Paul Eggert <eggert@cs.ucla.edu>
> > Closes: https://bugzilla.redhat.com/show_bug.cgi?id=3D2369561
> > Fixes: 8b0ba61df5a1 ("fs/xattr.c: fix simple_xattr_list to always inclu=
de security.* xattrs")
> >
> > Signed-off-by: Stephen Smalley <stephen.smalley.work@gmail.com>
> > ---
> >  fs/xattr.c | 1 +
> >  1 file changed, 1 insertion(+)
>
> Reviewed-by: Paul Moore <paul@paul-moore.com>

Resending this as it appears that Stephen's original posting had a
typo in the VFS mailing list.  The original post can be found in the
SELinux archives:

https://lore.kernel.org/selinux/20250605164852.2016-1-stephen.smalley.work@=
gmail.com/

> > diff --git a/fs/xattr.c b/fs/xattr.c
> > index 8ec5b0204bfd..600ae97969cf 100644
> > --- a/fs/xattr.c
> > +++ b/fs/xattr.c
> > @@ -1479,6 +1479,7 @@ ssize_t simple_xattr_list(struct inode *inode, st=
ruct simple_xattrs *xattrs,
> >                 buffer +=3D err;
> >         }
> >         remaining_size -=3D err;
> > +       err =3D 0;
> >
> >         read_lock(&xattrs->lock);
> >         for (rbp =3D rb_first(&xattrs->rb_root); rbp; rbp =3D rb_next(r=
bp)) {
> > --
> > 2.49.0

--=20
paul-moore.com
