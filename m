Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4815D262FFB
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 21:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745356994; cv=none; b=CQ8bqKB1gBOjHxAwi/w/byRj0ju2ini3XrvcyH9Jjit5pJQqvNOb4tN3JxATjCP5+pxKB2d07V5F8XoFqmoAJcAt7q8JqP+n9DNo+Py7xcw4ReW9+Bf/ibBk5wwYbkblOSacB5nLro/y7tO/dFhrYofHOxbW/XusEDnbgXvO8F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745356994; c=relaxed/simple;
	bh=k2qWAoAh7FbrhsjzDqPPPK9Nre8fNKQvDQg7GZB2jQo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UhoQ/og9a1XkGTxVT68LyuwJAU/3DzdJGh+OJSBITOPL5zVbKQsYKUfHylhNqFQoxBqdTC+2LS3lmCdFfimhqofj50U0pEkEoJkbGfvEHsmrD2p14LBUbOjK4E77h0wf8ej6t1VPiMmmjgPNKxD6Usnpat0A3bQzysXM91JG1Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=xECsqvF/; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="xECsqvF/"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-477282401b3so63088711cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 14:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1745356991; x=1745961791; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NGSbhZB8ag8p7jHY+v66knIF5zG8Lt6g7GJ9MoKueNI=;
        b=xECsqvF/HPNeSF7xVSOlz2FSXmH9HfZ5y2r1sxnCUl3Wg9uwowOumIJyeS1qsubNhB
         nTcZn4pSL0PfIOok4KqHrewsm6PDZPhNK1vcOzbqLNFp0Bsb0vap07+KV/NpYoweFsQr
         k8Lo9ZF9pYudlLFfXmeBsjRgsYvqefe69IjLkelPFn14MVPWJ85cAreIryqCty0rg0ok
         Yv25j+y8c6YYvxQ/6+ImlAitoq3zVo2F7CU29V2qn4BDG2OarJh5BsDc9Ol/lNKNnq6L
         K+E9Zn4F5VRUad1/sSBh/O97EllqGEuBEotXhMOi2SOxxWPzAPdXAcw26jmMuCsvJE3z
         XkEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745356991; x=1745961791;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NGSbhZB8ag8p7jHY+v66knIF5zG8Lt6g7GJ9MoKueNI=;
        b=jbmaUPHp5el0y+3fuANTeSg/lYzkONaNs6s5mZx7vveBDmfVCgaMrIl4sZonfzznRk
         HwYdylfwhmsWk/gMm576Sz1G62qhWtCBSWaVJEvOKoaDu6spb65L4KKgONjBXY3g1PFV
         r6buCZrZiSwKY9asmfCSinRyf4NhChx02y7L1eAbVCckWSAdQX4DzWGZlmmAEAAwR7iU
         tWGJCqYeD1RuqAG46Qju7+w6/qKLAqr8l8BdTUiJ6LnwcIqxnAmQfHMlvQMvxUXDwu28
         4f3QVPzkbSAOo8r6xi3wkJqiodzxnNQ8UYFiF3iaEwbs93luO0ZxneqYwLSyrC4gfnYx
         3zkw==
X-Gm-Message-State: AOJu0YyioliUdHx/4S8954NflwyodSEY2ccH2wFuILI016mjqP2xan5H
	TK/EJCprgo4CsmXx1fXh/OFwy2On+fVnF5uYrJFcwV0m/kLWz4R1oUQgVzlWWrHu5kDS8PXGgaj
	vaOw=
X-Gm-Gg: ASbGnctextWg3uSbVoQTZdODS73jHwmpiFjy74l86ESjEmnGya2cKGWErp/3RAWLpeZ
	eE2382ZliqO5S33nMAlymGifOqewSOrcuDvUwk9nCmTLtaym6cmmAvPSQx4zMaxMZMXqd0Ka57b
	Wgth763YkIxB0duwcJuWqfyMrsuQerrLgeq0nT2T9puJu8wRuKSG6dNrknS5GRd3QurmeAP1uXu
	iMK8R55ZHARFrEXSKsbCVaFfsBp2cCApXrjVsFmkqv2xwTlfJ7gfIb8ubReR5iBjD06/jrMH58b
	ok5MarYFjGGs714q0ANrWMmLGz5tjWn947mfbtj3PQ/keQ==
