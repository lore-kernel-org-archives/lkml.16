Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC13184E1C
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 11:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746013974; cv=none; b=VBiufpMMBEVOMGwVy09Ejsb7ygNi7J4J480qfK/xUalEWA1jKtxIpRaZqIp3GUm9mEWPuvD9bzdd8x6X1luM0LAhAO+nneRGg88o5eCIkkXVSXFf02BJwtvu7HhfR60RwjW6CuGv+miEIcDhRS9FowhyuysTB1Vwa6GMumy8KHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746013974; c=relaxed/simple;
	bh=uecXYXmTBkAUyRcnMOGbczeiCVo6fGy/Iknn4XhNAgE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q8v3ukgJoD5LObMLNBYtRAZJ0I/KHW90htoF4cTNxSvAtHXhRrVkPxBmQycotyFFx1/ZBbQ/aMqel84Fla0YHu5Q1vDNoHvofn8el7jKRw4SWikCAO7n6zFvTySECxnKIr0E6nujfFF5GDukf92bp5/BIL1cQQp1VeHOMfo2FGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wb61IUU4; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wb61IUU4"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2cc89c59cc0so579252fac.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 04:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746013971; x=1746618771; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G0WvDa5aRQnCCMGegtVa2lEUDXecKX5r4xxX/pnvbM0=;
        b=wb61IUU4Qu5dyaF0evJRrldtyIVlhUPoDz6QhorUWOBPDnJ3nbfMC8drU5SwdJZuhB
         eurEJrQR0gnZ3DnySu4aPNBQIQMOq7raSVSCYhLLrdD0IanFIbpxv6oJv3iN67aQ1rii
         jfpGnoGmOWUm7jP0oopTvkCY+AP8HfHxzT6L3+KwR8tLbTN0zlgGrbaPeKDYNS8Mv5Lg
         khihDocBO4xttkjfXuA/ImXq4fmBEGC5GlSGREIdRTjGYLpDyqo+ahVntxFPKdjVoQ/+
         SCVBFbmh/zX0JnESBwW2N8t5jo/4P2Hfn3aQtC1syAMf+qxevT41Ul682xbSQOQcRnzk
         xNrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746013971; x=1746618771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G0WvDa5aRQnCCMGegtVa2lEUDXecKX5r4xxX/pnvbM0=;
        b=B6IGOy0tHZ1LVUo/qJMx2M01CRedA5aefzQWc6YoKv8KNdOdOu2MvA2Jti2kkpQz7R
         x0wucm4aRbs/7Wmtymuxm+Rqodfx7ENm1I+TocYhLZjjFyExS5EtxJuzLiQvw/TUlqw0
         hj0z4kAnaE6gYNHs2W2YDgwL9jSCEoJuqo20OCnPPxiicqCfGXdxqtv3gIL0H8Fqtawp
         TwflNSftqOlwEU01BCa4mFPAMOM2K2RWUNt5mZp55DJD70sz4KiN4mQ5QpGOGrs9Lf/9
         BJ7ywYRpchf2pxfTfzmlLnKmPv4JNWPMhxseuPU4yqcXrCBTMmE+irpVmh5AlYVgCZcF
         ZWvw==
X-Forwarded-Encrypted: i=1; AJvYcCUpKFS1tIJZHQu6+1TPaCPRX/N1s6oBiomk5OZpdo5VGaYkKRJozR/BhtJw1U70jVBDUZvE1fgohkmJ7RQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAodtswMtSHmuAJ2b6sABEdhHzwn0K2/2MnSUsfD5wTbtmIN1N
	KtpGGQgKvfksLtexVxvMALgjir76m5odioeI5Yb/wM9AjdQh6BWc3JOqDoGhQnaRWW9yWU8G34b
	4xLVox1o3BoNqZVzOFJl7y7VAfnsSEkjmQ5Ua+g==
X-Gm-Gg: ASbGncu8HvPoXWqMHQ5wepPChZBPG6g3xHrNaoF6wpPgHSKpru7juMq9voWQU6iP5FX
	VCnByZVLByiH9JuhIf4vRvolegskpOm/N8PbztI4nwFslR8JGDY54WZ8T45oiMG28l14fx+jaGu
	NqXVuhbzuQPccjRw1R6EtUOsg3RG2fPxvKzHUwRyJqecE4Op1Jy7FA7UAa
X-Google-Smtp-Source: AGHT+IFRIZnmxicAbUlYiuG5vLwm0zpLjlGxO6F7Sble6XEMwZjOx0YCP+eTbDVX6oNny+5GYdtnRFrO+U4f1mWnIr4=
X-Received: by 2002:a05:6871:7241:b0:2da:731e:41b8 with SMTP id
 586e51a60fabf-2da731e5b10mr1064031fac.14.1746013971426; Wed, 30 Apr 2025
 04:52:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428-tee-sizecheck-v1-1-5c3c25a2fa79@google.com>
