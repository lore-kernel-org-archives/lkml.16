Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A6D278E40
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 14:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750342069; cv=none; b=juNeIAhmWoD1ajwS5RGdLyrOf6yhHdT6cdwXi8GK5+Qay2aaSUcV3GPK/ClJwsFyOdQzc+NFSneqgXwhiR76gJYqV+mEbsgT+KoMLUcasL7hCMO2wSLfTey2TiwbhFeG1eoSNEgzxLxVFr9X/+sxDqdL3uYnXza8B1xfI5iuZKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750342069; c=relaxed/simple;
	bh=QBuWE2/2FnaOtOw5tYTaph1tN7OXjoscfZKX5d8+WNU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=okW9I3tdWCsrbjTjhHNX1XLH9CA+1PzSomGEpOd/3BUX4rAqeWCqqbCuEdLdeBnul1YJ/awMOzCEDMDW+rSlSY/Df79a8Gw9fZNtpN/15IWxxW4canYksARiWKUuqDP9KQjPRCvQIvcUKUE+xigTrIlAOC/GnA3MLLbj5DIcf3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MB9POOMN; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MB9POOMN"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-606477d77easo509175eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 07:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750342066; x=1750946866; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GxQn0+UwCZdB8+kuRED9SDCjWsgD3/vNPAfkKZAahSg=;
        b=MB9POOMNYgwnYaJo4VvnK6SKU93PzzeUS+4I4kl+MV8rBRtC9/oYgIZK39Ga5Fn3K9
         ppgHS5gWfXyPUydEWqV0F8yJIX/bCyzyiyI0qRFco030zPQrvxEe53v2xFtsF1AGoGDR
         mguJbl13dbAyczmlpvUa1ra6CJmstkmV7P37c+XB0lNRL4rrqplnbpDsZhp1/fTK7bCH
         VvPtXHHtF5pi7l/KD16uEOfLXx6xjLFnT01ehN+wjMwZFtkHOuQn2crXVSif8Nlb0qVW
         HFienCmQCqxWxQDmdSwxjIRIf49OY1b7UmXPCvtCp4+W8QL/IOStrfhFdu6AHYOlq5ar
         hvNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750342066; x=1750946866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GxQn0+UwCZdB8+kuRED9SDCjWsgD3/vNPAfkKZAahSg=;
        b=k3DLACIaH5TpsZK+KXoW5+ADaJGZXzpzpQoC1bLvpjss/ZUieIO9rh/at6pn8dkvMh
         55aSeRZBHzPiYl9/WZhUQaHpTSi4iZZBftv3xMSV2OxduKArS6oX++ChEREbNgU0Yjs3
         TuVt0YyD8yYwe89L1nRvPAYzTRFlB0uu81/vHpTfTh5KGC5Qif3fcCm/iTGBtcdXPnYT
         VuxaOYlQGdifQG6lTpqiUVkwx856Qw0+a4M1YGMk1DxFwO4uaq3pm23qCo0KP+gQ1ctE
         mOA2uXUGaCkUG0C9rXiZOEOUIXVczsXYe2eh8TXEjHIyvsEHG2RotmEFwNa2WVP3mMEw
         PCqA==
X-Forwarded-Encrypted: i=1; AJvYcCVVM4E/Y1VvK/YZkhbD7wRCfsVJpdyZMMskuO0mspXrp5q/ZPQIO+xI2G5SXi2qtM7Xd/KPaSMOTt9VB2M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMisMsb7icMCpkkU6h+XdbsanDZs5bctjKqu0zAydk15VfcZhW
	QVN40DyHPE0iWMr+D8hnkkZ6SHnkgPkj1H2bBeIy/salrLRifzZlhjK+dgH3TwgE6Q1FM3Sg/v2
	NqXCRdbIOEXw9yQNGDHT7f/fC9FOGXz+p5NaKIENdyg==
