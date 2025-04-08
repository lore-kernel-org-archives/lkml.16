Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9804C8F5A;
	Tue,  8 Apr 2025 15:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744126372; cv=none; b=HUkmgSc/EZ0+ZEVMs4G9IPHZSuZE7Nrr1ddNmQBTvY3JpMGN7h1pYdP5tp5LgudnXwVvf64on8AhKtScz+1vSBlFFPyTMIqHj+HTxmM3lOzwjY7xMsnz989k9T8M8GzSILzF0b1OlRoZfbVRqFXa1ffvwyI42Kr4We6uSfVPfWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744126372; c=relaxed/simple;
	bh=+SSZrN8wkNSkmcTPKV2yxkI5mq1uBPzghaYSVyoz1kM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qbw4IvKVbcTvURVSTqdqDo4XQ2SQoWFXyajBbcQx0sX8p8ck4a5l0QiUiP4sf0QReYiwQPlnjowAXi2zpVffOCNZU4hXrVm9cxfRm86p1Uc2d4UNunPtju6geZJ8n/loD+wR0KEK4XBAFNOxBW7tDSbtRQF0Tlvwvv6i1JnfNkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c592764e24so609777585a.0;
        Tue, 08 Apr 2025 08:32:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744126366; x=1744731166;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sWauuTJeBzaymof//eJXjaRWpKnp1jf/EjofEIpiwYM=;
        b=rJkYVdUM9T9zUTnBCTlEoIDocRsli4DGBTO8bgBomQGIhzPN9dhv/Zi4QDuRrr0M/t
         YRxpoufH1/hYgoDV6ayVrXUQiO/4OJzhX21WJCXMPgQ6vo6LaFoVD8FK50SOIzTfEFOo
         2LPGEYgFZIcNy5uqFihHLAItfLYtiwSJGf6Sol+A7PRcJ+LbO9OGdSLTxUJhQGoZ5DhI
         WX5ySE0HNgazLW3zSJKbwZSBa9+cUbD9LyYXh7/aaEpCr9JzdBA3nFcJRNUfdoAoLAnn
         0fx4O8RTw/GE4MPIylIXYOfgCKswV6qHUEbZOsYHtPvVpK9rRTLV2MLvJJNYpcGNmXZQ
         7l6g==
X-Forwarded-Encrypted: i=1; AJvYcCWHxZxu3YVExsB5pFHH1H8JhMB2mZ9cXMZNXXxpdBSBGHHBKMXPXcfFzIplDrNbZ0+UqTN1YYQQ0jmEyQxo@vger.kernel.org, AJvYcCXvHflDVvgVMkORnxGLI0MS1Uc+k8+/LTJmzmhLzcl+v2fa0gqIj8nF4pliTgwoUCa/JNDK0iQURjo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEdaoeggrP8OqAoKpCASXW+pJfm64WNNYJr1lLTMvseHwoGSuY
	HXo0ZkZ6pKSAKhaumXcQGCJ4KAwj78ZZGqxkV5Kw5gWPiKETlubK4IfRm2i7
X-Gm-Gg: ASbGncuw5AYD/VdzgcY78MaF7UlhKTuX49UZbqHmM4K8eLh6X48YYza+DyxQ2l0rmjt
	Ku6KZsnAXBadZS5fHU/uMg2JREA1/CLiFn70mhNZZkACdAJ3+0jrrddpZ5Q7pUNtYdRVyKEG3eH
	5nTDcMRNDnybWnWU7SxPRQyTjGA3mhGaBdiV82JLmIrJUZxFrJc3QzG5/5U/WfMDaZCZ1aw14zF
	kbT+Fr1js4dz3uQR+wdn1sKfbcxVU+yJl0/GFIgwoDLaBE6wytY+v/k8dJiwbLNBsH9oN/TdPv1
	ADJeZ+ci26dAzgQuwfvgpidQCkTjoLSpX5Ll62zOUOKd9Cqkgdo2SZvBtNIbPyrkco41dGPS04T
	4qKm8YrsfAH0=
X-Google-Smtp-Source: AGHT+IEnSFlTWDZfMJvUU/4uP24DOXtgkU62MH/Q/dBTDsUnHEqB2uN53fLWdR7eyScBn51RG/GyvQ==
X-Received: by 2002:a05:620a:2889:b0:7c5:94ec:5114 with SMTP id af79cd13be357-7c79409bf63mr553112485a.18.1744126366028;
        Tue, 08 Apr 2025 08:32:46 -0700 (PDT)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com. [209.85.222.179])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c76eaacff9sm775018985a.116.2025.04.08.08.32.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 08:32:45 -0700 (PDT)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c54f67db99so644762285a.1;
        Tue, 08 Apr 2025 08:32:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUL/6as5KGbJiouwF8WqWoagu0I/h8FuGneNwELWOly3XNUc8AglEmPTnBjyOaIzPt88Ek9CEqGUw+WKh2J@vger.kernel.org, AJvYcCVyM4Hr15y91RT2Q0ZSKlNw9FVZOq0iwUl57hrFj6Mdd2rLbR/zksYh8xoYciGybWW+Zd0Br5uMRWM=@vger.kernel.org
