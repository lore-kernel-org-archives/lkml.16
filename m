Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58370143748
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 13:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744117397; cv=none; b=Vl1bNl239Pfum63qQgzqrZA4Gqyr+shMN4wW886R2DmZXgXzHpdDbtYdPykiN1HHBd2Hx+pYW8O7NWDABDQbekrj9WVOCaS8d1FwpRRZItAGwuzD4K5lngAkYf//KzHA5h4QPX/afHEqznCEskoSv437IB+1mAWB3xGedezzru4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744117397; c=relaxed/simple;
	bh=cXZ8U54y2F9J9ZC0hcxlPN/URhXSYrp+nU2r8w6MOHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VfuH2iOuh9/2GWvSiqhcVOrhQr7EIw7UlPXtPFZ7biKgxrIu0NFhaNt4T7FJAaLvdmgIR1yc4M8Kira7Ax7bAxq8F0TJWuMBgIdzXkysfIng1TIiJRm5hD7AUMbdrvhDwwX+zpoXg/gySd5qjtk6iwKC40n1zrHXHpi0HpfhW/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=jPW0Xhe9; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="jPW0Xhe9"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43690d4605dso37463435e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 06:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1744117393; x=1744722193; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yariCUXscgT6CSzi8mecIIs82gQSGVlzPNHiSOA5TSA=;
        b=jPW0Xhe9sQoYf1QuinSaNidhsyVUYNEnc/7qLaTozPBtzB9Wfd23IgB3fxh9bu3U4f
         Q6u3D2cYwNhZxLEZFnlGdDItJWEjcsvJE6bLi++48y+NE4dnSmITqFvb5s2bajXxiL+B
         WOq1bKyfnjXMJzcneIREhINVkjwjRt8CyyPCF8BRC3AcQoLtpAuI3MG23oB19RH5o31X
         RotDm7KTaM9P+iO8/PGlNcA89ZQKipd8Zw8NDyjNwXcvaIuvPLKnd1XuqOa86iRM1A24
         NAf7trYjIh9GwXO+fBoEA6da/Bbb9MO/V0zjL8C3BnRHpFzTse6PydIqTBI0uUyLEaPt
         CdCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744117393; x=1744722193;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yariCUXscgT6CSzi8mecIIs82gQSGVlzPNHiSOA5TSA=;
        b=hG3RoW0a1Oz6CDi6jQ1D4J9EKONio7/FSzkmvVnXdCzxDpUEIdOGz7a7qPX/6TFkbi
         joOrNSTGMFlNrg45GRPULObsw6wMTYzMNxzYH7MgJ0F9oSjoszZ+JtxIfMvKdS7B7gj7
         OvkLXZxFNPEtxGsEXzu/zXKsOa5waOUOKIUK0qSugn79JHFiwFGIOFZVEJWTypkgrv5u
         TXU0SCehPmdwD1OMdaP/IgwurGiCPdaAz/Ifdvcv1G57oS5PFa4OoV28WKCEc2xcOUmu
         O6AkqzB2inUJVJka6X+XNcX84QNTeKl6uNOAhAN9pvKSUS5zITMLuhGG5MW0hBtBwjB7
         znBg==
X-Forwarded-Encrypted: i=1; AJvYcCUQHhTFyutGmA5cQeFld/4Kp/RiTXlI+4dM/AmQyQnFM4UvWUvsCeHYHtjnL0yTeoGl6fl68yBFJFMgVt4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcClwqy0IvROuQ2pUS64A/iLKNC8aQ5d0A+mhadKHYcPIJm/lK
	63Ki2dwzOcz7cePAbk9iXX2+4g3Zj0eYOTWn7c3PuYaJ+ILJM5yV4VJ55SVsykg=
X-Gm-Gg: ASbGncu+PWXHx9RxF5NFvbMoZJZCBsVuKUmsvCz9YR8MQoZVDMi2gNxkBQ2PL1Jv8kn
	Nt3NgwmdAjMt0BO2sJkyvMQmzsnLfFb5KYi+7i65axaNGjhHmIglFXmaKLyaw38ng0ll9T7IpcQ
	AcYOG3MVroH4wMNm4S8eU/FVp/vAKHEnOOkMZ3pQqJ34OfzWn3z4mRz8VigEKDAIoggZXgfe5f8
	t+RDWZJoKashaRBYLIzPjjkLvpgtxQBevKMlpdNO0uKOC7CXO08kHOOsic7e0fE1881X0Jy0yOd
	+g8MVWkDFp0Mxd4/wIXwnwpRjY/Z+he+