X-Gm-Gg: ASbGnctF3FjyWiDXHmoLuj/QYbCxnWocLXhzypeau1HnNARh1+w8OGb0Iaci5/+U2Ua
	HJ2in2wxCogG+HWbdnybZzFWnsu5dEU0u5oUGW+4SDAPBhmXsQRvEPly2o+AEoohZOQS8Rc+HZb
	J9q1Y+1xO9xFUuYQoqPMU1v4+h2+ec0im5iA91teQeVltx
X-Google-Smtp-Source: AGHT+IGXvZ40hrmZiYJZZCcwbXjy8PSiCyt1BH44mnuhNKLI3QY7O7yjY4Y/tPOUIIPpC3COlra1CDMJTvdJt5Aazrs=
X-Received: by 2002:a05:6820:2089:b0:609:f8f1:ce61 with SMTP id
 006d021491bc7-6114ea7afd9mr2141277eaf.4.1750342066211; Thu, 19 Jun 2025
 07:07:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617-fix-use-after-free-v2-1-1fbfafec5917@oss.qualcomm.com>
In-Reply-To: <20250617-fix-use-after-free-v2-1-1fbfafec5917@oss.qualcomm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 19 Jun 2025 16:07:34 +0200
X-Gm-Features: AX0GCFv0FVByDiAsjF2r8aN4tNzKDWhpFJ_NCybzIrg5KRsxpfcfjo2wwISMV-k
Message-ID: <CAHUa44Ew0nhw4xW_K==x-9RU9VU1YzEkOghVreae11b1H4_aGQ@mail.gmail.com>
Subject: Re: [PATCH v2] tee: optee: prevent use-after-free when the client
 exits before the supplicant
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Sumit Garg <sumit.garg@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org, 
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Amir,

