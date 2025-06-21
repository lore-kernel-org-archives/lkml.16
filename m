Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1E64C7C
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 08:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750493943; cv=none; b=rOb7VesFWaoo0sWul+mJg7wA/ZVsk3E28dIIulWq2KDjaQfA3jHCOaSSbnKm5ee6htapk0XDGcAHaebXAWaIQEi4LQrmUElKNnPrkUiORr+IU2NRmYrf7ZXrOcNiVngGx2QMvp9nCmd0isDeukH6B2NKAJb0ScCExM1tJpHFMa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750493943; c=relaxed/simple;
	bh=e5m4QEjPl9As/wyXW8D37dHS6AYvb+pCP3U8A6PmKqk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=id4eQvpsn826iNRQe0W/TxgDNC+fJVcwsfM/KtY/WKoGLtDFqUgSPmzV+VsCoSsmOvdfPEEtcjWzx1Kif1ZR91wZGAxRfDJ/dBZ/ZJGCOhyT9OqPRhC1in5jmUQxGnrstGsKcWjhkRIFj0c/siDbNJD3yZjdqm1eIjJ7NcRkZKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bOCo8922; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bOCo8922"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4866DC4AF09
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 08:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750493943;
	bh=e5m4QEjPl9As/wyXW8D37dHS6AYvb+pCP3U8A6PmKqk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bOCo8922h1A2NqWzTFtdMigeo6mXOcccubAdB34PAoJHYo1G7j4aqoglaUm0M3pkx
	 0YV0Vl7WUr1fH9zx7h1d5AbavMZ09eda+6CDmZuYPW+UbItI2T5cMRrrJw9s1oHhUH
	 fgfxe/l9LfD0xotHZUA9TfpAdAUVgSjIRtXSmBhCpdm9xNowWtl/xaioRozq/do9BR
	 3Bo5dpjOkCEY2j95cUzMPYnjl4KGOo3Ss2aCkspw1swHOHZj/UfdHF0Eo6ydwYP+QQ
	 +sqKPRXkQ+rIUBtese1FMqYRpSCDV+wmlnudgA6eZuQoSDgbkkN2KJXxOIi6AxFXQK
	 +1I7rGCP1JDvg==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-553644b8f56so2633642e87.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 01:19:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVfR7IL/odeLk+QtnopDhMtvN2DXvu8AWXxWXt4valmo6wFOmPx3WkUg7jsBz85XH5i6VaZvl3CMF7SqFI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeQz7Uz3J+0U4ciGlzwDq7MKyrnPOCnY0/stPIaEswjcN9Ppn6
	C/Mumywn1EXh8K2Qe2zkqcVoTLZS4YogIEYcE8g/+k/ZNAJQ4HMu1RCdqoFfsyZ57ISUxpuFz7G
	mD+nlOdMj4k2dqAjhbQ5TSB39FUHg2y8=
X-Google-Smtp-Source: AGHT+IEnQNZIfw+NAAp/diO2E05zVTcPRejtOrWLFQ5TIwKpkek/uIjg+3Ye8bT23xq/2cPwbozY7BmIKkzrh8ZKt20=
X-Received: by 2002:a05:6512:1114:b0:553:cfa8:dd31 with SMTP id
 2adb3069b0e04-553e3bce9abmr2176190e87.24.1750493941684; Sat, 21 Jun 2025
 01:19:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610214140.2775339-1-mclapinski@google.com>
In-Reply-To: <20250610214140.2775339-1-mclapinski@google.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 21 Jun 2025 10:18:49 +0200
X-Gmail-Original-Message-ID: <CAMj1kXErKwmiM5AiGOCE5D39U+3o_MXz5vqJmE5pkjQV308d9w@mail.gmail.com>
X-Gm-Features: AX0GCFsoP7NQ2m0kA23EiDPemlBt6CmCiHTxHhUg8S7DE8fgwULEkFm-K0iAv3A
Message-ID: <CAMj1kXErKwmiM5AiGOCE5D39U+3o_MXz5vqJmE5pkjQV308d9w@mail.gmail.com>
Subject: Re: [PATCH 1/1] x86/boot/compressed: Fix avoiding memmap in physical KASLR
To: Michal Clapinski <mclapinski@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Dan Williams <dan.j.williams@intel.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Michal,

On Tue, 10 Jun 2025 at 23:42, Michal Clapinski <mclapinski@google.com> wrote:
>
> The intent of the code was to cancel KASLR if there are more than 4
> memmap args. Unfortunately, it was only doing that if the memmap args
> were comma delimited, not if they were entirely separate.
> This change fixes it.
>
> Signed-off-by: Michal Clapinski <mclapinski@google.com>
> ---
> I would like KASLR to support more than 4 memmap args. Do you think
> I can just increase the MAX_MEMMAP_REGIONS or should I implement
> support for the general case?
>
>  arch/x86/boot/compressed/kaslr.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/arch/x86/boot/compressed/kaslr.c b/arch/x86/boot/compressed/kaslr.c
> index f03d59ea6e40..4aa9c9781ca7 100644
> --- a/arch/x86/boot/compressed/kaslr.c
> +++ b/arch/x86/boot/compressed/kaslr.c
> @@ -162,9 +162,6 @@ static void mem_avoid_memmap(char *str)
>  {
>         static int i;
>
> -       if (i >= MAX_MEMMAP_REGIONS)
> -               return;
> -

It isn't obvious at all why simply dropping this condition is fine.
Could you elaborate?

>         while (str && (i < MAX_MEMMAP_REGIONS)) {
>                 int rc;
>                 u64 start, size;
> --
> 2.50.0.rc0.642.g800a2b2222-goog
>