X-Received: by 2002:a05:620a:4150:b0:7b1:7508:9f38 with SMTP id
 af79cd13be357-7c79408f423mr535672885a.16.1744126365206; Tue, 08 Apr 2025
 08:32:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250304120014.143628-10-ajones@ventanamicro.com>
 <20250304120014.143628-17-ajones@ventanamicro.com> <CAMuHMdWVMP0MYCLFq+b7H_uz-2omdFiDDUZq0t_gw0L9rrJtkQ@mail.gmail.com>
 <20250408-f3b5934a901bd24c1c800c8d@orel>
In-Reply-To: <20250408-f3b5934a901bd24c1c800c8d@orel>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Apr 2025 17:32:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW8DBfGNVkeY6qLv-eN=mjRKW3qUbXvEn7sLdA61QRfcA@mail.gmail.com>
X-Gm-Features: ATxdqUEIXkJ1UlfuGjCURKEaeAQ-DRYOLV6RZU-cgg5H0QCozGCmtM1pj04if88
Message-ID: <CAMuHMdW8DBfGNVkeY6qLv-eN=mjRKW3qUbXvEn7sLdA61QRfcA@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] riscv: Add parameter for skipping access speed tests
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	charlie@rivosinc.com, cleger@rivosinc.com, alex@ghiti.fr, 
	Anup Patel <apatel@ventanamicro.com>, corbet@lwn.net
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,

On Tue, 8 Apr 2025 at 15:03, Andrew Jones <ajones@ventanamicro.com> wrote:
> On Tue, Apr 08, 2025 at 02:25:12PM +0200, Geert Uytterhoeven wrote:
> > On Tue, 4 Mar 2025 at 13:02, Andrew Jones <ajones@ventanamicro.com> wrote:
> > > Allow skipping scalar and vector unaligned access speed tests. This
> > > is useful for testing alternative code paths and to skip the tests in
> > > environments where they run too slowly. All CPUs must have the same
> > > unaligned access speed.
> > >
> > > The code movement is because we now need the scalar cpu hotplug
> > > callback to always run, so we need to bring it and its supporting
> > > functions out of CONFIG_RISCV_PROBE_UNALIGNED_ACCESS.
> > >
> > > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> >
> > > --- a/arch/riscv/kernel/unaligned_access_speed.c
> > > +++ b/arch/riscv/kernel/unaligned_access_speed.c
> >
> > >  static int __init check_unaligned_access_all_cpus(void)
> > >  {
> > >         int cpu;
> > >
> > > -       if (!check_unaligned_access_emulated_all_cpus())
> > > +       if (unaligned_scalar_speed_param == RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN &&
> > > +           !check_unaligned_access_emulated_all_cpus()) {
> > >                 check_unaligned_access_speed_all_cpus();
> > > -
> > > -       if (!has_vector()) {
> > > +       } else {
> > > +               pr_info("scalar unaligned access speed set to '%s' by command line\n",
> > > +                       speed_str[unaligned_scalar_speed_param]);
> > >                 for_each_online_cpu(cpu)
> > > -                       per_cpu(vector_misaligned_access, cpu) = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
> > > -       } else if (!check_vector_unaligned_access_emulated_all_cpus() &&
> > > -                  IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
> > > +                       per_cpu(misaligned_access_speed, cpu) = unaligned_scalar_speed_param;
> > > +       }
> > > +
> > > +       if (!has_vector())
> > > +               unaligned_vector_speed_param = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
> > > +
> > > +       if (unaligned_vector_speed_param == RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN &&
> > > +           !check_vector_unaligned_access_emulated_all_cpus() &&
> > > +           IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
> > >                 kthread_run(vec_check_unaligned_access_speed_all_cpus,
> > >                             NULL, "vec_check_unaligned_access_speed_all_cpus");
> > > +       } else {
> > > +               pr_info("vector unaligned access speed set to '%s' by command line\n",
> > > +                       speed_str[unaligned_vector_speed_param]);
> >
> > On SiPEED MAiXBiT, unaligned_scalar_speed_param is zero, and it prints:
> >
> >     scalar unaligned access speed set to '(null)' by command line
>
> Thanks, Geert. I think unaligned_scalar_speed_param is likely 1 in this
> case and we should be printing 'emulated', but I neglected to add that
> string to speed_str[].

No, the value of unaligned_scalar_speed_param is zero.

> I'll fix this too.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
