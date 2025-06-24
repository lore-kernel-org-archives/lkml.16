Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838CA2E1727
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 16:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750781222; cv=none; b=e7TRw6MjhR44c5vef6ITWRhWhLGoJShKGfqecZLbtTDSj67AxsRV600BJR/An88eLCnhaYwriorZnQf2vAJwIHljgHvbeixy02HodkqQOENERW7xCCuWWuLSvHTnw1fVTDLKoU6PintDLXmsqjaA1JeO893x0dkP9vL+474YwuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750781222; c=relaxed/simple;
	bh=wXhzquiZzQYaMRXISZYdFPi1aSvfyfJWV3jXSy1aahg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IsAWcwqHijYhbodIIT9pqxlAR01VG8twUo77vqeh6c8jUMg3SAE1cNPIMpuNZ0v9JVf5wOknISmb1a8VjOQ+B8CBUoJaYsE56q7/L8DUspPiX1lKidJfmySysixMbi+MSFSgMFssxXN2463tUimyqOQMRa03LTJwqc3DRAAETxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gkpd7d+V; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gkpd7d+V"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2369da67bacso7919255ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 09:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750781220; x=1751386020; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p469Z/13LqtJ+BNt8oKrD3ps0WvPg6z+cySWcusL5lU=;
        b=Gkpd7d+VAn+bSrwKTEZ4iLi4xPFf+2w2mH4+QdsgacPEJMePSu4rwn96M8wFwxZGpn
         OvXTIGxIHO4eaKl+gyIaY30f8iaOJC5/giF5kDMHx2I2lx3S65mND4CvVL83gbLPxR2Q
         o8PwbtjydLNK0GR/CCU56JtQdV8wsF+TMkv/NxCCDjerKUG7UFitXgbpXbKFg916Nj9N
         kazp0PZRlPBZpJfkDWtGV2dd7JtViMNIHUHHO9gLA4GUMvAYzRmiJDRekN9+EdzlVr9s
         OMsZMFEtWJVOVe/WvfFhTWjABCYTXYmNyxv51RZu/SWq8k6uQqriBWtVOzPQa5Tk0uGj
         y15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750781220; x=1751386020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p469Z/13LqtJ+BNt8oKrD3ps0WvPg6z+cySWcusL5lU=;
        b=hBZkVmQDpprplN5LMK4kkHcrRQZ2paDe3WQjBeDoMfUe9qDYITd7PVtDgNBTvP2xrc
         uiu0Xv8ba5lZHSqXka6Xs286+uttLWslsAZoowGf6vTPKUZFBMLfW67rRo7bs2B7PZhs
         sKEcylxGZ+bnnjR7SwXr9j+T+FLif3FtSnz8DqDOS6f/LWv8ZgO8CN3KctxtxCHB1uiL
         f5E/DwLNm88+TqHZZRTJ1F4hHYHbPgHr20OHsfRORp8MGhNrJLNVuH3frpio5ck/KvtH
         dYrI2YgQf1S3+TEmMRI+CwIM/raCck3RR6J8K8SF1uJKhyY3OUCCEl8VuLTrULcXszhA
         UHeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUG9sv3AeqtImNu5Nhk816kwEq6a6jfzC0BXf5tNVJnoCl2GR5ZZxBftiQkKQ5M+IHycG8CBqj+ShUGXWY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYHNH7ZfPkhL9Pmcwa+E+vY/jI0uwmBpEd/WQg27GlZC7lwRAj
	EuSW7OI8ngECL4YU8KVqoysAXStrkTUMmmg+F5TEfKGXfqGo3gH+U6cF/N9FvQBH6eLh9JOPqED
	8jZj1e21Fw9H6yUlyjyknVTj5yKIzQGU=
X-Gm-Gg: ASbGncvUf6dRSnJGsiR5Bg7bI9FIRrL/tEEMaFSwMhsPH+xUPetWRxzjmXcdO8NX+hU
	HEysI09AYjP0SFVV/Qf8WZNPhWCmvPdRp9rXgL97arSUFE7cWHlixnAui5Ubvsoxs/kW2P0B6vI
	A4+dhtusCyNRyNiLyL23tpDtzjW6vjy8NGT5XrGRPZAMGF
X-Google-Smtp-Source: AGHT+IFYc3aMqLcv9loqWoG6Cca5FOBY7JI9DHpHoCgORxjIKHkQVWbdRXgw9oELbsi29DR4r0stwfPFPJoo6+BSQJg=
X-Received: by 2002:a17:90b:2dd0:b0:311:e9a6:332e with SMTP id
 98e67ed59e1d1-3159d577a7bmr10119236a91.0.1750781219668; Tue, 24 Jun 2025
 09:06:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613182651.1758760-1-andrealmeid@igalia.com>
 <4907bbe3-14e7-49cc-b5bd-78ba375bf46d@amd.com> <f1d61291-f8b8-4646-9195-3724fdee184b@igalia.com>
In-Reply-To: <f1d61291-f8b8-4646-9195-3724fdee184b@igalia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 24 Jun 2025 12:06:46 -0400
X-Gm-Features: AX0GCFuxrPW3hb_jLYUej8jia4MsLoarWXQZKlGY5dgY_YRWYdFs1Tn4-SjFsec
Message-ID: <CADnq5_PRhMAoPj-deOkzo+3XSuZhnPZwvfjK9dUDrNEDZLPpUA@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm: amdgpu: Fix includes of <linux/export.h>
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org, 
	Thomas Zimmermann <tzimmermann@suse.de>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	linux-kernel@vger.kernel.org, kernel-dev@igalia.com, 
	amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks!

On Tue, Jun 24, 2025 at 11:27=E2=80=AFAM Andr=C3=A9 Almeida <andrealmeid@ig=
alia.com> wrote:
>
> Hi Alex,
>
> Em 16/06/2025 03:59, Christian K=C3=B6nig escreveu:
> > Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com> for the serie=
s.
> >
>
> Can you add this series to amd-staging-drm-next? Thanks!
>
> > On 6/13/25 20:26, Andr=C3=A9 Almeida wrote:
> >> Commit 7d95680d64ac ("scripts/misc-check: check unnecessary #include
> >> <linux/export.h> when W=3D1") and commit a934a57a42f6 ("scripts/misc-c=
heck:
> >> check missing #include <linux/export.h> when W=3D1") added new checks =
for when the
> >> include <linux/export.h> is missued by drivers. This patchset make drm=
/amd code
> >> compliant to this new commits.
> >>
> >> See also: https://lore.kernel.org/dri-devel/20250612121633.229222-1-tz=
immermann@suse.de/
> >>
> >> Andr=C3=A9 Almeida (2):
> >>    drm/amd: Do not include <linux/export.h> when unused
> >>    drm/amd: Include <linux/export.h> when needed
> >>
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c      | 1 -
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c   | 1 +
> >>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c     | 1 -
> >>   drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c | 1 -
> >>   drivers/gpu/drm/amd/amdxcp/amdgpu_xcp_drv.c  | 1 +
> >>   5 files changed, 2 insertions(+), 3 deletions(-)
> >>
> >
>
