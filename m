Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238CA219E0
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 22:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750719242; cv=none; b=cVoXOb4v7A7UZilvKYuenjGHjt+Al9dXZlblE8euh/IxtBel47WbwWjOpakLoE6ZhzKu8O3JI0FBNS3/ql7GBIH6S44jkeIsDcZBGGlRqnXjBvvBh6v/1v1CRJUHrQkPY7sUaJPz2Pf59U+17whPRY6zD7sYcsHDVhZOjrxQ5zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750719242; c=relaxed/simple;
	bh=ln5KJwNMpbXs+4BfI4rMb8BAgDeRMkD4khetbY5rg04=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=fhwbrwRFnmhJZOsxtWMAIIxqvydu80F+Eo9gE27B5NcslJa3og1apnoP8cgqW4Z4AplGNKfMmYt7JlZx4Glwwb57goywO6vB3IIcZ0efc/iT1erkW9seJOJ+jJBThLUlKAbN0mtejRYV+IpxiQ9fPUfgWHSuwBSHyrpCaIeVoQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=ADvNseLd; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="ADvNseLd"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-748d982e97cso4245159b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1750719239; x=1751324039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VF7LW57cCFEi2hNBbg3wdBgr2GfXhP/R3PlTJsBQ0II=;
        b=ADvNseLddRCgOuCiniESUkeX136eUeaiPXwXumRDkJhWepnoPjP4nePrmDVFwY+7Af
         WYvrOSCKrSLn1b0ovuf/4mMihamkP9uUxLeHwBg/JXbqE9NDSaoEaI8wSn25Q76vTdL1
         x9GR/85gnftHVaW0SgsCm5mQlHQrQHcS6H5IikWFkT4hGjqJK36fahYm6lPecvLExUj5
         x37J/7J6TQZECn1cOzeVxAAW1MZQkRgFiqM995wl2W4wVTjPPy4jPZS0d3dvXYbp9+oY
         Emp1FYnbt3AcEyyvUAxUzWJ0feG8yUil8HV4vRpinpcrTzlsCdieZxybqUQ1Wgkdivba
         P5ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750719239; x=1751324039;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VF7LW57cCFEi2hNBbg3wdBgr2GfXhP/R3PlTJsBQ0II=;
        b=c7PHtCGoeWrNt+AfWJhCDR5htrp/13q4tIU7Z7EGzd1aXVE5qyvWfc5mzPvaesYfvq
         4cIcAdZ6NX43ieyXT2RwZzZtr8hyWz7C0nDmjzXMHegrrMTO0Pqzc96gB6kAXJNqIAdd
         7fIPBwn091naYqqBe8/QHo1k4SQd5Kv0YSqGzz0VSnEiMdjnzRJ5lGtf9C+83w2fSBbX
         n/KyGVS1A6psXtAZkyEALaJqb1FnfVe4KZ3ALNoyBLW5ARew1153PJ+xmotxbai+z0Wq
         OMcLpsan94k9b+WtH0cZZoG3Ro4PFEx+B012kZshB903Nty6ydXOmHP01z4tSfebU7p1
         nsmA==
X-Forwarded-Encrypted: i=1; AJvYcCU6wpQ1pv2bf/CtqjUXwbF7kNVwgDME4Rf0NpRsFcNs3NjRCd0+azvhOazVh9w4z2twLuW5lcjCPs7BY6s=@vger.kernel.org
X-Gm-Message-State: AOJu0YycmssgcW8f2yngi2VqGbNCs0m+B3lYk/ONsNVvOOc4PWGq5uSB
	qU4YSKZ88LERIgVHUhFTZ8OhuYtl5F7WP73I9TldjUTFNbZY+HXd0vuYBVVAghXg3jM=
X-Gm-Gg: ASbGnctaPWSrr504feemIlJ3w0XGLi5nPl1Dp3LMCfPp6sNq7x/gMsgaFeKKOOcKm/P
	kwDmA6ONwn+uBDYaz5ImB7jXQJ29WLhFsyIhdAyAXDykEWXIYv/4XGUKZ3EJqcouBLsY12H3IOT
	Sl3wxWp3xjpKsiQT5clOtiyMwGr2LsSzQNG2TCP3AwfWfjW+AdL6md+amQgIlY5PVJ6pdsbtT8B
	Fi5pE93Zy3O2TYNDpfv2hrfiKxF1sSvw/j06nk8U4FbV/vimu0kCOh/QVn+OKHmV42fj8+GTE0q
	K5bzBAfF4RnN/j5sZQpE929+MDWon7VLPT/gj8EDmAv5EYyieG4P1rrQ0vSS
