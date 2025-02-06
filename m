Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493AC502BE
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 20:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738872060; cv=none; b=eYAQ7SLDmxa7QAavF6W+YDMZ3pIFFFgnfUOlkTnOPGbwZi44pMDxmxfMO5A4fqDcsWQv+r7ThDEdD6mZi4Y/twQKjEhWUMxlOdmf7vMq9tqNL0kgrH1lEKp21rv363EAzeXFdZDub6A6GP5OPUEO51S9EylZyv4WPwqYmkwtWuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738872060; c=relaxed/simple;
	bh=qf5ssaDvlu6m5TCJlwxs3tRm2Aovfx0FnVv9Dh+Zrk0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iZXHEFZ1HbdNuuNsK5zZzIybzQ0Tx+SyfG0L1W7BgzL4kOPC6G7i36FVO0iZ5hFKVfmFpFZlNj+IaiOLdHD2yBjpvXuwuIasoX6iVm2gu0tAQYicJXeKShnkv0bAJH5dEWCGlP3GdNoMHB0OHDNMQlBxr1c9szl82wOuyewk2JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=K7zmNM1K; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="K7zmNM1K"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6e42ba364f1so14317726d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 12:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1738872056; x=1739476856; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mduAQQnr6XFJuL+iv4byNZV6KWiQaZZ5C5/zUL5szzQ=;
        b=K7zmNM1KJKxY1l+CKtfIUSKfzpQsR6qEp+S88od/hVcU9yVI+Rj19EDaL+3fxCxNm+
         L+FhoUEAjGY9XUryjowJkh9pynVxYOY9LFImKcTcqGVPNL6PoXc29AOQVxMJrEBxtzti
         IiU2DWwmQyQZ9iHz/CpwBh1jVX0HLDGhQzflVDk3l9t6/qdwVj5/ghURjN4G3sv9SwHD
         WEN6SUpe0XAWHFOurQWgwrB+3TV2e56ieGicK3uaDJhIcRGm//f9xDPqASLP9mVRQF42
         g9vI0Qslq3rDPF6ljOStQJgwGfd9B5PrMgAJ636ijpILTkRL8LSpOzylTdlfueKu57K6
         ieqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738872056; x=1739476856;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mduAQQnr6XFJuL+iv4byNZV6KWiQaZZ5C5/zUL5szzQ=;
        b=CP/8OnFvVSyEsiURyHFmRxZNyoMrL0ImZFiOLL8Z6hg12XxG9QeqP1imUtxEyQZwBG
         zmxazKaTpnqlJfIkzKb+DsRbtBjEpuadF2ijddKTGw06t9KsI0PNY2uDVeXEPSA6NKq3
         Cfab22jbyvVACroyX54BAPS+fEcekXiFEdVCDwdXhjF4BapiuVKBmyFqrDFPBOzaZtrH
         uy/s4pWjulaRFveGvpTCo/xUom6vSY0NCMpFtBFRi7vRkore8DjNocQXJYj44PtS4OpW
         8BzPlzTIH4mli3/FpfvHFQuMXqtG9UTH0RLECVNgPLWCZnrHWb8oQxCCdPuxwdS3LK2p
         I7iw==
X-Forwarded-Encrypted: i=1; AJvYcCV0w+Jyn46IyJbXa6qvKP0p/+6YuZHUV7Ta5nKHIx1Uxpm4ErceI/0omaom+ToFxr6bNITt1JATin3GS6k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDWe0AY7Uy3cR8Dn4g9VyQTucZpvxEO6eziBe9ervbWZ6TzXAA
	cHQIGqMlOCJ0ZFcMrFpxpGYYneCe0UTdaeK+BE8+fnshcKbRiWKqpWPTSHE7M3k=
X-Gm-Gg: ASbGncvYOF2nxRNCb1dawhPLmac4xG2M+a/iTxvOd0/gGqxUth0HTZH01hduTyfwgvx
	X6xYGCGhIkxnrEzjveNXANyiM08EGX4kJKYLpUlfPCRvbpmoZA5YuT+h/vW3wgr1NysF08sDnVa
	Xg8dNx5r/tInMC7pRN3nY65LKAnd/jBnLis9pexNnQVclKlnbSblLOZ86rVNtf6WBhXM+9DihKs
	pK0GIGQZJtyrRrwYnewKf7PZFZmV+hYD4ieqwR3LOeQHpysJBUyHt0r3jNKcgfJ+30V2P1RxifW
	dSMkkBSvtmJNNJ+n
