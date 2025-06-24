Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D18A2505CE
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750747828; cv=none; b=hGTp2+LB+FZfp8ouHZzq6xxvfqDI1vSpKSgsrQGtk9IUAwyuMHODEZF8H0uJnTpLCaEDMDnJFL3b5RvoBJqdLMVmtjpn/fkafc+7DSHgdNZN22ZV9hYIdpycMrRM7UGesECmiqYMZyJLE4l/qjeBIdXFuOEwEd2Wv38i4oj2GCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750747828; c=relaxed/simple;
	bh=nk4c5wVsY0sOXO44Yhl+sO3/dLlti54Y7XNfI6EAN/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nJW++VB+Ppt3hfW//3pL+vp/4I5XiLRTeITqJ9K6UuPDp6cOn2DM+0qkGII9YD5mVHlrXdxUGUOuHTuzb5rZZZQQgUIHolgM+MGFDNI7/86UonZ1rnoWHja1UM8Is3mU9NRbGRoKyg5yZp0Qyx4EwHTE8Hyvs03WSgn0BSmaGVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=HCcEpCwl; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="HCcEpCwl"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-60768f080d8so8664955a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 23:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1750747824; x=1751352624; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zu8eC7tjLOcqYS30DQpzKeHXmMgccPLWCEIpeUViNbA=;
        b=HCcEpCwltR9XBMGwG+QK9NpcdpqYa9OWz93ziqHqkjMxrmTVXa/JPbBEe8/rYIAuqu
         pT3JV8ShPkup5sczJ/VDLy/YhEWsuMYVntfGmZDPjo28+QVSzp9yKZM0abWpTEPf/qFJ
         j7Wps9mTKm09egMGAaTN+1aRbETTZN+QabsV4uBaGE2tLtchGTvlBR5VvGxzZhyALHZD
         i0GEypX/WfM4ToIQBrqdN//1wYqUDE0EWYpk4Ylddj3Ez5tBQD+x0n8b41v4wYUaOiAQ
         Rdk8cEk1Wl9aimIVWe8gjya8Phpih2Iw5b74rHrUS5lapCYFb2Zkp4bsE7UppDq+afZQ
         +bwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750747824; x=1751352624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zu8eC7tjLOcqYS30DQpzKeHXmMgccPLWCEIpeUViNbA=;
        b=ZyH75SXjlwWQCaLBLuu/Po22LnjxLXc/jmOwG5Xf19P6U8pi93Xzz94Kgc/UtIT3bW
         0Lb0EJew0+BnfRKy5R8lmHoA/Cj0NRsGq10pJXPVWy0iT9A5gyanxO1kz08OieyF9Bdg
         qrW0SPKLINsMZ0U1CtjjmT4y5xpwPeLadP00kfvVyyarNU+v6dPvK48FqLO+TVtpottM
         nsbh804ap9InzjlmUKtNKS5rwTRl780CjRxK9ZQQ2Nus92V6Apnie1QvR+cHef0DjgPO
         eJ2h6YpoMAFmHGiMISokAzLfg7lcgemwpMgmqr6nckWr2q0M54GxBcKtrFGrX3JvxslR
         SrNw==
X-Forwarded-Encrypted: i=1; AJvYcCUjiuT9ipDcuG6J/DJliS/2vFeZ0flimmtyE/uRcxKmABKEZJBS7Ot3eNF+vN15cTDpJlUPVK6vwFny3Hk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJOC/4fKyyJvuZH5WEzfiaJlta7Ra9NGGn7AwjQp90DlWfSMG0
	qJfoEjK7UBkQzb3w6IRjiMice+dhw2dVU2ajxqOQD0pagJ904YGAckdKv9qnZQHgYIIFYq+YcBr
	8W8E8EPp/JrPVOf7jKtBq6dxG9MhNWWpa6qYhdWCvPA==
X-Gm-Gg: ASbGncvX9gVfFwn1NqDbahx6+4n0YYoKf0pi3jgWiz1563GS2sGfyCmGDSdYarf2io+
	tMcNq3FgHtlX2N4fIvPgjN4r0ufhAwWq4/YHGVI04nmw7mJ2eX0vLYhS6+j3C7dRRS4gCPf4J7h
	ClZO1U4+ieJSl2bGJYShN+nyyNn5LC6fTWoOJsdVZ7+cVDIWQuRdejYJnCuzfZOVXvw//RqW2XT
	qb0
