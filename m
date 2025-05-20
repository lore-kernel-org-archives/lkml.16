Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C47226460B;
	Tue, 20 May 2025 09:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747733216; cv=none; b=R1KccSRxnw7EOuKh/vDQ7JRgFbeOMsk2gmXcLY5Jl61Tc+liHu+bmh96tOs/305m8eH9t72zCi6Fx9a9OQwHjS5i8TgP6mc5RgYKSQ2Ooe/qPxSosBt7uIVQ+6mHR4B2Ofr8BIePhpB7xSfdra/7DZ/oi9n1w4c5VADU8iMWRt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747733216; c=relaxed/simple;
	bh=rR2ODFobvB6aQcm+jleTMvFv46973eoS1Nxd5m44XoM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z0MXndEuBR4RpxLiwigIcynA+lj0T15mpwoUsRBRt/jvXZ0Z+wdPBgOBsw9rzVDWXwnLug0dSXbz6oOtPM+r06SyhdTZIGJrIfdHsEZ3KjSISB/ct+a4EOv9ft1gnSbprxx8mE3bgRlkdU2o5i0IDZRkEL7QoDmbz8GnaVkLamE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-87beaae0d45so1040322241.3;
        Tue, 20 May 2025 02:26:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747733212; x=1748338012;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I35pJzfJnVpM8mnqD+jIZ0IpwIQDyk5+35hdygHMvDU=;
        b=RHRd6wJwKu4tTUGfKkIqLTNwJ5uSDilcIrCMKKK1szT+Z2mQKed4u71Wiw8gSfJC+o
         N6mLS3zDfxxiy70kXIsLeZuQwIUqUcmvi3zoUova4u72aKqaZ8GNUBGgi3FOcCkCAcP6
         BgqCoDm0IR9B4l3W2Fss2iEEez2HebAk07gDUf+9WWjdp9XhxIiDLSvRCbjH82wa3ZeB
         9stzC+NNXvcl1IPhZArBjncPWpSA29B5EY9XIEriOwbxIxavwunKmX1YZrO0WCHf4R0x
         ltkrSTf9IE5mq/lwYpKW9e0edWhQ/bSwwqmGKX9Xmv1b6M8BrpUmEWatpPg/MLVBCgmU
         QP/w==
X-Forwarded-Encrypted: i=1; AJvYcCVAXmcSBt70w+zbSFBdNPVXEIPUb9jeagBAO65hrkGUG8Z4l4/fSZfpEJ2HmT5W4EBP1NK46URzDi/1@vger.kernel.org, AJvYcCWbMBpKwudkkMWW0Xt+aFhCRm9EE+e4UMwnYPR0KVlQvS4vQH0T+lL/WHnb5D4X1N4rY3oZylw3qQjLv1Hq@vger.kernel.org, AJvYcCXdVLx9gK0YlyCt4SWgkZnaKM0JOmIgFJxVTAKKp2KLcAbjYhQNz51gIr9uzEa4AubDJ6HFdUXw8Hrw@vger.kernel.org
X-Gm-Message-State: AOJu0Yzys9zsGs22GXx7n4prDMnpVlPt7fhRBEFgm2rZ+K1sgK+ewBP6
	D3zTRyjGnfUB9vVTA405bzeSRXbjmpN47RbhIkfaeB4fNhOR1eoTNHW178fVROYs
X-Gm-Gg: ASbGncuJs/pEYVV7xHhs9IVPIrb1V8heIY0dknHGrQL/e/8TPB8ZPix0ry535SAjjIr
	e15s3TQ/ddx+FRNcj+r4H3jBjvnCcxizqnOjyj5onoTYXmGXos2ZsXQ0Ys/i9Bv+IOfNCj62UZM
	y9kJUTkjkR2laQwJq6NdpNnnzsDLXSTTWtkyCbYZJuyLMtLaFouhlbpE9q81ubIo1L7azKs1bbF
	1KJTJl34QfmmWpkBGBNFSercGAdXam3LOr9TcWRcyjrIwcL7mcaEw5MJY39zHf4dVsUObX/z3T4
	4K/sRbftJzr1bQfc+WsPnUt3Jj0qUZxbFwK9d8wYcllrpTDjZjOorUnCEhQtbroLByymvBDGMy9
	WGMYd9hNB7a0lGc2JNQ==
