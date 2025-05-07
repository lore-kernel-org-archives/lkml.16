Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED8C139579
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 06:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746599915; cv=none; b=GMIsPwqLgx0TgwxUPIB2F3bBRtRMS6kvGrUb9OeRD/AZIxJ56yNTubBeJYpnYqpAI18a1RqacSQfvScBYFLmCzRJmYNQmNer9USDEBpKBYikjAMzS00RzWWyxlzh8srGZl7cYKV+Rj67LT3GhatQbW1TShIrYzBAQ5CxV638eeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746599915; c=relaxed/simple;
	bh=FMz0xL1Cwnszn0V3OnOQdvE86LJBrAEHmyJ8pPb9gko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aJ2yKX0S9wgkvMxgi68biTnC3mDNvAcEWsc01PTn8CFDN7Jq9iJ7tnQV4SpB4h8wzIft9uXDKRZbVM4zBlNNlkEnJHG8Mku17ImBQUOXjtnJFWJXyoyX7sdseYphCJpRet60Ps7j8SASiCZi4kChFdiT+Vo6dW3sDY27jOHs9Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=tw13pxsB; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="tw13pxsB"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3d4436ba324so57578315ab.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 23:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1746599913; x=1747204713; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SLSCTSvU1Pu3KZzXKgSBgnw1+cmm1sdq2UzaECQAViA=;
        b=tw13pxsBDZFlG2oOiQZjyah41ZFT4uuuUUBkuVgBXTR/MycERvyapnQnUuW/wtjw/k
         OABCRMCq1tf5rdOqmu68OXQaNzZfIEp/UY5HTjymD6VNuFTi9SL8eLvCspc6TWhd52MJ
         Zgkp/ksmZTI/knVqvr38DfMxMsm3ZvtpP6dItf39Th3ROKv9qv9SZ7egg738reIKQdH1
         s73DYQljbAcMCV8ZUawvRDk1NyJeagKpXsYGnMOLm0AVLdvDX1KFYosBKGxr+SjtSvb0
         gwWd2c1ID9q2K3zGBTTI1VyHNS9efbIAagHxuUh0J1DmUNm5GabTExjdOJz19yo9ZjFE
         QVag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746599913; x=1747204713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SLSCTSvU1Pu3KZzXKgSBgnw1+cmm1sdq2UzaECQAViA=;
        b=JbIwaiwcvUPEPWPYPjshbtTJKr8gS/dOFeTfsXfeyds+fjyBy1dam+g5Odm2x11Vap
         m21ALJSimO6lVJu66eV0oefIivFj1MxRDpzBjXpuYvy/1FSADKsvG/QxFvYqHBe0d+EW
         2wvFD6OPYSElxfh5bcvzmICbyJ84deWL1oARyU1RhjdkZS5vV/gUzbxpgMATKo5rioXR
         DEweC8m4+UE10BsQdf9f325JufadAt0EwaR1oO8/Bvh5UnBECuvL9uGdMofwhqynrSIP
         kxe0s6YVaKDYdxabq3fHDdXWOielf5vFcmW6xRukwx6gHSfw1UckQ2+TICVhvyt5tiFx
         YpEw==
X-Forwarded-Encrypted: i=1; AJvYcCX0MXpKc5A3ePRyGxYQXLPBld2476BgHTSBQZfOipAhynWcqLsM7Z0+cqa5deRAXvQhHZm6GLf4MVN9Pl8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2/FO+qqIo3IBJqTwWqrWbY6WhPbCBr8Fwaamt1UM4MI4HIe1d
	BSoEcJr2iUHz17vALcQ4PCC/2e7shZoRMh7XQo+KK9N2PacLhWOWnBzc1rJtOD5DRwK/P9JxXrj
	Ek3FdvR02jDqTFfDT19FPcZCt/Z/4rSfwXboAvQ==
X-Gm-Gg: ASbGnct2n+qN3lEfud9pJl6YrXcKJ2mWyr+0KB9LRDqc9mQTHy9ymTlfAxMljFPjs13
	/rMh4ZencNQj0sJvvbPU3OEMldB+w1DB72lhzv+as2w66GBK8KdxUjjKxILzmfIczll4TkPfkTO
	Qw7CCQ+/ft/eSi+DsbP8ij
X-Google-Smtp-Source: AGHT+IHf27rispqj66mqizfYO/3jAKoO4k+nD2tMDDWQ6j9J0hfCfqo5ejjOrQE39XLxzrAH6W+8xBqOHYZ/XCR2Qq0=
X-Received: by 2002:a05:6e02:3d83:b0:3d9:2ca8:dda0 with SMTP id
 e9e14a558f8ab-3da7393603amr23647845ab.22.1746599912818; Tue, 06 May 2025
 23:38:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250505-kvm_tag_change-v1-1-6dbf6af240af@rivosinc.com>
In-Reply-To: <20250505-kvm_tag_change-v1-1-6dbf6af240af@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 7 May 2025 12:08:22 +0530
X-Gm-Features: ATxdqUEEO9ElPqopLSdn1cGhHTcD6oP-eNKU_g5Vu-IabLPJnfhIVALu0OXu3ns
Message-ID: <CAAhSdy0pdqnUa-GWiGHG3H_J9=J2yGXcRLfzsZgDzaZv+6r=jQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Remove experimental tag for RISC-V
To: Atish Patra <atishp@rivosinc.com>
Cc: Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 1:17=E2=80=AFAM Atish Patra <atishp@rivosinc.com> wr=
ote:
>
> RISC-V KVM port is no longer experimental. Let's remove it to avoid
> confusion.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/kvm/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Queued for Linux-6.16

Thanks,
Anup

>
> diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
> index 0c3cbb0915ff..704c2899197e 100644
> --- a/arch/riscv/kvm/Kconfig
> +++ b/arch/riscv/kvm/Kconfig
> @@ -18,7 +18,7 @@ menuconfig VIRTUALIZATION
>  if VIRTUALIZATION
>
>  config KVM
> -       tristate "Kernel-based Virtual Machine (KVM) support (EXPERIMENTA=
L)"
> +       tristate "Kernel-based Virtual Machine (KVM) support"
>         depends on RISCV_SBI && MMU
>         select HAVE_KVM_IRQCHIP
>         select HAVE_KVM_IRQ_ROUTING
>
> ---
> base-commit: f15d97df5afae16f40ecef942031235d1c6ba14f
> change-id: 20250505-kvm_tag_change-dea24351a355
> --
> Regards,
> Atish patra
>