X-Google-Smtp-Source: AGHT+IF2Vv0rmz/WwZXEsLPeSJxbfCLrHKkL9DK4fFs4t2QUhn6W9THc1pNDbAlCQHOWVpb2Kmxavg==
X-Received: by 2002:a05:600c:c8a:b0:43c:f597:d584 with SMTP id 5b1f17b1804b1-43ecfa0704amr151411075e9.29.1744117391094;
        Tue, 08 Apr 2025 06:03:11 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::31af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16ba978sm164456275e9.23.2025.04.08.06.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 06:03:10 -0700 (PDT)
Date: Tue, 8 Apr 2025 15:03:09 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	charlie@rivosinc.com, cleger@rivosinc.com, alex@ghiti.fr, 
	Anup Patel <apatel@ventanamicro.com>, corbet@lwn.net
Subject: Re: [PATCH v3 7/8] riscv: Add parameter for skipping access speed
 tests
Message-ID: <20250408-f3b5934a901bd24c1c800c8d@orel>
References: <20250304120014.143628-10-ajones@ventanamicro.com>
 <20250304120014.143628-17-ajones@ventanamicro.com>
 <CAMuHMdWVMP0MYCLFq+b7H_uz-2omdFiDDUZq0t_gw0L9rrJtkQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWVMP0MYCLFq+b7H_uz-2omdFiDDUZq0t_gw0L9rrJtkQ@mail.gmail.com>

On Tue, Apr 08, 2025 at 02:25:12PM +0200, Geert Uytterhoeven wrote:
> Hi Andrew,
> 
> On Tue, 4 Mar 2025 at 13:02, Andrew Jones <ajones@ventanamicro.com> wrote:
> > Allow skipping scalar and vector unaligned access speed tests. This
> > is useful for testing alternative code paths and to skip the tests in
> > environments where they run too slowly. All CPUs must have the same
> > unaligned access speed.
> >
> > The code movement is because we now need the scalar cpu hotplug
> > callback to always run, so we need to bring it and its supporting
> > functions out of CONFIG_RISCV_PROBE_UNALIGNED_ACCESS.
> >
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> 
> > --- a/arch/riscv/kernel/unaligned_access_speed.c
> > +++ b/arch/riscv/kernel/unaligned_access_speed.c
> 
> >  static int __init check_unaligned_access_all_cpus(void)
> >  {
> >         int cpu;
> >
> > -       if (!check_unaligned_access_emulated_all_cpus())
> > +       if (unaligned_scalar_speed_param == RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN &&
> > +           !check_unaligned_access_emulated_all_cpus()) {
> >                 check_unaligned_access_speed_all_cpus();
> > -
> > -       if (!has_vector()) {
> > +       } else {
> > +               pr_info("scalar unaligned access speed set to '%s' by command line\n",
> > +                       speed_str[unaligned_scalar_speed_param]);
> >                 for_each_online_cpu(cpu)
> > -                       per_cpu(vector_misaligned_access, cpu) = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
> > -       } else if (!check_vector_unaligned_access_emulated_all_cpus() &&
> > -                  IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
> > +                       per_cpu(misaligned_access_speed, cpu) = unaligned_scalar_speed_param;
> > +       }
> > +
> > +       if (!has_vector())
> > +               unaligned_vector_speed_param = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
> > +
> > +       if (unaligned_vector_speed_param == RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN &&
> > +           !check_vector_unaligned_access_emulated_all_cpus() &&
> > +           IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
> >                 kthread_run(vec_check_unaligned_access_speed_all_cpus,
> >                             NULL, "vec_check_unaligned_access_speed_all_cpus");
> > +       } else {
> > +               pr_info("vector unaligned access speed set to '%s' by command line\n",
> > +                       speed_str[unaligned_vector_speed_param]);
> 
> On SiPEED MAiXBiT, unaligned_scalar_speed_param is zero, and it prints:
> 
>     scalar unaligned access speed set to '(null)' by command line

Thanks, Geert. I think unaligned_scalar_speed_param is likely 1 in this
case and we should be printing 'emulated', but I neglected to add that
string to speed_str[].

I'll fix this too.

Thanks,
drew

> 
> 
> > +               for_each_online_cpu(cpu)
> > +                       per_cpu(vector_misaligned_access, cpu) = unaligned_vector_speed_param;
> >         }
> >
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
