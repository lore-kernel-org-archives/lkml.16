Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5FF2AE90
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 00:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747788938; cv=none; b=akwMAB5blOk9RQPoKmMxcVA+6v2KjSgNlnJFuZPH0rdhCwpMM9q7/EhkpFmmm6IjOlzWWAe2H9c5NHiuY3XJgyPpM/SJPF0EXhWtTMuVrXlUH7Iq8Ql/rsdfcv49zE2dCNh0l4/YJP/oc+1Mt0WwNUek8gB8VYeaoww1mEUU3vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747788938; c=relaxed/simple;
	bh=3Y0eI2D8cnedVznYRle7TnjGhJ3X2g6z0d4K3WJthKc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pvxJRT0rFZOnfPuKgAGoeg7syJx/7KsMxZZrnFtxvn8VujPiDxcJjLPAK8LsHIKua2CWnmmDfjXl6XPZzHyK4mwBu4D3KJK+OHe7R7v4MxGQ1VM1fp50DEOedvQF3N3P7kmUrecDHmLAdhK+i+jXcedY6BQQt/l7BTo7o6RKKmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t6iYY0S8; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t6iYY0S8"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-601a67c6e61so26766a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 17:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747788935; x=1748393735; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ncdPurYh5hOloTnF5wYlf3UcK9wRpi+Q0GSN2FGpFac=;
        b=t6iYY0S8F9uuz9aTdTGzVi/0cVIoOe4P+CoySV6Esk6I3hSqPnSlxEmZhR2u8jyazn
         laZVf6RcIc8ELzwaMXmGfjzYQ8SAbIjv4IFXfTyBXM/E2W9nI/tqpf0c0HJx+zg9X3sz
         MrOKJYrk8wCe3/BhQA8zA8uJZgW8q7sbB3N8j9nihnoyI+ojilBL6Z254QfkP518+Apm
         RInyo800CxqXW7BcYy9iFqfufCYmQIQopHLq7I/jexZVzzUpOgT/QeaOq4HuXYfFUAj/
         onx4WCI5hOEMWO5M/hYPiQC7vlPQlLNsr6vNaGwalY60y67tv0cTfeeC46JBlAtkvmy/
         q+hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747788935; x=1748393735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ncdPurYh5hOloTnF5wYlf3UcK9wRpi+Q0GSN2FGpFac=;
        b=YxMfwJ/m5ka3Xw/ZqXWZGeuHDJkhWq8QDCcImDKy9SWELtWAN1K85RmN4nS5X2J9M9
         GnwAAWtvZY3s5pMrx5Vg/CGxqTasklJ1cCyrYSI4cAvW7yIi9W5JXiTvkJZ67ENwPlaf
         rh8eQPl//ofs1z9SW6Tnnok0oWTwVtmigW7TInPPuSAHyIxNDxogPlkqhs+vo6pUgWp/
         VE63BmP66Qi+L5WQ67Mh0PZyxeH/IFhQSgkN9p4TjSMnqux4IYUmLz2Iw/DJn+9i562/
         2SQlW6kxiCAOyPo9zV6sRkU383Ml+/s95gTGQ5fqrzH3HageMJUAwtgXhQSkxUPHFXXU
         m3iA==
X-Forwarded-Encrypted: i=1; AJvYcCVNRNoglK9PspAodI+Ajr0Z1R1zmJpuoQmGOmuMLzeo6icZyXoIPqe+T6Xm74RQILcO5z5UlPtmV3UwY90=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjVPvBLs/diJu25zl1gm+cVpvrMy8PARyXfuZt4GKYJbgItX+C
	zF/wU9mb7wPFl6lpCAdo0qD4yfFPAQaxTu+GboBh+aQ5uIyfLOCdcsDklvPnnJbURh4PPHwhEJm
	JglPWTBjHtyJVANZVu1JUx/RI6FObHq49dJTI+F+k
X-Gm-Gg: ASbGncuLsN5drt/vrGUtmwzsgxCUQmX8UpmDYjV4lfDbn9WgSbOZ0KiSASlvpPyeizN
	zfPqbVM3iSzbVjbvNqfxeluLysBuOR8VSqBoV8gFdzbwDGfR5qBvWhDHVdhh83f9kigbEn6lM7N
	KZoeWJ0B0kfafOgUSC/T/GXKLVKSvBEfxqDQOd0DTR4fL5DOeoL330u1RIK38zyXal1ITHoKpN
X-Google-Smtp-Source: AGHT+IG1IjnHi54Q+N8idfo93JIC1frTSBUwH3gzuDMjjhBz9G/MzDcANwRogNTzPUUfNYSoKlZHrVja9CDjA4RXL78=
X-Received: by 2002:a05:6402:14d5:b0:601:233a:4f4d with SMTP id
 4fb4d7f45d1cf-6019bf2f776mr370366a12.2.1747788934322; Tue, 20 May 2025
 17:55:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520122838.29131f04@hermes.local> <20250521004207.10514-1-kuniyu@amazon.com>
