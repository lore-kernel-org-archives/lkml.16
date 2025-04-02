Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431932AEFB
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 15:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743608256; cv=none; b=i1DqsYbQjpjhlaIPW6OVaatVprts/DnI3BVSbMPUgPCZvQxF9jIAVDNAd58UIITdot7d4eZ3HKp6CN/EWZ/sFWcfXaf7rNlFI8zOlLj0tQPUdxDfRkjbVOXopqgH8q8VIpDrWoDPuhlSCcubTVER3+q8lJ1xuhEUK55KIXiOCN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743608256; c=relaxed/simple;
	bh=qOAWHJJYiFzc3hDjDpDucfpGw87omsXRrilcS4Wt21s=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OQG6Yg5JgwywR626KGoofnUHCPP1ZmzabN/LkB2VJeVhEM+IgYl20N59S2U36J+BJU9ZK8sib8Ksl6FMNjn7z5vxDgKVt1MOEU70NTjG/W7mAaufA5qve8dUUlLAe0BHX1ZKbt1KOJ7rOxThwB+t6LYaTGq0Y0IZEx526ETdVcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=JMOsNP21; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="JMOsNP21"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c5f720c717so103788785a.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 08:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1743608254; x=1744213054; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rhmKnF0oiTEPkeisoeZbaGPYtFNcuzXscDMztyaRd+w=;
        b=JMOsNP21iHgoTZypjYxuN+YvoQlf522Q16Gopmu76pyK0c+0gS6821XPQ4QEF78nYR
         nDYWhVJuL9bQtDj0qbr8gvCeimg2JjhLIcBUo+0vnP+4WIRdIoaMMCpDSjMnEZVl0s6D
         1IeKwamApjeeSjzgkJ4L7zMukGQdKuw2LvXYoGYlUVYu2kM2cwCaof1RR4Gq1A2jsiF+
         kPcYO7GJ21VuqyhxswKEIP3syC7iQjciRTjE+kqzooTsryYuTUFBKPcT2K42Y8Ggy5TN
         sMWh8qKonarghxcEUbRibUcQMKmgx9taz/QTDRz4waKDf4/32ikwLe1R5bnN4IwroNBX
         iS2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743608254; x=1744213054;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rhmKnF0oiTEPkeisoeZbaGPYtFNcuzXscDMztyaRd+w=;
        b=lMhzCH/HsNfCu2U64KpKxezLfBFyyC9LTJAppPPIjykQHXJVIioEM04VNAGjsmnd+B
         ekWbmp8fO4g2rBKDBSS52K61n9rwqWkfe/MOEY6SDdOytMTfkkbQGj+TYA5DlUzP5d8l
         mKcaBCzLxxjTHYQCLkN7FaI5IhUFkZcT1gEkEmhdm3CZqdtRAsj/vZfr7hRr3bxUtJkP
         ynzXa/TzvRNOEKSgT2VAXRTId9hrzllSIeyYXyoIOr0IkYARv3MIU4zaJdq6eo6PkGnK
         zcUqmCJ7zphzDp2lyNOkmIA93JcJ4NoBijoImgsydxxQMnHA7v6eJsmWWqZiNTQ0K4CM
         B+sw==
X-Forwarded-Encrypted: i=1; AJvYcCW0SAv5PK1fL3Vb7JfuxO+kLDgHzaizEW6QM/2i63ZNIyqPCEDfsxS7eI2lYHW8sWEeMw0p/IB9PzT6muk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4EsfEsG883diew9kXn8uKMlCfwUSSb7SF9A5GWUD4/BJIs1uG
	Sxld51YB5jBTRiG7wSI/TR6rXOOGfsSS8ykyz2nd5gXMOliSyMe7MZwrzL6LKDc=
X-Gm-Gg: ASbGncu+Iy7Fxx7tiqInYi5tgwqQy8v89N2GDaofXgxml3FemP8OPmeWxvtXyv9crtk
	KTr8NvPWtp5ZWCgwCH08quvnFff40t0fFnFJcWhf1AuXFCm2cHXrYE9E36Tkxjc8K/n2VTIhwES
	jXODC2UGJOXUFpdxkRLyrfuIs6CJZz34DD7+GcEuDnJwxRzuDf2KdrEhWgd+gxjjH1lRP+TF5Tq
	BMHaAatofTcGJoYxDdUVv3OyrDTD0TEMx+rdO25GYaa05MH3iEdgeHGxNUEMmt4ewllSKAxbFs5
	L8W80Jw1dHTqs5tD9x2eudF6avBFwzdX6binXUVOeyXx/XS/lA==
X-Google-Smtp-Source: AGHT+IGt12U4LeoNV08d0rSucCuL30UKo3Q/u+eYpiDfdZNZWOV5NQwkfWw/ZI52IiTuX89vZtkt/g==
X-Received: by 2002:a05:620a:d89:b0:7c5:9452:4a60 with SMTP id af79cd13be357-7c76c970550mr2456785a.5.1743608253843;
        Wed, 02 Apr 2025 08:37:33 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:e976::5ac? ([2606:6d00:11:e976::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5f77804a9sm796103585a.112.2025.04.02.08.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 08:37:33 -0700 (PDT)
Message-ID: <cfc905988dda23078b5086f3eb0975863bbb6c2d.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mtk-vcodec: Fix reference count leak in
 mtk_vcodec_fw_scp_init
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Miaoqian Lin <linmq006@gmail.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>,  Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Fullway Wang <fullwaywang@outlook.com>, 	linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Date: Wed, 02 Apr 2025 11:37:32 -0400
In-Reply-To: <20250318110556.903-1-linmq006@gmail.com>
References: <20250318110556.903-1-linmq006@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

Le mardi 18 mars 2025 =C3=A0 19:05 +0800, Miaoqian Lin a =C3=A9crit=C2=A0:
> scp_get() returns a reference that needs to be released with scp_put().
> Add missing scp_put() before returning error in mtk_vcodec_fw_scp_init().
>=20
> Fixes: 53dbe0850444 ("media: mtk-vcodec: potential null pointer deference=
 in SCP")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
> =C2=A0.../platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 5 +++--
> =C2=A01 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_=
scp.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
> index ff23b225db70..11ab3bc60217 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
> @@ -71,7 +71,6 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_scp_init(void *priv=
, enum mtk_vcodec_fw_use
> =C2=A0		pr_err("Invalid fw_use %d (use a reasonable fw id here)\n", fw_us=
e);
> =C2=A0		return ERR_PTR(-EINVAL);
> =C2=A0	}
> -

Might sound nit-picky, but don't do style fixes in patches intended for
backports. It increases the chance of conflicts.

> =C2=A0	scp =3D scp_get(plat_dev);
> =C2=A0	if (!scp) {
> =C2=A0		dev_err(&plat_dev->dev, "could not get vdec scp handle");
> @@ -79,8 +78,10 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_scp_init(void *pri=
v, enum mtk_vcodec_fw_use
> =C2=A0	}
> =C2=A0
> =C2=A0	fw =3D devm_kzalloc(&plat_dev->dev, sizeof(*fw), GFP_KERNEL);
> -	if (!fw)
> +	if (!fw) {
> +		scp_put(scp);
> =C2=A0		return ERR_PTR(-ENOMEM);
> +	}

With the above style change removed:

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@colllabora.com>

> =C2=A0	fw->type =3D SCP;
> =C2=A0	fw->ops =3D &mtk_vcodec_rproc_msg;
> =C2=A0	fw->scp =3D scp;
