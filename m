Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2310A41
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750082646; cv=none; b=gvNsElys73JNeJZ8axvXSAaDc++V9P2GIg0/uQdoDC+o2ADmR0dr4pMciY+qPK7I3MLaiFEWy51Gf7f6CIgTsmkkZ1Y8ZaA5qm0twc9wEvQ4M+4m6OI3YMsj58gGXrMjN/v0dxligpeE1g3NWvEIMoC9FwdyaMiSWFoBJN/vHtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750082646; c=relaxed/simple;
	bh=cd/1vdRHQJYLjFS4gtG9R3aSxRwOTrVzGKk7oI2wz+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W0fuU+9cHROn5LjiIUOwF5uif03++5QD4LQe32Ur+WhMemEpmf9W18AkUF3dz+dLZp/DCkM0+5MHHwcNdpQUBD0VKyQyJO8pNLW80XE8nhpS+6q8vB+7JRrNwillvKwCKASnv5ttTjbF+B2/DvtiX29LZaUieyRokRiMTvl2hVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=ITzJg/Fi; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="ITzJg/Fi"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-708d90aa8f9so42888567b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 07:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1750082644; x=1750687444; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7AlgErA+6FwDIPpCfYm0ZK7PwLNuiNga29BtB+gMnus=;
        b=ITzJg/FilF+o9umsjW4Aj1MdD4Pk9mQNKosy9j9qXll8qvF0As1XcjzyNBh9qTGY9S
         FUXQw5VFJVQ4yz8+XVmvz8iIqSEBU5LJnSN5hnfGUcDUVbEkbApiWrYiBl7+7TQ+Jej6
         FF2JBpCnpeJAqS5/MPFgxEfC9/IixCywWdTX7NETI4cpIWIA159bKOw96ezfjTHIeL5D
         NeohaA2C7IW422kYWTpYkkSMRKddoMWrEAtLycTaRPTFJ6m8fRQX1UTLET2QitUmHqHN
         D+731VvgIa7xzINW53bNB9r3DX7hlc69InZxGh/xYrIPEN7F37m1ydjCmmE7KJRmiXh+
         GxAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750082644; x=1750687444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7AlgErA+6FwDIPpCfYm0ZK7PwLNuiNga29BtB+gMnus=;
        b=RS2hdkhoNGHtnA6X+qDhedblBqbZ8fClkUHN2PMz54h34YD7T7wyTk8HLsz/5tzR1R
         fR0lFYL/Qi7SdGsZ1gsRK6TXIp4KPF5qNihJQO0XmOPShuq9YWIRF+5FL7316ZJ6nFgQ
         NaxH+9UpOOM9mAanPxS9Z3zCAOuEfJEKAHfIdhjONhFKLZcdB8vDeWLeGkzm890PFbBI
         tOqwsg2pE7BPcIhkMnglMP+x1ARjqNfqdTbATzSidtvBaZnDeG9J4ZUpbzPKmZGohy8L
         3JHXZdXdhM3qTDL3kDUCdEgDkUL8hOjqzgfmQJ1Xjx3yk8tVKlQIcfaxjXUJu73LZePs
         MKZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAYdJJXMLjZWBcZG98rBcsdZGzijVl20ugaCJnX12KjU6JbDtt5p48QqmCn75Zgvdg53S0vr5Fm/P88LA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJbHHTFQDJWkmJYuAcM8itHNa9Iy/5qvHK8+oJ8HBeYtImb2dV
	L810hKSdzRQ8X7gg3sUtpu5BXbEVWzu3IR46JngcJLIlERyQ5oqHloeapEMs532bm0Dtk3hUI4Q
	kiCPWh5uhF0WvyT+bwHa7RTdpzK3euv9q8CRMv2fS
X-Gm-Gg: ASbGnctfEJ4evg0MHLez44kSw+wzx3Go6z96UDcOzQXL1hOuxyvgkxlBF21UI16TEX2
	Zev6UQTujLEIa4pmIMSj2qi6r1C8ug1bRTOCa/q/OVfrLiiRgDR0Q46hNTaaxomy5nrZkh+/ulY
	hBc+eVJUrWSLnKUQwAh3A9YbW3K9h37UXorXKYb+LVlisgL9aw8W2D9w==
X-Google-Smtp-Source: AGHT+IG6MEVOuSVXk6qFi4vb3Qu0hAnZomNNZ8O7DydwFFAo4eO3mag7yPTcNw5TSJolwTumNWcDm4fltR6zpijXBuA=
X-Received: by 2002:a05:690c:d1f:b0:710:ea78:8ff with SMTP id
 00721157ae682-7117544c85fmr128441827b3.23.1750082643585; Mon, 16 Jun 2025
 07:04:03 -0700 (PDT)
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
Date: Mon, 16 Jun 2025 10:03:52 -0400
X-Gm-Features: AX0GCFutf2IknDGBAYa5W13CzhJZ3TOjubm4voGGY8iOl_MS1QuvnClSmk8QN7Q
Message-ID: <CAHC9VhTWEWq_rzZnjbYrS6MCb5_gSBDAjUoYQY4htQ5MaY2o_w@mail.gmail.com>
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

Checking on the status of this patch as we are at -rc2 and I don't see
it in Linus' tree?

--=20
paul-moore.com
