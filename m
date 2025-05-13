Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD2D34545
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 22:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747173763; cv=none; b=HmdqoQfvlxdv45/hk8nFXlyJ/+9B9UD53lJU9P4Ja3ZbjsAlMBCjh9xLEPJXAJ99rz9ys7YGNsue756WWJYhbuR14QbrtZdvS8XQ9rRYgkZvORDvFXo/pqjGHl+kTKb1pkdSQlxUd+UIfIfx6cVq7ELcQR3gYnJu9F2BrR7c6gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747173763; c=relaxed/simple;
	bh=34UNS8y1XedFDkbLbV884ATVVNqKpycwchmUNakcKQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xq2KbwtyeJOc5wabLTJQrBLhM9ejfgCekEVT3MoVo+pul392fjtpkHSNOFq4/f4eGgDhK0zt3yRSNCSEwNVNN9I+4x0ZKZx3QR6lyHv8feO6BS6dZQjBfcsyS9ik9PtlO/iCuWR4/h7jTMoR8kSJJluGOIi8xSVJhWp6oXSuyQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=NofvvoSn; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="NofvvoSn"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ad1a87d93f7so936252666b.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 15:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1747173759; x=1747778559; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MeUhnGHcnbyf4punTwW0oo5FUzmJQ0vKIFvAjlIakFQ=;
        b=NofvvoSntphOinrdf01zE/D2Ye73U82fwi6ZZ0M24lDWiet95m22Slxb1D3iy0edOH
         poIbRYG8mMkS1Djz2XjVr2OBgOvHX2uzIwhFIfiJbMY6/Pgn3XC7h1PxQXea3Kx2oVxh
         R6K2YjFG2oOSffsGjrvnuP6J9c9aED6uf3G8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747173759; x=1747778559;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MeUhnGHcnbyf4punTwW0oo5FUzmJQ0vKIFvAjlIakFQ=;
        b=jc2vJ9kt7Sk8bT7HUbO9LP8eBTcbB/fBMcrl6N2LR4Viw9ZBC6NtMpKDoNsdOaqypd
         g2cfRa+iPtmKxI4O3sbhzOKlGBrsGe6S0eZ0VCqrZJm/OxOu9sFV27KybBHkSnogoHYQ
         7n/B6SFDjGfTN1PWFj0oPZZd5BpEv3QBXeo6FRS8axBqKAyP/oVYmWA5lHdrVo9Gkrrn
         v5vCSsRlkmyxeJDiBUzJz8S56UCQbjUlGRJ7cicYoJ9HXrS4TkU8pi/rblfSI4WAGpwu
         2G63NxxSLzybHPUbEVgOX4VNrVAaaX83KvMtNCCeDY0PVWFn21KfiUQIMa07QPbM4k2r
         RoZw==
X-Forwarded-Encrypted: i=1; AJvYcCUNjcbw8uVSpb1/mnXlNWjUGSMXeEHdlxH3x0D6KLaLCbzESRCxzTpZmD2s554sDwBTAWkluxgQUPKkFfw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrgIQMLS9E1XgUvBoanEntddGiS1NqnCdwWBkfK4RsyHPvOQ/1
	BM7dlFx+IOzuSEkLQ+0WuFJpXepKO3jLHZOznMzsz+jJPlyr8WS41uk/K8F8LaECj6A2lugHocM
	mITp1gw==
X-Gm-Gg: ASbGncucoU+mo5qjwiu0nunvXSjFVXBSuzILtxI/Pd/rg/X9Ndb+AG0xCufsEDLg4Aw
	FROB8Ewztr8llqnstWM7BwHBxAQoOuWnNk8emkkRoJF1E3P4JF9cm6Iclq5duVkMaV7UmpgcvEJ
	4ROTov5CknHJjgNbdNKHIxe95MNeQ+ktXPlCXW6X0UV2Yzz3udheeC2h7n/u9Fa+0AujRpS/XBB
	Lo0are15bpoOGPfFdNgXdMAf9U1cHunHN3uzozj3tTbEOac+gBQ3N+KCGu9CIiiE+xTVGPLdqGJ
	neaQ6maggx3+n8qJXIZMiZildjSzX8Fcm/UQqGQMYFp0UkTIukdbLt5JIlNbDXj8bDQFcVan0fV
	b6G41fdLjibrls+rOrZwm75kAuA==
