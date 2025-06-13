Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BCF1B85F8
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 01:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749776910; cv=none; b=TCRq68vRBLD9QN/qGyp6EcRa0s0acuxZjFZdAwQ0Irk5LhHYnfbbhwklZAkMq2JtzV5+1rT63XFX7T1m2ghJszjQS8PqZZrft4iyJIIfv4AoDuMV1r6QCHDQXaZssie478Z16Q0DU3XhW9rK4OqNW3Sl9+A2qzsIE42SwgMOdxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749776910; c=relaxed/simple;
	bh=4cSiIHmjVzal+4uywlcg3fHT6GaATCAkHSAHealoWZA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=nwVO3mdPf79ZoYzYIYpK8pgRbT/5Ntxg/zzpF7oM5J6wAhOaiMruUJr0ksmFBrUtL4ST/hBLWqvdJrgOyQv9eLSDyQ/T+Y1VjN4pmjg8mRyKUjCwxu/ublqDQtySR0Cp11cRvZsSlAEMcB/FiuqWbIkULJDGLr7XF0tBvHAk9h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jrtc27.com; spf=pass smtp.mailfrom=jrtc27.com; dkim=pass (2048-bit key) header.d=jrtc27.com header.i=@jrtc27.com header.b=IK9YeYxR; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jrtc27.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jrtc27.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jrtc27.com header.i=@jrtc27.com header.b="IK9YeYxR"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-450ccda1a6eso13768915e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 18:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1749776907; x=1750381707; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yV/+ZQq5RzgkIE87cL2HuuOvaHTwwG97pZ4IkkoLaPM=;
        b=IK9YeYxRi3f8bRKKm5EFJIIEy5EO7LLEpSMPVMgucRGJC6eMd6hc2Nq8tt/+6NUiI4
         dD1pprOVqtEB55q8X8G5oXCbejR+TadufWzohtcTeXdcOV81nqt7lHq5lGmZWPX5r1lC
         TJOWSCrASUhNpo+EoG2S9OCLZ945UMWdjlgUZ4SL24/ZNnLXGuotPNUYrAVo+bgOY6WC
         KH4jb8cxXQIgNA8VAFRIcbXrlsdCUXjdIuUWYlTaxmQ156GUKwNLXVG/vEeBOA/iUHfZ
         i8NRQkkkvek32g0/CqY0QZ84GEIzJT0U+6Urs66b7gVnpmojirT9NFw+qxPVq1EgQIpg
         VDXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749776907; x=1750381707;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yV/+ZQq5RzgkIE87cL2HuuOvaHTwwG97pZ4IkkoLaPM=;
        b=AAn0WxP+LOmdrFTJg8j02678vIiRAPrjH0m0GaesIg33P5N63+nPMnd2YqYO06CyW0
         GB7RXFx4RaUKIHcvnYgBr9VD6k1otI0XEoFsQnLsosrmk++bC7hCT7XyhN1e7O/oecVC
         828ruoFgbfo4gA8dmvamSXXGAq4xNzS2VMEqD/GUmMcxY2pb4WulPW4QnphhiJnsE4xk
         LWfpCPdXoH0QeIhRJK+LTy83P8Cw2jFp/10ft3r9KJOC8VcrfQBRxH32atUPpkYjWMvq
         /PeOm3biI+rut7oykiXWo++KTbMfKJeax+eexeTj765KZNu4TJ+YfYwME5O8Dbnq987k
         VEoA==
X-Forwarded-Encrypted: i=1; AJvYcCU3uyeEBWm5QP5H/svgKyaHILIsW4kFKh4vZ7Oy5a+D/EsuvNmtsi4N4rxr+lOlZxS8tpCmGXw5ROPD3xU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmK5fF9D09W4zLeEXRozF6NU+tPCmQjD5PCLApV9xkGm0UkEqB
	qZG8RR+3Dz3bhn/UcJKaCpk4AnxsvB3b4lHSU57k164fn2WnNqVbaJj3ODqh21uk4Ll9vOVeqYw
	8SjkQecg=
