Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABA32135D8
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 14:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738680109; cv=none; b=c8MTuS+lhLPsh03su6RyYnQEPCIUKWot/9CNSyQ9XiboHVY/Byl9dm6WJvrNGuZ/ngLsYKC6Vb0I1PVlOENpJus0WPAkdlGSA/A8AxworUcmvyGfrNNJj5CAVmZAiETB3Og7YjplxtWn2u/9PLa7iQhp9jp19nRJonpHmjTvwxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738680109; c=relaxed/simple;
	bh=ZOltCrwlKRi5Vioy1yls9srdUkkAMZ031oSIm6snxmA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cYUQgLFNJDaCH9iXpBq3z3hnlCuv1o95pPcNY+M0eAFfiLdsQYmY0clTU4emYMKt/LRrJYDqorHFSlWEsLLVZgKgSg5RZJRiy33DSQFqyOb4u5kGCowGv8/yeqT0FVCBUnCMPChs0oOozVu+8IqOoZvA06uuvbNjeuNU85c+xoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YJc9J5vX; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YJc9J5vX"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5db689a87cbso11294512a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 06:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738680104; x=1739284904; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUTYzoysUHn/B5DnDNoUBQM+pTbRPbNintFI7UBBYFc=;
        b=YJc9J5vXDYaF6WPYLwUrAc53tT1xoI+xdDmgptamJZBOxav4CPi9vXyDwN4mqd+pgF
         vTZu0MEtmH7lYMEwMeSARYnBe6AZZUHg9q65U5ueX8caT3FGmODkS1drjFjFpdUvmqal
         Ee5X0qgoe5wZyltJFtHzS0zBlsjEY2r0RkLUz8Q51X8BP0P6SPciedcaRbQKnWG9jzr+
         Y8N8HyzFWh+VNGTUQKETV7gcSifs0bJ0z197Pio/2ik4uh/93/uE2rnIy9Eyn9QtZ4yy
         XU49e1C7Yp7x31Yzlis651nDLyhdIMiUKxEeA32IVFFIK8uc5Dn9xNfkhQPDswE5AM44
         raMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738680104; x=1739284904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aUTYzoysUHn/B5DnDNoUBQM+pTbRPbNintFI7UBBYFc=;
        b=V+q9X8zfRRy8ArcE3UfzSRJ+q6mQ5uzeYTlDJVfoSTFGhMFvTbAlDNngKwVASrMKPK
         UgK8CwiSoZGfAKTu1yUmthp03Fyi6/Uvi06Dr4YhguBxSbDzFeFVTk1TK77XmKaJijdo
         gBqq9aDl0H53TY8IzlUNut/yxnYisyw+qq8Bl60fI47MrZUeL52f+AB9WO4J2s5i+gi6
         FYbdWSSnhZjLhof5Zhery/XIRWdtn9xTrVEvAInkcgRLOeYiJCuQ3QVDxhm/yitlTVSA
         iK8NPMFnVS8FEKWxR09JrU7OdimreM5+ZWMcpAnZdivGQarDvmDVES65kVTHLJJexmAc
         j3iw==
X-Forwarded-Encrypted: i=1; AJvYcCUTpXUzphuGoqFNPAZwgPEaaMpgbN6dQG/+xdXT0TTm1DYAmxdTSLohKm+JqIS9fIqabRl0vFjM3KzxzLE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDqOFnBnaRymO/a/3/75gdGMzJXK7W6trgclyz8SFMwcB0uAru
	UE8qPDe+pypDKqk4htq0P1KDOiWgJ/O4eq4ulIeGj/bWsPudk4d0R5h4b/wEpnKvm+3DHxUONLI
	S//Uhy605lSihzHY7yn20WQeZ0ELerC3Wi7Tn
X-Gm-Gg: ASbGnctJnmlKqKrj6bllG1oW7L/7HDAdjlGiyEhko8U2syhZ2lX+GO8d1otmXywtCmM
	53PifGsnTuiO06G8nE5HZ2Kl+auiEJLW1mQzlndMLbGvCEeEHdDoh1rcGKDOetUwWztQrnA==
