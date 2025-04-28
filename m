Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990B538F9C
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 10:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745837985; cv=none; b=br1EAsAxvCV+bPIP0SMtXymUaNaPmYXikGQjxPXVIlOTXAr26cRP9cWD9iM30bLRFYqPBPS5muAr76J39dFFR1fGlmIVL3pIXIEgvV52TD4Ro+y7WgKvIrCE9hM1yL20cjpY73ZUXo/xhnF8oy0ew0irxhj/lx+ku52zY03Mwp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745837985; c=relaxed/simple;
	bh=qcq79qRePDaFRa38AzdyI92iXEXV7YAprKycHB4l2IQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IOnAkgaOqwE1xYDXPLABegARfKpquLv5qb619kQU35mcEPnnO4Vt6cjEuak7HAF8GCtNYIAAm7eL9mPJS6PeA/M7qh0NDL0+ruPYDbpRcoJxEDfTmkELI1GnvyUeGQxe4aOMD5qALSkDOz/zdKjTH0voSE3+6Fp9sG/H5VYptsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cwbR9m2L; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cwbR9m2L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745837982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z1S1GQtMqLXYO4RQQUYg3g09QNCmMVEz/isjWKDgecM=;
	b=cwbR9m2Lu8Bg/38NlWOh7Wu7OiGORJdyBS5MC3BtyQEPaOsoeWS34obmNZNlhXoobqwGhg
	DQQ8px+UYZAQht7efuKV0vQkw2m0qZSQluEBCEPDra5r6TL5l4lUye2XuvVowGy1tgV47e
	FrrFanEUba7RK2yB8wBTImtTnEH1kVU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-94-Gw9Lm1mjNVmbzangeGyHbQ-1; Mon, 28 Apr 2025 06:59:41 -0400
X-MC-Unique: Gw9Lm1mjNVmbzangeGyHbQ-1
X-Mimecast-MFC-AGG-ID: Gw9Lm1mjNVmbzangeGyHbQ_1745837980
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43efa869b19so27292285e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 03:59:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745837980; x=1746442780;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z1S1GQtMqLXYO4RQQUYg3g09QNCmMVEz/isjWKDgecM=;
        b=a1e8ZyDnUkT9NxWlX9+QN379lhtx35zR976jQMmcdmA7XUoofm2nlyZP+c+CHMGUsJ
         YziqTaGZ9MzCGgIeWiEZcZgO6CY90C0SFoxWgZ0cZgujg/IJvl9FHhcNklY1Usk+pRou
         U+wd7+aAYRUu/Zyz4hgxvOwO6Z0Mg7M0f8tYSyLP0Iejo+6fpJ8PkzAy09uV356GXymo
         GS6kNRwYmrrAyy91xTZfF6TEyiZ4yPbc5CDPM42YIK8/UDWVxYTRGAQagS3LaBESZQzN
         6tyVZLmmKKkTydSkgWRjwB5DZuv+tYENXHtdaAn9oEg5ttzY3N4Kgwf1ZvQT3kNGcoyW
         8EyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSCrSGfifEASiZwix0KIXq03K4MAOJAX7hyXBaaKPQw1tBJVgcgeYD17qe+n7afRyI+fZ9UOI33WaD0Cg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzljPx3sTbPSbnTRJNEeSluqq5AMYDd2C3bExZNpI58XE0GToec
	gDPKpUePsPPbwn1HshrKkbUSogphOOXWHiadGcIGZbsc0Tbbh32moz0K44kow8dOS27tUbxhCw9
	SNd3s7D6f9NiCgFG6APfq8L7B5P+taWgV1kztWRfuFmXhsNe1EmlcsEfztYlkcgLhMNFGN8xwh4
	cYwH8LKRpmXoBxRjsMDh0fxz43Slr0+gPC0xpLiAHwLPobqQ==
X-Gm-Gg: ASbGncszXAtahVpLd5WKu7e6irG4Bz7/KMJ6tRlPMm8I8YSfseAUIgPS9tiVLtlgRw1
	UuQ6RD0mp323XKTWgAyjqmk31gIWbuGM0rqtyBjDl97ShiMfUEItkfwjCdqS3zJjm1vK7G17Sl/
	V3a068gyomo+WyZdMZohsswfnJ/MCbHLG6/c0zfvWUQiRJ6xLFAm0vHTLcpmB2dv4dfVnQYRYWm
	kTWPU0H101DMsOA5Vad24bu/3i3MyvkgaQUkuXq0P+I2jNa8WZzJw8NCvr3udsHPgl1tPAPdJWv
	fkJqmt4=
X-Received: by 2002:a05:600c:138c:b0:43d:23fe:e8a6 with SMTP id 5b1f17b1804b1-440ab76a962mr68871675e9.5.1745837979632;
        Mon, 28 Apr 2025 03:59:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3yhCzFV9b07iIXPnMiZwoDz9SPGqteJaLn0qdABKCE9uf+MOeasr/lE8Q+wKF9OZr7Up4LQ==
