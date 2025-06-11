Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642BA1D7E41
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749656718; cv=none; b=hivVKrUxeVsaWiynMKU2NThl0Cp4ZzIuJP1g36IBdu8gSvLHJWaBBxKOnixYp5YhHLJwL1eAs1j5i3g7K0ipQAvl2LvfpvMyVWLm0QN65WjvLNNj7YppaCgRTsDa9yV4LTnS7pdV1L5zbPJ69r56Xg991Fm0PRHR1d5C+IdyH2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749656718; c=relaxed/simple;
	bh=nn3Frlo9C3N7jmQAsLP5JRdKgVr952KuKSlZfqPB0mk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SGhs9mNWbvtKlgo0ubQUm3OUXMJxy3oM99o5XNMDaOEoBMwFs0HmcGccO34uyfu/Sr8MS6fheKvMjMWbzWphnqsAveyMYV+ww2YgLkNgbXBS2Y4jG9o/Wk0ngGv0+CtMNEBJgMaeVGa9alhRPqvAjhQYrmlhqEgE8HhDp9U6Yq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=A++2K2G0; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="A++2K2G0"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e73e9e18556so1161273276.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 08:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1749656715; x=1750261515; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rr8HzynHF02QsFY9FAMsE2al9WZZ1v5BFhMIQ9+R0eA=;
        b=A++2K2G0e0qQd4AaYnQewF9mODgcF0M4y8fV30qLNBqa2evO8czeOX63yGvlJ7/r9w
         7vaEVVSAx2U6QFUThhuV+v6u47XNDwnghEnZQ2hDp6GBEUiIsIQSBdFhy36BcPOricBa
         57hkxhHZayQ6mZTIhICNjNl3BvMOeUI7XRXT0c8lJS/7QwM5KKUj8e9EU5T9/msjzhpB
         tiS1ZQmx9GhauC0RZiqFAcaN33VD2vedAWiSQWZhVCQebBTbxOztRGnkJ0w6ieyhIxJe
         769w1CyeDW3r3dOj1lEcSe0kvnhFtPf43w/DAl6inVePhP1U/gf4W+aIK2cIcxN8yZOj
         AC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749656715; x=1750261515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rr8HzynHF02QsFY9FAMsE2al9WZZ1v5BFhMIQ9+R0eA=;
        b=gPZG2Y8p/i4Fyq2CjGTga6wiVs3qz5e075oRm9PM3aOcgTThUwvvh5A2zXM2yprRmQ
         7fSsLuoKrztoq8IE4t6qTOJYWMsxMeMH1WFDOiZIr/pbYma2sZF6K0K0qE9Jh2vrZQ4E
         WUa7xjrI5dmEDsIEOXMVCEvsQLFFPCkp3OIm+phyTE14hT7or7anIxhqkLMqWZKanGK/
         8yljD1qP8kTTB0hE2uxhaiMUqdO1ed6wfbT1RmoiLvCKmxy8Aip/5xkMR48GoyqOPEtI
         mYroX2ezwydS06Mc7zvSGkfmyFj+1BfLTGVsYKiK1ajY98rHOdeE9xO6gqplMeooABSM
         IGsw==
X-Forwarded-Encrypted: i=1; AJvYcCWJHjbc90AbwvzyGqv3faWFiVpEe7vN1DoNBVacWl5mm6Jlg4v9CJLWIPJcKm5tlB0e3pF1I3PKpVNXj3I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpTakW4oaFbOEHjO9wuF7TwDS3/15Gsk6/fFZfKniZeHvRNVNC
	UcF7z0Ply8KPNKGfxzAZskRKywiYRJ4gHG8sJPZSZx1rsJt3ih2eH/gabZwG9WYsGCF6iZXN3bi
	6BF/1PHd+VNqkKivglBJxLItijh/CVh9uZJ46/zT4
X-Gm-Gg: ASbGncvG/tfXGD4U5FSY74ASPT7uwkcRanikfYQNyfOR3VmI8Qr82E1mLBGwvVKzA4d
	joZ10nLC9KqlZBek13KDvu5XjRHQMXbSisicIfGfMNAzkrAEPVtLGQi38hKDPKuorpRiWnFzJmn
	ayb438cm16ceXI4yF7TcAv4h9iMQyJRiUchsi7hPdU1qe+yxC2Xj3hHA==
