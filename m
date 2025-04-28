Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD21D297A48
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 19:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745869513; cv=none; b=M6UHd5gl0SgFPx5FOFydqgaLp57RcBOVBeDNUfvMTF3bRiQK1C4kUvMyj3YB14bgw2YdNTzJ9/fUkzks9iIcEJU2o81t4sGnA49hy7fr13+fVc60Hbrcf81cxSmTK3usFJgzJpAW5UL0wC6FfJuAG62zywJhYGUEWewey95bMn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745869513; c=relaxed/simple;
	bh=PEvOynK8fef5vs/DPgS1vW8DxkjBzuCR2y7obPmNTC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cmQ+QY25B02jLtHuU5HRaIss6vadbvcSGw668Yjkb98vN9uhWaoI/fr3FFGLvz8DwQFbzpNqt9ZdlsWnNQnnuR/u9g/LK6O5TkEu/OChRRbzvsXuMnUxIUSvyMflU7ZPXc+L5LhcoeZuT6iax8Srnl7qpumDkKdQHK9nnfyD6Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=W+3ghlyK; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="W+3ghlyK"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2279915e06eso59448785ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 12:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745869510; x=1746474310; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aZxk2qDFzusmDUPvRVv1xooykDuhZrrXcD8mPPsnc9s=;
        b=W+3ghlyK7Ux1sXJ6PvcJUzW8APNrG3cLPKHzwgupLRVqTAKQJUaLxOb703CEVLPt9W
         PGAj2cZF/ICKRU1cr86JjZSpq0cVsq0nCvK3Y+1RWVU3MARaSHcONzcfa/AI1AiwvUOx
         ZOudev70+yTiY2YwcX6KmiF8Z578D3ZCF//lc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745869510; x=1746474310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aZxk2qDFzusmDUPvRVv1xooykDuhZrrXcD8mPPsnc9s=;
        b=T8g5wUZuGyDOO6GhMzSs9wWGG+jfQ3am1tgOMjGCtLvj2xSJZ37WtdOM4SoqxWl6Jk
         PN5snPyoPv3c3WW+VIcjIk2/u+3XDW5eVs8H4Em55nRYBSuMi2XIGBHCNIuqQuTsh/Bn
         zjJT7nKyy7e8xR/YQAYEBfpZ23LrEJbIQsA1AFUnaNaMMpInMkhEIGv1aKAFKZnvWcbd
         9ZThp2PZgM64PhVT0uccMPXLiTqjudJ0zwWx6a5TgkBdO0YpqzFhviZ8qaOYhZkdbsun
         IUsiTo+FzqBHCZU/CGPTw9SQXBt0xXX2DcvCSpPHZDu7B7pFzxKOa4C926Lqy/4ruGv6
         2fYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQk7Bj9Ik3bhLBcuWEFoKBjk0/3DI5GxGEpo1ejrbdEk3ThTBVWw1IP7m1lUCC669khMR5YGpOJrWTNGo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtA0NJAvgpNOLgyziJ1OmEJwKhdirPBge/BSzW7ykg39UeYhIa
	HcVV7T4VjPc69g+m7j5/6BkMJjPfqHbEgpcfZPmq42SpauzxOO03lIvWgkgEOdyiLkt8yG1vj3k
	=
X-Gm-Gg: ASbGncs86T/z4eo0ZG6l2OgKimWANN4Ap+LrnVtryBejMlfuUQvG3RjtubQfPEAVVGS
	4B94b3JNjHs7dzv3iNUPjTEciQS1deVP9LnpqEKpGRrpdyOL07gW5TXpiyUBarsba3PdGyQbCWu
	b1u0ZqtvUZ8MbRyQJZGgNpUnjZluJadIbGa2b/z2NCFiBtCN46ZWhNcdSlgcDUMTck9pdEqEFAu
	gTFzp7zBJVEtz7f7Hnehec+15u3+u52oxqg1SbxzK6tTqvK55M7k43YeAma/7GRpB4dsN5dIBHz
	hIAfMES+SRDJwxb+5rQUgwP5OeyTDyq39U+RShaW9cUORf3tZifX8oROSa5lgiNs9V/04DqKxaM
	CTGfl
