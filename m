Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297491F1500
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 09:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743671179; cv=none; b=foQNqhB77I5bL1ls6SxSnnLa9GR/630kPFpLYyon7N/AfaYyDm/deeKgq5zQIpAxEVPypfafiS2TYdQ4e5qfbbxv5ejA0jiZnr+I105cEbTx30fn12s9Ab4nebpoWw0ib1ik1OfAN3znj3QLJzzRScmCyp5jOrEJ2v4HdUmtgP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743671179; c=relaxed/simple;
	bh=B9hm1zTnA1AAiSjKQx3QFM2Ufknkorg6sAJWN0U6Opc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cM4iXBmSd8CrVHLWOa1MdSbltTVCTcCx5StLNuWBqt/c+T0UBA55iDsncP1w830WZcauIO2MnnTo/DInNVnWIELdBwO+AucCsKjBSyZD27NANM6oCEcMBQOs4sMa3hipmnX15C0X4cVGAwKrTsyGEBrwIk+/lTTDzlbxk67iVj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D7ybYolr; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D7ybYolr"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5499d2134e8so829900e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 02:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743671174; x=1744275974; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cr+S22BZ2xcihPgrlA1tDa1VSuER27ezlNlGe9YDCYg=;
        b=D7ybYolr0tEQ/LrEPakcjP8cBbAJ4pZ+DiKIVsoPc8dPZdBWGBT+IZXER8StuhtHow
         CZGbtsIkjuJA18sSvYgvCeeBT0zCwEEydqw2OZ1cLyriJMh0zokrHa1HHKvZ1flIKIS5
         WL96z2+aNpDwZWrIg2FncUMuywIeyUL47b+AG5Km2Xv/ZicTHP+s7OwTBxql8rpsm9Cl
         5EIb86hZco3a8im3D1c1of9LMWvBM7ZSl4m1hUnDzBmUiZ1Nml+awsGg8uOxkZT+QAVN
         1vS6U6TN439UmtXerz9LRnPy+vOlV49W3S1hcG3jHWJGLftU2hiTSUlt280GD0GPjLyQ
         xHsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743671174; x=1744275974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cr+S22BZ2xcihPgrlA1tDa1VSuER27ezlNlGe9YDCYg=;
        b=GwGkScInObw2k3vfJ7zHvpw81GEfrRh7TKTkVoJhkeCzLpswsxkMHEJxpMtWaMMUfc
         rBuXyXEdGPp2T9zxyzlhRCa+qF3UrHIv+Dqil1XhlyHlO4b7udhqFrqlYW3TM57mRdF9
         i3wM0tqvsxFSDo7uqeHVW0vcsaos3e1ibvYXpT/N3kU5nuC+IrO7rJ+uJXDJJLOzVMqa
         eN9dXnH+xFSH1gKFFUQBG3vZVBHomUE3z0RS6s9NkGChVM+EmXNgoEXqzrVGqKpQP0Ap
         tu3pfv+BVbtgBKZ9DwYUXDB/5SEPFVe0UKy6QqxI093ga3d4YYZCe5TpFe2th3B8E1bQ
         WfRA==
X-Forwarded-Encrypted: i=1; AJvYcCWgQkl6LvuoH8GdzyMXKzd/vy1mfgGwWozahgY6K7nqsrXURCnyXJmezT7rj7B1H7tLRi6H4D+/ly6xaQQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YynJfT89Hze8U6/yKR46AHkwypeOy7wxWy2YmJ4dn5hNvk/flms
	dQ3ovV2fx+Yl9rEOu0Bl6EW6DakQQZ0vpCnzVgzZlNwL+QZkZqRf9TADCJf/H4nvz9G2+3PnC0N
	Pw4eaXLxdtWaJOXwFxMsFlue9XVLxGGOC
X-Gm-Gg: ASbGncvsfO/etFKS9+gszLCbPP8HYQuRcw19HC6XpLROAS1Xd+2jvSd1qfUFwKfWmvE
	8xsbDoOL4ZhdIGicc0CLGGOOCS6Anh8R/ldzhCV+WARagcaRd4EIoOoL3sFuF6LBfNTlIv20DkM
	W73RE7vKmauCrVs7lhlWudWIVWxA==
X-Google-Smtp-Source: AGHT+IH+TgOsUNNUoNyl98vYwpQty4AurG2YYizWi3fVq1o7Lzjtm+e+Euenpt07tyPy9GB4RlZ7z1UtQDM9eaFp8VA=
X-Received: by 2002:a05:6512:a95:b0:549:5769:6aee with SMTP id
 2adb3069b0e04-54c19c55c05mr1842751e87.7.1743671173903; Thu, 03 Apr 2025
 02:06:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403070453.214190-1-ubizjak@gmail.com> <20250403082508.GAZ-5F5EMVZq3-6Zoo@fat_crate.local>
In-Reply-To: <20250403082508.GAZ-5F5EMVZq3-6Zoo@fat_crate.local>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Thu, 3 Apr 2025 11:06:02 +0200
X-Gm-Features: AQ5f1JoW7LoWu2LYC_1JM7HqhdXhPjBBhY0jvYKgfTnND3Qc8mgGg_lVWAVrmTI
Message-ID: <CAFULd4a49RRMKrSVh3Q5zpeK4EJVW61tm=fCN4aOWX8=x8rKnw@mail.gmail.com>
Subject: Re: [PATCH -tip] x86/idle: Work around LLVM assembler bug with
 MONITOR and MWAIT insn
To: Borislav Petkov <bp@alien8.de>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 10:25=E2=80=AFAM Borislav Petkov <bp@alien8.de> wrot=
e:
>
> On Thu, Apr 03, 2025 at 09:04:37AM +0200, Uros Bizjak wrote:
> > LLVM assembler is not able to assemble correct forms of MONITOR
> > and MWAIT instructions with explicit operands:
> >
> >   error: invalid operand for instruction
> >           monitor %rax,%ecx,%edx
> >                        ^~~~
> >
> > Use instruction mnemonics with implicit operands when LLVM assembler
> > is detected to work around this issue.
> >
> > Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Ingo Molnar <mingo@kernel.org>
> > Cc: Borislav Petkov <bp@alien8.de>
> > Cc: Dave Hansen <dave.hansen@linux.intel.com>
> > Cc: "H. Peter Anvin" <hpa@zytor.com>
> > Fixes: cd3b85b27542 ("x86/idle: Use MONITOR and MWAIT mnemonics in <asm=
/mwait.h>")
>
> No, you should whack that one - the toolchains are clearly not ready yet.=
..

The least common denominator is an insn with implicit operands. I'll
post V2 that fixes it that way.

Uros.
