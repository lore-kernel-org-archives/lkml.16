Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C7B28C017
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 13:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750426007; cv=none; b=qmNDOnxeUO9KbmOsIChczPP/RARc5guldiDMwDKfJwww9yMlUsoen22aDHEceJr5I/vY3oMeXPsOfHvNci37S3ciTaHMlmAeE302UpHHgpVz9JUQkhDnoTQPLBdsJmL1NMMB9fxpO0c0D2voPWBVKy99RnUuEbQO32JY6EeOCBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750426007; c=relaxed/simple;
	bh=uGDSmN1Bn9KymxM1n0AKRVdzm4Zv44ANkeM1x2b6wcg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GOezmBV6fpLRsMqpGy4TqDDQWXj2QjCKA9vg0UowYg6X0tDHIXDFYFc4KJyp2P9vuuvZa9AD+ZiYhKDxEpzBehBGZVUBak+PZALlPrmppVPLQtGohfv1fOvHu3Yi4MpSPaPYggMKOt9itg1W6PI2fQk87Kg+aN6PMYT3/YNEJ6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BuY9LGvP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BuY9LGvP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750426004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=va6HnxKqwnYKuf/fRSc6EaONc2s1iOuaTEBov2u5AN8=;
	b=BuY9LGvPkatpINa6LP1MfaI4Il6LhPE+LVihNtd2HqzOuMWjXg8OiqU5kVKQDwHsnmsOH2
	tgd86Ak0/slw0KCjqULSNxjFGIp+547d8jj0KGXTU6ZQWrXshN1PvmxAdATM1O8BpEi/Br
	WtOOr1Nh/LQdy9wDqA4Y/a5sSo+4tdw=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-6m850jOpPqS1L6Ru6ni96A-1; Fri, 20 Jun 2025 09:26:42 -0400
X-MC-Unique: 6m850jOpPqS1L6Ru6ni96A-1
X-Mimecast-MFC-AGG-ID: 6m850jOpPqS1L6Ru6ni96A_1750426002
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a4369e7413so36947511cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 06:26:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750426002; x=1751030802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=va6HnxKqwnYKuf/fRSc6EaONc2s1iOuaTEBov2u5AN8=;
        b=CJuHHmiWpGtdLveWX2CLvczgum9U3hm5L+jdBNy8sYU+I7aCGMk+xW/3y3/jG1iTtd
         tZMACQTDfaMwJWTDJ8zDFXO+utMnfs/A/f2be0Mx6UtIbgDM32hrnXCwe/nKxulVe2co
         wJVUYKMsEPdbFx+VbPoqk5AVwvtQGLQXzyYwuSetgY2Lnitg7ZCg0OEXd+cJzdAlqybA
         9X/IKzGTkA27o+crN1cc5K1ncP6qG+u6oX2OZv8e9ZmGySwiF5GPbdZoRBjsDdqyvXpI
         x6xRU8dBYP15G4+qr3p2WZfM+WXM6Gtpj28t5difgZ48c8z70i2fq9XQHT3i1TJK+v54
         S9Gg==
X-Forwarded-Encrypted: i=1; AJvYcCVVGBY+Bq2CD9kzdsTl68XIdtYaXRG2qQVu3/CfuMPjMCet7UceMz9Y7yuCJqXayQxyl+2qk7ai69r9V1g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvMsT7P50BZCog5eyXF7nL2DlSVOP5Y2j92ITZsqw7Dt3lwHmf
	q5P2KnTbX7di0ukS+u5KijuJEx5zgEEUsfFPPVbVV2FkudzYSQu1opyZxIaVe/DyxoxeUsh0CiF
	vRGEOvJMY961sgJ5yC0I3NIsdP1wVP7/6ghJns5D37TvbKFkhV7ie+6llLqS6d9hxYiOpyeVize
	hTlGMW+iGtaWlr6J2LMm/p7Y9Ml5PZFjFBhRGYI5CesgCorAFs06mabJP1
X-Gm-Gg: ASbGncuo+Qai7dDu8rc69H07X0ksf7C3oLlmkuGEqrEBWizlAOElDljN/Sfnv8ev5tY
	kvOCQzhhUIllqcldjh0QyulfI6gHOA7ZuXABcwC6jXVypEiXjgLKhez6+w06q40vLDt/AXXsezB
	lWlCeezBtyqx7/XhGx6BUw04tC4xuRw32xUnEu
X-Received: by 2002:a05:622a:255:b0:4a7:634e:f6ef with SMTP id d75a77b69052e-4a77a292e95mr44725611cf.52.1750426000373;
        Fri, 20 Jun 2025 06:26:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiD5qb7iwaNfZeK10uZOoCvtChA8JBG3Tm+tuEEtZ6iVzIqsUh17pQM4VkqTOUlNM3S9PUAnxaF9hqRK6QRCk=
