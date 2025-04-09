Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6302566D9
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 11:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744198364; cv=none; b=t2549zsjVOAcz74amvrSY5QYubzzGjpialnmBi4yden1YZ025jF5landEhg98e62RxHYwk/XvxEn2/H3CM774oKn4LuX2Jigpt0uP6/aNiApphLUDyMDLsWTqklKv1KvnXFl0yGgGQwUabpQlnEkmdVeP9ZZsQUNMyQxi1penNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744198364; c=relaxed/simple;
	bh=i7r0Yf205oIX1yhX7oPuT/3brp+bEi8vZQtzz08PhVg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SG8Rr3NfsNL9NmAoXKoEC1l9W+2T8HzpGXx7gVwSOLjwZ2QAjEWXfJ92eqj0MX7vXLOpvxCE2D+cT2JDSQNY8NvOdddpnjIlTLJPQSR3coMCKCEkc7P7WPjLQ9WwOwGJxSgUM+xH/74B52t0o4Yasr8P2UCnJITFjUklENDcDk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IUR312HK; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IUR312HK"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3914aba1ce4so5378755f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 04:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744198361; x=1744803161; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2e5LkJsUOFgfY91yel8R74rlogDforQ5kQjLjS7tFwc=;
        b=IUR312HK3kj0p4AXN1jIi2pggCIZT/tVt2pAO0kHNm9qdDeWXm4DKr77k3OqV/JmL0
         lRnwGpdFcuwnE+m2IJrz5u0mXeXlahQs8kzV/fVbkVQHj3OM+cNA2/kWj+d/iSrfnuw+
         gGGx3B5c7kaXeTa5i8qeScJKfkPSfh5QMuVpDJxdrgG8LVgXFMR7PkR5J7pms7/AjyX6
         Ezo3mhW+ta6Sf4JqY34SVNxMNtA9g1zBKkC9IZOMeBpDo1bHouKbaXT4kWgK+AjL4B6F
         ktGlFANNHrvEOF7RgRRWmsK8DpQUCUqTkPwfePmLzH7p2sw9U2+mYQvSZXMP2bzhXYRr
         hPVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744198361; x=1744803161;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2e5LkJsUOFgfY91yel8R74rlogDforQ5kQjLjS7tFwc=;
        b=D9L5RfAJOj/bitBCif4xTu2+j0/Vo0o7gLx5Ap+HXA5vi9Y6SxWOdJ9nVYIHOmyi8k
         dfZy+jmTUdSBakDeCi0e1fdfuCbInavjc2aA06P50FdyKjzK+mFicw1p/qIzBAvprt9O
         B+74Hyt9tP6vwAEO+WhVhvUHhYHf0Icpxy9rEmssctx+KJEq5KRnGBDnBCjQBeZprNQ9
         +OhgvxDZsj/8UVLDBlsygdfltUU4PYEChPCZzZ0cM177T2OCQV3+lcj60fZnU5OZdaVp
         sXKaAYn+wnBZUGhr8MraZcpTiR/k8z94TMO1QaOBKI2rtS/D1YLqzjCQarmAvC5+lcDs
         F6jg==
X-Forwarded-Encrypted: i=1; AJvYcCUQkJaILZCgQevuNYP0s207qbPzlcZ7KwiJ6CvfR5iM1Y6avRQO0RC2im9M3vOA4XvgesCGxED/4QIpY74=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn9odJT8kM515qlrh4MZNXo1+h8nWH8s5BtkKxnTUlBmKAMqvJ
	NU18seGkGy42WliQAP7O9Y8uxp0K6zLaZ8h9ka5jgLh3CUfpgTGs
X-Gm-Gg: ASbGncuILo/V/V39Le4kB6rn46RKLxuCCPQkR9Q7ABsp/TqEaxow51qZyIkRSz/itXr
	khDNsNgatT91JMmAANgMJ8QSOLArJqzUEcXf8uMLcwv29tzNsQcWs3ssrTjCynm5M/uWO4uYYNQ
	qPGPFebmd9EfgLpZpzkAhR8aVM4seYUbj53lhLTb/hgaOC46Swx2Kst1RAO3oggsEHjKqwxVohB
	UYpm04I9dWt4oYOxBL1EraK7gjEn/CtjaqGEiSJ5yj2GO+lg3te4AG4hovTJFWe6hVVElx8EnFC
	hh+zTQzOR983v7A+cJ0q3u0DiAObTKZ4/kbEeXr6sOxj/qAAJrM=
