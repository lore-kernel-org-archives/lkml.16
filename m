Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3037925DD1A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 10:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745835647; cv=none; b=o7vwbMeGrnyPMAizLuwXhkH6EXokUZDjxLO4Rz1HV6KKUNOU90KWI+ZyHQ+gRx2c0RtcSC514mzXsPWw7t7O9xyKdLtHzjiuwjHVSDZiYMHgrDnjeOkDK/0WCVrVMhQvAEW6G74Ejj/54ekV/88yuE+kQcBJggHh29L7vdNBsfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745835647; c=relaxed/simple;
	bh=6y3GJQkg3WO6HZVx8AbKk9AKup+Iuho9Ws+zs6rdbvQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F8K48me7/3WxDnhAVziY+/UCQW5uQEcx3gaDmmog5PZT+Bcs2aAv9G2h0i1JeNsJIksaqKW+QsdNINNjtSAaQgGLMHDGSGAk4xzYGMKxKs+FEqF/ypDm9HiB8zUNDtpCxQq34S+UkQ9F/Tgb7GhQWqHMZthVevCjzkSgJqdH0rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=T7w5VshK; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="T7w5VshK"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30bfca745c7so41431771fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 03:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745835642; x=1746440442; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4sK5PIgmZ1Mpik4wrEId0UQH2tIcaV83eQP9njHyGcE=;
        b=T7w5VshK4RzwpVIjbJ27iY1o0pnOA5jHWAH4IPn7YkGWOpLbmziT+KSN+IbaHX3PlQ
         inEuHLyDtbIVIxKUQ8HxNt5CNP8Lk57OP+T0DsjPgEr2I7fydmR0PRR5d0tSc/2TnFHl
         FECSB8JX8BNm3X/QvtdpZV+LSwtpHW9bx5tdfUdanUg+iXqqeZEKAsMjrfY92e7JC83z
         5nBGIMg4tI3Ffb2fwnYTmADWN8Gyrm/D6XQaXGxXw/YFm4Vpa8SbhZ3I58iDhwy5MfKB
         dzy5mUGZzBdIZ8h1S2JrKjYsQUuuwtYJ8zP1Y/er4yRYQ7/aoJAWH8fMuO9aZ0TW4n0Y
         h7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745835642; x=1746440442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4sK5PIgmZ1Mpik4wrEId0UQH2tIcaV83eQP9njHyGcE=;
        b=SJv5//QY/1dVWP3L39RSEQMnEGnUAqgKbOnsuYwKmXaMbgR7xv3BZttEJncn5QSxY1
         0JmzDE8FY4h5EF+VLGnZKeVIifnAPUm3bLfyso1ibn82PYx/OVCHI1V+tFL9NHHW8uul
         HqMwzvfK4dfcaT/JPR4+uZN+1IWgqvXud9Cx+nNIG3bszRRqxYVvJlOXSKyxW4V3y0nB
         4ToWnuh5EAchv/smFe2F4FgJl/Us8GVl0wSNvYYXS+IKgqkp+VBtfM6MWE4SQfkiszhj
         2zM9g0eN8aZc4BHrZo0n4Md4PZ2W2CVgi2N+KD8hwv6y6G/B+CukC5AhwlcIZ1wh5X7d
         +ASg==
X-Forwarded-Encrypted: i=1; AJvYcCXunLStLCM0o7mBP1YEutZWBMPwr15GwWa0o9RgOuOCXrihjgruN+sr/hscDi2rp3izCJHe9pR4tW3kTIo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCqY8+vF+WdINxt0dlhxK0xfSGxrU/n2JZhpSKGvTcFz547Gv9
	VjkfEtDyE4T4k4mK5YmNuSejlXt2osCas8IbKkM9fsCsRYu+9bJjnT/CZ2V3XHQiMOEebxOgw2y
	8+AGrIixrmjTr02XCiTc46cZla8AZPfzo+CQrSA==