X-Google-Smtp-Source: AGHT+IFnyUpT2L5BeSAYCRWBtQI27zVw+/nybsOzyfF949i6nf1d7+WmTC3OWbuUjNqivcTtIRFdhw==
X-Received: by 2002:a17:907:c39a:b0:ad4:f440:151a with SMTP id a640c23a62f3a-ad4f71479a9mr104074566b.27.1747173758689;
        Tue, 13 May 2025 15:02:38 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad22ba47376sm717522066b.53.2025.05.13.15.02.37
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 15:02:37 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ad2452e877aso567382466b.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 15:02:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXjv1oqn3lGv8CnkVw0c3YBqdksBkqTIQ83xEijedt2FtwsUkW6LPtgZE2vffwPSTcbX4evfBaIKFgdJfY=@vger.kernel.org
X-Received: by 2002:a17:907:d386:b0:aca:d6f2:5d5 with SMTP id
 a640c23a62f3a-ad4f7270122mr109900766b.39.1747173757110; Tue, 13 May 2025
 15:02:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <alpine.DEB.2.21.2505050944230.31828@angie.orcam.me.uk>
 <98C88CE8-C3D5-4B75-8545-71DD47C67614@zytor.com> <alpine.DEB.2.21.2505051356340.31828@angie.orcam.me.uk>
 <1E50C160-EB89-4C5C-B9F0-6441026EE380@zytor.com> <20250505205405.GNaBklbdKLbadRATbr@fat_crate.local>
 <alpine.DEB.2.21.2505060059010.31828@angie.orcam.me.uk> <20250506141631.GEaBoZvzPCWh88xDzu@fat_crate.local>
 <alpine.DEB.2.21.2505062228200.21337@angie.orcam.me.uk> <8C172B63-38E1-427B-8511-25ECE5B9E780@alien8.de>
 <alpine.DEB.2.21.2505121225000.46553@angie.orcam.me.uk> <20250512134853.GGaCH8RUjJwgHq25qx@fat_crate.local>
 <alpine.DEB.2.21.2505121810040.46553@angie.orcam.me.uk> <CAADWXX8+-=pcOUeu_cwX_vkkkGp6jn0GQLUhZX8MxGGRjKz=Lg@mail.gmail.com>
 <a719b6ec1ccba2ecad7421a2cdf1660d1be16888.camel@physik.fu-berlin.de> <alpine.DEB.2.21.2505131735170.46553@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2505131735170.46553@angie.orcam.me.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 13 May 2025 15:02:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi3kX2BHU7ABRRE=8-XYYXe8+ZffoxycHYT4TNQee0nBg@mail.gmail.com>
X-Gm-Features: AX0GCFvbLV_t5LunCuCIvsaOW6Nhc5Nz2xrqTWxRIvZK7F4aacLpAaA2dh6GfTk
Message-ID: <CAHk-=wi3kX2BHU7ABRRE=8-XYYXe8+ZffoxycHYT4TNQee0nBg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/15] x86: Remove support for TSC-less and CX8-less CPUs
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Borislav Petkov <bp@alien8.de>, 
	"H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org, 
	"Ahmed S . Darwish" <darwi@linutronix.de>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, John Ogness <john.ogness@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 May 2025 at 14:55, Maciej W. Rozycki <macro@orcam.me.uk> wrote:
>
>  Hmm, a .mailmap artifact perhaps

Ahh, indeed. I was looking at commit feea1db26e5b ("[PATCH] defxx: Use
irqreturn_t for the interrupt handler") from 2005, but yes, the raw
commit information has your linux-mips address, and it's just that
"git log" will translate it to something much newer...

But I really don't think we've ever been *so* strict about pgp keys
having all the proper pgp key signature chains. Yes, it's the normal
rule and the regular way people identify themselves, but nothing
should ever be mindlessly black-and-white.

               Linus
