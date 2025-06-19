Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F051213B58B
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 15:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750346148; cv=none; b=oTvwB5piL7nqikIpUJEgsm30Vgh/dsNnfpm1Pz6ue7IEfS/PlfQyCf72IpMM/mVhtdw0k7aUEA+EAPkngwoaawL2EmElWRZtWpExkWS/9X9g0xhR0nTxBX95aksRUPSMSt6+Th5Ho+KotyJKfGpjEeFchs+lzkYREMgKrkbEHho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750346148; c=relaxed/simple;
	bh=j36Lv0XwSdPSrL89TG1Za9YH/KmyQpaNDxFLdLJkcmY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rMt1cbsXKqLuqh4KUvm3lZQmjHi4nVqaWipnjgkQg1Cu/TGyjrEVbTzmgsUFlVcIsasAwFdEzRunz0/vzIh6co1ZhZx9+0Qcs/+hHncb28a/dR80X2XnJL+fGW7Ikg3qalv1ePdgHPDyDwsDgu0rc9kk/qaVGugKdf3FD6P19As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NmDd9nam; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NmDd9nam"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750346145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nnmNnV7Z/TLBli2AzSqmjfw6jzjBv10gklg2gPq0gb0=;
	b=NmDd9namrk7hTc5t+NI/bgKBYQafNiwbSvDmOl8l5EdWfc9zOUxKN8zH4aKukF1r56zcWC
	eQxu77j1AO4fmegUbARr+mQtknG/xxPuG2NeVPkbbVjO/Sfy9ItMou87Ief+Njxij5wFy4
	sBu6d6987lJjGjBjgohw+b9BsIm51XQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-292-g117B1HYOsyRTIz26AKkPg-1; Thu, 19 Jun 2025 11:15:44 -0400
X-MC-Unique: g117B1HYOsyRTIz26AKkPg-1
X-Mimecast-MFC-AGG-ID: g117B1HYOsyRTIz26AKkPg_1750346143
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-451d3f03b74so4737195e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 08:15:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750346143; x=1750950943;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nnmNnV7Z/TLBli2AzSqmjfw6jzjBv10gklg2gPq0gb0=;
        b=Ad/jFFeCkspUhvj2ZOcWTY0pJ1M0pO2xKhf8rYB+doWSxHGtO06+8eVHX4607zO8r7
         A72adE7ckoUvv/oTRAebgdTDOYLkIR4U3A0HKDhJBZLzvacS25+FEiQT8oytWqNzqMg+
         LJOR447MEOMRYw3P7GUUr+ZSzgD82Rh6ZfZU2kVK52+hd1ZyqvUUj7whiyuFjiMWKL6s
         89lUcZ9BhbIQBDzTn+7jz7Z5+hVIAuJ17U4f6bkGyPQtDrJ3JXhn9Yb/XYY707KrACH9
         o+BDKZtHCdUpjcOyCgQzAqyfAK9tI2pgFtvSSWOGAk6twmVfAIJaF3fVIJs8Fg3MfcPb
         swIg==
X-Forwarded-Encrypted: i=1; AJvYcCUmYt78QB8mga0kvWKNqIA6Y/rbhQ3aacLEe9YB9bJO+5j63wSpHqMHJgtzW3YxGJ5tn2rwY2SCaph7phI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwspNcfUQZRelYTmUZCGMHELZgzqXw6SFhj4SxO0iuqWadG0uRL
	ieGlBHe+rdDVQrCFGkkeOokRKlFGkQoqUzeu6R07TiErkFe9xjyYfyjqHRexxxoyCLtbyJfAktt
	5VWfNOv4Wj6Iq5yefZcSy0FmUTea+/xi3CI6MiYsS6dzEOoXhonO8bGG+lRltgZnG5Jlyg5s+n9
	dA4+ZjhoRJJDUM/cDqu8WbHuhw5UeDFkFF5rh7q4aDh8Ozvpjd5g==