X-Google-Smtp-Source: AGHT+IFAY2D8Rrohfjwwx4CO/Pw1UOKB8giV4JveEN3pJe9VdclFqqoHdlaE7Lpi/6z/72iQKhBLZQ==
X-Received: by 2002:a05:6214:c6e:b0:6e4:269f:60fd with SMTP id 6a1803df08f44-6e445681b9dmr4452146d6.23.1738872054565;
        Thu, 06 Feb 2025 12:00:54 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:11:e976::7a9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e443254399sm2524866d6.49.2025.02.06.12.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 12:00:53 -0800 (PST)
Message-ID: <4ea3574ffb1bad87de3593d468371afc7203f110.camel@ndufresne.ca>
Subject: Re: [PATCH] media: allegro-dvt: Moving the current driver to
 subdirectory
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Michael Tretter	
 <m.tretter@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Michal Simek <michal.simek@amd.com>, Hans Verkuil
 <hverkuil@xs4all.nl>, Andrzej Pietrasiewicz	 <andrzejtp2010@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,  Christophe JAILLET
 <christophe.jaillet@wanadoo.fr>, Gaosheng Cui <cuigaosheng1@huawei.com>,
 Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=	 <u.kleine-koenig@baylibre.com>,
 Ricardo Ribalda <ribalda@chromium.org>, open list
 <linux-kernel@vger.kernel.org>, "open list:MEDIA INPUT INFRASTRUCTURE
 (V4L/DVB)"	 <linux-media@vger.kernel.org>, "moderated list:ARM/ZYNQ
 ARCHITECTURE"	 <linux-arm-kernel@lists.infradead.org>
Date: Thu, 06 Feb 2025 15:00:52 -0500
In-Reply-To: <20241202102654.40472-1-yassine.ouaissa@allegrodvt.com>
References: <20241202102654.40472-1-yassine.ouaissa@allegrodvt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Yassine,

sorry for the long delay, note that this set could not have been accepted, =
the
move should be submitted with the new driver.


Le lundi 02 d=C3=A9cembre 2024 =C3=A0 11:26 +0100, Yassine Ouaissa a =C3=A9=
crit=C2=A0:
> In preparation for the upcoming driver update, we need to realocate the
> current driver that is not maintained by us ( allegro-dvt ).
> This will help ensure a clean transition and avoid any potential
> conflicts with the new driver.
>=20
> This patch is crucial for keeping our directory organized and
> facilitating a smooth integration of the new driver
>=20
> Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
> ---
>  MAINTAINERS                                               | 2 +-
>  drivers/media/platform/allegro-dvt/Kconfig                | 4 ++--
>  drivers/media/platform/allegro-dvt/Makefile               | 8 ++------
>  drivers/media/platform/allegro-dvt/zynqmp/Makefile        | 6 ++++++
>  .../media/platform/allegro-dvt/{ =3D> zynqmp}/nal-h264.c    | 0
>  .../media/platform/allegro-dvt/{ =3D> zynqmp}/nal-h264.h    | 0
>  .../media/platform/allegro-dvt/{ =3D> zynqmp}/nal-hevc.c    | 0
>  .../media/platform/allegro-dvt/{ =3D> zynqmp}/nal-hevc.h    | 0
>  .../media/platform/allegro-dvt/{ =3D> zynqmp}/nal-rbsp.c    | 0
>  .../media/platform/allegro-dvt/{ =3D> zynqmp}/nal-rbsp.h    | 0
>  .../{allegro-core.c =3D> zynqmp/zynqmp-allegro-core.c}      | 2 +-
>  .../{allegro-mail.c =3D> zynqmp/zynqmp-allegro-mail.c}      | 2 +-
>  .../{allegro-mail.h =3D> zynqmp/zynqmp-allegro-mail.h}      | 0
>  13 files changed, 13 insertions(+), 11 deletions(-)
>  create mode 100644 drivers/media/platform/allegro-dvt/zynqmp/Makefile
>  rename drivers/media/platform/allegro-dvt/{ =3D> zynqmp}/nal-h264.c (100=
%)
>  rename drivers/media/platform/allegro-dvt/{ =3D> zynqmp}/nal-h264.h (100=
%)
>  rename drivers/media/platform/allegro-dvt/{ =3D> zynqmp}/nal-hevc.c (100=
%)
>  rename drivers/media/platform/allegro-dvt/{ =3D> zynqmp}/nal-hevc.h (100=
%)
>  rename drivers/media/platform/allegro-dvt/{ =3D> zynqmp}/nal-rbsp.c (100=
%)
>  rename drivers/media/platform/allegro-dvt/{ =3D> zynqmp}/nal-rbsp.h (100=
%)
>  rename drivers/media/platform/allegro-dvt/{allegro-core.c =3D> zynqmp/zy=
nqmp-allegro-core.c} (99%)
>  rename drivers/media/platform/allegro-dvt/{allegro-mail.c =3D> zynqmp/zy=
nqmp-allegro-mail.c} (99%)
>  rename drivers/media/platform/allegro-dvt/{allegro-mail.h =3D> zynqmp/zy=
nqmp-allegro-mail.h} (100%)