X-Received: by 2002:a05:600c:138c:b0:43d:23fe:e8a6 with SMTP id 5b1f17b1804b1-440ab76a962mr68871015e9.5.1745837978978;
        Mon, 28 Apr 2025 03:59:38 -0700 (PDT)
Received: from fedora (g3.ign.cz. [91.219.240.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4408c8b0ea0sm102888495e9.2.2025.04.28.03.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 03:59:38 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: x86@kernel.org, linux-efi@vger.kernel.org, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Peter
 Jones <pjones@redhat.com>, Daniel Berrange <berrange@redhat.com>, Emanuele
 Giuseppe Esposito <eesposit@redhat.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Greg KH <gregkh@linuxfoundation.org>, Luca Boccassi
 <bluca@debian.org>, Peter Zijlstra <peterz@infradead.org>, Matthew Garrett
 <mjg59@srcf.ucam.org>, James Bottomley
 <James.Bottomley@hansenpartnership.com>, Eric Snowberg
 <eric.snowberg@oracle.com>, Paolo Bonzini <pbonzini@redhat.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] x86/efi: Implement support for embedding SBAT data
 for x86
In-Reply-To: <CAMj1kXFMmhROmaDZ0gsw+ozG5iSkMvSXb15qexToUSAFyBn5hQ@mail.gmail.com>
References: <20250424080950.289864-1-vkuznets@redhat.com>
 <20250424080950.289864-3-vkuznets@redhat.com>
 <CAMj1kXFMmhROmaDZ0gsw+ozG5iSkMvSXb15qexToUSAFyBn5hQ@mail.gmail.com>
Date: Mon, 28 Apr 2025 12:59:37 +0200
Message-ID: <87ldrka6w6.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Ard Biesheuvel <ardb@kernel.org> writes:

> On Thu, 24 Apr 2025 at 10:10, Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
>>
>> Similar to zboot architectures, implement support for embedding SBAT data
>> for x86. Put '.sbat' section to the very end of the binary.
>>
>> Note, the obsolete CRC-32 checksum (see commit 9c54baab4401 ("x86/boot:
>> Drop CRC-32 checksum and the build tool that generates it")) is gone and
>> while it would've been possible to reserve the last 4 bytes in '.sbat'
>> section too (like it's done today in '.data'), it seems to be a pointless
>> exercise: SBAT makes zero sense without a signature on the EFI binary so
>> '.sbat' won't be at the very end of the file anyway. Any tool which uses
>> the last 4 bytes of the file as a checksum is broken with signed EFI
>> binaries already.
>>
>> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
>> ---
>>  arch/x86/boot/Makefile                 |  2 +-
>>  arch/x86/boot/compressed/Makefile      |  2 ++
>>  arch/x86/boot/compressed/vmlinux.lds.S | 13 +++++++++++++
>>  arch/x86/boot/header.S                 | 13 +++++++++++++
>>  drivers/firmware/efi/Kconfig           |  2 +-
>>  5 files changed, 30 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/x86/boot/Makefile b/arch/x86/boot/Makefile
>> index 81f55da81967..5f7b52f0e7f5 100644
>> --- a/arch/x86/boot/Makefile
>> +++ b/arch/x86/boot/Makefile
>> @@ -71,7 +71,7 @@ $(obj)/vmlinux.bin: $(obj)/compressed/vmlinux FORCE
>>
>>  SETUP_OBJS = $(addprefix $(obj)/,$(setup-y))
>>
>> -sed-zoffset := -e 's/^\([0-9a-fA-F]*\) [a-zA-Z] \(startup_32\|efi.._stub_entry\|efi\(32\)\?_pe_entry\|input_data\|kernel_info\|_end\|_ehead\|_text\|_e\?data\|z_.*\)$$/\#define ZO_\2 0x\1/p'
>> +sed-zoffset := -e 's/^\([0-9a-fA-F]*\) [a-zA-Z] \(startup_32\|efi.._stub_entry\|efi\(32\)\?_pe_entry\|input_data\|kernel_info\|_end\|_ehead\|_text\|_e\?data\|_e\?sbat\|z_.*\)$$/\#define ZO_\2 0x\1/p'
>>
>>  quiet_cmd_zoffset = ZOFFSET $@
>>        cmd_zoffset = $(NM) $< | sed -n $(sed-zoffset) > $@
>> diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
>> index fdbce022db55..b9b80eccdc02 100644
>> --- a/arch/x86/boot/compressed/Makefile
>> +++ b/arch/x86/boot/compressed/Makefile
>> @@ -107,6 +107,8 @@ vmlinux-objs-$(CONFIG_UNACCEPTED_MEMORY) += $(obj)/mem.o
>>  vmlinux-objs-$(CONFIG_EFI) += $(obj)/efi.o
>>  vmlinux-libs-$(CONFIG_EFI_STUB) += $(objtree)/drivers/firmware/efi/libstub/lib.a
>>
>> +vmlinux-objs-$(CONFIG_EFI_SBAT) += $(objtree)/drivers/firmware/efi/libstub/sbat.o
>> +
>
> Please drop this, and put the .incbin directly into header.S
>

Sure, but as I also commented on zboot patch, we need a logic to track
possible sbat data changes and rebuild when needed. 'sbat.o' was
convenient because we can have this tracking logic in one place (zboot)
and make will do the rest. If we are to drop 'sbat.o', we will need the
tracking logic both in zboot and x86.

>>  $(obj)/vmlinux: $(vmlinux-objs-y) $(vmlinux-libs-y) FORCE
>>         $(call if_changed,ld)
>>
>> diff --git a/arch/x86/boot/compressed/vmlinux.lds.S b/arch/x86/boot/compressed/vmlinux.lds.S
>> index 3b2bc61c9408..d0a27905de90 100644
>> --- a/arch/x86/boot/compressed/vmlinux.lds.S
>> +++ b/arch/x86/boot/compressed/vmlinux.lds.S
>> @@ -49,9 +49,22 @@ SECTIONS
>>                 *(.data.*)
>>
>>                 /* Add 4 bytes of extra space for the obsolete CRC-32 checksum */
>> +#ifndef CONFIG_EFI_SBAT
>>                 . = ALIGN(. + 4, 0x200);
>> +#else
>> +               /* Avoid gap between '.data' and '.sbat' */
>> +               . = ALIGN(. + 4, 0x1000);
>> +#endif
>>                 _edata = . ;
>>         }
>> +#ifdef CONFIG_EFI_SBAT
>> +       .sbat : ALIGN(0x1000) {
>> +               _sbat = . ;
>> +               *(.sbat)
>> +               _esbat = ALIGN(0x200);
>> +               . = _esbat;
>> +       }
>> +#endif
>>         . = ALIGN(L1_CACHE_BYTES);
>>         .bss : {
>>                 _bss = . ;
>
> This looks a bit odd - see below
>
>> diff --git a/arch/x86/boot/header.S b/arch/x86/boot/header.S
>> index b5c79f43359b..ab851490ef74 100644
>> --- a/arch/x86/boot/header.S
>> +++ b/arch/x86/boot/header.S
>> @@ -207,6 +207,19 @@ pecompat_fstart:
>>                 IMAGE_SCN_MEM_READ              | \
>>                 IMAGE_SCN_MEM_WRITE             # Characteristics
>>
>> +#ifdef CONFIG_EFI_SBAT
>> +       .ascii ".sbat\0\0\0"
>> +       .long   ZO__esbat - ZO__sbat            # VirtualSize
>> +       .long   setup_size + ZO__sbat           # VirtualAddress
>> +       .long   ZO__esbat - ZO__sbat            # SizeOfRawData
>> +       .long   setup_size + ZO__sbat           # PointerToRawData
>> +
>> +       .long   0, 0, 0
>> +       .long   IMAGE_SCN_CNT_INITIALIZED_DATA  | \
>> +               IMAGE_SCN_MEM_READ              | \
>> +               IMAGE_SCN_MEM_DISCARDABLE       # Characteristics
>> +#endif
>> +
>
> This puts the .sbat section at the very end of the file. However, the
> virtual size of .data is 'ZO__end - ZO__data' not 'ZO__edata -
> ZO__data', and so the .sbat section will overlap with .bss in the
> memory view of the image.

Missed that, will fix, thanks! A stupid question though: does this
matter in practice for SBAT? I don't think anyone needs SBAT data after
kernel starts booting so we can consider it 'discarded'. BSS data can
then do whatever it wants.

>
>
>>         .set    section_count, (. - section_table) / 40
>>  #endif /* CONFIG_EFI_STUB */
>>
>> diff --git a/drivers/firmware/efi/Kconfig b/drivers/firmware/efi/Kconfig
>> index 2edb0167ba49..5022a378fec1 100644
>> --- a/drivers/firmware/efi/Kconfig
>> +++ b/drivers/firmware/efi/Kconfig
>> @@ -283,7 +283,7 @@ config EFI_EMBEDDED_FIRMWARE
>>
>>  config EFI_SBAT
>>         bool "Embed SBAT section in the kernel"
>> -       depends on EFI_ZBOOT
>> +       depends on EFI_ZBOOT || (EFI_STUB && X86)
>>         help
>>           SBAT section provides a way to improve SecureBoot revocations of UEFI
>>           binaries by introducing a generation-based mechanism. With SBAT, older
>> --
>> 2.49.0
>>
>>
>

-- 
Vitaly

