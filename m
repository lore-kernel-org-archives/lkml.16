Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15172163BD
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 22:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746741651; cv=none; b=OaXhWfi2A1DCNmuAsYLbAMrOWYGBWspbTKdmJQJN3FKY5McMsMq/ewAA07x+LX+8iFCIWIqUcJXujzZDf6diokxHFViyH1Z2mMU03Vh1pYmyWDCYSI2VGO0VTu/BSOw3ggSZaeCOsESCideEPnhLhqhUXCdXtvd6xJn8jwy5s8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746741651; c=relaxed/simple;
	bh=I6d9moSr2AVZV5fVbMSURCEdAB7CHFpLGc0cbhWxpU4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aevwwBT78pHnszA5oXmPu/FOpsPIfN1XS0B0SEfcufUmt9ZBV4llTWmDJrJK74SPHUPwtBBy85CKCWSHuv7vp2iXfjY+E+dAp0YqM8iXtcK8Ja2rWBigFiQjd4qW/EzH9qQliZSnL9OeK51xUWC/wgHgzJuuoGBEKRxdKlFXAFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hDMGdfoT; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hDMGdfoT"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5f438523d6fso1389a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 15:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746741648; x=1747346448; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6d9moSr2AVZV5fVbMSURCEdAB7CHFpLGc0cbhWxpU4=;
        b=hDMGdfoTvFdTqBL8WfCv34f+PngDJCZTFwGLxKeXwDhJPNELwNmIs3gKUzbNzIYgDN
         4NIfcjruT3u7SsvSERVS/fdqK0V/St1OaPks83WO2syKmfaiADdJjATRtbQ0yPEOSC5P
         lajAbJIUNDb1M18CwIbvt0s9rDGnM95EG+ZQwtVlVDS6EGJZqMcHOyq07jQgGSj4Besy
         mQwagIyOIxWs6Glon0I1qixKf1elTEU5jU0DB17e2khNdkdhwTA2D0dt+ZDGl5inHVqs
         OnHGiU8u5gIZeuP3tLHSDfuL0E2Opf4a7z8hiigxNwV7kfAOtEkGQwEoBaHXStURyOVh
         rMnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746741648; x=1747346448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I6d9moSr2AVZV5fVbMSURCEdAB7CHFpLGc0cbhWxpU4=;
        b=OB4HC0hnO2jHDUTrEApXWLlyofnAQnT0b8oc+kVRBh7UEusGDKtDuyItB7xMtrrzWN
         Fz3P67lP3uf6vs385E68xKxEpDpIJUCMmE1wEy9u+YAYXp+nkBGMWSwNAzFdrPdPrjZ3
         T8/sjoEKi0M11aK8uV4LOAM6mb3XHlIeywjpa/LWyr5RiXxANl1WOGScj4TW5NhmaNVy
         TqoZVvmE+0095Xs+P8csbmWxaUSii2jUhODLw0I9ljLE5svi2UCeFhi7nfkQHNGRe9ED
         p0fAw5XEkcXjoSwHrTq87PfSrfu0z9UE3Il5fK6N+Ckr5YonzgpTDxmcCR+cRhTfb25b
         tSbg==
X-Forwarded-Encrypted: i=1; AJvYcCWott/K2/R2ZeuKRM5DA6bY8MYK1EVQenSmM/B5Ry5EjknB3lkcyMlSYhkrwUGZrIZjUox0xFyKWo0VoSM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUzjap9fHRUpQPBlqUE0FWeOXyPpxJIf0sK4VpnmX7wIlnO7/r
	mMmC2OaGQPGhWPVskYAwxrMTVBlEYkXUBmygwcQqnLiU15U7J2tmUnZ47nlwp7ZaOLcw4+Gu4bC
	f8hqpMSYpidcO6KzqpgqJroInB+UBsVLfcv19
X-Gm-Gg: ASbGncusO3e4FvCOEnu3bCOqs3P1ZmywVeBQ2axDOvSlbmUGV9DQNO90PQD7Tw9l1uz
	x4h3byiW540UeIfNF49S5k0pVyn/Es4/He55ocGBTyoVWWRF869dMRxegG9vYi2y6mkgNsSD7oO
	MV5o66vtozK4E4JOiEZfb0OnIUuXoPuiNESlmnxJod+K4VepFFtx4=