In-Reply-To: <20250428-tee-sizecheck-v1-1-5c3c25a2fa79@google.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 30 Apr 2025 13:52:39 +0200
X-Gm-Features: ATxdqUFxVQEPdG55cKDVp9al9A1dB524Vm1psqiJUvk69O024T4Uf-HrXxS9Rvg
Message-ID: <CAHUa44E_JZdYnGrReP0zWCP1wdu2BdJ9DSZZ3a2OiobRj61ThQ@mail.gmail.com>
Subject: Re: [PATCH] tee: Prevent size calculation wraparound on 32-bit kernels
To: Jann Horn <jannh@google.com>
Cc: Sumit Garg <sumit.garg@kernel.org>, op-tee@lists.trustedfirmware.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 3:06=E2=80=AFPM Jann Horn <jannh@google.com> wrote:
>
> The current code around TEE_IOCTL_PARAM_SIZE() is a bit wrong on
> 32-bit kernels: Multiplying a user-provided 32-bit value with the
> size of a structure can wrap around on such platforms.
>
> Fix it by using saturating arithmetic for the size calculation.
>
> This has no security consequences because, in all users of
> TEE_IOCTL_PARAM_SIZE(), the subsequent kcalloc() implicitly checks
> for wrapping.
>
> Signed-off-by: Jann Horn <jannh@google.com>
> ---
> Note that I don't have a test device with a TEE; I only compile-tested
> the change on an x86-64 build.
> ---
>  drivers/tee/tee_core.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)

Looks good, I'm picking up this.

Thanks,
Jens

>
> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> index d113679b1e2d..acc7998758ad 100644
> --- a/drivers/tee/tee_core.c
> +++ b/drivers/tee/tee_core.c
> @@ -10,6 +10,7 @@
>  #include <linux/fs.h>
>  #include <linux/idr.h>
>  #include <linux/module.h>
> +#include <linux/overflow.h>
>  #include <linux/slab.h>
>  #include <linux/tee_core.h>
>  #include <linux/uaccess.h>
> @@ -19,7 +20,7 @@
>
>  #define TEE_NUM_DEVICES        32
>
> -#define TEE_IOCTL_PARAM_SIZE(x) (sizeof(struct tee_param) * (x))
> +#define TEE_IOCTL_PARAM_SIZE(x) (size_mul(sizeof(struct tee_param), (x))=
)
>
>  #define TEE_UUID_NS_NAME_SIZE  128
>
> @@ -487,7 +488,7 @@ static int tee_ioctl_open_session(struct tee_context =
*ctx,
>         if (copy_from_user(&arg, uarg, sizeof(arg)))
>                 return -EFAULT;
>
> -       if (sizeof(arg) + TEE_IOCTL_PARAM_SIZE(arg.num_params) !=3D buf.b=
uf_len)
> +       if (size_add(sizeof(arg), TEE_IOCTL_PARAM_SIZE(arg.num_params)) !=
=3D buf.buf_len)
>                 return -EINVAL;
>
>         if (arg.num_params) {
> @@ -565,7 +566,7 @@ static int tee_ioctl_invoke(struct tee_context *ctx,
>         if (copy_from_user(&arg, uarg, sizeof(arg)))
>                 return -EFAULT;
>
> -       if (sizeof(arg) + TEE_IOCTL_PARAM_SIZE(arg.num_params) !=3D buf.b=
uf_len)
> +       if (size_add(sizeof(arg), TEE_IOCTL_PARAM_SIZE(arg.num_params)) !=
=3D buf.buf_len)
>                 return -EINVAL;
>
>         if (arg.num_params) {
> @@ -699,7 +700,7 @@ static int tee_ioctl_supp_recv(struct tee_context *ct=
x,
>         if (get_user(num_params, &uarg->num_params))
>                 return -EFAULT;
>
> -       if (sizeof(*uarg) + TEE_IOCTL_PARAM_SIZE(num_params) !=3D buf.buf=
_len)
> +       if (size_add(sizeof(*uarg), TEE_IOCTL_PARAM_SIZE(num_params)) !=
=3D buf.buf_len)
>                 return -EINVAL;
>
>         params =3D kcalloc(num_params, sizeof(struct tee_param), GFP_KERN=
EL);
> @@ -798,7 +799,7 @@ static int tee_ioctl_supp_send(struct tee_context *ct=
x,
>             get_user(num_params, &uarg->num_params))
>                 return -EFAULT;
>
> -       if (sizeof(*uarg) + TEE_IOCTL_PARAM_SIZE(num_params) > buf.buf_le=
n)
> +       if (size_add(sizeof(*uarg), TEE_IOCTL_PARAM_SIZE(num_params)) > b=
uf.buf_len)
>                 return -EINVAL;
>
>         params =3D kcalloc(num_params, sizeof(struct tee_param), GFP_KERN=
EL);
>
> ---
> base-commit: b4432656b36e5cc1d50a1f2dc15357543add530e
> change-id: 20250428-tee-sizecheck-299d5eff8fc7
>
> --
> Jann Horn <jannh@google.com>
>
