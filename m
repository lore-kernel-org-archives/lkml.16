Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FC615D5B6
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 17:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744305960; cv=none; b=i7DTzd8hJ0/Df1M1WDfwycfnljjOh/mnEHItC1I97lAn6T8zx1sY0tyWHw9y3Vrfl4ftHwx1vs/SDH5oQAOq7gz5q5gVDW+ve7JAe70pYwBHbNsxjvJDb81QLoM1o5D0QjDzmXNRK/NNcscHHnabZ0ppJsQZJaUzfU+1S26XUnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744305960; c=relaxed/simple;
	bh=FLF/5r8oYZt+614zupcSi6Sx/K7pEgVPtRfb1pPwOmg=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=j3oFJ3idKZzWMLdqkJG2H4RiPibnCZoOKP4m+lxOK8kIgE3NDlxAqD9ufdRCGSpUhF7l7fjP78gWL/QarwI9OHM/qacd+mD1oiEtIMEnjoITpMjfItbnEdUzI1POpUhPPQU5XtravUnRXS0wemTpFjvrOUmSweb4raS/5fph5/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=Ze3j80iR; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="Ze3j80iR"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-af19b9f4c8cso860325a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 10:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1744305957; x=1744910757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ig/FhwGwD1jLitbxX81FyIbAc6VmuE4TZHPbRttZ3+g=;
        b=Ze3j80iRMQz69RuqHof1AU0+hK5Y9oZK4JeSLLndGew0VyHfAPdHuayommwrVytlnd
         oJasj3mEcpfo49qDy1EAKo6m5c6XlhfSWylyAqjdvYYe1q9F2Agm5LxqRyaYtoEo89LV
         gB2sRBJI77Up9ilm5S893Dc01pEGDN5as9q5v9Xa7TgUbVUOmhQbGE5OAKdpvOCtCyUH
         qL80VQ8JYOCov1g1yRKjExKHHYqqSzxUJXZtc0at402jGFVbBs9C+haLdQDG+KiiSSQa
         f0BeCcAc6gWNJnFrBIFNuivdgfT33YwLr4WFLy5eBn5kpJ0GvmyP9Xw6jAjY2Wf0IF7R
         B6tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744305957; x=1744910757;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ig/FhwGwD1jLitbxX81FyIbAc6VmuE4TZHPbRttZ3+g=;
        b=DSrici9mPuo4fYenuyjzwMGwUEvE95rfkBPplwShPTPLyFGBvdxqYYL2HNoRjMJLhX
         J3MqKYm6TsuVPNu4R6TR7JvnUfwENXMqyikXnOZRXny8XvKkORERxouYM1nGDN7igE0q
         gVmke+GQElS1XpCi8TL62fWbvw0lAMZoa3osz/2ikFFJBPGJQjM5XWmr8SY+D3dBI+JL
         0NMxojKiVxWJN04nD0G6fMKZpk+Z4MlyK3ifIzhUlultxbyA+L3KKNliG8TWX49UAzRP
         eXmQAb/24CefL8sofbOtxN1Ks4+yI9ZsfDe5MD7mamZ9t369nRYKNohLLc7hj58g4DQm
         KTLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmWQn9qArQy81B+VEICp9Qb173RpfBDRXa8QGNgrLm+2mTe3ezm0g6gF8/eQPHZc1ZnCEV6c7ZgHk2DJ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOyYKxLkycBXm8BaCGOWFd9SL+zwfbEUBmoX75cdygQmKiH87g
	ZizXgp832Cfk/dLQTr/cANhhShvQt11/dkOC6ea1YvIEdiSYShpHSz/eeuzDGcI=
X-Gm-Gg: ASbGncuvlY7CUUylUICL6C+6LOsdsX9mzY59CmGReuuEj94TRbLQAHgEwa2Ky/+ENtp
	ob7aU+VQXynuRpx2pGEWmIYJlnAMqhajwalLyNNnFA4ZJlWGIQAqGwBuThlmo1eazwMEBic8+KR
	4RwvtMOvkgnrRJNXgjZMWCykW1FdRegieIjnFBQ8qmHzzzfIruSeqxwbZeYepUfoG1lltA7ybV/
	3X7y/M9+hYmj0i2xrs7FhahieLwopekgy4u5lEudPDC6pEnV8EFAr9e5NKIs7zXTpWXOnARksxF
	8DLgoDC3sRuiRsvQxiXSijcBwPpJgBEYNg==