X-Google-Smtp-Source: AGHT+IEgqsrWQUA9rdeo3kuLeufSbMfNQwE/56BObevaH3Yn2x2Uznm7M/g+3rok3OqVMrMP3b5YzchOsh92luUxKMw=
X-Received: by 2002:a05:6402:128a:b0:5fb:89b1:717f with SMTP id
 4fb4d7f45d1cf-5fca18fcc39mr32041a12.0.1746741647706; Thu, 08 May 2025
 15:00:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508090735.39756-1-21cnbao@gmail.com> <aBzMf6H9Lad6CaFQ@x1.local>
 <CA+EESO7J189B=rrM93NLo_22XirEkp16ttd+Ys2ShqNxKvZcbA@mail.gmail.com> <CAGsJ_4y=9_NYkQDPVp5dcsr70EE=fBOmwpoRM623uwB-+7Q1Ug@mail.gmail.com>
In-Reply-To: <CAGsJ_4y=9_NYkQDPVp5dcsr70EE=fBOmwpoRM623uwB-+7Q1Ug@mail.gmail.com>
From: Lokesh Gidra <lokeshgidra@google.com>
Date: Thu, 8 May 2025 15:00:36 -0700
X-Gm-Features: ATxdqUGEAHdTjxmi3Y7ZoVNdjW68Vcol4AF7ledDZS6qmSnUbnYiR7JvZuwMaUY
Message-ID: <CA+EESO7E9r08KaMXNT+kdyCkpxLftSu4KFL09urLuu3Syw9=4A@mail.gmail.com>
Subject: Re: [PATCH RFC] mm: userfaultfd: correct dirty flags set for both
 present and swap pte
To: Barry Song <21cnbao@gmail.com>
Cc: Peter Xu <peterx@redhat.com>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>, 
	David Hildenbrand <david@redhat.com>, Suren Baghdasaryan <surenb@google.com>, 
	Kalesh Singh <kaleshsingh@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 2:36=E2=80=AFPM Barry Song <21cnbao@gmail.com> wrote=
:
>
> On Fri, May 9, 2025 at 3:27=E2=80=AFAM Lokesh Gidra <lokeshgidra@google.c=
om> wrote:
> >
> > Thanks Barry for fixing this.
> >
> > On Thu, May 8, 2025 at 8:24=E2=80=AFAM Peter Xu <peterx@redhat.com> wro=
te:
> > >
> > > On Thu, May 08, 2025 at 09:07:35PM +1200, Barry Song wrote:
> > > > From: Barry Song <v-songbaohua@oppo.com>
> > > >
> > > > As David pointed out, what truly matters for mremap and userfaultfd
> > > > move operations is the soft dirty bit. The current comment and
> > > > implementation=E2=80=94which always sets the dirty bit for present =
PTEs
> > > > and fails to set the soft dirty bit for swap PTEs=E2=80=94are incor=
rect.
> >
> > Can you please briefly describe the consequences of not setting the
> > soft-dirty bit? I'm wondering if it needs to be backported as a fix?
>
> As I understand it, this could break features like Checkpoint-Restore
> in Userspace (CRIU), which relies on tracking memory changes to create
> incremental dumps. While Android may not currently have a real-world
> use case for this, it would still be beneficial to backport the fix in
> a general way.
>
Makes sense. Thanks for clarifying.
> >
> > > > This patch updates the behavior to correctly set the soft dirty bit
> > > > for both present and swap PTEs in accordance with mremap.
> > > >
> > > > Reported-by: David Hildenbrand <david@redhat.com>
> > > > Closes: https://lore.kernel.org/linux-mm/02f14ee1-923f-47e3-a994-49=
50afb9afcc@redhat.com/
> > > > Cc: Peter Xu <peterx@redhat.com>
> > > > Cc: Suren Baghdasaryan <surenb@google.com>
> > > > Cc: Lokesh Gidra <lokeshgidra@google.com>
> > > > Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> > >
> > > Acked-by: Peter Xu <peterx@redhat.com>
> > >
> > > --
> > > Peter Xu
>
> Thanks
> Barry
