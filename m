Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73422AF06;
	Sun,  2 Feb 2025 12:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738500921; cv=none; b=PNoNzjdRyhTfr9SLO18kr9sD3V3MKf2Rr/2CJZYPK3dO1g8ju0Yziwlh3nLOfQeKYaxI1zlM1un9lQpILP2dEHDfGcYTaAOB+UvxftbgElj8Cn/ZMCyhMjV3eUq3l/l5uxGFMZwJdX2jnacPDg/6Jh2pJpQHz3Aa5ZkNnjQD6pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738500921; c=relaxed/simple;
	bh=VRPy+teEzMxgsuO53PTUAZvh/gxOUy2b78Z+Zc2Itfc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EFXpXcSfax/m32ZHS0llthmbQencjjZYpOTM1I3N7mCtTJ9o+cQLkjJmm93JaWOLn5VoBGXsCEyK5HBmcIjwcysQN0O9SrncSkf2TtYKIMY9i5kzwrJYY+yDDpmR8bVQPkAV7mv5ljfGmHw04nIp6OVFOjQ1nCVWLCZ4LFSiGBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O/MSjFC3; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O/MSjFC3"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30738a717ffso29553731fa.0;
        Sun, 02 Feb 2025 04:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738500918; x=1739105718; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OMKG1kpaXWBH2VftDsuUeWAr8QcYNGM5yl0LKFjRV9Q=;
        b=O/MSjFC3rasdSmksCJrenhqa5jKgVhFYfrcXix+pox4qssBu1Qt5V2rHFXZfS7P0gD
         c1nC7W2uz2G1Nt/sDHv/Ql4CyMGDZan80fSsBKt+YoT50WejSAM2IVqeQx8/xs4eJv6H
         P4JEYNHNDAcoyccKdCZduPAopyClei3jnlKWOGSFFRpV/96w1YE2sSIGylkwqot8bti7
         sZi7aPkuyVCbdR6qmL2SZ/jFIJ5if6O4o7xu87QRTN+6Ik3b5mWImOQbs/SEr77DM+uc
         3bJR7JV1GVGMctb6Q1FF+UsgVySIWKgurl34HoC+PdExPXJJFF7wauUsU1gLv/Zg7JWt
         tf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738500918; x=1739105718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OMKG1kpaXWBH2VftDsuUeWAr8QcYNGM5yl0LKFjRV9Q=;
        b=UN0qLAxYYqBLzCrdo0TlnQzY9/FY9AfoIpcG3NFmp0KYuTCO3ihYyWKI/IHFwcG+wr
         pYvJCKMuqj0GJSX+eGyT2NQnX/+j1rMEURpILi9TyBsfzaqYmYthj4hSpZKOfNof4uAV
         aMKW/oASfRGFoZXZqkUt6M7F+Q3G3eIhgZfgwLYPlUuORFWGST1rIGlPqR70F4l5vf+H
         3mOTGxxqSpgQ0MDkUrF7eMewohgnpslv1eMbomccAu6uvASQzRcuVs/6a2LwYsU4AXJm
         kkiZ18HQEhXHRTBB/lIrMuEx9QAJdsHkai0rJWdu0K7j4dDzywErEbde+5v8zEWrH2nt
         AYKA==
X-Forwarded-Encrypted: i=1; AJvYcCX1dkV/FsK8cHWNK27aYe7/9NvuN1HI0xXUPOvAhJ0R7ocegcDFAqSPjzGx2WvzqSEW5G8ZE8QDf9w9G5U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzi4Ld8cN1rUUzv5iBc48R4jov7XlMzxpZM1H8+mxDgnMg+Eaq
	nQt4HPF+GLl9dSieqVYSAZajpscsO6ALpnQSeQDEUlRB+3jPIaBHVVM+ik7aFspNxsuRn5Pr0UD
	cZnvHxz+ZXH6/NsbVNAiyQjLOecQ=
X-Gm-Gg: ASbGnctPiAZEEMthGpAZy3j0DL1OMvk9VaFL7PSM8mVYWMnwGbgD629eGJAfzIrrCCy
	TYF4fA/9KV8kM0oMxQPDm0Z4FyaghKug34pdzozx3P3KJxN0cYwT8GLQ7/5mdA2pcheltQXWpoQ
	vlgRNzgdAdkgcl52ywBgSvFGzuMycEsu4=
X-Google-Smtp-Source: AGHT+IHCewNltA44KT35LdcI+962td7nMroLtNbt1AXQc1mrIqMlCUUH4fu1eq0iCXuyD6mLhZDOxPX4elkCSK/bM8U=
X-Received: by 2002:a2e:be2c:0:b0:2ff:d0c4:5ffe with SMTP id
 38308e7fff4ca-307968dd5dcmr57938671fa.16.1738500917419; Sun, 02 Feb 2025
 04:55:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250202-cstr-core-v6-0-8469cd6d29fd@gmail.com> <20250202-cstr-core-v6-2-8469cd6d29fd@gmail.com>
In-Reply-To: <20250202-cstr-core-v6-2-8469cd6d29fd@gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sun, 2 Feb 2025 07:54:41 -0500
X-Gm-Features: AWEUYZk3Rdbm_MyHpAJbPz-ZGHsc1Wxcqyi_d7uYad-8Gq06RXCIv-mD7knwESI
Message-ID: <CAJ-ks9mGs0Swc1L2WMuh1Y5q6STsiFuYi77RR1Nb_gK1GG61+w@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] rust: replace `CStr` with `core::ffi::CStr`
To: Michal Rostecki <vadorovsky@protonmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 2, 2025 at 7:20=E2=80=AFAM Tamir Duberstein <tamird@gmail.com> =
wrote:
>
>  impl DerefMut for CString {
>      fn deref_mut(&mut self) -> &mut Self::Target {
> -        // SAFETY: A `CString` is always NUL-terminated and contains no =
other
> -        // NUL bytes.
> -        unsafe { CStr::from_bytes_with_nul_unchecked_mut(self.buf.as_mut=
_slice()) }
> +        // SAFETY: Properties of `bytes` guaranteed by the safety precon=
dition.
> +        unsafe { &mut *(self.buf.as_mut_slice() as *mut [u8] as *mut CSt=
r) }
>      }
>  }

Whoops, this safety comment is nonsense. I'll use the one from `impl
Deref` above in v7...or just remove this impl altogether. I'm not sure
what the use for `&mut CStr` would be.
