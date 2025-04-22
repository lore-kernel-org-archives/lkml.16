Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC99194A73
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 03:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745294317; cv=none; b=LE61ZGGNiby9xYsbFCXhfUZZzKvLeg4hStTm5kVEHowM1oOFgDYB8zoscMElokpXJ9EcMq9Af3InEhBI79LyViRmdKepUyMKjbPpC4Hd+0+uv2XP4+ygum7lrlncJEIUjoQKUkL5TdIxaPy9P23EXhEy/yWu+re5bytfvlJQlTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745294317; c=relaxed/simple;
	bh=yKRA8ZwqTzTG1B2kWoPv4xIY8kTNcN0dGqSKyOKdIvE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EwkDtRVb7EO+FF9pfJSNGlhS2nWdGMoXy/0SJMONiF1dI0qfttDTUTJZ2gZpV1n1c1YZf6MjLp1EX+JlpBa1GJqWSMAvCB8aOgIdDnEw35viMDk65NSWfMOvJCx/Ygzu4Rs3L40Bw8RVzNkTCtHBuNMUjPJfrTyNzZ8idP7JxeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DqU+K7ny; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DqU+K7ny"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4774611d40bso87961cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 20:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745294313; x=1745899113; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=za4w8R1db1P50GHT4MAtmBfToY4zX6t9W05URRKIDM4=;
        b=DqU+K7nyhjRgWjOlMGd124Eo8QC9G0AdECUmRWJODHAYmiqvmuSxlDXAsjDES88eTR
         hLizXaYEgAzvUJ+zLI7XA5CNaSSz8CQB1yxmwnsn4jry+IBZswbES2s+Zb5cRkK+cy1b
         nIX7isyRgTLkkEAnK/f9DbkbAPJ05CKmaMa+e8kKvOnLVtCAkzKSFoG+PDf8CRaw6VJB
         3EHwewLmNwb2hipJ+INYPbg/VUtPPzlZoH/GGfCT4GdgQJ0U2l0BXPRr3DfWM1h7mLAM
         kO/k05gYzXW7tySkXCcnjLDQ+SIqJBkwDCgx1Cx2wxGbRdHe1dLDtsEQW7OhETHoQlo4
         xB0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745294313; x=1745899113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=za4w8R1db1P50GHT4MAtmBfToY4zX6t9W05URRKIDM4=;
        b=KED0XHoawKI/3tT48rLfjEr7adH282UzhpeCfeLIPBIACuRpGG7CZXywFUXSTT7qPS
         DieoPUBPID8UlawZtQZ0Uh3Erba6ArAj2XJkdmwXT+cOrOiPgRdf93ZZuWswvlnpakAQ
         h3SWYj7MJVe4iDAl9U41f5arAaf0EOX3mITymJk92fcpS7iYs6SVTHXfs1x/T0nyRQzu
         61FDgGvtWhAzx+oZz2/iI4ZG5qyiRS+0vNjXgS46bQ7KW+TvVBCEWevnqO9p/HUgthoL
         sMje7StlHBXMLBMjsXub0V7pj+vENv4bCNLzp4Reiq3J3ieHexYIwJmUz3aYYZOQedUt
         SDyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXF7yN00RzYdRRcx/3aoVeJb7jZWW6lJaBTxZ33k637sHIy/d8APG/YXEhWLLw6GJobIr/dCuDQJE0YVAA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPWaKz3EZrheKAvXXpHHyeYe94VJzktudr6B0pJG2x7uWM3rgI
	bQujsS0VeBCJB655pjirbQ7rRZDYXOIDKLX+c8bhqAv/sX+CMqTV3p+XpkT0PsjIW+qr2G4huMA
	cwaEKMpNl7YcX/RHkJMTP8FpvGhIiDGA0mFCW
X-Gm-Gg: ASbGncsdhRC80VvOUxSAquKDDKCmt8Cua+6iew1S0LCJW5cEuf7rcxAu4WhVJ5Tc7OV
	hlCRHKYL1fis0AeoGOjxmV+MwytEDhII6jOAjyT9LP5oYHNYPo7sj4Q+6DA9TLFqdeXKzgCskP2
	pfwBrwk1q5hSxooGo1bhHuzCgnbn3OTVnA1BDcIL6UEj9DeYNdTMI=
