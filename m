Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289752E36E0
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 10:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751797657; cv=none; b=CupWhqxnxubOPZUZ9sgmJ/le3cbv61sKMvOVU48yKEhRqNgBnyTTsn+s0aGPVd4n73uOs6MnTdzbSSgAB0LQEbmhAS+oNwykF1MLtY53e9u+4j5Xv6z2v/AEpJLAXiqiiegfss4wRGfbOaa1nZC7dPHE2Yf2lMq40b15ORRme4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751797657; c=relaxed/simple;
	bh=6uMSUsF4i7E2EkwCaC9wZQFxdNNM8J8izZHp0INrJIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h6/Qiqsvw8mvWV4SowPLtmGMhC/gERR151DNV66Ks2T2KCO6LYWgQ1JD92mN0EcthqMKh7JAmj62tBJFQ+9xYt5t29h5xe+95NpSMLmqR9jxhamKP0eSjqGIe1ZbFQXDDlxYHX8bNTh53LHJuVr+puW6aQHXHrM6blOjqNL5Iak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-52b2290e290so1367496e0c.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 03:27:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751797653; x=1752402453;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o8Wcac1yphsCtx5A+S7DbTVhEWfZCEpLCH1Zp2uzm3M=;
        b=AschQrn+H15VcUnAhtYvCfCJ3QRjT4oNNOscun/5qH4Ok8dGfN6ktAoe1w88wJMNYZ
         VlyI/ZRwYTbjOyhGF9hPJLjcZaY2F7eOjKL5RaTMcUZr/Vw8aU1HTRqGtRw5zFbZTIPr
         4Mj1tivy+5SX5i56MGgReXSNI5xgX0y14PYQK93cF0ZW8NWszM27hFlBy7rzxkP71KXh
         nOnrgLfiw2eHKP79CIHL9h4301zIzc1hA8YV6XaXQzbfbDNLz1tKkH+KFTSM62WC4hgs
         dWeuFo+xUgg78yxBnwKKgTg44mvEWT1UIMt8iZEsN4DvwXdbQuBvKkTaarW1uavvt+pr
         Km9w==
X-Forwarded-Encrypted: i=1; AJvYcCVXfL6o2iD/wASfWw5N7/xaJy4cRIDkZCZKlOuayjWCUNQLwy4X19wBa6hIOs8lzK7AORzkNib9zTXHOPM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyARcoDvlAstzAv920sDR12d2w01QDtv4qz5pfOgA6ux1Pnfuuk
	ZUsmse6G90UYkmhZ0Veg8+fjL8BMhoEToFq/WGNbJaf2RKdqmfJSSjKIwJ4k81sr
X-Gm-Gg: ASbGncv/M9tDlpGFeOATM4qAmn5T22M1XdPOSuN+cQXaeHxdmfFMABgSCzI9MxDCKIj
	OQ26jhUjprXTe+V4kgzyHWTwmjFpMe2xFWiReyOarvg/1ahgZAhZmfNEEuleog7tnuBJsikRH1C
	u17jGw+SWQ8IEdaoG3JY39OX3YczFycVSvFk0mfIL9zYuAc3rZ1L/2/EoVpg6RMxiSAGI1SOg+G
	fv/1CFv+SOiClRfTGsPw3qogeM5l7+0JVjGZT8HkqT9nNP1knu99iiyFevgwLF0lNQyCwxZlEjh
	5zkv7jfOx416UKeR0xHoFLfrF7t2RzJMluKccLKGW6INIFidNzDMxgdNjzQFJgAmkQTGZtQmv76
	ZgwzMytrNotDzDMaHiM+985DdctrC
X-Google-Smtp-Source: AGHT+IFNlXjcO0vQFpM6I6BocsbceuUhHkN53t1YNNh7L5vwOZjP4sPn9i5SHlU1fUzvs/5EkhMQGA==
X-Received: by 2002:a05:6122:2a0a:b0:534:6d9c:d544 with SMTP id 71dfb90a1353d-5347e3e2dc6mr5119718e0c.3.1751797653367;
        Sun, 06 Jul 2025 03:27:33 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53478dbb08bsm880795e0c.5.2025.07.06.03.27.33
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Jul 2025 03:27:33 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-52d9a275c27so2304446e0c.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 03:27:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWEv24iHRdDi7k6FrJhlDcAoKq6deKG240YRPu+cMAt5AlVHcxKbNXdC7Bbg/uFcSmWOSUVreJ4634qphg=@vger.kernel.org
X-Received: by 2002:a05:6102:cca:b0:4e9:c7c8:5e24 with SMTP id
 ada2fe7eead31-4f2f244f7e2mr4690242137.25.1751797652899; Sun, 06 Jul 2025
 03:27:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <d1d4328e5aa9a87bd8352529ce62b767731c0530.1743467205.git.fthain@linux-m68k.org>
In-Reply-To: <d1d4328e5aa9a87bd8352529ce62b767731c0530.1743467205.git.fthain@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 6 Jul 2025 12:27:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXY5xv+aqZQmMQ0rDnDWjEF=O0dEaun8x8=J0kb1LZWBQ@mail.gmail.com>
X-Gm-Features: Ac12FXzwvaf9ptBZ91EIzsqZ1yptuiRs-rvpbLE-5KasykM-HyCxgAn1UjEkTKk
Message-ID: <CAMuHMdXY5xv+aqZQmMQ0rDnDWjEF=O0dEaun8x8=J0kb1LZWBQ@mail.gmail.com>
Subject: Re: [PATCH v2] m68k/mvme147: Don't unregister boot console needlessly
To: Finn Thain <fthain@linux-m68k.org>
Cc: Daniel Palmer <daniel@0x0f.com>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Finn,

On Tue, 1 Apr 2025 at 02:40, Finn Thain <fthain@linux-m68k.org> wrote:
> When MACH_IS_MVME147, the boot console calls mvme147_scc_write() to
> generate console output. That will continue to work even after
> debug_cons_nputs() becomes unavailable so there's no need to
> unregister the boot console.
>
> Take the opportunity to remove a repeated MACH_IS_* test. Use the
> actual .write method (instead of a wrapper) and test that pointer
> instead. This means adding an unused parameter to debug_cons_nputs() for
> consistency with the struct console API.
>
> early_printk.c is only built when CONFIG_EARLY_PRINTK=y. As of late,
> head.S is only built when CONFIG_MMU_MOTOROLA=y. So let the former symbol
> depend on the latter, to obviate some ifdef conditionals.
>
> Cc: Daniel Palmer <daniel@0x0f.com>
> Fixes: 077b33b9e283 ("m68k: mvme147: Reinstate early console")
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v6.17...

> --- a/arch/m68k/kernel/early_printk.c
> +++ b/arch/m68k/kernel/early_printk.c
> @@ -55,16 +46,12 @@ early_param("earlyprintk", setup_early_printk);
>   * debug_cons_nputs() defined in arch/m68k/kernel/head.S cannot be called
>   * after init sections are discarded (for platforms that use it).
>   */

... with the above comment moved just before the "if"-test below.

> -#if !(defined(CONFIG_SUN3) || defined(CONFIG_M68000) || \
> -      defined(CONFIG_COLDFIRE))
>
>  static int __init unregister_early_console(void)
>  {
> -       if (!early_console || MACH_IS_MVME16x)
> -               return 0;
> +       if (early_console && early_console->write == debug_cons_nputs)
> +               return unregister_console(early_console);
>
> -       return unregister_console(early_console);
> +       return 0;
>  }
>  late_initcall(unregister_early_console);
> -
> -#endif

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
