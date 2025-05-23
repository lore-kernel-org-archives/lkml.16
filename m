Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D258634F
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 23:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748044624; cv=none; b=SuDaptZtEVdAYCGEtwKTeeezr6OMFscAb/Mly7xJAEIlkgZWuguP3r4hVu7Zy+l4xKADCTWrncNbrEKFK1K74/HQPIWrXtl9wFcBTGFwPpPK8ztiaTwcQz/bPa9murn7qHRrcw5osVe5ttaXxFsoJPrHhAEGY+cs35j5aIllxBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748044624; c=relaxed/simple;
	bh=6TMOE8tfjhP/pe8QLHmdJ8V7+7q15WDOJwrhvuXiiSs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eayosr514SA9/QY0QkLSM6z0OAhWU3rqu98BLFIRlHoa+zRkSuqlrRXfVACbaULv4rrhVknQkyT9hucgVlBVyHM0hA6CNKlLO6BvtVfwGv4FupSTAT5/eErog6zjogyQN79N2IFtqNRNH1nQoAA9K0AcczKfh9zwhOucYi4rp6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=ybkvl8V6; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="ybkvl8V6"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c5e39d1db2so18373085a.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 16:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1748044621; x=1748649421; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1V3jztqEm0v3PJIR69srO63uF29oBzq7VleLsu+OAvc=;
        b=ybkvl8V64KIiwM+Pd7oLY1lZKSH8ULmZMXVTFsCj5as1WSzLg+R6R1HkxgOTva8xP2
         SpCCrOKzYRvAkxGjg/12OMD2IR7UbH4LSxcgXJGJ3wai/cYxUn3/nplXKoCl28vdqDS2
         Zb4lbsp+zhZfPoKUAtWUQs60KVuFbYYXul68fkCue5cLeWCIwERHWzR2EwD/+Vo+2OfO
         jq8m7GWxSJyAmgXxOokl1YxbfvSWzM8zA1eduo9dwkJkhIERsSDYQCaBImp8RcWAL0Kn
         nVjeADp5MuRtyYjH1et/LAex5B41nUlSi8njJq6o/d08K2jaVcdAS9biCXfChuuFHcMd
         k63g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748044621; x=1748649421;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1V3jztqEm0v3PJIR69srO63uF29oBzq7VleLsu+OAvc=;
        b=WuCq+ukjGoXX04l93DsZaeMdedky2z+9AATmlToji+f4aOnKuOfLWlszjhBKBR/yo0
         jxqQfG0dnL/9Hk+q7JfhtAl8URBpCKBRMx/7niW8cOmP2v9VRJ1lDU+NL9ZI7jn8BXZX
         Et642rviQ1JMwEh4veTU7NWyI6/EgDdA8XVnrGfUuuwTNi+boR7XzWad9ehomvIfHqh1
         HNIzEQKIP3t3Zb8hgnQ5UgFCIfWeJ0fVt/y3aMETXedn75w5proNN3smfib02d483D45
         hPiygtnNBIcZ0+MT8ESljtONw8/7iIaiVn3kfdWDs/psIhbhMY3ykZhr1h568ohDe8ik
         E3XA==
X-Forwarded-Encrypted: i=1; AJvYcCXy0NQ9fSGurInN4jjK7wrpITuQpsoebEBR1S6tUpDPqAHdsySGtwWo1xEPzwz+nQbh7beepTiKq/OGyIA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/ONKOkDKxIKQaRc0LHdgQ7Sb9M5EpXNFV2bhBIeskfX/mpM5v
	mR/2g/n4p8aOM96mio0ZJUj9GGqotyzOB+MvR4mzQjW4cWgkUEGI3X+OSzD8Kl8AMa2j+Nb3K7b
	eY5LWtxY=
X-Gm-Gg: ASbGnctfyKf+m7ffmXsheQgmWCCPfBx+E/VgnZRcMs0QI7YzwjDOgypEyWngD8AiF0V
	qO/xjrcRdHeHHcUSht2lmmsO7x1unu2N+tZWxkkYDO5bi3h9FWKkAhVNjTb/hOWJD0BornF+UU3
	64+MHZaY0YkQf2f2V3JA7o7w8NvHArK6FkO1vx6kUIcQCXFDGccEl1vFl29OHJvq0vDUKc1IWqt
	n1jb4LVgNW/hhvP62+K3OyR6K+HOh+woHygznLKsMUJm4Z5ED7Lc/tqF+PEzcxqwU4SGr+dHYHB
	J1GQOiiOPXl0nV7HnU9q9j31I6ZTVYshFsWK6pPj8/a1dFL0qlLD5dV0