There is no reason to rename these 3 files, moving them in a subdirectory s=
hould
be enough. As I understood, there is no plan to share anything between the =
new
and the old driver.

regards,
Nicolas

>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7292e4a1ddb8..d79efe6f8992 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -795,7 +795,7 @@ R:	Pengutronix Kernel Team <kernel@pengutronix.de>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/media/allegro,al5e.yaml
> -F:	drivers/media/platform/allegro-dvt/
> +F:	drivers/media/platform/allegro-dvt/zynqmp
> =20
>  ALLIED VISION ALVIUM CAMERA DRIVER
>  M:	Tommaso Merciai <tomm.merciai@gmail.com>
> diff --git a/drivers/media/platform/allegro-dvt/Kconfig b/drivers/media/p=
latform/allegro-dvt/Kconfig
> index 2182e1277568..9bc7e99788b8 100644
> --- a/drivers/media/platform/allegro-dvt/Kconfig
> +++ b/drivers/media/platform/allegro-dvt/Kconfig
> @@ -2,8 +2,8 @@
> =20
>  comment "Allegro DVT media platform drivers"
> =20
> -config VIDEO_ALLEGRO_DVT
> -	tristate "Allegro DVT Video IP Core"
> +config VIDEO_ZYNQMP_ALLEGRO_DVT
> +	tristate "Allegro DVT Video IP Core for ZynqMP"
>  	depends on V4L_MEM2MEM_DRIVERS
>  	depends on VIDEO_DEV
>  	depends on ARCH_ZYNQMP || COMPILE_TEST
> diff --git a/drivers/media/platform/allegro-dvt/Makefile b/drivers/media/=
platform/allegro-dvt/Makefile
> index 66108a303774..04727c5f7ef4 100644
> --- a/drivers/media/platform/allegro-dvt/Makefile
> +++ b/drivers/media/platform/allegro-dvt/Makefile
> @@ -1,6 +1,2 @@
> -# SPDX-License-Identifier: GPL-2.0
> -
> -allegro-objs :=3D allegro-core.o allegro-mail.o
> -allegro-objs +=3D nal-rbsp.o nal-h264.o nal-hevc.o
> -
> -obj-$(CONFIG_VIDEO_ALLEGRO_DVT) +=3D allegro.o
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-y +=3D zynqmp/
> diff --git a/drivers/media/platform/allegro-dvt/zynqmp/Makefile b/drivers=
/media/platform/allegro-dvt/zynqmp/Makefile
> new file mode 100644
> index 000000000000..a8ddb9cf93a8
> --- /dev/null
> +++ b/drivers/media/platform/allegro-dvt/zynqmp/Makefile
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +zynqmp-allegro-objs :=3D zynqmp-allegro-core.o zynqmp-allegro-mail.o
> +zynqmp-allegro-objs +=3D nal-rbsp.o nal-h264.o nal-hevc.o
> +
> +obj-$(CONFIG_VIDEO_ZYNQMP_ALLEGRO_DVT) +=3D zynqmp-allegro.o
> diff --git a/drivers/media/platform/allegro-dvt/nal-h264.c b/drivers/medi=
a/platform/allegro-dvt/zynqmp/nal-h264.c
> similarity index 100%
> rename from drivers/media/platform/allegro-dvt/nal-h264.c
> rename to drivers/media/platform/allegro-dvt/zynqmp/nal-h264.c
> diff --git a/drivers/media/platform/allegro-dvt/nal-h264.h b/drivers/medi=
a/platform/allegro-dvt/zynqmp/nal-h264.h
> similarity index 100%
> rename from drivers/media/platform/allegro-dvt/nal-h264.h
> rename to drivers/media/platform/allegro-dvt/zynqmp/nal-h264.h
> diff --git a/drivers/media/platform/allegro-dvt/nal-hevc.c b/drivers/medi=
a/platform/allegro-dvt/zynqmp/nal-hevc.c
> similarity index 100%
> rename from drivers/media/platform/allegro-dvt/nal-hevc.c
> rename to drivers/media/platform/allegro-dvt/zynqmp/nal-hevc.c
> diff --git a/drivers/media/platform/allegro-dvt/nal-hevc.h b/drivers/medi=
a/platform/allegro-dvt/zynqmp/nal-hevc.h
> similarity index 100%
> rename from drivers/media/platform/allegro-dvt/nal-hevc.h
> rename to drivers/media/platform/allegro-dvt/zynqmp/nal-hevc.h
> diff --git a/drivers/media/platform/allegro-dvt/nal-rbsp.c b/drivers/medi=
a/platform/allegro-dvt/zynqmp/nal-rbsp.c
> similarity index 100%
> rename from drivers/media/platform/allegro-dvt/nal-rbsp.c
> rename to drivers/media/platform/allegro-dvt/zynqmp/nal-rbsp.c
> diff --git a/drivers/media/platform/allegro-dvt/nal-rbsp.h b/drivers/medi=
a/platform/allegro-dvt/zynqmp/nal-rbsp.h
> similarity index 100%
> rename from drivers/media/platform/allegro-dvt/nal-rbsp.h
> rename to drivers/media/platform/allegro-dvt/zynqmp/nal-rbsp.h
> diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/=
media/platform/allegro-dvt/zynqmp/zynqmp-allegro-core.c
> similarity index 99%
> rename from drivers/media/platform/allegro-dvt/allegro-core.c
> rename to drivers/media/platform/allegro-dvt/zynqmp/zynqmp-allegro-core.c
> index e491399afcc9..8895d7755987 100644
> --- a/drivers/media/platform/allegro-dvt/allegro-core.c
> +++ b/drivers/media/platform/allegro-dvt/zynqmp/zynqmp-allegro-core.c
> @@ -31,7 +31,7 @@
>  #include <media/videobuf2-dma-contig.h>
>  #include <media/videobuf2-v4l2.h>
> =20
> -#include "allegro-mail.h"
> +#include "zynqmp-allegro-mail.h"
>  #include "nal-h264.h"
>  #include "nal-hevc.h"
> =20
> diff --git a/drivers/media/platform/allegro-dvt/allegro-mail.c b/drivers/=
media/platform/allegro-dvt/zynqmp/zynqmp-allegro-mail.c
> similarity index 99%
> rename from drivers/media/platform/allegro-dvt/allegro-mail.c
> rename to drivers/media/platform/allegro-dvt/zynqmp/zynqmp-allegro-mail.c
> index aadc947a77ae..88a98f9e5d00 100644
> --- a/drivers/media/platform/allegro-dvt/allegro-mail.c
> +++ b/drivers/media/platform/allegro-dvt/zynqmp/zynqmp-allegro-mail.c
> @@ -12,7 +12,7 @@
>  #include <linux/string.h>
>  #include <linux/videodev2.h>
> =20
> -#include "allegro-mail.h"
> +#include "zynqmp-allegro-mail.h"
> =20
>  const char *msg_type_name(enum mcu_msg_type type)
>  {
> diff --git a/drivers/media/platform/allegro-dvt/allegro-mail.h b/drivers/=
media/platform/allegro-dvt/zynqmp/zynqmp-allegro-mail.h
> similarity index 100%
> rename from drivers/media/platform/allegro-dvt/allegro-mail.h
> rename to drivers/media/platform/allegro-dvt/zynqmp/zynqmp-allegro-mail.h

