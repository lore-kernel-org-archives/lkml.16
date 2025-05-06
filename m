Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1977822A4F0
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 14:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746542311; cv=none; b=h15KFOrW1nJ52mtWJBwN16xJ/whFr0r87WIWK3kQYe4okRyLvWWlzXiBLJ0HghLxKxwRMmG8QACXIckHiOW+Cacgzc8/imY+T1dzxWo4G1ocm5JMfvUg68OUSdz+CLcp9BdRaKhXmEzpfOhO3HOjiffJIL/QxFO84nqPtbozdpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746542311; c=relaxed/simple;
	bh=Ma83b15qnnbFaueFtEvSpUdw/TKvSFOJHfOZe78Fr4A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uMB01eC0MLSJSrLasrfUWG95CTakEvDTnNkkif8WdIRYSRdQeMLiitfgkZnFzviVYdKc94QwAdFZOL1BLtRKrHW2a+sM4OIwYpDVaSV2RStA2TPJz/wT01YQQj+xIuNpQmkfBPZuqVpBz3ojwc+ymEdg7FeYkOxhjqITY9efl24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CRxKH3Pk; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CRxKH3Pk"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5f632bada3bso9378a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 07:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746542307; x=1747147107; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WS0cqO7mEX8JBUGkY5ZSym9XPagAwEGfVvGLKmJF5sY=;
        b=CRxKH3PkApshm30WZX8T9D4ebFVa2DK7zxt1/b5UuPL7Un040C1U04ni6pt6wn4EUz
         5jx1dasvgSqPUAApV3udF1A/6C+nUlyypZIjBlpCM0dEuoRq7fICJSpaB2UhsFtOvRan
         cgQZYs6G4UwwFepUYX64nBp1bhYcLI2CFkrti2s0X0fJmnym8e6wcNm1nbXBgHxxU4DO
         73DjIY+ZRiUL8YZ58MzUU1ACZJE2e8eq3/y6W2agirsIrZFZiItiW8MF9e73oHUvzxHh
         hKax1ddqHIzpONWeLztbYaFGdnyw3RTmNcKMUjTpBsKxrrazzPA+4XJ0EXcghTL4bPa9
         UEJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746542307; x=1747147107;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WS0cqO7mEX8JBUGkY5ZSym9XPagAwEGfVvGLKmJF5sY=;
        b=rtIzJ05gTQ6QDGwkoK3oTlkjUc9FrGiwgdR4X10rEoeFGBUQAgi4RkxHcWN/+rhkyn
         9/NO5dK7BCEmItuMT+hjP1RzR2nuiaewJbpr4xmiKJv6TGcA6EIG3tL/YVJcc/TqhKD7
         TwZHyfll44iZaGGtYkXqHycCEqAjX+boscFrltAwwdiGv0/PRxFdgA+Ozqy44+xYSkA7
         xy15oIeU72em/sPcU9HtqxloZQN1xIfqsx+vS8Wa2ACwmyB3oUnTwZg2GDLk92mPMIIB
         5OpXz9YMwUIzTMUFI8jzfm3Hqc2pQzJ5l0sIUMTy8W/OHYa1mYdvbwv7TUmsRzuRVGti
         +Lgg==
X-Forwarded-Encrypted: i=1; AJvYcCUH9Cdw/lFMyiukv7vH5oE6auy4R+w5yvVxQCsBwX04LGW8OWt3v3TGwFcqxc7+YpXAJqdyv/Q6t8xK15E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvaYu899CeMfYxr6ZsOpqW21OPlqXAseJjD2k4HvovnERct/J+
	oqhQMh4YR+wxoddjgdWZo9CyEm7bDpESx5cVXkvCKh7Ro3w2ARLUG4jN0yISbWrb3NK0JKJOLc9
	TdnrY/Piy1DuvV21OHReKnOQnoOA6vYU0edcJ