X-Google-Smtp-Source: AGHT+IF9uypzaq3BBVcupNVm9phJf3EkFEPFQS60GcY07iGqTEuWHuBVOhzqczy1xvt1uMaSYNbYKQ==
X-Received: by 2002:a05:6214:4008:b0:6e8:f166:b19e with SMTP id 6a1803df08f44-6f2c4546788mr247406366d6.17.1745356991131;
        Tue, 22 Apr 2025 14:23:11 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:9913::5ac? ([2606:6d00:15:9913::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2bfcfd0sm61986756d6.82.2025.04.22.14.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 14:23:10 -0700 (PDT)
Message-ID: <99029039e6887b1660c897b25c3792253b477a52.camel@ndufresne.ca>
Subject: Re: [PATCH] media: amphion: Slightly simplify vpu_core_register()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Ming Qian
	 <ming.qian@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-media@vger.kernel.org
Date: Tue, 22 Apr 2025 17:23:09 -0400
In-Reply-To: <e59b3387479fcdaa4ae0faf9fe30eb92a8f6034b.1744927294.git.christophe.jaillet@wanadoo.fr>
References: 
	<e59b3387479fcdaa4ae0faf9fe30eb92a8f6034b.1744927294.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le vendredi 18 avril 2025 =C3=A0 00:01 +0200, Christophe JAILLET a =C3=A9cr=
it=C2=A0:
> "vpu_core->msg_buffer_size" is unused out-side of vpu_core_register().
> There is no need to save this value in struct vpu_core.
>=20
> Remove it and use a local variable instead.
>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

thanks,
Nicolas

> ---
> =C2=A0drivers/media/platform/amphion/vpu.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
| 1 -
> =C2=A0drivers/media/platform/amphion/vpu_core.c | 7 ++++---
> =C2=A02 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/media/platform/amphion/vpu.h b/drivers/media/platfor=
m/amphion/vpu.h
> index 22f0da26ccec..1451549c9dd2 100644
> --- a/drivers/media/platform/amphion/vpu.h
> +++ b/drivers/media/platform/amphion/vpu.h
> @@ -162,7 +162,6 @@ struct vpu_core {
> =C2=A0	struct delayed_work msg_delayed_work;
> =C2=A0	struct kfifo msg_fifo;
> =C2=A0	void *msg_buffer;
> -	unsigned int msg_buffer_size;
> =C2=A0
> =C2=A0	struct vpu_dev *vpu;
> =C2=A0	void *iface;
> diff --git a/drivers/media/platform/amphion/vpu_core.c b/drivers/media/pl=
atform/amphion/vpu_core.c
> index 8df85c14ab3f..da00f5fc0e5d 100644
> --- a/drivers/media/platform/amphion/vpu_core.c
> +++ b/drivers/media/platform/amphion/vpu_core.c
> @@ -250,6 +250,7 @@ static void vpu_core_get_vpu(struct vpu_core *core)
> =C2=A0static int vpu_core_register(struct device *dev, struct vpu_core *c=
ore)
> =C2=A0{
> =C2=A0	struct vpu_dev *vpu =3D dev_get_drvdata(dev);
> +	unsigned int buffer_size;
> =C2=A0	int ret =3D 0;
> =C2=A0
> =C2=A0	dev_dbg(core->dev, "register core %s\n", vpu_core_type_desc(core->=
type));
> @@ -263,14 +264,14 @@ static int vpu_core_register(struct device *dev, st=
ruct vpu_core *core)
> =C2=A0	}
> =C2=A0	INIT_WORK(&core->msg_work, vpu_msg_run_work);
> =C2=A0	INIT_DELAYED_WORK(&core->msg_delayed_work, vpu_msg_delayed_work);
> -	core->msg_buffer_size =3D roundup_pow_of_two(VPU_MSG_BUFFER_SIZE);
> -	core->msg_buffer =3D vzalloc(core->msg_buffer_size);
> +	buffer_size =3D roundup_pow_of_two(VPU_MSG_BUFFER_SIZE);
> +	core->msg_buffer =3D vzalloc(buffer_size);
> =C2=A0	if (!core->msg_buffer) {
> =C2=A0		dev_err(core->dev, "failed allocate buffer for fifo\n");
> =C2=A0		ret =3D -ENOMEM;
> =C2=A0		goto error;
> =C2=A0	}
> -	ret =3D kfifo_init(&core->msg_fifo, core->msg_buffer, core->msg_buffer_=
size);
> +	ret =3D kfifo_init(&core->msg_fifo, core->msg_buffer, buffer_size);
> =C2=A0	if (ret) {
> =C2=A0		dev_err(core->dev, "failed init kfifo\n");
> =C2=A0		goto error;
