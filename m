Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6366C269AFD
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 18:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746471139; cv=none; b=UYqbddQ7aYbiM7m1y6vwF9BF4GpCREBLKijf1G3MoyVHNtibPBgipbUPhjP2vUvJLcxyv7RRr8/CtKzgYFjP8XYTjHzdN9gQTJPkvppzvHgQnoo+dfnKvSuBSHzQN7IP3dZg6VZKX/iWkvgpmJVljiEUMdJs4xa1pm+VrlPwTM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746471139; c=relaxed/simple;
	bh=m3tQ3hZJYnMzPO4y+s2VpjGqh6WHCBpq3I/dc4g6Oes=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dM29kucm6ImCrN9yoV2FuFDXqGhM6uvnbHX+rHXDRw7u854J9slDMGxsujL6LIhrFPPt+/Ld6jelfjRF9UqD8ZV+Cx7vTsjkt11yk1L9KyzCtW1NATaLyj7wGY9OhgI4QxDkH/0TyGkILnL/wtD91zPUkEWO2K6DjudP9b4XNBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HN8qICtR; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HN8qICtR"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cf3192d8bso11885e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 11:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746471135; x=1747075935; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kq8N4IwDeGXxtwbRB69apATuqmtzAPEZMQ/DbUjBjiU=;
        b=HN8qICtRrcIGAQ1fEaKHQSaj9hNs9JyuLjdkzwNzR7ECnSVktoJenme9cH0iCosvf5
         MPEW+LUZz+oBJ1rYufg/A7Aq/eEUVrqLMch6+9YUkmLAtM/tQ3PXtexAa4RDsFJ/QiFe
         HBQQOEhBVUBqwvRb5sBwRHz1bWvMsDHUgHRDQ85f0pX9biqUWlsaYgErtOMXcSGTA86G
         ooWgpR6eqHP9lDB7TPslPEqpCKo0K9Pg75Wdy0uDcBEffEufLEjf/CNezT8eCjvXXNnt
         nebeAviw1YKsS39fMUprPDwO5qp0hjqSoBK7c44CIVupi5v0i/qMSqDGJBULXWqJibPO
         HM7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746471135; x=1747075935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kq8N4IwDeGXxtwbRB69apATuqmtzAPEZMQ/DbUjBjiU=;
        b=SkUrEhDNAmhwzj2WwZuvkK1QdQaIBR6BLBhSxeXH9XGqqixIr+fCQ1zRGVi3QG7mgn
         jEi5zGPTkMDZCItchrrcJrIwsZI+VTebLfecirBI9Yn1XR5oOuGqJO9LuuuR/Ugh78Zq
         DQlP8suvCaBM/F7dAuxnnrzkqb/pNXQ38pUw6da7TXxJER9iV9gOc9FEwR8nHj+nF5ef
         Skf4b1Yr6wyP4NPmVP15C4GYqc2O7GfSPdFEKeWL2xDpvZ+XP7RoB2dCj2gdXE1w8GKR
         9dRlVHQSaFm4jrK052wVa5YfC/li6eLJiuMXV+3/qDSswS/+b5XW10RDd6gEOAawG0YQ
         cquA==
X-Forwarded-Encrypted: i=1; AJvYcCVvxc0odqVB3St3Q1WQGSoTN/qvbi3D8aJGssDvWN7iJfirZkzPCWOarjgKKVpC/UHuKwmGlEFQ7WsUdZg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaptqZiVi3wn4TkqiWSsdCLe0vjld3IHzrouznA8CdHM8dFkAe
	Ya5m+dmvn44yk949HkRs7KADXbqJZ7ZXBZWqU3UOPxr3JYtjKHxuz+4Hu/JZJBRGkYtXcLwrtqN
	aLVlJeAXfXOmey9n39fkMSNpu/MIePTdHwe9x
X-Gm-Gg: ASbGncvt7WejvG5c3qPTWxaPI+Ho61T8j5vlx/WTjyMXEGzTuA7xjBU4oLVMWyRtF4r
	pcW4nNtcB2Br/vIqprtW1MDWeFR6dixQrMAj936KbkB7XxM5XkncFvHEWQZelnqh8g+LpPUyPV/
	shXSXO1ogt9oiDoYaBRXt0w9nwVuHiGYP18eGaMLKx+TAiZcrA1K+Uzyg0