X-Google-Smtp-Source: AGHT+IGsEtG4l/fsVtmjE6fIGvxm9O7zGTf6ZWhcCE4riLaK3/QbFCyU24k3i6IpZbiWZewa23zmSg==
X-Received: by 2002:a17:90b:270b:b0:2ee:d7d3:3019 with SMTP id 98e67ed59e1d1-307e5972f0fmr6092903a91.12.1744305957335;
        Thu, 10 Apr 2025 10:25:57 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd17191esm4373489a91.39.2025.04.10.10.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 10:25:56 -0700 (PDT)
Date: Thu, 10 Apr 2025 10:25:56 -0700 (PDT)
X-Google-Original-Date: Thu, 10 Apr 2025 10:25:52 PDT (-0700)
Subject:     Re: [PATCH] riscv: Avoid fortify warning in syscall_get_arguments()
In-Reply-To: <20250409-riscv-avoid-fortify-warning-syscall_get_arguments-v1-1-7853436d4755@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, alex@ghiti.fr,
  Charlie Jenkins <charlie@rivosinc.com>, ldv@strace.io, kees@kernel.org, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, nathan@kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: nathan@kernel.org
Message-ID: <mhng-cf999eb1-59c4-4784-8c01-44b1e2482a50@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Wed, 09 Apr 2025 14:24:46 PDT (-0700), nathan@kernel.org wrote:
> When building with CONFIG_FORTIFY_SOURCE=y and W=1, there is a warning
> because of the memcpy() in syscall_get_arguments():
>
>   In file included from include/linux/string.h:392,
>                    from include/linux/bitmap.h:13,
>                    from include/linux/cpumask.h:12,
>                    from arch/riscv/include/asm/processor.h:55,
>                    from include/linux/sched.h:13,
>                    from kernel/ptrace.c:13:
>   In function 'fortify_memcpy_chk',
>       inlined from 'syscall_get_arguments.isra' at arch/riscv/include/asm/syscall.h:66:2:
>   include/linux/fortify-string.h:580:25: error: call to '__read_overflow2_field' declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
>     580 |                         __read_overflow2_field(q_size_field, size);
>         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   cc1: all warnings being treated as errors
>
> The fortified memcpy() routine enforces that the source is not overread
> and the destination is not overwritten if the size of either field and
> the size of the copy are known at compile time. The memcpy() in
> syscall_get_arguments() intentionally overreads from a1 to a5 in
> 'struct pt_regs' but this is bigger than the size of a1.
>
> Normally, this could be solved by wrapping a1 through a5 with
> struct_group() but there was already a struct_group() applied to these
> members in commit bba547810c66 ("riscv: tracing: Fix
> __write_overflow_field in ftrace_partial_regs()").
>
> Just avoid memcpy() altogether and write the copying of args from regs
> manually, which clears up the warning at the expense of three extra
> lines of code.

You could still memcpy, but you'd need some sort of

    memcpy(args, &regs->aregs + sizeof(args[0]), 5 * sizeof(args[0]));

(or however you index a struct group).  I think it's saner to just do it 
with the manual copies, though, as I'd have to look up what this code 
does every time I run into it.

> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> I omitted a Fixes tag because I think this has always been an overread
> if I understand correctly but it is only the addition of the checks from
> commit f68f2ff91512 ("fortify: Detect struct member overflows in
> memcpy() at compile-time") that it becomes a noticeable issue.

I'm going to add the Fixes.  It's a suprious warning (there's no actual 
crash from the overread), but even spurious warnings are a headache for 
peolpe trying to build stuff.

> This came out of a discussion from the addition of
> syscall_set_arguments(), where the same logic causes a more noticeable
> fortify warning because it happens without W=1, as it is an overwrite:
> https://lore.kernel.org/20250408213131.GA2872426@ax162/
> ---
>  arch/riscv/include/asm/syscall.h | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
> index 121fff429dce66b31fe79b691b8edd816c8019e9..eceabf59ae482aa1832b09371ddb3ba8cd65f91d 100644
> --- a/arch/riscv/include/asm/syscall.h
> +++ b/arch/riscv/include/asm/syscall.h
> @@ -62,8 +62,11 @@ static inline void syscall_get_arguments(struct task_struct *task,
>  					 unsigned long *args)
>  {
>  	args[0] = regs->orig_a0;
> -	args++;
> -	memcpy(args, &regs->a1, 5 * sizeof(args[0]));
> +	args[1] = regs->a1;
> +	args[2] = regs->a2;
> +	args[3] = regs->a3;
> +	args[4] = regs->a4;
> +	args[5] = regs->a5;
>  }
>
>  static inline int syscall_get_arch(struct task_struct *task)
>
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250409-riscv-avoid-fortify-warning-syscall_get_arguments-19c0495d4ed7
>
> Best regards,
