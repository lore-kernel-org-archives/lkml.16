Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9841D5166
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 21:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738617915; cv=none; b=qa12oQGFZuzuVdEWei84PGcM6mZ5q0i/bf4ERtuQzQQPcfTcBFQCewU8RLxNWLJVwr0oK/tBJDMJSthWSOWR0i4KwYNm/qbcNlNSXG6j5WYMl8mHctAk/bQ1mNGskGwgNqdgNJXNlWk246e1fY0gJdq5bxoRltok5Q8gPvGyNTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738617915; c=relaxed/simple;
	bh=oxfDkLjCk0AkOG+vwiyK666xUMh0E7AfwUEKDP882jY=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=IEwW9K/Ct8GruLB89J0d7jIC5iFJJxYoyzYJ0rP8A0qnmi1A/eKpJovxghjgQgsDpJzvPFpjStdR6J3lKwuGqBzB4nCFszy5FGvBxufDUO5Gve3DbK+ON31jI+9k0iHM0+xFab2+d0wHmYgmsGBuq3yC7AiIc7JaKWC8fLZ7WPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jrtc27.com; spf=pass smtp.mailfrom=jrtc27.com; dkim=pass (2048-bit key) header.d=jrtc27.com header.i=@jrtc27.com header.b=UPSDjvaD; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jrtc27.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jrtc27.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jrtc27.com header.i=@jrtc27.com header.b="UPSDjvaD"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38632b8ae71so4121373f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 13:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1738617912; x=1739222712; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lbKbU/bqlOpQtMaXcZ1AxNL8WEdNxKO/z7RXdei3kBA=;
        b=UPSDjvaDF1E+9v9FsIPsvUTgkhddGuViPol6/ylWsH1y+Y0ULw0nrlqhhsqhpF6tXB
         TWeBau/t1UtALLR3FLQiSNnbAsySaOCtV7C3HXpXb1SnrBhPoUGD70uMyOU+0md/EiZW
         hhxGEqPn1xfcO4u7BAPfMag/mAt4SCixdraQHYPKMGhPRC01dm1l+X/TjB/k1SBXiZYd
         UaEkWYtkVCsQ2BbaSUCFSNhXqJX+HqewmkEziOQsw7GWFj+QUxDmd6UAqeCAIUaB4d0o
         T32c4QVmhEXQW/m192A7KYbgDepcQWpM2mH0/sb7K3W/r/CxH8YHe36AybuwrUZMJZBS
         T6Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738617912; x=1739222712;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lbKbU/bqlOpQtMaXcZ1AxNL8WEdNxKO/z7RXdei3kBA=;
        b=gHT2b/S5YW7jzFkBOFrM41aW7ul8fCc96E1vbDjkB2p0e5fipiRUUYUANUG8IqdHzC
         l/nUKFggCGzGKJzO+DpyLLt7cxlIPhV4RpCtg9PxR8q+682s2WB8IUfOB0+b4Ir6jPa1
         +jgdUeiID86+iFAERoIu/fBpaz2/7bXa6izQLJLLGB0ICTd9Sv5BW3KEuW9JekUAG9A0
         EkWBNBuzZeBjhJUXjsWOMumzDx2yUXqi+26sMpH+euQdjR8Yk4+Ap5Ep2EP7zGufJBXh
         6hH8qaQvh3NCmX2hQY96hsXi/rimB8rOZ0Pbds3kzm01nPkSilkPISIidDe1rL57vOZH
         g0dQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvVf6ZRIYpbFkm4nPsc4QWPu8zTJQ62I/A/50XX8Gmvq7mxgqIxjfZXSFy4DfNBvbXiFM8U85af/OnC/g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8ckKcVsu/1MDwDinRm8kDJOhzoxHteMdvqUzY8fPRzdT3r5as
	MBzNBffZWRWaHdWx8qU2pdqDzvl1BNO7HK8gOtehT8Mp6X61SVlVCy3WnpMr/UE=
