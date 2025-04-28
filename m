Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B5727A12C
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 19:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745869695; cv=none; b=fVHVUBSldmKOMSb3ZzA+VWHYFNRQ04/BdTxhYzrWAuH16JNLHicDJkMXI3hs9Oj4TsuiDvshM12g/8OaW9XJa/Uup2u+bCHo3ygEqNOqTAFBgGC2FCXvDfC3A/d7SBIZ1cHZdRZa0IBgc/Vk88cCXOF5xhg5h3cDNyzjRgtb+7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745869695; c=relaxed/simple;
	bh=Mg1xRnun6Nm3Yam8b62+Ia011Rq5QVL8GCObfoL4pqA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S/BknFVbdQNvvhkerdBERwq9iKXl06a5an68slzzvxH83UnwNAYUyK2V6fbN4TLTqThxKittaEhBvE39VOh47lpncHjpljdp4yqBGe/A6GgOSKGT8fpazDrwEme5XMjjqawUF0QXbEg6SV4rb9lF5q7poGZ9oAwe3fOqK3ynsBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MHsiA4dj; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MHsiA4dj"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-736dd9c4b40so5515566b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 12:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745869690; x=1746474490; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G0adi9DhX8MYHy7k1qpIqlgCc21eraVmwDj/uOvVW9U=;
        b=MHsiA4djqUyMQ3HTJ3sl4MwNMhH5knFOH/gFQc/KMFM8MEFigGPrcScUvSrQbFIYW8
         ljcBqtHRuTDNmVSti9HEemX2RdnnlJCoSCjltx03TVIWNjfR4X6KZ0HeYitAUbvkcW8p
         U+4mRD7amxJanZW8eoGgPxjvYw5NJTi1aRNDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745869690; x=1746474490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G0adi9DhX8MYHy7k1qpIqlgCc21eraVmwDj/uOvVW9U=;
        b=FlRdHctWDAiUzKvY+6w+yKqRi7tb/jpWlto6fu3JujEL7ZU0qIbwcWIhVovZ4I8zd2
         LtZtkaA6YGLOJFZFzgBIAoj/+EmrkIcRvDAeOTgjPCuJ4U4rKXdGs5QBEgcLDz2xRZO3
         5f4fwrsHcBpNDhVZWwv7uW/t9K0ijrX1tHYP8eJcQQHUv/IchnYKmIN9iwsVT9qYEsUJ
         +2kC9SxClQXTynj3vc0pZgv4YnBp40J4jlaxsecTe/Zr1GERhty5CpY4yyKam4FxdNkI
         6XwnUw6cbuPrQr3PNp9losapgmMKOc5PXONV/cGh6PvPTi2ecy4JtL3gAlcPWOZy6Ru7
         qnEg==
X-Forwarded-Encrypted: i=1; AJvYcCXJFWcBaU28bNoIz2Dp8NTKZJgALPyiuxVd0K6/s+MCjBc7kmN32V0eJC5aAFE3tEk6lhJSB1QRglr1Pac=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJYL31Rjjq7inJ17m2Fzlkmjg1gqzgUF2D1M1cXHMC+TuefJSP
	EX+9YJyyKYVd20x/pvULn/vdmcsN666s1k1jn2iYJ15exMN+5xRUet9HJ4CaKEB70v2ySF3E/4A
	=
X-Gm-Gg: ASbGncv8dEOZ3WEjw2JPzHk63cliukAQW+xE791MDr+ksSU/IKXYVXN67/CQijQUcKT
	hWeMfSfAibJkUtcS0qEmdI8V89ZTMrWlvQJrHLiz9P4Fa7TsSm1pvEBXP/SUIFvAvq8uLzcue28
	LU6bIyB4nTT61itRHPfKwWW5j6pwK9RmIuz1Knj2l9hiClDt1DbLagoGbcN7ibWgoPWoBxk1gbe
	tDteKawHL8x15EGGqeRISjt2TaTgLR8X/ofs06q86dsgk7ir86yd5wv3+uUYw65vLwLfNrGFC5G
	QvmR0eKuAAghoMNKFb3Ltpga3UPU4LWr6Gy5gJDj5YrpcJIMMiaeoLgj2pux33rkIZ2mpZavntu
	AzSuep+dT
