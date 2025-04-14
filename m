Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAF92820D3
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 19:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744658923; cv=none; b=Ll/ab/TQvp1P8QikIjVJuWtcmyPzrvNjvsVZN29B03NlgEyDsv7UHtpg1hUgg4HrWtOLrQzMQk29k8/VQMuXRIFDYqwibvrZmib2tl+5XIwZwCJFrRsEbZD25PhI7cy7HF9UILD80YoedzEqQTOhYrFxwrwhW66zDV9R96n1Bmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744658923; c=relaxed/simple;
	bh=celI2uC81gJXumKSv3Ve1wnDLQ3I9UtQ36LMkVkZf5A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aBj5COHkdss4TzjbD8NINxeZS5ihIy9FW6wR4Xb5ztWYS90rhn8J8FgxY9AovkyRx9CCVrdukAdbVlzSiuVv71AIFhlQ4Dc08535uWpONKZBdGF7XgkiriQHRXQOfTRnINFTYmL8542BlL/KtB34thf7HVE79KseED8Zn7N7loM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SEYO5/Pu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SEYO5/Pu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC6AAC4CEEB
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 19:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744658922;
	bh=celI2uC81gJXumKSv3Ve1wnDLQ3I9UtQ36LMkVkZf5A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SEYO5/PuTQgJTq+MAvRyI5jfeY6tDY6CHtIJaOlLLPAdzPKSeChkfbpYeD7MuX5Bq
	 SiZSEudppB04rHdoqxDVeJn6UdoIGxXiAXrW6hcssz1QlhGLaxyTOYV0OGAzFDY2JL
	 qslv95VYexeMgpyNXhT/s8hupNF2DbkhLVXh/ZBGXiS55OBM879y2ooENYqbCO2Sdy
	 anEA5DnoYm2GHhlQtHMN3JomreLXPkPAU58Eall9BUuR30ldt+nC6rx0ddhAxR0NyI
	 iNO+Y87V305EtYkpo4AttDftidW7WJX1a4KxxpjDu17Fb7hnQCt26KaZW2zpb7Q1m2
	 ViL/EKJSd6VLw==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54298ec925bso3208168e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 12:28:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWeBLH91N+U19W7dbdxHe9xGkJlt5hWiFuAh09IwoDUUVZVlRushZ1BqlKHNr3NYvNON8RN6hBijLIn01I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2jBNzqdgjeELPECyZYM8rJPCeAXYHC/MAZ1ULyJx5d+DvpnAH
	CiGv4QSXdf2y5TP3rfdRBqq5TtOrkvdrt7bYeyqqKRRnsuJfXMVjlmjMNSX8shBjo0VRoE6wzC/
	FNghIUvizEMYDkx8EmaEZIwa+7KY=
X-Google-Smtp-Source: AGHT+IGDNx3FpSJFrwnYyeIY4a4YMrCmIfBvBjeHcJ+jBj+75v9JAbSBQEkyd5lpp/4PjWtvytS2vcIMwfzqLSUgq1Q=
X-Received: by 2002:a05:6512:398a:b0:549:5b54:2c66 with SMTP id
 2adb3069b0e04-54d45296668mr3690823e87.23.1744658921135; Mon, 14 Apr 2025
 12:28:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414-x86-boot-startup-lto-error-v1-1-7c8bed7c131c@kernel.org>
In-Reply-To: <20250414-x86-boot-startup-lto-error-v1-1-7c8bed7c131c@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 14 Apr 2025 21:28:28 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGZ27y1t-xxqNCJopi-UQWH65S0j-zB_S_4=pEY5XpKbA@mail.gmail.com>
X-Gm-Features: ATxdqUGSuIW2wjpt4Ynq0D9vfgxSNnN-it3Rx842q4v1y6tPZOwRfvpMymXkGBM
Message-ID: <CAMj1kXGZ27y1t-xxqNCJopi-UQWH65S0j-zB_S_4=pEY5XpKbA@mail.gmail.com>
Subject: Re: [PATCH] x86/boot/startup: Disable LTO
To: Nathan Chancellor <nathan@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Linux Kernel Functional Testing <lkft@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Apr 2025 at 21:26, Nathan Chancellor <nathan@kernel.org> wrote:
>
> When building with CONFIG_LTO_CLANG, there is an error in the x86 boot
> startup code because it builds with a different code model than the rest
> of the kernel:
>
>   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 2' from vmlinux.a(head64.o at 1302448), and 'i32 1' from vmlinux.a(map_kernel.o at 1314208)
>   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 2' from vmlinux.a(common.o at 1306108), and 'i32 1' from vmlinux.a(gdt_idt.o at 1314148)
>
> As this directory is for code that only runs during early system
> initialization, LTO is not very important, so filter out the LTO flags
> from KBUILD_CFLAGS for arch/x86/boot/startup to resolve the build error.
>
> Fixes: 4cecebf200ef ("x86/boot: Move the early GDT/IDT setup code into startup/")
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Closes: https://lore.kernel.org/CA+G9fYvnun+bhYgtt425LWxzOmj+8Jf3ruKeYxQSx-F6U7aisg@mail.gmail.com/
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  arch/x86/boot/startup/Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>

Thanks for the fix

Acked-by: Ard Biesheuvel <ardb@kernel.org>


> diff --git a/arch/x86/boot/startup/Makefile b/arch/x86/boot/startup/Makefile
> index ccdfc42a4d59..bb7c826e586c 100644
> --- a/arch/x86/boot/startup/Makefile
> +++ b/arch/x86/boot/startup/Makefile
> @@ -7,8 +7,9 @@ KBUILD_CFLAGS           += -D__DISABLE_EXPORTS -mcmodel=small -fPIC \
>                            -fno-stack-protector -D__NO_FORTIFY \
>                            -include $(srctree)/include/linux/hidden.h
>
> -# disable ftrace hooks
> +# disable ftrace hooks and LTO
>  KBUILD_CFLAGS  := $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS))
> +KBUILD_CFLAGS  := $(filter-out $(CC_FLAGS_LTO),$(KBUILD_CFLAGS))
>  KASAN_SANITIZE := n
>  KCSAN_SANITIZE := n
>  KMSAN_SANITIZE := n
>
> ---
> base-commit: 9287216a0c8f7bf7b485e18ad71584b434b59bb6
> change-id: 20250414-x86-boot-startup-lto-error-26e0825706a3
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>
