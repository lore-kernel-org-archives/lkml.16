Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634051401B
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 00:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748045228; cv=none; b=ClxbNjshd+8TAPiVdSfTSXT+PcYmoV/ZNrwTlQccyvfdKJIw3jkSI2micyQunTTudqe6SgGNwk2GkBfgXyMv66fQNC6H79fUOqQU15WTSPltdSB4teAT2UFAlTEBVRUpfBKYoZ8w7wlmn6AGnw9P2RQFbO+3thpHUlPoh/V6TJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748045228; c=relaxed/simple;
	bh=gkfs6iShkZzxqmST28I6UZJPTMoF/O+kKXk2E97Xgdg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AzMo1cxiJB/flDjhDCtwZhvON9G+UfRtEtXJrFbHLRNWXMMqhwkNrjAWgzWps4OahP/6/da12Xs9XZOXT9m/KH/+hohe23RpJHIBEYo2dviK7pXUiH2ImlKL6kNmNTTtPFmvlx4/T8vsQ+Z+eLvFOhrlkpE73FdM2PM2TUeEcqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=SbgaL1Kd; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="SbgaL1Kd"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6f8c3db8709so5140886d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1748045226; x=1748650026; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=w2v6oPiR0TpWgcv0Ui7wcKxLp1yAUHwVBhhO5ks6C7M=;
        b=SbgaL1Kdxnp/P8fLg6n8my4dRzKlD3fr3eW4r5MAF4M1+Sn4MIZOHflVL9qa4sEBv/
         h+6h123xUs0W6bf6RnUk42CyT+J0pCZhi4wVTGdvdg/NIQYASz7JQB0cOMJ9WIbGRNOl
         tsSVA2RqyTtxKzVH6wTV5JWlMIS7QGkJxXIEFc/Nqp+cn728MAS7aaa/2Nb0RsKvjMsX
         2LpSVrSd1VXt9tpD9UVsdenq12EDK89KiKXEeFwqZDoztjhLWF1i6D89D1iU6hPWw0WS
         KBCAV3XDDommQAdY6nXBMrozdakrRQ6vmlBTSFZJlFmYdiIbi0KGGt7ClEt5/3AXuK5T
         z8bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748045226; x=1748650026;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w2v6oPiR0TpWgcv0Ui7wcKxLp1yAUHwVBhhO5ks6C7M=;
        b=cDfz2I6Wsb6ehGWEqtnY66LsSWHXqPd5663I9KJtT2UF4zcPULt9qtE/W+7YoOptyN
         HwWCshZ3OmUOag/0btpnz3xA7ew5iQiyITlfQMhXAFlp3e1JyU8LbJoInKHUV9hImvf9
         IC2OgBcUvqSBfctNcHlLnFA8fbjyIXu6hnjEWlNwir62RR1ev3vBVe2Kp7xnV5+L6m/B
         5sGnaTVgdFxA+m27s9pfArVUqyVcs+TdnO4TmMQrN0nXoOUW5xH6Cun3hwPc22t2CnI5
         51ozY5/4flpW3Oy0oqenwepuulgDro3iSD570dKg3FdO3S0+6+w/3bTN3CxJ3XVhD5bX
         0j9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWaQhe8NAihYQDQn5WbTKyyPi9+f1MSRbc4Oqhm1t1Sg2O9FReZ9E22oYn8pvh+mPIKNy4UQ8A8N33AkUc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDYjoJUE2ZCyX/oI7HmX7qM09d9ovPrnNdcy1NzuxM+/A64P3c
	Dr1tv3OqOOhvFxJ98SXnra2P6i4J/TM3TcGkVaCUTWS2YdlpqQWuVXyYcBF4VZaCwnY=
X-Gm-Gg: ASbGnctvnjprP17BC0pidLqGM+WJRvP3qjHjQBSyjRhfeEI3cldCRwvzVta3VrsieTn
	orRxKB4jrCvjkVFXU5NYgX2lWqgDfmk9nvcmHKlDzm6s2QH41UM4LVhHwotdAKvR580XktJE133
	fiXzn/uCojRCP2pwl6TMcjI3MQc6LfOWFWLX+EyQhA7LFlrhKVV/0UGBqpW4HdECnMzqaUyhUYz
	HHohMdG3JDtFIDS8MCHXdQHP3bV8Lh33QNKaz4NGN84JWdsDV1WSmE+2xC1PNdC9qvNNfRpobMq
	yBYI0aMqQB4Un3QKU/St69/tQwDd24++Y7MgM2JARl4MRqXpoJeBVP/u
X-Google-Smtp-Source: AGHT+IGD9e17824qKyd+B1gosd9Ns80AmHmBePi9Z8UI0Xsqhm4+eWfNjMArpT/NS6/AeerCmI7lBw==
X-Received: by 2002:a05:6214:d6b:b0:6f8:d50a:aea7 with SMTP id 6a1803df08f44-6fa935b5183mr76231986d6.10.1748045226169;
        Fri, 23 May 2025 17:07:06 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b2fc::c41? ([2606:6d00:17:b2fc::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b0884038sm121929706d6.15.2025.05.23.17.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 17:07:05 -0700 (PDT)
Message-ID: <f4ced91cbc1e52347189a91351fcde17f021bc09.camel@ndufresne.ca>
Subject: Re: [PATCH 09/18] media: coda: Fix max h.264 level for CODA_DX6
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sergey Khimich <serghox@gmail.com>, linux-media@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, linux-kernel@vger.kernel.org, Vladimir Yakovlev
	 <vovchkir@gmail.com>, Maksim Turok <turok.m7@gmail.com>
Date: Fri, 23 May 2025 20:07:04 -0400
In-Reply-To: <20250314152939.2759573-10-serghox@gmail.com>
References: <20250314152939.2759573-1-serghox@gmail.com>
	 <20250314152939.2759573-10-serghox@gmail.com>
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
> CODA_DX6 has h.264 decoder but v4l2_ctrls of level wasn't setting

Perhaps:
CODA_DX6 supports H.264 decoder, though the maximum level wasn't set
properly.

regards,
Nicolas

> for this device.

>=20
> Co-developed-by: Sergey Khimich <serghox@gmail.com>
> Signed-off-by: Sergey Khimich <serghox@gmail.com>
> Signed-off-by: Vladimir Yakovlev <vovchkir@gmail.com>
> ---
> =C2=A0drivers/media/platform/chips-media/coda/coda-common.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/chips-media/coda/coda-common.c b/driv=
ers/media/platform/chips-media/coda/coda-
> common.c
> index 33c7e8398f31..555b73816952 100644
> --- a/drivers/media/platform/chips-media/coda/coda-common.c
> +++ b/drivers/media/platform/chips-media/coda/coda-common.c
> @@ -2440,8 +2440,8 @@ static void coda_decode_ctrls(struct coda_ctx *ctx)
> =C2=A0		max =3D V4L2_MPEG_VIDEO_H264_LEVEL_4_0;
> =C2=A0	else if (ctx->dev->devtype->product =3D=3D CODA_960)
> =C2=A0		max =3D V4L2_MPEG_VIDEO_H264_LEVEL_4_1;
> -	else
> -		return;
> +	else /* CODA_DX6 */
> +		max =3D V4L2_MPEG_VIDEO_H264_LEVEL_3_0;
> =C2=A0	ctx->h264_level_ctrl =3D v4l2_ctrl_new_std_menu(&ctx->ctrls,
> =C2=A0		&coda_ctrl_ops, V4L2_CID_MPEG_VIDEO_H264_LEVEL, max, 0, max);
> =C2=A0	if (ctx->h264_level_ctrl)
