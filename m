Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43567230BF8
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 15:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751643766; cv=none; b=uS9Ob8d3YViMwjp5+Ru0o55d6f//Hh2JtIWsucaWdmO8qAf11Q4UxqGaHvpmy0G+t74J0DKqcCrZwBgVyTfPwgrvMXgfOuh9BImDv/D19f7gnahinLdRJ6tfALWfGFvUIR5d0z0s5qkF16Xlug5ZrBkuNTs3Rj/rM0ulUWrjRh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751643766; c=relaxed/simple;
	bh=bQzYc/OvORs2+MDEId9o9V78KPf0mH4KiI9ntrGbOrY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t6ydsx/uqZ/wILDP1H7JDxVgzwAjVZ73HCtlo6fVjo2a38XHzBh6oa7qOrE+xNANebXJ9K7LyvEgFBAwa1sNCwUHzQrHMTdz7iDVybLHNvS/V7fcfvVn8zJlQb3nAiTF3vmlcv9XCxjnePitE/PhhzFR1ZMAXzAAnWiXDmH+vJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=khgoaMPK; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="khgoaMPK"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ae3703c2a8bso211597466b.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 08:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751643763; x=1752248563; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j8CmEkvx6j+SIdP/Nex5ihxr+2kLOB0LBXIuUiiK2ew=;
        b=khgoaMPKXf0npr4KT6vFakTt+YRtyCh3Lgo0QWjIL7sCZaHZ2kaIXPgT+jeNuqlE22
         i8oez8/yY1dm2VrfHH4QD/5AAvZQhJdTZcCRVEnNMqvqTPv/X7tMX2+kUv0c0pr6VJaN
         iRzmWHrMNPWdg8cOjHp3gUt0OGzIE033a9YRBliqrK7SQgmQbfha9r6rczjdU8YrTYpm
         kL3Pijp6SRbRAFn0AKzpcKxhmYNByJUxD2gK7BiMafnQJSvbpahy9AwMYS/myuOiNAMV
         +TN4+iDAxO018hL2IWfrg39yUyPjTdMSvZdzlU60t5DHJiayv8lva9DvIgu7Sv5gVW4d
         Qa4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751643763; x=1752248563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j8CmEkvx6j+SIdP/Nex5ihxr+2kLOB0LBXIuUiiK2ew=;
        b=JN6pL4hswgL7rXvLE+1HMSqaPd+N+XMRt+HH6leTedY1ZqXBoNbhcMW9oraL80k8jA
         KvQnODQ0kygWSrYz2VCNwHVNiFvNLM7p2Ch14YZSFkA6DVB3ZRSFM4Bw/WjqAVt2BYjW
         UdEIdXls7eqW3uHLAYChRdgYgb2E2TPjrxXNB7sEaM5BMrX3JQxUgD/td75g+W6yfT18
         cjuS5s0kw8aXffrHpV820JVrTB90DB1Vxyw/jmh0xdYld1wG7Cx6sSz1ZrXNzLk3fNtD
         rI6Xvwc+kURCx5zZf6PV6Ybz090Doqad84fLvV9EGf79eUbhYD3lXU47+0sy/0GmGWKf
         aoAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHh/qE5STlps03xqsoMLlj5ZqQoU3WuSZS4j/MxQRvzNcOS+2Pw2CTa6yJHjVE658toIGDRZqqQp424Kg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6OXrKlW/mZKX8cSzorPAaXLSmMwE1/6KHk47VRpx1xTTKiRGO
	RcsUOXUoF02Ed4Ji2Z4fNiemccajIV/ekPm9d4o7JTMeu72hyc4tUQjmTNz1POiOESG2mwnQIZW
	PbCeuzU0pmSb/g80rnVjoRFnF5QAmu0I=
X-Gm-Gg: ASbGncsvsYs9wp/XeptgENwB4+J6efo/uQ6XaIDjqVAwZdL3BTt5dN1ybxeeTnnChee
	zfoJqxrh96jYqglH01asU3JK+DaPmwvAqrW3fhtjoMWs46lnC+XgTk0QBW1awTMzf39RXq8b6ne
	HNfFCXDrKqAaPv3noJD2DByOceCEASAA3bukcTahIjwAs=
