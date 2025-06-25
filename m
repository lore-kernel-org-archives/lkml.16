Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952F31BD9C9
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 03:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750821048; cv=none; b=hsBLny4v64HOw26rg6wlEgm2MvCM/5okW7bSh7izOLFKSOnhUyRlWBDO9gYsyETJo+Jhn9txLtx/Qv3fVq1G5s2pj9Hl0FFbQVtNuC03JXUgTFhtjJTkwRkArUwsDsw0b17yMdD5c/RluN7xQ1jXtQwGYSwGlx+xOAOKMUzoEkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750821048; c=relaxed/simple;
	bh=9UOqHmzwCMjgsQn/1nIlqb7z9BtR3vgW+kgUM5V4Ml8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=r/zQwa/iPkEwWAJ6C9H5fvprAL/VwSNgZFc/4JkDgpbTG5TFCROS3l4CJkDMD7BppvE40FFUlfZGeDPGZfeB4x01Ic5xxCN8DGIypyVi/ecMkauDWA1YHi48RuqZuCdmpGRp9ii5CgjB9cBSK24xbPtKGVMuqw8qOySGUUeg/pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4bRn0S3Zv3z2QTyp;
	Wed, 25 Jun 2025 11:11:36 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 631A7140144;
	Wed, 25 Jun 2025 11:10:41 +0800 (CST)
Received: from kwepemq500002.china.huawei.com (7.202.195.240) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 25 Jun 2025 11:10:41 +0800
Received: from kwepemq200002.china.huawei.com (7.202.195.90) by
 kwepemq500002.china.huawei.com (7.202.195.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 25 Jun 2025 11:10:40 +0800
Received: from kwepemq200002.china.huawei.com ([7.202.195.90]) by
 kwepemq200002.china.huawei.com ([7.202.195.90]) with mapi id 15.02.1544.011;
 Wed, 25 Jun 2025 11:10:40 +0800
From: duchangbin <changbin.du@huawei.com>
To: Alexandre Ghiti <alex@ghiti.fr>
CC: duchangbin <changbin.du@huawei.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: Prevent early kernel panic in instrumented
 apply_early_boot_alternatives
Thread-Topic: [PATCH] riscv: Prevent early kernel panic in instrumented
 apply_early_boot_alternatives
Thread-Index: AQHb5PtyjCfzcR/e2EWBZK4/MCSYmLQRvi4AgAF1PoA=
Date: Wed, 25 Jun 2025 03:10:40 +0000
Message-ID: <d41d9c7a103f4600a4fc5beea77e0f4e@huawei.com>
References: <20250624113042.2123140-1-changbin.du@huawei.com>
 <a89f5970-5ea9-4d92-8952-6c26a22ac153@ghiti.fr>
In-Reply-To: <a89f5970-5ea9-4d92-8952-6c26a22ac153@ghiti.fr>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: kwepemq200002.china.huawei.com (15.02.1544.011)
x-ms-exchange-messagesentrepresentingtype: 1
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6B6D87550F0AC946A7F2343632909A59@huawei.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, Jun 24, 2025 at 02:54:32PM +0200, Alexandre Ghiti wrote:
> Hi Changbin,
>=20
> On 6/24/25 13:30, Changbin Du wrote:
> > Under FTRACE=3Dy, DYNAMIC_FTRACE=3Dn, and RISCV_ALTERNATIVE_EARLY=3Dn, =
the kernel
>=20
>=20
> Your above config works fine for me, I guess you meant FUNCTION_TRACER &&
> !DYNAMIC_FTRACE (which fails).
>
Yes, it's FUNCTION_TRACER.

> We were just talking with Andy about this configuration (FUNCTION_TRACER =
&&
> !DYNAMIC_FTRACE): do we really want to support static ftrace? Andy should
> send a patch soon to remove this possibility as IMO we don't want to supp=
ort
> it. Let's wait for this patch and the discussion that will follow before
> merging your fix. I'll keep it in my list for 6.16 just in case someone
> comes up with a good argument to keep it.
>=20
No problem. I'm unable to enable DYNAMIC_FTRACE because GCC_SUPPORTS_DYNAMI=
C_FTRACE=3Dn
and CC_HAS_MIN_FUNCTION_ALIGNMENT=3Dn are set. It seems that my GCC version=
 (13.3.0)
does not support the option -fmin-function-alignment=3D8.

By the way, this change also eliminates an empty function call.

> Thanks,
>=20
> Alex
>=20
>=20
> > panics upon returning from _mcount() in the early boot path. This occur=
s
> > during _start_kernel() -> setup_vm() -> apply_early_boot_alternatives()=
.
> >=20
> > The CC_FLAGS_FTRACE is only removed from alternative.c when
> > CONFIG_RISCV_ALTERNATIVE_EARLY=3Dy. Therefore, no function calls should=
 be
> > made to alternative.c during early boot in this configuration.
> >=20
> > Fixes: a35707c3d850 ("riscv: add memory-type errata for T-Head")
> > Signed-off-by: Changbin Du <changbin.du@huawei.com>
> > ---
> >   arch/riscv/include/asm/alternative.h | 6 ++++++
> >   arch/riscv/kernel/alternative.c      | 4 ++--
> >   2 files changed, 8 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/=
asm/alternative.h
> > index 3c2b59b25017..c670b0cc55f4 100644
> > --- a/arch/riscv/include/asm/alternative.h
> > +++ b/arch/riscv/include/asm/alternative.h
> > @@ -31,7 +31,13 @@
> >   #define ALT_ALT_PTR(a)			__ALT_PTR(a, alt_offset)
> >   void __init apply_boot_alternatives(void);
> > +
> > +# ifdef CONFIG_RISCV_ALTERNATIVE_EARLY
> >   void __init apply_early_boot_alternatives(void);
> > +# else
> > +static inline void apply_early_boot_alternatives(void) { }
> > +# endif
> > +
> >   void apply_module_alternatives(void *start, size_t length);
> >   void riscv_alternative_fix_offsets(void *alt_ptr, unsigned int len,
> > diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/altern=
ative.c
> > index 7eb3cb1215c6..5406c3301627 100644
> > --- a/arch/riscv/kernel/alternative.c
> > +++ b/arch/riscv/kernel/alternative.c
> > @@ -205,6 +205,7 @@ void __init apply_boot_alternatives(void)
> >   	apply_vdso_alternatives();
> >   }
> > +#ifdef CONFIG_RISCV_ALTERNATIVE_EARLY
> >   /*
> >    * apply_early_boot_alternatives() is called from setup_vm() with MMU=
-off.
> >    *
> > @@ -219,12 +220,11 @@ void __init apply_boot_alternatives(void)
> >    */
> >   void __init apply_early_boot_alternatives(void)
> >   {
> > -#ifdef CONFIG_RISCV_ALTERNATIVE_EARLY
> >   	_apply_alternatives((struct alt_entry *)__alt_start,
> >   			    (struct alt_entry *)__alt_end,
> >   			    RISCV_ALTERNATIVES_EARLY_BOOT);
> > -#endif
> >   }
> > +#endif
> >   #ifdef CONFIG_MODULES
> >   void apply_module_alternatives(void *start, size_t length)

--=20
Cheers,
Changbin Du
