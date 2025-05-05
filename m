Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832422F4F45
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 23:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746486962; cv=none; b=OoQa2fMKAjAamyu8rCvoNbka1F/ZQKqm8AkpCSpwCzacXD8MKEpw6+KprTAhEElz8RkQOU2rr56UQjqEI/YUzcyoXIochKYB5lIKanLraGvg8HU4h8oX4e5ooE8rCFaQj6Om/P9vjKJleTWh2KC8AlmVy9PvzXzuSculhopiymw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746486962; c=relaxed/simple;
	bh=krYNUMsEhGAKkDAx01YP/uXWwWJEANf6SSdqIrKdoA0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jWTkQSuFItuQFUkuyj+OCmAaoKY/ciZS74MGsvfMSJIP88Ecbt+b+96Q3lckfGkiKP2ECtoQFu7szm58ZnD2QFEC2ht594qHf9OVXQmbbiKSirjke0TFD084KDLlpMKQP4n4tznOVIXqJmZrp7q+vlJ9gAaoFuBseVOfa9gXQRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=DTN+iyjK; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="DTN+iyjK"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-30a892f82b3so8262a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 16:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1746486959; x=1747091759; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qBtLiqsQAZNornH5wgD7b3jJYD105S/GiDk49aEDwGg=;
        b=DTN+iyjKej+zspc8uEMmAzxPt3aoXPTgJKSpIQrsMZ2UfMM+KT/o3I04ETTfGb8jmH
         p3ATOsVKOs146zsOk6NwY9gdymDV7sDXzPLmwNTJGxJQJXOJRftrvj20ajCr3MCjSda+
         J049BfrKJtPBgpdwOdO3dQtL9zovX7bKQlsok+tMqf03JKU93AM8e+zNt8ENnKWnHE7l
         2IR3NRAmZcbbSzC+uiEHuWxDtRNuLGGnLoxB5BWb8AWerThLE7iPTLov4HjLVGFC/EqP
         e6fMSrKXkLLCR/GK/kEPYpnSuEM68VzqolkofbnFCBA9/IGSN+mjswOAzeWFQbMbVvMC
         h1BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746486959; x=1747091759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qBtLiqsQAZNornH5wgD7b3jJYD105S/GiDk49aEDwGg=;
        b=d2cVf+wHvpisAPpr0CvI9mw+JlT8EsAYk0Pyd1SeYCX++1cQuZla7wXbsrkiw+PXjx
         X8JJpggLtkevqKl0q8cteCgnzDeEjWwhUtyeuyMbys0Mu/lZcGSU/XISqmG/4LoXbzU8
         MzzoP3SqfutIxwKGjzP0vdYes6rxxh8dndD6zTa/cBLumkvuvb2RcgNELfU576icBtzw
         M1mtSXv72oLgvkOXb3UozpSrrFN7g3g4G2QSsTXtszV6ujZI1mrSfZeXer+g3heHLKNn
         VgFmk/Qepn4RMy5sADmJvm+AH3RpJekqgUmiSONtgzq0iRL7h/M6HMSKZWQYyQtMWjQY
         +s0Q==
X-Gm-Message-State: AOJu0YwIde4VQn8McoMFW8931FDZBrh8mqC9E0DHXjAhdFhrHFPDpZrD
	7MUQb34N1fahJBlKWua6Vw1IeqmJtBT5OPoc7uzE7yuF/V05xfYjtKqmbujCMxzp2Hkf7HXl97a
	YebfMm0j84X+dG4eXHiU2PYchabvRSPUEg+X84g==
X-Gm-Gg: ASbGnctqW19m4XG6o/RGS3iJHQaxmAyGP6UHi9baTouDUR+YLJGN8n20mby0OsdRv+y
	850Xg96b6IRAYk6/7W9MtvdeMP5exIDttLluuWj4t9sTZlSkxNbz1cqmRBkxbbjJmN6aKGFPO7H
	EbjI4TuAUaN0MxHaieq5ax
