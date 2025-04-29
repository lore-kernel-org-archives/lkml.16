Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD291C862F
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745920538; cv=none; b=fdlWT/0SzJgaUb6kftpOHzuv5vvdPRyMfL4IajeAOwtQR5yqS3doYo8zdPBLB2+gz/JiDNFBIxxoRV3lmbwJEHOH7xi7hfuEXQJTpRpGTuZWEYNnrpj4gOndporLbpUULjhFJFe4qgF63nDh+rNAvx0XIZmOzI5YfhxjTTem180=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745920538; c=relaxed/simple;
	bh=keJfQAoUIwU/GXMp5g4AzFuoVvBz2pxzJTdJyj/jCAI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UfxN7ziB4lejr4YW+daz4R/Ao64lbf7FDi9+PEyQdO7VYhnatOP48GdwVibt4OMtB+uT7jeGQjL1QkMeShHjQtqFoAiNROug/V8Q+0EN96YszaKEpwIKewprX5UvaPfmvPfWK0LxEIZmVs9llS6VvSE67LD6x0Q3cVVyelXg13s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JKcVKfH5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JKcVKfH5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745920535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xntjKgnfwZOTv8Lz3QOtpBAGgzG+hyrtl5zomojulJw=;
	b=JKcVKfH5DPOdx1Dn63HCw0g6tyYgOJ9XZjIgjq8jcUtTzmwzUyjlW5ncVhScoNu33oSzWp
	V94pRGpgrdsDfJeinjBhLG7h5ycxW/kCpBTmPeXIIq8cva1xFHb4pcevBwKy4V6YznxlLA
	Ev4c5t0daOq1iKmbZRGoO/Rkn9kbY9Q=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-MG3wJZKpO8GDu05dvau4Hw-1; Tue, 29 Apr 2025 05:55:33 -0400
X-MC-Unique: MG3wJZKpO8GDu05dvau4Hw-1
X-Mimecast-MFC-AGG-ID: MG3wJZKpO8GDu05dvau4Hw_1745920532
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-39d9243b1c2so1905026f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 02:55:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745920532; x=1746525332;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xntjKgnfwZOTv8Lz3QOtpBAGgzG+hyrtl5zomojulJw=;
        b=h6oLyEUL3kem9mhojWfwMWHuvVxT5+gNeSNYgEUlAxXxhoRbrUtB3aSssYZoRUrr/b
         qwZy7sAbfSsr4dhGvWAEsafTM6dslvNoa0ynA0e+Y66hui+2L9Ltuf1ZgeTBKHGgbszg
         /DIPcKlVvnjzas3oWWL+VoVLWlaauMoSihuWGoYxfqRXPJAZU98Uu+sAwK8lY9N/Dwum
         KVPKYxveTNIKiTwM5A16ViG87ThnpfIXOgbb8Cu8f5ERbMUOpMBQkRJYR6ro1ndVybg5
         EEgna6RQdSp8vPRYeqsNhRwnaQGNoJRNExBfk5eFPikxW+UyfeJKxQLlOvWvMdmQ9kP0
         Myaw==
X-Forwarded-Encrypted: i=1; AJvYcCUazRuG37nd1BZlpBnEz3/Z0cPFMJWE7WRC0p2ZYqZZTYlSILvrRAEQ9r1fAa0nFxMMfS7Cf1HNhGORgZk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKLkkYiStmBwMTdZQ+KlxTTA2Tbugt32tEG/smoaVaTOHLvKHQ
	rzGI99DuV0FDD2Fq9YnX4XqM4BwtVWMgQnpOV4wIWw7HkF4ZBHQ89qrkZ8nt/RJ3qTsQGoImp2s
	xx5wZ/U/EHIZDEuT4tJ8cuT2Pqj65dHWPl6piwxVR0dUDkTUKD53c1BUpRAOcicnRaT/3bZMErw
	v6vKlnMbXKhg4u9TrszofodTRCUgN/rP8jZI05jrlG8iQFUA==
X-Gm-Gg: ASbGncuIAPuxSCIJ1nh7Dp2+aOv1qxsBc5m4JfT/7uABxeOzL89a2SimFz5F0NAR6hA
	jAaX5cn6RnejaRPqxWtac6/t65q07nlA9YEURlX7LlvazohDl++r29H/QFBVfxOd9ZgK/SsGpVC
	IqBtdH4QgcCrV7lrIhKTm/VNZJrwidI0ZHUuP7yTc3jns1ZkqeVvm6pOTvkBlEkHrd3FZZHLAhb
	XRUWF2noCUcjK/2BNl7P8g71Ow70dndVWGr066TOm8cAqia8mAbj4S8e/H0w6oXJBBzYgX2yJgn
	h3oZO+o=
X-Received: by 2002:a05:6000:310f:b0:3a0:8ac0:e496 with SMTP id ffacd0b85a97d-3a08ac0e542mr1848879f8f.7.1745920532257;
        Tue, 29 Apr 2025 02:55:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfIWeyLjpuG6s2coM0Lu8kDibF6g1giWUUP9D7vYfEQD+QdfZivGSCk1W0/tffaKL2WnLAcw==
X-Received: by 2002:a05:6000:310f:b0:3a0:8ac0:e496 with SMTP id ffacd0b85a97d-3a08ac0e542mr1848828f8f.7.1745920531827;
        Tue, 29 Apr 2025 02:55:31 -0700 (PDT)
Received: from fedora (g3.ign.cz. [91.219.240.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5c7d1sm13359287f8f.83.2025.04.29.02.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 02:55:31 -0700 (PDT)
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
Date: Tue, 29 Apr 2025 11:55:29 +0200
Message-ID: <87ikmn9tri.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Ard Biesheuvel <ardb@kernel.org> writes:

> On Thu, 24 Apr 2025 at 10:10, Vitaly Kuznetsov <vkuznets@redhat.com> wrote:

...

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

I'm sorry I'm probably missing something important but my understanding
is that that header.S is compiled into setup.elf:

 ld -m elf_x86_64 -z noexecstack --no-warn-rwx-segments  -m elf_i386 -z
 noexecstack -T arch/x86/boot/setup.ld  ... arch/x86/boot/header.o ...  -o arch/x86/boot/setup.elf

and then the result gets concatenated with vmlinux.bin to get bzImage:

 objcopy  -O binary arch/x86/boot/setup.elf arch/x86/boot/setup.bin
 cp arch/x86/boot/setup.bin arch/x86/boot/bzImage; truncate -s %4K arch/x86/boot/bzImage; cat arch/x86/boot/vmlinux.bin >>arch/x86/boot/bzImage

so if we want to have SBAT at the very end of bzImage without dirty
tricks it must be at the very end of vmlinux.bin, not setup.bin. I can,
of course, use some existing compilation unit but to be honest I can't
find anything suitable.

-- 
Vitaly

