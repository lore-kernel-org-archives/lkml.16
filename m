Received: from sonic316-55.consmr.mail.gq1.yahoo.com (sonic316-55.consmr.mail.gq1.yahoo.com [98.137.69.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA6A28FFD0
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 21:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=98.137.69.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746652243; cv=none; b=erWvpfPNcoiUzgk1w0bC6AdN//QcJQ5xWUfbluVhGzlmNscJo+gtAg5pVFgOPDhPyD2EbyTgI4s3rQYKR1THCrCpmZerw9+iKXTi+yzWXB7AkJHnfTPeIHAXtX1FmK+WG7vyW+dg1hYYS70YVVnMmzIaCm0rw0oFKqB2rhUeXoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746652243; c=relaxed/simple;
	bh=PdsStWpDAOrbQNTBeUXh3+YQFOgXfk8ojBc1rPdiaXw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=p0kY2wuJ4GRZqW6tje0Z4rS4I9anQUVEdev8OLdPkPAe86rP8tNSi3X0JphY9f8PeYYepnkJTRCv7wELAcMzt7+7mUJkYc8W3b8jljOk0bnA+s5vCAON9b9QnnYJEaec9imw77ZDEaKXVcomF+60lFYLLRdHNmbmRywFOpZ1oQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aol.com; spf=pass smtp.mailfrom=aol.com; dkim=pass (2048-bit key) header.d=aol.com header.i=@aol.com header.b=Xcw7eZov; arc=none smtp.client-ip=98.137.69.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aol.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aol.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aol.com header.i=@aol.com header.b="Xcw7eZov"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1746652241; bh=37oY+BcrB2bCXRDZYQAmwZGD83DkqqzSaYr1YJei3eg=; h=Subject:From:To:Cc:Date:In-Reply-To:References:From:Subject:Reply-To; b=Xcw7eZovVdCW3xAR6JHpECXHW8ZDgeyMN8uIUyYbSqQXOBoRivJudDiMHglgi++RcwpyQj2yQG8YInyVFiHNnPZTCPvSnCkNtqOMEvJ6e/nxoDDyusj9B172mtDwnUtJYCfwuwgPvcEtNVeQQec5M0THEvrDQ9WcVKvf46fMhVjl+A8sBXVfA1v2gwMUVgP7RoOjpcRMbVJwrjYuvNrI+djimIC7mKiJXXZvNJgSB5Qoh5YcUwPU2VrJUV5a0Rb9B6lNpJENdHHH35i4t6LSLnwkCqvys/J5hGbEPWoDV11dMi3fYQRRplpQSzVXEIf4IaTAZPr/IBzM6m+RJ7HeIw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1746652241; bh=Ojou4D4AjedHs8gj6pZzYtMAFx70UG4HVz3xryLyfOj=; h=X-Sonic-MF:Subject:From:To:Date:From:Subject; b=GklStXiAA+qAJiCw4dyzjH0GDJSTN4YqPBT/1ofzp9+aaBemTd8Vf+WxrHzHJRc4S9FkwyO9t+6Ml9KuFAyMFxKpFfQopaKFcntSvbep+gTLEruEqI78LbFQAYUcnK/c33mMDzN7kuuOYBbnXtJVMxIvfOVCUQVON0MkjSMFKLwd6cvFUHRtyLi1chGIOz8AZrbSjFIopTGq+pmNJ5WDCx+9O94dpEspKBuKJi05iUkzBkkBA9UGuXsNmV4yMmxToQ6/picfLC7dWsJroHDwKMlaRIUiapma3rKXvTk2Xq0OF4k36/Fk5BRkUjFUQj6BJNgzXmSrUowfWnxh5suk8w==
X-YMail-OSG: tM_v6LwVM1kQpJWCH2__vdHp_S9TKFIofMVf.fpuqVadd9knn19aGJmmkrDVTfA
 mUkKV4CDCSputOhhUhv4ptMKFQRMBPl_qd9nIWF6KrXVbRuPtBpUPhk.LR3vhTRzFpldidlTucRz
 YAOLy9Drzk6RN7PpDmwySyjKeti4aUhBkMmC0owhECxEf.e86.5i8rQsEtaTzaIqBLYvtplO1aqs
 0BMyCzPseNQkc2D6Qd97_PCL3C9rqnOen04KN5dZuuqV5Y5qHLF2znlUKvLUe6X2UNOTwlIYbmrT
 aWlvNqEuu.PgI2nvM9g3RAsybb.7UQBAUL_ZjVUVT1XazvzzvSZit_fHQbQPxXwQwmKiwrefYQPl
 xWzaVyvosLkqG.TodG9tpfABROpRluoppoxcOI0vnRtEIwCADVgQ4W5pLRvmG_F2wzXln53CZ97X
 4zXlCqGPquXiKDFrs5FwCj.hQ1EqJUVC6_I4gx.8btQVjEyNWsehOKnvXiMNSAF.hhf6aTJPsCAO
 57QwQ76rhqkxxCguXa_dE8ayh4JpF9DQG0NTfF5fBgzLWgwOynP1ju1dy9aNxZeAlaNr8qFZZAaI
 sCiZ59JxrP5da3Aj9.6RI3KtTCkt9KR.kWZBhgoTDaCR0SuoFnaImnmwQSZGovUF0u.X1_4OO_H5
 Nv_Om.1xEF0T53kFEAlDKVhJ5cactRIentYHzd2cJcyC9uM7D4hDf.GwLRJ4bCIsIhBxhO7Pj8TP
 JFBJ4rtF62YyA17RJShHWXq7_WEP.vrk3O_3i9SgMeZXsj3HFnkpgA7vh8w413S4U787VsF8nyuF
 jNZ3CSJ4FdzttvutZEJoU5CPwuzCTinR8u9N8eZ06VUPCtj81uYFV4j9YhIilWtSmSptdqz1WXMv
 zl9xUrAi42OMWt2GjSmQqwrz3s4FwazG2y6xdFOWycfXRKtits.SFKBB7kHiybvyjD4kfH7whP14
 DvgwkOHE.9b29WYLSHnxA2_Kb_Lhe8QAXQiQp4dDDgtzQar7JVMQVUkxhYd5iUZY09feofhLKfrU
 bJ.itaGzaUHmXZT30uWPiC3BVX9p6O43dtsYwm8k_YunpbGgO7fiXH6r3MprbQdvakXvliRh3Y.A
 rjiD29hXwIziwlRuxTwLvsgCEDWzsrHJ5L.bA65yk4T9ZPpZXrRTiuqPFroiuJ9LmNs0aJmus4YB
 G9oZ5Fybp_vjfdWE8FsVpDKLuwjqOMSp8SVgcVTtxh9QQ_f1cfgULFm_YDXQ_g1iD6uIaSCQj5IM
 m6.LsSgH7SU9txaB_YgX0XZiNEitEPZuI_hC81Qsq54Y0Dnrd5YshVF_uI2iobMS2PNme48DOx62
 ZA7qEVKkqNA6MHzRGta4WAtazm0FqApy_ehfOxwxmcn7eBRHUtEYIUfPOXEtK81h2SjOBIgooJKX
 cK0pzY87lojTKyQFRo80TH7bFXx.mc.Hcql4zCknIlG3ct41ze.ncAVgUEF8BLaWjA0KBRQ3CEbg
 YJJTuWZRU5QVBaddGi3F0eWVOl_KBeZ2IPw7f4qiTyrkwMkOW5JKhRkuVac5vEOVg4NvFkyD12.P
 tQLjfFIdAOAspUhzEq2PlH7s3WwkqwgZDdLBF64uiLpqsxDQTlND8OEIpuIUl4FMq0hYDnUgwAHb
 uqS5rhNMZZHyvp7fG7BIn6EaW5xDzWd6Iw8hSQFFbtYQbek3C_MFOyGoXA4AbHbCiJ7uA0.EYGlU
 bdZaT8lMPO7A7qcPeA.Wm8LEmmSIXhpe7MRURKrQ5KkyhyDZE_zLwkt.YTZhnM1MHESJ8UZpnMke
 U7FlJpQH0jtMQXeEP.oa82HDwpImj.TwZzP3XdHqP6RQmOnfV0OIOwfvepOc5oGAiepJ8wFyd4lJ
 hI.YurjaPDl3DAfiF.eT8MWnYkhMN_.WOQdk1ruYfaqzk9fAn9Kmo5CdzdRcKaAwyaRmZamrtAY6
 HaYH1hP33Yll2eK.NYSmLag2biMbyFzYTzwpFV.WOLWlGKCd1C4akpa18N_wCrKGSpdHtAGI.qub
 0HigSOB33Du2FxDxx7YIu7nfz961Tczwk5I5yHljbywE15pOtDGYqddAMMWWYGzkOGtJEAuPCZVJ
 u0KjCFKT1u9jBvr_VS0d9_yEzFOUFP4p_VdA8UkloO5D0u42FljUsdXTMw6mraZu19ocJhRRvYY_
 miqfdsFpAd0d6LINtyzaVM5fuJ1cyfaLc9gTBADxtS7MT8VftWJvhJ2M.dnyIFkbSzb.9ZIojvQP
 uBxdbNyiXdE.AVgBFBdU17d.B9pYuTu0cP1d_i7PS2CvnHVC28UUjxsXffba2HQ--
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: bb5d17e8-c0f3-47ff-a78a-ca3eca102ac0
Received: from sonic.gate.mail.ne1.yahoo.com by sonic316.consmr.mail.gq1.yahoo.com with HTTP; Wed, 7 May 2025 21:10:41 +0000
Received: by hermes--production-ir2-858bd4ff7b-vtq9f (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 6d052b03b64f3af48b113650e23cc432;
          Wed, 07 May 2025 20:30:10 +0000 (UTC)
Message-ID: <758195078eee66ce97c05091004bca9d5c3b6cd9.camel@aol.com>
Subject: Re: [PATCH] x86/cpu/intel: replace deprecated strcpy with strscpy
From: Ruben Wauters <rubenru09@aol.com>
To: "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, 	x86@kernel.org
Cc: linux-kernel@vger.kernel.org
Date: Wed, 07 May 2025 21:30:07 +0100
In-Reply-To: <3AFD7702-7D6F-479C-950A-CA439E01838C@zytor.com>
References: <20250507185459.8769-1-rubenru09.ref@aol.com>
	 <20250507185459.8769-1-rubenru09@aol.com>
	 <3AFD7702-7D6F-479C-950A-CA439E01838C@zytor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mailer: WebService/1.1.23772 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On Wed, 2025-05-07 at 13:14 -0700, H. Peter Anvin wrote:
> On May 7, 2025 11:51:36 AM PDT, Ruben Wauters <rubenru09@aol.com>
> wrote:
> > strcpy is deprecated due to lack of bounds checking.
> > This patch replaces strcpy with strscpy, the recommended
> > alternative for
> > null terminated strings, to follow best practices.
> >=20
> > Signed-off-by: Ruben Wauters <rubenru09@aol.com>
> > ---
> > arch/x86/kernel/cpu/intel.c | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/arch/x86/kernel/cpu/intel.c
> > b/arch/x86/kernel/cpu/intel.c
> > index 584dd55bf739..b49bba30434d 100644
> > --- a/arch/x86/kernel/cpu/intel.c
> > +++ b/arch/x86/kernel/cpu/intel.c
> > @@ -607,7 +607,7 @@ static void init_intel(struct cpuinfo_x86 *c)
> > 		}
> >=20
> > 		if (p)
> > -			strcpy(c->x86_model_id, p);
> > +			strscpy(c->x86_model_id, p);
> > 	}
> > #endif
> >=20
>=20
> strscpy() needs a buffer length; this patch wouldn't even compile!

Hi, this is incorrect, strscpy is defined in string.h as
#define strscpy(dst, src, ...)	\
	CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src,
__VA_ARGS__)

the third parameter is optional, and it works perfectly fine with two
parameters. I have compiled it, and there are no errors.

> Not to mention that the string in question is generated in such a way
> that cannot be unterminated.

I'm not entirely sure what you mean here? The assignments above are
null terminated strings, which the two parameter version works fine
with.
