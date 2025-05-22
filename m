Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C36FEEA6;
	Thu, 22 May 2025 08:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747903044; cv=none; b=aMbCKjj9I3BzML/6c6IG1Qlmbq/dAiFtm6QxuaPsPqoOPBEwsSGA912vZoEGpIg6cafIpuMBWFgLug3LplZIiER8DJH4IcxFMXWB0qxDqOcNT19w6xYidfMIEqYbPGqc5aHqucQRsYtVh5v+g5xEpX9S62YzMyk/PHJIMxZdNk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747903044; c=relaxed/simple;
	bh=oY4+UgQCVvoQesJJge7kprCNLqjSqhkBf7sdCr6VYtg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mtIR6jqy8aEgngRcYJsq7vxLTOMZyBynDxZAUxWr6CDdNAPzbHhzwrjY9Kfh5PC7kjnrNp5BFL1kOX0Ob+4NrSKAVC+BJKStgyweR0Binhv5G01VQD1N07c4tca9OV9qCgObtvv0TUwMeoBDa+lbCobwXMj0MjuXDgj1CKGjJzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=akFnLoL9; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="akFnLoL9"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b07698318ebso1094759a12.2;
        Thu, 22 May 2025 01:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747903042; x=1748507842; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oY4+UgQCVvoQesJJge7kprCNLqjSqhkBf7sdCr6VYtg=;
        b=akFnLoL9Y0b6jAGLCJWIrWNsAGbE5EiHJ/XRWXT0rYY/eXJ6g+jF04c33dxEVAy39Y
         3X30TgVY8J+82EMaEG1eBAtcTMEXFIyEYwHc0/TfOQvFsNlThxlASsf+dvrRv42QiAAM
         JRwB+oYIteqEp69uGTdjJzr+eG2bLeUbJT7xDSrPLWxjRDgGkSKKxT5n9m8JWL+yWCAu
         eBORPt1zYIjckToRMvUdjptxq84xlKcfxfnB/MIT20RVdG1SpLAK2QYpLk/+b6TkJkon
         r9H1g7KUTAUj1f4dDbdupcfro7cWPdU+1eoXNzhx+uUp+g5kYpvdza0krerYQoN7MkRj
         9IQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747903042; x=1748507842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oY4+UgQCVvoQesJJge7kprCNLqjSqhkBf7sdCr6VYtg=;
        b=VU/znM2zKfE6JKU1nNTUNBwBYvT7ssqQuAy/txe8fHVr7xThzmDvUDqNGIT7OWlRPd
         xhCntFn0qpjo/JZ++VSNiNjEXFmibysuL7olaj9YxKqgBgnRDs9im2IbXmA7HtTpTl6v
         HPreZSebNachsm6HWnz8wWRJ1cO2WybnN0uCcDB3oceJ2r6RJ7BDn528FK7I0FmrOxWx
         gFMJ9BKKDzfQdaxJgEGDQFJ2hHJ9lEFxfV4wp/coMlgyLWuJfWFpOvcuk2CtBVaO8/A3
         MprlkU0t2QrElKMtIcWy3EXX3x3j8QLcJSw6zOA1Jrqg03dVTTWJwXJ+vPplM4Lsjpba
         VRsg==
X-Forwarded-Encrypted: i=1; AJvYcCVxOEwv2WcOgByfR06Imko6Dj0n4svXksqgwQKCpQfdvMjO4qKbDSWduS5umcJFaps/XQPr+qr95L5/pMK7Nnc=@vger.kernel.org, AJvYcCWEpIeePJoilUpH1JxQyapRpK4+1Kk879Auo9xcmqv3QN7rZ0FFBF7mOO7NHY12y8zS/C4f6zs1zhLOGvE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl7VriDRFFfrjNLMzP0jBIJEpocUmfvJHlbnx3VlPFCQtrQsxO
	zZVc3jQWX3exmW+j5YsTUINsptYldoPEg+7/Tf7dEUN0mXiavvldcbznzoG9IMgRICyct2JIJSg
	rDIz5SzK3kGKNtBGBMe6X+E69JaGYfIE=
X-Gm-Gg: ASbGncuJ00gV9MvTwDaRpn5Jv4K5l0tEwFdeaVg2oHNoLPyeKzx2t2acdctvfLB9eMt
	mpDQnu3RaAQ/p4MFuvjX2w8rb4QL4SgKUfOlACUXhpVUIK2ZHP2+5NEbLhPWg3pX3tElsjQTkxM
	wcVNnLsfUmIXZA/J4IOmoykyDBwns8Uk7BFwnMw2HBPUw=
X-Google-Smtp-Source: AGHT+IEEEZdQ7euhtyjeEUt4MOuFHCd4s8owX7AJtPg4uB48tfhP3RNVjlK+dvshh5EuQ2s2FY4SiTALhxEkYKRLYlQ=
X-Received: by 2002:a17:903:41d0:b0:224:1005:7281 with SMTP id
 d9443c01a7336-231d43c3d88mr121146085ad.7.1747903042265; Thu, 22 May 2025
 01:37:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250326-topic-panthor-rs-genmask-v5-1-bfa6140214da@collabora.com>
 <DA2D41UHSQTB.2P6FHWB6TBVO7@nvidia.com> <CANiq72ny+uSZ8wNyqozTUNma1tKfS4du0yd4+nTjioYmyw25CQ@mail.gmail.com>
 <DA2JMEL971SA.3J61636AYG6E9@nvidia.com>
In-Reply-To: <DA2JMEL971SA.3J61636AYG6E9@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 22 May 2025 10:37:10 +0200
X-Gm-Features: AX0GCFufmhX62WtMvz1y_1so_6WBJR_Ow8DXOt09i5c6TUoUoFRqmUA2jAKdXpA
Message-ID: <CANiq72mAmbgoE=1ko5tC5xVjPRYQPA+eAU-uK9Gd6+m3WGBYKQ@mail.gmail.com>
Subject: Re: [PATCH v5] rust: kernel: add support for bits/genmask macros
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Fiona Behrens <me@kloenk.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 10:23=E2=80=AFAM Alexandre Courbot <acourbot@nvidia=
.com> wrote:
>
> Like everything else in this module. :)

I meant it in the sense that using `build_assert!` means one cannot
compile down a "concrete implementation" because the value wouldn't be
able to be checked (so it needs to use generics or otherwise be marked
as `#[inline]`).

Cheers,
Miguel
