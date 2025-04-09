Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CAB2561C2
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 11:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744197742; cv=none; b=dJI4ULu4D760nU1Od0+uWngburiuO/qtkvlOTh2yMDO3YAG8GLrXi8l7QGd63DCv2tVjh0JrV0+OHe177ATMBsjL8Yhak8qI8mAZn4yA8M3UzjpbMAi2J87TIazhWN8+M1pnUezk1FcQnQgEonMgaANFNP2AK5OZlGZqVuGbTms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744197742; c=relaxed/simple;
	bh=B+7bvO3lKFW0aylYPgYmk7X3zfx0r63tAkXBwA//5UE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kvuKDMz47nullfibuJWX1mn/TAWAzlIXnw+pRHArg9vlD91IIBWHTQopPj5UEZtLVct7btrTlH6UQ74FJ3LKRTgzpGUbMHtgxPwOkbu+eMKMw6ZUe0xt1tOQvIIMnxeAyEZhPU0ayc+qsGhjtIhntjoBZj/5XrAZh7MRmto16vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fb7DzSq5; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fb7DzSq5"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3965c995151so3372595f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 04:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744197739; x=1744802539; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XNIF4tYvlT4HtlqHyWvypv696ndc9VfNTquhjpGjigo=;
        b=Fb7DzSq5irnETTnwbyCD23K4sPiwpU98hEIwLyCZF8E1Dir4UWxLXtunzxKPi+kr71
         iNHDoqagSc0P7sFnjp/uvr0bLJoHrSkk5oWp1z0xqNW55XTG4K7NPjpPdVPHg6ipNyYd
         /EO0ojCHw5msRl99jmj5NMyYNnP/JBF0+pRPbHrLmWI1nHW5eE/4S/ayy1+wXZO/0cyO
         jDHvSAAJJ0yVoDuuDJD+UlB2IgyL5ZvR/mXOUMb8Nttp7G66WDiHFqMlLlRJdtitWGPj
         wnsgWI1Lk8VezsGMeXBZsO3cgFxUg3ZwdFm5i8w3ZLvETJPuAUVWhwSqu7qdyJXIBTbF
         ln4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744197739; x=1744802539;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XNIF4tYvlT4HtlqHyWvypv696ndc9VfNTquhjpGjigo=;
        b=QWGGkW14+8gsKqKRUvJZ2uWDDxdhXZf1THHEASncf3G6j8JgDfsN9vr2riraITFUOP
         tYjpgJQflCyyNBaraa0bpFRcNcqvxCi9l2tOcPALDORd2jdeEvGpQTIzYao6HvKp5Uza
         CcHKVGf9JO++ZEZKUgxyCK4WLPYMKLP/f7PHkRUi7VDZTBoPRGpi8k1YC3hzqjzhC+gz
         LuRrekwviBeYOvZxWk7/NO2KumQLXD40OoLdsQ+a1HLKZSKUPISsmIELRNl6hrBReHHV
         Beh1m0iL7mCX3vf2g/RQwtWZ7CJDmRmx3CkmlecmGO1oYoa6UaFbzFZDkapumOdCoNyj
         v2+w==
X-Forwarded-Encrypted: i=1; AJvYcCXN4QiLVFJ6USSnbpCEiN/SDiGUgnzNziDlRdBzKK3/uzKk00AJ2mKPYQZ8rgROggvg7ZxA7LaE/uAWDrQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YycySnGszMVk5tIcdk+CcMI3wdLOaRiR8mvtt+H8cUqnnprxodr
	OEJEp84YMfb3QUpxIE3yK6um2djli9cG3HVGEAvZH1didWtEjno7
X-Gm-Gg: ASbGncvBM/fig1oyb0bvjxkei7anFQ3+t0xKct431mketfgZA2qRuEF9FcpeWiHih0v
	kOfxIXhyKtjlIQcom0jxZqgC6IDD1Ed/yOHFaeHfT1EoK4ZvfLpJBBU8T7WhwQyqEeVRnd3sMjv
	hoY31GLeyTOxcQnUdkpwPgbwRrY3WCpjRUiGZ4koVwhJz00ZIwXXPJPN4gZ5+yuJxszCC8dqEPF
	FFu2fO+fiFS/RgPhYSy21+L3EjGWS2t4HJn451mkuAgR7ZQSzDaXvXJLxQMxQH4aL5Sa1+r4bCr
	PWBsY8kQjFubNcWGYoc9Tk4r6/HJIoO8T1pDmGQAY1UUgU+429I=
X-Google-Smtp-Source: AGHT+IGZsN4H73Ax2Gfnh0e8fMsPZGwpetqpePrvoTb4VCAuqX0OWTeXNXYhkOf299IK2Z5tkz2b4Q==
X-Received: by 2002:a05:6000:40c9:b0:390:de58:d7fe with SMTP id ffacd0b85a97d-39d87cdc2c1mr2226345f8f.51.1744197738762;
        Wed, 09 Apr 2025 04:22:18 -0700 (PDT)
Received: from [172.16.8.120] ([197.155.71.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d89361290sm1367992f8f.17.2025.04.09.04.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 04:22:18 -0700 (PDT)
Message-ID: <9dd38b27ac15fe9d76e326e4f4c05d71a18b2154.camel@gmail.com>
Subject: Re: [PATCH v2 1/2] staging: rtl8723bs: Improve code readability
From: Erick Karanja <karanja99erick@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, Julia Lawall
	 <julia.lawall@inria.fr>
Cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev, 
	philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Wed, 09 Apr 2025 14:22:14 +0300
In-Reply-To: <22a2c8a7-9669-40bd-b886-713833de5cc4@stanley.mountain>
References: <cover.1744192642.git.karanja99erick@gmail.com>
	 <97a2637f3ccefb3de0e15fd04f29f5f209f2a506.1744192642.git.karanja99erick@gmail.com>
	 <3dda7f97-4ed8-cf6d-9310-60ed6259a386@inria.fr>
	 <22a2c8a7-9669-40bd-b886-713833de5cc4@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-04-09 at 14:11 +0300, Dan Carpenter wrote:
> On Wed, Apr 09, 2025 at 07:04:18AM -0400, Julia Lawall wrote:
> > > @@ -729,10 +721,9 @@ static void hal_ReadEFuse_WiFi(
> > > =C2=A0		}
> > >=20
> > > =C2=A0		if (offset < EFUSE_MAX_SECTION_8723B) {
> > > -			u16 addr;
> > > +			u16 addr =3D offset * PGPKT_DATA_SIZE;
> > > =C2=A0			/*=C2=A0 Get word enable value from PG header
> > > */
> > >=20
> > > -			addr =3D offset * PGPKT_DATA_SIZE;
> >=20
> > I'm not sure about this one, due to the comment.
> >=20
> > julia
> >=20
>=20
> I feel like it works.=C2=A0 I wish there were a blank line after the
> declaration but that's something for a different patch.=C2=A0 Both of
> these are okay with me.=C2=A0 Try to be more creative with the subjects
> next time.=C2=A0 (Just put the file name in the subject because that's
> the only difference).
Thank you for the review.
Erick
>=20
> Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
>=20
> regards,
> dan carpenter
>=20

