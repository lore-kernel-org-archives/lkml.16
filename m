Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED01C2F3E
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 17:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745255802; cv=none; b=GuczcWpMqd2Y1/MyuUJsMFXsjvx04dkouShY9jdLc59Jc6Zr+nl1bzQXhRIGD03JF73AXohZ1lXn0gMkuf895gkYfaDxaniSA0E62pra/7WxXg+uIk8I8zxOaHvLlQ4jG+/UfACllnrR1VF73e4mXPrD7B6RcM1yHZd+JFKONMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745255802; c=relaxed/simple;
	bh=ZFCSLHiDysg927Y/Nr3V/lVaKcJ7uAxp7qwb1bHSUZA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nRmmHnJftOcQ2YzT6+t7dI//VNesmcd/L3JBAIiMLzq4650lpi76H2VwGtwQDJwUTDVd+vl0u9vDOWFPuLX1m5NvTsix237QI6T9OLNHD2xeMIbozZWSZIXboKa3/wolgYqGTFlUVeYFuh0PTq9Jhsw3VfS/GA3CmWbglXEQ7Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=25UioA/J; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="25UioA/J"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4769e30af66so1294311cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 10:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745255798; x=1745860598; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RuURjUDWNXAz9lMXw8+fH47R9FvQohgPWajg37i/laE=;
        b=25UioA/JF//XcrrCf2YEFIbTMNAOw2KZwYl2luCH5vkxjKxcHR5Jm/9gdcE4nI1p68
         0+E3WoCZf7BH8kbW+AaFM2kdfiF6+vlxDVi69voKguVa4TVs9CVLcjadXmZSx2MvaHt5
         weLVhD9tV7SQ7LHKthoscEIAZC4a/6iR54PHmiMaexmhRJXOki5FgjcIsVamA65czAbT
         J/yV/Xpj4m2CckscQU2ExVE4OPfC7jH+oMGEPDRDY7Ov0p/QMVtHC1bLvFwCIuLbcrya
         2V71Sy3P5bBgUKTpZeCIV8FdfYAkZX64BHhUH9gaGkWXUqvHqV9GXywArBtOU68YWCno
         whgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745255798; x=1745860598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RuURjUDWNXAz9lMXw8+fH47R9FvQohgPWajg37i/laE=;
        b=CsVoU95p8U/IVKb0WU55ral0rGUN7B4tY3KOj7sXmT76TeTbFfnXb2Cw90wZRPUvqa
         SYHtkC2qeMHowsIsvrii5aZAVIpuzPmUvE9oN4kGrptl7OvksBUjlEm9iv1W+nSiiove
         0jKW0zFGdwZ3yR8SpaZBMIjpNqB0CvExpiy0GvO3ac+4u/6M2c5Um78VNrbJWAFephFo
         pcdcvpgJovkPb+ryf8n000z675+9rXtzYbxDBhMlmYRwp50SGS0WpAtm94ld3wSNUZyT
         eNwRutGg5VbWgaB3rYJn4pv6G4UOsi3PPTHmOIuOnHFVo5pxZ/pgARVy951jkUFYPLVd
         t4Xg==
X-Forwarded-Encrypted: i=1; AJvYcCVhu0w6mGYTlfLjDDDWn2gtMK4TlrPpXZEmCRWVHoiYmCTc9cSqZByQPBcVcr7svnJqmDKX74XecJ+xVOs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7o988PnTZBv0XCVczJ9HQQMrmxtVZKShoEaIQ0VwoxTncOcLI
	GRnCTCjIB0KEH6U6jxqSm5440iyLeWTjeS6bFTLk2w3S1C/Y1HvCjRItaJxeOvTTuvZ+JEfkOAQ
	nQ63S+gGkvbxJla28EsTrBEgabNy2wDXKhOOe
X-Gm-Gg: ASbGnctylONkD5LfFFcolix+gCebHAMU8qYTSc7uKwdvuqO9Ek4weFAcrTG/7EJIhuV
	KGI7MiAlxBiPO5ox5Llf7Yag+Rw+poTgdvARu9F86iVnjOKrwZRc0XrVWCRaqBPzEK1x5/nQ4W3
	MKwKyfI/136sCJxKkEWHzy
