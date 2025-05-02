Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498E4254876
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 14:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746194708; cv=none; b=MjW5pWG6CZJlgCWU7Lp/xoRGJalcvAk4TzPIaoTp3mj6I5gcLyb79HTC8tyvC786DDglLFS0oqhjenmqgNhQsCjI4fIJs/lf8WVXAoJZkjBjEhlS91bHbxrS+Q1Af0Z1/oeEuGDlklkq+nvl+jh3ObHf7M63VseYORi3fVo8Kcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746194708; c=relaxed/simple;
	bh=D9FrQH4n+PdihizMnAjXGJ0f+TPN3pD0AbB60hJwMCs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BrfvV+U7uQesDXtTmTKvlsht4QRrD/AmXGYKNnWDszPKJXCTm6swKq67zF+EOiafYdlNzUI8mlgdtxzhosLId/L9ouxuRbOd+YTNsA8Bt+rVxl9IykwaMWmWPSmk30y6uVCjonVdZ0ZSCD32HD/qlypQWhw/u10WH693/+K2460=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K40oS+KD; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K40oS+KD"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5dbfc122b82so10922a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 07:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746194704; x=1746799504; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nDe9RtA7TLLrd+vDa4DrWUwMAtXgbf0yt5j9UCuWdJ4=;
        b=K40oS+KDoYyve/QhEdChMv2ixxs+PRSsEVpBWtf5lquTpS+iffSsqIo1ZE3+8dW4WC
         i+9lOwDOj1LMex/qm07kMWuNW+MUrU1/x9Xu+6rH7rziI2zGKXKyToTTwRBpAY8jUZhR
         E4I7duhtszys1nK3zmDJV+W1zCZ/ae7dBGkmN6WZlG4HHqggAfY55nOAWN/+CVyVGkpO
         zCT38ugw6i2s9+xz913lPsGXi5fj10KLd+ncHDWOY++98okpxlAlHXY6w/kOVvCJy9Fn
         GItNs7Fjd0ztVHPc2S0+ikwjlGf9t8zxsft6IPhXgnvZ68bCoSQ65C6ApoWpz9yAqlIG
         ID5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746194704; x=1746799504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nDe9RtA7TLLrd+vDa4DrWUwMAtXgbf0yt5j9UCuWdJ4=;
        b=s1iQNUgqsFvjbekNahlz/8KbLbpV9I0pF4wQ+Ndphgm45sFcP3nY4y1l4t8wBO7Dro
         kk8HrbHlQV6lVpsINf3OAhh/w9yyzXB8+0RhOsjLYLGh83W8QMrgKO1V6g3rzbrhXhvk
         vsbUjlWD/wqMt1htOd7FsrU9IpmU4CcAay4DPccMhYFsLMts/pPSnQFbVgukfzpQCccx
         SpAn6I3mflu/utcpC3AcSr77LqMBgUb0Bn4AZKfaOQsMLfc5q171RvIcHUsTt7uKzzci
         kTpTK+MKuUCFqwI3VEpefyDxidVOo4quZAGYquBjXBoE5tBgAbJOfjd25L10a/Af7yJ6
         NQlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXul1DgbeBkbq8VhaUfxEE5MgVtuaBxg4ZwS2J7DSjK6GZLKYh4WEbE01PIPToD85bLU8wy8RkZpTRK8Co=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmT/5hvjv+1f1fPPg4QQPc55iSDlH9WtD51Erabr3AEg1BnW0T
	+DB9z/CDBNI3Bh+RV+qL7CFhSt3dkbo483H5CQYbhNAjOmKQlKWb1Cw4JeYsUQqkZntbqWhqZHe
	y+QmPktmgBjUYbgZprTsg3bMH3jx2NoENrVao
X-Gm-Gg: ASbGnctQpHn/GHCh93EB68na7etFqqRb4hKeaPh5/d1oZjMeMYKAdqekpeiHvJZtZzU
	27VH3XqEVzTx+cnWdvtm2KFQHhfe2PyHZsBqvOKWO+FNjH9lB9Oq09E/S01bav1ZOwBi8q1WdVG
	VBxj9eldyvvzT3cntctAUqRZVy8GhNKgLlwLiy6naZ83l+R5Ps+Q==
