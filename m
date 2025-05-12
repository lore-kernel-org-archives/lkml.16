Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAE81E571A
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 15:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747064913; cv=none; b=peRcSOjFY92M+2xWbAmA8y4THP3K+42entRAOGpWdYCBP35zNC/JupfycSSLiyRmkQP52eX1rsOhLXOKY8z3YL+aOh/RbuoBqNcJ4sC25yMwAaqFJIGXdO9U4brBbFNCqYpQdO0oAHomTZ44MgvP2tvq1bLuXtEqmibqWSIC6vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747064913; c=relaxed/simple;
	bh=SyjEARUAq5l03fFQviOMPZHim/VgChrPk6wxcjnwn7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rdVJSyjfYXExGh6YvbXiijJy2QPlONTv9ui6qBVwQtZ8s0X12h6j6NHoid11cVVj00IZuApxbt2sN8adL4kJeLqZoGmMJubpFA+VuixYyjzmWRIuETHZV1P3R5J4p/JEmV8qhyDE4iopccIv4qOYcRYzrw+7NOV0vQlHm7X1WJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fZ5DP6Dv; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fZ5DP6Dv"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22e4db05fe8so41883095ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 08:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747064911; x=1747669711; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TSLg/dz3uU8UltK8rk0rGw2Pm6GsJowpsGqDNULyV2s=;
        b=fZ5DP6DvoijSbS5MrgUsUrteVdtLjwhT+Hwb3+s/fsKm2mX1avlQWZLpC++uolCqSd
         QVx3DPfvp4pU488eikg/l2PKxSC6Jb7zSNg4sMWWmhxyXpD/rh1OL99j2+oQDCOg0vkG
         nnwio5xLL72TIGtA0e329Hi9HSpGanHfEprQgyIkBfvnscOvjpfwKyW5DSffHyWZegeH
         tZIdL3thGmNdx179WEjWEAzF62Pvoxjhy7jkAzdHm9b1iw1PpHtEF/gPzAEp0dY7XRTg
         1f/RDJeHaVZH9h9ZcwOAVQ+RNL5WFDdsnWhKKQZKe+mswlvy8P7mnuHVFxUFPy4d+Ejl
         mh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747064911; x=1747669711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TSLg/dz3uU8UltK8rk0rGw2Pm6GsJowpsGqDNULyV2s=;
        b=TaPVWBrCxfxKgeEqtTpbfdouCgXsDLLhW2LNTmeAMAxyDfwDkqdIeUAYiDf1IsKGgh
         X+gts5vlcqC9obNynP1BJAVVQ7KDJZ/ZEooZNb13UlaGhJoSF3AlJtvPtvruoi+24zIg
         W0YNEJfF3Yr/xNKJ0esIOYZuu7dMb1yI0W7Gje/xCF63zohD7qEFBgdVUoUXQlM1J8iV
         7dtJA0dgfKvjJQUERp+UWR04kIg3l8PoBuwjh7mo4ddrGyjyThyyQYYUO8zTuqsNXQe8
         6QkuEiSTVs147+NxijlIZQ88dgAw6egM9B5usi4rkxmrajEY6kWq0bMzwzCsb/TkC5tg
         vIaw==
X-Forwarded-Encrypted: i=1; AJvYcCVIE4iifxayOa2VJL/HbYIngqhFDgtpIgc6UIXg+b6ITitcio/Z18XSKmDhqoDBcvqqPJec9HTbIYA1T2I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ/tGKlM762IfmI5sIZvP8uaycjzO8yjeLXX2Uvur286ZAfVuP
	g2Gu4xTS2rv2+NNbXRKJ+P7syZMIZoidGuAjKrOUYRGqUeTYEbUJGjWvmRSl4+8Jetvt9+bG7HB
	gxNYK1MRrbhy4SexKh2468b8dRTL09qoJc5Y=
X-Gm-Gg: ASbGncs7KPZKWzPNbufU7KlrIvkvJVXlrTFgivbI8yrnmJ5mLQyccpYdl3pRsNW8EB4
	5ZzmV+p7qxvSj5e01ZssGqWYeweXJKobc/hQuEI9BNHV7yDMYEDrixrc7M1cLqhTzeDay5iASyO
	+hjXgTWY6cItdH0IxHjC7Dw2uBZXtbJpbl0PA=
X-Google-Smtp-Source: AGHT+IHYezllsjrLarexHdpdFaXi9SoRgmYpovyUIXOSC1FsuAwNBEXnorlDn9BdphUD80E5TJ39NlSn0WIC+O0kisI=
X-Received: by 2002:a17:902:c950:b0:22f:c83d:d726 with SMTP id
 d9443c01a7336-22fc8e99ec8mr184202495ad.33.1747064910753; Mon, 12 May 2025
 08:48:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250512144602.15519-1-aha310510@gmail.com> <682209b0.050a0220.f2294.0066.GAE@google.com>
 <20250512150134.GB200944@mit.edu>
In-Reply-To: <20250512150134.GB200944@mit.edu>
From: Jeongjun Park <aha310510@gmail.com>
Date: Tue, 13 May 2025 00:48:19 +0900
X-Gm-Features: AX0GCFuKUncfSqs5-p6WOQRIVbmgwvTo3Ej_W8Z_y9bM0S0UQhWd4lDWan5MZeM
Message-ID: <CAO9qdTFizqGeLakyFBFuLmr3EhDsdMRLeFS6AAEeXbFy2ZcffQ@mail.gmail.com>
Subject: Re: [syzbot] [ext4?] general protection fault in jbd2_journal_dirty_metadata
To: "Theodore Ts'o" <tytso@mit.edu>
Cc: syzbot <syzbot+de24c3fe3c4091051710@syzkaller.appspotmail.com>, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Theodore Ts'o <tytso@mit.edu> wrote:
>
> On Mon, May 12, 2025 at 07:46:08AM -0700, syzbot wrote:
> > > #syz test https://asdf asdf"></a>)('"><;
> >
> > "asdf\"></a>)('\"><;" does not look like a valid git branch or commit.
> >
>
> It looks like this was a reply to Jeongjun Park's request (in
> Message-Id: <20250512141322.15270-1-aha310510@gmail.com>):
>
> #syz test git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
>
> Or at least, his #syz test was sent less than 30 minutes before this
> reply; and syzbot didn't respond to his #syz test; and his #syz test
> request was a plain text e-mail without any text/plain vs text/html
> hijinks (I checked).
>
> Maybe someone in syzbot land can investigate?
>
>                                                 - Ted

Oh I=E2=80=99m truly sorry. While drafting a test patch, I got bored and st=
arted
playing around typing any things into the syzkaller HTML file and patch
file and I accidentally send this email.

I had absolutely no intention of attack LKML or syzbot.

I apologize for any confusion this may have caused.
