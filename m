Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F151DD9D1
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 09:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738575120; cv=none; b=PpGZ31vwr/BieFulpVfQAcFoen3BbUwWQv5ObbCvsFqaMRdFy14eA+dL+gh7Q9DRK3DPDCXzofOFH0Aly29zTP6ByJVfVtM8ujQzJuPt6NuBzLmfcIgSc+Mqmz3OLNJeZeHVR1vZ9kzjCH7L0vPVbDOCjyzNPYq8LTUreo7aHvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738575120; c=relaxed/simple;
	bh=I63rOjnCCdYeabHEACElWvT5v+80dCPI5Uh/pXHFZsM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BIvszy3XPbsxbkn2ZTjr1Phk5PybEFkCmSQuFediDmELOKs5d8D93wppzxfi82zPiz74bYj7J2Vujxp4qiDdOgktkQ91Eobg9sSQkjFuLDXJ2W6HyYP6ucG9LHmsJHnhZfqCRBx9Ve0gHzDMXfHBQRHl2X1Y+B5luT6iHsyLT4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SUOp9s0H; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SUOp9s0H"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-71ded02b779so2367165a34.2
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 01:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738575118; x=1739179918; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0b/Cjql8YcuaYzXvGj+YKhtAwAo8DMeJsHKMU0SBdds=;
        b=SUOp9s0HdI5LfcYd2JN+AvpmE2Zb4/0jcj/m70LQn8te9rO1n6vd7i6+qGBBrPTtXV
         UOYOAggdHkGwjN9gqTLWtut1qfZo+ePM6kO+/8+oZY3v7bE9ZoqcA8r6aRTyT32ZGNV7
         FN9SFUsEto/v7DBwzJg0hlukLpNYBVpDeCGPf3aqHzDgdTjM1hGa5r0LUJ1t6chz6Li9
         +XCOgNfNJAuhZYSwSIh12qG6IajzzSdGFtzsQhR5oQHMia0VQLHlfM7dNB5RhQgyZR1x
         3Nt5vfehI5Dz0xGtq23Gz4rvja/d58goIl3uC/Y+48F7jR9vS9GxSZnILMm7H7Y87tuh
         eJJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738575118; x=1739179918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0b/Cjql8YcuaYzXvGj+YKhtAwAo8DMeJsHKMU0SBdds=;
        b=anQvcU9SSujlc3TaNLVCIrwjBdJq7qpQKejRIFPydS1RKYwPDJcrS3JyaXCfqljxd3
         IuJfi+upmcX1pHwzzGFtinpKCCIeFLHWgwfj5YR1b6L0p+9ioJFoaZZQjG3aa5cYIEHd
         Zk1V64u2hXb1wCsMGddFw854MoyrbqwYSmO7E9wUeSsOBQSSrsgZ1i69TKmxV3wz5pJ5
         VuWDUV/XPVPFoe02rnXtS+gK5BlCcV2ByHINfetiyDaduXnEImBdQBaQODW6ejzZKo1z
         nOBovOjwnDoMhHB3ZnYLtmDTGwlOiYbYjbOGEeNA2gkoMB0xdA4yYaQnjJd5Vcri5hoK
         RlnA==
X-Forwarded-Encrypted: i=1; AJvYcCXBrkKkOqN0hjOhE6oFABfCc0epxooc4OoTq7tzI/YKL64zQy2PE0X0Rv4/BtbkFWIPfdpW8qu760O2Coc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9GkGf4k0pze+0RHFucN2exIJa2Y7SHGtz+71KfOr8Rye5fAaT
	DxaJLSmNYMs1Ih6+cpplrElibkhp+6A1unXTusvERXnob3ND98I2X0GFXAd9XhN+PIGA+ycl7rx
	MGTm5z+x4Om/quZXK1P8Mndhpm8/nXrjf6d0cvw==
X-Gm-Gg: ASbGncvzBSAq9+e41jNrsteJ9qpENTewP9GF6G1jTGFoa3TsJgndHg6zCA/pghdLCyU
	nesezSGQPebR9W+LgbrlWPhSIS4Gtg80syWNL3nuqu+GUABGsoTbsjhgicnlQ7d0kkINQYU1t8A
	==
X-Google-Smtp-Source: AGHT+IEJR8hIqhnAeUdKOXgl0A4tp839fV0qz7B2ghRrTXHtlZLHQoPUdfrFDSD4+GV3YT8Rl/1A2cL6Ht+DjXLmwE4=
X-Received: by 2002:a05:6830:470c:b0:71d:eb29:3c58 with SMTP id
 46e09a7af769-7265672f9ffmr13729710a34.3.1738575117736; Mon, 03 Feb 2025
 01:31:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203080030.384929-1-sumit.garg@linaro.org>
