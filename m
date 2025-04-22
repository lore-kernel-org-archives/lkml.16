Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4691527CCF3
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 12:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745325904; cv=none; b=Gkv6Ynh4RedSCeuGYLpecvbYcBYRSSfr0I6s7yMa9pq7+Pg+Gki0SV7eFcHcoLk43NIamXHc2Z8WnASqjd4bw2Qp1F5WIoZUdnt7fN3nXTJ+bKReY61i9+31227fwU4LI8505uDYFO396yLYz5cEyOMwueiCqb8zOgvmcq2KRLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745325904; c=relaxed/simple;
	bh=lvVUs2e8qcPQTdzhT6lkVZyLMX8afuB3KeEklSE+EdY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HjdZOBq3L5ZYeMgiVWTMY1wHJW6ZdX2Ux1HuDcboq9dbmtsVkN/UySyZQyhta5xwFldLZt+cIEj9M1b/1Sfkqw29JGV02UiFynJuRtO79WOHSZFvu52nScA3pEnfcprhsc1ZLVBsGjsGKZajjAXqCaSPe67dCvpCVSGN5GwG15U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fWmZqBKf; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fWmZqBKf"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-af50f56b862so3593461a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 05:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745325902; x=1745930702; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qmv/eppcSNS/FFA0D45HtnI0orFklOBEuu+IeQXnzag=;
        b=fWmZqBKfcVm9Zp/MwvaHYhnjmMUouOb8b5QDbOFiozNH+mQhQ4y4BETQeLOhDm7r0E
         8JtBR3nouN+YzHSlPTm8oieEOqQPmz4rlC9747rrPqviTxNHW3tU1sHepxysWshSxpef
         h9oz+YKITS0SAxIKKAP+mfn3wckbMuYRZZDEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745325902; x=1745930702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qmv/eppcSNS/FFA0D45HtnI0orFklOBEuu+IeQXnzag=;
        b=gIRYqGZoSpVzxwupN9lPlrf/bfPWBbBH0NO8NSTOzcBkLzBAkIKvROkcIjPZ7Hi45d
         I+mAOz+mSzWWnwTKhtinNHg1J/PL4zTisXz+zVOHpVnDxWZaACK+AymUbeROmGqR1SBJ
         9iQVtkrP7LFfCf4Pl+tvdLB0xdxQP4vb4LsxkGXuQ/gD6nil1tDSkqHYdswoXg2FTykJ
         EnXd9XK7IdOUWBu3w9Jq8Vs3DcQb4ESiy7WI/tHVp5cMm9W4NXOaI5uf9AqiT2D/rxiV
         qrA+xmWxZUhWoNKl1ofNTaLzulH6IWDxqWzMQXbtN20eFnYLCmoe8ruPdPuzZwj0yZNy
         BJtg==
X-Forwarded-Encrypted: i=1; AJvYcCVbhfdpd80pgPl8CqAhceYN32w50yn1/NCaAgGS2g3dDg4zUdYlkAet3K1IzZdO0Av23UPGwL0n+oZa2yI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQUenEDR7TAwqoWVg2gb3vlaL+p5fcB33LVWGjc3/euJuKJy+s
	mEy0s/IpHodMpXVOpF6S1kuCgFJ7IW2vBnm3O+ofBu8H6nxVorsrU9Dqq/gJ0thrvuZmf9wvTvz
	AOW+iQ55+OVOW5lFA4bGsv1fO/GpNxQ2H1RxF
X-Gm-Gg: ASbGncuH1XR3wZHQUibkfMVlGr3r/w3P9374cii8ZHWTbnNxmqh/f2gcWwAHpt+lKNk
	SE50vyYiqWijOQDwfa9X1JU9GNn7mWtlFajx93w8mBsfQGtxhUIYF6wlAJViQrSb7/wJk6XgE6y
	/I1LsxrV552E+bmxY9fVumQ36PfFWHHcGAKQ4bC4N7kJgq2L88
X-Google-Smtp-Source: AGHT+IHdTmSx9iS8EFu6hmVr5iQxagekadUQmWy2iPg8Fc4WAFCXivKqI/RbGAfgFTHhUvSFDjFlF3H8NSEt9mNdC88=
X-Received: by 2002:a17:90b:57e6:b0:301:1bce:c252 with SMTP id
 98e67ed59e1d1-3087bbbccb6mr20807109a91.27.1745325902515; Tue, 22 Apr 2025
 05:45:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z_44tOtmml89wQcM@stanley.mountain>
In-Reply-To: <Z_44tOtmml89wQcM@stanley.mountain>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Tue, 22 Apr 2025 14:44:51 +0200
X-Gm-Features: ATxdqUHpL8I3vcFgpkU4A33HaV238Xv7lz1t0Ca9ja9K4i3LKe-c37qpW_-DVJY
Message-ID: <CAMMMRMf0DtXaG4-qkUfAUNEB8sM-oV2Qg5E_3cPr=yjL3fLo4w@mail.gmail.com>
Subject: Re: [PATCH next] usb: typec: class: Unlocked on error in typec_register_partner()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benson Leung <bleung@chromium.org>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 12:45=E2=80=AFPM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
> We recently added some locking to this function but this error path
> was accidentally missed.  Unlock before returning.
>
> Fixes: ec27386de23a ("usb: typec: class: Fix NULL pointer access")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Andrei Kuchynski <akuchynski@chromium.org>
> ---
>  drivers/usb/typec/class.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 3df3e3736916..67a533e35150 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -1056,6 +1056,7 @@ struct typec_partner *typec_register_partner(struct=
 typec_port *port,
>         ret =3D device_register(&partner->dev);
>         if (ret) {
>                 dev_err(&port->dev, "failed to register partner (%d)\n", =
ret);
> +               mutex_unlock(&port->partner_link_lock);
>                 put_device(&partner->dev);
>                 return ERR_PTR(ret);
>         }
> --
> 2.47.2
>
