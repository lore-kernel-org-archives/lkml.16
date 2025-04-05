Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EC918BC3D
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 14:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743864225; cv=none; b=qTQ72WTqAkzfcZIdAhSAsic1MaV6ERbYzHM/VehRKBl10kjiywDZzJiDj7ufg9R4F5x9LEq8UYHNTk+lETyQoLN88iIY2BQdjpvGIYCptDNqxNZ1nAg5m9P6dvZTPWw+QWjyplAtnpMjrieLEMbkIefHEEOaday2nACe6pl8rGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743864225; c=relaxed/simple;
	bh=/RGGbQE7wSqcx/CNweEXfbTvRvbRag9wVbkeqkx8iS4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CsB9JsNnd5FNW90Ao9b9VAVceFTpZe2FfSiz/fLcdbsCPq2TfTvELpSykkuW+GVvdQGhRrvCM61+gSs7SLDS8CCkZvpyDPQgJx/HhFlgPGeU61erF5UI3I7vxgsYzvaYYzTnDGrRTzFJGt5MHUDWnTncJ4MjII4FvUDY8BfucTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PuK7UCMc; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PuK7UCMc"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso2513429f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 07:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743864220; x=1744469020; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/RGGbQE7wSqcx/CNweEXfbTvRvbRag9wVbkeqkx8iS4=;
        b=PuK7UCMcgtMbUmfa8VWp/btgkGrAd/8F1sFlbNjO//TMIF40zcBi2NJPTDpUUO+Wmy
         +mcwOfgIUdpiY1zNEVk+Fbr1VWMzZ6nh2I16BGV6kYCyjDLb9rf8dwujRkc+DpcaGkTr
         idMoYajXeYZo410tZHdJkUE2DGcJVpe8swWWlyGuWCKC2cjevk+qijvc3ThSIQ6+mzw8
         IgqEn2k8beFMNUbS5aEIALsF+U1qY66y4ZXa79+BWypkNZ1ZXL9K3aTeIM59vsG7UyKj
         UtD8m7V/AyRA+0/DliLc4oInOwMhqgym/zAPwe/JNrEZiRvQwrfJueO7qehQsAycNOAI
         E2lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743864220; x=1744469020;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/RGGbQE7wSqcx/CNweEXfbTvRvbRag9wVbkeqkx8iS4=;
        b=xVhGKNYEetdtdECTzTIIZiroRASkbP3fsrlUpQkLVmqSF0QSYbn8gSc2kzJh79ccCm
         tDlfR8wGQmw07mQKxNH6UOH9vBL1QV12G0fL/xpagMFNnNHXT0GXm0CatquEOP+Ju01h
         GsbH7kwM7xr5Hk3P65+/5yz2V6Se3G5XRjeOkSgX340x0lIAewU6/mCARCAJq5TIqCI4
         R7DDwT/+cFsNZD94+ACsbqBRflAkni6uvgWQ+RUVhOUnj5vyGXe1VemrZLk+OhL3GpyD
         GoWpI5syoy88Ly15LF/7P1lvkzla2HlScJxiEljj/6ZxRkz4xM826+9fQGgJOhB4qgWk
         V28w==
X-Forwarded-Encrypted: i=1; AJvYcCXXadk65OUMJV6tQBZzScjafYBbhrWm5OUGTs/gLQ4OQ8qr2YBH81r1AML5FxsX0Ej7x4+rNv/0N8KbBvA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4nWl6YpaHSIy3JeXTFwLA5vJU+NRsVZxbLcnOy0iiDg/ScAOI
	bWkCHQyxO/UW5jR0Z9/qnbvPSNHdNiQLsI+YSm4Ig5mdnHWzXD3SW45uAlSZnGQ=
X-Gm-Gg: ASbGncsoVP3lxNRGOhHvPaYRaT5XG7FGi+JtbtoiPFUFjXrvunLXOFPsAKQu39EMKh5
	BTDRITLQVr+B1Yu5He9ItRNNKuBfdhq1TZRSNU9+M9ZHdRdlLar3Umj4t/Vsazo5xh25kQkSovT
	uVInSZ6xtVAgY/LSg3UGZ70f6DrV8F6AuEYUAPOar97C5qr6dasRIubdjtHERmJgVrlWvdZFFZS
	d+RqujOnfI8TjdTXdUqsi227xnx5SNn8XpN9WblUWeTe8+L7120sie/3AXTgn5WyAKFWPKbJSQ2
	BG+dkKSw7pV5PfFmAzoidMWgiBR6EaoUzgjFZKxuG9UY/5ot7WlFrcHksg==
