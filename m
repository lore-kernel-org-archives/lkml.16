Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F392714375D
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 04:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743912730; cv=none; b=R+983weH8aN9VVei55+rG7TKueEIDTe2n7jchMwL8iP3UV+t+1wOF6t/XpU0vsNufLW9sVrFhaLyUv/CmmdLlpUdqRlql3eiR0WSLXo6KMKbMAqkIkeDRuIcXoYBGkcmgLM+llibUhq6B8huyI3aGvqDs5Wje0X93CO+p+o0bio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743912730; c=relaxed/simple;
	bh=hGIVXXAhHctDsjy1naMvfXrRCQwyDdpNe4VQbCn8dv0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XZKtVB9MYHbcQTXCJ+j7hJaLguyd7c/Tkt2YidGLJNWrq1u0uhdWZWqN6GwRYRkd3u+ddIPLZ0VigyEkE99sUg1M8WlrjPDGi53lauFwfIk1nI7KKTlxvXPKMM9i3W2fuyq+QrByYBHoFdEgcvAPv4YNYQnQt/wBRZM1BBe/N+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lESGD8uI; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lESGD8uI"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cf257158fso22116825e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 21:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743912726; x=1744517526; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CkhZzdyHthH3zlmYOF4rhVybnNJuyP+fVbqgr5eqZcQ=;
        b=lESGD8uIekTC1fEkf/VpUCe4UX2LVgAwwhMYiL2czuhwx9Y9DctRKwT1gHwqdxMN/c
         wlkQibaMuWIJDx15b1GMnfJ5dsPPrdNHpZblXLfWXzXPJ854EH6bapUoeOMjVl5vfc4C
         +R1t2E5gwNPB665JeXYcFqIorSdFAq4lIwTUJOAYcpHBBJvXTQ5UHIb4V+nbHyZVbAvZ
         y1qw+NLjPPweHz0S18/9SyT6xCbUqrUcogYNfSVoSLh1mQ71ZgYji7vE1/ZP/oRypUzh
         TqurggFcaAT/TrQXQyg2QuYepoeO53sqgoUzH1Ht/Lsl9D7+ueHiyFVhNl9Xq/11rgrJ
         xmfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743912726; x=1744517526;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CkhZzdyHthH3zlmYOF4rhVybnNJuyP+fVbqgr5eqZcQ=;
        b=whIMjjwn52yvLYsOcbR9R89QcYHNC0vH8jYqcADsewdY3OoZEuqwhupnzAFcf2eI9V
         D8cqnXFD2WR2BC95PEdmpxF8Ag9hE70+I1qd3+oCxEK/3xZ1tv5LUvA5HWfToVVCvTJ9
         VhpWwIISWBxuA0OX5VdPyirpDiweVr9JzMaNBVbnZI07uJOnDoi7D3NxeiAo9kgzFoAW
         eqDGuPLZwdrh1J8z9fkAx8j4vS7biIYj2y/6/tXvlMbrZkDT9+OF8r9ekfaEURtDw4Xz
         8hrbTUE2ldbI0G63J0VN+29HLzh/7cZWyCTNdiQ3XmA9ukU9TiJdfHDYAXxsMaiKdYsO
         yeRA==
X-Forwarded-Encrypted: i=1; AJvYcCWY1EznEYrwziNZr2E9lsu4uE9DhTGVtqPL1vvLiWD7R+T0ktb1vP5knuhZHsD4qK7z1/+tLNSTdsrSEAA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjPGruCdzpNO14Tb8z/Z0D9S2onwLzhFZZvphrVUOZEVP1eZdr
	3xQNstjMcaCOlIWBW6eXyyVRNayB3d4p0AGhMiCXSBq+zghOWux/
X-Gm-Gg: ASbGnctiS0CH4V8LurjH859AtR3ol7UYe9RrF4uCCjioFxSvgmocepIVg2LDQYDHuNf
	n8Ok6INkP5tVATIGWNPZGfIvB1Txt6dkgTWeRNN+0Zp2DNM558DCYFkAt1lMdhwg9YZlCp077Ul
	zzeTOdWlcKXM6G3uwnNAYTSYDfALuOH5d/yyuyN2EU5EjFoLyO4kW4B1jxQIRG3nud32wsOzPCN
	r5CZPttK0yZ2WTUznobs8848KidwkuIDuSwj+SKkuUm1Okovr0v6uq6S7fImxmotBngDENKN3OC
	qef7keKZxuMSodQGrV+hkg0FMAeGfu9p5sln9Ehm3rPXOo3FIiH4rkaLKbo=
