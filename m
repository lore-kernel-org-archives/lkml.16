Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3510A42A82
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 09:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748080743; cv=none; b=Ncfk4Foh4O/yGvG0DPTVKAKNJySqx0+PkQp1YyR5NyIl+/oKJR7XENuYD+S3Jbhw1hHdzTB9Y7kiMxBHB2CTIzwxyOOQN9yeR5Rw6sdeoqitxMTaYt1/nH0Ss4sWJY38ELlojyIODM1JhGkAtyfSYfYELHhp3hIjiCTqRiulDR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748080743; c=relaxed/simple;
	bh=6djbi7tpYs9BrnKk/M63cyAzvlM3d4x2aiJII8rNxAg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QXM+DtOMY5M2gMzkMOEMF6/PqP2ZT4SKjhOK9V2XTOCa5Ecemtu3A3FkzcVzt97FgIMPjBfg490qozhGI5xLXPHIv3qertnZJscb/xP6zqHExqdqvDP7WPatCSb+KqRs16o2KolyXiZpMD2eFUIqRvKP89yOZYr6QvSbSwrwVqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=he+c2+VV; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="he+c2+VV"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-23211e62204so4039965ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 02:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748080741; x=1748685541; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ocqLAxbpTW/1bNifKrnMpLx5onXsOQ4I8/YyBr4SuME=;
        b=he+c2+VVFqqL6v881zGH07EvOvvd4X1jhor16Ve7AIO5Zx1Iybeq1oTuDbMQtOJ8vA
         Nk+GzSqSgr/kjomYQQOgjyq8pvKu8aNW0+fu9QDuy3/7p5NEYdHvlY/kYp4+hOoBmo1D
         zPeuigHAcYi7LjjpE2fzeMlDrLsgkPc78Da5U9Nuin5pTHagXJfLf5j2eTVYV8IunxFk
         BlXaW7theas75yLGKfWwIs4u6TCLjgB1866ft3Nqp/S8FO95fn6TQgMXt9XAAq3Z7KoO
         gBXLTVMxuphXFPMRCR98r+kolvKzForyejAcRqiJNSDHD2/jeWMp72tIJmTfcuprAcyx
         J6oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748080741; x=1748685541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ocqLAxbpTW/1bNifKrnMpLx5onXsOQ4I8/YyBr4SuME=;
        b=sg5PsCjn4x/Ft+Y6QlDAlOtIfRsfPXrBdas15p4rprZzcEMjl6fnAE5BvR7Rrl4c/T
         T5OYHXgIr2P9RX7ihnQi1coMKurHqzGK4iX9pfcYQFiPefWT6Pbrt+YkOeMje7mJt4q3
         P0JEQTrkwZ947mGR7/7CUsVgltmOxBBLJ3vIWcRqLcpJR/3L5TCv/cgIL0gwMX9WuD4F
         m6cBTuCnWLs8jc4/30BviwVy7IUztDsrzcapvVvz6xmM7850slIwRpIl/I/pgTF9EyF8
         onjGSDB2wcfkhCvbVYXjpu/ZfWnhblvw9B6WIEast4L3eBME2N/Jnp2NgK3KKf00gTzS
         faQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNtohu1wigl5B+gPYp30mNRxGDljchgiIrK0qGsbpEY0xCe5/BnBzya6+ibEpvxypYJrPlVcPL6WhxH8U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJIkVHYx2UeTOXYLPpMo70j2jWIYioKEwzNKc4lXPGkgcJPUt0
	UesbpWazUVK/7F1GUeyHNa61fR3Xxo3V+RYUCBF3RojJamhvgdAogchfjH/f+i7L83tjQchXZAk
	vNrujmbTl9T7I1T5+8lEHIXZljnagWUU=
X-Gm-Gg: ASbGnctVeFNbDti3jxklh5FiSQFFmBk6zPi3PyiGklOtnto9lmpqN1wZLpj1a38Xee4
	8sfkcnGWIrVcksHAtmWtciiny8PdO7Q8cWhJ2qNmO0/Rl58bXA21r00SsP8p972jRMC6h7V71T3
	Q42CkjcTfj2JW2BhyNZdwRsQ7zSWGXxMkArl1qpYiZ2g==