X-Google-Smtp-Source: AGHT+IHgkCqpH5AOZC2/6taTAwH+sjmh0QrOMq1ggUWjbsJF1Xy7U5FpvQLaGdEV5YJ4Q/caPjDjZg==
X-Received: by 2002:a05:6000:1a8d:b0:39d:724f:a8a0 with SMTP id ffacd0b85a97d-39d87cdf816mr2181668f8f.58.1744198360806;
        Wed, 09 Apr 2025 04:32:40 -0700 (PDT)
Received: from [172.16.8.120] ([197.155.71.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f204c500bsm17872345e9.0.2025.04.09.04.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 04:32:40 -0700 (PDT)
Message-ID: <4cf642ebb8d0859676230bae06a4914a57428ec3.camel@gmail.com>
Subject: Re: [PATCH v2 1/2] staging: rtl8723bs: Improve code readability
From: Erick Karanja <karanja99erick@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev, 
	philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Wed, 09 Apr 2025 14:32:36 +0300
In-Reply-To: <3dda7f97-4ed8-cf6d-9310-60ed6259a386@inria.fr>
References: <cover.1744192642.git.karanja99erick@gmail.com>
	 <97a2637f3ccefb3de0e15fd04f29f5f209f2a506.1744192642.git.karanja99erick@gmail.com>
	 <3dda7f97-4ed8-cf6d-9310-60ed6259a386@inria.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-04-09 at 07:04 -0400, Julia Lawall wrote:
>=20
>=20
> On Wed, 9 Apr 2025, Erick Karanja wrote:
>=20
> > Make the code more readable by moving trivial
> > initializations up with the declarations instead
> > of wasting a line on that.
> >=20
> > Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
> > ---
> > =C2=A0.../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 84 ++++++--------=
-
> > ----
> > =C2=A01 file changed, 25 insertions(+), 59 deletions(-)
> >=20
> > diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> > b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> > index e15ec6452fd0..2cf2c66140f1 100644
> > --- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> > +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> > @@ -501,8 +501,7 @@ void Hal_GetEfuseDefinition(
> > =C2=A0	switch (type) {
> > =C2=A0	case TYPE_EFUSE_MAX_SECTION:
> > =C2=A0		{
> > -			u8 *pMax_section;
> > -			pMax_section =3D pOut;
> > +			u8 *pMax_section =3D pOut;
> >=20
> > =C2=A0			if (efuseType =3D=3D EFUSE_WIFI)
> > =C2=A0				*pMax_section =3D
> > EFUSE_MAX_SECTION_8723B;
> > @@ -513,8 +512,7 @@ void Hal_GetEfuseDefinition(
> >=20
> > =C2=A0	case TYPE_EFUSE_REAL_CONTENT_LEN:
> > =C2=A0		{
> > -			u16 *pu2Tmp;
> > -			pu2Tmp =3D pOut;
> > +			u16 *pu2Tmp =3D pOut;
> >=20
> > =C2=A0			if (efuseType =3D=3D EFUSE_WIFI)
> > =C2=A0				*pu2Tmp =3D
> > EFUSE_REAL_CONTENT_LEN_8723B;
> > @@ -525,8 +523,7 @@ void Hal_GetEfuseDefinition(
> >=20
> > =C2=A0	case TYPE_AVAILABLE_EFUSE_BYTES_BANK:
> > =C2=A0		{
> > -			u16 *pu2Tmp;
> > -			pu2Tmp =3D pOut;
> > +			u16 *pu2Tmp =3D pOut;
> >=20
> > =C2=A0			if (efuseType =3D=3D EFUSE_WIFI)
> > =C2=A0				*pu2Tmp =3D
> > (EFUSE_REAL_CONTENT_LEN_8723B-EFUSE_OOB_PROTECT_BYTES);
> > @@ -537,8 +534,7 @@ void Hal_GetEfuseDefinition(
> >=20
> > =C2=A0	case TYPE_AVAILABLE_EFUSE_BYTES_TOTAL:
> > =C2=A0		{
> > -			u16 *pu2Tmp;
> > -			pu2Tmp =3D pOut;
> > +			u16 *pu2Tmp =3D pOut;
> >=20
> > =C2=A0			if (efuseType =3D=3D EFUSE_WIFI)
> > =C2=A0				*pu2Tmp =3D
> > (EFUSE_REAL_CONTENT_LEN_8723B-EFUSE_OOB_PROTECT_BYTES);
> > @@ -549,8 +545,7 @@ void Hal_GetEfuseDefinition(
> >=20
> > =C2=A0	case TYPE_EFUSE_MAP_LEN:
> > =C2=A0		{
> > -			u16 *pu2Tmp;
> > -			pu2Tmp =3D pOut;
> > +			u16 *pu2Tmp =3D pOut;
> >=20
> > =C2=A0			if (efuseType =3D=3D EFUSE_WIFI)
> > =C2=A0				*pu2Tmp =3D EFUSE_MAX_MAP_LEN;
> > @@ -561,8 +556,7 @@ void Hal_GetEfuseDefinition(
> >=20
> > =C2=A0	case TYPE_EFUSE_PROTECT_BYTES_BANK:
> > =C2=A0		{
> > -			u8 *pu1Tmp;
> > -			pu1Tmp =3D pOut;
> > +			u8 *pu1Tmp =3D pOut;
> >=20
> > =C2=A0			if (efuseType =3D=3D EFUSE_WIFI)
> > =C2=A0				*pu1Tmp =3D EFUSE_OOB_PROTECT_BYTES;
> > @@ -573,8 +567,7 @@ void Hal_GetEfuseDefinition(
> >=20
> > =C2=A0	case TYPE_EFUSE_CONTENT_LEN_BANK:
> > =C2=A0		{
> > -			u16 *pu2Tmp;
> > -			pu2Tmp =3D pOut;
> > +			u16 *pu2Tmp =3D pOut;
> >=20
> > =C2=A0			if (efuseType =3D=3D EFUSE_WIFI)
> > =C2=A0				*pu2Tmp =3D
> > EFUSE_REAL_CONTENT_LEN_8723B;
> > @@ -585,8 +578,7 @@ void Hal_GetEfuseDefinition(
> >=20
> > =C2=A0	default:
> > =C2=A0		{
> > -			u8 *pu1Tmp;
> > -			pu1Tmp =3D pOut;
> > +			u8 *pu1Tmp =3D pOut;
> > =C2=A0			*pu1Tmp =3D 0;
> > =C2=A0		}
> > =C2=A0		break;
> > @@ -729,10 +721,9 @@ static void hal_ReadEFuse_WiFi(
> > =C2=A0		}
> >=20
> > =C2=A0		if (offset < EFUSE_MAX_SECTION_8723B) {
> > -			u16 addr;
> > +			u16 addr =3D offset * PGPKT_DATA_SIZE;
> > =C2=A0			/*=C2=A0 Get word enable value from PG header
> > */
> >=20
> > -			addr =3D offset * PGPKT_DATA_SIZE;
>=20
> I'm not sure about this one, due to the comment.
Hello Julia, I have observed in some scenarios where the semantic patch
deletes the comments that exist between the declaration and
initialization which I think it's not okay and in this scenario where
the comments are left dangling such as this. How do I go about this
instances.
Thank you.=20
>=20
> julia
>=20
> > =C2=A0			for (i =3D 0; i < EFUSE_MAX_WORD_UNIT; i++)
> > {
> > =C2=A0				/*=C2=A0 Check word enable condition in
> > the section */
> > =C2=A0				if (!(wden & (0x01<<i))) {
> > @@ -835,9 +826,8 @@ static void hal_ReadEFuse_BT(
> > =C2=A0			}
> >=20
> > =C2=A0			if (offset < EFUSE_BT_MAX_SECTION) {
> > -				u16 addr;
> > +				u16 addr =3D offset *
> > PGPKT_DATA_SIZE;
> >=20
> > -				addr =3D offset * PGPKT_DATA_SIZE;
> > =C2=A0				for (i =3D 0; i <
> > EFUSE_MAX_WORD_UNIT; i++) {
> > =C2=A0					/*=C2=A0 Check word enable
> > condition in the section */
> > =C2=A0					if (!(wden & (0x01<<i))) {
> > @@ -1196,10 +1186,9 @@ void rtl8723b_InitBeaconParameters(struct
> > adapter *padapter)
> > =C2=A0{
> > =C2=A0	struct hal_com_data *pHalData =3D GET_HAL_DATA(padapter);
> > =C2=A0	u16 val16;
> > -	u8 val8;
> > +	u8 val8 =3D DIS_TSF_UDT;
> >=20
> >=20
> > -	val8 =3D DIS_TSF_UDT;
> > =C2=A0	val16 =3D val8 | (val8 << 8); /*=C2=A0 port0 and port1 */
> >=20
> > =C2=A0	/*=C2=A0 Enable prot0 beacon function for PSTDMA */
> > @@ -1496,10 +1485,7 @@ s32 rtl8723b_InitLLTTable(struct adapter
> > *padapter)
> > =C2=A0{
> > =C2=A0	unsigned long start, passing_time;
> > =C2=A0	u32 val32;
> > -	s32 ret;
> > -
> > -
> > -	ret =3D _FAIL;
> > +	s32 ret =3D _FAIL;
> >=20
> > =C2=A0	val32 =3D rtw_read32(padapter, REG_AUTO_LLT);
> > =C2=A0	val32 |=3D BIT_AUTO_INIT_LLT;
> > @@ -2273,9 +2259,8 @@ void rtl8723b_fill_fake_txdesc(
> > =C2=A0	/*=C2=A0 Encrypt the data frame if under security mode excepct
> > null data. Suggested by CCW. */
> > =C2=A0	/*=C2=A0 */
> > =C2=A0	if (bDataFrame) {
> > -		u32 EncAlg;
> > +		u32 EncAlg =3D padapter-
> > >securitypriv.dot11PrivacyAlgrthm;
> >=20
> > -		EncAlg =3D padapter-
> > >securitypriv.dot11PrivacyAlgrthm;
> > =C2=A0		switch (EncAlg) {
> > =C2=A0		case _NO_PRIVACY_:
> > =C2=A0			SET_TX_DESC_SEC_TYPE_8723B(pDesc, 0x0);
> > @@ -2378,9 +2363,7 @@ static void hw_var_set_opmode(struct adapter
> > *padapter, u8 variable, u8 *val)
> > =C2=A0static void hw_var_set_macaddr(struct adapter *padapter, u8
> > variable, u8 *val)
> > =C2=A0{
> > =C2=A0	u8 idx =3D 0;
> > -	u32 reg_macid;
> > -
> > -	reg_macid =3D REG_MACID;
> > +	u32 reg_macid =3D REG_MACID;
> >=20
> > =C2=A0	for (idx =3D 0 ; idx < 6; idx++)
> > =C2=A0		rtw_write8(GET_PRIMARY_ADAPTER(padapter),
> > (reg_macid+idx), val[idx]);
> > @@ -2389,9 +2372,7 @@ static void hw_var_set_macaddr(struct adapter
> > *padapter, u8 variable, u8 *val)
> > =C2=A0static void hw_var_set_bssid(struct adapter *padapter, u8
> > variable, u8 *val)
> > =C2=A0{
> > =C2=A0	u8 idx =3D 0;
> > -	u32 reg_bssid;
> > -
> > -	reg_bssid =3D REG_BSSID;
> > +	u32 reg_bssid =3D REG_BSSID;
> >=20
> > =C2=A0	for (idx =3D 0 ; idx < 6; idx++)
> > =C2=A0		rtw_write8(padapter, (reg_bssid+idx), val[idx]);
> > @@ -2399,9 +2380,7 @@ static void hw_var_set_bssid(struct adapter
> > *padapter, u8 variable, u8 *val)
> >=20
> > =C2=A0static void hw_var_set_bcn_func(struct adapter *padapter, u8
> > variable, u8 *val)
> > =C2=A0{
> > -	u32 bcn_ctrl_reg;
> > -
> > -	bcn_ctrl_reg =3D REG_BCN_CTRL;
> > +	u32 bcn_ctrl_reg =3D REG_BCN_CTRL;
> >=20
> > =C2=A0	if (*(u8 *)val)
> > =C2=A0		rtw_write8(padapter, bcn_ctrl_reg,
> > (EN_BCN_FUNCTION | EN_TXBCN_RPT));
> > @@ -2422,12 +2401,8 @@ static void hw_var_set_correct_tsf(struct
> > adapter *padapter, u8 variable, u8 *va
> > =C2=A0{
> > =C2=A0	u8 val8;
> > =C2=A0	u64 tsf;
> > -	struct mlme_ext_priv *pmlmeext;
> > -	struct mlme_ext_info *pmlmeinfo;
> > -
> > -
> > -	pmlmeext =3D &padapter->mlmeextpriv;
> > -	pmlmeinfo =3D &pmlmeext->mlmext_info;
> > +	struct mlme_ext_priv *pmlmeext =3D &padapter->mlmeextpriv;
> > +	struct mlme_ext_info *pmlmeinfo =3D &pmlmeext->mlmext_info;
> >=20
> > =C2=A0	tsf =3D pmlmeext->TSFValue-do_div(pmlmeext->TSFValue,
> > (pmlmeinfo->bcn_interval*1024))-1024; /* us */
> >=20
> > @@ -2543,15 +2518,12 @@ static void hw_var_set_mlme_join(struct
> > adapter *padapter, u8 variable, u8 *val)
> > =C2=A0	u8 val8;
> > =C2=A0	u16 val16;
> > =C2=A0	u32 val32;
> > -	u8 RetryLimit;
> > -	u8 type;
> > -	struct mlme_priv *pmlmepriv;
> > +	u8 RetryLimit =3D 0x30;
> > +	u8 type =3D *(u8 *)val;
> > +	struct mlme_priv *pmlmepriv =3D &padapter->mlmepriv;
> > =C2=A0	struct eeprom_priv *pEEPROM;
> >=20
> >=20
> > -	RetryLimit =3D 0x30;
> > -	type =3D *(u8 *)val;
> > -	pmlmepriv =3D &padapter->mlmepriv;
> > =C2=A0	pEEPROM =3D GET_EEPROM_EFUSE_PRIV(padapter);
> >=20
> > =C2=A0	if (type =3D=3D 0) { /*=C2=A0 prepare to join */
> > @@ -2850,12 +2822,11 @@ void SetHwReg8723B(struct adapter
> > *padapter, u8 variable, u8 *val)
> >=20
> > =C2=A0	case HW_VAR_ACK_PREAMBLE:
> > =C2=A0		{
> > -			u8 regTmp;
> > +			u8 regTmp =3D 0;
> > =C2=A0			u8 bShortPreamble =3D *val;
> >=20
> > =C2=A0			/*=C2=A0 Joseph marked out for Netgear 3500
> > TKIP channel 7 issue.(Temporarily) */
> > =C2=A0			/* regTmp =3D (pHalData-
> > >nCur40MhzPrimeSC)<<5; */
> > -			regTmp =3D 0;
> > =C2=A0			if (bShortPreamble)
> > =C2=A0				regTmp |=3D 0x80;
> > =C2=A0			rtw_write8(padapter, REG_RRSR+2, regTmp);
> > @@ -3226,9 +3197,7 @@ void GetHwReg8723B(struct adapter *padapter,
> > u8 variable, u8 *val)
> > =C2=A0 */
> > =C2=A0u8 SetHalDefVar8723B(struct adapter *padapter, enum
> > hal_def_variable variable, void *pval)
> > =C2=A0{
> > -	u8 bResult;
> > -
> > -	bResult =3D _SUCCESS;
> > +	u8 bResult =3D _SUCCESS;
> >=20
> > =C2=A0	switch (variable) {
> > =C2=A0	default:
> > @@ -3244,9 +3213,7 @@ u8 SetHalDefVar8723B(struct adapter
> > *padapter, enum hal_def_variable variable, v
> > =C2=A0 */
> > =C2=A0u8 GetHalDefVar8723B(struct adapter *padapter, enum
> > hal_def_variable variable, void *pval)
> > =C2=A0{
> > -	u8 bResult;
> > -
> > -	bResult =3D _SUCCESS;
> > +	u8 bResult =3D _SUCCESS;
> >=20
> > =C2=A0	switch (variable) {
> > =C2=A0	case HAL_DEF_MAX_RECVBUF_SZ:
> > @@ -3281,9 +3248,8 @@ u8 GetHalDefVar8723B(struct adapter
> > *padapter, enum hal_def_variable variable, v
> > =C2=A0	case HW_DEF_RA_INFO_DUMP:
> > =C2=A0		{
> > =C2=A0			u8 mac_id =3D *(u8 *)pval;
> > -			u32 cmd;
> > +			u32 cmd =3D 0x40000100 | mac_id;
> >=20
> > -			cmd =3D 0x40000100 | mac_id;
> > =C2=A0			rtw_write32(padapter,
> > REG_HMEBOX_DBG_2_8723B, cmd);
> > =C2=A0			msleep(10);
> > =C2=A0			rtw_read32(padapter, 0x2F0);	// info 1
> > --
> > 2.43.0
> >=20
> >=20
> >=20