X-Google-Smtp-Source: AGHT+IGQyG7jBeuHSLNmsAImzv0cQUgCHSzQUeks+9StY/yQAdwPY81V2I46PF4Wav7Pheny/ljSV/t3KJ1MePw5oro=
X-Received: by 2002:a05:6402:1d38:b0:5e4:afad:9a83 with SMTP id
 4fb4d7f45d1cf-5f9130fae93mr209007a12.2.1746194704052; Fri, 02 May 2025
 07:05:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502-work-coredump-socket-v2-0-43259042ffc7@kernel.org>
In-Reply-To: <20250502-work-coredump-socket-v2-0-43259042ffc7@kernel.org>
From: Jann Horn <jannh@google.com>
Date: Fri, 2 May 2025 16:04:28 +0200
X-Gm-Features: ATxdqUEap07yOkwLkXFTwqsri6Zk9OGzrg6-_-HwiNt-HyE-SosQ2SulcKFl1qc
Message-ID: <CAG48ez3oefetsGTOxLf50d+PGcthj3oJCiMbxtNvkDkRZ-jwEg@mail.gmail.com>
Subject: Re: [PATCH RFC v2 0/6] coredump: support AF_UNIX sockets
To: Christian Brauner <brauner@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>, Kuniyuki Iwashima <kuniyu@amazon.com>, 
	Oleg Nesterov <oleg@redhat.com>, linux-fsdevel@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Daan De Meyer <daan.j.demeyer@gmail.com>, David Rheinsberg <david@readahead.eu>, 
	Jakub Kicinski <kuba@kernel.org>, Jan Kara <jack@suse.cz>, 
	Lennart Poettering <lennart@poettering.net>, Luca Boccassi <bluca@debian.org>, Mike Yuan <me@yhndnzj.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	=?UTF-8?Q?Zbigniew_J=C4=99drzejewski=2DSzmek?= <zbyszek@in.waw.pl>, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 2, 2025 at 2:42=E2=80=AFPM Christian Brauner <brauner@kernel.or=
g> wrote:
> I need some help with the following questions:
>
> (i) The core_pipe_limit setting is of vital importance to userspace
>     because it allows it to a) limit the number of concurrent coredumps
>     and b) causes the kernel to wait until userspace closes the pipe and
>     thus prevents the process from being reaped, allowing userspace to
>     parse information out of /proc/<pid>/.
>
>     Pipes already support this. I need to know from the networking
>     people (or Oleg :)) how to wait for the userspace side to shutdown
>     the socket/terminate the connection.
>
>     I don't want to just read() because then userspace can send us
>     SCM_RIGHTS messages and it's really ugly anyway.
>
> (ii) The dumpability setting is of importance for userspace in order to
>      know how a given binary is dumped: as regular user or as root user.
>      This helps guard against exploits abusing set*id binaries. The
>      setting needs to be the same as used at the time of the coredump.
>
>      I'm exposing this as part of PIDFD_GET_INFO. I would like some
>      input whether it's fine to simply expose the dumpability this way.
>      I'm pretty sure it is. But it'd be good to have @Jann give his
>      thoughts here.

My only concern here is that if we expect the userspace daemon to look
at the dumpability field and treat nondumpable tasks as "this may
contain secret data and resources owned by various UIDs mixed
together, only root should see the dump", we should have at least very
clear documentation around this.

[...]
> Userspace can get a stable handle on the task generating the coredump by
> using the SO_PEERPIDFD socket option. SO_PEERPIDFD uses the thread-group
> leader pid stashed during connect(). Even if the task generating the

Unrelated to this series: Huh, I think I haven't seen SO_PEERPIDFD
before. I guess one interesting consequence of that feature is that if
you get a unix domain socket whose peer is in another PID namespace,
you can call pidfd_getfd() on that peer, which wouldn't normally be
possible? Though of course it'll still be subject to the normal ptrace
checks.
