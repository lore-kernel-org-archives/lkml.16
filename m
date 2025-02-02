Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0861D90AD;
	Sun,  2 Feb 2025 14:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738507250; cv=none; b=jKfLCVmvcQ8eZI0zoAq3zvfa2SnFfo9tW8wosKjYBQQa2cHmlJrHil5MLVsyNDi10Cin+oCiy/TALmfY1RVg6M6Srj2Yp+ITejhGBh87EQ5U+NAYcJhGL8qp2W0dcsw5OuBb/aIqdBcb8H4RbCVwLt68dq4utDwft4xbT/IzK8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738507250; c=relaxed/simple;
	bh=wPFTiggNeh4E4+nFLVjg69LKff1voHJI4RzDk/mGyCg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K+9MfmhOB3Up5SmQQZTvd2cLwhCTdTPRvwaYzyBMmXi3YWqIUR8z6+bCMBrVJ+S8ZVikkh9MZjTKMsw/pdzo0fI1+NizVU2dZ9hTdrWxlbzEHGvk4fi377zsi8hsTk6lYaznI/CO5iI/z+mUSIKHH1dKxP9PkU2cBRBZnC7cg88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pg99hoOx; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pg99hoOx"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3078fb1fa28so34340981fa.3;
        Sun, 02 Feb 2025 06:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738507247; x=1739112047; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r2LtEXUIsfJyVCaosUNtOBmJQZCbofpmIbzItN0ViTY=;
        b=Pg99hoOxlC75PxRA7IfL+NvsNt7SKRG+Ett4ktqzbsOy71q+U20tC2oxJJMXIHWARC
         Ypxhy0zpbWHe+q9P8HBy/RzQALMdCovk0/3ex4IbrIT11tCVxOtHhHq/JavKzbOpcNe+
         EfkPn2KCeMNdRsz/OI3pyHp70s2FumGEIUG+dsgRDzguvzgaLU5/w1Ldjf30NEybZYqN
         bSicSLuNEqpjiUnkqfi0oZab1plHrEyi+kpNjsTr7iY2vI5k0LolUXTxjIDiQwaFzAsm
         MxWMo/q2cNRMRmwe/yVvPGXDCQEun65RraxAbET6H36Wtu9lH3URZ4tcloYupNnMKaQn
         VSCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738507247; x=1739112047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r2LtEXUIsfJyVCaosUNtOBmJQZCbofpmIbzItN0ViTY=;
        b=YhgxuE001lBqBEecSGHoAwLfyfzc8k6LHHAs7fbIEIAtci+WwGiZrEgYirjsJqJmAJ
         2SkpMGgh4tGrMGlASfrAG85Tn3jV4gKZeZ5YUaayM8pWeY4KTjXRuw5qX5CLtQVqSPJH
         zEKS0ZfVXoCWmpQ++xwTbvwanLBiZbr6iJpGqEJnPEu5Y/FbkUMgqcTupjz6lina/Kiu
         V4O/mJaSFBHaU/eV9CvZk8WSTeSNtUUdPrK1/Dw7x281owXNA94dYDfBYBFN86uUALO7
         weCGRn/ptDysh6F7VqdJlO0j51glXxt8VRkQ/06V/3lmI3tqy+mztcpg7Z6BdFG6Xcjj
         P3gg==
X-Forwarded-Encrypted: i=1; AJvYcCVDHuGiF2k4J5EeqDpqy7rq+H4xpYmqJnAAO3eNK+rtPnSSIA86SD2E46wtCVxFL/Ff1eL819Bx0ddZefY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4V5yVfVoQrTB2gcd8E3+h87PZCAUGtztd0eyxN1XhQBuQ1LZg
	SWDWjxYs+ofBc+KWC4mDOJkxFWgpYrS41oU36AvkycLDonR1gbMNjq+ptZIOrwj+JJdZVuFYGyC
	h2uHkmC+z5cRqdzo4M9tDEQvcpDc=
X-Gm-Gg: ASbGncuVgCqgORJAtGDj24SjGYkLWxOsPTHZpIQvrtPhquJVd7j1TGlm0jek2OidNlv
	bVv/xYDK39LRtcQXAAYxQSNFJDGAgChxchhU3AtjymMLkdBwDyVF7xdGFHx4EGGnzFYXRwu8j5q
	ptDCMBCnILVRXfqK/SVB/L7M5+B+5UC2g=
X-Google-Smtp-Source: AGHT+IHCf2gs1zGzjevMt+wXA4YetxDWt34J8d4+Vz4eRYPmFvFSYPcriKS/BYtmIM72KFY+zjMzz5r1eZI3ifgLZRw=
X-Received: by 2002:a2e:a588:0:b0:302:350c:c630 with SMTP id
 38308e7fff4ca-30796857bb4mr71859461fa.22.1738507246632; Sun, 02 Feb 2025
 06:40:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250202-cstr-core-v6-0-8469cd6d29fd@gmail.com>
 <20250202-cstr-core-v6-2-8469cd6d29fd@gmail.com> <CAJ-ks9mGs0Swc1L2WMuh1Y5q6STsiFuYi77RR1Nb_gK1GG61+w@mail.gmail.com>
In-Reply-To: <CAJ-ks9mGs0Swc1L2WMuh1Y5q6STsiFuYi77RR1Nb_gK1GG61+w@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sun, 2 Feb 2025 09:40:10 -0500
X-Gm-Features: AWEUYZlM1uyK-M5aPVhV30EaFwmBCEni812o8a2vR1odTWwdwgRyjfo8OGpKPcg
Message-ID: <CAJ-ks9mqcUX2XRxyZeyyt+s2wrF6TkjYqJQhoOAnMBPS08MGyg@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] rust: replace `CStr` with `core::ffi::CStr`
To: Michal Rostecki <vadorovsky@protonmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 2, 2025 at 7:54=E2=80=AFAM Tamir Duberstein <tamird@gmail.com> =
wrote:
>
> On Sun, Feb 2, 2025 at 7:20=E2=80=AFAM Tamir Duberstein <tamird@gmail.com=
> wrote:
> >
> >  impl DerefMut for CString {
> >      fn deref_mut(&mut self) -> &mut Self::Target {
> > -        // SAFETY: A `CString` is always NUL-terminated and contains n=
o other
> > -        // NUL bytes.
> > -        unsafe { CStr::from_bytes_with_nul_unchecked_mut(self.buf.as_m=
ut_slice()) }
> > +        // SAFETY: Properties of `bytes` guaranteed by the safety prec=
ondition.
> > +        unsafe { &mut *(self.buf.as_mut_slice() as *mut [u8] as *mut C=
Str) }
> >      }
> >  }
>
> Whoops, this safety comment is nonsense. I'll use the one from `impl
> Deref` above in v7...or just remove this impl altogether. I'm not sure
> what the use for `&mut CStr` would be.

Ah, turns out Michal's patches removed functionality added in commit
a321f3ad0a5d ("rust: str: add {make,to}_{upper,lower}case() to
CString") which relied on this DerefMut impl. I've restored it all in
v7.
