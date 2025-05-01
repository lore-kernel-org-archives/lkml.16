Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B9B1A314A
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 13:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746106580; cv=none; b=gI+bm52gQkv4slflNXhkA0ZkrNUpWZIz6NKGATdCpijt81jEjZCbc/uMVIXqXRtfpchxXsWqch6IZpW1YsEttQlm3vRa1wGFPCnonXLw38+g3nacV+EKK6KbXV0yQlNjW0BNOOOuP+32IvyvBM4no8+sPDvb4zHWfr4/fFMyPvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746106580; c=relaxed/simple;
	bh=fr8LlzXOX1DDJ3UKB4yXhV7JJkyml63H3YQLUXm/grs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LB9Ba42W/DtgRryARSlG+C9MblfGuVAvqmwB6LjkYT+aJtZvJ+VaxWNDFp/wmHm8b0oWe1/RuXPdmaF4gq/8T6D6yfPPT5XSlIF66nAJmGx8O+/Oex1BqK/7fb346SGCZJozgYxk+bEIKE8cB4IdxldzN2sBAA4C2ZaJVRNlN2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=Nmax+CAQ; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="Nmax+CAQ"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3d9327d0720so7344615ab.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 06:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1746106577; x=1746711377; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R5HbFwwkJF2Y2R1Vbj0ljcnhgzUV/rgTcfz1KnrFhCo=;
        b=Nmax+CAQD2omOzlkuMUvXJ2NitDOMGG+9XPZyvZjH+Gpb7NPmVKXLKJxjX6+UPumZK
         4J+iWgyVq3u5F9dd31/B0kQDC3pADSWcSWr+eYdTYWiPg7Cjic0AfteEj1nAn61sy1qb
         BDGUaiPPsgJduY/Mfe/iTJPbSavP3yj2JGiASCxO4G2te5ydNq5AOUDR3E3wZ+fLN4bv
         g3olmQUMsn/QGEohWiTaYdb4qik6AWDQKUMBu2JuFh8Uma4AKt0phgbqO44+SL9Ll+28
         YZS7DMqn8PrxqNDWrOo9aC9jkKpshaDSjF2+YlwpUtLXNA0vDhwMleyL1jrCXuiUznrX
         joog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746106577; x=1746711377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R5HbFwwkJF2Y2R1Vbj0ljcnhgzUV/rgTcfz1KnrFhCo=;
        b=o4uvgHsKkFiGt2WqQKG151cKOcB1VnLtGQeqQSvmG5mvQntxTiWLFfLdFX36bYv9hk
         O7tBbzyYhsSR61svgVOjyc7euyJX0HGzLMBDbqiY5mWiaTyTbx8SRqY2S8JdPuxACcCt
         4/rHIvCj7EDPWzbefHYFgARjrXnqumw9Qpu5Edwr+uv9glugHuMCPpTBw0FTbc/167Df
         +QKMs5l5V4AJNeZCi8mylZKQBb0gjQnRroTotZM2s7wa4qlcC80B0GCUqLpMP3wV3zez
         Ixv3SCIR3gLXqOfvJ4aqIc6JcdinGAuoo2wjnoQWrmeI/lti+uTT+u+dTfnPcJXkSXo/
         Pkvg==
X-Forwarded-Encrypted: i=1; AJvYcCXSu4GyaKSAbEMNZkVaeJB1MMgmAxHi175VhiZHDzfIgfsHXDoFWCMnK7BbqmEjiaqJAc3DZa/0m//bfbM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0VJG93vVo+/7M3OC2R+ifF4YGmN8mGNWobCIFWz1yePFD58H4
	b0svp75lmQmxkZ8jM3h+XWEwURrArgwgFBIpBGYgVUHkeqzuU5RsB7zEX7ro3UgdGHUCled+SbR
	2kKGuMPcn0rvUk10tBNBkMreL4HRXynXkrRw47A==
X-Gm-Gg: ASbGncuo/cnB0uo+zSflLGT8TaqB6LufpXPQicgdex19VUtuVHY8HNTiCMG2uWKPXQf
	c5KpXb7+0k3iE7b48aE58aZgDpolsdq5s4SW1c9/fVQEjVZD9TX4MGruJJQ8Jb5pj3Wl60cbxJt
	nxmDw3KlyU/B+oEetogTun4Q==
X-Google-Smtp-Source: AGHT+IHY7gd5DfteiMffTuTR2BB5tAOFnK6ac9kV3ASNuI57T6S+/lfY0TuUH0M3Tjf2aq1tEUdaJ7qOsG8AOHYTWno=
X-Received: by 2002:a05:6e02:1b0b:b0:3d5:eb14:9c85 with SMTP id
 e9e14a558f8ab-3d9676c6669mr79049245ab.6.1746106577095; Thu, 01 May 2025
 06:36:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430-kvm_selftest_improve-v3-0-eea270ff080b@rivosinc.com>
In-Reply-To: <20250430-kvm_selftest_improve-v3-0-eea270ff080b@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 1 May 2025 19:06:06 +0530
X-Gm-Features: ATxdqUElPYmtqqRS47Feed2BMb796DJHZOR_NiIu4niYbEKvJ9Q_aHmmUyE0IV4
Message-ID: <CAAhSdy0UAnmNHWNJBysuH93Mok5_AQB88uy0nHuiumpfGgiJfQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] RISC-V KVM selftests improvements
To: Atish Patra <atishp@rivosinc.com>
Cc: Atish Patra <atishp@atishpatra.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 1:46=E2=80=AFPM Atish Patra <atishp@rivosinc.com> w=
rote:
>
> This series improves the following tests.
> 1. Get-reg-list : Adds vector support
> 2. SBI PMU test : Distinguish between different types of illegal exceptio=
n
>
> The first patch is just helper patch that adds stval support during
> exception handling.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
> Changes in v3:
> - Dropped the redundant macros and rv32 specific csr details.
> - Changed to vcpu_get_reg from __vcpu_get_reg based on suggestion from Dr=
ew.
> - Added RB tags from Drew.
> - Link to v2: https://lore.kernel.org/r/20250429-kvm_selftest_improve-v2-=
0-51713f91e04a@rivosinc.com
>
> Changes in v2:
> - Rebased on top of Linux 6.15-rc4
> - Changed from ex_regs to pt_regs based on Drew's suggestion.
> - Dropped Anup's review on PATCH1 as it is significantly changed from las=
t review.
> - Moved the instruction decoding macros to a common header file.
> - Improved the vector reg list test as per the feedback.
> - Link to v1: https://lore.kernel.org/r/20250324-kvm_selftest_improve-v1-=
0-583620219d4f@rivosinc.com
>
> ---
> Atish Patra (3):
>       KVM: riscv: selftests: Align the trap information wiht pt_regs
>       KVM: riscv: selftests: Decode stval to identify exact exception typ=
e
>       KVM: riscv: selftests: Add vector extension tests

Queued this series for Linux-6.16.

Thanks,
Anup
