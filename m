Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC31A266B73
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 10:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744109071; cv=none; b=e+5w+jynL2rJ1R5SUgttr/aAybjl007lbU0Go5QV5llr4w/hlfdBhjqSnXmiiCq8QJqCBSExju+WrkYA+r0CPO724NspY4fR6dUB5R8vPvj90ayEreoJM5OUEWFkJFPpqVecCXpYZNlqWQwDq9lZu3pDf6otnlpJfv2hU44nrfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744109071; c=relaxed/simple;
	bh=419p2jfIVuqswVnYCpxVb4C1tmk/VU4wbdwBrDE6ZDA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CPSpQ81hGBdqhubNGe8rUwfyuZg0AvyU2EHY7bhyribWY83cT97Z6jtiIhmHpaGgzcx+qG+I3FdvHEuJNWGblIgahFSgKIkdPIM1tYrC42rf4cYqoqj34dOq/BZ5fq4zK/0WMzIA++riTFiZ/qPsw+3UU71MtRMc1IM/rLTOc4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MHeRZ4vZ; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MHeRZ4vZ"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5499c5d9691so6100560e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 03:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744109066; x=1744713866; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=419p2jfIVuqswVnYCpxVb4C1tmk/VU4wbdwBrDE6ZDA=;
        b=MHeRZ4vZf5FEQKyHlkzdCIIwaregR8Y6Fw4PSdv9coXXVvLZjJNDda4AZmjoNgI5sX
         VXmXCBthHCqSiesSSAvexe5gIsKWR/sLRzo1eu0H3DFgGsWXncfOin4cBCHI+uCLvOis
         H0t/UFaCra02LPQ5Cs/YzRnKMwlzH1ZXP1ZnybkA117QCdmv23HLverdC8oR2eefjWv6
         +8DCeIOiNYM7013YNV99BtOm52JnIfBg3m2ZHPtLXQIO05gySvwaMYZElkMzrqCQ8CET
         ZZkOaOooLuEov06BNWLr/KMl7BIS6GjVQEV//ZLiXx5IeePaBXtzm+MqKmsNbBZ2uxET
         xWPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744109066; x=1744713866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=419p2jfIVuqswVnYCpxVb4C1tmk/VU4wbdwBrDE6ZDA=;
        b=nCEM+zqyYKGCBGETeDH5hXaQTerZqtgXHwz8A2NeWU/rWX9nbfj/lWBanp1X++1Ybq
         TuXkH6ViNo4Tvxa7r7XxiuLlVqv07XBTWruiZQsg5QcH5kIZpSvMwoUmJHylt8rlHGmO
         ys2/ruRylTr56ePsQiL+HUPsFgz6IX3rSv7Fb0qch1sjXGL6Tww+fOm0yZ0RHul1fQWn
         nCehmL+/rRSen53lGFpYKStnUPwrkXZ6j/z+batr4w7Rd3lHRy9nxFNNl+GXjE6omvM/
         oUZH/S69X6NlOwBqRwgrliBtB79XbS5+w74KPm00QZWutCGQB+FCEI9Ibtd0xQCvfpz+
         KUDQ==
X-Forwarded-Encrypted: i=1; AJvYcCX66686tFmvRl+33Rwf/pVFsCOH5jc+xeSZxCIh4oR98KbWBxg4BAJeCcUkGPyttxLZ5rHrVUtjuAci7X4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFxT1igiNby6yN8l3fH5/Wg5zDjrMCOXeKuNCFa+H3G5V0qbRb
	Qo9eRFc4kfgGiDkUa1IjcJf4Y7DBjbv2hJkX1LYsnMYdC7Dqyqo1SKrScoZuDKiS04Yal/pB37i
	oemqhKzhNY5aD3leu/9hUzbRqxUuG1iNm3GXv
X-Gm-Gg: ASbGncs9+UE4zlbrQo9VBjM5B2un6QTdQRB3ovYQuZBce03JoMApPdWsTfetmUiePfW
	N8mX7bq0I40xoWx13XGeISTW+AR/gwUdfYdJP7zizjXmKB6DmEHor3f0hd7UlaaMriMi8ddv8F5
	tlnD6QBr1FwoiQDVp4YghK412pwLhw/X9WBieJJjOc/MlafyrPhYfIKnbR
