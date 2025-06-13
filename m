Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1012E11B5
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 17:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749834771; cv=none; b=U3sMOGPaxtO6yHMasXHGBN7Nzd9tPLBANlaZKgINBw0EFuRhttW3OSqeieMEgD4FqmQZGdxA0dgApV2DkqVGiNrnrwiZ10OuEsRiP+iL487LGfou+qodDs8UvI9tXc6ro0EtpP9qOg9zmm3nAIfFI8GTKCOwRmz/zcazMqVDcsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749834771; c=relaxed/simple;
	bh=eARcTBmBmFJlsmYwXi2QryQsRQmZYIIb5kCDrrtGRAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FN4wsufrNaFrmpKPB6sAz3QApRnD4JkGmlMbMoEwHb6h7j9JXvPRD0V7vK7Pc1BbFln6NnaS5Q2/1tJgmBefNs9EQY/f9jj4XYidxkIrM1xkscjWxopPbDypDxRxZdGnhKSW3vAKNK1W4XGxsgoy+aHfnCxRxv1VGdfXfdOlFo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nerENi6U; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nerENi6U"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-310447fe59aso23636881fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 10:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749834768; x=1750439568; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TzkZpu5aUWr16IsQvZR0qI7By7l0jq4T/bvKoWh9vk4=;
        b=nerENi6UuR5PXGGxdsv/NX9PKtxwRGflJAoozcs0rcWrYALy0eY0+YMNu85KOu0IB4
         ksDiFV/kyXEVAvHVCpFR4G/WOQY3dymHUWceDZudQrK1o+/NHRL3URgq1++DxuSdqUwL
         x5R4VDovANlQ6AkGnBtHiBkLeS1pmlTmEprQSPuSvfFRUcbUWvcsKg3Aqe01DQdq4z6H
         NY6b3/oqaa8eLkTEVqwOWqfJyvrmBkbOWvT/bTGIFqQ2x0vxEjWLrLdrX/8pv0nXH1Ql
         v51t0QEvdSviJKKt4K3HZeBuGUV8DJienYWie3lSwrrtWb1bG8Y8MXUFpV0prVaD0aI4
         e/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749834768; x=1750439568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TzkZpu5aUWr16IsQvZR0qI7By7l0jq4T/bvKoWh9vk4=;
        b=ArgY4Wae6U3f/pgW1/lr0OfmP9tAUrAX/P2X2C1b5G11tl2ow2zhWANdY59D61DrBf
         4IOltS+Ra0NsWgoqxijB3X9PCh/Vi8LsDkh565x+gbZezgHuKLi+npyn4wfHSab8THPs
         OW5ZeTemHRO4mA1y2Svqx9IxJ87z6qgBPdHndt/WNZrOWmIxQ57+7Xtp2ht+Aob8hslv
         pkyIxOUcAckxHAvRMLhsKTwWdtIgOt96ZttsaQePAt0ghh0Xr1A9gStQf0vST/fwXcIG
         6sWMD6i7ow2Q6E6GhZTh8JJ8FUdJS3TXoxpq0V0z84AMk5MixHkiUt0UeQ8eF1BmipPp
         MR4g==
X-Gm-Message-State: AOJu0YxUjqAZ2IyUl6nlfFREeeSXiCBntL74yirxk+Bdbuw3zBOF3fNX
	syyh4ZnoOCsQJb7e0FZhFzHh3hemu79Wm9mr+Trgo1puwv85GxKSPvS4Yt4C6/V3SZ54G5ZOFlu
	MIDHK5tYFQwBcg3PkDbKtuz5ITj5PeA==
X-Gm-Gg: ASbGncvLzoH8FsXGDsowOpo8xd4ZOwxySLyZ+AoHmvoVuHeTBvr0b4IecQK8Ch71BnB
	5lDQQN5E6Ip2wzbSxZN15EDZHEojguhsEaf2dY1b4kWtD/Oxg0H9yL9IwFD5A5f81jikrsE0LMG
	IdVeZ4v7HgR1ffmL3KGXnUG0y28JOXQH2cwuDFlWDRghM2hYcXsY78zd28+A==
X-Google-Smtp-Source: AGHT+IGr2mYfHaBnraWL8ckMOM5ceFJ0G9zUnSP6X1Hu6q0McBTnWdg22300JcGf/rzUuwFWw/6oBelvsjIbg45AgmE=
X-Received: by 2002:a2e:a98c:0:b0:32a:8ae2:a8a7 with SMTP id
 38308e7fff4ca-32b4a2c3186mr345781fa.8.1749834767291; Fri, 13 Jun 2025
 10:12:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515132719.31868-1-mingo@kernel.org> <20250515132719.31868-4-mingo@kernel.org>
In-Reply-To: <20250515132719.31868-4-mingo@kernel.org>
From: Brian Gerst <brgerst@gmail.com>
Date: Fri, 13 Jun 2025 13:12:34 -0400
X-Gm-Features: AX0GCFtopQHZfeIi1lurgAikFrgTFdibsp_BL6YhrrIO3PGHUef7KADa5G1i4jQ
Message-ID: <CAMzpN2jMYaF0eua8FoOPXR74yA62PBGK5f=QOBFYs2Z3O0BeUg@mail.gmail.com>
Subject: Re: [PATCH 03/13] x86/kbuild: Remove ancient 'arch/i386/' and
 'arch/x86_64/' directory removal 'archclean' target
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, "H . Peter Anvin" <hpa@zytor.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, David Woodhouse <dwmw@amazon.co.uk>, 
	Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 9:28=E2=80=AFAM Ingo Molnar <mingo@kernel.org> wrot=
e:
>
> We have to go back 17 years into Git history, to kernels that won't
> even build or boot with modern build environments, to come across
> the obsolete arch/i386/ and arch/x86_64/ directories.
>
> Remove some of their last functional residuals in the 'archclean' target.
>
> Signed-off-by: Ingo Molnar <mingo@kernel.org>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: David Woodhouse <dwmw@amazon.co.uk>
> Cc: H. Peter Anvin <hpa@zytor.com>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Michal Marek <michal.lkml@markovi.net>
> ---
>  arch/x86/Makefile | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> index 594723005d95..4e7ac5e4b537 100644
> --- a/arch/x86/Makefile
> +++ b/arch/x86/Makefile
> @@ -348,10 +348,6 @@ $(orc_hash_h): $(srctree)/arch/x86/include/asm/orc_t=
ypes.h $(orc_hash_sh) FORCE
>  archprepare: $(orc_hash_h)
>  endif
>
> -archclean:
> -       $(Q)rm -rf $(objtree)/arch/i386
> -       $(Q)rm -rf $(objtree)/arch/x86_64
> -
>  define archhelp
>    echo  '* bzImage             - Compressed kernel image (arch/x86/boot/=
bzImage)'
>    echo  '  install             - Install kernel using (your) ~/bin/$(INS=
TALLKERNEL) or'

This does not remove the code that actually creates these old symlinks:

$ ll arch/x86_64/boot/bzImage
lrwxrwxrwx. 1 bgerst bgerst 22 Jun 13 13:06 arch/x86_64/boot/bzImage
-> ../../x86/boot/bzImage


Brian Gerst
