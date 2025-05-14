Received: from sonic304-25.consmr.mail.gq1.yahoo.com (sonic304-25.consmr.mail.gq1.yahoo.com [98.137.68.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66165191F98
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 19:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=98.137.68.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747250796; cv=none; b=MMVKX5KnTSIannJXygs8B6g7Mu39FNRhuNGAggAtGdIhwbBOy6PiNMKZuxpfWgau7d3vdX7d2iYDxJvoQuHqsekDuGE6dpUKJ0+xQLV+YImZ9HjjKAMSKDD4xmwgIbFgVt0K0+fL2+RMBMhxv4UcOcbZbBsOEIwmsRKCVbf/0TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747250796; c=relaxed/simple;
	bh=VXL/P8CLyy2P1CUPDChST5YDYNuOKCrLNS+EGjG+AFI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eEETSauq+0TIb+1z31+OolROrR984ZXN3Lf7ueLSSwOZb9nyF4fpDUEYaXykptO3Zt16M+TV2kSUF/Rm83p+I5oNkNo7UjmmnuZlovimj5cBVx4EoT2VIx/FBqGyFmw5XeU3Kgq7aRyPcvoJsO1VpBv7ceH9BUpnvfreJrYchdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aol.com; spf=pass smtp.mailfrom=aol.com; dkim=pass (2048-bit key) header.d=aol.com header.i=@aol.com header.b=Uf8J97o5; arc=none smtp.client-ip=98.137.68.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aol.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aol.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aol.com header.i=@aol.com header.b="Uf8J97o5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1747250794; bh=TPlDicIWMRqRIW2310f0dn23Sj0w+ZmFXbh4nVRsg+k=; h=Subject:From:To:Cc:Date:In-Reply-To:References:From:Subject:Reply-To; b=Uf8J97o5jm6VxNjBULCpOlmbzLlaVv39JQ00ez1Wi8X2I9nR4Lnw7phvFdaYnp5ny8TGiKOFBhLe0/BLju4iOwV9F1TMoDo+QZeWJr/khdnqno0rwRt+dZM2UepnVR7cfaouGU3Klpgm9kmPEHrhIG556TyI5Efgnw//EwRo45e55jiezTqfxNWrWxX4ed+VGV+NJuudQhGsZO4qJsTErb8nvcQm5pOI3m53hhJ+vLaAJDyoquIUCXb9Og88HtxltA7B6Mv8iOBust0Mjtno76DOzSBDRGuyC4WPde9AHY7EPO+7HcCpd2BRZJouNUjpiqw3XP8jFalKPQGA9/nEUg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747250794; bh=+5ff0kXEa0e0h+vAi3oJl+bHFNYmJloOke+aakJttal=; h=X-Sonic-MF:Subject:From:To:Date:From:Subject; b=GdM7iiPIvoocUsYR0XP4bJP00+JnWeQrhZbqCv3AyV6YUvFamFv5Q/gTFkooe3bSfn5uwkZCipd+aPyq6fIifrmUPoFA9bsAQF6M0PFlbxhc1JAd5chHiJ6owJuCe30isdl8ZNqyWLTaIbJeAzanN/7j7QGj/RnJSDruZHSJ0VNy9AF5QgFZFML5LWbSbJNcqRdtmHkimCZFuArfjLJdJ1iFDM8is6NIL39NEK28Ow9SqD7UIiuzv7MLKWRvxR9wp97wOC/YNoYwn29n952Vzf+fe+OpgIUSgQBPL4HCpqU5/TZTkBqxjUdJ6UYrcAOskSUoNKMmQARa2CRbHhCO7g==
X-YMail-OSG: 1BJEQWMVM1moD7mbuebnh_iJHAhx1t2hNuGdzhiSuyggkMnLzcLzXTcn2.tXD4g
 UZWT0gU1B5XB0.AJjkFki8xn89LTJhEii6pLQa5kyXO6XJheS2yOm6ImRZzHAx8ajokfk.3ZhdE5
 ZIRl_T2Bp3ROszri8L3jHA88xPv31qXwfuMgyVnGdqNcQbLKBTJQ1kKIxFrXx.rvusZmLnH8xfcR
 NVCyBVXV23VJE.WAyHNKKUHSxLStdC7erfcgNC2lNhCwVmSoLa3lxUvzOmqayLTKYeOfa39wKkDW
 E6Tf_2dNloX9xBHvTJlrqCD9253E8SQDyHKG8FkJEwe2oQ85mpjIB_RaDJ2e5ShOV5u2wEqeLYiE
 diRZbftsvjNLGF_DXjR0mQv6WhOvmCidBOfgeigiIbkDRqOGBaBoLQafxy.0xG5k51WU6bzHt3Xs
 .vg0iP9fRhs1iPXxcUCYzuQ7DZo5eNBLhxIDxm5QedjbsBxGuBNJJ6WaN4pnpQ1XRmk1CuSzR3N9
 _IbUOM4dw5fTo40IQFbRuATlBTT_04Kx4xy2_f54qRhuZ_3eJ1CciNTuTQ39GABqdqCGmnSVDsfC
 _r.ps7Junl1CyKqNxp1nqoaLtLMQqFyeUVEJZrIlT.WR1SOKgwALEmRADd9V_5a0TEicLjageeHj
 ifPd2QM3CNWhTvj57F9uuxUe04yFvoCIQX2KxS8MkQZLqc5wc8HgwkdhZjMvdd5xCgoEuKRt_7Rx
 TKt5gWHBkGf3JU7YXbZEsPNUNZBgxyVz2Pal2uDiEtLmlp8B0GdT55pizIXiP57owgFcOWuYYuqG
 KcFb0nujetDmJPq.N5U8vm4FEM4sKxI5AvzpcLhQf4PPbHRVc5h.xUgqF1H7RoQ0U0e0NaejjTXW
 8pW_Ly73G0JoIIL0ELW0AKeK9w0iAFptp8_OeO6I05jCk6VmQCacm6mdNVC.fo.oRIw4ujI7ph0D
 .TwqOGNevIaA9qZbbDbeuMKlEADyQbHu5bXrOITMaF2TZwWR2XZjX6H1rmKoNgIYGc8JCUJUDdpb
 S_66hxpXfCxECfYp1CMJn5S67YasHi2Bsoje6wHJ6acnJ8J9i83VG_env6gEdqqcheSWKKMzMk1p
 Rfin.ZuW.o1mvcOuDVPvAkaN_lBgW.mK9fBLp76ZvAQsKwPjTtXPlecnpYX7qrvjecl.7lt_VJch
 F.zssnTjFavfnG5DhOjI7WRoGvmP15Ybau_1wdmoy5rZy566_dgojRlujbQN_ohq96Ucf4UlUFSq
 JIHTtZxsyCm1QRtduV_3rsSxu9msBrSqVnV_RUFJd0BV_vBb9Cd.E.PCc8vLfkS.WbVEMCFkiFRl
 K3rh7mqIvimgu.DMw5M7EEh65hu5McrsioxzuhWx2KLT3IxTfDhvOwOz0u6pHzfifDg1BgpmqnRe
 tKFqGONqMii5GJ.4.Y7siNu27tUFdZ6MosrvmKJN5F0p09F1DSUo1smZrUgHtKMSHZhxkfU0EwXB
 S37OgSaaLrWqSOiwK_0kIc79i38ChRGEGn9Wh.yBLM9ySONFjLogcjf9LpLmANF.3svZjJLNsQg1
 hmCq40EchFNC4OaLDs2EkqxsKAbI0Isgknhs4J_rb2jUnnpQkO0e3.c.Cxlvu.p_a7vV7cYzXQH3
 U7a9sRYOcPU92ZHFrBnhAkkk7vJyFG6sWPbVbzpdZMG.XJHu45apB3Mvhbg_JDl79XFFWZ9CtEbW
 u5rEzrkl8apb2rSj7EbuAZQeEQJSh2msOLRCyGserdc9REa64Ow6SxjLUEu8_9j2YjsJL38UDwzi
 HkDbmBgSLf75gUhc5Oo0R32Jektrcwmj0d145m4.FZRiPZF7kl15U_mh5Hjpt0FSSfg5R.HQQ_3d
 7TryI3i2grnucxHnEQjDqwzYoh8Fz6h_nbUa_n3lnrLfA5mf.MC2Qtw4_EvhZX_HaM3wDfk17lqM
 JcGohAzjat_2PAi33KMbTVBo_UeLEttaRreCeN7J_NuyC.1Vqkt7ZUcSPzYPs0QCqbLQHKLQC9kR
 h5VaKwCOm70T8p_n5.x7tlww5BnKRTq8xCzAEhzdHzJD01QvD.T9z726sbQJjSDkYe_G7xTxL6Oc
 Q9JKJK4RUZSQ_05f7QXoy0MEAJ6xjlS0zVHzsUE1qh3lajWGmCh17CQMzhIJJ8TutVreYbssWoiw
 Ca7XWoXRsV3Cn9cSzlyTlh3cS
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: fae6de29-71b6-4027-8b57-58e2edef86c8
Received: from sonic.gate.mail.ne1.yahoo.com by sonic304.consmr.mail.gq1.yahoo.com with HTTP; Wed, 14 May 2025 19:26:34 +0000
Received: by hermes--production-ir2-858bd4ff7b-bdxql (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 4b2911a8d5146feae00c6603fcc64af0;
          Wed, 14 May 2025 19:16:22 +0000 (UTC)
Message-ID: <098b949b8ddc5b706adb927d04460943c245bef8.camel@aol.com>
Subject: Re: [PATCH] x86/cpu/intel: replace deprecated strcpy with strscpy
From: Ruben Wauters <rubenru09@aol.com>
To: "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, 	x86@kernel.org
Cc: linux-kernel@vger.kernel.org
Date: Wed, 14 May 2025 20:16:20 +0100
In-Reply-To: <758195078eee66ce97c05091004bca9d5c3b6cd9.camel@aol.com>
References: <20250507185459.8769-1-rubenru09.ref@aol.com>
		 <20250507185459.8769-1-rubenru09@aol.com>
		 <3AFD7702-7D6F-479C-950A-CA439E01838C@zytor.com>
	 <758195078eee66ce97c05091004bca9d5c3b6cd9.camel@aol.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mailer: WebService/1.1.23840 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On Wed, 2025-05-07 at 21:30 +0100, Ruben Wauters wrote:
> On Wed, 2025-05-07 at 13:14 -0700, H. Peter Anvin wrote:
> > On May 7, 2025 11:51:36 AM PDT, Ruben Wauters <rubenru09@aol.com>
> > wrote:
> > > strcpy is deprecated due to lack of bounds checking.
> > > This patch replaces strcpy with strscpy, the recommended
> > > alternative for
> > > null terminated strings, to follow best practices.
> > >=20
> > > Signed-off-by: Ruben Wauters <rubenru09@aol.com>
> > > ---
> > > arch/x86/kernel/cpu/intel.c | 2 +-
> > > 1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/arch/x86/kernel/cpu/intel.c
> > > b/arch/x86/kernel/cpu/intel.c
> > > index 584dd55bf739..b49bba30434d 100644
> > > --- a/arch/x86/kernel/cpu/intel.c
> > > +++ b/arch/x86/kernel/cpu/intel.c
> > > @@ -607,7 +607,7 @@ static void init_intel(struct cpuinfo_x86 *c)
> > > 		}
> > >=20
> > > 		if (p)
> > > -			strcpy(c->x86_model_id, p);
> > > +			strscpy(c->x86_model_id, p);
> > > 	}
> > > #endif
> > >=20
> >=20
> > strscpy() needs a buffer length; this patch wouldn't even compile!
>=20
> Hi, this is incorrect, strscpy is defined in string.h as
> #define strscpy(dst, src, ...)	\
> 	CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src,
> __VA_ARGS__)
>=20
> the third parameter is optional, and it works perfectly fine with two
> parameters. I have compiled it, and there are no errors.
>=20
> > Not to mention that the string in question is generated in such a
> > way
> > that cannot be unterminated.
>=20
> I'm not entirely sure what you mean here? The assignments above are
> null terminated strings, which the two parameter version works fine
> with.

Hello

Just wanted to check that everything was ok with this patch, and that
any concerns were addressed or explained. Please do let me know if
there is anything I need to do or change to get this patch applied.

Ruben Wauters
