Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20BB199FD0
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 18:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748716087; cv=none; b=DGZJMdVDk2nOfZksHlq/j6Th0razXhBQJYljxKKZTnjTNSwdissNl7dah0sBAkj6XC50t8NKi8dxAAVZAHccKZlMMP+3mdv5MPCEMhI70ABWiGkkTByV9kl2l7+4NzZ272GMNBycs/djp1088Ho1NmJ99fa/AT1sSTQQ2N5UuY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748716087; c=relaxed/simple;
	bh=dk3fI/RFl3JBQlIF7cdxOmi75SUbSYf9k2jysCiZRo8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mHtP8FfoJO+ccCqxr8q4+U5yeSKtZICQ3aDqp/nBa9KivFobwmGfRy/A+RsGVvFtu5lP450sOfxB8Vr++Mi8jTCBF6cDaRGT2xKhemphhV8q4T0WneH+7+fQy+b7GbbeKCfblm6S/jAVK55REBj5WtbEwyrXZOedd8aJycOmSQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jrVRKdEd; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jrVRKdEd"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a366843fa6so1604437f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 11:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748716083; x=1749320883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1YdbwTnzAydK1ENdR81ZzCGwAItUOCi2suDZhdSPMmY=;
        b=jrVRKdEd4DmCRUMdSEMO7T+Pw81VDlJDsnUBXyCZR0UdjFsuUJB/74e0fz3zrKI2I5
         xFa27tv27yTm05hJgkrdDJ2JFIkHbLdYL6djqKF87+/rT5bK3CtZ2l4bBpOBf7YWdDJ3
         zu1ixxHzKxMV8AK5PxHW5qG0aP7BEBLCZ8aTMldp6I9TwegbzhAqiUh/nEosiDkAYGZO
         lOpKkrvdi9vqaE1ACjodwS5ENs3+ERypS7k4FmJAUjqtboA5NczuC0Uol53bhs16SBtq
         4/ucJ8xueWZIYwxevvlXo25Z+CqWnQP+rGz0E8tVnLZNh3rFksfcm7regm77UK4UjZc7
         b95w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748716083; x=1749320883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1YdbwTnzAydK1ENdR81ZzCGwAItUOCi2suDZhdSPMmY=;
        b=ZIoRigRZPYHkzjj20bZuiWRIVY7abFgibcYaddVA2Bo+z8EmgXGv/BK76d1n60JcQb
         LZUZ6drxPynLzOKPao4XfvPFojne/JZZyzjOnB1mWI+SIv0gdJNrLW6IaG/UpcPzKRF1
         AhvisE/3rtvcjsy8b3wZyFCyAAFKwHT5XzmQyhDUbk6ghAOtxgKH/Q17liAqQHWA5MLA
         I9esFj7OPiAg5B7RWRIfNv8EyVq8ojAZBwSOq3Oq7BNAKkZazwtXczhzYkLe/GNwGdU4
         jvefYdhsUQRqjpt1uaUiRZ5wKq0TtoQiICkbL94wVEgBCzZKRwnWbDxjRPWN85qi/rBg
         nRLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWT6REO+7zqlpicIBVQP1VxcqtARHDQusNtqGe4YJI4s+sG4GzKmQc3c0l3dIxORrmP93p3F115G9dtgk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnW1zTIGCWKJCtF82WnwF8Aayh/HJiguv0fPcr4uD0lRLrj89/
	T29NccUCcpmuZSgOdu+KdmTalGp7dB20nCgg5sczna4vOeDqaF8Xou2S
X-Gm-Gg: ASbGncvB0+U6wWVtEJ86sAqLD0s+5ahCTiAyg0o6HCxREuQbDIGWn3bp5ypDkZuAae1
	n1AKG6DLBg2Tr7R/44C3V3aCDJ6byUNLFNishWheGdo8zMLSZyw9jKiaMvqftRWbvPXHP6HK3E6
	/u/7vBzm999TJ6kfzYWh14FGkQjKbO4ajXc2fRI+70bw9EZDteCGMtRLwFEQ36h8swnwU5iYvyq
	Pzye/jka3RciE1KVHCkKhcLw8ko62LSykupwvyUSmlK9pFLL5+N3Hry48hcV4/bJMGgnDOyITbC
	SN0r7YAmv+g00ou9+Ne7iUi7CdJxsg63TOLKh7/qJSHCXQU0b7rH+HWJ5AReyCVI+xRtJI4FPH6
	lglKYt0LB1DT6NQ==
