Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EB7220F23
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 21:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746740185; cv=none; b=HBkn5EPznjhulSgitIXNaXv6xSZTcV/MwsynrtiyIPT8qj/CfjS4k6pjkxdaXudgkfRloqLLGitFd6d3aOK0fKeG/AxjipPRbLIZxAuAB5AWSi+ALpJEdZDMeMI9rtj23XVlFW6K4s6mdemLpTVjcgLaVjGqF8JMHhudaeXrw/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746740185; c=relaxed/simple;
	bh=26zDKqAMHLoU5RTA1Sv8YHd3YspOEzIEa2pXaGqWlKY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WT1uAQSkE1VjHM1xkqNTJzMMrotN126nW3uIWYhX8iF39ndLI55z4KoWXQzIb814UXkxFEojS3AouTEP7Al6KzSlgIJmUSMTJ5fmGfpOk1K5tilkWs0iBBmkjh21bud4EIpALQriH4hcf7fF85vBCjgS14v8yg813NiEk6Del6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PE0ee5S6; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PE0ee5S6"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4c4e1f16833so448561137.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 14:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746740182; x=1747344982; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=26zDKqAMHLoU5RTA1Sv8YHd3YspOEzIEa2pXaGqWlKY=;
        b=PE0ee5S6OjqGakIJ9izusF7KW/+J3CpVauAQsq4cer4IpdyI4YPafRdybk2qiah09h
         kbhm7ZtrmHpOscJKvMWyrV+kDtkNJOWiAYja4b80/mHndQ2bduKUUHM+Usw4xf7TrB6L
         8SaTYcpad8pVvHkiAcmu+3ngSEAgnxq2Pb54g0LSom9RvDYzGB3omUU0c2yyoJrn1AjC
         1dYqjqrDzkXBkLtricbksJrsV8Uvkwb6b013o1ulGNZ044kzyjwDhtXIIvV7e6V5EFUS
         PgDSugKX2a0QGx53YbD0n8Qj9l3KSLm6Yqeiyt4BGLGKRIYvGfnAIctymtorCPo4PRUK
         CWZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746740182; x=1747344982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=26zDKqAMHLoU5RTA1Sv8YHd3YspOEzIEa2pXaGqWlKY=;
        b=V3fT2+VdBFudHrSmD9OGbu5VyhnhdOGrwwO74iAgZz9oICSN6GOvF8tsScTtfA8yJu
         dLLTONhVvPWJY05h0Jvqplajkwrv615iGhIj7tA0pHshyjw61yAtY8q2wbDsANPFmUCG
         UOA2Hn3FrmznfzBon/2pOpGNaSCf/RxgmGTQYNbAKMpBu4yG/1LiwqUIsgmzJByNxqQI
         KxGjV7+t/qh6bioBWlMx1F4kuZQRC992FCwNt9up8hdOMlUPL3Dcy6JtvyiezotsYk+I
         gnYYMQ7q3xircIy70Mb4IfBp4NB4rxUjmqfKatvCoVjtBVBxDW5G4oSFE0zWXMmGC2l6
         K/Xg==
X-Forwarded-Encrypted: i=1; AJvYcCWVqquvMnfWhK+o0mhrC3OPm+YFP9AYzd9yfAU4pkb6N85W7Y1VB4AdLwZ/A6LAr/n8ZJLjv6po6RMtubQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFJ+9dgmy9URgJoPn9SgN0dF/3UB8xaMOpbYwQveRm0eKnpcYt
	1+tIDG9EzmIB0bDKlEHslF5TNgCyNFoOhZOyqMzLXQZLrLSAzMpPxrJMBJrek1D2M+THDCFIRul
	V5b6ayXKMvCKWz1/0J7MVjxdEdUc=
X-Gm-Gg: ASbGncs3pKLRzzhlWO3onGWOZTric9TqZ9L/d+m08d3OkuISWfXkOEk3iRBpPcEJwWs
	nxEqP6e78KG4KHBvH/M8AB7y7BoL95SnvoNImgsuaDpjQqu7y6vkAopu6riizD7fRJamSZS1FyW
	6M2PdTr/TZfLxmkFaWpAfxtg==
X-Google-Smtp-Source: AGHT+IEy7LHeE27vl9WIdNN8TAFalU6lGLqSRL81CvZXvba5jmHKr8MbVut43YTi0kfBOO5ncTZ9H7TM8nIp4vtA4KY=
X-Received: by 2002:a05:6102:4a8c:b0:4db:154f:aa02 with SMTP id
 ada2fe7eead31-4deed30ce38mr1415177137.1.1746740182375; Thu, 08 May 2025
 14:36:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508090735.39756-1-21cnbao@gmail.com> <aBzMf6H9Lad6CaFQ@x1.local>
 <CA+EESO7J189B=rrM93NLo_22XirEkp16ttd+Ys2ShqNxKvZcbA@mail.gmail.com>
In-Reply-To: <CA+EESO7J189B=rrM93NLo_22XirEkp16ttd+Ys2ShqNxKvZcbA@mail.gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 9 May 2025 09:36:11 +1200
X-Gm-Features: AX0GCFs7i0Fgmspd5yZQhwdm-Rw-CeN8l-Y8J88CN_rblOo8bSiZ0fXu9LaRc5k
Message-ID: <CAGsJ_4y=9_NYkQDPVp5dcsr70EE=fBOmwpoRM623uwB-+7Q1Ug@mail.gmail.com>
Subject: Re: [PATCH RFC] mm: userfaultfd: correct dirty flags set for both
 present and swap pte
To: Lokesh Gidra <lokeshgidra@google.com>
Cc: Peter Xu <peterx@redhat.com>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>, 
	David Hildenbrand <david@redhat.com>, Suren Baghdasaryan <surenb@google.com>, 
	Kalesh Singh <kaleshsingh@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 3:27=E2=80=AFAM Lokesh Gidra <lokeshgidra@google.com=
> wrote:
>
> Thanks Barry for fixing this.
>
> On Thu, May 8, 2025 at 8:24=E2=80=AFAM Peter Xu <peterx@redhat.com> wrote=
:
> >
> > On Thu, May 08, 2025 at 09:07:35PM +1200, Barry Song wrote:
> > > From: Barry Song <v-songbaohua@oppo.com>
> > >
> > > As David pointed out, what truly matters for mremap and userfaultfd
> > > move operations is the soft dirty bit. The current comment and
> > > implementation=E2=80=94which always sets the dirty bit for present PT=
Es
> > > and fails to set the soft dirty bit for swap PTEs=E2=80=94are incorre=
ct.
>
> Can you please briefly describe the consequences of not setting the
> soft-dirty bit? I'm wondering if it needs to be backported as a fix?

As I understand it, this could break features like Checkpoint-Restore
in Userspace (CRIU), which relies on tracking memory changes to create
incremental dumps. While Android may not currently have a real-world
use case for this, it would still be beneficial to backport the fix in
a general way.

>
> > > This patch updates the behavior to correctly set the soft dirty bit
> > > for both present and swap PTEs in accordance with mremap.
> > >
> > > Reported-by: David Hildenbrand <david@redhat.com>
> > > Closes: https://lore.kernel.org/linux-mm/02f14ee1-923f-47e3-a994-4950=
afb9afcc@redhat.com/
> > > Cc: Peter Xu <peterx@redhat.com>
> > > Cc: Suren Baghdasaryan <surenb@google.com>
> > > Cc: Lokesh Gidra <lokeshgidra@google.com>
> > > Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> >
> > Acked-by: Peter Xu <peterx@redhat.com>
> >
> > --
> > Peter Xu

Thanks
Barry