X-Google-Smtp-Source: AGHT+IEe07pf382BuG5t+h0cxkhNonB9S2hb+4NBUwiHHOIgvisi/X1Rvk0m70CnMe3Yxh9IFdbEwfSfBL+DkDE8WEU=
X-Received: by 2002:ac8:5901:0:b0:467:84a1:df08 with SMTP id
 d75a77b69052e-47aecc928f3mr9502881cf.23.1745255797522; Mon, 21 Apr 2025
 10:16:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231206103702.3873743-1-surenb@google.com> <20231206103702.3873743-3-surenb@google.com>
 <8bcb7e5f-3c05-4d92-98f7-b62afa17e2fb@lucifer.local> <rns3bplwlxhdkueowpehtrej6avjbmh6mauwl33pfvr4qptmlg@swctg52xpyya>
In-Reply-To: <rns3bplwlxhdkueowpehtrej6avjbmh6mauwl33pfvr4qptmlg@swctg52xpyya>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 21 Apr 2025 10:16:26 -0700
X-Gm-Features: ATxdqUH-V1xozHecneL38ihhUBup30dXmnQSZc7psqoLu7St8-YIj64ka4pAWwg
Message-ID: <CAJuCfpFjx2NB8X8zVSGyrcaOfwMApZRfGfuia3ERBKj0XaPgaw@mail.gmail.com>
Subject: Re: [PATCH v6 2/5] userfaultfd: UFFDIO_MOVE uABI
To: Alejandro Colomar <alx@kernel.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, aarcange@redhat.com, 
	linux-man@vger.kernel.org, akpm@linux-foundation.org, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, shuah@kernel.org, lokeshgidra@google.com, 
	peterx@redhat.com, david@redhat.com, ryan.roberts@arm.com, hughd@google.com, 
	mhocko@suse.com, axelrasmussen@google.com, rppt@kernel.org, 
	willy@infradead.org, Liam.Howlett@oracle.com, jannh@google.com, 
	zhangpeng362@huawei.com, bgeffon@google.com, kaleshsingh@google.com, 
	ngeoffray@google.com, jdduke@google.com, linux-mm@kvack.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 19, 2025 at 12:26=E2=80=AFPM Alejandro Colomar <alx@kernel.org>=
 wrote:
>
> Hi Lorenzo, Suren, Andrea,
>
> On Sat, Apr 19, 2025 at 07:57:36PM +0100, Lorenzo Stoakes wrote:
> > +cc Alejandro
>
> Thanks!
>
> > On Wed, Dec 06, 2023 at 02:36:56AM -0800, Suren Baghdasaryan wrote:
> > > From: Andrea Arcangeli <aarcange@redhat.com>
> > >
> > > Implement the uABI of UFFDIO_MOVE ioctl.
>
> [...]
>
> > >
> > > [1] https://lore.kernel.org/all/1425575884-2574-1-git-send-email-aarc=
ange@redhat.com/
> > > [2] https://lore.kernel.org/linux-mm/CA+EESO4uO84SSnBhArH4HvLNhaUQ5nZ=
KNKXqxRCyjniNVjp0Aw@mail.gmail.com/
> > >
> > > Update for the ioctl_userfaultfd(2)  manpage:
> >
> > Sorry to resurrect an old thread but... I don't think this update was e=
ver
> > propagated anywhere?
> >
> > If you did send separately to man-pages list or whatnot maybe worth nud=
ging
> > again?
> >
> > I don't see anything at [0].

Thanks for bringing it up! This must have slipped from my attention.

> >
> > [0]: https://man7.org/linux/man-pages/man2/ioctl_userfaultfd.2.html
> >
> > Thanks!
> >
> > >
> > >    UFFDIO_MOVE
> > >        (Since Linux xxx)  Move a continuous memory chunk into the
>
> Nope, it seems this was never sent to linux-man@.
> <https://lore.kernel.org/linux-man/?q=3DUFFDIO_MOVE>:

Sorry for missing that part.

>
>         [No results found]
>
> Please re-send including linux-man@ in CC, as specified in
> <https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/tree/CONTRIB=
UTING>

Thanks for the reference. Will post the documentation update later today.
Thanks,
Suren.

>
>
> Have a lovely night!
> Alex
>
> --
> <https://www.alejandro-colomar.es/>
