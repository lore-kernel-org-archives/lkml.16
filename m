Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2AB4A06
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 15:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747754089; cv=none; b=ljaJVYulVgIm5P9hSpu1Yga1+QHj7Jxa6FyWAiM9WYtr/l/VMitDJknNYt3oiKni8p4cCQpiNC6hBW4ah6O/lZaos23unW8rCnedSmjvx0AKgekcI65Ovoe/u9yPRug0Gt3m1aP81dtlj753rIpkhiT5TzUCVlhy69zSXnn0/Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747754089; c=relaxed/simple;
	bh=ooCehnBkTa1RFyfkUYai5NV0wxtK9/ROqQRNoy35jZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XAd+c6OhG42U24OzB4gd0a1LGlLP7gAB3QLJYSPGvyQo8X8JDv44rkKAacC94XnLKX3VnAQD0WWbT+oDVYySN/hbaTqd805YjfIzSzfNvxMdOzKKkt6AlWOjj1ltXKD4cqYZFppsDuwMU3g5+ytvSoYSOYI2awM2sPB365B7Xvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Sbzn4h2F; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Sbzn4h2F"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4774611d40bso856991cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 08:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747754087; x=1748358887; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iSrpfL8xaFpRULZ/wjVaUfdkfzWgu438uQCRPW9kiS8=;
        b=Sbzn4h2Faz2FzXR+pEulo7J0J9d9TIb3T+7AChWuwI63Hu56hMeLZQU2YKDqSomNys
         hxx3/IULHHiSZpy0vjB02AjNWEIFWJrwTsUeUR6We+CD2TnjIJv0G8IyA8iP7TPgnImA
         OJY9T48NtuLx/vR4YfrR0Z0qC0egOat+7nQ44BzywdjWEHeFfx5umV6U5boefxEPFGnO
         WZTvWJwbl7h4oLE13zBZucMtvTz1QgmK1dmUdpId8ULY5IfE7vYeQf43tz+/RHxI/JKM
         pgP9mS3iz/qrdzBxf1BXQihRNblQQKakP4JqCGusVONKfLuOq5LVmCSEHIql8WfVLn0W
         h6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747754087; x=1748358887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iSrpfL8xaFpRULZ/wjVaUfdkfzWgu438uQCRPW9kiS8=;
        b=erN3Rw1+KuY7JHJ4ZvbkjFUu50tPBwTBFe2hUJ9nMNs/bOH094wtI+MDLsZVPPCSoi
         Ji4peevAOVDaiE6K2FHWJ6LZ4CHoyRCLVnwE9CvxRd+lfl2XXU+uJhaY+7BRQYjDLYgO
         cfmeYIpwpupqPI44Ami+TNDPopOTHtk5MsDFJt4AnJsoC1L9DoWTfD1srfwtRgCv+hIV
         AoLg5nGSEYMSID3olAjRiMPv/tjkWeaIVH6TTDv4Aec8NbCzk5NbCleBLwuE+66EkJvp
         0YfGa+jRCubErl1j3YYButjTXKs4opQ5aP9cpFgFfwV6uy3WJueVjtYAqDmO8WcQVrc3
         8c8w==
X-Forwarded-Encrypted: i=1; AJvYcCWnKJuipuqklTXvJEi7x4OgMNq2YTU36mjRAe/ABQNofOlKPiqWalhqzfEpXb8Bj179AH+ha0N0q6FQE/E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw4IsKCP2xmYL+04SP4enw4xeRbMbD7eNb23/2g+plcdvzuVUP
	e/P4PN8yvhJvFK65otGKJ7dtBiR56SjDe+ltzFCA18h7gNJyaU9ib3VDqUb/99VBZNATzqquoWo
	8IvOYXfyQjIc5rWbPDYeBxVN74v395n80bK5dCHDB
X-Gm-Gg: ASbGncsqYZjJpzBlG3VBvoqOsUwQpKuMusENkVUTiogeRWm4ftkcC97An07bdLJ2/Vz
	mTu2c+wBxHx+twmFOnp9Mxho9NDqbGLWwr+Qq4dGfrScubI7gQUzzRERRVDUet7Xsot7EFi3QkW
	KVd5li6pQ1ypFFqQrEQFDTVX7SNQMc8UnyACeBZRvYWaLC1yrwXvk2yqnoH0ZibtpHT/5JGlPx
X-Google-Smtp-Source: AGHT+IHqxMAqm9ksZ9pdmifguaGcuAgwy595ArLVy7NQeSIbtyAJtcB0AxKMULhl/n7xN7BfZzI9P4AZwv9k2z3819E=
X-Received: by 2002:ac8:5a8e:0:b0:494:9777:4bd with SMTP id
 d75a77b69052e-495ff6d39d7mr10177501cf.3.1747754086275; Tue, 20 May 2025
 08:14:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520122547.1317050-1-usamaarif642@gmail.com>
 <20250520122547.1317050-2-usamaarif642@gmail.com> <aCyEyxHEXQ7DU9I1@harry>
 <cf17cfde-cd1a-4217-a09a-1aa86347f830@gmail.com> <h7mwe4tr4r233zewdqaoehmmoktaljslgcxvr2qybon2vnxhrz@pbwpt253olkd>