X-Received: by 2002:a05:622a:255:b0:4a7:634e:f6ef with SMTP id
 d75a77b69052e-4a77a292e95mr44724941cf.52.1750425999560; Fri, 20 Jun 2025
 06:26:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612104349.5047-1-gpaoloni@redhat.com> <20250612104349.5047-2-gpaoloni@redhat.com>
 <20250613114527.7e27a9a0ecc2b59d98677b0c@kernel.org> <CA+wEVJa0jL-JH_4=5sR+Mvb26n4mPPudmOL0LRBDV54nMZcw8g@mail.gmail.com>
 <20250620183503.6c84eb22cca206cd10418c04@kernel.org>
In-Reply-To: <20250620183503.6c84eb22cca206cd10418c04@kernel.org>
From: Gabriele Paoloni <gpaoloni@redhat.com>
Date: Fri, 20 Jun 2025 15:26:27 +0200
X-Gm-Features: AX0GCFuibzZh0V6rfQ6iGxaQ5-6XZ3QSiFeUbkTaOerVNc_l1B4y2cXhQ6Nq0aA
Message-ID: <CA+wEVJaQcHdpVc3Za8qy0+Z-CGNeaDTrXtjJg2j7J6qsW4uAkQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] tracing: fixes of ftrace_enable_fops
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: rostedt@goodmis.org, mathieu.desnoyers@efficios.com, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	acarmina@redhat.com, chuck.wolber@boeing.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 11:35=E2=80=AFAM Masami Hiramatsu <mhiramat@kernel.=
org> wrote:
>
> On Thu, 19 Jun 2025 19:07:33 +0200
> Gabriele Paoloni <gpaoloni@redhat.com> wrote:
>
> > Hi Masami
> >
> > On Fri, Jun 13, 2025 at 4:45=E2=80=AFAM Masami Hiramatsu <mhiramat@kern=
el.org> wrote:
> > >
> > > On Thu, 12 Jun 2025 12:43:48 +0200
> > > Gabriele Paoloni <gpaoloni@redhat.com> wrote:
> > >
> > > > Currently there are different issues associated with ftrace_enable_=
fops
> > > > - event_enable_write: *ppos is increased while not used at all in t=
he
> > > >   write operation itself (following a write, this could lead a read=
 to
> > > >   fail or report a corrupted event status);
> > >
> > > Here, we expected the "enable" file is a pseudo text file. So if
> > > there is a write, the ppos should be incremented.
> > >
> > > > - event_enable_read: cnt < strlen(buf) is allowed and this can lead=
 to
> > > >   reading an incomplete event status (i.e. not all status character=
s
> > > >   are retrieved) and/or reading the status in a non-atomic way (i.e=
.
> > > >   the status could change between two consecutive reads);
> > >
> > > As I said, the "enable" file is a kind of text file. So reader must r=
ead
> > > it until EOF. If you need to get the consistent result, user should
> > > use the enough size of buffer.
> >
> > What I am concerned about are scenarios like the one below:
> > ---
> > # strace -Tfe trace=3Dopenat,open,read,write scat 1
> > /sys/kernel/tracing/events/kprobes/ev1/enable
> > open("/sys/kernel/tracing/events/kprobes/ev1/enable",
> > O_RDONLY|O_LARGEFILE) =3D 3 <0.000237>
> > Open /sys/kernel/tracing/events/kprobes/ev1/enable ->fd=3D3
> > read fd=3D3, 1
> > read(3, "0", 1)                         =3D 1 <0.000099>
> > 1 bytes Read
> > 30,
> > read(3, "\n", 1)                        =3D 1 <0.000095>
> > 1 bytes Read
> > 0a,
> > read(3, "", 1)                          =3D 0 <0.000102>
> > close fd=3D3
> > +++ exited with 0 +++
> > ---
> > So in this case there are 2 consecutive reads byte by byte that
> > could lead to inconsistent results if in the meantime the event
> > status has changed.
>
> Unless you take a lock explicitly, ftrace (and other pseudo
> files) does not guarantee the consistency between 2 read()
> syscalls, because it is something like a file which is shared
> with kernel side.
>
> Please imagine that this is something like a file shared
> between two processes, one updating it and one reading it.
> The kernel guarantees the one read() will consistent, but
> two read()s may not be consistent because it can be updated
> by another.

Yes, this is the reason behind the proposal I made here.
In this case the Kernel rejects a read that is requesting
a number of bytes cnt that is smaller than strlen(buf).

