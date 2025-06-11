Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5555C17E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 04:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749616326; cv=none; b=LVSdjKOEQ01TqrWSzaUYSRh08QejnduQ5ZBYXrPNR9Cg3JZgxk/AXuwCxRFpwsT6bEWRAjP8dlmkVrHnlUnx5ekVp+fU9lTTH/LjBqluhoXDt4VsQv5SlnJLo3E+I3a7g/rV4oI/fKDr1PndlmtKt+Yq2LG36r8QJNLQxx28j2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749616326; c=relaxed/simple;
	bh=KD5tne7NfH27RUmHoUlUhEKf8zXcOCsLOGsfjG0lwuk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XVahaLPmVNk7R2JvmQGMkTT8i11ZlVeehdlOVAA3tkUX1QvEeNDkvcE912MjoZ35nysl4N2ukGyGjgUsQ3BRBcMRFdJoE9AhRlvE9bk3Jm3TYwLVbtF0Da6O2QN2mjREiO9En71IIwY6LgNr1QF4HavJaY6I6WKrB4zqZmKXYG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2GEVqXIS; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2GEVqXIS"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-553331c3dc7so6068843e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 21:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749616322; x=1750221122; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vL9LfPR1UDsljUu3ap7T7gEzE8IHpvCaq32ca1jGWQE=;
        b=2GEVqXISF5vxqgCWQLtA8gd3cdn9/iY+DPPh8NTjEqc2+ejBbigQi6/MLfQQWCxjbG
         aXGj37cCnMGquq/nruIwUud9z3ktoXCv/sE0frSFKbWtQQMSrKfPyk1ofyXN5ZG35hwu
         OLBLw+60v3q+OMywm8Mx2c4cSTn91SyGxsrGPemfny7rltbOmuTr1cEq7SfZZ1/TYCbq
         ioYcadp81s8bhhYUYS6YJnZXf2p5uHhgXSLua6ugg5MyyWt1/+JMCF1trxYswlFRLt1J
         7SFO2aUtNAAA/RxAbonHX7TQ9bNeWr3bACd5eJjlu6jVGyaefpmdJ5KDf0gYYszYFBD3
         5PEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749616322; x=1750221122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vL9LfPR1UDsljUu3ap7T7gEzE8IHpvCaq32ca1jGWQE=;
        b=EKtJesVASaO+QbC924NwnEzFWT4I+7Gl3BepOZveihedfAsVhII13nbZsfro2dx56e
         GYbNqQxBVq+4h5Y/gKxs8T3BJhRICCd+9KJQlOMdhjIcWh3ljzGHKyQVCmYjafe31GXX
         3LZLEnes2fbvm4Jgcp8A+NrewA4tsCoH83ZVwOJY1Ffy3L99LKbBf3s/OMOz0+ngaM2z
         TJkgSzyp8RDiAQqS5+OOeKTDREa6UoRWTjInbXidvUXqoY6s8oMVM78N5x5pak0XPAOZ
         UCfZGj9l41kA7z4gtHMNmX4xSaTgN9KBwcMzD76l0JF+gEQ3NMXOVPmsXysJPmDoJ2VT
         ssxg==
X-Forwarded-Encrypted: i=1; AJvYcCUxdYHO63gPCpk4gQ5ETGqOEDOxJSs5DScBJ1I6asGuz1oQQvLLlhNP9uafw3DMk+edZccR+2QmJ9RXZZ8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz27eZwZVI7QqITxdnJzpsSfcy+PcDncIVRuZvq9w+Kck2TkYiE
	vh4h7XoGgxDKPkNADU2SNYIz8Ug1Tzt20Hvstss48HkMAsgtsTaPvsfFCE0jDrd6YtSYWvN0ezr
	87kbK5qfRbztLkdFiDgztokP1V4inivdSPLR9D7s=
