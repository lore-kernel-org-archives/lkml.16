Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB871386DA
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 15:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748446444; cv=none; b=lUq8YoNAoc6MNdfuRpPG6adLFR1LHguCCXioLYBIG0iZsj0sF9atl8wkHQPP3JyifxJUMeHgDYPbMtdudspE1h+WDcIAr1ISbRZ8tIF3D4ZgGrfM40TKoIVByiJoDKH39Ibezqs/a3BjJrwdwovaYmUE3bUmWrBMtHBmCC83xkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748446444; c=relaxed/simple;
	bh=laYJuFM4eLBzK/hSo8mP/zT12GWa0px3gKlSTXf+dow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=myeLEVDZRrHbVGlf2reACZZmLihWU5t3l3UPNvsXci4fNJHzDzDJD1QuTdqMg4pm3oR8IsaY1kMTYcnkudZE8egpHIu4p3s2FuARPUe9UEqOimqGAgZCS493exSgfmGFRmXiFNpQzs3lxF/aVSV6liLyo/DD530y8rWRqdegDLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=StQ1NndZ; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="StQ1NndZ"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3f6dccdcadaso3172597b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748446441; x=1749051241; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V50E07Bshe0n5/d4A/sEnbHvwqtDL9kM998TesZAgNI=;
        b=StQ1NndZY3DQpafewG3+4jwjzZsleAsPEa6jmBr4l5q/C/r6xZzdswILAQNBSk+lAJ
         pZrEHpbaehScY9NMmqdossqHe4lXUbJdcbNyDHZ8KA9cSkwp656tzo9DhgtPikVbfHI3
         wcQbV7aQt+yElXjc3KFIDbpD3FiIQM0oVFDPX+Mm0rWa5VCGWg0L+D82qCirRrybkY+h
         uKbXVxhDa3qES3F7tdlQzDj325ZB4L/zjYjA1ZLgbyKfGveIF19pKtjYGmuGpG+fg5LI
         HDIbsF0i4R/tnAUS+U8OBwgdvueDrYwkRJ+AIFGioV9QtrE8XgP2Dcijg6MOOjDLm88s
         wkrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748446441; x=1749051241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V50E07Bshe0n5/d4A/sEnbHvwqtDL9kM998TesZAgNI=;
        b=C4IjUgnxMAjG/rf57hJxf+9GB0N07mJf6Gwh4C0m5tfHR3lGYFGx+74k0mrfekQWCn
         L5aliICbcdUw3MGtHAZWPYqvoWCrC+8c+hQD0W02Rsr1asBolUtVZ9xNdaF39Hb/a3tM
         sFtKrwe5ADG78sdneFtBIkdndeMpjfJs8AAO56jeQ3mBtcwY4SY7h10NGGMwqPjLB27C
         WfDHuOOhAr0lADnUU3LUCLcx6d68+KeikHItKHZ+s9mjAoIri8+o1ro3M5GllnIE3p6+
         YVcqoauGIcmvSEwsUcvjMiAkbP4iu6wguz6hdlIZdr1L87D4jHmCrpfGYo/5fXABGQb+
         jfSw==
X-Forwarded-Encrypted: i=1; AJvYcCWdmYDVxBCFl0v4qWkhUEpRdzzyAhnbqCEXRx9TG3A4Kpb77g6LdvQghSJkhmQcVkaAwO0LP26How8Sb1E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsvYG+ATrORovpASxBx6q2YTlZJdyiByWRVbVHELK844W10QKI
	t+5MSMx/qFOR2CIZXmSsBf4M3EZqBseRqhscVXM1UQgPjewBtEj61wdje+Hh8dnhuh2T/Rh51/f
	L4TnJeqLu1hh2QrU3ZDnQokPVh9Yvr0y2I3iE8xbdlrZn9Y0hcg9Cie4=
X-Gm-Gg: ASbGncviyf+jG3iiP0qvao/Yg9Q48LZ+RvY1qPug6Y2ylCkBBNfOEkVnYXNY2GWv+rG
	ZqhvqTPDX3bM9Q5y8JtT4Af/95SNptekDK48V96ukTuJtTPjS5YT/RhF7+Po5KtrY4j5CB39SL3
	qnDNr3tgImJ/nwwt6HFwXyYRICnNACkWc5vg==
X-Google-Smtp-Source: AGHT+IEniMZHQbxc4dt4F2x1tHo1KsHwEHrIoQNpmjaRPLITmNPATnnXVb6jvput6py+MvQ1YaI5hzeuvZZSY3OtXoY=
X-Received: by 2002:a05:6820:2004:b0:60b:a8e7:b23e with SMTP id
 006d021491bc7-60ba8e7d8damr8600114eaf.8.1748446430509; Wed, 28 May 2025
 08:33:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528-ffa_notif_fix-v1-0-5ed7bc7f8437@arm.com> <20250528-ffa_notif_fix-v1-2-5ed7bc7f8437@arm.com>