X-Gm-Gg: ASbGncsmoojnO+KS79zqDrA2hqN2f5p2ZdgIDvkJKfIOUWX1MYoYxZ72ETz0WJWqM0o
	CbNvMpJwgRdFgz+iZctICdRfxku0XxPyf7+iiMqkWCFXlOjxIOfGnZqHavjFrP6ALImv5zJUBjc
	m8NkomiWTB68sUfGtYf2hxv0dcDWBt3334qtB0x1+pI/mW+MGKJQWlTkvek0AyHCD2b5fA5ezKg
	0j5wc9/sSU8LkymP7Y5mXDvsocw5ygUHvzgwvOodPOoG7V9ozGSiHholHg1UQjjeHAyc3Ew/DNO
	NWUwJREQv5V4rSaX46iYLlOGkvh3jNXTsYC9/U3LfIKvGxsMFfx7XgOUjEBKMlIzjqTDDm9Oof8
	=
X-Google-Smtp-Source: AGHT+IFwyw9OHP+fZV6LAbNr0tT5uZJzpkB6b4K/Ns4tGf9uKmcXDtKWoPd0LKrnrhtueMGufyguFg==
X-Received: by 2002:a05:600c:1c12:b0:439:9424:1b70 with SMTP id 5b1f17b1804b1-45334b5ae3cmr9341235e9.30.1749776906902;
        Thu, 12 Jun 2025 18:08:26 -0700 (PDT)
Received: from smtpclient.apple ([131.111.5.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e24420csm35282755e9.20.2025.06.12.18.08.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Jun 2025 18:08:26 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v3 3/3] vdso: Reject absolute relocations during build
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <mhng-4BA05CCD-6D5A-4067-B88A-DEBD4FCDED77@palmerdabbelt-mac>
Date: Fri, 13 Jun 2025 02:08:14 +0100
Cc: Alexandre Ghiti <alex@ghiti.fr>,
 thomas.weissschuh@linutronix.de,
 Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu,
 nathan@kernel.org,
 nick.desaulniers+lkml@gmail.com,
 morbo@google.com,
 justinstitt@google.com,
 luto@kernel.org,
 tglx@linutronix.de,
 vincenzo.frascino@arm.com,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <20ED8855-2A51-4821-9675-EF45041BCD31@jrtc27.com>
References: <mhng-4BA05CCD-6D5A-4067-B88A-DEBD4FCDED77@palmerdabbelt-mac>
To: Palmer Dabbelt <palmer@dabbelt.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)

