Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F23515B971
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750693058; cv=none; b=bL9ey4fYVdLhEZKk5+LWyUAEejAzA19j0PDcLUvQb6rAZXMRw88ky+VX00dg3Onx8bCyBwdfvvYho82iyxl7SJeKEkQsFJvGE8MxBDYJ0V/andVuDF0lyoj/yDXUHSp65QEd36t2i55h3CHmWv5SwIrYRwoxylsl2tFby8euUuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750693058; c=relaxed/simple;
	bh=EupIYN7TudDNtJcKLAQTmKCry/hRXuPNPG5QPnPpDDU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aSR6bPI5RFU0W7v3yOfUnrfAEHxPkKM3fiLEi74INT4HBqihC+gjLYiOSAYJZ2qF5TRpZOBASqFjFx9dbJEykw+17UWfeqvYC03pJ+SmXFhpwK37aImFbVSuVcweysvNzTj+HVNIcS1hReOcTDi/jzofPUTQWD+qFeOZNU0JH3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NbDk6Y7S; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NbDk6Y7S"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4a5851764e1so87038121cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750693054; x=1751297854; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WJGBSqCnUJA7irvO1PVoXNoRAeaWwjkEY7WkDOY6Li0=;
        b=NbDk6Y7SyjMYWrvhnK94l1bvxHINpkbFb6GcrMPAPVRxhSLJBIPI/YEUauXOIybOdo
         pGm+4kYBzQZ+5CcO7bSu921Skb8PdnaIa19IGkuVXd8L1QuzgqXNP2ra2i9zScv5/oiC
         Dj/sP0i3J/Fxc1CAqwSL7OZjSJvb3uZQKtrCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750693054; x=1751297854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WJGBSqCnUJA7irvO1PVoXNoRAeaWwjkEY7WkDOY6Li0=;
        b=N5aVG21YumflsuDEVs73Z0Mp5GVKLosBVikbE1eo/LYj4xsasycAP2nmGTxswBdmp2
         vPkWa89+BOeY/qBFLBdCEGWmVsp9nKMAx+bposHc2E1X7Wx3bD3b2pccTCCdIEs6fDP/
         pf0GGOqEBhaA8F3TvZtf8rseb7ZPTS1OD1oAwlXBWiSfHGLWed3xopBDmLeKw+NU/mRM
         s5r/tOYy3gUYWk/Xz3fkc9DW0mqqf8oPxviDCRLHhvWqjsTrRKwwCBeLMxt9ZuySXT0X
         eHbTyipCskOTy3LKFv+plLZeoPiOCbuqCdfkOS96g0edwlCHNaEAIBTOQ0kdlT27wBiw
         ywIg==
X-Forwarded-Encrypted: i=1; AJvYcCXmwTdrRoSFQmko3A3D/DTKcfcrBzFV3aknhT3CIQGjQiShQKtWPesNAyNCTrmLT6ZzaPODmt61oavmhck=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/Tp2xb70FFGGNPkDQbWm6Ky78xUJgWR3BH1LDllOAhQ6WzWj2
	GeUK5D6ygY6MB0aIbYj8XzspQUhcvZeOD+l37DpvnYHcIKHwo9PBLJpZl4Zz6vJfDDQIQFObpNf
	swBo=
X-Gm-Gg: ASbGncv+nJFLfIGFqLPTrKgQrQjdoXH1PGQwZLovdnpWrw5Wzb7YEVlB9TbSJWVyLtQ
	Y82J51/pelZqIN5o6rcMzhgsZceAjDem9cywTGglpy8JdlwL7t+5bQPS93jVzEHN4oC84LDiBz0
	n29b8agdV005YXS1ZJPbj1plCjTBvkg5W83yHRjDcTD1JNvxKRqNS/J9fbE03gvtkLRF/wgJ/q7
	/kzvkMk4C56BsOUPYwer+Ntw7Xvb3nUlSV8BZBe1zN6Ht99YFmK6Kb3I0VnjgRLqDCM6QCKWghn
	9RJYL5teCQiTWAGNYlc7NF5K5mddVUs9ABIQu6eYUtdwOsTEGCayIAQZZA2kmlBhfp9Hn7F9q4P
	tKgAxOaw1zqBspYJnuYDU2QLM2glsyg==
