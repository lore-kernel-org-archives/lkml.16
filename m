Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4371025392E
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 19:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745869502; cv=none; b=nIlP4kuX0wz+mrArXMT46Qp58wpuu6ff6qqqxyIiyEk+9lPusqagCuOd/eFsgKTxo3FAW8Z54CvWZDiylstH4t47tcHnZiAJXXRTspzWdKHVOBUWsJsym8QrkEs5QFSo2qtFA+HsketXj8uKH5/4DOgY90Kbk68HhfXKckLYYuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745869502; c=relaxed/simple;
	bh=uTYIp6N6u0ALG2CZaG1iwnd+th3ItUV1FtjeCg4/AzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AABa9cLo0ZlGJaFoHvBwLKzRKILwxTqRR5JXFApGHUzv2mGYO6Syo20XvbOGHaLouscishB1zZyvcmHfpy2KB4QbK4mzCWzzfD05g6NlxljPLV9oMd42jgQpzVaf3rXT5+bXbt5q6Co7jLOPlRjpr65gItpyFQ4vYmKuijeKivQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NJ7mCvBv; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NJ7mCvBv"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22c33ac23edso48357525ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 12:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745869495; x=1746474295; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZajjwoyukOvr9mE6CeoV8lx4UVycOtlXQYao/G3ci3w=;
        b=NJ7mCvBvSJhczzBGVmGC+I9Lax2eYgXLhsiJ70qnI4Ip/4cn5Mn0/bhrRkhhkVZ4+3
         i5Ql+4IgOC/m295xPNHjXssYlWZx4W/ayNzUjR/FYdzCBlYmr/gm66kXbtCRGseQ9cSX
         j52ThYPjs4PrEwNg/8E4cGIlulqFL1M6E0CpE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745869495; x=1746474295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZajjwoyukOvr9mE6CeoV8lx4UVycOtlXQYao/G3ci3w=;
        b=j42onqxam0iOl3b0TrmsBYsf3gbgK3s1vJ4itmCGgE/bqr/RvuiRLTyolB+bSzDAMc
         Pr9Ab8aDyOTkvoHJArFsS4tHAU7KYyhvUxIJ+CdEMxT2lO+i1rYC/NGlzYRxm/xZZz02
         tfI/NIG7gffXyBkR+x7K8bjkQ7ucZ7bMV5yu95wtm8HbDW4sguNszP+ND4wMMFQ1tXOq
         xVNqnKqHg4l8BAGLdB/2Nf+zeMdJs8vCYmeWQOx4tQqpw4py+mMTrAGg+OJEg5GubT1j
         L9p6yBXp+BiIi6uV82vhpqERWaJeAyj3rCvp94y06zhVdmZqY/GQybkWFZv9qXapZFuO
         lXZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSx9U/vJvs3hbg0X7moBcoD+OzW3j6DgjRFX960IR6KKO2h1ojOkSn0vukQwYaF9CBjymND+ekZCW1+0E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8phD0nAOUZnpHvdcBLRObqlbZhuQP4QUWY6SMBufgrosaOVp/
	eM2xXLpPuhO7QuG8/E1u6zQfqdFh9jc8YJdnGXulhSOgvFSurKJnGavOIK+MIHY9zIsuQc7glnc
	=
X-Gm-Gg: ASbGnct19ih/gvo10Em/0eWRCKSdeKGIBWOXz9ieVxhTOPqRhLd/Z3S23rj/j/iC+GF
	DRXGkDfeBfqsUZbjnWQkFx9xrVnhd+QN1bUrC1Dink3tvbCTYpZxI+Wr7x/zVmw50x8gnKQp7BH
	jRhVOD6syQ42gfN6GZCIDOK9j2Q6NzL4T96K1qJFNAEEA4jc9aMaJlFqru+MSpq9/PDHfEhWjtY
	wXarHw1WlO9VK/0KOyIP94byFlGBXWGvS7kwgbn9i3s68Yk/EN2+R2n4hudaIsXVMEksv1zkYxP
	FH+nqL6O2mjuZ4QAo3sG8U2paz+5D45DifpzNGPvA4F1yOAzLteLdxk2cNY9LeUHY/hMUyWz69i
	Sw56A4Tku
