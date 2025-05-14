Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D351A9B4D
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 14:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747232396; cv=none; b=QFEMXmIMS8wu95Du6/zjj3AuWtVu6DZyVH4mBlrcJZ43nBl05zgiYv/tnEzRmoxk7T3qZV1pTDcwRQQc/GgtRb+WXymn7ts7seSjGceVFwb0B/vPWsm1axTIXXIIs22KglF+DOvqlf0AVOChV4pGOUpW+8tKRIYFAHHbg4GcrCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747232396; c=relaxed/simple;
	bh=i52tK7Qa/0vWcBMHQa2r8gocDr7NDY3QhsZwnqxCFdE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZfoRz3TbuAxAEuk9g46FT/vQE+4wps2QHO2yoM4ecgXlYeXqNq7IMmLM+hdnFen661LV8EMy9yorEQ0Q59Kz5wU42MlgTh1z71VIbgBGsgkht+xwhQkIhcY7Aif7zHgdenLyCq9wrF3THs1WXyhNbgXp6gUr+3ESeNtGUh8WADs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M279litz; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M279litz"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7390294782bso1032367b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 07:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747232394; x=1747837194; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UCWsXRxmXy6QdMutDWOCFJCtCkw/mbPHpF2mtN1WEno=;
        b=M279litzb8jETl5WmbHNcwcBT2wVMzcjDNUHR8QuNLGIf6pQWuM3p6HTjrPRZqvfDV
         bhxaHge2pEa93zyATYv9TrFhOC1i9npbp5VFottZ1Kp5ypmJ+9ZMB2GA5xAMUqrxkIir
         WrDAoU5N6jr0goDkNPNwsaV/xnhW+J/6g4PxAMIMhm0En3drnNLaFiC1XFfXZHpYMyOg
         qeqO0JBg6nBMEZRPLnZ3trc7OYgo8KRxplVd+aLrI4dJ7MD5aWmdBr0ex45RH4NmrhBe
         ZarSzK+De8c3sD+CVRwEqPPJ8yJ8HhTHhaQqLDF1Ejx0Vi8tOMfrQqDQJARlSDawDxX6
         l3IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747232394; x=1747837194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UCWsXRxmXy6QdMutDWOCFJCtCkw/mbPHpF2mtN1WEno=;
        b=DNsvIRnJTg0wHZ0m7cTOQ60tv5OYtxPbU9v46cu6mEDyuv17xEarBw7JK0VUntVRrd
         T/HM+bclUKfAqNfFYCxCwldilospFmkj5WHxo47/BfrNeDXMooNFoFZTKiCdnDFUWHqK
         Htdo+iiW30LVq4yau51dqcrwyX/ew96jpx899OVMXE+xs/82G7mWWig0x6fT9tdMwto2
         SwZ3XVTcqCMqdFBrL511DLbsQ7yBDJ5paYSD4NrjVHC0/D/XXfQuR7YSAlmIhGYjQFQa
         THMpKZ3/kYbt1FrZkZb9ulaHd60H2ZY/+oBpD0UbLTupOo7wRQ7ZnmLm7NoiaS8CW4On
         AHqg==
X-Forwarded-Encrypted: i=1; AJvYcCW+9qm24uvSBz3YJhvZyTnY8nGfLxIVEhNOwyCbLfGsEKb3StQTHfbX2yVptwazwsb2ToBrY+J2HY4UaRw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhneA5Ef6De9OeT2pvzEUPyCp85U6xKtKNvngX8Z36uXVpsHG/
	mQzTr41wdX66zPN4J+L71+vw5Ny3XFr1eR5DcupU5CkKBP4jvmjrzIPVfdmRK0iz+N+oPBUJeu3
	qClFWBUXL7XXsRVPte7QrWL7YP+w=
X-Gm-Gg: ASbGnctj+FdJuMFRjE27XdCQdpSNTSVXozLPSw4y7b6ldscqwm0eNu59RujAgCfvbbd
	kZS5FHiZxQa65RMNpXf+oAZN8MeLoOWnVDeePxY74iNNZWhk5Fnd2SLIpMgCbCfl4dkA2uYY5M6
	EXkbgcZfYQiKv45O2vm9PfVtrarx6sUP3S
X-Google-Smtp-Source: AGHT+IFmSfpurhemLwc+ZOF8rZWME7jh33OjnpZDBlz8vLnAa0zqEy2lMLnutVH+y3PAEEspBAxozniI7M430eNACkY=
X-Received: by 2002:a17:903:2f8d:b0:224:88c:9255 with SMTP id
 d9443c01a7336-2319810fdf6mr22460295ad.3.1747232394295; Wed, 14 May 2025
 07:19:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514011610.136607-1-linux@treblig.org>
