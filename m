Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC971266B6F;
	Mon, 12 May 2025 12:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747051493; cv=none; b=j9ZQuFVt9/QSa1y+uP/5XIxbLiZufGNovo/m7pyQWOb43tUUcxL/vSrwra5kmRjyabqXAcM0u0IgT+JbUso8TcHnQrhloz5e4pmY+EpjUbS8HXyRJhJ6GxehS1i15UYcMqOFPe1wF8A+1yz3kXuMI+Lki4tBzRTFalm5ji/sksw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747051493; c=relaxed/simple;
	bh=PpwkHoR7PJskW5QA/sZTjuYp/r8Etk0ME04dY9V1dvc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lKQzd+qron2b/D7osJ92S8ka/AwxLaeNG7boI8udwXnvgO05cIocUwVtOva4hqGsSLx/UR+jBC5MUAFYSXPLJtWvyDVKJBk8n+5w+qCyzmgNDKs8RGgwJERJ+F3YmiEJR2r+OQ+4s7/PlgCebuUK1RvprBgrYVJm/dz1kDmrDH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MQjMNrFC; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MQjMNrFC"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3da74959554so10799595ab.2;
        Mon, 12 May 2025 05:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747051491; x=1747656291; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fVY7byQqj11Mp4UMewsQhtrEKoqNNj+/7xklvS2HfUE=;
        b=MQjMNrFCsbr/GCOAG9js624WUrKlFLkHmSdFr2uXFGJg6Hprtl2qi8oM0QXbWlseTK
         a67GqrfGZxpxRgauS1uBUKt77LPzS15LhTRFMUge7OGE6B3xG2L8/mI/zgJ2+iOc0RvK
         /lcCbXPDOzYXwgZaQthKEnehcg9EOGE+z7Trp8+hZKEQP3oRb4XI+hn+OHVoz+B/AT6I
         DOFRIszN+pes8lQ1TySYVF45isdtxT9Q+GqA1SWY37wKPj+ZNVkA30l4817F/XZWXAm5
         89cInqnnlTSxMbzq/JFSAOpt4YVYbQDD5JQIx7r/zENqOet/3BdmVE5RQ6SRmxnpXk7r
         7SXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747051491; x=1747656291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fVY7byQqj11Mp4UMewsQhtrEKoqNNj+/7xklvS2HfUE=;
        b=K37iNwOzD7IkS6OQpC/fzls++F+N8cj6G/vSt/0eQgBuoxmXmhTu6/M8p5p8G8Sjkm
         woDbnxfvu2V1xfN6e3zyuzeALaDjJCiiw9UDBCLc/4Hvs3+Ch7cmGyUu0Yp0guMGF5TI
         /n0n/Ni5iOKdKrU5N9N25heOGJKpTKy75swKoh2aDE0Cxm1pxsE8VzfrRPeOCS4zlZAA
         4ptYVo5DB7UuHkwJgMc5KOe0FklGvjEI8oM+bXp9yl/dAYCD0dmRPTHvb5xl1TVRJZEb
         IbBORiu/8Hlv930K4HWxRYqHo8X6OntKMRxAQPJiIu3pd1R8ybC7Ql1B4gJXXLGyacf4
         c1GQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDTux4F188puuFdTkXl+eEP5idIwiAmK2oXNewq4BszMTXDDFMbLoGUl3AbjDjeQSD7Mz/i+Rv52C0n0gp@vger.kernel.org, AJvYcCWFdlRaUFY0Z0xII7cB4XyDGSFWx1lRBr60gOf0iPbVf1jb6kjOyTWa5oaeQRCn3c/h6GkaKhYz3jk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBgyBqyLXRZsjbFeIiKzAW85ZWHeMKp53Ex2Vn8XCuiR3s6kOa
	PAgjDq2jjBuOLYXTRanxz7jcf6P4LbnIVn0TWN8mmXYcOhJ+FurHjD7DnweS7KkHh1UxtrNOKOX
	hTE3mfk9/Y36XUtRAOojs7MjViXY=
X-Gm-Gg: ASbGncsD1XnYb1yPzCCSxwBjT4wTslByqpb2Z6m7kQMA87IqYtKwScn16csIJgRtfFc
	hOgNrQ1VamElItGtz9YN3J0cqSXDs/Fdsdz0/cWrhG1oBTF6ukbw1bqmWaGwKbrVfYOsTBuoTYB
	9r56w5g3CIVNatg35GcaN5jd9GhRold/w=
X-Google-Smtp-Source: AGHT+IF+cm95w7zeD5eNH1MGsRiuHvvjVFJ0Fx5a87jgCqHzQbLg02uuOBemX2pKy0udX77yN5QCfNXQ2TD5+M+uuiU=
X-Received: by 2002:a92:c244:0:b0:3d8:975:b808 with SMTP id
 e9e14a558f8ab-3da7e1e1a99mr144517865ab.5.1747051490823; Mon, 12 May 2025
 05:04:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAL+tcoCVjihJc=exL4hJDaLFr=CrMx=2JgYO_F_m12-LP9Lc-A@mail.gmail.com>
 <aCFPRhfxKUeRu1Qh@gallifrey> <CAL+tcoBKZ4FMk9ozFidWUgfrEyRBrHCsh4cMMbTOA_e-wn0UJQ@mail.gmail.com>
 <aCHggEc3MdlL6t7j@gallifrey>