X-Gm-Gg: ASbGncsRh6hkyJIakRg2VBRXNficdSVrYjrzhNvpWyvfQJpdqfJVhhAfUzbbRu1tX8B
	bEmu9VmfSzdeO3Jz9UobH9kVe31EI/vWRJKsZtKLA9HhLD+QCoKGqKVoj0XrMZaJ4EHlgukes/1
	jDFBL+fQRDWpvKXTAzTu6t2qFLz0HEHZPySi1fRqfP3LROKl/h3A==
X-Google-Smtp-Source: AGHT+IEKBtQbqHTSi7RTxOlTKbd2L3krdaRx+iHlrQhBUxrpFEHfioEBlUhMAatv2Ff4k8wWL2KQK5USpqhewEIPDcg=
X-Received: by 2002:aa7:d1d9:0:b0:5f8:d6b1:71ba with SMTP id
 4fb4d7f45d1cf-5fbe76ccb80mr239a12.4.1746542307024; Tue, 06 May 2025 07:38:27
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250505-dompteur-hinhalten-204b1e16bd02@brauner>
 <20250505184136.14852-1-kuniyu@amazon.com> <CAG48ez35FN6ka4QtrNQ6aKEycQBOpJKy=VyhQDzKTwey+4KOMg@mail.gmail.com>
 <20250506-zugabe-bezog-f688fbec72d3@brauner>
In-Reply-To: <20250506-zugabe-bezog-f688fbec72d3@brauner>
From: Jann Horn <jannh@google.com>
Date: Tue, 6 May 2025 16:37:49 +0200
X-Gm-Features: ATxdqUG1RLsm5I44mZFoXDEOhGLmKo0PIMKTKhu327qv26lJZYIhQ2B6edAN2po
Message-ID: <CAG48ez0Pc+QzxgAnT25KqyvjC8n0=diL6DnxBe7CcdQ32u9GcA@mail.gmail.com>
Subject: Re: [PATCH RFC v3 08/10] net, pidfs, coredump: only allow coredumping
 tasks to connect to coredump socket
To: Christian Brauner <brauner@kernel.org>
Cc: Kuniyuki Iwashima <kuniyu@amazon.com>, alexander@mihalicyn.com, bluca@debian.org, 
	daan.j.demeyer@gmail.com, davem@davemloft.net, david@readahead.eu, 
	edumazet@google.com, horms@kernel.org, jack@suse.cz, kuba@kernel.org, 
	lennart@poettering.net, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, me@yhndnzj.com, netdev@vger.kernel.org, 
	oleg@redhat.com, pabeni@redhat.com, viro@zeniv.linux.org.uk, 
	zbyszek@in.waw.pl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 10:06=E2=80=AFAM Christian Brauner <brauner@kernel.o=