X-Google-Smtp-Source: AGHT+IGzRwLebB44X+HpPW+RsQT3tGB+3zulPTXxDb2tIjKNXgf9UqaYU57NIhPu4xxRfC+d82ZL8fIlQYadz0IPFTA=
X-Received: by 2002:a17:907:7ea1:b0:ad8:9a86:cf52 with SMTP id
 a640c23a62f3a-ae057ce92d9mr1342939866b.11.1750747824453; Mon, 23 Jun 2025
 23:50:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620-dev-alex-fix_sparse_sifive_v1-v1-1-efa3a6f93846@rivosinc.com>
 <aFoLb21xklpZoOzk@cyan-mbp>
In-Reply-To: <aFoLb21xklpZoOzk@cyan-mbp>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 24 Jun 2025 08:50:13 +0200
X-Gm-Features: Ac12FXyqq4o4L1eGDeUyDUphsBPDf_zSUfSKSQdlxXal54sQQd1XJxJPsnm5y_I
Message-ID: <CAHVXubhsSreoLUbjKZMRwH4EHHaHQYfQmU2r0D4Cey8m8R8sPQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: Fix sparse warning in vendor_extensions/sifive.c
To: Cyan Yang <cyan.yang@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cyan,

On Tue, Jun 24, 2025 at 4:20=E2=80=AFAM Cyan Yang <cyan.yang@sifive.com> wr=
ote:
>
> Hi Alexandre,
>
> Sorry that I missed this patch.
>
> I believe there is already the v2 version to fix this warning at
> https://lore.kernel.org/lkml/20250516030310.16950-1-cyan.yang@sifive.com/

Yes but v1 got merged instead, hence the separate fix.

Thanks,

Alex

>
> Regards,
> Cyan
>
> On Fri, Jun 20, 2025 at 12:08:11PM +0000, Alexandre Ghiti wrote:
> > sparse reports the following warning:
> >
> > arch/riscv/kernel/vendor_extensions/sifive.c:11:33: sparse: sparse: sym=
bol 'riscv_isa_vendor_ext_sifive' was not declared. Should it be static?
> >
> > So as this struct is only used in this file, make it static.
> >
> > Fixes: 2d147d77ae6e ("riscv: Add SiFive xsfvqmaccdod and xsfvqmaccqoq v=
endor extensions")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202505072100.TZlEp8h1-lkp=
@intel.com/
> > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > ---
> >  arch/riscv/kernel/vendor_extensions/sifive.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/kernel/vendor_extensions/sifive.c b/arch/riscv/=
kernel/vendor_extensions/sifive.c
> > index 1411337dc1e61aba0b844902f356625048c85abc..8fcf67e8c07facd1bfdbc0e=
18dd9b43102f22145 100644
> > --- a/arch/riscv/kernel/vendor_extensions/sifive.c
> > +++ b/arch/riscv/kernel/vendor_extensions/sifive.c
> > @@ -8,7 +8,7 @@
> >  #include <linux/types.h>
> >
> >  /* All SiFive vendor extensions supported in Linux */
> > -const struct riscv_isa_ext_data riscv_isa_vendor_ext_sifive[] =3D {
> > +static const struct riscv_isa_ext_data riscv_isa_vendor_ext_sifive[] =
=3D {
> >       __RISCV_ISA_EXT_DATA(xsfvfnrclipxfqf, RISCV_ISA_VENDOR_EXT_XSFVFN=
RCLIPXFQF),
> >       __RISCV_ISA_EXT_DATA(xsfvfwmaccqqq, RISCV_ISA_VENDOR_EXT_XSFVFWMA=
CCQQQ),
> >       __RISCV_ISA_EXT_DATA(xsfvqmaccdod, RISCV_ISA_VENDOR_EXT_XSFVQMACC=
DOD),
> >
> > ---
> > base-commit: e10a0dc2d21fd742c8d6ba042a98c05815011f9d
> > change-id: 20250620-dev-alex-fix_sparse_sifive_v1-4e130e7e2833
> >
> > Best regards,
> > --
> > Alexandre Ghiti <alexghiti@rivosinc.com>
> >
