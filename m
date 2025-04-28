Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2EB19047F
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 10:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745837676; cv=none; b=Y7gfJWRW8/kW9Ja21XtgBXQqikW3YhmpfBG152kKiZLZ3gFMevhvY1Ah5tWOrTf7z9AFHK/xBxlYmezGoCr57C3l7q+2MLdXKx7dpgSwma8Ol95hDqDJcX/HqHYwBWuN42k3kwO98yYT+ufKIoqoV/27FMfJg5vEr9MQg0aLMgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745837676; c=relaxed/simple;
	bh=Ecq6K4BNTHLRWyjIObZfoy2w/9GkEyRpkKtINHJ2CFM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=arBVDpBCLpeM9LLs0i9JRcxCfnntrRfaQhc8YhAANEzarsANoAFST60uPZc+RQV/knugW9hY9Dm0o7uVPTUGkkRkRMQbOPlDwPGfqfX+hLKzBz7Zwf/i8aq6FljLvM/WjC9gaWN9ykV04yD+K4gi6qIFVuKldR91rZHfe02agdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TrT2KyjC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TrT2KyjC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745837673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7IEU2LSwAWutexi29Aw4e1+MJAP+WX/OVNnsZGRxNDw=;
	b=TrT2KyjCE5QnuMAJhiAKjkeYXFynUM9iMfdiqJQDiQ4FmT/3TCmkPmB3o4o+SOG55ea2y+
	PyHGbQkCk659YRxYLtRp1nCSIWFKFrDB2UoPTMTuQUKcKRvyz+1o4mJ0JLECysjGltsRYz
	LvDLSBxWxc/j2SqK0oLQKPMKiHD9ktE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-196-F1YWV5-dNp-Vl4wO3UgbCw-1; Mon, 28 Apr 2025 06:54:31 -0400
X-MC-Unique: F1YWV5-dNp-Vl4wO3UgbCw-1
X-Mimecast-MFC-AGG-ID: F1YWV5-dNp-Vl4wO3UgbCw_1745837671
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43cf172ffe1so23959185e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 03:54:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745837670; x=1746442470;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7IEU2LSwAWutexi29Aw4e1+MJAP+WX/OVNnsZGRxNDw=;
        b=YBpJpQ9NbYCblYY084QWYRmx7MRNq/2T7vXUvypehcHvhGoWqXKDFIJeNk3JYnKhu1
         wEsfwq6IwItxMfGQtT+JcGhwi5c0tZHU6kTKau3sFDzYkgkv4yeDzSMA22eRtGAcGqoj
         esa6tX+FjyWgfLafgEb05Ks9RhMgHA/03vVCq4doZJ2+/o9MxzcMgP7IW6uhINcOERkH
         L9Ec8KijBYFuDrKLmPL+xjn7LuHZGgI0GAlFjYSyuGNgbvEVtfbtilfrxb5OXi1b37uj
         ilkSzr0E7OxGKDAdt7gn/vxNWi0zxIZ6/RwRPw9sh0QUg/FyGEQhMtXQhI1eOeA00kGb
         qzjg==
X-Forwarded-Encrypted: i=1; AJvYcCUyfcaHPED+lKPmziD/JbYu3z1CccQjeqiwB27pvcvyaj39pIIz9c6kVgVGegdmnJ8HA9ZtvSdeo1/KSWs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbWzTo/Ob5ZOtUgY1WaBgX3SA6FgEZsRKVZMluDiNwjItpOaMG
	yRffncU6ycEl+wdZ7SCihNWfcJ4YtR0sLTWZod3L+WxDld5TWquMxS/ZnAv9U9jNztiLcRvWfWc
	6G8VybxwTIJlVsKhj37jS0gG2B8+Do9X6vrSCRh94S0nWrVXwLmbp2TFUmQ+zxRm7coFscOclbC
	KnHX+yXF3NcIkkvkI7nLQILcsX2dBG7X0PJXkTSLvytIDJXw==
X-Gm-Gg: ASbGncuvQ/bLjKimRAaqJ5z4Hi4eJRhi+/1P89xy+tpPw96/pdlMgJdf3Z/nTmlfXn3
	UN01VOWRyYj4yxSxrKMJ52BOHhI9l+sHDMh5DEPXG2I6iMDcwNyV3p1ZpnlOgX7VP8vy3UVxVg0
	rfap3+tPoL3MBPZHujIOlGTjrWFTlTfpP/We32ErJ0DUZ1kjHU+lz8laP3iAruKs9aLk0Dmw1pK
	QhXj8wKlByWlgg+5STzPr4/Wo/Lu3HdwuO+tNOkSaxsQcipngK43NDqpIdK/UTGLrHSv0xzHW/r
	S/OR7N8=