In-Reply-To: <20250514011610.136607-1-linux@treblig.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 14 May 2025 10:19:42 -0400
X-Gm-Features: AX0GCFvKCnzC_zdkgna2rr71SSUfv7aXR8OPd3gdZJqS1dVizK6WKhUHuuj4ZSc
Message-ID: <CADnq5_PK-orH987qxNkArVFWEW2hE5UrRhX7oR2J4+4dAH=wGQ@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon/cik: Clean up doorbells
To: linux@treblig.org
Cc: alexander.deucher@amd.com, christophe.jaillet@wanadoo.fr, 
	christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 9:53=E2=80=AFPM <linux@treblig.org> wrote:
>
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>
> Free doorbells in the error paths of cik_init and in cik_fini.
>
> Build tested only.
>
> Suggested-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Applied.  Thanks!

Alex

> ---
> RFC->v1
>   Renamed ringCP[12]->ring_cp[12]
>   Cleaned up doorbells in cik_startup failure case
>
>  drivers/gpu/drm/radeon/cik.c | 42 +++++++++++++++++++++++++-----------
>  1 file changed, 30 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/cik.c b/drivers/gpu/drm/radeon/cik.c
> index 11a492f21157..51a3e0fc2f56 100644
> --- a/drivers/gpu/drm/radeon/cik.c
> +++ b/drivers/gpu/drm/radeon/cik.c
> @@ -8548,7 +8548,7 @@ int cik_suspend(struct radeon_device *rdev)
>   */
>  int cik_init(struct radeon_device *rdev)
>  {
> -       struct radeon_ring *ring;
> +       struct radeon_ring *ring, *ring_cp1, *ring_cp2;
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
> +       ring_cp1 =3D &rdev->ring[CAYMAN_RING_TYPE_CP1_INDEX];
> +       ring_cp2 =3D &rdev->ring[CAYMAN_RING_TYPE_CP2_INDEX];
> +       ring_cp1->ring_obj =3D NULL;
> +       ring_cp2->ring_obj =3D NULL;
> +       ring_cp1->doorbell_index =3D RADEON_MAX_DOORBELLS;
> +       ring_cp2->doorbell_index =3D RADEON_MAX_DOORBELLS;
> +
> +       r600_ring_init(rdev, ring_cp1, 1024 * 1024);
> +       r =3D radeon_doorbell_get(rdev, &ring_cp1->doorbell_index);
>         if (r)
>                 return r;
>
> -       ring =3D &rdev->ring[CAYMAN_RING_TYPE_CP2_INDEX];
> -       ring->ring_obj =3D NULL;
> -       r600_ring_init(rdev, ring, 1024 * 1024);
> -       r =3D radeon_doorbell_get(rdev, &ring->doorbell_index);
> +       r600_ring_init(rdev, ring_cp2, 1024 * 1024);
> +       r =3D radeon_doorbell_get(rdev, &ring_cp2->doorbell_index);
>         if (r)
> -               return r;
> +               goto out;
>
>         ring =3D &rdev->ring[R600_RING_TYPE_DMA_INDEX];
>         ring->ring_obj =3D NULL;
> @@ -8653,12 +8656,16 @@ int cik_init(struct radeon_device *rdev)
>
>         r =3D r600_pcie_gart_init(rdev);
>         if (r)
> -               return r;
> +               goto out;
>
>         rdev->accel_working =3D true;
>         r =3D cik_startup(rdev);
>         if (r) {
>                 dev_err(rdev->dev, "disabling GPU acceleration\n");
> +               radeon_doorbell_free(rdev, ring_cp1->doorbell_index);
> +               radeon_doorbell_free(rdev, ring_cp2->doorbell_index);
> +               ring_cp1->doorbell_index =3D RADEON_MAX_DOORBELLS;
> +               ring_cp2->doorbell_index =3D RADEON_MAX_DOORBELLS;
>                 cik_cp_fini(rdev);
>                 cik_sdma_fini(rdev);
>                 cik_irq_fini(rdev);
> @@ -8678,10 +8685,16 @@ int cik_init(struct radeon_device *rdev)
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
> +       radeon_doorbell_free(rdev, ring_cp1->doorbell_index);
> +       radeon_doorbell_free(rdev, ring_cp2->doorbell_index);
> +       return r;
>  }
>
>  /**
> @@ -8695,6 +8708,7 @@ int cik_init(struct radeon_device *rdev)
>   */
>  void cik_fini(struct radeon_device *rdev)
>  {
> +       struct radeon_ring *ring;
>         radeon_pm_fini(rdev);
>         cik_cp_fini(rdev);
>         cik_sdma_fini(rdev);
> @@ -8708,6 +8722,10 @@ void cik_fini(struct radeon_device *rdev)
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
