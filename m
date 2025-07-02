Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FC823026B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 21:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751490717; cv=none; b=ckboqKG0CoEQLZ/NU2vDo/YQONvyCYUpbx86fY9ZgaTOPBNDDxhcBwAMB16y0YNE3DG9wsxEUm1GS29Cn3izYqgysnZun4X4Ikdm74rcBcT0wWEmZce85AjKSmlBLRijSGGuRqnU55r4Kb0SyfnVQizH9Lx0KgpScUhSS0D8IL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751490717; c=relaxed/simple;
	bh=r4ycxoolYmuKX0m2fIW1oV8sY58bOT134WmsNhkmxdo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tGMyJ8KIb9YwNMVYPoU4sZFAn/ftM2ATY2ZxXMiQmjg76SUDp9wD9DiUC7aNueP29EXDcY4gIYsokcwdzsl5z9YNH0Mb1/71cp/IQDabG9WwFVzOUrLxuG1KETnXyN2imrkHY7SDrzZT6P5cEIocNdIwPjUFT5DncyP9aiY6mZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=eJuEA5uR; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="eJuEA5uR"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-23c71b21f72so1098715ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 14:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1751490713; x=1752095513; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sHPw+gFNU4kcte4+DjGEOa7pSlzMKOzoy1+5anqcCg0=;
        b=eJuEA5uRye4ewsbqqtf3mko+4VCMtWArFtfxu+IphRRxyCpyR19cUc+9vvbruZq5v2
         eDHL0HK2i/e0kibposvkeF/M9zToe21sUJ4XygzHek51RnbkGB/GVlcLHlDd/b8kag2H
         UsKnWEqPtgzn8QH5NY/yVYcjNs7cSyeB6FPdBArimfEnPWJvi1kwbQiVK/7pRIUyrRBf
         wvlNiMEaaDxkZQFN1Ccrxs8UrujlKG49AdzAn/95s0ALMgXyRQh4Pu2DyFQ9zc4loIUs
         bmWV0OUROTySQP377KJNTEwM6p1oZ3aLEsFMDq9KGtndcnpzp5vt906JNTe0LoVQG9Qg
         By2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751490713; x=1752095513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sHPw+gFNU4kcte4+DjGEOa7pSlzMKOzoy1+5anqcCg0=;
        b=C73vwhn7V2+1onSx4dQGLHt5EtdU/gD/saI9mSoaSo7WadDGOvW8snEZsnBhDUlc7W
         VOpxsQg8dmLUSs7PKUxqZjvGe6DnlmLQ5583LT9ZBcUqvttv6tALh3rJOKd+FunfnBYr
         jTi6jlV2WAeE/lFEGdU402YTiJWBi2QsxaO+zwjZF+GsxqjKtHHpXhJVjpiqFGr8/UFf
         SuEwOk1LeqDXayCUnmmXrv2+nrk0QbOtlygeI18dpjcS6+JyXwo0okiG0LdKBGrYZ8tt
         YrMBdmVRfCg90aqjPMELoaShuZEeJwQdtGsKH0EnxixsDExBk3HXEu9+shjqRi8Cz33p
         b5NQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoBBF5sRgphBy8Pxpi9rmSksHxrcHM2SbsmvKHG64lrYmnsRr4xIhKY9Q0Vkv2cEyOv813sqQtg9E02so=@vger.kernel.org
X-Gm-Message-State: AOJu0YzV239LZnONv9L+vc7pPisC46J1p0kHCntANVo1wn11b+m1tYn9
	TuuOqX8lvOelDvUFPa2RdgFqa17cBqkqZtJARwLnQS4aX/CQjZSO3PrCHWQodyT43qWn4WFbKV7
	uFpLZY7rQd0ehxyxA6joUNzM6iwqLOvk4eGDHoPUTBQ==
X-Gm-Gg: ASbGncu2wQtCVCG/9dlLHrficfQk9Hb8ASY2e6ZNAGuVSj7vRa76UxGtMFeCvSRvry9
	Q7wfJIzYBSy5ES3S0D5/B46oiSK111ytaQEL5C4uBR1uawaFWI30uqPoAbpPKHeEJnHmvt/AjQP
	5k42/F/iykVlPKamj4hspqxQucCZ1rbP8rtbpsd77Cs+3Sgaimq1d2gA==
X-Google-Smtp-Source: AGHT+IFuNZwePMXtrGGiy+Lal9FBipRUHE+tVSTERSi9lHrrMb5JTmkuRgmPnmoBG4HWQ7kRECEakR5dz4NREEM6yVA=
X-Received: by 2002:a17:902:d4c5:b0:234:db06:ab5 with SMTP id
 d9443c01a7336-23c6e50f8bcmr28811895ad.12.1751490713407; Wed, 02 Jul 2025
 14:11:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619143435.3474028-1-csander@purestorage.com>
In-Reply-To: <20250619143435.3474028-1-csander@purestorage.com>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Wed, 2 Jul 2025 17:11:42 -0400
X-Gm-Features: Ac12FXyYeIjTfBC7VX_f4PgJXEIGElJPaVB7WXMGWA-c8qyxwbh-DBbEEDN0jU0
Message-ID: <CADUfDZo5O1zONAdyLnp+Nm2ackD5K5hMtQsO_q4fqfxF2wTcPA@mail.gmail.com>
Subject: Re: [PATCH] io_uring/rsrc: skip atomic refcount for uncloned buffers
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jens,
Any concerns with this one? I thought it was a fairly straightforward
optimization in the ublk zero-copy I/O path.

Thanks,
Caleb

On Thu, Jun 19, 2025 at 10:34=E2=80=AFAM Caleb Sander Mateos
<csander@purestorage.com> wrote:
>
> io_buffer_unmap() performs an atomic decrement of the io_mapped_ubuf's
> reference count in case it has been cloned into another io_ring_ctx's
> registered buffer table. This is an expensive operation and unnecessary
> in the common case that the io_mapped_ubuf is only registered once.
> Load the reference count first and check whether it's 1. In that case,
> skip the atomic decrement and immediately free the io_mapped_ubuf.
>
> Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
> ---
>  io_uring/rsrc.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
> index 94a9db030e0e..9a1f24a43035 100644
> --- a/io_uring/rsrc.c
> +++ b/io_uring/rsrc.c
> @@ -133,12 +133,14 @@ static void io_free_imu(struct io_ring_ctx *ctx, st=
ruct io_mapped_ubuf *imu)
>                 kvfree(imu);
>  }
>
>  static void io_buffer_unmap(struct io_ring_ctx *ctx, struct io_mapped_ub=
uf *imu)
>  {
> -       if (!refcount_dec_and_test(&imu->refs))
> -               return;
> +       if (unlikely(refcount_read(&imu->refs) > 1)) {
> +               if (!refcount_dec_and_test(&imu->refs))
> +                       return;
> +       }
>
>         if (imu->acct_pages)
>                 io_unaccount_mem(ctx, imu->acct_pages);
>         imu->release(imu->priv);
>         io_free_imu(ctx, imu);
> --
> 2.45.2
>