X-Gm-Gg: ASbGncvc0fMokpOeAVnc8aSFpC7XGqQXEhVqWAPS9X9/NU9dEQJDhogh5/Wuw5njOQR
	QVcIYWPtV4LSCa5x5GpLCJJoojREPeO4w43x1O9YMnJb7Hs5GDTYVowqk0QcaLBPAHuX+6osy+y
	j0Qk7D+RS97tEJJeC2g9mbFNbnVTCIX/KqNSkp01GgGXU8DXAHOGoQwnY=
X-Google-Smtp-Source: AGHT+IFxSYOh5ACpZ7FmM+wW1wuiew0INq7bJoRMxvSARAwFZSyWC46QwXnSDBXQD+ntiOOavQU0/IWYQ9ZRT/nnGII=
X-Received: by 2002:a2e:be1b:0:b0:30b:b9e4:13cd with SMTP id
 38308e7fff4ca-31905b6a701mr38067671fa.2.1745835642321; Mon, 28 Apr 2025
 03:20:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403161143.361461-1-marco.crivellari@suse.com>
 <20250403161143.361461-3-marco.crivellari@suse.com> <CAAhV-H4dQ8hRfBm2JWmgMzYH5tuy4ph6hyOSXQBLOvtCQ+K9dQ@mail.gmail.com>
 <alpine.DEB.2.21.2504280426010.31828@angie.orcam.me.uk> <CAAhV-H4WTrYecBj0wev8AUi_of_qAnvHCk4heTU5P_3pMZv4fA@mail.gmail.com>
In-Reply-To: <CAAhV-H4WTrYecBj0wev8AUi_of_qAnvHCk4heTU5P_3pMZv4fA@mail.gmail.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Mon, 28 Apr 2025 12:20:31 +0200
X-Gm-Features: ATxdqUFj9iVuicJaDf0xifwnqp09kIdWJ30vAMX4UW7_WZ6gAcWBeXZTcI6VmEE
Message-ID: <CAAofZF4J6H5jgqKu=KUowBrwfHJyGEzL5ThC_DOs-XPdgm497A@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] MIPS: Move r4k_wait() to .cpuidle.text section
To: Huacai Chen <chenhuacai@kernel.org>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Frederic Weisbecker <frederic@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

If it sounds good also to Maciej, I will submit the new version with the
space before "ax" (and of course, the ".previous").

Thank you.

On Mon, Apr 28, 2025 at 6:11=E2=80=AFAM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> On Mon, Apr 28, 2025 at 11:28=E2=80=AFAM Maciej W. Rozycki <macro@orcam.m=
e.uk> wrote:
> >
> > On Mon, 28 Apr 2025, Huacai Chen wrote:
> >
> > > > diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
> > > > index 46d975d00298..2cf312d9a3b0 100644
> > > > --- a/arch/mips/kernel/genex.S
> > > > +++ b/arch/mips/kernel/genex.S
> > > > @@ -104,6 +104,7 @@ handle_vcei:
> > > >
> > > >         __FINIT
> > > >
> > > > +       .section .cpuidle.text,"ax"
> > > If you submit a new version, adding a space before "ax" will be a lit=
tle better.
> >
> >  We use no space across our port though, which is why I haven't request=
ed
> > that before.
>
> Current status:
> arch/mips/include/asm/ftrace.h:         ".section .fixup, \"ax\"\n"
>          \
> arch/mips/include/asm/ftrace.h:         ".section .fixup, \"ax\"\n"     \
> arch/mips/include/asm/futex.h:          "       .section .fixup,\"ax\"
>                  \n"     \
> arch/mips/include/asm/futex.h:          "       .section .fixup,\"ax\"
>                  \n"     \
> arch/mips/include/asm/futex.h:          "       .section .fixup,\"ax\"
>                          \n"
> arch/mips/include/asm/futex.h:          "       .section .fixup,\"ax\"
>                          \n"
> arch/mips/include/asm/paccess.h:        ".section\t.fixup,\"ax\"\n"
>                                  \
> arch/mips/include/asm/paccess.h:        ".section\t.fixup,\"ax\"\n"
>                                  \
>
> So there are a few files which have spaces.
>
> Huacai
>
>
> >
> >   Maciej



--=20

Marco Crivellari

L3 Support Engineer, Technology & Product




marco.crivellari@suse.com