X-Gm-Gg: ASbGnctzQZeaQpt0v7CcIi5Dv7u6pPzUPwRfBjlgQQyeKIzTsD32dZRPpcPnxa/Bmhn
	W3PV3SGyhOzaQXnKFouelXHfOyvax3ABS09yJufcsP0Q9zgZedtNr8OWNHRk2rZ5bLXwWBEQab0
	8yEpdkJEeQ+pfNwZB+ahIdm8+JX3NmLizcb7KRgBbW2AAdId5acSuunCx8eXe5zi2AVac8qx8ol
	5sP4QMMTch0S0uqCNV2pTbxPUTji9u/m0RJChvcNdh0uAwuSLMk1/A3tit0/lE2+7alkGl6VSZF
	kWrF0Q++Ezo2YlDarg==
X-Received: by 2002:a05:6000:144e:b0:3a5:3b14:1ba3 with SMTP id ffacd0b85a97d-3a572e58cc9mr17568959f8f.49.1750346143196;
        Thu, 19 Jun 2025 08:15:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2K4PWQRzuCGry5KAaSLw6cXzGCxwA9qri8LLp3blZHp1BJwjQA2vM0xwmkkHJC9VIuXCw6A==
X-Received: by 2002:a05:6000:144e:b0:3a5:3b14:1ba3 with SMTP id ffacd0b85a97d-3a572e58cc9mr17568863f8f.49.1750346142292;
        Thu, 19 Jun 2025 08:15:42 -0700 (PDT)
Received: from fedora (g3.ign.cz. [91.219.240.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a633ddsm19617640f8f.26.2025.06.19.08.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 08:15:41 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>
Cc: linux-efi@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, "H.
 Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>, Peter Jones
 <pjones@redhat.com>, Daniel Berrange <berrange@redhat.com>, Emanuele
 Giuseppe Esposito <eesposit@redhat.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Greg KH <gregkh@linuxfoundation.org>, Luca Boccassi
 <bluca@debian.org>, Peter Zijlstra <peterz@infradead.org>, Matthew Garrett
 <mjg59@srcf.ucam.org>, James Bottomley
 <James.Bottomley@hansenpartnership.com>, Eric Snowberg
 <eric.snowberg@oracle.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v3] x86/efi: Implement support for embedding SBAT
 data for x86
In-Reply-To: <20250603091951.57775-1-vkuznets@redhat.com>
References: <20250603091951.57775-1-vkuznets@redhat.com>
Date: Thu, 19 Jun 2025 17:15:40 +0200
Message-ID: <877c17pxsz.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Vitaly Kuznetsov <vkuznets@redhat.com> writes:

> Similar to zboot architectures, implement support for embedding SBAT data
> for x86. Put '.sbat' section in between '.data' and '.text' as the former
> also covers '.bss' and '.pgtable' and thus must be the last one in the
> file.
>
> Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> ---
> The patch was previously sent as part of "[PATCH v3 0/2] efi: Add a
>  mechanism for embedding SBAT section" series. The main patch has
> already made it upstream through Ard's 'efi' tree (see commit 0f9a1739dd0e
> "efi: zboot specific mechanism for embedding SBAT section") but x86 part
> is still pending. Resending so it doesn't get lost.
>

I was going to ping again but while working on a (mostly unrelated)
zboot issue:
https://lore.kernel.org/linux-efi/20250618122008.264294-1-vkuznets@redhat.com/T/#u

I noticed that in x86 SBAT patch I neglected to update optional PE
header and '.sbat' section is accounted as part of 'SizeOfCode' instead
of 'SizeOfInitializedData'. OVMF doesn't seem to care about the optional
header and I don't really know who does but as the patch is not merged
yet, I think it would be better to fix. The differential change is:

diff --git a/arch/x86/boot/header.S b/arch/x86/boot/header.S
index 9bea5a1e2c52..f57c45d8584a 100644
--- a/arch/x86/boot/header.S
+++ b/arch/x86/boot/header.S
@@ -78,9 +78,9 @@ optional_header:
        .byte   0x02                            # MajorLinkerVersion
        .byte   0x14                            # MinorLinkerVersion
 