X-Google-Smtp-Source: AGHT+IE2sJJFpm2zYNhCrus6o9Tm+1hB4Bg3tMkWf1PFaZiAQHE8PnsnYumXo8N/QCCiUYm8Wmp3OzwjLE3tKYEyCUg=
X-Received: by 2002:a17:902:ef51:b0:223:47d9:1964 with SMTP id
 d9443c01a7336-23414fd3b2emr45444455ad.34.1748080741145; Sat, 24 May 2025
 02:59:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <9b9eb2337f3d5336ce813721f8ebea51e0b2b553.1747994822.git.rabenda.cn@gmail.com>
In-Reply-To: <9b9eb2337f3d5336ce813721f8ebea51e0b2b553.1747994822.git.rabenda.cn@gmail.com>
From: Andy Chiu <andybnac@gmail.com>
Date: Sat, 24 May 2025 17:58:50 +0800
X-Gm-Features: AX0GCFux6boRM43dnlNp6p2jvrWngA0EVcz9p8sBEXUaLJRJcqD4WZqCUVorpU8
Message-ID: <CAFTtA3MaXonbwnVpCPiOZKem86pkxdPcdxjdQqC5Ywrd8RMHSQ@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: vector: Fix context save/restore with xtheadvector
To: Han Gao <rabenda.cn@gmail.com>
Cc: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Charlie Jenkins <charlie@rivosinc.com>, Jesse Taube <jesse@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, 
	Xiongchuan Tan <tanxiongchuan@isrc.iscas.ac.cn>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 23, 2025 at 6:26=E2=80=AFPM Han Gao <rabenda.cn@gmail.com> wrot=
e:
>
> Previously only v0-v7 were correctly saved/restored,
> and the context of v8-v31 are damanged.
> Correctly save/restore v8-v31 to avoid breaking userspace.
>
> Fixes: d863910eabaf ("riscv: vector: Support xtheadvector save/restore")
> Signed-off-by: Han Gao <rabenda.cn@gmail.com>
> Tested-by: Xiongchuan Tan <tanxiongchuan@isrc.iscas.ac.cn>
> Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

Reviewed-by: Andy Chiu <andybnac@gmail.com>

> ---
>
> Changes in v2:
>   Add fix tag
>   Improve commit mesage
>
> v1: https://lore.kernel.org/linux-riscv/c221c98dc2369ea691e3eb664bf084dc9=
09496f6.1747934680.git.rabenda.cn@gmail.com/
>
>  arch/riscv/include/asm/vector.h | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vec=
tor.h
> index e8a83f55be2b..7df6355023a3 100644
> --- a/arch/riscv/include/asm/vector.h
> +++ b/arch/riscv/include/asm/vector.h
> @@ -200,11 +200,11 @@ static inline void __riscv_v_vstate_save(struct __r=
iscv_v_ext_state *save_to,
>                         THEAD_VSETVLI_T4X0E8M8D1
>                         THEAD_VSB_V_V0T0
>                         "add            t0, t0, t4\n\t"
> -                       THEAD_VSB_V_V0T0
> +                       THEAD_VSB_V_V8T0
>                         "add            t0, t0, t4\n\t"
> -                       THEAD_VSB_V_V0T0
> +                       THEAD_VSB_V_V16T0
>                         "add            t0, t0, t4\n\t"
> -                       THEAD_VSB_V_V0T0
> +                       THEAD_VSB_V_V24T0
>                         : : "r" (datap) : "memory", "t0", "t4");
>         } else {
>                 asm volatile (
> @@ -236,11 +236,11 @@ static inline void __riscv_v_vstate_restore(struct =
__riscv_v_ext_state *restore_
>                         THEAD_VSETVLI_T4X0E8M8D1
>                         THEAD_VLB_V_V0T0
>                         "add            t0, t0, t4\n\t"
> -                       THEAD_VLB_V_V0T0
> +                       THEAD_VLB_V_V8T0
>                         "add            t0, t0, t4\n\t"
> -                       THEAD_VLB_V_V0T0
> +                       THEAD_VLB_V_V16T0
>                         "add            t0, t0, t4\n\t"
> -                       THEAD_VLB_V_V0T0
> +                       THEAD_VLB_V_V24T0
>                         : : "r" (datap) : "memory", "t0", "t4");
>         } else {
>                 asm volatile (
> --
> 2.47.2
>