X-Google-Smtp-Source: AGHT+IHkyI+chZMq2B1z4osT+V2Q5vUQS53pGFGGOllCNhmpztRxq/RKdq0sPw9xsvq9dYkLFHhWiA==
X-Received: by 2002:a5d:5848:0:b0:39c:1efb:f7c4 with SMTP id ffacd0b85a97d-39c2e65a54fmr9106559f8f.25.1743864220048;
        Sat, 05 Apr 2025 07:43:40 -0700 (PDT)
Received: from [192.168.43.251] ([197.232.62.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c300969e1sm7151427f8f.10.2025.04.05.07.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 07:43:39 -0700 (PDT)
Message-ID: <92f451551548518fe2bc6ebbdbc84efb8cf5ca32.camel@gmail.com>
Subject: Re: [PATCH 1/2] staging: rtl8723bs: Optimize variable
 initialization in rtl8723b_hal_init.c
From: Erick Karanja <karanja99erick@gmail.com>
To: Julia Lawall <Julia.Lawall@inria.fr>, Dan Carpenter
	 <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev, 
	philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Sat, 05 Apr 2025 17:43:35 +0300
In-Reply-To: <F6AA5BB6-46A1-457C-BB99-D26D3744738F@inria.fr>
References: <8ce041b2-087c-4d47-891f-28ecc0c91c76@stanley.mountain>
	 <F6AA5BB6-46A1-457C-BB99-D26D3744738F@inria.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2025-04-05 at 10:28 -0400, Julia Lawall wrote:
>=20
> > On 5 Apr 2025, at 10:19, Dan Carpenter <dan.carpenter@linaro.org>
> > wrote:
> >=20
> > =EF=BB=BFOn Sat, Apr 05, 2025 at 06:14:48AM +0300, Erick Karanja wrote:
> > > Optimize variable initialization by integrating the
> > > initialization
> > > directly into the variable declaration in cases where the
> > > initialization
> > > is simple and doesn't depend on other variables or complex
> > > expressions.
> > > This makes the code more concise and readable.
> > >=20
> > > Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
> > > ---
> > > .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 155 +++++--------
> > > -----
> > > 1 file changed, 41 insertions(+), 114 deletions(-)
> > >=20
> > > diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> > > b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> > > index e15ec6452fd0..1e980b291e90 100644
> > > --- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> > > +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> > > @@ -152,13 +152,12 @@ static int _WriteFW(struct adapter
> > > *padapter, void *buffer, u32 size)
> > > void _8051Reset8723(struct adapter *padapter)
> > > {
> > > =C2=A0=C2=A0 u8 cpu_rst;
> > > -=C2=A0=C2=A0=C2=A0 u8 io_rst;
> > > +=C2=A0=C2=A0=C2=A0 u8 io_rst =3D rtw_read8(padapter, REG_RSV_CTRL + =
1);
> > >=20
> > >=20
> > > =C2=A0=C2=A0 /*=C2=A0 Reset 8051(WLMCU) IO wrapper */
> > > =C2=A0=C2=A0 /*=C2=A0 0x1c[8] =3D 0 */
> > > =C2=A0=C2=A0 /*=C2=A0 Suggested by Isaac@SD1 and Gimmy@SD1, coding by
> > > Lucas@20130624 */
> > > -=C2=A0=C2=A0=C2=A0 io_rst =3D rtw_read8(padapter, REG_RSV_CTRL+1);
> > > =C2=A0=C2=A0 io_rst &=3D ~BIT(0);
> > > =C2=A0=C2=A0 rtw_write8(padapter, REG_RSV_CTRL+1, io_rst);
> >=20
> > I hate this.=C2=A0 It's a bad idea to put "code" in the declaration
> > block.
>=20
> Erick, you can look around in the output of the semantic patch and
> see if all of the ones with function calls are undesirable. If that=E2=80=
=99s
> the case you can post to the outreachy mailing list a revised
> semantic patch that doesn=E2=80=99t report on that case.
Thanks Julia I will look at it.
>=20
> Julia
>=20
> > > @@ -501,8 +499,7 @@ void Hal_GetEfuseDefinition(
> > > =C2=A0=C2=A0 switch (type) {
> > > =C2=A0=C2=A0 case TYPE_EFUSE_MAX_SECTION:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u=
8 *pMax_section;
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p=
Max_section =3D pOut;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u=
8 *pMax_section =3D pOut;
> >=20
> > This is fine because "pOut" is a variable.=C2=A0 It doesn't have side
> > effects
> > and it's not "code" in that sense.
> >=20
> > regards,
> > dan carpenter
> >=20
> >=20
>=20

