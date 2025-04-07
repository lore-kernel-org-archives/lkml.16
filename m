Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9D21A9B53;
	Mon,  7 Apr 2025 09:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744019417; cv=none; b=Pt1UZJ0gJLW58Y49rsDF41yLfXw27AzXuVCN6eLIJXW/BCDUReXNmSnZboOXPMabMHBdyD99Witl1sjOl1/Dz+8LL0DJw6WwCsqGG6Ur6L1dQ5MNhlu5Mvd3mqhgeiOT9KJSJXYXu/TXZ8azhWuJZooh12b/u8XEHAwADvZPmuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744019417; c=relaxed/simple;
	bh=6EZg87o/e/Ezb0v27LIykCcNwmvzu3169z+nuaTLPkU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GVQYpetyDnpqSwOSFUy4+03ItGnHqHgRrmRV3YZgrK2vwwdgiuOQL5LsIhSbEptLpbiGz0q+2J3BxxBwH4awzvJE7Pu8PHaCCQcnnTsLz3JgFx6x3bAvQrJBx23EelMENl6iuQIGe4k1kvmVGnVwsj8070q3jvCwYhzYuHwsfxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5242f137a1eso1708067e0c.1;
        Mon, 07 Apr 2025 02:50:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744019411; x=1744624211;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hwJS9ivezLqTwGll2R8290UTJUlsdkM5bSWL9DkCvyU=;
        b=IQhavB+Wc3Dl+cWOH0GlKt+qvm6Razou+0a5CUhmdPu6TgrfSlwFHgupUFIZZ+2r3F
         mNe64ZVk46wYUCOjYkpa+yhXQ9k5NF5g05mHUkwH9vSDwT0dL4nJ4h5Yl7oH12SoRgsv
         S2+Q4fvaxrBtpn3edYq835NpOINh3aaGUMpEqhCO2hjoTWFIt37MFqiAMPUFJpE4O5fI
         4Lqj6JkTHS8wJru9f2k4NF0ZIMDVIFaWWPDStsXcM8AhjOgSQ4eZbJtUcwqiIMvZ4dHg
         MDA3xT+fWHGXcpXv+KTKsOZxR4jD5FwvRDNdYDA39X02Be1DTb2h3Goy/AWDGV7vYBzN
         WMTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWHIBe5+cS39tvHmprXZxtuVa2PlIKqTirx1dRrVAyy1jmBCD/a8w5VWGUV+vS9SYtiLU7BA1/yIg=@vger.kernel.org, AJvYcCXZjLipz37GGlkXHOaRR88+FNW83WsdLQIrxs6Cqa3glcxZAu4xRThZZWec8skYOJZ93taCCkhKRigY8/Fy@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5omq2wa4H2Oha+cgaA8ghS1NORrZd52h4Z16jXYJBWyPRSVub
	UwCJNnB0WuU8qC+RggdjJtVHx/xMfzYGEeoSW350JkpCthjrjJlWNbXbNdyI
X-Gm-Gg: ASbGncsKLdV7uPnWp8hTKijmf0GLiI7cnTK3JpIlw4iyL+HL4IG8nnDl0UP57f+VKdD
	vVLR5kAYBsPt29VD4tMhfnfrXftjujpdmU50cly3cFosph8x9Z5RZlt9+oLG/7n6jx8aAnx1ITE
	EGFZ5JuGtdewLe/M1Z0xULdU/gqIkRpXZjfVg62bMfXjkyeejAwuQEP2v+L4PT9GMOIzZQK/WQr
	Inqns7aaVRfuyTC7Lr7NbQKTW5LZFUQWm/ABbDUBjGzzlYQQu3qsArT86308KXqvtL/4+7iTx21
	ANXoafa15ojJ+ISEhs+Av7KVtcQ+6HQVWyKjiufC0of2nWYmYu7+Qmf8s25nIRZPWRLTz0mP3j1
	kMTltkgg=
