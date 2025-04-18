Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE46276032
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 13:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744981208; cv=none; b=KW0LOFCprY8EQ01/OVSDTJQCji6XzPJiSDthSk1oQ0gt7lAYL0E+N7H2osvIaP1z9vQs2rANocA4EAzDz2u3jIrrmaeZ8HNhljBvgAuffeSoN1CTh3JR1idGbZclHWMYBjSAbA1zctQiMlkoKUvosQOEswO6kxZVKYCgXZ90cxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744981208; c=relaxed/simple;
	bh=y67QBwOdrRwlxW9MbXSoDjLMBwT9BYwqj6nFoXGWGJs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sKh6dD7Fa8SdkG1wJaqeHpoBBt6mFw15+P+FQIvgGkdZSclaSJwJS8pC6hAD5n6QuHqMsfz8y25fhY4r0Z7gWpaBaRqcQ7aKlZf9OBj0UD6E2slSKSAEYMoUYHBrY7X7XNUYQrqxBW84S9p45WeoMBJkdNAIGOMru0eQkrhAkmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kn1g2eN8; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kn1g2eN8"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2240b4de10eso3845905ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 06:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744981206; x=1745586006; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l8JNtE4WoAq9/1lxNRUODtbBYrROtMNzFv6IeY4kWjg=;
        b=Kn1g2eN8olY6hsY1lDzWMkPnERtgHOeY+Vy56hI+i7o7psZs19KqmqjDFXPtLO5JCZ
         /R0Aoy3AL9NeivQ2i8R1Gh+sW3OPvFKlJpNB6AF1z9l7x8kY1vCSWbnmVl+BCY3wlcUf
         eXjh5J7Al4dejIzsjGL3EKfqJ2CTOjNzhsKr1iwOXI3StT8QYdwOMUPNx4ufRnAXj2Wz
         6ptk0aN8IF7n1WBqmVD7A/NeDC/I+mXcovTRYb0rl2k6b/RJkHd6ot/04jxBVdD2E6u3
         DvTWmA3WOmuE6d6ZX/0J6na8TchlaHr2RKeOBsyLpwAdEVsHwjZhmilgxByOIsblNywS
         h1vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744981206; x=1745586006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l8JNtE4WoAq9/1lxNRUODtbBYrROtMNzFv6IeY4kWjg=;
        b=sofmNNau7tajdYywIDgZRe5zPLfGCtiFKlx+iy9AYYv+D5cPMydRXywz2JjQlM8mez
         n40Md+gWDtRQtlMwJ84qeupisrBIr4X3VRMBx8AYM0lWQnuHufkrfJeOX52etG7Hi/tQ
         I/Sr5dcyAn9izGqHx3aS7XyF3d3UZRYWsm4BtV5ARY6wJvteyjAnbjhZeXsaBx5zHmEA
         rExyWjGC7twI7Xcje2gMLpyELcCJ0wimmnFf8rqqivKv04rjIE9K+p4ggyi9wAQZ4FmO
         X+huLXXQJk4FWNjd8EDAKuL5s8XjY2JGK9ifM+bxnnkPTCCDFvltGv5p4MRtCYIy54BO
         OwMw==
X-Forwarded-Encrypted: i=1; AJvYcCUDwtMZPrF5xuVJtjCWKnfyDEFM8/nhABDD/C1AkjMmG1T5cFGwkUtCjSYSyoVhZVjKNS0rNdTva+y7D3c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzT6i0bPHdKphapFHO416SGKMkXEjn9O3TxMphO9v2XMgpOmDCI
	hQaLccMmjYXt06p348iozTBoBCxu/zyU/St2D2CeS4otBI8pqve+3J6R7vyrqIscQT4PRrewSui
	g7nnVoeQBS8faigqDT2OSPVzYYtk=
X-Gm-Gg: ASbGncsQJ0jRJsHbomOr15kpkVk3yXInJipi21fVl3ZAf+xeYkwLt0nAu18TO3/1nyu
	r+iUzep9+oip97ncuJyN9oeva/P0ZIv7dNTnGzj3Rn5PNt4vEJ90ODtporSqqdEvikZAfy4orL9
	ewpcPpeLOfeJvCP73L3tYwXA==