In-Reply-To: <aCHggEc3MdlL6t7j@gallifrey>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Mon, 12 May 2025 20:04:14 +0800
X-Gm-Features: AX0GCFvG_McLYJiBDlL1xuYUkPzx-TAS0NIMozS3ebq7908bZVT8VDFSPGoA1Ww
Message-ID: <CAL+tcoAdbQEuS5ZA3CJuEm4PDMKBF4mvv6cSV-xBtqK-pr_k2g@mail.gmail.com>
Subject: Re: [PATCH] relay: Remove unused relay_late_setup_files
To: "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, andriy.shevchenko@linux.intel.com, 
	corbet@lwn.net, linux-doc@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, viro@zeniv.linux.org.uk, 
	Jens Axboe <axboe@kernel.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 7:50=E2=80=AFPM Dr. David Alan Gilbert
<linux@treblig.org> wrote:
>
> * Jason Xing (kerneljasonxing@gmail.com) wrote:
> > On Mon, May 12, 2025 at 9:30=E2=80=AFAM Dr. David Alan Gilbert
> > <linux@treblig.org> wrote:
> > >
> > > * Jason Xing (kerneljasonxing@gmail.com) wrote:
> > > > Hi All,
> > >
> > > Hi Jason,
> > >
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
> > >
> > > We've got lots of deadcode, why it's dead varies a lot; for example
> > > people forgetting to clean it up after other patches etc - so this
> > > _could_ be used but hasn't been for well over 7 years.
> > >
> > > > Dr. David, I appreciate your patch, but please do not simply do the
> > > > random cleanup work __here__. If you take a deep look at the relayf=
s,
> > > > you may find there are other interfaces/functions no one uses in th=
e
> > > > kernel tree.
> > >
> > > Actually, that was the only interface in relay that I found unused.
> >
> > Not really. More than this single one, say, __relay_write() and
> > subbuf_start_reserve()...
>
> Ah, my tools only spot unused symbols, they're header inlines; I've
> not found a way to spot those yet.
>
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
> > > If you've got a use for that function, then I'm more than happy to su=
ggest
> > > just dropping my patch.
> > >
> > > However, it is a fairly chunky function that is built into distro
> > > kernels - so I think it should have a little thought put to it.
> > >
> > > As I say, if you are using it, it's fine by me just to drop this patc=
h.
> >
> > For now, I'm not using it but still considering what the use case
> > might be in the future. As I mentioned earlier, I'm trying to make
> > relayfs more robust with more realistic functions.
> >
> > IMHO, it's not really a dead code to me unless you can clarify why
> > it's obsolete instead of claiming "no one is using it".
>
> i'm very gentle about this; I'm not pushing back hard if someone
> says actually they want to keep something.
>
> I'd say my 'claim' is fairly good as even you say
>   'I'm not using it but still considering..'
>
> You don't need to push back quite as hard on me!

Oh, sorry, It's absolutely not my intention. I was trying to share my
opinion. No hard feelings;)

>
> > If you insist
> > on the point, then most of relayfs would be removed, which is
> > apparently not what I'm wishing for.
>
> You could forgive me for thinking this is unused;
>   a) There are no callers in the tree - I can't possibly imagine all
>    other trees to check; especially those on someones local disk
>    or thoughts still bouncing around in your brain!
>
>   b) There's no listed maintainer, so I can't assume anyone is actively
>   working on it
>
>   c) The only changes in years in the tree are cleanups, like strcpy
>   variants.
>
> We do have other APIs that people care about and aren't in use;
> now if those are nicely thought out APIs etc I think that's fine.
> (I've had others say they want to keep some because they like them or
> they're part of a well thought out API)

I see what you mean here. Relayfs is a bit special.

>
> > Probably it will be finally removed, but not at the moment. Evidence
> > is still not clear to me :S
> >
> > For sure, the last call would be made by Andrew and Jens. Please help
> > review this patch one more time. Thanks!
>
> Why don't you add a MAINTAINERS section with you added just as a
> reviewer?   That at least gets you told if someone dares to clean it up
> in the future!

Right, thanks for advising. I'm now asking for permission from Andrew and J=
ens.

Thanks,
Jason

>
> Dave
>
> > Thanks,
> > Jason
> >
> > >
> > > Dave
> > >
> > > > [1]: https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/co=
mmit/?h=3Dmm-everything&id=3D46aa76118ee365c25911806e34d28fc2aa5ef997
> > > >
> > > > Thanks,
> > > > Jason
> > > --
> > >  -----Open up your eyes, open up your mind, open up your code -------
> > > / Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  =
\
> > > \        dave @ treblig.org |                               | In Hex =
/
> > >  \ _________________________|_____ http://www.treblig.org   |_______/
> --
>  -----Open up your eyes, open up your mind, open up your code -------
> / Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \
> \        dave @ treblig.org |                               | In Hex /
>  \ _________________________|_____ http://www.treblig.org   |_______/