X-Google-Smtp-Source: AGHT+IGC1ME0LK4Hbev186Hx/YDZFRCSQdBf01P3L8jVlOccePJ7qVSVmJivVIhwZkJfuIasb9ou4w==
X-Received: by 2002:a05:6000:400f:b0:391:4674:b10f with SMTP id ffacd0b85a97d-39cba9332fdmr7099197f8f.36.1743912725851;
        Sat, 05 Apr 2025 21:12:05 -0700 (PDT)
Received: from [192.168.210.251] ([197.232.62.223])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30096964sm8471638f8f.15.2025.04.05.21.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 21:12:05 -0700 (PDT)
Message-ID: <b5cc9143f1ff84ac13aff6e5f56e1c14b4a181f7.camel@gmail.com>
Subject: Re: [PATCH 1/2] staging: rtl8723bs: Optimize variable
 initialization in rtl8723b_hal_init.c
From: Erick Karanja <karanja99erick@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev, 
	philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Sun, 06 Apr 2025 07:11:56 +0300
In-Reply-To: <8ce041b2-087c-4d47-891f-28ecc0c91c76@stanley.mountain>
References: <cover.1743820815.git.karanja99erick@gmail.com>
	 <f7b63d834b98aedfe2ce277d8008d7e398ea29ba.1743820815.git.karanja99erick@gmail.com>
	 <8ce041b2-087c-4d47-891f-28ecc0c91c76@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2025-04-05 at 17:19 +0300, Dan Carpenter wrote:
> On Sat, Apr 05, 2025 at 06:14:48AM +0300, Erick Karanja wrote:
> > Optimize variable initialization by integrating the initialization
> > directly into the variable declaration in cases where the
> > initialization
> > is simple and doesn't depend on other variables or complex
> > expressions.
> > This makes the code more concise and readable.
> >=20
> > Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
> > ---
> > =C2=A0.../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 155 +++++--------=
-
> > ----
> > =C2=A01 file changed, 41 insertions(+), 114 deletions(-)
> >=20
> > diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> > b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> > index e15ec6452fd0..1e980b291e90 100644
> > --- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> > +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> > @@ -152,13 +152,12 @@ static int _WriteFW(struct adapter *padapter,
> > void *buffer, u32 size)
> > =C2=A0void _8051Reset8723(struct adapter *padapter)
> > =C2=A0{
> > =C2=A0	u8 cpu_rst;
> > -	u8 io_rst;
> > +	u8 io_rst =3D rtw_read8(padapter, REG_RSV_CTRL + 1);
> > =C2=A0
> > =C2=A0
> > =C2=A0	/*=C2=A0 Reset 8051(WLMCU) IO wrapper */
> > =C2=A0	/*=C2=A0 0x1c[8] =3D 0 */
> > =C2=A0	/*=C2=A0 Suggested by Isaac@SD1 and Gimmy@SD1, coding by
> > Lucas@20130624 */
> > -	io_rst =3D rtw_read8(padapter, REG_RSV_CTRL+1);
> > =C2=A0	io_rst &=3D ~BIT(0);
> > =C2=A0	rtw_write8(padapter, REG_RSV_CTRL+1, io_rst);
>=20
> I hate this.=C2=A0 It's a bad idea to put "code" in the declaration block=
.
Thank you on the review I believe updating the semantic patch to check
for this could be great.
>=20
> > @@ -501,8 +499,7 @@ void Hal_GetEfuseDefinition(
> > =C2=A0	switch (type) {
> > =C2=A0	case TYPE_EFUSE_MAX_SECTION:
> > =C2=A0		{
> > -			u8 *pMax_section;
> > -			pMax_section =3D pOut;
> > +			u8 *pMax_section =3D pOut;
>=20
> This is fine because "pOut" is a variable.=C2=A0 It doesn't have side
> effects
> and it's not "code" in that sense.
>=20
> regards,
> dan carpenter
>=20

