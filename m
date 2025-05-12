Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195B123535A
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 15:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747064599; cv=none; b=VFlQht7SmYpA32/KCvqIhzfvxkXMVcxRD2YNiLTc4c9Rs7Du5a7AYpgYx//9t3mzCiCZ2o1fb0SieBjupZGiDucrewivE5MvP+rVoajTbcFyc2f+TSWB3JNDKd1atQnOW8QULUv9zaOiG5pKoDbS/JXfCePzQy27j1jLkLk+oGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747064599; c=relaxed/simple;
	bh=btAW2opBasPE5Cqf/o3EOMc9ujPP8oV0//iwmzzc2ug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=niPKvWj3z9PBTkxBEQxxp0OiO79ogMzjDk4fRuzkl0gtBAxgSjySxZGGYoIq3P8seYpoic2RcvHo7PJYfmySZdo52BmyhLmW7IptAt6B6XeZcSFkJopr1Mnpl9qsic3+PB4aXzwMKVFEiV0RQa9JxE0WX94L1zyRYP2/ABvNGJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GLbV39Q5; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GLbV39Q5"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22eed3b3cabso5358575ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 08:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747064597; x=1747669397; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5DCiZAB2+AHNjbQHgMhnHuF9a/a/vBov8+0bK91zfOc=;
        b=GLbV39Q5yd1aDiT4XG79m0vIUQrUSCJYSE5R3KvGoio06evIEvgbrETmzizhVkJ2CI
         2ooxh1vVU75GEo86Rx8qHsMl1Gx8FfBF0/i2DCRVzZ545HuMtYnUUxPhuwTNdmLXTuvM
         CVy29ePY3DivSWtMrxqwZTJ7jfJ5NuQO4xQZZk9bwBkQWiEzt9YFFx8NLD0RYI2Ny0Rz
         CgTR3CK2unyf8ClWGTsH9r8NiYyeKhJqtJ8phie/LU4EzFr7dgZ1hC1pSXyN1skD0VT2
         AqIP412bxVWhnxm3lJRzgnMODS5RvX32qGQ8N1Lr5Pp95rfEnIYZq1qvahvT0HRCavbl
         xmpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747064597; x=1747669397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5DCiZAB2+AHNjbQHgMhnHuF9a/a/vBov8+0bK91zfOc=;
        b=rsSmdl3wxvdrQGiQdIlNm0YQJWdKVCMAGw0ntjA1wncF+BzV9vVmZJTsQwSFCJGKO+
         CjB8wpC1Mhqy8R3603h5pTxMEElybV7WgThdyErKmphBp7d6bvjh7GkXr6Vfuu3igVG9
         iE1Nriy+8N87DpOgqtIQIelh/a6ixfjeoafY5zWyB3DQCtZUtEwg53zB2C7GkfrTdB28
         KE5TTKGkyhcvQ7I1JYhR+tLmpC4qcd52GftAYUeob3yOyOgQUq//XOHzhCLX0tbMf7DE
         WkMDBBQBzofd5EwmxJe6Q99N61afSWrG+R9Mli6xDbweRB+6NDXl/7DrZdmEjYKOqbEK
         L5uQ==
X-Forwarded-Encrypted: i=1; AJvYcCVff2B3ia6L5xr63eJ8Zv/IpQqws7o6wzyI1BuNU+l+sDuQf9xlzmW1QDjXo4yUB++uB54PeeMCzjP+B/E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1hMxaHY12d9I7fT2JoTTs4uGhfErIPGzmKXXsMZOGc+4pwT/s
	ohiCwDfSo9luSt/2wkDXe/kVTcGycd3ahKklgP5Vc88AB0jLu4y4yllP2gCf2WzPxe23aOTuM8t
	CoL8FHlFL5Ifrw2BodEsNJ8xVMYY=