X-Google-Smtp-Source: AGHT+IG7BwCh/3bpqiIhmT2nq1gnfB6kiUg6ffCNBsafJIU7QURjNyHo4WfX7cOobdqS3CpVyl/nGw==
X-Received: by 2002:a17:903:1b6e:b0:223:60ce:2451 with SMTP id d9443c01a7336-22dc6a03081mr159711125ad.15.1745869510030;
        Mon, 28 Apr 2025 12:45:10 -0700 (PDT)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com. [209.85.216.51])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db521b0c2sm87088655ad.247.2025.04.28.12.45.09
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 12:45:09 -0700 (PDT)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-301c4850194so4293648a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 12:45:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWDNOPeIAmMnSlojz5E6Ov8CrYPqIAuh8Eu+hmlfwxzE+yaBabquBCxtqt0GbzEIhawcpmJWHsa8pjfpL4=@vger.kernel.org
X-Received: by 2002:a17:90a:8a88:b0:30a:214e:befc with SMTP id
 98e67ed59e1d1-30a214ebfe5mr1256694a91.27.1745869508777; Mon, 28 Apr 2025
 12:45:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250421113637.27886-1-xiazhengqiao@huaqin.corp-partner.google.com>
 <20250421113637.27886-3-xiazhengqiao@huaqin.corp-partner.google.com>
In-Reply-To: <20250421113637.27886-3-xiazhengqiao@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Apr 2025 12:44:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UF7Jz6mtx14dEV0udLti9ssU_rK88DvJmf2x39kr1cWQ@mail.gmail.com>
X-Gm-Features: ATxdqUHz1VL7o00_0SZbd4hPRDtUuNMfZKAxGJksy3VoNmYs7sifB67JMfU74Yc
Message-ID: <CAD=FV=UF7Jz6mtx14dEV0udLti9ssU_rK88DvJmf2x39kr1cWQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm/panel-edp: Add support for BOE NE140WUM-N6S panel
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
> BOE NE140WUM-N6S EDID:
> edid-decode (hex):
>
> 00 ff ff ff ff ff ff 00 09 e5 73 0d 00 00 00 00
> 32 22 01 04 a5 1e 13 78 07 13 45 a6 54 4d a0 27
> 0c 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 03 3e 80 a0 70 b0 48 40 30 20
> 36 00 2e bc 10 00 00 1a 00 00 00 fd 00 1e 78 99
> 99 20 01 0a 20 20 20 20 20 20 00 00 00 fc 00 4e
> 45 31 34 30 57 55 4d 2d 4e 36 53 0a 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 45
>
> 70 20 79 02 00 22 00 14 33 d8 04 85 7f 07 9f 00
> 2f 00 1f 00 af 04 47 00 02 00 05 00 81 00 13 72
> 1a 00 00 03 01 1e 78 00 00 5a 4a 5a 4a 78 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ad 90
>
> Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com=
>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 958d260cda8a..92844ab4cb9c 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1757,6 +1757,13 @@ static const struct panel_delay delay_200_500_e80_=
d50 =3D {
>         .disable =3D 50,
>  };
>
> +static const struct panel_delay delay_200_500_e80_p2e80 =3D {
> +       .hpd_absent =3D 200,
> +       .unprepare =3D 500,
> +       .enable =3D 80,
> +       .prepare_to_enable =3D 80,
> +};

Unless I'm mistaken, you don't need to add this timing. See the docs
for `prepare_to_enable`, where the relationship between the `enable`
and `prepare_to_enable` delay is documented. Specifically, see:

* In other words:
*   prepare()
*     ...
*     // do fixed prepare delay
*     // wait for HPD GPIO if applicable
*     // start counting for prepare_to_enable
*
*   enable()
*     // do fixed enable delay
*     // enforce prepare_to_enable min time

Given that the fixed delay is 80 ms in your timings it seems
impossible to ever need the `prepare_to_enable` delay. ...so you can
just leave the `prepare_to_enable` off, which means you can just use
`delay_200_500_e80` like many of the other BOE panels.


> +
>  static const struct panel_delay delay_80_500_e50 =3D {
>         .hpd_absent =3D 80,
>         .unprepare =3D 500,
> @@ -1916,6 +1923,7 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x09c3, &delay_200_500_e50, "NT116=
WHM-N21,836X2"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x094b, &delay_200_500_e50, "NT116=
WHM-N21"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0951, &delay_200_500_e80, "NV116=
WHM-N47"),
> +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x0d73, &delay_200_500_e80_p2e80, =
"NE140WUM-N6S"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x095f, &delay_200_500_e50, "NE135=
FBM-N41 v8.1"),

Please sort. 0x0d73 does not come between 0x0951 and 0x095f.
