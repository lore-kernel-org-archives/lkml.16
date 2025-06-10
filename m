Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6347A2BDC14
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749559078; cv=none; b=qoKlpV1HnYEJ0uwu6PoVugVUlgPp1W4/9yFkdf8L8J421v1A8AaZU2EcsK7txHp89QG/m7y/WKNAjgs5h3zuvIF2GUV7C0Pb39djpL13F7NR24REbJJ8utsQ1+HKHePXzf51aCGkwo+/8cUyxvYKzTXp5qN9AAFJTkP5xOpEIVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749559078; c=relaxed/simple;
	bh=VOzkxpypoaAOmED5Y3QuE5bGmiiKDU7pwO5eKvb2ZuM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p9QT4ZfyplYS5SAj1da02EC2jCNYru/guB+PtUpx6Na9tez8Eqs5KJTElAA2goO+vDamygXVyn3NNwslKkNaeV8SwCi693MRoG2HEQrTwV8W+7RUTUOWEdjK5RRe3PFEsn9QQDkpYsRmg6Y+81FmZfCw1P3tW7WIj/+ZFcwzWE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=D76MU4v0; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="D76MU4v0"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55365c63fa5so4605093e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 05:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749559071; x=1750163871; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VErfzveBAbUjLmCpN+lf4azG2Ow/Gi7oziw0c95kQ9c=;
        b=D76MU4v0x7KrvFIpmQoc15Ji/8GcEmESzluWpiVkOyZfK0bh1eds1JcvuhET3mAmHJ
         Kb5bSVyqCeRQ/FpSzADOk9cpgJO7TTujuZxkVmqgHx3M3pp3HzklhIGEZE22iBWZJHon
         PeKvTwvND4YJts4kPyMaB1qC678Ap7XN20LeA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749559071; x=1750163871;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VErfzveBAbUjLmCpN+lf4azG2Ow/Gi7oziw0c95kQ9c=;
        b=Pg1VtQ8Pg0EZkBDsqAjkR80wKYaLG+Y8G+TrXnSu0OWk0qVQWactiTBJqd/Rjz4fGg
         xlgc1DJkkYUkJoCOqra3LgscH/gwyDjEeOQ3hh2M83cEqm1y71DbCcX/u5tNgQN1hcMA
         iKRqFZg4ie3TtzuOmqm7ktlldoJ+4rUAbQnM4HSX/sXxIqkpat6a8ISxhs+6nXeKpXty
         oakK6gggegCwOMEIHoKIZqYZTP1hizKxcx2C5cMI0xc+w2osYcVD64su4tNBCj3XrJvX
         OgSRBMtvnTH+uln2aAkB98/YfFzvZWzyhqCFzdO7mmNdNb6zwYmOrS+6R08OvEeuaw3Z
         Mmyg==
X-Forwarded-Encrypted: i=1; AJvYcCVWgnLntX8UWWS123Nn2w8GmtEm90yWeu3/R0CvH8/UNToRPIAAin/uYvrMTpvGzgYo8CwjT7U33B8DnVQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk/e+yAfHjkVCLLOaJpMIkgcXWSkFFQtfWLmo9DjpXrYNpKVNX
	qThREVyzHeD4S5AGpq2M+5ztMbvuOqOTgE2p/z9QJCDPOD1EdMTtfP0AxkqNUVUfYQpHG7ITjKn
	M75Y=