X-Google-Smtp-Source: AGHT+IGv7lfjzYFkPBfwB5MqVmpx4cs9rXnFVfyEjkZOccJaM+38K1VRWnvl3QCkNZyRjnN3mJ+99g==
X-Received: by 2002:a05:6a00:3246:b0:73e:356:98b0 with SMTP id d2e1a72fcca58-74028ac56a3mr544263b3a.8.1745869690310;
        Mon, 28 Apr 2025 12:48:10 -0700 (PDT)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com. [209.85.214.174])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25aa16cbsm8414923b3a.155.2025.04.28.12.48.08
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 12:48:08 -0700 (PDT)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-227cf12df27so50013105ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 12:48:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVdJUXiIFjV8anb7GLhJWBIxd56YhArsZyljy8wJtUqetluKQu0Lx1qZfMipEbz/KqQ4docsbmHcN40kH8=@vger.kernel.org
X-Received: by 2002:a17:903:2c7:b0:215:9eac:1857 with SMTP id
 d9443c01a7336-22de6bddc30mr6153485ad.5.1745869688108; Mon, 28 Apr 2025
 12:48:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250421113637.27886-1-xiazhengqiao@huaqin.corp-partner.google.com>
 <20250421113637.27886-4-xiazhengqiao@huaqin.corp-partner.google.com>
In-Reply-To: <20250421113637.27886-4-xiazhengqiao@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Apr 2025 12:47:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VFpj4_E7hMxZ3nAUaaeCuAua7Ec=_OKAPd2_cHAubb+w@mail.gmail.com>
X-Gm-Features: ATxdqUHAO79ku73pvAr653QK-OO192MFas7YBMOJaHFC7MJZORQDF9XAijlkLRQ
Message-ID: <CAD=FV=VFpj4_E7hMxZ3nAUaaeCuAua7Ec=_OKAPd2_cHAubb+w@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/panel-edp: Add support for CSW MNE007QS3-8 panel
To: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Apr 21, 2025 at 4:37=E2=80=AFAM Zhengqiao Xia
<xiazhengqiao@huaqin.corp-partner.google.com> wrote:
>
> CSW MNE007QS3-8 EDID:
> edid-decode (hex):
>
> 00 ff ff ff ff ff ff 00 0e 77 57 14 00 00 00 00
> 34 22 01 04 a5 1e 13 78 07 ee 95 a3 54 4c 99 26
> 0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 cd 7c 80 a0 70 b0 50 40 30 20
> 26 04 2e bc 10 00 00 1a cd 7c 80 a0 70 b0 50 45
> 30 20 26 04 2e bc 10 00 00 1a 00 00 00 fd 00 1e
> 78 9a 9a 20 01 0a 20 20 20 20 20 20 00 00 00 fc
> 00 4d 4e 45 30 30 37 51 53 33 2d 38 0a 20 01 3f
>
> 70 20 79 02 00 21 00 1d c8 0b 5d 07 80 07 b0 04
> 80 3d 8a 54 cd a4 99 66 62 0f 02 45 54 7c 5d 7c
> 5d 00 43 12 78 2b 00 0c 27 00 1e 77 00 00 27 00
> 1e 3b 00 00 2e 00 06 00 43 7c 5d 7c 5d 81 00 20
> 74 1a 00 00 03 01 1e 78 00 00 5a ff 5a ff 78 00
> 00 00 00 8d 00 e3 05 04 00 e6 06 01 01 5a 5a ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 76 90
>
> Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com=
>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 92844ab4cb9c..71cbee86fe81 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1770,6 +1770,13 @@ static const struct panel_delay delay_80_500_e50 =
=3D {
>         .enable =3D 50,
>  };
>
> +static const struct panel_delay delay_80_500_e80_p2e200 =3D {
> +       .hpd_absent =3D 80,
> +       .unprepare =3D 500,
> +       .enable =3D 80,
> +       .prepare_to_enable =3D 200,
> +};
> +
>  static const struct panel_delay delay_100_500_e200 =3D {
>         .hpd_absent =3D 100,
>         .unprepare =3D 500,
> @@ -1982,6 +1989,7 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         EDP_PANEL_ENTRY('C', 'S', 'W', 0x1103, &delay_200_500_e80_d50, "M=
NB601LS1-3"),
>         EDP_PANEL_ENTRY('C', 'S', 'W', 0x1104, &delay_200_500_e50, "MNB60=
1LS1-4"),
>         EDP_PANEL_ENTRY('C', 'S', 'W', 0x1448, &delay_200_500_e50, "MNE00=
7QS3-7"),
> +       EDP_PANEL_ENTRY('C', 'S', 'W', 0x1457, &delay_80_500_e80_p2e200, =
"MNE007QS3-8"),

I always get a little nervous when I see a low `hpd_absent` delay, but
this isn't the first one that's 80ms. As long as you're sure these
numbers are all correct then this looks fine to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