X-Gm-Gg: ASbGnct3aSAZsbtFA5wvMHKxYdpjwSL6LXxNvTiZHe1eVPSFAuzrOm6zc9avFs7vvTC
	JcLp8fWO1ke1I/vQK6EVnl9rYHlU1Cm0I/+pOjy0BGlpc3krMPUDX/BLsCUOmVsGhQNHWn9otfp
	aQvWDeBNtmsk8LEw6CE8E/ZiwWdErFaG24khc9DRgLFFW75cnJelYG6S3ZFlqRJ1pnr0Mo+zo=
X-Google-Smtp-Source: AGHT+IF+eLURjL34b9LhdlVm1yiGreUeEEyPMLatR1DuHmNuUUlwHZReRsJ0XFguafsYyfYFcfAg21oieATnDGo9XRM=
X-Received: by 2002:a05:6512:1051:b0:553:3892:5ead with SMTP id
 2adb3069b0e04-5539c101c28mr480149e87.2.1749616321924; Tue, 10 Jun 2025
 21:32:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611033001.707396-1-richard120310@gmail.com>
In-Reply-To: <20250611033001.707396-1-richard120310@gmail.com>
From: John Stultz <jstultz@google.com>
Date: Tue, 10 Jun 2025 21:31:49 -0700
X-Gm-Features: AX0GCFtwEX66J1E61TWrXB0nz4An5KF7EsQT8UufoLkQ82o1t7Byl1mU41rLhAA
Message-ID: <CANDhNCrez0=fKoH=1Kg6SG08yPmZ3q3N7rD+Dm3e8=-hHoj_6w@mail.gmail.com>
Subject: Re: [PATCH v2] clocksource: Replace loop within clocks_calc_mult_shift()
 with clz-based calculation for sftacc
To: I Hsin Cheng <richard120310@gmail.com>
Cc: tglx@linutronix.de, sboyd@kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	jserv@ccns.ncku.edu.tw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 8:30=E2=80=AFPM I Hsin Cheng <richard120310@gmail.c=
om> wrote:
>
> v1 -> v2:
>         - Refine commit message to explain more about "why"
>         - Check the frequency of "clocks_calc_mult_shift()" get called,
>           it's not in hotpath on my machine, refine the commit message
>       to avoid overselling it
>         - Add comments for the code to explain the implementation in
>           more detail
>         - Handle case for "tmp =3D=3D 0" to avoid undefined behavior
>     - Experiment using ffs() but it's used for finding the LSB of
>       a number, which isn't MSB as we want. It would still need
>       looping when intended to use ffs() in this scenario

Oh, apologies for mixing that up and leading you astray!


> diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
> index 2a7802ec480c..59145d762f1e 100644
> --- a/kernel/time/clocksource.c
> +++ b/kernel/time/clocksource.c
> @@ -66,10 +66,20 @@ clocks_calc_mult_shift(u32 *mult, u32 *shift, u32 fro=
m, u32 to, u32 maxsec)
>          * range:
>          */
>         tmp =3D ((u64)maxsec * from) >> 32;
> -       while (tmp) {
> -               tmp >>=3D1;
> -               sftacc--;
> -       }
> +
> +       /*
> +        * Decrement "sftacc" by the number of bits needed to represent "=
tmp".
> +        * Using (32 - __builtin_clz(tmp)) to ge the bit width:
> +        * - __builtin_clz(tmp) returns the count of leading zero bits
> +        * - (32 - __builtin_clz(tmp)) gives us the number of significant=
 bits
> +        *
> +        * Note: It use 32 instead of 31 because we want bit width (0-ind=
ex MSB
> +        * position + 1), not just the MSB position itself.
> +        *
> +        * Handle tmp =3D=3D 0 separately since __builtin_clz(0) has unde=
fined behavior.
> +        */
> +       if (tmp)
> +               sftacc -=3D (32 - __builtin_clz(tmp));

Still think the detail that __builtin_clz only works on the bottom
32bits is good to highlight in the comment.
Though maybe, would explicitly casting tmp to a u32 help it be more clear h=
ere?

thanks
-john