X-Google-Smtp-Source: AGHT+IGagPTPgVx/zK3NsPeBBD10ssAbHcDl4TLAybNA5eLO8eptE6YlSL4cJMULg3pPnx1zFjy8HZWl4F2Kr8E+HKM=
X-Received: by 2002:a17:90b:3842:b0:2ff:4be6:c5e2 with SMTP id
 98e67ed59e1d1-30a4e6aff6bmr7959705a91.7.1746486958763; Mon, 05 May 2025
 16:15:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250505221419.2672473-1-sashal@kernel.org> <20250505221419.2672473-295-sashal@kernel.org>
In-Reply-To: <20250505221419.2672473-295-sashal@kernel.org>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Mon, 5 May 2025 16:15:47 -0700
X-Gm-Features: ATxdqUGHxmzJ-iTUgsy67bI6uusSMYHzrvElI7q_8rFZmVYMhnN19Tk8UkIP6Bo
Message-ID: <CADUfDZqvwhL3Hz7_u+TsO5XrpeWX9dHtbehXUtwbJdyi_GXT_A@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.14 295/642] nvme: map uring_cmd data even if
 address is 0
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Xinyu Zhang <xizhang@purestorage.com>, Jens Axboe <axboe@kernel.dk>, 
	Ming Lei <ming.lei@redhat.com>, Keith Busch <kbusch@kernel.org>, sagi@grimberg.me, 
	linux-nvme@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I wouldn't backport this change to any releases. It's a potential
behavior change if a userspace application was submitting NVMe
passthru commands with a NULL data pointer but nonzero data length and
expecting the data buffer to be ignored. And supporting the data field
set to 0 is only necessary for ublk zero-copy, which is introduced in
6.15.

Best,
Caleb

On Mon, May 5, 2025 at 3:26=E2=80=AFPM Sasha Levin <sashal@kernel.org> wrot=
e:
>
> From: Xinyu Zhang <xizhang@purestorage.com>
>
> [ Upstream commit 99fde895ff56ac2241e7b7b4566731d72f2fdaa7 ]
>
> When using kernel registered bvec fixed buffers, the "address" is
> actually the offset into the bvec rather than userspace address.
> Therefore it can be 0.
>
> We can skip checking whether the address is NULL before mapping
> uring_cmd data. Bad userspace address will be handled properly later when
> the user buffer is imported.
>
> With this patch, we will be able to use the kernel registered bvec fixed
> buffers in io_uring NVMe passthru with ublk zero-copy support.
>
> Reviewed-by: Caleb Sander Mateos <csander@purestorage.com>
> Reviewed-by: Jens Axboe <axboe@kernel.dk>
> Reviewed-by: Ming Lei <ming.lei@redhat.com>
> Signed-off-by: Xinyu Zhang <xizhang@purestorage.com>
> Signed-off-by: Keith Busch <kbusch@kernel.org>
> Link: https://lore.kernel.org/r/20250227223916.143006-4-kbusch@meta.com
> Signed-off-by: Jens Axboe <axboe@kernel.dk>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  drivers/nvme/host/ioctl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/nvme/host/ioctl.c b/drivers/nvme/host/ioctl.c
> index fed6b29098ad3..11509ffd28fb5 100644
> --- a/drivers/nvme/host/ioctl.c
> +++ b/drivers/nvme/host/ioctl.c
> @@ -514,7 +514,7 @@ static int nvme_uring_cmd_io(struct nvme_ctrl *ctrl, =
struct nvme_ns *ns,
>                 return PTR_ERR(req);
>         req->timeout =3D d.timeout_ms ? msecs_to_jiffies(d.timeout_ms) : =
0;
>
> -       if (d.addr && d.data_len) {
> +       if (d.data_len) {
>                 ret =3D nvme_map_user_request(req, d.addr,
>                         d.data_len, nvme_to_user_ptr(d.metadata),
>                         d.metadata_len, ioucmd, vec);
> --
> 2.39.5
>