X-Google-Smtp-Source: AGHT+IGXaicF/YetTuwq7s8eBQVZCstjIo+yxIkShv38GuaKB72IC1mUOGVgw6U2wfXMrWNvIRt5K3Celpi0igA/0l4=
X-Received: by 2002:a17:902:cecf:b0:21d:cdb7:876c with SMTP id
 d9443c01a7336-22c5356dcdemr15485185ad.3.1744981205862; Fri, 18 Apr 2025
 06:00:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250418002117.130612-1-linux@treblig.org> <20250418002117.130612-3-linux@treblig.org>
 <ab85b3c9-46cc-4148-9de5-dcaabea130ea@wanadoo.fr>
In-Reply-To: <ab85b3c9-46cc-4148-9de5-dcaabea130ea@wanadoo.fr>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 18 Apr 2025 08:59:54 -0400
X-Gm-Features: ATxdqUEolXit984ANdGjgXNbP2P1Sp8M7f-qILNT6MUa_IQPkkR459ABsXKExIs
Message-ID: <CADnq5_MrEQ2XGbNho6xd9Um0R6kEEpZBeu0e-97o6-D=juD0gw@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/radeon: Remove unused radeon_doorbell_free
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux@treblig.org, alexander.deucher@amd.com, harry.wentland@amd.com, 
	sunpeng.li@amd.com, siqueira@igalia.com, christian.koenig@amd.com, 
	airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 18, 2025 at 2:18=E2=80=AFAM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> Le 18/04/2025 =C3=A0 02:21, linux@treblig.org a =C3=A9crit :
> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> >
> > radeon_doorbell_free() was added in 2013 by
> > commit 75efdee11b5d ("drm/radeon: implement simple doorbell page
> > allocator")
> > but never used.
>
> Hi,
>
> I think than instead of being removed, it should be used in the error
> handling path of cik_init() and in cik_fini().

Yes, ideally.  Care to make a patch to fix that?

Thanks,

Alex

>
> CJ
>
> >
> > Remove it.
> >
> > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> > ---
> >   drivers/gpu/drm/radeon/radeon.h        |  1 -
> >   drivers/gpu/drm/radeon/radeon_device.c | 14 --------------
> >   2 files changed, 15 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/r=
adeon.h
> > index 8605c074d9f7..58111fdf520d 100644
> > --- a/drivers/gpu/drm/radeon/radeon.h
> > +++ b/drivers/gpu/drm/radeon/radeon.h
> > @@ -686,7 +686,6 @@ struct radeon_doorbell {
> >   };
> >
> >   int radeon_doorbell_get(struct radeon_device *rdev, u32 *page);
> > -void radeon_doorbell_free(struct radeon_device *rdev, u32 doorbell);
> >
> >   /*
> >    * IRQS.
> > diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/r=
adeon/radeon_device.c
> > index bbd39348a7ab..4127ffb4bb6f 100644
> > --- a/drivers/gpu/drm/radeon/radeon_device.c
> > +++ b/drivers/gpu/drm/radeon/radeon_device.c
> > @@ -392,20 +392,6 @@ int radeon_doorbell_get(struct radeon_device *rdev=
, u32 *doorbell)
> >       }
> >   }
> >
> > -/**
> > - * radeon_doorbell_free - Free a doorbell entry
> > - *
> > - * @rdev: radeon_device pointer
> > - * @doorbell: doorbell index
> > - *
> > - * Free a doorbell allocated for use by the driver (all asics)
> > - */
> > -void radeon_doorbell_free(struct radeon_device *rdev, u32 doorbell)
> > -{
> > -     if (doorbell < rdev->doorbell.num_doorbells)
> > -             __clear_bit(doorbell, rdev->doorbell.used);
> > -}
> > -
> >   /*
> >    * radeon_wb_*()
> >    * Writeback is the method by which the GPU updates special pages
>
