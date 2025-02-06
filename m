Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE864226554
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 10:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738836595; cv=none; b=f5SHxh5wDr9cbOZHQiRDmCa6W4M7tbg67RWtc0+7bz5o/QhyOfI8Q41wC5bh0URUSPHPQ2VMHLM9yjXRctnbmajDivmp/oKqz+MaV5b2rvUy684SOTaR/CKpKrPWrjj9WXwMuY9sEg5np2FZVkTwtqCR3qVkBPj8f+kaE2vhdSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738836595; c=relaxed/simple;
	bh=ZKuwgtDky8Xhvl3M5A4riV3YCHfxsc86ad2FkrZnwH4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Eypm1XJYpS+yqU/2fSHcN/fMuVvzQkuk+v6X/dCu8G3fB+Da95byTWnt8fj84nOXR8O0eqiJJ6N8ewjxb/tsgHCBoDLAoDUpcApxnhr40NI5ppkXxs7o/P2DReJDvV3z2RStuFYkWecD/r2fbJ3BrU3dZw3GaoxrnLfXSsD6hBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XcE4Spji; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XcE4Spji"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5dccaaca646so1436810a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 02:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738836592; x=1739441392; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/mS+2eKExtyTN8Vh4IHH9mnRtV5vHTtYoa32EFAd2o=;
        b=XcE4Spji8nuxLrB+Hur+CsJpythTP+Uwzan3CkG3tKmbqsE6L7AUDrUGi9c296gOUo
         V7/Z3OugoRIa8nsyvLydx8JdJ6r7eKhJFopjdr5LsthBUuVq/Ny5KISNamBxoZzkDyX/
         HMFzESvx8/dWid8gBeffpdv4wilnm6MQAxAmkQ3KRWwJ1bxaBt5ferpAWHR8lFPA3XRY
         nsxujNXXdwxXac0uglLBkf411eukbY70rhya+XDQ+U0g7j2oRD5+zep6AZODSlaujPfa
         4kzAPuGhRWpaz2zy/juFXhm6RP8gs9SsG3mxhu6ryZ3IBFvjXVFsvj2cB4SBQwebTp+N
         5xtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738836592; x=1739441392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s/mS+2eKExtyTN8Vh4IHH9mnRtV5vHTtYoa32EFAd2o=;
        b=V9pJ13kOb4VsPXIV6+cxDhCZq6mxDVYS031HTN2/WU17YWhun76OZx10vA9yqxWv1X
         1ykiD6Vyn7frUNC180AslwDQqyEOPuGlziNCdKSB2DqM4OPsaAeAscTysSDE6EReRGd0
         dvE5H/IYyfBeVsLqPUSZUO9aM25UfqrRM5QpfwSlkJpfuWfdNHqsnSaDk0CysrDUtTPF
         34U8oL2wjN142SD9RKsVhThSSsRkEF5ZK2EkUSJQbrVkIS80afwAw3INyKYZ2pPQZJl0
         YR2PhvIDtZ0LqHHbG54hDJgSr5siO4xnms08pGj3DPyCl/TSpLFfzWjLSeiVB42eZvuE
         +dBg==
X-Forwarded-Encrypted: i=1; AJvYcCXDSpJvEvdNjBWRhzUTuGyegwH4lLF0GPOWEir783DAXm7Eh2A1p0DknI+oUV2s/PMTDOerR1gcOLKyMnE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxAlz2IgtKNUbTFK3+yepZtv8b41jUCMoQ7fCMtB+Pzbfsx3Os
	e00jF05sjd9KoDqid+WodAjZ/x/gBLr+YyIvJr+dIJqbztaYWhjkwakRCD8+0hB5izW46q1MDxL
	5UuorlCVolHj7PM5Ud/EFUev0rKXh2CwJpB3t
X-Gm-Gg: ASbGnctRy+XEzmPcHLymwzBIw40mpSgbmNw24e3Tcc3TyuhtoO/z+drMJFSvSg0Sq90
	uB55FvYhtdZLjuEWWVmd75Ss4f38HRjw97qFdQcdKB64J7QUO8RVS9Lpy6Ywa196DrMNOx/p+7w
	==
