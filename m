Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC873189916
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 21:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746392779; cv=none; b=PX2bfcy48wXpBkdDadi8AMyjrajLz1DvXprF47PrKM9m49ayv2Jsu/qvRlHEaim/LodLAj90I2m40io207eHZTxd8tt182qoqyPTNzggKQ97jMjstM9zWkU8cle5EPEEnVnUeGm6yp0OlldK9ahus4RJT3NFTW4oEDTN5sBE1l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746392779; c=relaxed/simple;
	bh=wXYAW7YV5xQtfUi2qFTUVAzc4AvWpSPdbFpO25qaAXI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fZpPl0c/iuVDpcPZdyHR/PDm153QQT4liK/cSFa6RUctbI+8H8Y908TnmfxlWT8Le2OTvUurhzeJvoUP1u4PecApf92D3swYyTZMpDJOVNk26utJgi07w8eEhCQagglJmOYPCyGrlxRWLiHJgMqWkn3t7jb6Rg24ggxuNW5JmnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=hO9qXzUq; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="hO9qXzUq"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22928d629faso34778255ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 14:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1746392777; x=1746997577; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d7XMv7LIvPb7tqhoDTx4OKcxFQ5Z8THhrxnqY7emq7k=;
        b=hO9qXzUquSo40wOJD30JqT+wlbMcw9T0fchUZQNDxFJapEpxKiWSb+Ij4FrxbNYpb8
         vHXqHlULhep0VZYFSyyt8gA77rCbzlNLCcpnL86bIE3CaIDF6qK6Gt/0SROqSAVP4gb/
         ms2bcrNlOxnP1/PLliwzhjc3uwHqmrOCcHIx4ypIvXWjTdGthXGgr7BB5XPo9tKZSooe
         imfP/G5aXRX1H5hnPAVXjh/Kno5xEaI6J/MxDSHsJqpGjaJYLxDqi5EXSoYp1e6dGnAC
         qIC0InvW8dyj0Bn8HUmYOvKSUvDQeyAxR4QWi26cbAsSjuNXBkos4clSFSKk5FZdO5Wb
         MA+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746392777; x=1746997577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d7XMv7LIvPb7tqhoDTx4OKcxFQ5Z8THhrxnqY7emq7k=;
        b=lTaVEqb/vrdHeK8AKVXlx5vBVnaGXV2G7IfJQVtEWM4oXuCCh3iY5g7oiFWtfbLZgv
         IjbzW76GHl2bDs2ZQxbsQFpIqTjCTRIFa5o6yHUoBSCHzi6AlXrtoWu6xrMiGOn0ZwGY
         ZYOamLValjW2s7r3nCWu/YCXTXFP1cFjqZzvdk8nPXQNxv+qJgAATuYB2XYDZSTHpkKl
         R25W7/IAwKrLYxCrUT5tuBYMe6yn1smGIW8r3O55YrJWrrptOP6Z9TVD57bn4YKOFaRj
         qQBoVONLjwh1Dcxid+m09dL3hXCYMNwY6XcQqdJuLqfcAzylJrxttl+yZ9Y2YPszY8Nh
         Oh+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVrZoUhOwEpP36pjx/KP5kE1CARVqyJRePKAxRNsjW/mgU7dkezvavMEVmUBAlgIsJPOJG+uCxZDarVxW4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9KSju/XF6I5az7xq1Fv+8vvDzd5FWga4ywYzxupdvdawyWwKX
	q+5HFT5oXVP8AZLJzVb/g9XtmE3mt/6/rIR/XEL7jCHeDK+x61fVKMxMksuobYxhNWNwyRw/BSP
	l8LjAKbqo1OAyyBPfmlc6zT7p11I=
X-Gm-Gg: ASbGnctIQNx4qHeJIag/6mw8DdbisuQb+M+LsTTBzJcGf89mlB0oflebxD0Cn/dCsas
	zk+0wZsNRsnQtAfjHhYOM/hMNj2ljy70myC7SEl4bHwIcqMS1618VfW4C0/6xgWCjs3A2QaCNwP
	xZG6zMhsej5wxD5FMh0/uDLGKGkHAijv+huCNGMjgQ7HGGPTAWzCK9JmE=
X-Google-Smtp-Source: AGHT+IH+MEVsPdqEqxaolEpzZxyQFPKcfV4Aif9uF/lMz5vcLwENh3usDnJAXYsU/xVN5tXD/rnnCYtU/paPqSYdvtk=
X-Received: by 2002:a17:903:1b6b:b0:221:7e36:b13e with SMTP id
 d9443c01a7336-22e1e8e702dmr87722535ad.12.1746392776924; Sun, 04 May 2025
 14:06:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429190724.330883-1-richard120310@gmail.com> <d5a8e781-6936-4c83-83d1-92daa2da8ca2@wanadoo.fr>
In-Reply-To: <d5a8e781-6936-4c83-83d1-92daa2da8ca2@wanadoo.fr>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 4 May 2025 23:06:06 +0200
X-Gm-Features: ATxdqUEZVaon0qrNN_2-3htZD6nCAzznTNUIlmtX8rkJYKBTJ9BhwXmOhJS40AA
Message-ID: <CAFBinCCL6OQrbQ_UY_nhnbodN2TquuKPk9unhp3YjpR5u=EXag@mail.gmail.com>
Subject: Re: [PATCH] drm/meson: Cast mode->clock to unsigned long long
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: I Hsin Cheng <richard120310@gmail.com>, neil.armstrong@linaro.org, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, khilman@baylibre.com, 
	jbrunet@baylibre.com, dri-devel@lists.freedesktop.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 11:00=E2=80=AFPM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> Le 29/04/2025 =C3=A0 21:07, I Hsin Cheng a =C3=A9crit :
> > Coverity scan reported the usage of "mode->clock * 1000" may lead to
> > integer overflow. Cast the type of "mode->clock" to "unsigned long long=
"
> > when utilizing it to avoid potential integer overflow issue.
> >
> > Link: https://scan5.scan.coverity.com/#/project-view/10074/10063?select=
edIssue=3D1646759
> > Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
> > ---
> >   drivers/gpu/drm/meson/meson_encoder_hdmi.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/d=
rm/meson/meson_encoder_hdmi.c
> > index 7752d8ac85f0..fe3d3ff7c432 100644
> > --- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> > +++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> > @@ -75,7 +75,7 @@ static void meson_encoder_hdmi_set_vclk(struct meson_=
encoder_hdmi *encoder_hdmi,
> >       unsigned long long venc_freq;
> >       unsigned long long hdmi_freq;
> >
> > -     vclk_freq =3D mode->clock * 1000;
> > +     vclk_freq =3D (unsigned long long) mode->clock * 1000;
>
> Hi,
>
> maybe, using 1000ULL instead would do the same, but would be less verbose=
?
Agreed, that would make the code more similar to drm_hdmi_compute_mode_cloc=
k().
The goal is to switch to drm_hdmi_compute_mode_clock() mid-term anyways.