X-Google-Smtp-Source: AGHT+IH5HYOHdM6IfxIZMNMv/A/1DFXYbmu6EEH1g8U5UQJFKnVUiBMJntKQmeGE4uActieQmsFOFw==
X-Received: by 2002:a17:903:2309:b0:220:faa2:c917 with SMTP id d9443c01a7336-22de6066b8dmr11548055ad.34.1745869495395;
        Mon, 28 Apr 2025 12:44:55 -0700 (PDT)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com. [209.85.215.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e7681sm87459045ad.119.2025.04.28.12.44.50
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 12:44:54 -0700 (PDT)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so4151245a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 12:44:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVSrAT5f36LMGjEnRO2HOuWKovdba73GNFqILcgoREbZMGpVasn3zUz8yhMTC33J1e3DXcgG8x0gPmWZ7E=@vger.kernel.org
X-Received: by 2002:a17:90b:2b45:b0:308:5273:4dee with SMTP id
 98e67ed59e1d1-30a2155abb1mr1620972a91.15.1745869489782; Mon, 28 Apr 2025
 12:44:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250421113637.27886-1-xiazhengqiao@huaqin.corp-partner.google.com>
 <20250421113637.27886-2-xiazhengqiao@huaqin.corp-partner.google.com>
In-Reply-To: <20250421113637.27886-2-xiazhengqiao@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Apr 2025 12:44:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WXrxRJxWdQJaJAioNsE+rnvDL-MXXYU=k64eASfou63w@mail.gmail.com>
X-Gm-Features: ATxdqUHk40m4BLleMiw4YHxAaXz6Vw_z9VcQGzZEIPd0g-53-HTwHpMUpI5fXw0
Message-ID: <CAD=FV=WXrxRJxWdQJaJAioNsE+rnvDL-MXXYU=k64eASfou63w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/panel-edp: Add support for AUO B140QAN08.H panel
To: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Apr 21, 2025 at 4:36=E2=80=AFAM Zhengqiao Xia
<xiazhengqiao@huaqin.corp-partner.google.com> wrote:
>
> AUO B140QAN08.H EDID:
> edid-decode (hex):
>
> 00 ff ff ff ff ff ff 00 06 af b9 fe 00 00 00 00
> 00 23 01 04 a5 1e 13 78 03 c1 45 a8 55 48 9d 24
> 0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 18 86 40 a0 b0 08 52 70 30 20
> 65 00 2d bc 10 00 00 18 00 00 00 0f 00 00 00 00
> 00 00 00 00 00 00 00 00 00 20 00 00 00 fd 00 28
> 3c 71 71 22 01 0a 20 20 20 20 20 20 00 00 00 fc
> 00 42 31 34 30 51 41 4e 30 38 2e 48 20 0a 01 79
>
> 70 20 79 02 00 21 01 1d c2 0b 58 07 40 0b 08 07
> 88 8b fa 54 7e 24 9d 45 12 0f 02 35 54 40 5e 40
> 5e 00 44 12 78 22 00 14 ef 3c 05 85 3f 0b 9f 00
> 2f 80 1f 00 07 07 51 00 05 00 04 00 25 01 09 ef
> 3c 05 ef 3c 05 28 3c 80 2e 00 06 00 44 40 5e 40
> 5e 81 00 15 74 1a 00 00 03 00 28 3c 00 00 60 ff
> 60 ff 3c 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 4f 90
>
> Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com=
>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 52028c8f8988..958d260cda8a 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1880,6 +1880,7 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0xc4b4, &delay_200_500_e50, "B116X=
AT04.1"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0xd497, &delay_200_500_e50, "B120X=
AN01.0"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0xf390, &delay_200_500_e50, "B140X=
TN07.7"),
> +       EDP_PANEL_ENTRY('A', 'U', 'O', 0xc9a8, &delay_200_500_e50, "B140Q=
AN08.H"),

Please sort the list. 0xc9a8 does not come numerically after 0xf390.
As per the docs for this section:

 * Sort first by vendor, then by product ID.



-Doug
