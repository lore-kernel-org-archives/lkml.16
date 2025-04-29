Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F15B2746A
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 15:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745939850; cv=none; b=GyexlyEaepCZj9x94ryYYabW79DqEjtv9giGy86MALbjXn5hW/7dC4WjngUUp7Q/BIVfwIYgZMAEMpEmj+ivTLMbOfKF5o2WP2fByqV7mcAiiqCFTESeHcB9CmYZxfbdyem3VE/jWbcaipdNHY3m/fFPN2sDTIywsk+KRtJe2gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745939850; c=relaxed/simple;
	bh=OhVVsGNY5JLFXW9IpfdJ6o0+og+mor4PeAuIx0MaBqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OLzOrw8QPnwvgiwpvD9MLpZ3JHUfcMZ2lK2eqLH25ND0Di8kKrLMba5x2OLfgZvK785m1aBdK3pGti2jAsi51xznfmwHlPOQ5LYpzq2ZGRRy54frh9OUygMCOA6uyqLJ4XrfKqWmL/T/Vz0ac2GaZctWZHumrz/B6IXJjU4LB7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gM781wI+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gM781wI+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745939847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+DNabiqJSEcQkh9nBnZEWj0zKXe55hJFmj4xlJbnTaw=;
	b=gM781wI+JM54uEXssS6ln2c/PhlULzCpv7M6ge/Ne+y63QUp24nezrMV/iLZfIo9nBU/xV
	2BSxlePK5tBtzFB4rtDrzLd61cSn0QYehU+pn2o6tu61E0WvNWopJBBaymhvRo9lJ0pFZb
	+iLkXn50EeYV5VYu6LPKnQza2oBTEKM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-YbeuxHAeMwGK8FJGSgVhyg-1; Tue, 29 Apr 2025 11:17:24 -0400
X-MC-Unique: YbeuxHAeMwGK8FJGSgVhyg-1
X-Mimecast-MFC-AGG-ID: YbeuxHAeMwGK8FJGSgVhyg_1745939843
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3913aea90b4so1770765f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 08:17:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745939843; x=1746544643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+DNabiqJSEcQkh9nBnZEWj0zKXe55hJFmj4xlJbnTaw=;
        b=rOCpFcN4TMNATT9EgOgoCrQJ7FalrfUvWe8kdxjEV0jsgPAi1cXyDQ+tmofMFlANYE
         PT806Vx2DC1gMmTzuf19QuYGwc/ANwdEuLmV+ZE75xZox3b1E2TgweuwbCv1KNbBTgd3
         Z1f7nUXwf/8x0pxQQzd4ryTyFQyUvaZ2lBNYEm5ULaUomQZp4Hao6WRbYnz5xuBakU9B
         66LYfxRq8gnt7EVMjQq7hu9Hpopt68xFmfH3/rQzsB0WlCw9fphhRVlIOPcdad4I1acw
         HsOAD/2t7zakblqEILiUqcupTppHp5uhGuJwjMaJqmQ33VKkPrXCXc3+YrqIVI6AkmeW
         HpOw==
X-Forwarded-Encrypted: i=1; AJvYcCWUd/gX9veJrGU5e6Z1GdLmpqvHHo0g4FCgdD8wl//iohHleth5N32KggNGrmozAWldUBL2xEtMnWkWU6s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp0TrvERKRIHATb2rvNiWjYwPankHO8J/73xpHLJiZX/isgc8s
	GOs21g2CgbQNnu3kkSUgp7HsF6ckwoJ1gY+/DDEJ76TLRQrnMU2Q1SDRXqYbmtK96GMh/8JmocM
	bTEhYN5x4LRwUUK1nx0QDErHLCIUAP1blufp6sF6d6rPixfjMh2HU+WJpisoRusfevoEi2iaSvl
	2ejT0wyrT943tzLFO/3WPDunlu9DoSywBp8Trt
X-Gm-Gg: ASbGncvbZu0JOfFVv2Z0J6rVnJI9fmoGTVa48THRpZzYGuzOTeiTozZI6xLJI+f5wZE
	3C0pi/hObZyY4silfMWbkYKd/xjQTcuuENz46+4+Zfz50xJqhd4F+fPVvbIQ0XwzBhPU=
X-Received: by 2002:a5d:5f82:0:b0:39e:f9d8:e016 with SMTP id ffacd0b85a97d-3a08ad775e6mr2599196f8f.44.1745939843437;
        Tue, 29 Apr 2025 08:17:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVx/tpgOJ/jJ7aMny2+Jz5FC/6rqMEhTN31tII+xhKzH6NF09234DlTjodrjGY6d6Z3aQUBGd+/q980+qErAE=
X-Received: by 2002:a5d:5f82:0:b0:39e:f9d8:e016 with SMTP id
 ffacd0b85a97d-3a08ad775e6mr2599166f8f.44.1745939843017; Tue, 29 Apr 2025
 08:17:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-vdso-absolute-reloc-v1-0-987a0afd10b5@linutronix.de> <20250429-vdso-absolute-reloc-v1-2-987a0afd10b5@linutronix.de>