rg> wrote:
> On Mon, May 05, 2025 at 09:10:28PM +0200, Jann Horn wrote:
> > On Mon, May 5, 2025 at 8:41=E2=80=AFPM Kuniyuki Iwashima <kuniyu@amazon=
.com> wrote:
> > > From: Christian Brauner <brauner@kernel.org>
> > > Date: Mon, 5 May 2025 16:06:40 +0200
> > > > On Mon, May 05, 2025 at 03:08:07PM +0200, Jann Horn wrote:
> > > > > On Mon, May 5, 2025 at 1:14=E2=80=AFPM Christian Brauner <brauner=
@kernel.org> wrote:
> > > > > > Make sure that only tasks that actually coredumped may connect =
to the
> > > > > > coredump socket. This restriction may be loosened later in case
> > > > > > userspace processes would like to use it to generate their own
> > > > > > coredumps. Though it'd be wiser if userspace just exposed a sep=
arate
> > > > > > socket for that.
> > > > >
> > > > > This implementation kinda feels a bit fragile to me... I wonder i=
f we
> > > > > could instead have a flag inside the af_unix client socket that s=
ays
> > > > > "this is a special client socket for coredumping".
> > > >
> > > > Should be easily doable with a sock_flag().
> > >
> > > This restriction should be applied by BPF LSM.
> >
> > I think we shouldn't allow random userspace processes to connect to
> > the core dump handling service and provide bogus inputs; that
> > unnecessarily increases the risk that a crafted coredump can be used
> > to exploit a bug in the service. So I think it makes sense to enforce
> > this restriction in the kernel.
> >
> > My understanding is that BPF LSM creates fairly tight coupling between
> > userspace and the kernel implementation, and it is kind of unwieldy
> > for userspace. (I imagine the "man 5 core" manpage would get a bit
> > longer and describe more kernel implementation detail if you tried to
> > show how to write a BPF LSM that is capable of detecting unix domain
> > socket connections to a specific address that are not initiated by
> > core dumping.) I would like to keep it possible to implement core
> > userspace functionality in a best-practice way without needing eBPF.
> >
> > > It's hard to loosen such a default restriction as someone might
> > > argue that's unexpected and regression.
> >
> > If userspace wants to allow other processes to connect to the core
> > dumping service, that's easy to implement - userspace can listen on a
> > separate address that is not subject to these restrictions.
>
> I think Kuniyuki's point is defensible. And I did discuss this with
> Lennart when I wrote the patch and he didn't see a point in preventing
> other processes from connecting to the core dump socket. He actually
> would like this to be possible because there's some userspace programs
> out there that generate their own coredumps (Python?) and he wanted them
> to use the general coredump socket to send them to.
>
> I just found it more elegant to simply guarantee that only connections
> are made to that socket come from coredumping tasks.
>
> But I should note there are two ways to cleanly handle this in
> userspace. I had already mentioned the bpf LSM in the contect of
> rate-limiting in an earlier posting:
>
> (1) complex:
>
>     Use a bpf LSM to intercept the connection request via
>     security_unix_stream_connect() in unix_stream_connect().
>
>     The bpf program can simply check:
>
>     current->signal->core_state
>
>     and reject any connection if it isn't set to NULL.

I think that would be racy, since zap_threads sets that pointer before
ensuring that the other threads under the signal_struct are killed.

>     The big downside is that bpf (and security) need to be enabled.
>     Neither is guaranteed and there's quite a few users out there that
>     don't enable bpf.
>
> (2) simple (and supported in this series):
>
>     Userspace accepts a connection. It has to get SO_PEERPIDFD anyway.
>     It then needs to verify:
>
>     struct pidfd_info info =3D {
>             info.mask =3D PIDFD_INFO_EXIT | PIDFD_INFO_COREDUMP,
>     };
>
>     ioctl(pidfd, PIDFD_GET_INFO, &info);
>     if (!(info.mask & PIDFD_INFO_COREDUMP)) {
>             // Can't be from a coredumping task so we can close the
>             // connection without reading.
>             close(coredump_client_fd);
>             return;
>     }
>
>     /* This has to be set and is only settable by do_coredump(). */
>     if (!(info.coredump_mask & PIDFD_COREDUMPED)) {
>             // Can't be from a coredumping task so we can close the
>             // connection without reading.
>             close(coredump_client_fd);
>             return;
>     }
>
>     // Ok, this is a connection from a task that has coredumped, let's
>     // handle it.
>
>     The crux is that the series guarantees that by the time the
>     connection is made the info whether the task/thread-group did
>     coredump is guaranteed to be available via the pidfd.
>
> I think if we document that most coredump servers have to do (2) then
> this is fine. But I wouldn't mind a nod from Jann on this.

I wouldn't recommend either of these as a way to verify that the data
coming over the socket is a core dump generated by the kernel, since
they both look racy in that regard.

But given that you're saying the initial userspace user wouldn't
actually want such a restriction, and that we could later provide a
separate way for userspace to check what initiated the connection, I
guess this is fine for now.