X-Google-Smtp-Source: AGHT+IF0x91wO7ieY1VBV4TKEAQMxfl7pCnbajI3YzlN5rzvSMdIo54/z2z0PcKudWn5ds5l8R7jWbi2/H1BT15q+gI=
X-Received: by 2002:a05:6902:2313:b0:e81:eb1c:1a1e with SMTP id
 3f1490d57ef6-e81fe899e1emr5351273276.3.1749656715190; Wed, 11 Jun 2025
 08:45:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605164852.2016-1-stephen.smalley.work@gmail.com>
 <CAHC9VhQ-f-n+0g29MpBB3_om-e=vDqSC3h+Vn_XzpK2zpqamdQ@mail.gmail.com>
 <CAHC9VhRUqpubkuFFVCfiMN4jDiEhXQvJ91vHjrM5d9e4bEopaw@mail.gmail.com>
 <87plfhsa2r.fsf@gmail.com> <CAHC9VhRSAaENMnEYXrPTY4Z4sPO_s4fSXF=rEUFuEEUg6Lz21Q@mail.gmail.com>
 <20250611-gepunktet-umkurven-5482b6f39958@brauner>
In-Reply-To: <20250611-gepunktet-umkurven-5482b6f39958@brauner>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 11 Jun 2025 11:45:03 -0400
X-Gm-Features: AX0GCFtYjHydo7psPZIcgWJNd2HocnI9KUxU0OYaer59jF3FYBEgwxmKF0Cei-Y
Message-ID: <CAHC9VhQYi2k3eamrn+kPkooZQpQ4cdsjs=nvntRVbz4=wz1rzA@mail.gmail.com>
Subject: Re: [PATCH] fs/xattr.c: fix simple_xattr_list()
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Collin Funk <collin.funk1@gmail.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	linux-kernel@vger.kernel.org, selinux@vger.kernel.org, eggert@cs.ucla.edu, 
	bug-gnulib@gnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 6:05=E2=80=AFAM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> On Tue, Jun 10, 2025 at 07:50:10PM -0400, Paul Moore wrote:
> > On Fri, Jun 6, 2025 at 1:39=E2=80=AFAM Collin Funk <collin.funk1@gmail.=
com> wrote:
> > > Paul Moore <paul@paul-moore.com> writes:
> > > >> <stephen.smalley.work@gmail.com> wrote:
> > > >> >
> > > >> > commit 8b0ba61df5a1 ("fs/xattr.c: fix simple_xattr_list to alway=
s
> > > >> > include security.* xattrs") failed to reset err after the call t=
o
> > > >> > security_inode_listsecurity(), which returns the length of the
> > > >> > returned xattr name. This results in simple_xattr_list() incorre=
ctly
> > > >> > returning this length even if a POSIX acl is also set on the ino=
de.
> > > >> >
> > > >> > Reported-by: Collin Funk <collin.funk1@gmail.com>
> > > >> > Closes: https://lore.kernel.org/selinux/8734ceal7q.fsf@gmail.com=
/
> > > >> > Reported-by: Paul Eggert <eggert@cs.ucla.edu>
> > > >> > Closes: https://bugzilla.redhat.com/show_bug.cgi?id=3D2369561
> > > >> > Fixes: 8b0ba61df5a1 ("fs/xattr.c: fix simple_xattr_list to alway=
s include security.* xattrs")
> > > >> >
> > > >> > Signed-off-by: Stephen Smalley <stephen.smalley.work@gmail.com>
> > > >> > ---
> > > >> >  fs/xattr.c | 1 +
> > > >> >  1 file changed, 1 insertion(+)
> > > >>
> > > >> Reviewed-by: Paul Moore <paul@paul-moore.com>
> > > >
> > > > Resending this as it appears that Stephen's original posting had a
> > > > typo in the VFS mailing list.  The original post can be found in th=
e
> > > > SELinux archives:
> > > >
> > > > https://lore.kernel.org/selinux/20250605164852.2016-1-stephen.small=
ey.work@gmail.com/
> > >
> > > Hi, responding to this message since it has the correct lists.
> > >
> > > I just booted into a kernel with this patch applied and confirm that =
it
> > > fixes the Gnulib tests that were failing.
> > >
> > > Reviewed-by: Collin Funk <collin.funk1@gmail.com>
> > > Tested-by: Collin Funk <collin.funk1@gmail.com>
> > >
> > > Thanks for the fix.
> >
> > Al, Christian, are either of you going to pick up this fix to send to
> > Linus?  If not, any objection if I send this up?
>
> It's been in vfs.fixes for some time already and it'll go out with the
> first round of post -rc1 fixes this week.

Great, thanks.  I didn't see any replies on-list indicating that the
patch had been picked up, so I just wanted to make sure someone was
sending this up to Linus.

--=20
paul-moore.com
