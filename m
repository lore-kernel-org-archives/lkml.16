Received: from sonic313-19.consmr.mail.gq1.yahoo.com (sonic313-19.consmr.mail.gq1.yahoo.com [98.137.65.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139A82741AD
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 12:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=98.137.65.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744977746; cv=none; b=m49izWLXItU39jNWNhN1iYb62doTY8Fc3d2hYdLfw3YIFIttTSdtIHd/8F/C03908wPWEnvGgMPMm4odP72g/ordka87fDWlESe2DuKGuxT9bwJEoh6QTuwx0rrDGL+lN3hS5yX0DWXbuKALLYA72N8vY2kOevBrG+wpv4rPmNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744977746; c=relaxed/simple;
	bh=I2lH+oxrrZ3geS4M0/OvRqpbgSvTGX+dG4TmkaMlJ3k=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=G7u9Pj6EfLqbJojwpcn3l5mk6BIP1x1+CI6xwmkpag7vZviGZRJpsby1xDtYNZfIL6LPtKx7abbQYrA5zUXexJJhrYTKM9fnXhnZUEHL1SmfF8NRtYAppR3q0q/vFIoNkuUV0ujQeR3jwIB7P8CcQoSDP/xS57CpT5aeRXVMbcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aol.com; spf=pass smtp.mailfrom=aol.com; dkim=pass (2048-bit key) header.d=aol.com header.i=@aol.com header.b=VPvbn4nB; arc=none smtp.client-ip=98.137.65.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aol.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aol.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aol.com header.i=@aol.com header.b="VPvbn4nB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1744977744; bh=I2lH+oxrrZ3geS4M0/OvRqpbgSvTGX+dG4TmkaMlJ3k=; h=Subject:From:To:Cc:Date:In-Reply-To:References:From:Subject:Reply-To; b=VPvbn4nB6Xf19ncZD9kt3HwOnwxFxB8Cdlb/4yzg25tRyGoc+qcQcf3GR0miB7tjuxlsN8bQXgUsI4EqdckPTW8Cm1wqSt7RxRKy/+kKGKQHoDzhZKIf97quPeTS0IvZ0xYwU+hYTZZi9UiQAb9FCaLaWBgE4cfFrY80oz5RjHO89PPb/2AFxB0G3YPmwWVKzkMaE9AxUlWgbE88JSR4xrNP3EtAWnmKTg8b++yzP0K9HLRW6a4JztJr2ECdpbob1Rxe/GmshD/U3F2sPcLevUcp6mgoAHCH6mIt9oPBz1m+b+VStCleUhz39CuKOiHMp0MdBEm6goiPyqHZhmohMA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1744977744; bh=S7o6rAG823U04mmBDxRhlYBPx0XeLv4+R7yqpv84I1q=; h=X-Sonic-MF:Subject:From:To:Date:From:Subject; b=LLSecIm+XxfWCdvssg8wCUIE9m1YTK3Dp2b80m/Ns4CHJd0NacwZ/Rd+TosXVP++/lBTogCzVIEo8oKAPmLjASzd5IurmWbpGQjHTBo1GJ+2aS2TdPFB//2X2mcv85G/M2pRC+9QMvyM2UXStTIjtQj4yKU0m1dPN0BcYFj3HZHL3rdoapMGI5E9gwqfaU+uGpO2MQj5tWVlHbm5wwIDIkdqX9WVLaEEbYOrRUL5lvQr8QHIp8AyWC0+3pFXjWYRxzZOlyDk3iow54+3+nIvmirCvQR56Og7jk/X/mz/70AUgVlMkYHptm6R5TS2jusd+jUguUbhMze8H9IVjs8S3g==
X-YMail-OSG: DImzLQ4VM1mqs2GbH8Z4.pTTSndfsaKSdnOPbuCwRJhnENM1vnR8YBwYRj.Y9Gg
 DQIPg7HSJtclQObiNnUgy9RBGwFB.6Pezc57jcapCBXDy9pysJQDj0pipqg1Hr66a1zg9YFpi4Z2
 MeFnC2lgHdlggiHlyeDDuWs3rctfjTu9vH84ZB3Dhu21zmtf7yTA9GAxqOeofKuFZPY.ToxagttP
 FgZJEnCCc5Ly48HvYj5.CfRTFPTjIeR8XbXLCahyT1ibbQELdKecnUQCsXqpUx.FiUsPht.5idZa
 YOBQfOFsmwrsYnN4HaKkDXk1zQk_QXjs6hXzrxL11Dk2Mz8edEsJCzMJY4auMTHVmHwMRPtd9Uwc
 __xw.vbpsJjK0rXo_AetTY3i9W9OTL7njHKQzrfy__688d24zDOE21QN.GJDv_vL6lVLeRkMQVGP
 YOLtOngU4UfIGR5lQ6QmE2TlCCUSpSp8utO7qLJinxI9lu5cKuUZoGEb47p6ua8p.JlJybuZclVG
 vfTUXOzoMEnuJ_7EJYED91ibSZR7nepSLTiW3kuEs.LAWA_kYjYhgWLhKPU1Co9FPMN29faXT1XE
 OBeOIUPAsYsopTaXIJoUIqpVrIeq3pbr5XRGq2MoBKU29rPkGuXLpai_i4VUmKF2L3VujdIBw_DC
 t2gDeiXP9TrNG5PiXnDQyep1I3HSAL4xD8_k0CYP8y6SIRjdTM9SW.4iEJyDTkjmHQr4mXpsG6Be
 af8ivAKc50zSoyRwPRzZMxjvV2kjnnDxCfgbXUPR28JcoD5RYOELQ4NmnGxl.Rj3kZ7GDzv27uiX
 .0z7hgeQQpP4Y3EHsWPzqBrfxbVmIfWFqOR9fAFrRn9EKJ9apL9eCWl8.l5TmZyiW6i7P2eOWeWg
 d4HVx0UHO5pL9BOAXloPYothJLUsD_PSauAJPxr0OjCIsGD_KpIoAiJpkRyueVesUO6RHQzqn.tL
 HNXbtsRevls1Qccyh6BZxYkKR2kYZSJYoVpqUo3GTQe2gq3gcQSQEXXSWUX6ABdzK8527ktILMNZ
 4q4CUK.UC9kFO2pwhlctiimpYnH3sL3H6B8_9eTMcnaih4gxgFdAGtmxxoCChur3.qMWqoLdZq4E
 Gicf2hjuJp72DcVFkUvdKuFS0lIl_.RTNltgJ3KY9qIvNcmXZMFAkNJMJnezNHgnURvP9h9lfR5T
 fgPUWuRv5EJZqrEr7.SzNEaASPoCSh1cFKZ5EylS7pjGxoXQMquTF5tGhAR0vVFOOi0s83G1i0KW
 t9BpDQ89o91nLib4fAejt2XAWEx9SKcwRHkINo5nIFRtf.O5apUxgTb.KIbbw71789jODdncdBAG
 wLm_KBMCcZo6X7xgXoPR4f8ARJJZJU0NgrGIzEj_j9wqO2hiuB_.0VAEcC8f.I34rL3Fx1Y2Rn6y
 Ih3pwvROnV6UBCcv1KZASqOBMBblK65t6bB5Mv9lcJWdWEjdyyYxv0NgJPVFKQ.gWpOp6jMBHl9M
 qjciFxCis9U9eeo8UjYR7RHkDJZrSYZrTd3DYUwZm00_kFyFLCInHTG2uETLQcX_FeoxzuSP6Ysb
 042iK2b4mRCs4Hfy0awRfYX_JMWZAUCs2jYrNS0mn8C42LuEoBihUaZpOfvFMxPd4O3PnPJ.wM.o
 mNjimlbwqD6qG0ye.viXucaXPcCZcfQLJHGXi1xf8BBZGli_kmhLKtsCcOGu.CfXyti8DyW8TUbQ
 KrMQYTYo8fBWzKszwE4SxGflXZ3xl._wvn4xkMDRGPCgE2FqPHuP8Uyes7Y7AFLw06CcdWG_0bcy
 p5u6S.3nmI0Mlee8_TqefxMHRXTMbAcz2VhFxncCvS8Uuo6JJFdtnVzWvwq.8e0GwcJoYTDo.smd
 _MV5nFvkDzcd6pnK7neG567w2Jj40a0dzYcGIvQhJWUnec9X.YsiZe7fRv_5SyjFtXsmVewTwJR8
 BLrDIR9DpAPFQZrCDmjo_kTI6s3BjmDo9o5jqHzHB37.B6Xd8t1zGMcu.0YTK9Y4.B31Zotkyzar
 Vh74wetnja80aL4cATF428h_wru8.xgEeYmJNrCIf3Ymynm3_bts_oK7YXBbZ__oJ0dQPisk3THy
 t2VTZMmSMkRuCR9Xr0UahsIRC6PdjdckDp5CELrGFo.AnWxAnz2R6SjllK40GqTRmKrtHjsw682r
 m0FXFcDr.GUfi.1weJJIERcEM913eb7VpKq2h2_xJwf3tgTZV5HdQhlVhcEEEiSUeteuuzgLNXa_
 fjMIHcTC5ej9IIqKZAI7YElD4jhKAbt3ozOnVuBv76dEldk3obENMimGx4sQbIFyc
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: cab1b94c-8fb7-4666-8a03-bcc63274388a
Received: from sonic.gate.mail.ne1.yahoo.com by sonic313.consmr.mail.gq1.yahoo.com with HTTP; Fri, 18 Apr 2025 12:02:24 +0000
Received: by hermes--production-ir2-858bd4ff7b-2xfhr (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 84328671808db76a19f22e88f900a3de;
          Fri, 18 Apr 2025 11:42:07 +0000 (UTC)
Message-ID: <ec791e981505d3c8e1d14e6d68eb616ffa4aea71.camel@aol.com>
Subject: Re: [PATCH 1/8] staging: sm250fb: remove USE_HW_I2C check
From: Ruben Wauters <rubenru09@aol.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Teddy Wang
	 <teddy.wang@siliconmotion.com>, Sudip Mukherjee
	 <sudip.mukherjee@codethink.co.uk>, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Fri, 18 Apr 2025 12:42:05 +0100
In-Reply-To: <2025041836-debug-unstopped-9a88@gregkh>
References: <20250417190302.13811-1-rubenru09@aol.com>
	 <20250417190302.13811-2-rubenru09@aol.com>
	 <2025041836-debug-unstopped-9a88@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mailer: WebService/1.1.23665 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On Fri, 2025-04-18 at 12:33 +0200, Greg Kroah-Hartman wrote:
> On Thu, Apr 17, 2025 at 08:02:49PM +0100, Ruben Wauters wrote:
> > Removes the USE_HW_I2C check and function defines in
> > ddk750_sii164.c.
> >=20
> > The software equivalents were never used due to
> > USE_HW_I2C being defined just before the ifdef, meaning
> > the hardware versions were always used.
> >=20
> > The define names were also triggering checkpatch.pl's
> > camel case check.
> >=20
> > Signed-off-by: Ruben Wauters <rubenru09@aol.com>
> >=20
> > ---
> >=20
> > I am somewhat unsure whether this is the way to go or
> > the correct way would be to add an option/opportunity for
> > the software version to be used. Currently the hardware
> > version is always used, but I am unsure if there ever even
> > would be a case where you would want to use the software
> > version over the hardware version.
>=20
> Then the code can be added back, not an issue.
>=20
> But you forgot this same check in
> drivers/staging/sm750fb/ddk750_hwi2c.c, right?

This check can indeed be removed I suppose, might be worth also
removing the USE_DVICHIP checks also, especially when defined

There's also a USE_HW_I2C check in ddk750.h, which defines which header
to use, however I'm somewhat unsure exactly what the best way to go
about addressing that is, since it's not defined before including it
does make me wonder whether the HW files are even used at all.

Something about this seems entirely wrong to me, again I don't have the
hardware to test, but why would SW files be used when the HW files work
fine? Is it intended that the HW files are used instead? it's a bit
inconsistent, especially since in ddk750_sii164.c the HW ones are
explicitly used over the SW ones
Why is the SW files preferred in sm750_hw.c then?
I believe this is something of an oversight and the files should
probably use the HW ones instead of the SW ones.

I am curious to know your thoughts on this (and anyone else's)

> Also, what about removing the sm750_sw_i2c_write_reg() and other
> functions that are now never referenced?=C2=A0 Can you add that to this
> patch
> series?=C2=A0 A single series that just removes the use of USE_HW_I2C and
> the
> now unneeded functions would be best, as it's not really a "coding
> style" fix, but rather a code cleanup thing, right?

I will create a separate patch series for removing unneeded code, since
it does look like a lot more code removal might be needed than I
originally thought.

> thanks,
>=20
> greg k-h