X-Gm-Gg: ASbGncsiu/SDE1/MMY2CPZZep/3ItEg6urL/PTOUQGhzKZNfEzPbokQjr2a3fjUqCoA
	KlpFYzY7+t/hayZfbFe14fIaNOBBAAvjeAil3Wt357c3O9J9C3ZKTzMYaRfX6HO2QKC1pC5SWhq
	0OMDDL4NgOLUkF/r+I4FwrEJmRn3I8X3zDfabVmifR8eMdfN+L20QeDuIJnGDquhsbAJsh3KY0h
	ViQ5ZE8Ty8vYUzfFsq4AtlSNr07Rij74eGpXKo0ID7t0KV4h4qp0Lw6bA03zKLZcwJAjqSdt9rd
	ieBQNU035JRP0v4TATCdhWQc/g+7
X-Google-Smtp-Source: AGHT+IELM/Kalt3oJfQk1rk/oSLFELbF/EGfEM6vZ+8Wv94UQU4wednyhkpRtjOQFeZ0eXJ+Qn77sA==
X-Received: by 2002:a05:6000:1562:b0:385:df73:2f18 with SMTP id ffacd0b85a97d-38c520bc36amr22323581f8f.51.1738617912049;
        Mon, 03 Feb 2025 13:25:12 -0800 (PST)
Received: from smtpclient.apple ([131.111.5.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc2f73asm204475025e9.24.2025.02.03.13.25.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Feb 2025 13:25:10 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH] riscv/futex: sign extend compare value in atomic cmpxchg
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <mvmfrkv2vhz.fsf@suse.de>
Date: Mon, 3 Feb 2025 21:25:00 +0000
Cc: linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <A31D967F-B057-4C6D-B403-B4FB3973F185@jrtc27.com>
References: <mvmfrkv2vhz.fsf@suse.de>
To: Andreas Schwab <schwab@suse.de>
X-Mailer: Apple Mail (2.3826.300.87.4.3)

On 3 Feb 2025, at 10:06, Andreas Schwab <schwab@suse.de> wrote:
>=20
> Make sure the compare value in the lr/sc loop is sign extended to =
match
> what lr.w does.  Fortunately, due to the compiler keeping the register
> contents sign extended anyway the lack of the explicit extension =
didn't
> result in wrong code so far, but this cannot be relied upon.

GCC may guarantee this today, but LLVM does not, and definitely
generates code that does not do so. Whether that happens for any of the
consumers of this API today I don=E2=80=99t know, but it is definitely =
relying
on things that aren=E2=80=99t true for LLVM, and are not specified in =
the psABI.

Jess

> Fixes: b90edb33010b ("RISC-V: Add futex support.")
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> ---
> arch/riscv/include/asm/futex.h | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/include/asm/futex.h =
b/arch/riscv/include/asm/futex.h
> index fc8130f995c1..6907c456ac8c 100644
> --- a/arch/riscv/include/asm/futex.h
> +++ b/arch/riscv/include/asm/futex.h
> @@ -93,7 +93,7 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user =
*uaddr,
> _ASM_EXTABLE_UACCESS_ERR(1b, 3b, %[r]) \
> _ASM_EXTABLE_UACCESS_ERR(2b, 3b, %[r]) \
> : [r] "+r" (ret), [v] "=3D&r" (val), [u] "+m" (*uaddr), [t] "=3D&r" =
(tmp)
> - : [ov] "Jr" (oldval), [nv] "Jr" (newval)
> + : [ov] "Jr" ((long)(int)oldval), [nv] "Jr" (newval)
> : "memory");
> __disable_user_access();
>=20
> --=20
> 2.48.1
>=20
>=20
> --=20
> Andreas Schwab, SUSE Labs, schwab@suse.de
> GPG Key fingerprint =3D 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA =
B9D7
> "And now for something completely different."
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

