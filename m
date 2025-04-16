Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CA6224B05
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 05:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744782853; cv=none; b=OyR/Pgw5sLJBHiaLXuYTpRzmkhn3UAYbYqazoR9kClEJ1ktpqIZE21MO9DJ54GVttosgE7TdczGoMkA3yYmh8q9oV/3NBGc3y5eLhhir4uPndsuClfXskMmu1mTEmsK5DDRbK1/X5L6UhsGCUEKydZWpTj3A/xtT0Fb6YxP4zhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744782853; c=relaxed/simple;
	bh=239UQEfkZYAKSBMhKmP9uLLuYFgWkkQrNgSjEh3EfTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KLrYQBwaj1pVV0/jHpS5l17WyNsBCIta6dMSLuCZZHTjdl1gn/FIZwfcfe02nmRB2aFQ5qmXDYoSFJgZETZembDfSacK/PoHNIlx77hQkWiULtuOibr5lNTA/1U9AAwTxZ4AbtP+TCesYGQa0XJVLOs/jsIZ3mLZrmSNdrYot/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wn7Pc0B6; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wn7Pc0B6"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5497590ffbbso6685435e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 22:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744782849; x=1745387649; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ma56JdV1nhumd2hIrzxNZCq7YqsIb2ro3nhXeH33szk=;
        b=Wn7Pc0B66/iF+eipEIxO7Dy+iplQxRLd3ocMBEyX6PtSgSpJVAj0xc4wm0rzVMD49+
         r9H164Je3MbGoWIl2AHyQMnaQlSWSoAQg1EnZhnuEg91QrteaBmNgLmpXY7WBOm3/q6U
         c5rxfSdgSssSEJxoi1IWSZhzWRYpcxMikQYCePGNr2ksaBBXF93szBtBFbqqmPeVUbvT
         vj9l04Nut7ELylYuFZy4t+MMJZwSCWbzf0IsDimSKaGmaAn9Czv4l0UIz67HaDdtHbNh
         qlFInQx3gCsa2fVrCw7EZTDgxGWDgiaGWvK3KlF8wnmYA+/snxQSIfjQKEiADcpO0PQW
         WJ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744782849; x=1745387649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ma56JdV1nhumd2hIrzxNZCq7YqsIb2ro3nhXeH33szk=;
        b=aBrkIb/q/HRkEeT2C2fQwyRjfPFk9Gpqng0T/MlJ+1K08S2iT6L5QD443J6fRFGIAZ
         5gSqukgvjyuSOqIu9FTDLm4H4UO/SMqR6PAYkdfY93X9h/DocgbpzbLB8WNdI1cZRf1q
         wGNZ4ApkD6eRFq1GiR94epLEbjx9Mzd1XfundNuRI2SUDyTm6kdTlL5bibFAJ7k3V5GS
         YpXSRau0mIy2sYoHq2kz6ojqYdhdGHX3MOlzwH6p4sK+vJ5d0Q58CHKSN3vUFO2R1xna
         57VTR7/uf/mP4nhW4bAqEtHLXiEBo6ChpZ2QXXScfUTlEq3GDXzGHnK/JSKUvxXd5xe7
         W39A==
X-Forwarded-Encrypted: i=1; AJvYcCXK9J5yfnvXbkXjRepqR82sIMImQOfsdpEKb1m3H8K9W3Z42IFDEfzbyN1TqwU2PUgPAfLKMZUFEHFwwdQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0eicVq1GG/CfnlYiRjD6nuTst0cPLbT4YI3xquWlAc6omJ8mO
	VnSdu+AnSJc4ok5ZvPu8IZNBkqIxsVrSIidqVYLt5vy/VdsK6HSuTHVWP7HwfUPuE03+aJQckxk
	XfRPsSO7QtziuFUKJI/3apcilsmjQzHUelc8PFA==
X-Gm-Gg: ASbGncvZb7t7q3tEBRZnGiZlgYmBRSCT6pTjz2/JauWUSUK5vBCSNRc72iHwb1e29Pt
	ZfxBDoxULQGqpo575y6q6O79gwYcBQIXudi1BibaQAUQUEenKqCytITQNTBQbUeQ21taYdD/Q3L
	jhdV2hz07KIsQdjxDfMSrKCA==
X-Google-Smtp-Source: AGHT+IFKNOvvk/guKx+5UUNDUQ3VjKqbOOR/YrgZhnhd/s/Jt7rhsOWn5n+XMebPpbtROoWDcm4vmhTDkFWPo7tjwhg=
X-Received: by 2002:a2e:bea5:0:b0:30c:6f38:f675 with SMTP id
 38308e7fff4ca-3107f718b32mr1334801fa.31.1744782848194; Tue, 15 Apr 2025
 22:54:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414145650.10776-1-ubizjak@gmail.com> <20250415185558.112621df@pumpkin>
In-Reply-To: <20250415185558.112621df@pumpkin>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Wed, 16 Apr 2025 07:53:56 +0200
X-Gm-Features: ATxdqUELBsckZ2mk1WsCsKoeAANw0iyzdNyTWIq2U13CXOfTkWqT8UIebtQcx5w
Message-ID: <CAFULd4YV0yKTULPM-+Y0b72EJ48tqfW_ni8RjHsQTULT8TGaTQ@mail.gmail.com>
Subject: Re: [PATCH] um/asm: Replace "REP; NOP" with PAUSE mnemonic
To: David Laight <david.laight.linux@gmail.com>
Cc: linux-um@lists.infradead.org, x86@kernel.org, linux-kernel@vger.kernel.org, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 7:56=E2=80=AFPM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Mon, 14 Apr 2025 16:55:57 +0200
> Uros Bizjak <ubizjak@gmail.com> wrote:
>
> > Current minimum required version of binutils is 2.25,
> > which supports PAUSE instruction mnemonic.
> >
> > Replace "REP; NOP" with this proper mnemonic.
> >
> > No functional change intended.
> >
> > Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> > Cc: Richard Weinberger <richard@nod.at>
> > Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
> > Cc: Johannes Berg <johannes@sipsolutions.net>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Ingo Molnar <mingo@kernel.org>
> > Cc: Borislav Petkov <bp@alien8.de>
> > Cc: Dave Hansen <dave.hansen@linux.intel.com>
> > Cc: "H. Peter Anvin" <hpa@zytor.com>
> > ---
> >  arch/x86/um/asm/processor.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/x86/um/asm/processor.h b/arch/x86/um/asm/processor.h
> > index 478710384b34..233a7a0d29c9 100644
> > --- a/arch/x86/um/asm/processor.h
> > +++ b/arch/x86/um/asm/processor.h
> > @@ -24,7 +24,7 @@
> >  /* REP NOP (PAUSE) is a good thing to insert into busy-wait loops. */
> >  static __always_inline void rep_nop(void)
> >  {
> > -     __asm__ __volatile__("rep;nop": : :"memory");
> > +     __asm__ __volatile__("pause": : :"memory");
> >  }
> >
>
> That only makes sense if you also change the function name.

This function is used in several places, and is also defined for x86
in arch/x86/include/asm/vdso/processor.h. The renaming should be
coordinated with x86 and should definitely be a separate patch.

Uros.