In-Reply-To: <h7mwe4tr4r233zewdqaoehmmoktaljslgcxvr2qybon2vnxhrz@pbwpt253olkd>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 20 May 2025 08:14:35 -0700
X-Gm-Features: AX0GCFuD9buhC-dU4FNw-ogmprw-VWLbagGLuSevZ4KRV2INpyupQsgxAdo-Jk8
Message-ID: <CAJuCfpF4dar7p+wMucP8uWn23U5kzDCdSw48nZX=a=ei9ZSZOQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm: slub: only warn once when allocating slab obj
 extensions fails
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Usama Arif <usamaarif642@gmail.com>, Harry Yoo <harry.yoo@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, hannes@cmpxchg.org, vlad.wing@gmail.com, 
	linux-mm@kvack.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com, vbabka@suse.cz, cl@gentwo.org, rientjes@google.com, 
	roman.gushchin@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 7:18=E2=80=AFAM Shakeel Butt <shakeel.butt@linux.de=
v> wrote:
>
> On Tue, May 20, 2025 at 02:42:09PM +0100, Usama Arif wrote:
> >
> >
> > On 20/05/2025 14:34, Harry Yoo wrote:
> > > On Tue, May 20, 2025 at 01:25:47PM +0100, Usama Arif wrote:
> > >> In memory bound systems, a large number of warnings for failing this
> > >> allocation repeatedly may mask any real issues in the system
> > >> during memory pressure being reported in dmesg. Change this to
> > >> WARN_ONCE.
> > >>
> > >> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
> > >> Reported-by: Vlad Poenaru <vlad.wing@gmail.com>
> > >> Closes: https://lore.kernel.org/all/17fab2d6-5a74-4573-bcc3-b7595150=
8f0a@gmail.com/
> > >> ---
> > >
> > > Hi,
> > >
> > > Please Cc SLAB ALLOCATOR folks in MAINTAINERS on patches that touch
> > > slab code ;)
> > >
> >
> > Thanks for adding them to CC! I was just thinking of this as a memory
> > allocation profiling issue and added the maintainers for it,
> > but should have added slab maintainers as well.
> >
> >
> > >>  mm/slub.c | 2 +-
> > >>  1 file changed, 1 insertion(+), 1 deletion(-)
> > >>
> > >> diff --git a/mm/slub.c b/mm/slub.c
> > >> index bf43c403ead2..97cb3d9e8d00 100644
> > >> --- a/mm/slub.c
> > >> +++ b/mm/slub.c
> > >> @@ -2102,7 +2102,7 @@ prepare_slab_obj_exts_hook(struct kmem_cache *=
s, gfp_t flags, void *p)
> > >>
> > >>    slab =3D virt_to_slab(p);
> > >>    if (!slab_obj_exts(slab) &&
> > >> -      WARN(alloc_slab_obj_exts(slab, s, flags, false),
> > >> +      WARN_ONCE(alloc_slab_obj_exts(slab, s, flags, false),
> > >>             "%s, %s: Failed to create slab extension vector!\n",
> > >>             __func__, s->name))
> > >
> > > I think this should be pr_warn_once()?
> > > I'm not sure why this was WARN() in the first place.
> > >
> >
> > Isn't WARN_ONCE the same as pr_warn_once but with needing the condition
> > of the first arg to be true? We only want to warn if alloc_slab_obj_ext=
s
> > returns non-zero. So WARN_ONCE should be ok?
> >
>
> The difference is the impact on panic_on_warn users which are mostly
> testing bots.

Another difference is that pr_warn() does not spit out the call stack.

> This warning is not actionable, so I agree with Harry to
> covert this to pr_warn_once().

Makes sense.


>
> > > The coding style guide explicitly states that:
> > >> Do not WARN lightly
> > >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >>
> > >> WARN*() is intended for unexpected, this-should-never-happen situati=
ons.
> > >> WARN*() macros are not to be used for anything that is expected to h=
appen
> > >> during normal operation. These are not pre- or post-condition assert=
s,
> > >> for example. Again: WARN*() must not be used for a condition that is
> > >> expected to trigger easily, for example, by user space actions.
> > >> pr_warn_once() is a possible alternative, if you need to notify the =
user
> > >> of a problem.
> > >
> > > And failing to allocate the extension vector can happen during normal
> > > operations.
> > >
> > > panic_on_warn users will be unhappy if they notice their kernel panic=
ked
> > > just because their kernel failed to allocate slab extension vectors, =
which is
> > > a totally normal situtation.
> > >
> > >>            return NULL;
> > >> --
> > >> 2.47.1
> > >>
> > >>
> > >
> >
