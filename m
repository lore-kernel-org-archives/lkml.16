Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C60B67F
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 15:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748446335; cv=none; b=j3wPHMTXEq+asVLL+9VirLkUfXOOHDToiBvpNhVPA3WfCjI5ixSX1vOrnAV9tU5clLnaOCzm0njunaYmcoUyZV1axrqObHkGf2/XJE7IfDnCMqAZDQei0MwFt7ljC8yfyHhh4Obcd9Pp+NVOX3PoEFGp+qm11XtDAjcXTZJ5lF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748446335; c=relaxed/simple;
	bh=bVZWbWbdtxNARBlRvaf7tW5wgarLs2PVbXesCu5ZPMg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c9GpBSv5DjFFC+fdMOVQnXHODmemYpurzxADJMHHFj971saHQhteO6Q2pK2GRZ9+l4zFev+d4MUdN01yJ3z4+PhhO/ueCW1qwzo7cxHZp4zKu1kzCmvNmN4C8umLrLfxqtQL9HCl5buV0obItdTTfvLzdxQaCfQEvQH9SuD/meU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZsGn4nAN; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZsGn4nAN"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6021e3daeabso1970909eaf.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748446332; x=1749051132; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cb+ihaPPmQVbulXLOR62KX//ccgvrqS85TAFiwCoIuQ=;
        b=ZsGn4nANVICjarlN71LNuk5Dzp7nBLEEJWbNeh06mQIJrWPZSUpw0/9ncMrx4kuVoI
         TKiEv2sUafOtS/B7l/OJUrN9989c/j00s3xVC2g52fwFm4i8e94KrQVWjIxXZpAOBsr7
         MnEN37C54L/CmBGWEkzDXci0xibeogcCmmavyEq5zlsFJyaTP8pCCamiz+YptX0/1vrs
         KC2MHRGokiW5ABiy9rcGmDnB6+jRfuuzUeWR9PYXagOkvp6vJD7zYFOYFL+emfx3KBMg
         h8jbCKf6haQgXJgu12fT3oj4p7RdRTQlM7X4ZOygH6v40kpn2bxnkk8GFFR9SyJXB+h6
         emfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748446332; x=1749051132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cb+ihaPPmQVbulXLOR62KX//ccgvrqS85TAFiwCoIuQ=;
        b=Dl81Z1b4jznpb51soD2MjxbhcWjeS6G8/iBmory5N7qrh64/DjCQJUZv3nD9UQWfrE
         2dl6Ux6VbyM6uEddLy1zHuYIZbnr7BY9NAO3yaHLUv9MwnsTLDYE9WA6k8hgGQmJh7o3
         /cs/bY1PRoePlsYlGntm/Ofq7dW5lnDXIPY0E/Skfptc2TRZNeKVBk7o2hZhgKQQBS5q
         Q3teJSv0EclDRKWV+UqOn9B0spLodVyaMwhSMi+GuJfjfldy0ChaEF05E7mSWC+eSd8K
         ManypL8dZ2VU05KEWiHjF+9VpxT8+H2es1S/L3gMlTKQwiiBsR0dhGnJ/rOpiGUyaY9T
         BISw==
X-Forwarded-Encrypted: i=1; AJvYcCWYLU2jCm8R3foh5UUGkMcgG1hhP6QMcMIz19dnxR9OoItN7CpOoe1Ja+AfhfcG51DF4q5jC7EngE1Gm9A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfd0OgpHU/9dgT3GQQSractPO33edWksSpcJRQpRlRoGCIi+3v
	tdPJ500FAG7NG7qXqNbAUPY7PEhoc97ZYXhrsVBpUhiIvcsYckRI69fwlUEh/FE5ym74WoHViwZ
	5xXflllWXDKGosNvXh41odeYTO0F0tKa/uc7DNDeSJA==
X-Gm-Gg: ASbGncvKuxtOugh+10MWdzi+irb9LnKqaDrWZmr1PxExeHruoAfCMg3/FUTQmLJ7z+f
	dWlZtPnaUfvCkCrMbydODK/4oBhAKV6wN9kalfW0KWAq6GU8kHJhxu6lncYJ9IT2O6F8RtAr2Dq
	BQBIauzajyoZuh7E6ORFk4o+dXin9mpuEPo0ffs+Lfq/a1
X-Google-Smtp-Source: AGHT+IHos1eUXPNGq8QWNr3OlSfg08FeZc8yyAKgwIPQGRrtKDPbJcRtS5J+HBCvWMuhSahRXfI9s7LR2jgTHuEkGDU=
X-Received: by 2002:a4a:e90d:0:b0:60b:ca08:a73c with SMTP id
 006d021491bc7-60bca08a9f6mr4885192eaf.6.1748446331714; Wed, 28 May 2025
 08:32:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528-ffa_notif_fix-v1-0-5ed7bc7f8437@arm.com> <20250528-ffa_notif_fix-v1-1-5ed7bc7f8437@arm.com>
In-Reply-To: <20250528-ffa_notif_fix-v1-1-5ed7bc7f8437@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 28 May 2025 17:31:59 +0200
X-Gm-Features: AX0GCFthIY9ATOhYlJJJYtmB5ln8kzCZVSAbqSOsSj3WleMn715mhuNyhb1d304
Message-ID: <CAHUa44HPpS0QVwtSGhOJDK-t+0v26V6kdXwERcNM1fbkBxK--w@mail.gmail.com>
Subject: Re: [PATCH 1/3] firmware: arm_ffa: Fix memory leak by freeing
 notifier callback node
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?B?SsOpcsO0bWUgRm9yaXNzaWVy?= <jerome.forissier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 10:50=E2=80=AFAM Sudeep Holla <sudeep.holla@arm.com=
> wrote:
>
> Commit e0573444edbf ("firmware: arm_ffa: Add interfaces to request
> notification callbacks") adds support for notifier callbacks by allocatin=
g
> and inserting a callback node into a hashtable during registration of
> notifiers. However, during unregistration, the code only removes the
> node from the hashtable without freeing the associated memory, resulting
> in a memory leak.
>
> Resolve the memory leak issue by ensuring the allocated notifier callback
> node is properly freed after it is removed from the hashtable entry.
>
> Fixes: e0573444edbf ("firmware: arm_ffa: Add interfaces to request notifi=
cation callbacks")
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  drivers/firmware/arm_ffa/driver.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

>
> diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa=
/driver.c
> index fe55613a8ea993378474671d3c5756309da34fbc..6f75cdf29720993b1cd95eb7d=
3a36d01b0fdd1de 100644
> --- a/drivers/firmware/arm_ffa/driver.c
> +++ b/drivers/firmware/arm_ffa/driver.c
> @@ -1284,6 +1284,7 @@ update_notifier_cb(struct ffa_device *dev, int noti=
fy_id, void *cb,
>                 hash_add(drv_info->notifier_hash, &cb_info->hnode, notify=
_id);
>         } else {
>                 hash_del(&cb_info->hnode);
> +               kfree(cb_info);
>         }
>
>         return 0;
>
> --
> 2.34.1
>