On 12 Jun 2025, at 21:05, Palmer Dabbelt <palmer@dabbelt.com> wrote:
>=20
> On Thu, 12 Jun 2025 01:31:20 PDT (-0700), Alexandre Ghiti wrote:
>> Hi Thomas,
>>=20
>> On 6/11/25 11:22, Thomas Wei=C3=9Fschuh wrote:
>>> All vDSO code needs to be completely position independent.
>>> Symbol references are marked as hidden so the compiler emits
>>> PC-relative relocations. However there are cases where the compiler =
may
>>> still emit absolute relocations, as they are valid in regular PIC =
DSO code.
>>> These would be resolved by the linker and will break at runtime.
>>> This has been observed on arm64 under some circumstances, see
>>> commit 0c314cda9325 ("arm64: vdso: Work around invalid absolute =
relocations from GCC")
>>>=20
>>> Introduce a build-time check for absolute relocations.
>>> The check is done on the object files as the relocations will not =
exist
>>> anymore in the final DSO. As there is no extension point for the
>>> compilation of each object file, perform the validation in =
vdso_check.
>>>=20
>>> Debug information can contain legal absolute relocations and readelf =
can
>>> not print relocations from the .text section only. Make use of the =
fact
>>> that all global vDSO symbols follow the naming pattern "vdso_u_".
>>>=20
>>> Link: https://lore.kernel.org/lkml/aApGPAoctq_eoE2g@t14ultra/
>>> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D120002
>>> Signed-off-by: Thomas Wei=C3=9Fschuh =
<thomas.weissschuh@linutronix.de>
>>> ---
>>>  lib/vdso/Makefile.include | 6 ++++++
>>>  1 file changed, 6 insertions(+)
>>>=20
>>> diff --git a/lib/vdso/Makefile.include b/lib/vdso/Makefile.include
>>> index =
cedbf15f80874d4bb27c097244bc5b11272f261c..04257d0f28c0ed324e31adbb68497181=
085752f8 100644
>>> --- a/lib/vdso/Makefile.include
>>> +++ b/lib/vdso/Makefile.include
>>> @@ -12,7 +12,13 @@ c-getrandom-$(CONFIG_VDSO_GETRANDOM) :=3D =
$(addprefix $(GENERIC_VDSO_DIR), getrand
>>>  #
>>>  # As a workaround for some GNU ld ports which produce unneeded =
R_*_NONE
>>>  # dynamic relocations, ignore R_*_NONE.
>>> +#
>>> +# Also validate that no absolute relocations against global symbols =
are present
>>> +# in the object files.
>>>  quiet_cmd_vdso_check =3D VDSOCHK $@
>>>        cmd_vdso_check =3D if $(READELF) -rW $@ | grep -v _NONE | =
grep -q " R_\w*_"; \
>>>          then (echo >&2 "$@: dynamic relocations are not supported"; =
\
>>> +      rm -f $@; /bin/false); fi && \
>>> +        if $(READELF) -rW $(filter %.o, $(real-prereqs)) | grep -q =
" R_\w*_ABS.*vdso_u_"; \
>>=20
>>=20
>> This only works for arm64 relocations right? I can't find any *ABS*
>> relocations in riscv elf abi
>> =
(https://github.com/riscv-non-isa/riscv-elf-psabi-doc/releases/tag/v1.0).
>=20
> That's because the psABI people do not believe in absolute symbols.

I don=E2=80=99t know what you=E2=80=99re referring to here. Absolute =
symbols (SHN_ABS
rather than a real section index) are different to absolute
relocations. The code here is checking for *relocations*, not symbols.
RISC-V has absolute relocations, they=E2=80=99re R_RISCV_32/64. Putting =
ABS in
the relocation name is an Arm-ism that other architectures don=E2=80=99t =
do.
Absolute addressing exists, as the medlow and large code models (with
-fno-pic/PIC/pie/PIE). So I=E2=80=99m really not sure what you=E2=80=99re =
saying the
current psABI doesn=E2=80=99t do that it should, nor what discussions =
you=E2=80=99re
even suggesting have happened and been dismissed?

Perhaps you=E2=80=99re referring to the difficulty of using PC-relative
accesses against absolute symbols, as you=E2=80=99ll get in medany and =
PIE
code? But that=E2=80=99s something that affects many architectures; you =
can
have issues on amd64 and aarch64, not just riscv64.

Jessica

> They exist in the actual toolchains, though, as they are part of the =
generic ELF ABI. In theory they'd work fine in the VDSO as long as we're =
using absolute addressing instructions for them, which is possible to do =
(and I think should happen for some global symbols).
>=20
> That said, it doesn't really seem worth the effort to get the checking =
more fine-grained here.  I don't see any reason we'd need an absolute =
symbol in the VDSO, so unil someone has one we might as well just forbid =
them entirely.
>=20
> Some old toolchains had an absolute "__gloabl_pointer$" floating =
around some of the CRT files, so we might trip over bugs here.  I think =
we're safe as those shouldn't show up in the VDSO, but not 100% sure.  =
Probably best to get this on next to bake for a bit, just to make sure =
we're not trippig anyone up.
>=20
>> Thanks,
>>=20
>> Alex
>>=20
>>=20
>>> +        then (echo >&2 "$@: absolute relocations are not =
supported"; \
>>>        rm -f $@; /bin/false); fi
>>>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


