Received: from sonic306-20.consmr.mail.gq1.yahoo.com (sonic306-20.consmr.mail.gq1.yahoo.com [98.137.68.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8CE1632C8
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 16:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=98.137.68.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748449535; cv=none; b=DxT0pWt/JuJJFMHVqVx023GQY0u8a6aRx4lT0wPyx41Aveuj8C4jO3ZuLeWD+vpd9T3X8WBymHZ4m8+Q3SLf5krb79C3KlxzuAl5GJ4Ubq5o83Cn8FvzU9phaEFgvpi2hIyL5c5s0NsQaLCs2fmOGDPGy7Msx4hEhClFmJ0sU60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748449535; c=relaxed/simple;
	bh=HFxhx5zxugMXnHGPXaZv+GmHaXrwjFwTYGq+wsNop9M=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sGQhMQJR59RQsHe6mduBYNXmRwTjkEIKTTEuBPn2aK4JK4dkMFX56x3JrI2jp3HUP5LrJap59reOmZx9GT32CROJDfFnB2dj8EruOhFvuxspwWiPtbfuDLELb09vghxA51jOqRzsNCPzanWulXWJyxMyG0I50JsBnsSIIk/g9Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aol.com; spf=pass smtp.mailfrom=aol.com; dkim=pass (2048-bit key) header.d=aol.com header.i=@aol.com header.b=jHwONf8/; arc=none smtp.client-ip=98.137.68.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aol.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aol.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aol.com header.i=@aol.com header.b="jHwONf8/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1748449533; bh=5CSqmFfYZqp9BavGTmNLGt9In65KcvThz/y2RFlvWlI=; h=Subject:From:To:Cc:Date:In-Reply-To:References:From:Subject:Reply-To; b=jHwONf8/0khBRFBHgn3ecyRmITo5nhQgvF3qW+Xx9IH027BQhZS6mUjZeewRq3Qp9OflmQOxhSqpo1pLxDaUqtOIa5YMrPHTgVyBQVgMhe82Gp7AvfvfgUgPuII8l55b1Eu8zCXa5q88ZC4fISxIp5ByJdXuA8b7li9ZpVG8dKnb8veJhr9+DDbsa1Iat/4i9iLiUSo0Xq5Y6/AnN3d1mJl8ZlUsAPY2TBFZNwCxLV5q60Ca/9UQrY9s4KAUzvxNZTev5M1vJrQIL0b1/8dGH8ozrczmiSzRMjRflZeckZ6vbtvCRlFAzsJdC2dIxxw7Dnxb8zqpbrlTTYo/08ZuvQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1748449533; bh=/6BCCiNfCDsDPoPDAdS56kCitxE1oPgt3d80I70Ympi=; h=X-Sonic-MF:Subject:From:To:Date:From:Subject; b=mW8QyhYrc3hziZF4+/Zs690s5/h9u7/cUUZAcSmU4Ofqev9k3EXxa9lUT5XqwLSeR5cpaC/PIVr14fv3fn39eyIs0z0dq9rl/tl5ITgVwIizpyyX83JoPseWB2OGk+haNpUAD1/aj3iG8yyO5HZD9gl9jERuQ9fkrvd1n2SUPPDYJHmJ4WqfqfDioWuaBw49caCHcRiyFMjSP/b23LSXU+/SW8wW9nJjuyDMecsJj5DgDk8yL4FP7JEdTUM1Orc+gXXvEAhV6ioECI4YQWDSUMzUXXvSOdcB4DxhmYkd3bdFSyjvPYAfjDX4ySDNxI6ZUK3F2Dry2kHTVyzUdgpmHQ==
X-YMail-OSG: 2g2I1XYVM1lTAAlNSRPOyQoW2upoamcBBoSek7nmqsAcsCn_V1tRH6bvPDCCJnN
 GdY.ttaLPbNrd8.19pbLDlXCBwNE.UXQGm.gbDsfgig6p3eJCNIAgcr.AeiCqf7oFo75cnlb_H0U
 cvyqcRbfwvcSqjrgA8nmkgdA0PnXIcf.GhErMMSF.k9ZPgO4R3pCKeYPXFxV1n8x.SEcn3j_KaPY
 RZreD_ezL.boJkTfTJ_0KjVQG_XxYzM4kzQatTRLJhwChVnh8tiysg4PnRMlQUESUhcB6iq5SNlQ
 nUnjjJAVk46vlwVGG7Tews1iwwORehV2e8ntDlo2CZH6Jg2CmxBL_aAcV.pbg_lBTdkNN6hSVab_
 w0ua3CLFK.uPsQvnA8BTzzmnblHX49yTxkFy7ehiZYvegQMPqq0JVONbVBVXI.PRRZ_IJu7TfAHG
 1TLnonaZMvNYeG52KriZW9xc6uUYSG5goY7MIbBFzJ8BOzkrqcq1K4hxp9UYsldnX7yDUAJ63A1Z
 6aGbz8b_IfO0xFR.H.BYaEomH22YNX4WpK8QTU7xnVxJ44T4SOP6HMKizi5WnkqtjtxuIuF1zz.8
 3kiU5nTk9LMAOIvLPX9laGY.71KSvcHa2KPjKmKpqrLKBOEvMhqtGuXss2BgeO6P.zKH_rSjXCz5
 CutbViCewc4z0s8BPUZJrjPUCgjj.khQ3P0bIuJ0SmHKJlumO9ZrMiYi9rUQCnsQj7lMNioxlZso
 XtfdR.l8De.GehcRnrvenFojnjOs6Y_ZCvXxwNNSk2weG.E0epzIr0FIjQ7GiDIszDDwh1eRj_H3
 _r_J7N7sLgR0KTH.pfs0oJrhrYfYJbuKSkBWmuKB2dk2yKf6u1qAhXJpHK26OD1nbWk2ZbXJ6fTG
 3LFBiPkge9TjAmRymyLm4Z.jaNDDouAsgve03NxEifuUm0ae6Kh8q69qB941nqGxz947cdGI9zgV
 DbCyV2Kf7NwaLEtFBWTcmiz5OpAZN0sJnH.QmuyYfxKwB8ixolHfUDuEE5ETbu3xTo5u_h81EwSn
 T8ylxXw7L5OAoJ5Fo288BlE4UYr2UwTHMHE3GHh0KojwzIDyUw7jEwoytp6GL4M8ayTXY_6edVdM
 0d2cVbIvY5CersxG0L4xR4xaAizsikwF0.rjJUUdnDSVW2iqkbccBdo5rXhZhmZM19v_W2sFYDGV
 9P.7OA_HDZBMmZ4GhX0bFR0VpS2obizVxHWSTl6lXFCqGMl4CCXYmEP0_wCQlOtqxj.HgtxxXIpf
 hYzbeilXPRBIVt2DWJyBdJAGsxYjtUmk0jH7z.TaE3LhTAivw5x73bpPQhNLtOZA7j6pkkMqs_JH
 TyI4.WsB0jtVbWW03PW44_ayeoKmc_9v5zre01F4ZOwauACDECZWKAD09e6SDhDZiXvLgSbMkGis
 Zbi.QO_i4qYzS45fpC0saNU_G8uf.X69LoWnCn49dwBwwOIjvqdSXNoMdbscUGC8Bd5wuCiMfZjy
 s_kAa5OCrGgvsFft_jh8RD1qic7x9356.3o9PibcBGD1D229OZxpKaacylNRuV_TgV.tURgUbXql
 qpkdD1PhGrUs2paT.7idw09kpbqSOzMGz6MO_1qgV.eypovBM1nqZUKksVgyTNkCNYwFYZpEa6rU
 pxtjRzxcfxSqSW_EZoJkC8tkEq4nBsgEUEZ8UeSy1l7jVlrvh0Qcxsd3plJez_Sl1yoo7iGSg4wM
 EzmijwFwu4qsVi1vTIeOyosvfj2x51VJHWV5628wtsnw0JRi3dt_dc6vOnD5MhuaFUEaogm7bP1z
 G541COMrA1EJij2Lmy.m6C_3p3jdZ6W80drV8MoAYNEPwKb97byS4obENx1IWc_1FrG4a2d_fW0r
 URQGNrRWzrZ0x6TvUvKp8tRFXdGBm4xHif5ROfpCn42kdVkYsPoOxWKg0zhuvfhW8v__eOO2W5Yt
 ypp4wqnyVIvJ3vYSMosPpwrf_8k_j66HdO7V1tFuZGh9QFlGMLuDZEFkT1k2hIYmUTnuMcpYM16T
 9mp69vuTjy8A8O4m2BJV9xOL_2xCfaAoqiK.atkFBaO_GzFX6z9yCZW.4spCyZBNKNop3sdyPQB.
 oQWEtLVFQnbryxOR99woUH2zkRuvgbKpnUMhPuaNYhgoVZVcJfAJL6VSG51cqhZWLO4kL5zyN7rf
 Jb6b1lxlOu_m_rbb27ldbgMghBEfuY3nCNr8WuPwdmMNcjrUKnB7A4HNOotcmypg_mlUAdxQ0r1S
 LCzcXI0FKVynxrlaVu29dicyLx2lvFhT.q42EQDyTV8IonVBW_j6EA6A-
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: 17b931d1-4a0e-4dbf-bbf2-a809d17f94c0
Received: from sonic.gate.mail.ne1.yahoo.com by sonic306.consmr.mail.gq1.yahoo.com with HTTP; Wed, 28 May 2025 16:25:33 +0000
Received: by hermes--production-ir2-858bd4ff7b-th9dj (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID eb482e408247eaa799aba001c4517a6b;
          Wed, 28 May 2025 15:34:54 +0000 (UTC)
Message-ID: <7a83ac38b5f2c9d7ec08c04a63299d2eeaa832fe.camel@aol.com>
Subject: Re: [PATCH RESEND] x86/cpu/intel: replace deprecated strcpy with
 strscpy
From: Ruben Wauters <rubenru09@aol.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov
	 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Date: Wed, 28 May 2025 16:34:51 +0100
In-Reply-To: <20250520133549.9964-1-rubenru09@aol.com>
References: <20250520133549.9964-1-rubenru09.ref@aol.com>
	 <20250520133549.9964-1-rubenru09@aol.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mailer: WebService/1.1.23884 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On Tue, 2025-05-20 at 14:26 +0100, Ruben Wauters wrote:
> strcpy is deprecated due to lack of bounds checking.
> This patch replaces strcpy with strscpy, the recommended alternative
> for
> null terminated strings, to follow best practices.
>=20
> Signed-off-by: Ruben Wauters <rubenru09@aol.com>
> ---
> This patch was reviewed by H. Peter Anvin and (by my understanding)
> was deemed ok to apply. However this patch has not been applied after
> 2
> weeks, so I am resending it. I have not added a Reviewed-by tag as H.
> Peter Anvin did not do so.
>=20
> I also wanted to note that while immediately this may not have any
> effect, any addition or changes to the strings above may possibly
> overflow the fixed buffer of 64, and the use of strscpy instead of
> strcpy will help prevent any buffer overflows by copying a max amount
> of
> bytes. I do also recognise however that the strings above are
> unlikely
> to be added to, as (by my understanding) they'd require intel to
> release
> a CPU where the x86_model_id would not be detectable.
>=20
> I still believe that while the above scenerio may not come to pass,
> the
> replacement of a deprecated API with the preferred alternative is
> good
> practice and should be done.
> ---
> =C2=A0arch/x86/kernel/cpu/intel.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/x86/kernel/cpu/intel.c
> b/arch/x86/kernel/cpu/intel.c
> index 584dd55bf739..b49bba30434d 100644
> --- a/arch/x86/kernel/cpu/intel.c
> +++ b/arch/x86/kernel/cpu/intel.c
> @@ -607,7 +607,7 @@ static void init_intel(struct cpuinfo_x86 *c)
> =C2=A0		}
> =C2=A0
> =C2=A0		if (p)
> -			strcpy(c->x86_model_id, p);
> +			strscpy(c->x86_model_id, p);
> =C2=A0	}
> =C2=A0#endif
> =C2=A0

Hello
I was wondering if there was any chance this patch could be applied? is
there something I need to do to change it so it's fine? is there
someone else I need to send it to so they can review it?

I don't want to keep sending and asking about an unwanted patch so if
this isn't wanted please let me know and I'll move on.

Thank you

Ruben Wauters
