Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B1933E1
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 00:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748044993; cv=none; b=LjlIhi+XqcAaIefalXQyQvmTQLtUWkzRN+FM+ExwWOxD/n1275/3COzhCEbM6XQrIdp2rsfb/QY4amDWHdSH8+Ha5IPqT9aaMsX8YBCIczDUaUmec7v1PmQMViK7Ae/GUkrOx87yb/57y0NvrdlLCcBkif8WWN5Q/861v7z24bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748044993; c=relaxed/simple;
	bh=D1rHEs9Rnrh2fo3+SBcBY9k/RBpmLkbdd9w+WxaWi+E=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JnnaOK+eAzlXdgay+kUGvEnFWTWEWYGHleQS927ynN163DegTa0pbPxSrrupz2/VlsyQkqGSGBDHpRl8xwChOPkoEYWdskqlGnQiVKohhvbnw+tEuuQW0zn0vMRb3q/BCfuQTJT8LVq42yr2p+ufhW1xWNIHp8nvRFJVt1fiz8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=vZ1PjET3; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="vZ1PjET3"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c597760323so30268885a.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1748044991; x=1748649791; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=H4opPIOSOsz08wDjPNXDe/THEcgYZeP29JFFlP6TG8U=;
        b=vZ1PjET3KCe/yTcFb2smdpHmj3bNQT3h/Uf8e5oNFzzBZFvM8U8r3vNVnBXltKKnZO
         Um9vpwsh/dly3h5NWyshT0EA6/3uFnLj5e3JAnREqXBOepihnw6qX33nNr4C/sp13b/f
         TNRBU57jASh7alt+ZKHELoj41HbacWF0a1g8be92t+kDtzoGxzc22W2PBsjLk2NuuuT2
         0Uj89uxrXPmJ3wmFnq5my1rgkJHZbKde1c1M9VzfMuHg/NZ91KKtIWv6rU/rilqHOgnP
         8eN24zi/xEvWnpveeK3W0d2ZawKGuXQ6sNyaedxubCxbRjJdpRzHAxlhqxsuSkYROY35
         AF+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748044991; x=1748649791;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H4opPIOSOsz08wDjPNXDe/THEcgYZeP29JFFlP6TG8U=;
        b=gR6LurMblKLEJlQt+MklNeFCXAeglgrcnLB3WXGzPwxG7GSfjThnPiqEs/uO/DkPKX
         jdTbT0AJoTHTCjMcbu3xtxLtajZ3wM9bK2q3aRMp0PBcUbwn0K8zdFmZQVUkcmFEEOoE
         eUpYtjpdr4K88cJcmKVZBI82TTIe8a3I4ZmSXdQxhzzC5/GWAZY5onU5cstDLVYya47I
         VigmUDlPjVFcZhJRpJ9Vx+q+Uj0jlohK24tdHIRCJ+d+5vKhBOW5WYZ6AMj7QfUtXJ7w
         ekCxlhf/ww1i+GH31er+cxcyiIOYb9cK4AW+BV0lef95L0b24nWLWkCzKAemqsUrntqE
         qyiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFT96M/T6tfjvKP0NuUnmGGZOVdH4B01+5X17b5Eae2ogNOGbCyJELN8ZnlM1aBXvoQB1U3LQgdZtbGZI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbZV9gqfMHMnsIfpWHyAQv5vzGQs757p81xOp3kiRwZ2dbfVwT
	Fh7tNqgod65TyJLlnPztdT28qpMK+X/oNImqJc8yZBQBVFPnwmeBVQrhPXpBdIwe1kZHLwQvips
	Rn1r7qfM=
X-Gm-Gg: ASbGncuN0g7kXYGF8/pMvrW0U9mgOmkmbWUtNaMWoTX+AFlQ9UGbUTh/+SvDCu7zokV
	g8aLRDczw+lSOT90RZxLHYr15h/FjU8f8q/Yu1PFa6S8oqJvzYP6VMYoCyugn1Zaf84cQ5aCDFG
	pZ4UBYPKqW5scjti7FtbFQP4b7Es4QT7H/4+vWYTRxoeKkIzU6vJPkvfv5KKiVqiYipCOERU2ux
	DPhZJVa+IEnL0iM0iwm3WUSF2RDe77xFDviXhn75CFNhGuA0bRj/N+/QAvTspsenfa+yXt7irB8
	U+kS0JXSb/fK56XPBzahkzj6TYlWchuz3EY9xizSH3G1IfMykybBgZHq