X-Google-Smtp-Source: AGHT+IHPYxBbwWzfYVYSX5RUoq82qKJTDkiQtcM7tH8Zwp5Kzu9wEm4JpM4W84LXzDwaRm+Ru6dy6w==
X-Received: by 2002:a05:6a00:1804:b0:748:e38d:fed4 with SMTP id d2e1a72fcca58-7490d691e08mr23029362b3a.6.1750719239108;
        Mon, 23 Jun 2025 15:53:59 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::4:8d10])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-749c882cccfsm200194b3a.79.2025.06.23.15.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 15:53:58 -0700 (PDT)
Date: Mon, 23 Jun 2025 15:53:58 -0700 (PDT)
X-Google-Original-Date: Mon, 23 Jun 2025 15:49:24 PDT (-0700)
Subject:     Re: [PATCH v2 0/2] RISC-V: turn sbi_ecall into a variadic macro
In-Reply-To: <20250619190315.2603194-1-rkrcmar@ventanamicro.com>
CC: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, Alexandre Ghiti <alex@ghiti.fr>,
  Atish Patra <atishp@rivosinc.com>, ajones@ventanamicro.com, cleger@rivosinc.com, apatel@ventanamicro.com,
  thomas.weissschuh@linutronix.de, david.laight.linux@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: rkrcmar@ventanamicro.com
Message-ID: <mhng-C1133FA3-71C3-4ECC-B3BF-13DC7640464D@palmerdabbelt-mac>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Thu, 19 Jun 2025 12:03:12 PDT (-0700), rkrcmar@ventanamicro.com wrote:
> v2 has a completely rewritten [1/2], and fixes some missed trailing
> zeroes in [2/2].  The fixes in [2/2] are important for v2, because
> sbi_ecall doesn't fill the registers with zeroes anymore.

The SBI spec says "Registers that are not defined in the SBI function 
call are not reserved." and I'm not really sure what to make of that.  
Specifically: does that mean implementations are allowed to ascribe 
custom meaning to those parameters and might start doing stuff if 
they're not set to zero?

> In the future, I think it would be nice to have a wrapper function for
> each sbi_ecall, to make the code less error-prone.
>
> GCC isn't doing a good job with sbi_ecall.  v2 is a bit better than v1,
> because some ecall registers are not used in the assembly, but nowhere
> near good enough...
> The compiler doesn't consider static key'd tracepoint branches to be
> special, and prepares for trace function calls outside of the unlikely
> path.  Instead of a single "nop" for a tracepoint, the non-trace path
> also does a lot of pointless register save/restore.
> I'm looking for help with this issue in [3/2].
>
> v2:
>  * use linux/args.h [Thomas] [1/2]
>  * completely rewrite [1/2]
>  * remove __sbi_ecall [1/2]
>  * add some missed trailing 0 in pmu [David] [2/2]
>  * adapt to the new sbi_ecall that doesn't allow a single argument [2/2]
>
> v1: https://lore.kernel.org/linux-riscv/20250612145754.2126147-2-rkrcmar@ventanamicro.com/T/#m1d441ab3de3e6d6b3b8d120b923f2e2081918a98
>
> Radim Krčmář (3):
>   RISC-V: sbi: turn sbi_ecall into variadic macro
>   RISC-V: make use of variadic sbi_ecall
>   RISC-V: sbi: remove sbi_ecall tracepoints
>
>  arch/riscv/include/asm/kvm_nacl.h |  4 +--
>  arch/riscv/include/asm/sbi.h      | 55 +++++++++++++++++++++++++----
>  arch/riscv/include/asm/trace.h    | 36 -------------------
>  arch/riscv/kernel/cpu_ops_sbi.c   |  6 ++--
>  arch/riscv/kernel/paravirt.c      |  2 +-
>  arch/riscv/kernel/sbi.c           | 57 ++++++++++++++-----------------
>  arch/riscv/kernel/sbi_ecall.c     | 34 +-----------------
>  arch/riscv/kernel/suspend.c       |  4 +--
>  arch/riscv/kvm/nacl.c             |  7 ++--
>  drivers/acpi/riscv/cppc.c         |  4 +--
>  drivers/perf/riscv_pmu_sbi.c      | 49 +++++++++++++-------------
>  11 files changed, 115 insertions(+), 143 deletions(-)