X-Google-Smtp-Source: AGHT+IFAdoTm0XbjFIN/TiU1DX3Der4L/hKLRQeHwY6Q8R8vK/UDGU8xzlXhfEjWEXdnw8Bz51ruaDUr+YHH69/Jbpg=
X-Received: by 2002:a05:600c:c8:b0:439:9434:1b66 with SMTP id
 5b1f17b1804b1-441d0716a91mr87675e9.1.1746471135361; Mon, 05 May 2025 11:52:15
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250505-tcpm-v2-1-71c6a21596b4@pengutronix.de>
In-Reply-To: <20250505-tcpm-v2-1-71c6a21596b4@pengutronix.de>
From: Kyle Tso <kyletso@google.com>
Date: Tue, 6 May 2025 02:51:58 +0800
X-Gm-Features: ATxdqUGd-hdpklhNUC-Nwsyj7IBeQwMAXTkRRXjdtLp2T7gNzQdx7rqgc3_skzk
Message-ID: <CAGZ6i=0Sw7egvUFxr273GW+Z+oqYj1EBKyw8QC0XyuAU86TWvg@mail.gmail.com>
Subject: Re: [PATCH v2] usb: typec: tcpm: detect orientation in debug acc mode
To: Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc: Badhri Jagan Sridharan <badhri@google.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 1:33=E2=80=AFAM Michael Grzeschik
<m.grzeschik@pengutronix.de> wrote:
>
> For the debug accessory case, the orientation can be detected by reading
> the cc resistor values. The will be TYPEC_CC_RP_DEF and TYPEC_CC_RP_1_5
> in sink mode and TYPEC_CC_RA TYPEC_CC_RD in src mode.
>
> Fixes: 64843d0ba96 ('usb: typec: tcpm: allow to use sink in accessory mod=
e')
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> ---
> Changes in v2:
> - Added fixes tag as suggested by gregkh
> - Link to v1: https://lore.kernel.org/r/20250505-tcpm-v1-1-e6142985a012@p=
engutronix.de
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.=
c
> index 784fa23102f90..478e9c80fc8c2 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -611,6 +611,12 @@ static const char * const pd_rev[] =3D {
>  #define tcpm_port_is_sink(port) \
>         (tcpm_cc_is_sink((port)->cc1) || tcpm_cc_is_sink((port)->cc2))
>
> +#define tcpm_port_is_debug_pol_cc1(port) \
> +       ((tcpm_port_is_sink(port) && \
> +        (port->cc2 =3D=3D TYPEC_CC_RP_DEF && port->cc1 =3D=3D TYPEC_CC_R=
P_1_5)) || \
> +        (!tcpm_port_is_sink(port) && \
> +        (port->cc2 =3D=3D TYPEC_CC_RA && port->cc1 =3D=3D TYPEC_CC_RD)))
> +

(oops I accidentally sent the mail in HTML format. Let me resend it in
Plain Text)
---

Thanks for the patch. I have a few comments.

My understanding was that TCPM in Debug Accessory Mode only supports
the port as a TS Sink. This patch seems to add orientation detection,
implying more than just a TS Sink. I thought TS Source/DRP and DTS
Sink/Source/DRP were not in the current Debug Accessory Mode
implementation in TCPM.

While full Debug Accessory Mode functionality would be great, perhaps
that should be in separate patches.

Also, for TS Sink orientation, please ensure it aligns with the Debug
Accessory Mode of Operation in the Type-C Spec R2.4 (Table B-2). It's
not solely based on Rp-def / Rp-1.5.

---
Kyle

>  #define tcpm_cc_is_source(cc) ((cc) =3D=3D TYPEC_CC_RD)
>  #define tcpm_cc_is_audio(cc) ((cc) =3D=3D TYPEC_CC_RA)
>  #define tcpm_cc_is_open(cc) ((cc) =3D=3D TYPEC_CC_OPEN)
> @@ -4569,8 +4575,11 @@ static int tcpm_acc_attach(struct tcpm_port *port)
>         if (tcpm_port_is_audio(port))
>                 state =3D TYPEC_MODE_AUDIO;
>
> -       if (tcpm_port_is_debug(port))
> +       if (tcpm_port_is_debug(port)) {
> +               port->polarity =3D tcpm_port_is_debug_pol_cc1(port) ?
> +                                       TYPEC_POLARITY_CC1 : TYPEC_POLARI=
TY_CC2;
>                 state =3D TYPEC_MODE_DEBUG;
> +       }
>
>         ret =3D tcpm_set_roles(port, true, state, role, data);
>         if (ret < 0)
>
> ---
> base-commit: 588d032e9e566997db3213dee145dbe3bda297b6
> change-id: 20250505-tcpm-41b4ba7ea0ec
>
> Best regards,
> --
> Michael Grzeschik <m.grzeschik@pengutronix.de>
>
>
