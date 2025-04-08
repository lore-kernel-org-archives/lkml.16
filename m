Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9808C269826;
	Tue,  8 Apr 2025 12:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744115128; cv=none; b=C681ZjIRwanpFoXBjYPPtG6+letLED1JCzX/SvAg0gD2+bP7BF9r9tAkzSMpl6tk0egB501WmL/PVTDCG90vwxZOF88tOvCexw3CwDjXf6Q1U5E8ZYtcpU7kyC9K4Y/GU56TjEPXd5mbnB/8/Heo+ijeUm5H0vfIEpckyL/7hhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744115128; c=relaxed/simple;
	bh=q1jkh9I9N+So/TSdR5rnwLOgr5qtqJuzpIreiQQxnI0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KIma263YvChOHEHKPvyaPv5kwRa7q52WMecS/gynn88DelhRQxQ1cFzcuV5uCNdUD4f9+VXbYjn+/QsZ+U3hLXljb0z7GqEKPluoNY+EmawW6tSRsVjgcXqoC8ZClD19TGltAuIhzuhXbHPO3yiBmm0528YseJ5NI7hppl0YVWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-523ed8ac2a3so2518513e0c.3;
        Tue, 08 Apr 2025 05:25:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744115125; x=1744719925;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YmoVRqhsoNOnjL4BFQMw5QTZ7bwxA2SFbH5ALW0olS0=;
        b=BxU/qayrQ1bpVQHs1/aL7erwiyciroT+tFrNNWH+rMKL6D3ZVrkE4CUP0QTqN9rG1W
         ow7iuUdxagh8txSTluSVL8NnKh6KmY1a/PDmpQ3/HqjxvRWQI5gu2NYo4XUPNioj3Kup
         NwZjLU+YXOfzNTbFFSHauFCzuqLJ7EnlMgwLvsa/mdDryfl21NCnuG2SeCW1xgU93EEc
         YTgWKKfOpdaXKWKe/GrcwrOerdYa5kVvCt9kWMRA6EqjCIT0DdEcePyqJ+AB53zwIoKA
         bigOfbvwd9J0EfVR9RcvpeISFrMyf3cD5zt2cRgImGlStK//SqC57CpI8byg26d+BB03
         26nw==
X-Forwarded-Encrypted: i=1; AJvYcCWfrRIL/CRAbSIuIhsmFqvlG3CdohhwYbAl553kFwJ2xaD4dn9nqRUarfjn14yxL2pqnLymn9tazik=@vger.kernel.org, AJvYcCWw+SwK9GLjibjv8IqZBfl3ghs1KNbgh5q/bfDSjdr/5OBXNYmQUiAff2oW5+fLDKZ9prff/+ML29Sk7ozI@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8zXK9Xz3e/2S1lLtdZ12C7ycnC+mFe/8GUCgiEWiqCATbvFnZ
	dtSkHCk9gM2PXzDcpuiKTqflmcdOcI6Z45lftS5wySRJv2ImWQNPvWs0M/4e
X-Gm-Gg: ASbGncsJWlJ0xnzxtySqgBh5THhnxd+7xS+Tp+sOwK1rpjf8hnlspT9ykqpRcgvVMow
	xtYMfNE67N2zD3LZfze8gC4ilE9ZdYjryw/QMcLGPcLuvIR9Q1ClKYZzjOCUorYWg22YEtPvsXk
	OHoWCGBJrMwlWdUe6iL2QQF9HrTUyJwdegMhH8oAgkjz25RzlWECransnb4OflV/+NnlWRqG9uW
	hJNL0ZwoU2nmKj9zxpLqccCvWYnvrS3kLY8NFew7VIsHzp9NR59S3uCg50YdnUAW3wyJk1MxUvY
	QL0R0DnoaQZ/F47wCyor4T2lC+4PkIZejhOoUWSz59aOXgtFDqJDBUJ36u2sjE4X+pbhaZpWRkn
	1aMDxw6c=
X-Google-Smtp-Source: AGHT+IE98um0SMGWRQoWe+KKoOaXhjZ1MG9d5vC9cYFE/YwSSW16LET9eOJxz9CymBWXwRxcC+LDEw==
X-Received: by 2002:a05:6122:1daa:b0:520:42d3:91aa with SMTP id 71dfb90a1353d-52765c23063mr10218516e0c.2.1744115124693;
        Tue, 08 Apr 2025 05:25:24 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5279b560b68sm348415e0c.10.2025.04.08.05.25.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 05:25:24 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-86d3907524cso2338308241.0;
        Tue, 08 Apr 2025 05:25:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVhYHZ6HqEmViGoRi0KhfNVzlpAaIeSkAdja8/O61E3Y78CAc/uit4iEGAEaysb/6MwdNeW40sbT9o=@vger.kernel.org, AJvYcCWmOWe2ei21MdvERnGx/l6i+nfBe5Nwoa9PHH1RugBUw4eMvUB2MnOInqsSX250v/J1flBSXxrvhkGZ1kHa@vger.kernel.org
X-Received: by 2002:a05:6102:26cc:b0:4c3:6568:3e18 with SMTP id
 ada2fe7eead31-4c85690b98amr12382088137.15.1744115124280; Tue, 08 Apr 2025
 05:25:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250304120014.143628-10-ajones@ventanamicro.com> <20250304120014.143628-17-ajones@ventanamicro.com>
In-Reply-To: <20250304120014.143628-17-ajones@ventanamicro.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Apr 2025 14:25:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWVMP0MYCLFq+b7H_uz-2omdFiDDUZq0t_gw0L9rrJtkQ@mail.gmail.com>
X-Gm-Features: ATxdqUEuseQfSHMyqp5jGlJCXh669euLgXjsEcSvlR6s_zvJ4hVoqMyGWzzcwFc
Message-ID: <CAMuHMdWVMP0MYCLFq+b7H_uz-2omdFiDDUZq0t_gw0L9rrJtkQ@mail.gmail.com>
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

On SiPEED MAiXBiT, unaligned_scalar_speed_param is zero, and it prints:

    scalar unaligned access speed set to '(null)' by command line


> +               for_each_online_cpu(cpu)
> +                       per_cpu(vector_misaligned_access, cpu) = unaligned_vector_speed_param;
>         }
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