X-Gm-Gg: ASbGnctmiTmwbMm2A5SqUkljX6XWIM0Qw1l1x8vCQbFxrKwd3T7mIIA6G5qtI8CikNC
	GbZyQ/5wQt7+nazEjYFYeTCq7PI8uETKruc11S32exfMeKNyF0j5PxH9sotHIEp3wbD7gwp18an
	VMsh/Rd7APiw3ADPunPpFA3iUKKrGwriwYRywze2phsmk=
X-Google-Smtp-Source: AGHT+IGyMJ8boT1OFIvqC4soG2njSbaP6iXkHsGtYUMXF8XKSrBuXCei4FSoQXyHUvyDr/sou0DRoMYWlQQaeCeGr4M=
X-Received: by 2002:a17:902:ecd1:b0:224:1001:6777 with SMTP id
 d9443c01a7336-22fc8b402b1mr80871515ad.4.1747064597255; Mon, 12 May 2025
 08:43:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250418002117.130612-1-linux@treblig.org> <20250418002117.130612-3-linux@treblig.org>
 <ab85b3c9-46cc-4148-9de5-dcaabea130ea@wanadoo.fr> <aCCQKkg6e3yPZmSU@gallifrey>
In-Reply-To: <aCCQKkg6e3yPZmSU@gallifrey>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 12 May 2025 11:43:05 -0400
X-Gm-Features: AX0GCFtL2FloAcVeybWAmvQ0Iyx-tNCGmRDlrrcYLXe0z65NAcyir1zr9TU8zg0
Message-ID: <CADnq5_PECpX173wZOPV8VASyoQhDWkJnqvsh61zGwsiZqmNMBw@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/radeon: Remove unused radeon_doorbell_free
To: "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, alexander.deucher@amd.com, 
	harry.wentland@amd.com, sunpeng.li@amd.com, siqueira@igalia.com, 
	christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 11, 2025 at 8:13=E2=80=AFAM Dr. David Alan Gilbert