X-Gm-Gg: ASbGncs9tV/Jxk9B6ORHiVVO544PmlI5dWk/CW6KQTgVb0L6+606QESOQEX0dTuKRdF
	rTx8eXISjfD3bSQKB1OkxeOtsz7HBS4dsX8tdxs8q/tYjtjV5Gje8HCTbaUYtg+Zw//+1J5S77R
	LVOc1Q/3VtvDmPEG1KTh67PSQA+BVkqZbvtuC6I7TkrLvrP8J2eOoNx7CRIp1MaUv1FfSUP2Xf1
	1biNqAz6gc1ea5RILW07nIpo/NWZWvYWiB+BnQ4ZOMmojQLTiMy6yCfRWE/H01PDUki7XuuJzAT
	meDqBEN1BV7grmgOcaW4dj3eu7pbEzLlSfcizS/b8nLV6wREJiuv6xFxPxi+FazOI+0QsdpJgMm
	PTyTnVAdwH+9dPUEFqFoLhUUn
X-Google-Smtp-Source: AGHT+IEdyz5baFF+tP7pwz1yZVjq2mVr3rMKWewc9niTOjr/vOOgB0vp/bFU+nij/ve0/kcQpv4ksg==
X-Received: by 2002:a05:6512:2242:b0:553:3892:5ec3 with SMTP id 2adb3069b0e04-55366c354f4mr4291820e87.46.1749559071016;
        Tue, 10 Jun 2025 05:37:51 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55367731785sm1534773e87.216.2025.06.10.05.37.50
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 05:37:50 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-551fc6d4a76so5787411e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 05:37:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXK3Vsh7dQtPYDV8cGr0fMSBuOU4c0hNBG97Wr3GClShJ+CE1pghs8i+K9M224GKG0c6+FT2K5b3ELvHCU=@vger.kernel.org
X-Received: by 2002:a05:6512:3c8b:b0:553:279b:c55d with SMTP id
 2adb3069b0e04-55366c2ff61mr4456065e87.45.1749559069957; Tue, 10 Jun 2025
 05:37:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250610123532epcas1p24565e694897b17a36ad04752b7dd8678@epcas1p2.samsung.com>
 <20250610123526.37316-1-yjjuny.lee@samsung.com>
In-Reply-To: <20250610123526.37316-1-yjjuny.lee@samsung.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Jun 2025 14:37:37 +0200
X-Gmail-Original-Message-ID: <CANiDSCsTm7-kxS0C6H_JY7NnC3z73Qg9L7d6M37p4Zao1+96EA@mail.gmail.com>
X-Gm-Features: AX0GCFt5eSrh6Ot3mJNfS0FZ18dU3T5t8BB_D6IPh7jhlV2rISHnMB5fsHFWlWU
Message-ID: <CANiDSCsTm7-kxS0C6H_JY7NnC3z73Qg9L7d6M37p4Zao1+96EA@mail.gmail.com>
Subject: Re: [PATCH 2/2] usb: uvc: Fix 1-byte out-of-bounds read in uvc_parse_format()
To: Youngjun Lee <yjjuny.lee@samsung.com>
Cc: laurent.pinchart@ideasonboard.com, hdegoede@redhat.com, mchehab@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I think you mean v2 not 2/2

On Tue, 10 Jun 2025 at 14:35, Youngjun Lee <yjjuny.lee@samsung.com> wrote:
>
> The buffer length check before calling uvc_parse_format() only ensured
> that the buffer has at least 3 bytes (buflen > 2), buf the function
> accesses buffer[3], requiring at least 4 bytes.
>
> This can lead to an out-of-bounds read if the buffer has exactly 3 bytes.
>
> Fix it by checking that the buffer has at least 4 bytes in
> uvc_parse_format().
>
Fixes: c0efd232929c ("V4L/DVB (8145a): USB Video Class driver")
Cc: stable@vger.kernel.org
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Youngjun Lee <yjjuny.lee@samsung.com>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index da24a655ab68..1100469a83a2 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -344,6 +344,9 @@ static int uvc_parse_format(struct uvc_device *dev,
>         u8 ftype;
>         int ret;
>
> +       if (buflen < 4)
> +               return -EINVAL;
> +
>         format->type = buffer[2];
>         format->index = buffer[3];
>         format->frames = frames;
> --
> 2.43.0
>


-- 
Ricardo Ribalda