X-Google-Smtp-Source: AGHT+IG+LGXvtXgA7O0hjlLFhWEKA7KVnisZ23gctOKnOlPWTasuIBhEpCvEdsjZ5qKpZODjXY8ENg==
X-Received: by 2002:a05:6102:3f87:b0:4c3:6ba1:4129 with SMTP id ada2fe7eead31-4c855482f61mr9768467137.20.1744019411668;
        Mon, 07 Apr 2025 02:50:11 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8738b28b9d5sm1697026241.27.2025.04.07.02.50.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 02:50:11 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-86d3805a551so1764265241.3;
        Mon, 07 Apr 2025 02:50:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUjpHb4HAn4bvD9KmhUQ/it+9ZzGcqBFcm48Gz7ccxqAUfJX/ZRh7Yv009jdp+a3LM3xQNsYiGaq8q7XSVq@vger.kernel.org, AJvYcCWCsmJmbPbZk0MO2ILj7isdguBq0ZmHl5KEUq80CSz+OZ72fFEGZULzpJ19m5twIqjalT5ffby4H64=@vger.kernel.org
X-Received: by 2002:a05:6102:2b8d:b0:4c4:e414:b4eb with SMTP id
 ada2fe7eead31-4c8553ddbd7mr9525973137.12.1744019410896; Mon, 07 Apr 2025
 02:50:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250304120014.143628-10-ajones@ventanamicro.com> <20250304120014.143628-17-ajones@ventanamicro.com>
In-Reply-To: <20250304120014.143628-17-ajones@ventanamicro.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Apr 2025 11:49:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVEp2_ho51gkpLLJG2HimqZ1gZ0fa=JA4uNNZjFFqaPMg@mail.gmail.com>
X-Gm-Features: ATxdqUHaYPJ6zIQIXr2E8SkaYlNUmpQxf0qo-hNfWxqixyfdWpOzgNBl8dhQdaY
Message-ID: <CAMuHMdVEp2_ho51gkpLLJG2HimqZ1gZ0fa=JA4uNNZjFFqaPMg@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] riscv: Add parameter for skipping access speed tests
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	charlie@rivosinc.com, cleger@rivosinc.com, alex@ghiti.fr, 
	Anup Patel <apatel@ventanamicro.com>, corbet@lwn.net
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,

On Tue, 4 Mar 2025 at 13:02, Andrew Jones <ajones@ventanamicro.com> wrote:
> Allow skipping scalar and vector unaligned access speed tests. This
> is useful for testing alternative code paths and to skip the tests in
> environments where they run too slowly. All CPUs must have the same
> unaligned access speed.
>
> The code movement is because we now need the scalar cpu hotplug
> callback to always run, so we need to bring it and its supporting
> functions out of CONFIG_RISCV_PROBE_UNALIGNED_ACCESS.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Thanks for your patch, which is now commit aecb09e091dc1433
("riscv: Add parameter for skipping access speed tests") in
v6.15-rc1.

> --- a/arch/riscv/kernel/unaligned_access_speed.c
> +++ b/arch/riscv/kernel/unaligned_access_speed.c

>  static int __init check_unaligned_access_all_cpus(void)
>  {
>         int cpu;
>
> -       if (!check_unaligned_access_emulated_all_cpus())
> +       if (unaligned_scalar_speed_param == RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN &&
> +           !check_unaligned_access_emulated_all_cpus()) {
>                 check_unaligned_access_speed_all_cpus();
> -
> -       if (!has_vector()) {
> +       } else {
> +               pr_info("scalar unaligned access speed set to '%s' by command line\n",
> +                       speed_str[unaligned_scalar_speed_param]);
>                 for_each_online_cpu(cpu)
> -                       per_cpu(vector_misaligned_access, cpu) = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
> -       } else if (!check_vector_unaligned_access_emulated_all_cpus() &&
> -                  IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
> +                       per_cpu(misaligned_access_speed, cpu) = unaligned_scalar_speed_param;
> +       }
> +
> +       if (!has_vector())
> +               unaligned_vector_speed_param = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
> +
> +       if (unaligned_vector_speed_param == RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN &&
> +           !check_vector_unaligned_access_emulated_all_cpus() &&
> +           IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
>                 kthread_run(vec_check_unaligned_access_speed_all_cpus,
>                             NULL, "vec_check_unaligned_access_speed_all_cpus");
> +       } else {
> +               pr_info("vector unaligned access speed set to '%s' by command line\n",
> +                       speed_str[unaligned_vector_speed_param]);
> +               for_each_online_cpu(cpu)
> +                       per_cpu(vector_misaligned_access, cpu) = unaligned_vector_speed_param;
>         }

On RZ/Five:

    vector unaligned access speed set to 'unsupported' by command line

However, this is not set on my command line?

Apparently this can be set using three different methods:
  1. It is the default value in the declaration of vector_misaligned_access,
  2. From the handle_vector_misaligned_load() exception handler,
  3. From the command line.
Hence the current kernel message is rather confusing...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