X-Google-Smtp-Source: AGHT+IFdTSbfOgIGSfbKrBRiCzWFQxamnmRADI3W81hHAqW8HyUgT4lUIjGULwW1dENFd9LKs+JXE8OHQsbb2D/bdTQ=
X-Received: by 2002:a05:6402:5191:b0:5dc:cd96:49fe with SMTP id
 4fb4d7f45d1cf-5dccd964bd2mr2224365a12.21.1738680104302; Tue, 04 Feb 2025
 06:41:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <SY8P300MB0421E0013C0EBD2AA46BA709A1F42@SY8P300MB0421.AUSP300.PROD.OUTLOOK.COM>
 <b25b21b2-c999-4f21-9ad0-30113b4c655d@wanadoo.fr>
In-Reply-To: <b25b21b2-c999-4f21-9ad0-30113b4c655d@wanadoo.fr>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 4 Feb 2025 15:41:33 +0100
X-Gm-Features: AWEUYZnBlQ_eJ24CjL9TvNq15WN6n1fPhKiehmRNfwdUf7L5SJOMC4s_sJ-MK_M
Message-ID: <CANn89iKVKx8CMz_H65U+HzsY=ef8k=8T6a9dpQ7nHHv0+Cxwfw@mail.gmail.com>
Subject: Re: general protection fault in devlink_info_serial_number_put
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: YAN KANG <kangyan91@outlook.com>, Jiri Pirko <jiri@resnulli.us>, 
	Jakub Kicinski <kuba@kernel.org>, "syzkaller@googlegroups.com" <syzkaller@googlegroups.com>, 
	"David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	netdev@vger.kernel.org, 
	"linux-can@vger.kernel.org" <linux-can@vger.kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2025 at 3:09=E2=80=AFPM Vincent Mailhol
<mailhol.vincent@wanadoo.fr> wrote:
>
> +To: Jiri Pirko
> +To: Jakub Kicinski
> +CC: David S. Miller
> +CC: Eric Dumazet
> +CC: Paolo Abeni
> +CC: Simon Horman
> +CC: netdev@vger.kernel.org
>
> On 04/02/2025 at 16:44, YAN KANG wrote:
> > Dear developers and maintainers,
> >
> > I found a new kernel  NULL-Pointer-Dereference bug titiled "general pro=
tection fault in devlink_info_serial_number_put" while using modified syzka=
ller fuzzing tool. I Itested it on the latest Linux upstream version (6.13.=
0-rc7)related to ETAS ES58X CAN/USB DRIVER, and it was able to be triggered=
.
> >
> > The bug info is:
> >
> > kernel revision: v6.13-rc7
> > OOPS message: general protection fault in devlink_info_serial_number_pu=
t
> > reproducer:YES
> >
> > After preliminary analysis,  The root casue may be :
> > in the function:  es58x_devlink_info_get drivers/net/can/usb/etas_es58x=
/es58x_devlink.c
> > es58x_dev->udev->serial   =3D=3D NULL ,but no check for it.
> >
> >  devlink_info_serial_number_put(req, es58x_dev->udev->serial) triggers =
NPD .
> >
> > Fix suggestion: Check es58x_dev->udev->serial before deference pointer.
>
> Thanks for the report. I acknowledge the issue: the serial number of a
> USB device may be NULL and I forget to check this condition.
>
> @netdev and devlink maintainers
>
> I can of course fix this locally, but this that this kind of issue looks
> like some nasty pitfall to me. So, I was wondering if it wouldn't be
> safer to add the NULL check in the framework instead of in the device.
> The netlink is not part of the hot path, so a NULL check should not have
> performance impacts.
>
> I am thinking of:
>
> diff --git a/include/net/netlink.h b/include/net/netlink.h
> index e015ffbed819..eaee9a1aa91f 100644
> --- a/include/net/netlink.h
> +++ b/include/net/netlink.h
> @@ -1617,6 +1617,8 @@ static inline int nla_put_sint(struct sk_buff
> *skb, int attrtype, s64 value)
>  static inline int nla_put_string(struct sk_buff *skb, int attrtype,
>                                  const char *str)
>  {
> +       if (!str)
> +               return 0;
>         return nla_put(skb, attrtype, strlen(str) + 1, str);
>  }
>
> Of course, it is also possible to do the check in
> devlink_info_serial_number_put().
>
> What do you think?

Please fix the caller.

nla_put_string() is not supposed to be called with a NULL str.

Next time, we will have someone adding a test about a NULL skb.

Adding such tests could hide real bugs.

Thank you.