X-Google-Smtp-Source: AGHT+IGFKTjHRLId4nFdVIg3ODAcW2J4cs6ogAI1LmO1CoOh8Ex4tMJTJEHvJbynBPllxErs4E2UPC8o2j0J9lonb/4=
X-Received: by 2002:a05:6402:5251:b0:5db:e88c:914f with SMTP id
 4fb4d7f45d1cf-5dcecc86fc3mr2937575a12.4.1738836591837; Thu, 06 Feb 2025
 02:09:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206085834.17590-1-kuniyu@amazon.com> <20250206094457.196837-1-buaajxlj@163.com>
In-Reply-To: <20250206094457.196837-1-buaajxlj@163.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 6 Feb 2025 11:09:40 +0100
X-Gm-Features: AWEUYZn8RPseVUE6PE6vSWtPVOwP4H5ImNtxgeSrgvVvG1jZvCKDknd4smT8iBI
Message-ID: <CANn89iLYV+R1CQiuvjtU=aQinVAKyhQiJVUxWG7t=-M72ZsToA@mail.gmail.com>
Subject: Re: [PATCH net-next v2] af_unix: Refine UNIX pathname sockets
 autobind identifier length
To: Liang Jie <buaajxlj@163.com>
Cc: kuniyu@amazon.com, davem@davemloft.net, horms@kernel.org, kuba@kernel.org, 
	liangjie@lixiang.com, linux-kernel@vger.kernel.org, mhal@rbox.co, 
	netdev@vger.kernel.org, pabeni@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 10:45=E2=80=AFAM Liang Jie <buaajxlj@163.com> wrote:
>
> From: Kuniyuki Iwashima <kuniyu@amazon.com>
> Date: Thu, 6 Feb 2025 17:58:34 +0900
> > From: Liang Jie <buaajxlj@163.com>
> > Date: Thu,  6 Feb 2025 16:19:05 +0800
> > > Hi Kuniyuki,
> > >
> > > The logs from 'netdev/build_allmodconfig_warn' is as follows:
> > >   ../net/unix/af_unix.c: In function =E2=80=98unix_autobind=E2=80=99:
> > >   ../net/unix/af_unix.c:1222:52: warning: =E2=80=98snprintf=E2=80=99 =
output truncated before the last format character [-Wformat-truncation=3D]
> > >    1222 |         snprintf(addr->name->sun_path + 1, 5, "%05x", order=
num);
> > >         |                                                    ^
> > >   ../net/unix/af_unix.c:1222:9: note: =E2=80=98snprintf=E2=80=99 outp=
ut 6 bytes into a destination of size 5
> > >    1222 |         snprintf(addr->name->sun_path + 1, 5, "%05x", order=
num);
> > >         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
> > >
> > > snprintf() also append a trailing '\0' at the end of the sun_path.
> >
> > I didn't say snprintf() would work rather we need a variant of it that
> > does not terminate string with \0.
> >
> >
> > >
> > > Now, I think of three options. Which one do you think we should choos=
e?
> > >
> > > 1. Allocate an additional byte during the kzalloc phase.
> > >     addr =3D kzalloc(sizeof(*addr) + offsetof(struct sockaddr_un, sun=
_path) +
> > >                    UNIX_AUTOBIND_LEN + 1, GFP_KERNEL);
> > >
> > > 2. Use temp buffer and memcpy() for handling.
> > >
> > > 3. Keep the current code as it is.
> > >
> > > Do you have any other suggestions?
> >
> > I'd choose 3. as said in v1 thread.  We can't avoid hard-coding and
> > adjustment like +1 and -1 here.
>
> The option 3 would result in a waste of ten bytes. Why not choose option =
1.
>
> I have a question about the initial use of the hardcoded value 16.
> Why was this value chosen and not another?  sizeof(struct sockaddr)?
>
> Its introduction felt abrupt and made understanding the code challenging =
for me,
> which is why I submitted a patch to address this.

To be clear, we are discussing here about using kmalloc-16 slab
instead of kmalloc-32

I find this a bit distracting to be honest, given the cost of a file +
inode + af_unix socket.

IMO it might be more interesting to document why abstract sockets
names are limited to 5 hex digits...