-       .long   ZO__data                        # SizeOfCode
+       .long   textsize                        # SizeOfCode
 
-       .long   ZO__end - ZO__data              # SizeOfInitializedData
+       .long   ZO__end - textsize              # SizeOfInitializedData
        .long   0                               # SizeOfUninitializedData
 
        .long   setup_size + ZO_efi_pe_entry    # AddressOfEntryPoint

I'm going to send v4 with this change included.

>  arch/x86/boot/Makefile                 |  2 +-
>  arch/x86/boot/compressed/Makefile      |  5 +++++
>  arch/x86/boot/compressed/sbat.S        |  7 ++++++
>  arch/x86/boot/compressed/vmlinux.lds.S |  8 +++++++
>  arch/x86/boot/header.S                 | 31 ++++++++++++++++++--------
>  drivers/firmware/efi/Kconfig           |  2 +-
>  6 files changed, 44 insertions(+), 11 deletions(-)
>  create mode 100644 arch/x86/boot/compressed/sbat.S
>
> diff --git a/arch/x86/boot/Makefile b/arch/x86/boot/Makefile
> index 640fcac3af74..3f9fb3698d66 100644
> --- a/arch/x86/boot/Makefile
> +++ b/arch/x86/boot/Makefile
> @@ -71,7 +71,7 @@ $(obj)/vmlinux.bin: $(obj)/compressed/vmlinux FORCE
>  
>  SETUP_OBJS = $(addprefix $(obj)/,$(setup-y))
>  
> -sed-zoffset := -e 's/^\([0-9a-fA-F]*\) [a-zA-Z] \(startup_32\|efi.._stub_entry\|efi\(32\)\?_pe_entry\|input_data\|kernel_info\|_end\|_ehead\|_text\|_e\?data\|z_.*\)$$/\#define ZO_\2 0x\1/p'
> +sed-zoffset := -e 's/^\([0-9a-fA-F]*\) [a-zA-Z] \(startup_32\|efi.._stub_entry\|efi\(32\)\?_pe_entry\|input_data\|kernel_info\|_end\|_ehead\|_text\|_e\?data\|_e\?sbat\|z_.*\)$$/\#define ZO_\2 0x\1/p'
>  
>  quiet_cmd_zoffset = ZOFFSET $@
>        cmd_zoffset = $(NM) $< | sed -n $(sed-zoffset) > $@
> diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
> index f4f7b22d8113..3a38fdcdb9bd 100644
> --- a/arch/x86/boot/compressed/Makefile
> +++ b/arch/x86/boot/compressed/Makefile
> @@ -106,6 +106,11 @@ vmlinux-objs-$(CONFIG_UNACCEPTED_MEMORY) += $(obj)/mem.o
>  vmlinux-objs-$(CONFIG_EFI) += $(obj)/efi.o
>  vmlinux-libs-$(CONFIG_EFI_STUB) += $(objtree)/drivers/firmware/efi/libstub/lib.a
>  vmlinux-libs-$(CONFIG_X86_64)	+= $(objtree)/arch/x86/boot/startup/lib.a
> +vmlinux-objs-$(CONFIG_EFI_SBAT) += $(obj)/sbat.o
> +
> +ifdef CONFIG_EFI_SBAT
> +$(obj)/sbat.o: $(CONFIG_EFI_SBAT_FILE)
> +endif
>  
>  $(obj)/vmlinux: $(vmlinux-objs-y) $(vmlinux-libs-y) FORCE
>  	$(call if_changed,ld)
> diff --git a/arch/x86/boot/compressed/sbat.S b/arch/x86/boot/compressed/sbat.S
> new file mode 100644
> index 000000000000..838f70a997dd
> --- /dev/null
> +++ b/arch/x86/boot/compressed/sbat.S
> @@ -0,0 +1,7 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Embed SBAT data in the kernel.
> + */
> +	.pushsection ".sbat", "a", @progbits
> +	.incbin CONFIG_EFI_SBAT_FILE
> +	.popsection
> diff --git a/arch/x86/boot/compressed/vmlinux.lds.S b/arch/x86/boot/compressed/vmlinux.lds.S
> index 3b2bc61c9408..587ce3e7c504 100644
> --- a/arch/x86/boot/compressed/vmlinux.lds.S
> +++ b/arch/x86/boot/compressed/vmlinux.lds.S
> @@ -43,6 +43,14 @@ SECTIONS
>  		*(.rodata.*)
>  		_erodata = . ;
>  	}
> +#ifdef CONFIG_EFI_SBAT
> +	.sbat : ALIGN(0x1000) {
> +		_sbat = . ;
> +		*(.sbat)
> +		_esbat = ALIGN(0x1000);
> +		. = _esbat;
> +	}
> +#endif
>  	.data :	ALIGN(0x1000) {
>  		_data = . ;
>  		*(.data)
> diff --git a/arch/x86/boot/header.S b/arch/x86/boot/header.S
> index e1f4fd5bc8ee..9bea5a1e2c52 100644
> --- a/arch/x86/boot/header.S
> +++ b/arch/x86/boot/header.S
> @@ -179,15 +179,11 @@ pecompat_fstart:
>  #else
>  	.set	pecompat_fstart, setup_size
>  #endif
> -	.ascii	".text"
> -	.byte	0
> -	.byte	0
> -	.byte	0
> -	.long	ZO__data
> -	.long	setup_size
> -	.long	ZO__data			# Size of initialized data
> -						# on disk
> -	.long	setup_size
> +	.ascii	".text\0\0\0"
> +	.long	textsize            		# VirtualSize
> +	.long	setup_size			# VirtualAddress
> +	.long	textsize			# SizeOfRawData
> +	.long	setup_size			# PointerToRawData
>  	.long	0				# PointerToRelocations
>  	.long	0				# PointerToLineNumbers
>  	.word	0				# NumberOfRelocations
> @@ -196,6 +192,23 @@ pecompat_fstart:
>  		IMAGE_SCN_MEM_READ		| \
>  		IMAGE_SCN_MEM_EXECUTE		# Characteristics
>  
> +#ifdef CONFIG_EFI_SBAT
> +	.ascii	".sbat\0\0\0"
> +	.long	ZO__esbat - ZO__sbat            # VirtualSize
> +	.long	setup_size + ZO__sbat           # VirtualAddress
> +	.long	ZO__esbat - ZO__sbat            # SizeOfRawData
> +	.long	setup_size + ZO__sbat           # PointerToRawData
> +
> +	.long	0, 0, 0
> +	.long	IMAGE_SCN_CNT_INITIALIZED_DATA	| \
> +		IMAGE_SCN_MEM_READ		| \
> +		IMAGE_SCN_MEM_DISCARDABLE	# Characteristics
> +
> +	.set	textsize, ZO__sbat
> +#else
> +	.set	textsize, ZO__data
> +#endif
> +
>  	.ascii	".data\0\0\0"
>  	.long	ZO__end - ZO__data		# VirtualSize
>  	.long	setup_size + ZO__data		# VirtualAddress
> diff --git a/drivers/firmware/efi/Kconfig b/drivers/firmware/efi/Kconfig
> index db8c5c03d3a2..16baa038d412 100644
> --- a/drivers/firmware/efi/Kconfig
> +++ b/drivers/firmware/efi/Kconfig
> @@ -286,7 +286,7 @@ config EFI_SBAT
>  
>  config EFI_SBAT_FILE
>  	string "Embedded SBAT section file path"
> -	depends on EFI_ZBOOT
> +	depends on EFI_ZBOOT || (EFI_STUB && X86)
>  	help
>  	  SBAT section provides a way to improve SecureBoot revocations of UEFI
>  	  binaries by introducing a generation-based mechanism. With SBAT, older

-- 
Vitaly

