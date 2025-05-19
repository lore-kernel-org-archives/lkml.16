Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A20313D52F
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 12:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747656130; cv=none; b=k23rrrpjr7LyxIJDMmUP2N1o1iK2K3MxDiCzDKEDXAdroBidwTg79X47aSaVFVoYNC+sQb2qj4aiU7DxbWA/dMEKF3531Z1mP2FNpgZVpIDIkDx04AtjK/kvPWphoFxqg+7nrOYWkiaa2KotrFbglQ4rWUZlj6T7ydJZ/Y6K5kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747656130; c=relaxed/simple;
	bh=SZZhNY6WeNtnFkNFGjjzZ/lzU4GTX9jlWJRQyyAA6ZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fRTKUaqqT7lcIlOzfnw1zn/sVcNrcUu4V89Q5WaMZ43qnWyl/2L0fZbFa1jQK4uw6XQemlYPgrYYxzyVAoBvA5kW0t4BLYdJrrsiAxJrGMY23akxTZvpvyysyiq9n/BCG8JUZ2qE9NlK+0szdbcZssgCYNMeGPsWA61k0BmtqaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJI7vMqi; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJI7vMqi"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-329119a3a8eso13483001fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 05:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747656126; x=1748260926; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y7fsjq6GI3zONUGqZSHTQXw/a1e/HecF6zzPmUL5DD8=;
        b=TJI7vMqigTRUTxUfXzyGAMz+LffEdA+qRBjBK1IQOoimQhb0XSpYpCjpcMrKvPAo4U
         ftFcrTrHToGZBPM95UNX7yf7akS+EAlTiko3hqy7LvlBbONjrd5+aX7Ncvc0yWO0GBs0
         zwAkZU5lMCwpUgQiGIPt/x/ZYE3umzjl1LpmOP34FbKNdqddZa51Bvrt8bhI3RXpGMfz
         5dQbSmyksWTyTOlqElZz43ymTq3xDdecjxIWUWrbMk4B75zJZMfaRorY+tGB4g/xjqyS
         iOCm5dt0Q9A7Qk+CnobxOU9X/m2PXdV5WPP6b+pP6A0A1GzQRbo6WIIZQ0XjL56MxkJy
         yzRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747656126; x=1748260926;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y7fsjq6GI3zONUGqZSHTQXw/a1e/HecF6zzPmUL5DD8=;
        b=V2ZyC0+Ym1dT9D8792g00zeGiHafn7hd1OLMEYxi8teXD6j57r7VI7fpNmZ2hr8ERI
         w8f1mhcI+3hBJ7z4Q9064UYAcZisGcNIypz8+MMj8LV6Y5kNvebT6tRpiBEyo/+cIkcX
         pr078hlWSimAnnlDMVdkCgYI77nMyffZIn+S4LUdqQU68Md775lr174Q5xVjtVW9VCwV
         YVAHNO36j+P6jBljrWhI4p64H5S66z+gY844Nj+EqrV4pgeLkA4ieAokA3hx6SKTmZ1/
         RWcc4oje3rXBbm7VoNLNbOf33sPVaPU5GhY0yxYhJOYRbcKlfQ8DznswVDzJzhfmm1bb
         XGrg==
X-Gm-Message-State: AOJu0YwI2BF3wMawtiqsimOBBT8D2OjKgniEnp/vF/Xg9/S3IYTd9EWw
	QWFFYToD2ondcoHDsGRoorXUaexvkKc0vLkQn+gyltpaXYs9y+t8TCAGX8IHMR+X8j6kxyXz6vC
	oGdihXr39zXJu1jNMHDP7tjCayNJ/Eg==
X-Gm-Gg: ASbGncvXRW9TnOLQq8g60S5Ke8snEOMOMXUp0iQnq5ZLYkzL65GnUUikYlEf8v5IYl1
	Z5GG5ynNLF7HCdkNV5Yng08Tf9gHe0WVcOuhFFymtmW+UNiln4J1Qno7NufSr4kWthkKantsCSM
	rYAscL9v2FeIyluiV0mTQJFtT++N+OQMXpyfaNPacsPoMO3XA=
X-Google-Smtp-Source: AGHT+IHAL8OZQVthjPDnI/thjPmXl7YlEi2cLMgEgO8mQGeL4ADrUYM+n18mwORRtzkyCGWmyTqVuXR/w2K/RdJreSE=
X-Received: by 2002:a05:651c:110b:b0:326:cf84:63c4 with SMTP id
 38308e7fff4ca-328083fe3bdmr35774671fa.1.1747656126083; Mon, 19 May 2025
 05:02:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250517091639.3807875-8-ardb+git@google.com> <20250517091639.3807875-10-ardb+git@google.com>
In-Reply-To: <20250517091639.3807875-10-ardb+git@google.com>
From: Brian Gerst <brgerst@gmail.com>
Date: Mon, 19 May 2025 08:01:54 -0400
X-Gm-Features: AX0GCFvvgjuz1G0kKxhB-PcwBqTtzGyAfjDZMFs8XCrQdR3VI5xoPTJxCpJQtEo
Message-ID: <CAMzpN2g0LBXiQk+YvrMi8UVqv9rYfqEZrugdDGYdjNiRCEn40Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] x86/cpu: Move CPU capability override arrays from
 BSS to __ro_after_init
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, "Kirill A. Shutemov" <kirill@shutemov.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 17, 2025 at 5:16=E2=80=AFAM Ard Biesheuvel <ardb+git@google.com=
> wrote:
>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> In order to allow CPU capability overrides to be set arbitrarily early
> during the boot, the underlying data objects should not be wiped along
> with the rest of BSS, and so they will need to be moved out.
>
> Given that CPU capabilities are set at init time, and shouldn't be
> modified after that, move them into __ro_after_init, which is part of
> the statically initialized kernel image.
>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/x86/kernel/cpu/common.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
> index 67cdbd916830..579d5b84e183 100644
> --- a/arch/x86/kernel/cpu/common.c
> +++ b/arch/x86/kernel/cpu/common.c
> @@ -704,8 +704,8 @@ static const char *table_lookup_model(struct cpuinfo_=
x86 *c)
>  }
>
>  /* Aligned to unsigned long to avoid split lock in atomic bitmap ops */
> -__u32 cpu_caps_cleared[NCAPINTS + NBUGINTS] __aligned(sizeof(unsigned lo=
ng));
> -__u32 cpu_caps_set[NCAPINTS + NBUGINTS] __aligned(sizeof(unsigned long))=
;
> +__u32 __ro_after_init cpu_caps_cleared[NCAPINTS + NBUGINTS] __aligned(si=
zeof(unsigned long));
> +__u32 __ro_after_init cpu_caps_set[NCAPINTS + NBUGINTS] __aligned(sizeof=
(unsigned long));
>
>  #ifdef CONFIG_X86_32
>  /* The 32-bit entry code needs to find cpu_entry_area. */
> --
> 2.49.0.1101.gccaa498523-goog
>

Reviewed-by: Brian Gerst <brgerst@gmail.com>

On a slight tangent here, is there any reason that BSS can't be
cleared immediately on boot like 32-bit?  The only potential issue I
can see is with __bss_decrypted, which depends on getting cleared
after encryption is enabled.


Brian Gerst