In-Reply-To: <20250521004207.10514-1-kuniyu@amazon.com>
From: Jann Horn <jannh@google.com>
Date: Wed, 21 May 2025 02:54:58 +0200
X-Gm-Features: AX0GCFtQXlIu9odOXoeE-q7wbNaaPaAzIzGo4QIICbt2W9dOwceP8yBMza1qmTI
Message-ID: <CAG48ez0r4A7iMXzBBdPiHWycYSAGSm7VFWULCqKQPXoBKFWpEw@mail.gmail.com>
Subject: Re: [PATCH v8 0/9] coredump: add coredump socket
To: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: stephen@networkplumber.org, alexander@mihalicyn.com, brauner@kernel.org, 
	daan.j.demeyer@gmail.com, daniel@iogearbox.net, davem@davemloft.net, 
	david@readahead.eu, edumazet@google.com, horms@kernel.org, jack@suse.cz, 
	kuba@kernel.org, lennart@poettering.net, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, 
	luca.boccassi@gmail.com, me@yhndnzj.com, netdev@vger.kernel.org, 
	oleg@redhat.com, pabeni@redhat.com, serge@hallyn.com, viro@zeniv.linux.org.uk, 
	zbyszek@in.waw.pl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 2:42=E2=80=AFAM Kuniyuki Iwashima <kuniyu@amazon.co=
m> wrote:
> From: Stephen Hemminger <stephen@networkplumber.org>
> Date: Tue, 20 May 2025 12:28:38 -0700
> > On Fri, 16 May 2025 13:25:27 +0200
> > Christian Brauner <brauner@kernel.org> wrote:
> >
> > > Coredumping currently supports two modes:
> > >
> > > (1) Dumping directly into a file somewhere on the filesystem.
> > > (2) Dumping into a pipe connected to a usermode helper process
> > >     spawned as a child of the system_unbound_wq or kthreadd.
> > >
> > > For simplicity I'm mostly ignoring (1). There's probably still some
> > > users of (1) out there but processing coredumps in this way can be
> > > considered adventurous especially in the face of set*id binaries.
> > >
> > > The most common option should be (2) by now. It works by allowing
> > > userspace to put a string into /proc/sys/kernel/core_pattern like:
> > >
> > >         |/usr/lib/systemd/systemd-coredump %P %u %g %s %t %c %h
> > >
> > > The "|" at the beginning indicates to the kernel that a pipe must be
> > > used. The path following the pipe indicator is a path to a binary tha=
t
> > > will be spawned as a usermode helper process. Any additional paramete=
rs
> > > pass information about the task that is generating the coredump to th=
e
> > > binary that processes the coredump.
> > >
> > > In the example core_pattern shown above systemd-coredump is spawned a=
s a
> > > usermode helper. There's various conceptual consequences of this
> > > (non-exhaustive list):
> > >
> > > - systemd-coredump is spawned with file descriptor number 0 (stdin)
> > >   connected to the read-end of the pipe. All other file descriptors a=
re
> > >   closed. That specifically includes 1 (stdout) and 2 (stderr). This =
has
> > >   already caused bugs because userspace assumed that this cannot happ=
en
> > >   (Whether or not this is a sane assumption is irrelevant.).
> > >
> > > - systemd-coredump will be spawned as a child of system_unbound_wq. S=
o
> > >   it is not a child of any userspace process and specifically not a
> > >   child of PID 1. It cannot be waited upon and is in a weird hybrid
> > >   upcall which are difficult for userspace to control correctly.
> > >
> > > - systemd-coredump is spawned with full kernel privileges. This
> > >   necessitates all kinds of weird privilege dropping excercises in
> > >   userspace to make this safe.
> > >
> > > - A new usermode helper has to be spawned for each crashing process.
> > >
> > > This series adds a new mode:
> > >
> > > (3) Dumping into an AF_UNIX socket.
> > >
> > > Userspace can set /proc/sys/kernel/core_pattern to:
> > >
> > >         @/path/to/coredump.socket
> > >
> > > The "@" at the beginning indicates to the kernel that an AF_UNIX
> > > coredump socket will be used to process coredumps.
> > >
> > > The coredump socket must be located in the initial mount namespace.
> > > When a task coredumps it opens a client socket in the initial network
> > > namespace and connects to the coredump socket.
> >
> >
> > There is a problem with using @ as naming convention.
> > The starting character of @ is already used to indicate abstract
> > unix domain sockets in some programs like ss.
> > And will the new coredump socekt allow use of abstrace unix
> > domain sockets?
>
> The coredump only works with the pathname socket, so ideally
> the prefix should be '/', but it's same with the direct-file
> coredump.  We can distinguish the socket by S_ISSOCK() though.

The path lookups work very differently between COREDUMP_SOCK and
COREDUMP_FILE - they are interpreted relative to different namespaces,
and they run with different privileges, and they do different format
string interpretation. I think trying to determine dynamically whether
the path refers to a socket or to a nonexistent location at which we
should create a file (or a preexisting file we should clobber) would
not be practical, partly for these reasons.

Also, fundamentally, if we have the choice between letting userspace
be explicit about what it wants, or trying to guess userspace's intent
from the kernel, I think we should always go for being explicit.

So I guess it could be reasonable to bikeshed the prefix letter and
turn '@' into some other character that is not overloaded with another
meaning in this context, like '>'; but I don't think we should be
changing the overall approach because of this.