X-Google-Smtp-Source: AGHT+IFsWbc/9nWyEpHkaMO9dNowGfMjnMIusFRYCfh8APf6Zl+XDLQhLLoRHeExzOhQielVS1m2gw==
X-Received: by 2002:ac8:5903:0:b0:4a7:693a:6ae8 with SMTP id d75a77b69052e-4a77a25763fmr208986381cf.52.1750693054199;
        Mon, 23 Jun 2025 08:37:34 -0700 (PDT)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com. [209.85.160.172])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a779d4e936sm39271861cf.13.2025.06.23.08.37.33
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 08:37:33 -0700 (PDT)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4a589b7dd5fso70970581cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:37:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUBgRAr0MUz0ShlIltpqE3O5bvMOLB1ErH7tejpV7e02PdJwyp4TPkpUNyQnI6ea/6wPMZnMQBo2mhOT8U=@vger.kernel.org
X-Received: by 2002:a17:90a:fc48:b0:312:26d9:d5a7 with SMTP id
 98e67ed59e1d1-3159d8cf2ebmr18648459a91.20.1750692664352; Mon, 23 Jun 2025
 08:31:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616093240.499094-1-j-choudhary@ti.com> <CAD=FV=Wb=bWXDfCyF8XhJ93dBRU2rUKM+B0X5uYh39FHRgT1Ww@mail.gmail.com>
In-Reply-To: <CAD=FV=Wb=bWXDfCyF8XhJ93dBRU2rUKM+B0X5uYh39FHRgT1Ww@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 23 Jun 2025 08:30:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V0BL0Mi2i2JR=bNVyBVQ8QA9+j+n6is0NTp8GF=X2yCA@mail.gmail.com>
X-Gm-Features: AX0GCFutWwxgHkQImeDKqwnVfYzG0u_tdBUlCpF-1CHh8gsLqYzh3utRxemN67s
Message-ID: <CAD=FV=V0BL0Mi2i2JR=bNVyBVQ8QA9+j+n6is0NTp8GF=X2yCA@mail.gmail.com>
Subject: Re: [PATCH v5] drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort
 connector type
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org, 
	tomi.valkeinen@ideasonboard.com, max.krummenacher@toradex.com, 
	ernestvanhoecke@gmail.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, kieran.bingham+renesas@ideasonboard.com, 
	linux-kernel@vger.kernel.org, max.oss.09@gmail.com, devarsht@ti.com, 
	geert@linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jun 16, 2025 at 9:24=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Mon, Jun 16, 2025 at 2:32=E2=80=AFAM Jayesh Choudhary <j-choudhary@ti.=
com> wrote:
> >
> > @@ -1220,6 +1231,27 @@ static void ti_sn65dsi86_debugfs_init(struct drm=
_bridge *bridge, struct dentry *
> >         debugfs_create_file("status", 0600, debugfs, pdata, &status_fop=
s);
> >  }
> >
> > +static void ti_sn_bridge_hpd_enable(struct drm_bridge *bridge)
> > +{
> > +       struct ti_sn65dsi86 *pdata =3D bridge_to_ti_sn65dsi86(bridge);
> > +
> > +       /*
> > +        * Device needs to be powered on before reading the HPD state
> > +        * for reliable hpd detection in ti_sn_bridge_detect() due to
> > +        * the high debounce time.
> > +        */
> > +
> > +       pm_runtime_get_sync(pdata->dev);
> > +}
> > +
> > +static void ti_sn_bridge_hpd_disable(struct drm_bridge *bridge)
> > +{
> > +       struct ti_sn65dsi86 *pdata =3D bridge_to_ti_sn65dsi86(bridge);
> > +
> > +       pm_runtime_mark_last_busy(pdata->dev);
> > +       pm_runtime_put_autosuspend(pdata->dev);
>
> nit: you don't need the pm_runtime_mark_last_busy() here, do you? Just
> call pm_runtime_put_autosuspend().
>
> Aside from the nit, this looks reasonable to me now.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

What's the plan here? I can just remove the
`pm_runtime_mark_last_busy()` and land it if people are on board with
that (and if it works fine for Jayesh). If Jayesh wants to post a v6
to make it more legit, I can land that. I probably won't land anything
myself past Wednesday (California time) since I'm about to go offline
for 2 weeks and wouldn't want to land and bolt.

-Doug