X-Google-Smtp-Source: AGHT+IFAQcMpksnOj6/LnVgDGD6JBzpXjxag/1e/85G4VIYTdvOtZFPDNyNK6UlAnIZAd4e91YTRU2x31r5jjnrdFuU=
X-Received: by 2002:a05:622a:198f:b0:476:f1a6:d8e8 with SMTP id
 d75a77b69052e-47aecc701e8mr15481851cf.11.1745294313032; Mon, 21 Apr 2025
 20:58:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231206103702.3873743-1-surenb@google.com> <20231206103702.3873743-3-surenb@google.com>
 <8bcb7e5f-3c05-4d92-98f7-b62afa17e2fb@lucifer.local> <rns3bplwlxhdkueowpehtrej6avjbmh6mauwl33pfvr4qptmlg@swctg52xpyya>
 <CAJuCfpFjx2NB8X8zVSGyrcaOfwMApZRfGfuia3ERBKj0XaPgaw@mail.gmail.com>
In-Reply-To: <CAJuCfpFjx2NB8X8zVSGyrcaOfwMApZRfGfuia3ERBKj0XaPgaw@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 21 Apr 2025 20:58:22 -0700
X-Gm-Features: ATxdqUGzQHMqMLsQ2-GAAF2yokj3Za5US38h-1Y3L1CGlUceuA7t_asl_5wY1T0
Message-ID: <CAJuCfpHpdAn6yNVq1HXqO0qspj6DLb4qa_QufT+Z9RLTTa-N9Q@mail.gmail.com>
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

On Mon, Apr 21, 2025 at 10:16=E2=80=AFAM Suren Baghdasaryan <surenb@google.=
com> wrote:
>
> On Sat, Apr 19, 2025 at 12:26=E2=80=AFPM Alejandro Colomar <alx@kernel.or=
g> wrote:
> >
> > Hi Lorenzo, Suren, Andrea,
> >
> > On Sat, Apr 19, 2025 at 07:57:36PM +0100, Lorenzo Stoakes wrote:
> > > +cc Alejandro
> >
> > Thanks!
> >
> > > On Wed, Dec 06, 2023 at 02:36:56AM -0800, Suren Baghdasaryan wrote:
> > > > From: Andrea Arcangeli <aarcange@redhat.com>
> > > >
> > > > Implement the uABI of UFFDIO_MOVE ioctl.
> >
> > [...]
> >
> > > >
> > > > [1] https://lore.kernel.org/all/1425575884-2574-1-git-send-email-aa=
rcange@redhat.com/
> > > > [2] https://lore.kernel.org/linux-mm/CA+EESO4uO84SSnBhArH4HvLNhaUQ5=
nZKNKXqxRCyjniNVjp0Aw@mail.gmail.com/
> > > >
> > > > Update for the ioctl_userfaultfd(2)  manpage:
> > >
> > > Sorry to resurrect an old thread but... I don't think this update was=
 ever
> > > propagated anywhere?
> > >
> > > If you did send separately to man-pages list or whatnot maybe worth n=
udging
> > > again?
> > >
> > > I don't see anything at [0].
>
> Thanks for bringing it up! This must have slipped from my attention.
>
> > >
> > > [0]: https://man7.org/linux/man-pages/man2/ioctl_userfaultfd.2.html
> > >
> > > Thanks!
> > >
> > > >
> > > >    UFFDIO_MOVE
> > > >        (Since Linux xxx)  Move a continuous memory chunk into the
> >
> > Nope, it seems this was never sent to linux-man@.
> > <https://lore.kernel.org/linux-man/?q=3DUFFDIO_MOVE>:
>
> Sorry for missing that part.
>
> >
> >         [No results found]
> >
> > Please re-send including linux-man@ in CC, as specified in
> > <https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/tree/CONTR=
IBUTING>
>
> Thanks for the reference. Will post the documentation update later today.

Was planning to post today but I'm a bit rusty with the syntax. Will
try to send it out tomorrow after verifying the results.

> Thanks,
> Suren.
>
> >
> >
> > Have a lovely night!
> > Alex
> >
> > --
> > <https://www.alejandro-colomar.es/>