>
> > With the proposed patchset the same test would result in a failure
> > as per log below:
> > ---
> > # strace -Tfe trace=3Dopenat,open,read,write scat 1
> > /sys/kernel/tracing/events/kprobes/ev1/enable
> > open("/sys/kernel/tracing/events/kprobes/ev1/enable",
> > O_RDONLY|O_LARGEFILE) =3D 3 <0.000227>
> > Open /sys/kernel/tracing/events/kprobes/ev1/enable ->fd=3D3
> > read fd=3D3, 1
> > read(3, 0x7ffd960234e0, 1)              =3D -1 EINVAL (Invalid argument=
)
> > <0.000228>
> > close fd=3D3
> > +++ exited with 0 +++
> > ---
> > On the other side the proposed patchset would be still compatible with
> > =E2=80=9Ccat=E2=80=9D or =E2=80=9Cscat 2=E2=80=9D commands that continu=
e to work as they do today.
> >
> > >
> > > > - .llseek is set to default_llseek: this is wrong since for this
> > > >   type of files it does not make sense to reposition the ppos offse=
t.
> > > >   Hence this should be set instead to noop_llseek.
> > >
> > > As I said, it is a kind of text file, default_llseek is better.
> > >
> > > But, if we change (re-design) what is this "enable" file is,
> > > we can accept these changes. So this is not a "Fix" but re-design
> > > of the "enable" file as an interface (as a char device), not a text
> > > file (or a block device).
> > >
> > > I want to keep this as is, same as other tracefs files.
> >
> > IMO it is a redesign that is enforcing the user to avoid erroneous
> > usages of enable files (because the reads are either reporting the
> > whole and correct status of the event or failing to read; also the user
> > cannot llseek into a position that would lead to not reading or reading
> > a corrupted status).
>
> Can you make it for files which can be bigger than PAGE_SIZE?
>
> For example, "hist" file also can be inconsistent if user reads
> it several times. Can you also update it to return -EINVAL
> if read buffer size is smaller?

From a very quick look it seems that the read callback of event_hist_fops
is set to the standard seq_read, whereas the read callback in
ftrace_enable_fops defines its own method.
So maybe redesigning the read callback of event_hist_fops could
achieve this goal (in order to be sure I need to look deeper into it,
this is just a guess).

>
> >
> > On the other hand the proposed re-design is fully compatible with
> > the current user space commands reading and writing to the enable
> > files.
> >
> > If the concern is having inconsistent implementations between tracefs
> > files, I am happy to extend this patchset to all traces files, however,
> > before doing so, I would like to have your approval.
>
>
> Hmm, I'm still not convinced. If you redesign it, that should also
> be applied to other pseudo files. "why tracefs can not read partially,
> but procfs can?" I guess that can cause more confusion and will
> lead unneeded debug.
>
> > Otherwise I will just document the current functions and associated
> > assumptions of use that the user must comply with in order to avoid
> > the erroneous behaviour.
>
> Yeah, I like to update the document so that user must read with enough
> size of buffer. And TIPs how to read consistent data from each file.

I think that from my side I do not have comprehensive answers to all your
questions (I need to read the code more in depth).
So to be pragmatic I can split this effort into two parts (documentation an=
d
redesign); I will propose documentation first with the TIPs that you mentio=
ned
above and later, if we find a better re-design solution, we can also amend
the documentation as needed.

Many thanks for your advice and directions
Gab

>
> Thank you,
>
> >
> > Thanks a lot for your inputs and clarifications.
> > Gab
> > >
> > > Thank you,
> > >
> > > >
> > > > This patch fixes all the issues listed above.
> > > >
> > > > Signed-off-by: Gabriele Paoloni <gpaoloni@redhat.com>
> > > > Tested-by: Alessandro Carminati <acarmina@redhat.com>
> > > > ---
> > > >  kernel/trace/trace_events.c | 11 ++++++++---
> > > >  1 file changed, 8 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/kernel/trace/trace_events.c b/kernel/trace/trace_event=
s.c
> > > > index 120531268abf..5e84ef01d0c8 100644
> > > > --- a/kernel/trace/trace_events.c
> > > > +++ b/kernel/trace/trace_events.c
> > > > @@ -1798,6 +1798,13 @@ event_enable_read(struct file *filp, char __=
user *ubuf, size_t cnt,
> > > >
> > > >       strcat(buf, "\n");
> > > >
> > > > +     /*
> > > > +      * A requested cnt less than strlen(buf) could lead to a wron=
g
> > > > +      * event status being reported.
> > > > +      */
> > > > +     if (cnt < strlen(buf))
> > > > +             return -EINVAL;
> > > > +
> > > >       return simple_read_from_buffer(ubuf, cnt, ppos, buf, strlen(b=
uf));
> > > >  }
> > > >
> > > > @@ -1833,8 +1840,6 @@ event_enable_write(struct file *filp, const c=
har __user *ubuf, size_t cnt,
> > > >               return -EINVAL;
> > > >       }
> > > >
> > > > -     *ppos +=3D cnt;
> > > > -
> > > >       return cnt;
> > > >  }
> > > >
> > > > @@ -2557,7 +2562,7 @@ static const struct file_operations ftrace_en=
able_fops =3D {
> > > >       .read =3D event_enable_read,
> > > >       .write =3D event_enable_write,
> > > >       .release =3D tracing_release_file_tr,
> > > > -     .llseek =3D default_llseek,
> > > > +     .llseek =3D noop_llseek,
> > > >  };
> > > >
> > > >  static const struct file_operations ftrace_event_format_fops =3D {
> > > > --
> > > > 2.48.1
> > > >
> > >
> > >
> > > --
> > > Masami Hiramatsu (Google) <mhiramat@kernel.org>
> > >
> >
>
>
> --
> Masami Hiramatsu (Google) <mhiramat@kernel.org>
>