On Wed, Jun 18, 2025 at 6:26=E2=80=AFAM Amirreza Zarrabi
<amirreza.zarrabi@oss.qualcomm.com> wrote:
>
> Commit 70b0d6b0a199 ("tee: optee: Fix supplicant wait loop") made the
> client wait as killable so it can be interrupted during shutdown or
> after a supplicant crash. This changes the original lifetime expectations=
:
> the client task can now terminate while the supplicant is still processin=
g
> its request.
>
> If the client exits first it removes the request from its queue and
> kfree()s it, while the request ID remains in supp->idr. A subsequent
> lookup on the supplicant path then dereferences freed memory, leading to
> a use-after-free.
>
> Serialise access to the request with supp->mutex:
>
>   * Hold supp->mutex in optee_supp_recv() and optee_supp_send() while
>     looking up and touching the request.
>   * Let optee_supp_thrd_req() notice that the client has terminated and
>     signal optee_supp_send() accordingly.
>
> With these changes the request cannot be freed while the supplicant still
> has a reference, eliminating the race.
>
> Fixes: 70b0d6b0a199 ("tee: optee: Fix supplicant wait loop")
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> ---
> Changes in v2:
> - Replace the static variable with a sentinel value.
> - Fix the issue with returning the popped request to the supplicant.
> - Link to v1: https://lore.kernel.org/r/20250605-fix-use-after-free-v1-1-=
a70d23bff248@oss.qualcomm.com
> ---
>  drivers/tee/optee/supp.c | 110 ++++++++++++++++++++++++++++++++---------=
------
>  1 file changed, 75 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/tee/optee/supp.c b/drivers/tee/optee/supp.c
> index d0f397c90242..fa39f5f226aa 100644
> --- a/drivers/tee/optee/supp.c
> +++ b/drivers/tee/optee/supp.c
> @@ -9,6 +9,7 @@
>
>  struct optee_supp_req {
>         struct list_head link;
> +       int id;
>
>         bool in_queue;
>         u32 func;
> @@ -19,6 +20,9 @@ struct optee_supp_req {
>         struct completion c;
>  };
>
> +/* It is temporary request used for invalid pending request in supp->idr=
. */
> +#define INVALID_REQ_PTR ((struct optee_supp_req *)ERR_PTR(-ENOENT))
> +
>  void optee_supp_init(struct optee_supp *supp)
>  {
>         memset(supp, 0, sizeof(*supp));
> @@ -102,6 +106,7 @@ u32 optee_supp_thrd_req(struct tee_context *ctx, u32 =
func, size_t num_params,
>         mutex_lock(&supp->mutex);
>         list_add_tail(&req->link, &supp->reqs);
>         req->in_queue =3D true;
> +       req->id =3D -1;
>         mutex_unlock(&supp->mutex);
>
>         /* Tell an eventual waiter there's a new request */
> @@ -117,21 +122,40 @@ u32 optee_supp_thrd_req(struct tee_context *ctx, u3=
2 func, size_t num_params,
>         if (wait_for_completion_killable(&req->c)) {
>                 mutex_lock(&supp->mutex);
>                 if (req->in_queue) {
> +                       /* Supplicant has not seen this request yet. */
>                         list_del(&req->link);
>                         req->in_queue =3D false;
> +
> +                       ret =3D TEEC_ERROR_COMMUNICATION;
> +               } else if (req->id  =3D=3D -1) {
> +                       /*
> +                        * Supplicant has processed this request. Ignore =
the
> +                        * kill signal for now and submit the result.
> +                        */
> +                       ret =3D req->ret;
> +               } else {
> +                       /*
> +                        * Supplicant is in the middle of processing this
> +                        * request. Replace req with INVALID_REQ_PTR so t=
hat
> +                        * the ID remains busy, causing optee_supp_send()=
 to
> +                        * fail on the next call to supp_pop_req() with t=
his ID.
> +                        */
> +                       idr_replace(&supp->idr, INVALID_REQ_PTR, req->id)=
;
> +                       ret =3D TEEC_ERROR_COMMUNICATION;
>                 }
> +
>                 mutex_unlock(&supp->mutex);
> -               req->ret =3D TEEC_ERROR_COMMUNICATION;
> +       } else {
> +               ret =3D req->ret;
>         }
>
> -       ret =3D req->ret;
>         kfree(req);
>
>         return ret;
>  }
>
>  static struct optee_supp_req  *supp_pop_entry(struct optee_supp *supp,
> -                                             int num_params, int *id)
> +                                             int num_params)
>  {
>         struct optee_supp_req *req;
>
> @@ -153,8 +177,8 @@ static struct optee_supp_req  *supp_pop_entry(struct =
optee_supp *supp,
>                 return ERR_PTR(-EINVAL);
>         }
>
> -       *id =3D idr_alloc(&supp->idr, req, 1, 0, GFP_KERNEL);
> -       if (*id < 0)
> +       req->id =3D idr_alloc(&supp->idr, req, 1, 0, GFP_KERNEL);

I'd prefer only assigning positive values to req->id. Even if
idr_alloc() might never return -1 it's still a bit messy.

Cheers,
Jens

> +       if (req->id < 0)
>                 return ERR_PTR(-ENOMEM);
>
>         list_del(&req->link);
> @@ -214,7 +238,6 @@ int optee_supp_recv(struct tee_context *ctx, u32 *fun=
c, u32 *num_params,
>         struct optee *optee =3D tee_get_drvdata(teedev);
>         struct optee_supp *supp =3D &optee->supp;
>         struct optee_supp_req *req =3D NULL;
> -       int id;
>         size_t num_meta;
>         int rc;
>
> @@ -223,16 +246,47 @@ int optee_supp_recv(struct tee_context *ctx, u32 *f=
unc, u32 *num_params,
>                 return rc;
>
>         while (true) {
> -               mutex_lock(&supp->mutex);
> -               req =3D supp_pop_entry(supp, *num_params - num_meta, &id)=
;
> -               mutex_unlock(&supp->mutex);
> +               scoped_guard(mutex, &supp->mutex) {
> +                       req =3D supp_pop_entry(supp, *num_params - num_me=
ta);
> +                       if (!req)
> +                               goto wait_for_request;
>
> -               if (req) {
>                         if (IS_ERR(req))
>                                 return PTR_ERR(req);
> -                       break;
> +
> +                       /*
> +                        * Process the request while holding the lock,
> +                        * so that optee_supp_thrd_req() doesn't pull the
> +                        * request out from under us.
> +                        */
> +
> +                       if (num_meta) {
> +                               /*
> +                                * tee-supplicant support meta parameters=
 ->
> +                                * requests can be processed asynchronous=
ly.
> +                                */
> +                               param->attr =3D
> +                                       TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_I=
NOUT |
> +                                       TEE_IOCTL_PARAM_ATTR_META;
> +                               param->u.value.a =3D req->id;
> +                               param->u.value.b =3D 0;
> +                               param->u.value.c =3D 0;
> +                       } else {
> +                               supp->req_id =3D req->id;
> +                       }
> +
> +                       *func =3D req->func;
> +                       *num_params =3D req->num_params + num_meta;
> +                       memcpy(param + num_meta, req->param,
> +                              sizeof(struct tee_param) * req->num_params=
);
> +
> +                       return 0;
>                 }
>
> +               /* Check for the next request in the queue. */
> +               continue;
> +
> +wait_for_request:
>                 /*
>                  * If we didn't get a request we'll block in
>                  * wait_for_completion() to avoid needless spinning.
> @@ -245,27 +299,6 @@ int optee_supp_recv(struct tee_context *ctx, u32 *fu=
nc, u32 *num_params,
>                         return -ERESTARTSYS;
>         }
>
> -       if (num_meta) {
> -               /*
> -                * tee-supplicant support meta parameters -> requsts can =
be
> -                * processed asynchronously.
> -                */
> -               param->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT |
> -                             TEE_IOCTL_PARAM_ATTR_META;
> -               param->u.value.a =3D id;
> -               param->u.value.b =3D 0;
> -               param->u.value.c =3D 0;
> -       } else {
> -               mutex_lock(&supp->mutex);
> -               supp->req_id =3D id;
> -               mutex_unlock(&supp->mutex);
> -       }
> -
> -       *func =3D req->func;
> -       *num_params =3D req->num_params + num_meta;
> -       memcpy(param + num_meta, req->param,
> -              sizeof(struct tee_param) * req->num_params);
> -
>         return 0;
>  }
>
> @@ -297,12 +330,19 @@ static struct optee_supp_req *supp_pop_req(struct o=
ptee_supp *supp,
>         if (!req)
>                 return ERR_PTR(-ENOENT);
>
> +       /* optee_supp_thrd_req() already returned to optee. */
> +       if (IS_ERR(req))
> +               goto failed_req;
> +
>         if ((num_params - nm) !=3D req->num_params)
>                 return ERR_PTR(-EINVAL);
>
> +       req->id =3D -1;
> +       *num_meta =3D nm;
> +failed_req:
>         idr_remove(&supp->idr, id);
>         supp->req_id =3D -1;
> -       *num_meta =3D nm;
> +
>
>         return req;
>  }
> @@ -328,9 +368,8 @@ int optee_supp_send(struct tee_context *ctx, u32 ret,=
 u32 num_params,
>
>         mutex_lock(&supp->mutex);
>         req =3D supp_pop_req(supp, num_params, param, &num_meta);
> -       mutex_unlock(&supp->mutex);
> -
>         if (IS_ERR(req)) {
> +               mutex_unlock(&supp->mutex);
>                 /* Something is wrong, let supplicant restart. */
>                 return PTR_ERR(req);
>         }
> @@ -358,6 +397,7 @@ int optee_supp_send(struct tee_context *ctx, u32 ret,=
 u32 num_params,
>
>         /* Let the requesting thread continue */
>         complete(&req->c);
> +       mutex_unlock(&supp->mutex);
>
>         return 0;
>  }
>
> ---
> base-commit: 3be1a7a31fbda82f3604b6c31e4f390110de1b46
> change-id: 20250604-fix-use-after-free-8ff1b5d5d774
>
> Best regards,
> --
> Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>