X-Google-Smtp-Source: AGHT+IE6Mo63+aNLgjUy0hwr7ZFaZKS1coMjIhw5cBTkTQK/+wn9m6TH3/wwl0cHKC7QrTe670eB2PBOcctoSbdy6wA=
X-Received: by 2002:a05:651c:1585:b0:2ff:56a6:2992 with SMTP id
 38308e7fff4ca-30f0a1d8ac4mr49263491fa.37.1744109065757; Tue, 08 Apr 2025
 03:44:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z_PfCosPB7GS4DJl@mini-arch> <20250407161308.19286-1-kuniyu@amazon.com>
 <CANp29Y5RjJD3FK8zciRL92f0+tXEaZ=DbzSF3JrnVRGyDmag2A@mail.gmail.com>
In-Reply-To: <CANp29Y5RjJD3FK8zciRL92f0+tXEaZ=DbzSF3JrnVRGyDmag2A@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 8 Apr 2025 12:44:14 +0200
X-Gm-Features: ATxdqUFyy-54YLVuSp15WzCbaleB-jiZZ-DebC9ojvDiy-cfPHkfhgKLdRQnP6k
Message-ID: <CACT4Y+acJ-D6TiynzWef4vAwTNhCNAgey=RmfZHEXDJVrPxDCg@mail.gmail.com>
Subject: Re: [syzbot] [net?] WARNING: bad unlock balance in do_setlink
To: Aleksandr Nogikh <nogikh@google.com>
Cc: Kuniyuki Iwashima <kuniyu@amazon.com>, stfomichev@gmail.com, andrew@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, horms@kernel.org, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	sdf@fomichev.me, syzbot+45016fe295243a7882d3@syzkaller.appspotmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 8 Apr 2025 at 10:11, Aleksandr Nogikh <nogikh@google.com> wrote:
>
> On Mon, Apr 7, 2025 at 6:13=E2=80=AFPM 'Kuniyuki Iwashima' via syzkaller-=
bugs
> <syzkaller-bugs@googlegroups.com> wrote:
> >
> > From: Stanislav Fomichev <stfomichev@gmail.com>
> > Date: Mon, 7 Apr 2025 07:19:54 -0700
> > > On 04/07, syzbot wrote:
> > > > Hello,
> > > >
> > > > syzbot has tested the proposed patch but the reproducer is still tr=
iggering an issue:
> > > > unregister_netdevice: waiting for DEV to become free
> > > >
> > > > unregister_netdevice: waiting for batadv0 to become free. Usage cou=
nt =3D 3
> > >
> > > So it does fix the lock unbalance issue, but now there is a hang?
> >
> > I think this is an orthogonal issue.
> >
> > I saw this in another report as well.
> > https://lore.kernel.org/netdev/67f208ea.050a0220.0a13.025b.GAE@google.c=
om/
> >
> > syzbot may want to find a better way to filter this kind of noise.
> >
>
> Syzbot treats this message as a problem worthy of reporting since a
> long time (Cc'd Dmitry who may remember the context):
> https://github.com/google/syzkaller/commit/7a67784ca8bdc3b26cce2f0ec9a40d=
2dd9ec9396
>
> Since v6.15-rc1, we do observe it happen at least 10x more often than
> before, both during fuzzing and while processing #syz test commands:
> https://syzkaller.appspot.com/bug?extid=3D881d65229ca4f9ae8c84

IIUC this error means a leaked reference count on a device, and the
device and everything it references leaked forever + a kernel thread
looping forever. This does not look like noise.

Eric, should know more. Eric fixed a bunch of these bugs and added a
ref count tracker to devices to provide better diagnostics. For some
reason I don't see the reftracker output in the console output, but
CONFIG_NET_DEV_REFCNT_TRACKER=3Dy is enabled in the config.