In-Reply-To: <20250528-ffa_notif_fix-v1-2-5ed7bc7f8437@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 28 May 2025 17:33:38 +0200
X-Gm-Features: AX0GCFunGnw6PrwW4snoTeu3Q1n7NKY-YLzkZ5yxhwalJKSoyFy2rAwPEsfJlg4
Message-ID: <CAHUa44EG+SPt8QgMfLmEgLgGyu-EUhd8NL-9R+nbqk9Zf_bFvQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] firmware: arm_ffa: Move memory allocation outside the
 mutex locking
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?B?SsOpcsO0bWUgRm9yaXNzaWVy?= <jerome.forissier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 10:50=E2=80=AFAM Sudeep Holla <sudeep.holla@arm.com=
> wrote:
>
> The notifier callback node allocation is currently done while holding
> the notify_lock mutex. While this is safe even if memory allocation may
> sleep, we need to move the allocation outside the locked region in
> preparation to move from using muxtes to rwlocks.
>
> Move the memory allocation to avoid potential sleeping in atomic context
> once the locks are moved from mutex to rwlocks.
>
> Fixes: e0573444edbf ("firmware: arm_ffa: Add interfaces to request notifi=
cation callbacks")
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  drivers/firmware/arm_ffa/driver.c | 48 +++++++++++++++++++--------------=
------
>  1 file changed, 24 insertions(+), 24 deletions(-)

Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

>
> diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa=
/driver.c
> index 6f75cdf29720993b1cd95eb7d3a36d01b0fdd1de..44eecb786e67b205161e2d486=
02e1f1b53533360 100644
> --- a/drivers/firmware/arm_ffa/driver.c
> +++ b/drivers/firmware/arm_ffa/driver.c
> @@ -1250,13 +1250,12 @@ notifier_hnode_get_by_type(u16 notify_id, enum no=
tify_type type)
>         return NULL;
>  }
>
> -static int
> -update_notifier_cb(struct ffa_device *dev, int notify_id, void *cb,
> -                  void *cb_data, bool is_registration, bool is_framework=
)
> +static int update_notifier_cb(struct ffa_device *dev, int notify_id,
> +                             struct notifier_cb_info *cb, bool is_framew=
ork)
>  {
>         struct notifier_cb_info *cb_info =3D NULL;
>         enum notify_type type =3D ffa_notify_type_get(dev->vm_id);
> -       bool cb_found;
> +       bool cb_found, is_registration =3D !!cb;
>
>         if (is_framework)
>                 cb_info =3D notifier_hnode_get_by_vmid_uuid(notify_id, de=
v->vm_id,
> @@ -1270,18 +1269,7 @@ update_notifier_cb(struct ffa_device *dev, int not=
ify_id, void *cb,
>                 return -EINVAL;
>
>         if (is_registration) {
> -               cb_info =3D kzalloc(sizeof(*cb_info), GFP_KERNEL);
> -               if (!cb_info)
> -                       return -ENOMEM;
> -
> -               cb_info->dev =3D dev;
> -               cb_info->cb_data =3D cb_data;
> -               if (is_framework)
> -                       cb_info->fwk_cb =3D cb;
> -               else
> -                       cb_info->cb =3D cb;
> -
> -               hash_add(drv_info->notifier_hash, &cb_info->hnode, notify=
_id);
> +               hash_add(drv_info->notifier_hash, &cb->hnode, notify_id);
>         } else {
>                 hash_del(&cb_info->hnode);
>                 kfree(cb_info);
> @@ -1303,8 +1291,7 @@ static int __ffa_notify_relinquish(struct ffa_devic=
e *dev, int notify_id,
>
>         mutex_lock(&drv_info->notify_lock);
>
> -       rc =3D update_notifier_cb(dev, notify_id, NULL, NULL, false,
> -                               is_framework);
> +       rc =3D update_notifier_cb(dev, notify_id, NULL, is_framework);
>         if (rc) {
>                 pr_err("Could not unregister notification callback\n");
>                 mutex_unlock(&drv_info->notify_lock);
> @@ -1335,6 +1322,7 @@ static int __ffa_notify_request(struct ffa_device *=
dev, bool is_per_vcpu,
>  {
>         int rc;
>         u32 flags =3D 0;
> +       struct notifier_cb_info *cb_info =3D NULL;
>
>         if (ffa_notifications_disabled())
>                 return -EOPNOTSUPP;
> @@ -1342,6 +1330,17 @@ static int __ffa_notify_request(struct ffa_device =
*dev, bool is_per_vcpu,
>         if (notify_id >=3D FFA_MAX_NOTIFICATIONS)
>                 return -EINVAL;
>
> +       cb_info =3D kzalloc(sizeof(*cb_info), GFP_KERNEL);
> +       if (!cb_info)
> +               return -ENOMEM;
> +
> +       cb_info->dev =3D dev;
> +       cb_info->cb_data =3D cb_data;
> +       if (is_framework)
> +               cb_info->fwk_cb =3D cb;
> +       else
> +               cb_info->cb =3D cb;
> +
>         mutex_lock(&drv_info->notify_lock);
>
>         if (!is_framework) {
> @@ -1349,21 +1348,22 @@ static int __ffa_notify_request(struct ffa_device=
 *dev, bool is_per_vcpu,
>                         flags =3D PER_VCPU_NOTIFICATION_FLAG;
>
>                 rc =3D ffa_notification_bind(dev->vm_id, BIT(notify_id), =
flags);
> -               if (rc) {
> -                       mutex_unlock(&drv_info->notify_lock);
> -                       return rc;
> -               }
> +               if (rc)
> +                       goto out_unlock_free;
>         }
>
> -       rc =3D update_notifier_cb(dev, notify_id, cb, cb_data, true,
> -                               is_framework);
> +       rc =3D update_notifier_cb(dev, notify_id, cb_info, is_framework);
>         if (rc) {
>                 pr_err("Failed to register callback for %d - %d\n",
>                        notify_id, rc);
>                 if (!is_framework)
>                         ffa_notification_unbind(dev->vm_id, BIT(notify_id=
));
>         }
> +
> +out_unlock_free:
>         mutex_unlock(&drv_info->notify_lock);
> +       if (rc)
> +               kfree(cb_info);
>
>         return rc;
>  }
>
> --
> 2.34.1
>