X-Received: by 2002:a05:600c:4e51:b0:43c:ec28:d31b with SMTP id 5b1f17b1804b1-440ab79f582mr90565565e9.10.1745837670421;
        Mon, 28 Apr 2025 03:54:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWN38u2JhWDwqPy6JXuY84JTovfHFRGLcF3m5SfbosWG675z9E1F2DXDYB5118UF5AWfcjaA==
X-Received: by 2002:a05:600c:4e51:b0:43c:ec28:d31b with SMTP id 5b1f17b1804b1-440ab79f582mr90565035e9.10.1745837669916;
        Mon, 28 Apr 2025 03:54:29 -0700 (PDT)
Received: from fedora (g3.ign.cz. [91.219.240.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46454sm10839008f8f.78.2025.04.28.03.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 03:54:29 -0700 (PDT)
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
Subject: Re: [PATCH 1/2] efi/libstub: zboot specific mechanism for embedding
 SBAT section
In-Reply-To: <CAMj1kXHqmOiNX_DH+8uSsTROzR+hgvZ5DyE=3wVE7-dQ+2BW=Q@mail.gmail.com>
References: <20250424080950.289864-1-vkuznets@redhat.com>
 <20250424080950.289864-2-vkuznets@redhat.com>
 <CAMj1kXHqmOiNX_DH+8uSsTROzR+hgvZ5DyE=3wVE7-dQ+2BW=Q@mail.gmail.com>
Date: Mon, 28 Apr 2025 12:54:27 +0200
Message-ID: <87o6wga74s.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Ard Biesheuvel <ardb@kernel.org> writes:

> Hi Vitaly,
>

Ard, thanks for the review!

> On Thu, 24 Apr 2025 at 10:10, Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
>>
>> SBAT is a mechanism which improves SecureBoot revocations of UEFI binaries
>> by introducing a generation-based technique. Compromised or vulnerable UEFI
>> binaries can be prevented from booting by bumping the minimal required
>> generation for the specific component in the bootloader. More information
>> on the SBAT can be obtained here:
>>
>> https://github.com/rhboot/shim/blob/main/SBAT.md
>>
>> Upstream Linux kernel does not currently participate in any way in SBAT as
>> there's no existing policy in how SBAT generation number should be
>> defined. Keep the status quo and provide a mechanism for distro vendors and
>> anyone else who signs their kernel for SecureBoot to include their own SBAT
>> data. This leaves the decision on the policy to the vendor. Basically, each
>> distro implementing SecureBoot today, will have an option to inject their
>> own SBAT data during kernel build and before it gets signed by their
>> SecureBoot CA. Different distro do not need to agree on the common SBAT
>> component names or generation numbers as each distro ships its own 'shim'
>> with their own 'vendor_cert'/'vendor_db'
>>
>> Implement support for embedding SBAT data for architectures using
>> zboot (arm64, loongarch, riscv). Build '.sbat' section along with libstub
>> so it can be reused by x86 implementation later.
>>
>> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
>> ---
>>  drivers/firmware/efi/Kconfig                | 25 +++++++++++++++++++++
>>  drivers/firmware/efi/libstub/Makefile       |  7 ++++++
>>  drivers/firmware/efi/libstub/Makefile.zboot |  3 ++-
>>  drivers/firmware/efi/libstub/sbat.S         |  7 ++++++
>>  drivers/firmware/efi/libstub/zboot-header.S | 14 ++++++++++++
>>  drivers/firmware/efi/libstub/zboot.lds      | 17 ++++++++++++++
>>  6 files changed, 72 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/firmware/efi/libstub/sbat.S
>>
>> diff --git a/drivers/firmware/efi/Kconfig b/drivers/firmware/efi/Kconfig
>> index 5fe61b9ab5f9..2edb0167ba49 100644
>> --- a/drivers/firmware/efi/Kconfig
>> +++ b/drivers/firmware/efi/Kconfig
>> @@ -281,6 +281,31 @@ config EFI_EMBEDDED_FIRMWARE
>>         bool
>>         select CRYPTO_LIB_SHA256
>>
>> +config EFI_SBAT
>> +       bool "Embed SBAT section in the kernel"
>> +       depends on EFI_ZBOOT
>> +       help
>> +         SBAT section provides a way to improve SecureBoot revocations of UEFI
>> +         binaries by introducing a generation-based mechanism. With SBAT, older
>> +         UEFI binaries can be prevented from booting by bumping the minimal
>> +         required generation for the specific component in the bootloader.
>> +
>> +         Note: SBAT information is distribution specific, i.e. the owner of the
>> +         signing SecureBoot certificate must define the SBAT policy. Linux
>> +         kernel upstream does not define SBAT components and their generations.
>> +
>> +         See https://github.com/rhboot/shim/blob/main/SBAT.md for the additional
>> +         details.
>> +
>> +         If unsure, say N.
>> +
>> +config EFI_SBAT_FILE
>> +       string "Embedded SBAT section file path"
>> +       depends on EFI_SBAT
>> +       help
>> +         Specify a file with SBAT data which is going to be embedded as '.sbat'
>> +         section into the kernel.
>> +
>
> Can we simplify this? CONFIG_EFI_SBAT makes no sense if
> CONFIG_EFI_SBAT_FILE is left empty. If you really need both symbols,
> set EFI_SBAT automatically based on whether EFI_SBAT_FILE is
> non-empty.

Sure, but FWIW, I modelled this after MODULE_SIG/MODULE_SIG_KEY and
BOOT_CONFIG_EMBED/BOOT_CONFIG_EMBED_FILE where the selection is also
2-step -- do you think EFI_SBAT/EFI_SBAT_FILE case is different?

>
>>  endmenu
>>
>>  config UEFI_CPER
>> diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
>> index d23a1b9fed75..5113cbdadf9a 100644
>> --- a/drivers/firmware/efi/libstub/Makefile
>> +++ b/drivers/firmware/efi/libstub/Makefile
>> @@ -105,6 +105,13 @@ lib-$(CONFIG_UNACCEPTED_MEMORY) += unaccepted_memory.o bitmap.o find.o
>>  extra-y                                := $(lib-y)
>>  lib-y                          := $(patsubst %.o,%.stub.o,$(lib-y))
>>
>> +extra-$(CONFIG_EFI_SBAT)       += sbat.o
>> +$(obj)/sbat.o: $(obj)/sbat.bin
>> +targets += sbat.bin
>> +filechk_sbat.bin = cat $(or $(real-prereqs), /dev/null)
>> +$(obj)/sbat.bin: $(CONFIG_EFI_SBAT_FILE) FORCE
>> +       $(call filechk,sbat.bin)
>> +
>
> Please get rid of all of this, and move the .incbin into
> zboot-header.S

The main prupose of this logic is to track possible sbat data
changes. E.g. if the file with SBAT data has changed, then we need to
rebuild the kernel binary. If we just use a raw 'incbin' somewhere and
don't add a specific Makefile dependency, then the logic will be lost.

I think I can drop the dedicated 'sbat.S' and use zboot-header.S but I'd
like to keep at least the 'filechk' part: we compare what's in
EFI_SBAT_FILE with 'sbat.bin' copy and, if things have changed, rebuild.

>
>
>>  # Even when -mbranch-protection=none is set, Clang will generate a
>>  # .note.gnu.property for code-less object files (like lib/ctype.c),
>>  # so work around this by explicitly removing the unwanted section.
>> diff --git a/drivers/firmware/efi/libstub/Makefile.zboot b/drivers/firmware/efi/libstub/Makefile.zboot
>> index 48842b5c106b..3d2d0b326f7c 100644
>> --- a/drivers/firmware/efi/libstub/Makefile.zboot
>> +++ b/drivers/firmware/efi/libstub/Makefile.zboot
>> @@ -44,7 +44,8 @@ AFLAGS_zboot-header.o += -DMACHINE_TYPE=IMAGE_FILE_MACHINE_$(EFI_ZBOOT_MACH_TYPE
>>  $(obj)/zboot-header.o: $(srctree)/drivers/firmware/efi/libstub/zboot-header.S FORCE
>>         $(call if_changed_rule,as_o_S)
>>
>> -ZBOOT_DEPS := $(obj)/zboot-header.o $(objtree)/drivers/firmware/efi/libstub/lib.a
>> +ZBOOT_DEPS := $(obj)/zboot-header.o $(objtree)/drivers/firmware/efi/libstub/lib.a \
>> +          $(if $(CONFIG_EFI_SBAT),$(objtree)/drivers/firmware/efi/libstub/sbat.o)
>>
>
> Drop this too
>
>>  LDFLAGS_vmlinuz.efi.elf := -T $(srctree)/drivers/firmware/efi/libstub/zboot.lds
>>  $(obj)/vmlinuz.efi.elf: $(obj)/vmlinuz.o $(ZBOOT_DEPS) FORCE
>> diff --git a/drivers/firmware/efi/libstub/sbat.S b/drivers/firmware/efi/libstub/sbat.S
>> new file mode 100644
>> index 000000000000..4e99a1bac794
>> --- /dev/null
>> +++ b/drivers/firmware/efi/libstub/sbat.S
>> @@ -0,0 +1,7 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Embed SBAT data in the kernel.
>> + */
>> +       .pushsection ".sbat","a",@progbits
>> +       .incbin "drivers/firmware/efi/libstub/sbat.bin"
>> +       .popsection
>> diff --git a/drivers/firmware/efi/libstub/zboot-header.S b/drivers/firmware/efi/libstub/zboot-header.S
>> index fb676ded47fa..f2df24504fc5 100644
>> --- a/drivers/firmware/efi/libstub/zboot-header.S
>> +++ b/drivers/firmware/efi/libstub/zboot-header.S
>> @@ -135,6 +135,20 @@ __efistub_efi_zboot_header:
>>                         IMAGE_SCN_MEM_READ | \
>>                         IMAGE_SCN_MEM_WRITE
>>
>> +#ifdef CONFIG_EFI_SBAT
>> +       .ascii          ".sbat\0\0\0"
>> +       .long           __sbat_size
>> +       .long           _edata - .Ldoshdr
>> +       .long           __sbat_size
>> +       .long           _edata - .Ldoshdr
>> +
>> +       .long           0, 0
>> +       .short          0, 0
>> +       .long           IMAGE_SCN_CNT_INITIALIZED_DATA | \
>> +                       IMAGE_SCN_MEM_READ | \
>> +                       IMAGE_SCN_MEM_DISCARDABLE
>
> You can put the pushsection/popsection right here.
>

Ok (but see my comment about Makefile magic above.


>> +#endif
>> +
>>         .set            .Lsection_count, (. - .Lsection_table) / 40
>>
>>  #ifdef PE_DLL_CHAR_EX
>> diff --git a/drivers/firmware/efi/libstub/zboot.lds b/drivers/firmware/efi/libstub/zboot.lds
>> index 9ecc57ff5b45..2cd5015c70ce 100644
>> --- a/drivers/firmware/efi/libstub/zboot.lds
>> +++ b/drivers/firmware/efi/libstub/zboot.lds
>> @@ -31,10 +31,24 @@ SECTIONS
>>
>>         .data : ALIGN(4096) {
>>                 *(.data* .init.data*)
>> +#ifndef CONFIG_EFI_SBAT
>>                 _edata = ALIGN(512);
>> +#else
>> +               /* Avoid gap between '.data' and '.sbat' */
>> +               _edata = ALIGN(4096);
>> +#endif
>
> Just use 4096 in all cases.
>

Ok.

>>                 . = _edata;
>>         }
>>
>> +#ifdef CONFIG_EFI_SBAT
>> +        .sbat : ALIGN(4096) {
>> +               _sbat = . ;
>> +               *(.sbat)
>> +               _esbat = ALIGN(512);
>> +               . = _esbat;
>> +       }
>> +#endif
>> +
>>         .bss : {
>>                 *(.bss* .init.bss*)
>>                 _end = ALIGN(512);
>> @@ -52,3 +66,6 @@ PROVIDE(__efistub__gzdata_size =
>>
>>  PROVIDE(__data_rawsize = ABSOLUTE(_edata - _etext));
>>  PROVIDE(__data_size = ABSOLUTE(_end - _etext));
>> +#ifdef CONFIG_EFI_SBAT
>> +PROVIDE(__sbat_size = ABSOLUTE(_esbat - _sbat));
>> +#endif
>
> This can be unconditional - it is only evaluated when a reference to it exists.
>

Yes, it compiles well, I put #ifdef here mostly for documentational
purposes. Will drop.

>> --
>> 2.49.0
>>
>

-- 
Vitaly