<linux@treblig.org> wrote:
>
> * Christophe JAILLET (christophe.jaillet@wanadoo.fr) wrote:
> > Le 18/04/2025 =C3=A0 02:21, linux@treblig.org a =C3=A9crit :
> > > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > >
> > > radeon_doorbell_free() was added in 2013 by
> > > commit 75efdee11b5d ("drm/radeon: implement simple doorbell page
> > > allocator")
> > > but never used.
> >
> > Hi,
> >
> > I think than instead of being removed, it should be used in the error
> > handling path of cik_init() and in cik_fini().
>
> OK, here's an RFC that builds; but if I understand correctly only
> some devices run this code, and I'm not sure mine does;
>
> Thoughts?
>
> Dave
>
> From 15b3830b4ee3eb819f86198dcbc596428f9ee0d0 Mon Sep 17 00:00:00 2001
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> Date: Sun, 11 May 2025 02:35:41 +0100
> Subject: [RFC PATCH] drm/radeon/cik: Clean up doorbells
>
> Free doorbells in the error paths of cik_init and in cik_fini.
>
> Suggested-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  drivers/gpu/drm/radeon/cik.c | 38 ++++++++++++++++++++++++------------
>  1 file changed, 26 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/cik.c b/drivers/gpu/drm/radeon/cik.c
> index 11a492f21157..3caa5a100f97 100644
> --- a/drivers/gpu/drm/radeon/cik.c
> +++ b/drivers/gpu/drm/radeon/cik.c
> @@ -8548,7 +8548,7 @@ int cik_suspend(struct radeon_device *rdev)
>   */
>  int cik_init(struct radeon_device *rdev)
>  {
> -       struct radeon_ring *ring;
> +       struct radeon_ring *ring, *ringCP1, *ringCP2;

I'd prefer ring_cp1 and ring_cp2 for readability.

>         int r;
>
>         /* Read BIOS */
> @@ -8623,19 +8623,22 @@ int cik_init(struct radeon_device *rdev)
>         ring->ring_obj =3D NULL;
>         r600_ring_init(rdev, ring, 1024 * 1024);
>
> -       ring =3D &rdev->ring[CAYMAN_RING_TYPE_CP1_INDEX];
> -       ring->ring_obj =3D NULL;
> -       r600_ring_init(rdev, ring, 1024 * 1024);
> -       r =3D radeon_doorbell_get(rdev, &ring->doorbell_index);
> +       ringCP1 =3D &rdev->ring[CAYMAN_RING_TYPE_CP1_INDEX];
> +       ringCP2 =3D &rdev->ring[CAYMAN_RING_TYPE_CP2_INDEX];
> +       ringCP1->ring_obj =3D NULL;
> +       ringCP2->ring_obj =3D NULL;
> +       ringCP1->doorbell_index =3D RADEON_MAX_DOORBELLS;
> +       ringCP2->doorbell_index =3D RADEON_MAX_DOORBELLS;
> +
> +       r600_ring_init(rdev, ringCP1, 1024 * 1024);
> +       r =3D radeon_doorbell_get(rdev, &ringCP1->doorbell_index);
>         if (r)
>                 return r;
>
> -       ring =3D &rdev->ring[CAYMAN_RING_TYPE_CP2_INDEX];
> -       ring->ring_obj =3D NULL;
> -       r600_ring_init(rdev, ring, 1024 * 1024);
> -       r =3D radeon_doorbell_get(rdev, &ring->doorbell_index);
> +       r600_ring_init(rdev, ringCP2, 1024 * 1024);
> +       r =3D radeon_doorbell_get(rdev, &ringCP2->doorbell_index);
>         if (r)
> -               return r;
> +               goto out;
>
>         ring =3D &rdev->ring[R600_RING_TYPE_DMA_INDEX];
>         ring->ring_obj =3D NULL;
> @@ -8653,7 +8656,7 @@ int cik_init(struct radeon_device *rdev)
>
>         r =3D r600_pcie_gart_init(rdev);
>         if (r)
> -               return r;
> +               goto out;
>
>         rdev->accel_working =3D true;
>         r =3D cik_startup(rdev);

I think you can drop the doorbells in the error case for cik_startup()
as well since they won't be used in that case.

Alex

> @@ -8678,10 +8681,16 @@ int cik_init(struct radeon_device *rdev)
>          */
>         if (!rdev->mc_fw && !(rdev->flags & RADEON_IS_IGP)) {
>                 DRM_ERROR("radeon: MC ucode required for NI+.\n");
> -               return -EINVAL;
> +               r =3D -EINVAL;
> +               goto out;
>         }
>
>         return 0;
> +
> +out:
> +       radeon_doorbell_free(rdev, ringCP1->doorbell_index);
> +       radeon_doorbell_free(rdev, ringCP2->doorbell_index);
> +       return r;
>  }
>
>  /**
> @@ -8695,6 +8704,7 @@ int cik_init(struct radeon_device *rdev)
>   */
>  void cik_fini(struct radeon_device *rdev)
>  {
> +       struct radeon_ring *ring;
>         radeon_pm_fini(rdev);
>         cik_cp_fini(rdev);
>         cik_sdma_fini(rdev);
> @@ -8708,6 +8718,10 @@ void cik_fini(struct radeon_device *rdev)
>         radeon_ib_pool_fini(rdev);
>         radeon_irq_kms_fini(rdev);
>         uvd_v1_0_fini(rdev);
> +       ring =3D &rdev->ring[CAYMAN_RING_TYPE_CP1_INDEX];
> +       radeon_doorbell_free(rdev, ring->doorbell_index);
> +       ring =3D &rdev->ring[CAYMAN_RING_TYPE_CP2_INDEX];
> +       radeon_doorbell_free(rdev, ring->doorbell_index);
>         radeon_uvd_fini(rdev);
>         radeon_vce_fini(rdev);
>         cik_pcie_gart_fini(rdev);
> --
> 2.49.0
>
>
> --
>  -----Open up your eyes, open up your mind, open up your code -------
> / Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \
> \        dave @ treblig.org |                               | In Hex /
>  \ _________________________|_____ http://www.treblig.org   |_______/
