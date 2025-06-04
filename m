Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EC818B47E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 15:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749051327; cv=none; b=XHjon5sGHxbqvxlRbme/8Vdvjy1Z5NdIR/rfd0jA/6riJcSBHwx0gQeLOGSdfDBx/VkgvzejbeG4xX3mQJkIkBCBFu+72aPbLyedzDp7/v2unqc7ghxB8x1omuvvMRquaTi92JXhCCtoA3pqZTPufhBpjHoKtHGXgbdUnV5snYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749051327; c=relaxed/simple;
	bh=YoMzcreeLf0Uer5t9WftYAytQbmcukCa1uEM4ng5180=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GbAmglUtEOClnUikaNjxyAoQhGcQIeyA4gQoaXf9kbAlr6hkPvs4IvIQ1yRz/dFaDjpq38vGU2LZWfV1/b2fDLhE84nA8CCR5IXDuRFxJYegl0fHy138hK/b80DRqihvTwNXVayK2s4bjZ1XrKEPl4ZjUhZeGbgUVbpQi5dHKi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=v3je2yRK; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="v3je2yRK"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6fadd3ad18eso412506d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 08:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1749051324; x=1749656124; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=q7DZnXDDw2f7bOVU5h41kTY3jPLyxY+7Em6dlbFk/dY=;
        b=v3je2yRKPLXrJXXyYD0Yu1k5/CIu+2uUpSHbWDjPdzzgiHkgyX4mCskNkHieRVWiek
         ZrBiJ8Z0wqtFrNXK0FOkJfxJvvhAzMtOEWFAAs8uPhd0nsaCHTp83/A94uOZB6SX0Rd3
         qA32E6xyq3CyCxVilcJ+cQuIbN4aX7EPNdDTqKCM2Gi1v+uC3khauMvETzsWebMJ8rg3
         wyp4PS7H7Ttn+4Qn0a0O56PWoKkjf/ANE2c6HJCWrjgRj4ffoMLgIr1MUdHZUBxMOpAJ
         QWfw5A69NQlYRrCI1R97Hk42eH+Ncv3xM2vhtRmQptTCyFMg9UMzpl0xAdQhfv7khePU
         ovfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749051324; x=1749656124;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q7DZnXDDw2f7bOVU5h41kTY3jPLyxY+7Em6dlbFk/dY=;
        b=RbuHT4RV+BpM5j/HWpkCQWs/E1iOpq5Z0nm0c25d9z9saOHsaHrla/jMXXjkCxo2fC
         2VsWJjqTPI6PunLeNvAZakDiyP7ZO2/UcZ9UCatameJK/dD7E96/UrEJeh2lk9EIzn/6
         fb+5W930l0mNnCx6ZGtCl2xftRZthAlXOTN8Bx3OrKP+dsSAjuuFn4a8lDKROkckZo3h
         m7kKnawTU9bVIWBoncB2AwYSC1wu4C2VLAYrDpOmX9XsiPwZE1tyMb/KKfJGTwPn91gy
         2pYxSi9JzvWJwzbeAuLYKMZQ4qMAVZsKxm1iLfZtN3h2Hy7kSBFytcSdMP7NCkZJZCb5
         m8DA==
X-Forwarded-Encrypted: i=1; AJvYcCW2MJbmsMjhdEzFfy39MEHsSpY5LMMdNLysxN7J5T+e7KsUqUt3RrWMJOH/9IugdBPlOS8ZfliBATKSGso=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/BLL9dG4Rz1qJvGzHhYqktz93XwUdNW80sP26TXW/e03BwO3w
	Ftny2dTuelhT/z2Gw8r6Dl6Qwpyyvq2m273CloQdFUe4YK0TX2Dh8jfJqfEVLweAwLc=