X-Google-Smtp-Source: AGHT+IHK0+UoFkqi8/r+0hmUFbXD7t2ypN1m2X7cWdjIuLAhgsN1aaeHSLen1ejO4/BdMdlQDMNGaKku4Q88hgrL5Es=
X-Received: by 2002:a17:907:7f8d:b0:ae0:68a8:bd6a with SMTP id
 a640c23a62f3a-ae3fbc4af04mr269371266b.15.1751643763390; Fri, 04 Jul 2025
 08:42:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250703084502.394406-1-chenmiao.ku@gmail.com>
 <f7e12c6d-892e-4ca3-9ef0-fbb524d04a48@ghiti.fr> <20250703114018.6fab0b8a@batman.local.home>
 <5ac2c90c-5907-40ce-a31e-05cb6d88fa52@ghiti.fr> <CAKxVwgeDcqo83ZV+xBcHwNuMk6yeU+yp7RYo22OARAVOBgrsJQ@mail.gmail.com>
 <8160f56d-967d-4fa0-b996-0e0a2aa8be20@ghiti.fr>
In-Reply-To: <8160f56d-967d-4fa0-b996-0e0a2aa8be20@ghiti.fr>
From: Miao Chen <chenmiao.ku@gmail.com>
Date: Fri, 4 Jul 2025 23:42:06 +0800
X-Gm-Features: Ac12FXzosVTkYaajpL9wrNvggbtf0aYJ_dE6_pPU6nEw_f7Eo0F87T3G1ado5f0
Message-ID: <CAKxVwgeZhsf3uXhiTLfDU1aszV4i8pfvFTJQd_D_hWLSaQvrdQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: ftrace: Fix the logic issue in DYNAMIC_FTRACE selection
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Steven Rostedt <rostedt@goodmis.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

Ok, I'll start my work right now.

Thanks,

Chen Miao


Alexandre Ghiti <alex@ghiti.fr> =E4=BA=8E2025=E5=B9=B47=E6=9C=884=E6=97=A5=
=E5=91=A8=E4=BA=94 20:28=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi Chen Miao,
>
> On 7/4/25 04:06, Miao Chen wrote:
> > Hello Alex,
> >
> > Should I wait for Steven to finish his work before starting mine? He
> > seems to be refactoring a lot of CONFIG logic, which might cause
> > conflicts.
>
>
> I would say no, don't wait for Steven since his work won't land in 6.16,
> we need a fix to prevent build failures for this release.
>
> Thanks,
>
> Alex
>
>
> >
> > Thanks,
> >
> > Chen Miao
> >
> > Alexandre Ghiti <alex@ghiti.fr> =E4=BA=8E2025=E5=B9=B47=E6=9C=884=E6=97=
=A5=E5=91=A8=E4=BA=94 00:06=E5=86=99=E9=81=93=EF=BC=9A
> >
> >     Hi Steve,
> >
> >     On 7/3/25 17:40, Steven Rostedt wrote:
> >     > On Thu, 3 Jul 2025 15:00:02 +0200
> >     > Alexandre Ghiti <alex@ghiti.fr> wrote:
> >     >
> >     >
> >     >> We could support static ftrace, but I don't think we should, so
> >     I agree
> >     >> with this patch. In fact I had just prepared a patch for this he=
re
> >     >>
> >     https://github.com/linux-riscv/linux/pull/556/commits/0481092a5bec3=
818658981c11f629e06e66382b3
> >     >> which is a bit more complete since I have removed some dead code=
.
> >     >>
> >     >> Let's see what other people think about supporting static
> >     ftrace, I have
> >     >> added Steven in cc if he has an opinion.
> >     > Yes, please only support the dynamic ftrace. The static is there
> >     only
> >     > to help archs to get ftrace up and running. Once dynamic is
> >     supported,
> >     > static should not be used.
> >     >
> >     > Hmm, maybe I should just remove the prompt for DYNAMIC_FTRACE.
> >     >
> >     > That is, once it is supported by an architecture, it should be
> >     the only
> >     > thing used.
> >     >
> >     > -- Steve
> >
> >
> >     Thanks for your input.
> >
> >     @ChenMiao: can you come up with a v2 that, in addition, deletes
> >     the dead
> >     code and with a commit log that explains what Steven said? If not
> >     possible for you, let me know and I'll do it.
> >
> >     Thanks,
> >
> >     Alex
> >