In-Reply-To: <20250203080030.384929-1-sumit.garg@linaro.org>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 3 Feb 2025 10:31:46 +0100
X-Gm-Features: AWEUYZlwCSm4HwtHohHUPDc6_Po7Sc0pFggJId4hRg-F_HDxQ5gYmp8XH_94HjM
Message-ID: <CAHUa44FXzL-MZ5y7x6qrsn3GJR=1oR8bbRVCv6ZTvDRoQmENEg@mail.gmail.com>
Subject: Re: [PATCH v2] tee: optee: Fix supplicant wait loop
To: Sumit Garg <sumit.garg@linaro.org>
Cc: arnd@arndb.de, op-tee@lists.trustedfirmware.org, 
	jerome.forissier@linaro.org, dannenberg@ti.com, javier@javigon.com, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 9:00=E2=80=AFAM Sumit Garg <sumit.garg@linaro.org> w=
rote:
>
> OP-TEE supplicant is a user-space daemon and it's possible for it
> being hung or crashed or killed in the middle of processing an OP-TEE
> RPC call. It becomes more complicated when there is incorrect shutdown
> ordering of the supplicant process vs the OP-TEE client application which
> can eventually lead to system hang-up waiting for the closure of the
> client application.
>
> Allow the client process waiting in kernel for supplicant response to
> be killed rather than indefinitetly waiting in an unkillable state. This
> fixes issues observed during system reboot/shutdown when supplicant got
> hung for some reason or gets crashed/killed which lead to client getting
> hung in an unkillable state. It in turn lead to system being in hung up
> state requiring hard power off/on to recover.
>
> Fixes: 4fb0a5eb364d ("tee: add OP-TEE driver")
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>
> Changes in v2:
> - Switch to killable wait instead as suggested by Arnd instead
>   of supplicant timeout. It atleast allow the client to wait for
>   supplicant in killable state which in turn allows system to reboot
>   or shutdown gracefully.
>
>  drivers/tee/optee/supp.c | 32 +++++++-------------------------
>  1 file changed, 7 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/tee/optee/supp.c b/drivers/tee/optee/supp.c
> index 322a543b8c27..3fbfa9751931 100644
> --- a/drivers/tee/optee/supp.c
> +++ b/drivers/tee/optee/supp.c
> @@ -80,7 +80,6 @@ u32 optee_supp_thrd_req(struct tee_context *ctx, u32 fu=
nc, size_t num_params,
>         struct optee *optee =3D tee_get_drvdata(ctx->teedev);
>         struct optee_supp *supp =3D &optee->supp;
>         struct optee_supp_req *req;
> -       bool interruptable;
>         u32 ret;
>
>         /*
> @@ -111,36 +110,19 @@ u32 optee_supp_thrd_req(struct tee_context *ctx, u3=
2 func, size_t num_params,
>         /*
>          * Wait for supplicant to process and return result, once we've
>          * returned from wait_for_completion(&req->c) successfully we hav=
e
> -        * exclusive access again.
> +        * exclusive access again. Allow the wait to be killable such tha=
t
> +        * the wait doesn't turn into an indefinite state if the supplica=
nt
> +        * gets hung for some reason.
>          */
> -       while (wait_for_completion_interruptible(&req->c)) {
> -               mutex_lock(&supp->mutex);
> -               interruptable =3D !supp->ctx;
> -               if (interruptable) {
> -                       /*
> -                        * There's no supplicant available and since the
> -                        * supp->mutex currently is held none can
> -                        * become available until the mutex released
> -                        * again.
> -                        *
> -                        * Interrupting an RPC to supplicant is only
> -                        * allowed as a way of slightly improving the use=
r
> -                        * experience in case the supplicant hasn't been
> -                        * started yet. During normal operation the suppl=
icant
> -                        * will serve all requests in a timely manner and
> -                        * interrupting then wouldn't make sense.
> -                        */
> +       if (wait_for_completion_killable(&req->c)) {
> +               if (!mutex_lock_killable(&supp->mutex)) {

Why not mutex_lock()? If we fail to acquire the mutex here, we will
quite likely free the req list item below at the end of this function
while it remains in the list.

Cheers,
Jens

>                         if (req->in_queue) {
>                                 list_del(&req->link);
>                                 req->in_queue =3D false;
>                         }
> +                       mutex_unlock(&supp->mutex);
>                 }
> -               mutex_unlock(&supp->mutex);
> -
> -               if (interruptable) {
> -                       req->ret =3D TEEC_ERROR_COMMUNICATION;
> -                       break;
> -               }
> +               req->ret =3D TEEC_ERROR_COMMUNICATION;
>         }
>
>         ret =3D req->ret;
> --
> 2.43.0
>