X-Google-Smtp-Source: AGHT+IH1U+FJwe59eLhCkNgPwu3N3GCETWRisn7/wPwT6aa5vc+UqJyj7EH3jX+plFLTkvzgMmeCCw==
X-Received: by 2002:a05:6102:f8f:b0:4bb:eb4a:fa03 with SMTP id ada2fe7eead31-4e053c658b9mr13617664137.23.1747733211834;
        Tue, 20 May 2025 02:26:51 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e19508b101sm4515791137.29.2025.05.20.02.26.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 02:26:51 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-52413efd0d3so1583269e0c.2;
        Tue, 20 May 2025 02:26:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVph91zBm2sVjgx02SVwHGZeaclzauO5+x4+OhZrMDOjACKbeDUeVc8lhcELd2PtfQ2k6xl0Jeh+OBc@vger.kernel.org, AJvYcCWR+YrXw+InddNesDL6AsmysJM8qrf0oNeUe+NB+6BA8WJUgW60Z8+qW/qX4bK5YGba4ioEto9CFhp0NiEJ@vger.kernel.org, AJvYcCWVkVkcihjV78VA2KGOK/riSFE4uuebljDkz2SYwBdZsacw4L9uFkTLNBoFnqZaM8UbnZWRTciuZE35@vger.kernel.org
X-Received: by 2002:a05:6122:d16:b0:529:be0:8353 with SMTP id
 71dfb90a1353d-52dbcc563e6mr14351261e0c.2.1747733210548; Tue, 20 May 2025
 02:26:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250516030310.16950-1-cyan.yang@sifive.com> <20250516030310.16950-3-cyan.yang@sifive.com>
In-Reply-To: <20250516030310.16950-3-cyan.yang@sifive.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 May 2025 11:26:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVoUx99rK3bZZnpTh699fQouVfmTfzvuM_UfGS=PAvW2Q@mail.gmail.com>
X-Gm-Features: AX0GCFszGmUcQtLoTyNNFovF2YojcjcAcPR9b8MIsnl3CFxsjuc5ApH7U3El6W8
Message-ID: <CAMuHMdVoUx99rK3bZZnpTh699fQouVfmTfzvuM_UfGS=PAvW2Q@mail.gmail.com>
Subject: Re: [PATCH v2 02/12] riscv: Add SiFive xsfvqmaccdod and xsfvqmaccqoq
 vendor extensions
To: Cyan Yang <cyan.yang@sifive.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, samuel.holland@sifive.com, linux-doc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Cyan,

On Fri, 16 May 2025 at 05:07, Cyan Yang <cyan.yang@sifive.com> wrote:
> Add SiFive vendor extension support to the kernel with the target of
> "xsfvqmaccdod" and "xsfvqmaccqoq".
>
> Signed-off-by: Cyan Yang <cyan.yang@sifive.com>

Thanks for your patch, which is now commit 2d147d77ae6e96c1 ("riscv:
Add SiFive xsfvqmaccdod and xsfvqmaccqoq vendor extensions")
in riscv/for-next.

> --- a/arch/riscv/Kconfig.vendor
> +++ b/arch/riscv/Kconfig.vendor
> @@ -16,6 +16,19 @@ config RISCV_ISA_VENDOR_EXT_ANDES
>           If you don't know what to do here, say Y.
>  endmenu
>
> +menu "SiFive"
> +config RISCV_ISA_VENDOR_EXT_SIFIVE
> +       bool "SiFive vendor extension support"
> +       select RISCV_ISA_VENDOR_EXT
> +       default y

I guess this has no dependency on ARCH_SIFIVE and does not default
to ARCH_SIFIVE because this extension can be present on non-Sifive
SoCs, too?

Probably I should have asked this when the other RISCV_ISA_VENDOR_EXT_*
were introduced, but at least for ANDES I already know the answer.

> +       help
> +         Say N here if you want to disable all SiFive vendor extension
> +         support. This will cause any SiFive vendor extensions that are
> +         requested by hardware probing to be ignored.
> +
> +         If you don't know what to do here, say Y.
> +endmenu
> +
>  menu "T-Head"
>  config RISCV_ISA_VENDOR_EXT_THEAD
>         bool "T-Head vendor extension support"

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