X-Google-Smtp-Source: AGHT+IHWo5ANP+dqauzoVoWuJ4LwCO1gMzfyDDlO2VCYKfnBp1d20CxKeSOkRv6fVimOUljOEpnsvw==
X-Received: by 2002:adf:a111:0:b0:3a4:f2aa:2e32 with SMTP id ffacd0b85a97d-3a4f89dcc2fmr4588914f8f.44.1748716082823;
        Sat, 31 May 2025 11:28:02 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe2b35dsm8766372f8f.0.2025.05.31.11.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 May 2025 11:28:02 -0700 (PDT)
Date: Sat, 31 May 2025 19:28:01 +0100
From: David Laight <david.laight.linux@gmail.com>
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH 2/2] riscv: uaccess: do not do misaligned accesses in
 get/put_user()
Message-ID: <20250531192801.5d6329c3@pumpkin>
In-Reply-To: <20250530205658.624195-3-cleger@rivosinc.com>
References: <20250530205658.624195-1-cleger@rivosinc.com>
	<20250530205658.624195-3-cleger@rivosinc.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 30 May 2025 22:56:58 +0200
Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com> wrote:

> Doing misaligned access to userspace memory would make a trap on
> platform where it is emulated. Latest fixes removed the kernel
> capability to do unaligned accesses to userspace memory safely since
> interrupts are kept disabled at all time during that. Thus doing so
> would crash the kernel.
>=20
> Such behavior was detected with GET_UNALIGN_CTL() that was doing
> a put_user() with an unsigned long* address that should have been an
> unsigned int*. Reenabling kernel misaligned access emulation is a bit
> risky and it would also degrade performances. Rather than doing that,
> we will try to avoid any misaligned accessed by using copy_from/to_user()
> which does not do any misaligned accesses. This can be done only for
> !CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS and thus allows to only generate
> a bit more code for this config.

For get_user() you are much better off reading the two words that contain
the value and then doing 'shift' and 'or' to get the correct value.

Even for put_user() doing the explicit byte accesses will be faster than
going though the generic copy_to/from_user() function.

	David

>=20
> Signed-off-by: Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com>
> ---
>  arch/riscv/include/asm/uaccess.h | 28 ++++++++++++++++++++++------
>  1 file changed, 22 insertions(+), 6 deletions(-)
>=20
> diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/ua=
ccess.h
> index 046de7ced09c..b542c05f394f 100644
> --- a/arch/riscv/include/asm/uaccess.h
> +++ b/arch/riscv/include/asm/uaccess.h
> @@ -169,8 +169,21 @@ do {								\
> =20
>  #endif /* CONFIG_64BIT */
> =20
> +unsigned long __must_check __asm_copy_to_user(void __user *to,
> +	const void *from, unsigned long n);
> +unsigned long __must_check __asm_copy_from_user(void *to,
> +	const void __user *from, unsigned long n);
> +
>  #define __get_user_nocheck(x, __gu_ptr, label)			\
>  do {								\
> +	if (!IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS)) {			\
> +		if (!IS_ALIGNED((uintptr_t)__gu_ptr, sizeof(*__gu_ptr))) {		\
> +			if (__asm_copy_from_user(&(x), __gu_ptr, sizeof(*__gu_ptr)))	\
> +				goto label;			\
> +			else					\
> +				break;				\
> +		}						\
> +	}							\
>  	switch (sizeof(*__gu_ptr)) {				\
>  	case 1:							\
>  		__get_user_asm("lb", (x), __gu_ptr, label);	\
> @@ -297,6 +310,15 @@ do {								\
> =20
>  #define __put_user_nocheck(x, __gu_ptr, label)			\
>  do {								\
> +	if (!IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS)) {			\
> +		if (!IS_ALIGNED((uintptr_t)__gu_ptr, sizeof(*__gu_ptr))) {		\
> +			unsigned long val =3D (unsigned long)(x);				\
> +			if (__asm_copy_to_user(__gu_ptr, &(val), sizeof(*__gu_ptr)))	\
> +				goto label;			\
> +			else					\
> +				break;				\
> +		}						\
> +	}							\
>  	switch (sizeof(*__gu_ptr)) {				\
>  	case 1:							\
>  		__put_user_asm("sb", (x), __gu_ptr, label);	\
> @@ -385,12 +407,6 @@ err_label:							\
>  		-EFAULT;					\
>  })
> =20
> -
> -unsigned long __must_check __asm_copy_to_user(void __user *to,
> -	const void *from, unsigned long n);
> -unsigned long __must_check __asm_copy_from_user(void *to,
> -	const void __user *from, unsigned long n);
> -
>  static inline unsigned long
>  raw_copy_from_user(void *to, const void __user *from, unsigned long n)
>  {