X-Gm-Gg: ASbGncspzLW1Nvnk/T3yJmomq1/g5akNLj59DmhWJkhdlY0VghSJxQ9B+ZdZeFjq/cL
	JtWjpK8q9fYwP476jiWI4FSPtAtg1MSqC/YWK4XEylkvS7Zl7Ecv0AdfOri+OV7NunpqvRhyMAt
	8obskGTlYwA+fBBEn5PvtPOFBQNZPkULET70TCD6GDxhOwetyYF0rXaiugx8EI97FaV2k2CU+gJ
	7c2cK8H6J93JN6wlY3JfpfDCTcK1lhwSU26kegP239p7CeV37whArFBTp0110zaENo140Vse+Fp
	/HPQmAQODFvsO2kDgP5eO048ZUxJDNA4rR22JarOxnX+Zo8MV9tTecgI
X-Google-Smtp-Source: AGHT+IFTVb5P+MMCAOPUE3KfAdaPQyevv0cConXsNDIySkFVkZ+c+t8LYnjxLTtV0EwxgimezZwiiw==
X-Received: by 2002:ad4:5de8:0:b0:6fa:9baa:fad9 with SMTP id 6a1803df08f44-6faf6e87e73mr48632366d6.17.1749051324172;
        Wed, 04 Jun 2025 08:35:24 -0700 (PDT)
Received: from ?IPv6:2606:6d00:10:5285::5ac? ([2606:6d00:10:5285::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6e00d37sm101270436d6.79.2025.06.04.08.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 08:35:23 -0700 (PDT)
Message-ID: <254309f1c527d782e0c50c425602c94683f395b6.camel@ndufresne.ca>
Subject: Re: [PATCH] media: v4l2-ctrls: Fix H264 SEPARATE_COLOUR_PLANE check
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: James Cowgill <james.cowgill@blaize.com>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Ezequiel Garcia
	 <ezequiel@vanguardiasur.com.ar>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>
Date: Wed, 04 Jun 2025 11:35:22 -0400
In-Reply-To: <20250604143552.2955475-1-james.cowgill@blaize.com>
References: <20250604143552.2955475-1-james.cowgill@blaize.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi James,

Le mercredi 04 juin 2025 =C3=A0 14:38 +0000, James Cowgill a =C3=A9crit=C2=
=A0:
> The `separate_colour_plane_flag` element is only present in the SPS if
> `chroma_format_idc =3D=3D 3`, so the corresponding flag should be disable=
d
> whenever that is not the case and not just on profiles where
> `chroma_format_idc` is not present.


The fix seems correct indeed. This has no incidence on any current driver, =
since
there is nothing upstream that supports decoding 4:4:4. Would you mind if w=
e
extend the commit with something such as:

	This prevents invalid flags being passed, though no upstream drivers
	currently supports YCbCr 4:4:4 decoding.

Feel free to to suggest a better edit. It will make stable people (and bot)=
 aware
of the patch priority. I can make the edit while applying.

regards,
Nicolas

>=20
> Fixes: b32e48503df0 ("media: controls: Validate H264 stateless controls")
> Signed-off-by: James Cowgill <james.cowgill@blaize.com>
> ---
> =C2=A0drivers/media/v4l2-core/v4l2-ctrls-core.c | 8 ++++----
> =C2=A01 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4=
l2-core/v4l2-ctrls-core.c
> index 90d25329661e..b45809a82f9a 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -968,12 +968,12 @@ static int std_validate_compound(const struct v4l2_=
ctrl *ctrl, u32 idx,
> =C2=A0
> =C2=A0			p_h264_sps->flags &=3D
> =C2=A0				~V4L2_H264_SPS_FLAG_QPPRIME_Y_ZERO_TRANSFORM_BYPASS;
> -
> -			if (p_h264_sps->chroma_format_idc < 3)
> -				p_h264_sps->flags &=3D
> -					~V4L2_H264_SPS_FLAG_SEPARATE_COLOUR_PLANE;
> =C2=A0		}
> =C2=A0
> +		if (p_h264_sps->chroma_format_idc < 3)
> +			p_h264_sps->flags &=3D
> +				~V4L2_H264_SPS_FLAG_SEPARATE_COLOUR_PLANE;
> +
> =C2=A0		if (p_h264_sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY)
> =C2=A0			p_h264_sps->flags &=3D
> =C2=A0				~V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD;