X-Google-Smtp-Source: AGHT+IF6fgqRDRQ5OBQMveh8h4PNZ39A72J47cOsJyJsBBuyNTZPwp9WTl4uQWPXOOe2jevp6q4Zaw==
X-Received: by 2002:a05:620a:44ca:b0:7c7:a5f6:2633 with SMTP id af79cd13be357-7ceecb6cc93mr218440785a.6.1748044621467;
        Fri, 23 May 2025 16:57:01 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b2fc::c41? ([2606:6d00:17:b2fc::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd468ccbfcsm1254223785a.107.2025.05.23.16.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 16:57:01 -0700 (PDT)
Message-ID: <82e84dc1277e08742b8f72c6a6ce475acd6d36d8.camel@ndufresne.ca>
Subject: Re: [PATCH 07/18] media: coda: Add fake IRQ check
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sergey Khimich <serghox@gmail.com>, linux-media@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, linux-kernel@vger.kernel.org, Vladimir Yakovlev
	 <vovchkir@gmail.com>, Maksim Turok <turok.m7@gmail.com>
Date: Fri, 23 May 2025 19:57:00 -0400
In-Reply-To: <20250314152939.2759573-8-serghox@gmail.com>
References: <20250314152939.2759573-1-serghox@gmail.com>
	 <20250314152939.2759573-8-serghox@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

Le vendredi 14 mars 2025 =C3=A0 18:29 +0300, Sergey Khimich a =C3=A9crit=C2=
=A0:
> From: Sergey Khimich <serghox@gmail.com>
>=20
> Sometimes we receive fake interrupts. It's better to check
> status register and trace fake irq if occurred.
>=20
> Signed-off-by: Sergey Khimich <serghox@gmail.com>
> ---
> =C2=A0.../media/platform/chips-media/coda/coda-bit.c=C2=A0=C2=A0 | 16 +++=
++++++++++++-
> =C2=A0drivers/media/platform/chips-media/coda/trace.h=C2=A0 | 16 ++++++++=
++++++++
> =C2=A02 files changed, 31 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/chips-media/coda/coda-bit.c b/drivers=
/media/platform/chips-media/coda/coda-bit.c
> index 84ded154adfe..3e3bb3d64ec9 100644
> --- a/drivers/media/platform/chips-media/coda/coda-bit.c
> +++ b/drivers/media/platform/chips-media/coda/coda-bit.c
> @@ -2635,9 +2635,23 @@ irqreturn_t coda_irq_handler(int irq, void *data)
> =C2=A0{
> =C2=A0	struct coda_dev *dev =3D data;
> =C2=A0	struct coda_ctx *ctx;
> +	u32 status;
> =C2=A0
> =C2=A0	/* read status register to attend the IRQ */
> -	coda_read(dev, CODA_REG_BIT_INT_STATUS);
> +	status =3D coda_read(dev, CODA_REG_BIT_INT_STATUS);
> +	if (!status) {
> +		/*
> +		 * Sometimes we received wrong interrupts
> +		 * That's why we check status
> +		 * and if one of it is zero - wait next interrupts
> +		 * You need check your HW configuration
> +		 */
> +		dev_warn_ratelimited(dev->dev, "Fake irq status=3D0x%X\n",
> +				=C2=A0=C2=A0=C2=A0=C2=A0 status);
> +		trace_coda_wrong_irq(dev);
> +		return IRQ_HANDLED;

How often is sometimes ? Does it cause any issues, frame loss ? If not, I w=
ould say
drop the warning and just swallow it.

Nicolas

> +	}
> +
> =C2=A0	coda_write(dev, 0, CODA_REG_BIT_INT_REASON);
> =C2=A0	coda_write(dev, CODA_REG_BIT_INT_CLEAR_SET,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CODA_REG_BIT_INT_CLEAR);
> diff --git a/drivers/media/platform/chips-media/coda/trace.h b/drivers/me=
dia/platform/chips-media/coda/trace.h
> index abc6a01a74e9..15a96bab10ad 100644
> --- a/drivers/media/platform/chips-media/coda/trace.h
> +++ b/drivers/media/platform/chips-media/coda/trace.h
> @@ -10,6 +10,22 @@
> =C2=A0
> =C2=A0#include "coda.h"
> =C2=A0
> +TRACE_EVENT(coda_wrong_irq,
> +	TP_PROTO(struct coda_dev *dev),
> +
> +	TP_ARGS(dev),
> +
> +	TP_STRUCT__entry(
> +		__field(struct coda_dev *, dev)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->dev =3D dev;
> +	),
> +
> +	TP_printk(" dev =3D 0x%p", __entry->dev)
> +);
> +
> =C2=A0TRACE_EVENT(coda_bit_run,
> =C2=A0	TP_PROTO(struct coda_ctx *ctx, int cmd),
> =C2=A0