In-Reply-To: <20250429-vdso-absolute-reloc-v1-2-987a0afd10b5@linutronix.de>
From: Jan Stancek <jstancek@redhat.com>
Date: Tue, 29 Apr 2025 17:17:06 +0200
X-Gm-Features: ATxdqUEmCiOac4IJ7RKz2Dhq5OnDaOX2ymoBqKbKJma3cfUvvvKhrZqkCZgsg84
Message-ID: <CAASaF6yGT0pDythQ9nTcn5=MHmLYD=gCNVc6dFXhWUO_iXJXqA@mail.gmail.com>
Subject: Re: [PATCH 2/2] vdso: Reject absolute relocations during build
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Nam Cao <namcao@linutronix.de>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Andy Lutomirski <luto@kernel.org>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 2:56=E2=80=AFPM Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> All vDSO code needs to be completely position independent.
> Symbol references are marked as hidden so the compiler is forced to emit
> PC-relative relocations.
> If the compiler does however emit an absolute relocation this will be
> resolved by the linker and break at runtime.
>
> Introduce a build-time check for absolute relocations.
> The check is done on the object files as the relocations will not exist
> anymore in the final DSO. As there is no extension point for the
> compilation of each object file perform the validation in vdso_check.
>
> Link: https://lore.kernel.org/lkml/aApGPAoctq_eoE2g@t14ultra/
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
> ---
>  lib/vdso/Makefile.include | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/lib/vdso/Makefile.include b/lib/vdso/Makefile.include
> index cedbf15f80874d4bb27c097244bc5b11272f261c..18fcc94e4d6bf7abf374c7a95=
3349e7ad75f8a18 100644
> --- a/lib/vdso/Makefile.include
> +++ b/lib/vdso/Makefile.include
> @@ -12,7 +12,12 @@ c-getrandom-$(CONFIG_VDSO_GETRANDOM) :=3D $(addprefix =
$(GENERIC_VDSO_DIR), getrand
>  #
>  # As a workaround for some GNU ld ports which produce unneeded R_*_NONE
>  # dynamic relocations, ignore R_*_NONE.
> +#
> +# Also validate that no absolute relocations are present in the object f=
iles themselves.
>  quiet_cmd_vdso_check =3D VDSOCHK $@
>        cmd_vdso_check =3D if $(READELF) -rW $@ | grep -v _NONE | grep -q =
" R_\w*_"; \
>                        then (echo >&2 "$@: dynamic relocations are not su=
pported"; \
> +                            rm -f $@; /bin/false); fi && \
> +                      if $(READELF) -rW $(filter %.o, $(real-prereqs)) |=
 grep -q " R_\w*_ABS"; \
> +                      then (echo >&2 "$@: absolute relocations are not s=
upported"; \
>                              rm -f $@; /bin/false); fi

Should this check only some sections? I'm getting lot of matches on
debuginfo related sections:

# readelf -rW arch/arm64/kernel/vdso/vgettimeofday.o | awk
'/section.*debug/ {count=3D10} count {print; count--}'
Relocation section '.rela.debug_info' at offset 0x4fc8 contains 524 entries=
:
    Offset             Info             Type               Symbol's
Value  Symbol's Name + Addend
0000000000000008  0000000a00000102 R_AARCH64_ABS32
0000000000000000 .debug_abbrev + 0
000000000000000d  0000000f00000102 R_AARCH64_ABS32
0000000000000000 .debug_str + 3b3
0000000000000012  0000001000000102 R_AARCH64_ABS32
0000000000000000 .debug_line_str + 0
0000000000000016  0000001000000102 R_AARCH64_ABS32
0000000000000000 .debug_line_str + 27
000000000000001a  0000000200000101 R_AARCH64_ABS64
0000000000000000 .text + 0
000000000000002a  0000000e00000102 R_AARCH64_ABS32
0000000000000000 .debug_line + 0
0000000000000031  0000000f00000102 R_AARCH64_ABS32
0000000000000000 .debug_str + 2d5
0000000000000038  0000000f00000102 R_AARCH64_ABS32
0000000000000000 .debug_str + 7f0
Relocation section '.rela.debug_loclists' at offset 0x80e8 contains 3 entri=
es:
    Offset             Info             Type               Symbol's
Value  Symbol's Name + Addend
0000000000000504  0000000900000102 R_AARCH64_ABS32
0000000000000000 .debug_info + ab8
0000000000000b3a  0000000900000102 R_AARCH64_ABS32
0000000000000000 .debug_info + 1111
0000000000000bc5  0000000900000102 R_AARCH64_ABS32
0000000000000000 .debug_info + 143e

Relocation section '.rela.debug_aranges' at offset 0x8130 contains 2 entrie=
s:
    Offset             Info             Type               Symbol's
Value  Symbol's Name + Addend
0000000000000006  0000000900000102 R_AARCH64_ABS32
0000000000000000 .debug_info + 0
0000000000000010  0000000200000101 R_AARCH64_ABS64
0000000000000000 .text + 0

Relocation section '.rela.debug_line' at offset 0x8160 contains 27 entries:
    Offset             Info             Type               Symbol's
Value  Symbol's Name + Addend
0000000000000022  0000001000000102 R_AARCH64_ABS32
0000000000000000 .debug_line_str + 38
0000000000000026  0000001000000102 R_AARCH64_ABS32
0000000000000000 .debug_line_str + 49
000000000000002a  0000001000000102 R_AARCH64_ABS32
0000000000000000 .debug_line_str + 60
000000000000002e  0000001000000102 R_AARCH64_ABS32
0000000000000000 .debug_line_str + 7a
0000000000000032  0000001000000102 R_AARCH64_ABS32
0000000000000000 .debug_line_str + 98
0000000000000036  0000001000000102 R_AARCH64_ABS32
0000000000000000 .debug_line_str + a7
000000000000003a  0000001000000102 R_AARCH64_ABS32
0000000000000000 .debug_line_str + c2
000000000000003e  0000001000000102 R_AARCH64_ABS32
0000000000000000 .debug_line_str + d8

Regards,
Jan