X-Google-Smtp-Source: AGHT+IGBwAQoWstxEDbk7EcqjEnHqu91vhi+vANL+tSMX7buO7G75pqfgQLBAaGT9HN1knmW2LmwKA==
X-Received: by 2002:a05:620a:19a7:b0:7ce:b9ed:24dc with SMTP id af79cd13be357-7ceecbd2f51mr179211185a.23.1748044990812;
        Fri, 23 May 2025 17:03:10 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b2fc::c41? ([2606:6d00:17:b2fc::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd467ef019sm1253414085a.63.2025.05.23.17.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 17:03:10 -0700 (PDT)
Message-ID: <a40986e970f049aa1448bee662b024e50404e04d.camel@ndufresne.ca>
Subject: Re: [PATCH 08/18] media: coda: Add log to finish_encode if buffer
 is too small
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sergey Khimich <serghox@gmail.com>, linux-media@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, linux-kernel@vger.kernel.org, Vladimir Yakovlev
	 <vovchkir@gmail.com>, Maksim Turok <turok.m7@gmail.com>
Date: Fri, 23 May 2025 20:03:09 -0400
In-Reply-To: <20250314152939.2759573-9-serghox@gmail.com>
References: <20250314152939.2759573-1-serghox@gmail.com>
	 <20250314152939.2759573-9-serghox@gmail.com>
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
> From: Vladimir Yakovlev <vovchkir@gmail.com>
>=20
> CODA_RET_ENC_PIC_FLAG flag means that bitstream buffer size
> is not enough to save one frame data when buffer reset mode is used.
> If this flag is set, currently encoded bitstream is corrupted.
>=20
> Co-developed-by: Sergey Khimich <serghox@gmail.com>
> Signed-off-by: Sergey Khimich <serghox@gmail.com>
> Signed-off-by: Vladimir Yakovlev <vovchkir@gmail.com>
> ---
> =C2=A0drivers/media/platform/chips-media/coda/coda-bit.c | 8 +++++++-
> =C2=A01 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/chips-media/coda/coda-bit.c b/drivers=
/media/platform/chips-media/coda/coda-bit.c
> index 3e3bb3d64ec9..515eb8be4b86 100644
> --- a/drivers/media/platform/chips-media/coda/coda-bit.c
> +++ b/drivers/media/platform/chips-media/coda/coda-bit.c
> @@ -1641,6 +1641,7 @@ static void coda_finish_encode(struct coda_ctx *ctx=
)
> =C2=A0	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> =C2=A0	struct coda_dev *dev =3D ctx->dev;
> =C2=A0	u32 wr_ptr, start_ptr;
> +	int val;
> =C2=A0
> =C2=A0	if (ctx->aborting)
> =C2=A0		return;
> @@ -1674,7 +1675,12 @@ static void coda_finish_encode(struct coda_ctx *ct=
x)
> =C2=A0	coda_dbg(1, ctx, "frame size =3D %u\n", wr_ptr - start_ptr);
> =C2=A0
> =C2=A0	coda_read(dev, CODA_RET_ENC_PIC_SLICE_NUM);
> -	coda_read(dev, CODA_RET_ENC_PIC_FLAG);
> +	val =3D coda_read(dev, CODA_RET_ENC_PIC_FLAG);
> +	if (val > 0) {
> +		v4l2_err(&dev->v4l2_dev,
> +			 "Encode fail. Encode buffer is too small\n");
> +		// TODO what to do next?

Lower in the same function, you should still copy the metadata but replace
VB2_BUF_STATE_DONE with VB2_BUF_STATE_ERROR. Perhaps introduce a state
variable and set it accordingly.

Nicolas

> +	}
> =C2=A0
> =C2=A0	dst_buf->flags &=3D ~(V4L2_BUF_FLAG_KEYFRAME |
> =C2=A0			=C2=A0=C2=A0=C2=A0 V4L2_BUF_FLAG_PFRAME |
