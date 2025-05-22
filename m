Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B681EDA39;
	Thu, 22 May 2025 20:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747944352; cv=none; b=nyB0j9DqRsIezGgKOJjljOsbcmIJwnVZm1oCumsmCISSLabB1xOLan5dxVB0tO1ZTgZ0QHfSFIBNsuhtTantSTkp8k9P04doGECUJwnsj5s6nTfkoDNGBPQ0mfkfbawsLcr3AjGOe9CmPCAkgA6gNVIYJSAk/9RlllKGPJF/HPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747944352; c=relaxed/simple;
	bh=PwXql5ZCCKKA4XkDZsjmxfvBZJ2akfXd0xfKzICmRAI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FSdA+uD5Yk2KPpMXeBgqsaD/4LE+HGUaoXRQWW3pE7czLoWyaTbOAqdQrLjXdPysxWkY2SEdURZlOhnzKVc9gLcgcukkAtIYX1FMbMbfeLQB2dq9Qxjeu9/eFaCg9YjujN+XQImjFAu0t+gqg20rVuOWeKzzghXkz4m7gQrnBlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QI2mnTcH; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QI2mnTcH"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-231c88cc984so8515675ad.1;
        Thu, 22 May 2025 13:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747944350; x=1748549150; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PEAP9pb/0X/MHqDazxQDkHXQgCofrGr3ghVoB2vRtOE=;
        b=QI2mnTcHdAms0/mXpLl0lqvAUK/BxM80gMJXu/Bspk8C5UtKV5606faH4V/Zmb2gXn
         c9K6nt571x2SIETk0JnDgl0ylvFY21EoSvFIF7XVg9O4RFl6lzEIhqyfkMkE1aL2IbQx
         Xb2ZizQkizDjwI3oLGG8gXMXnQKLAdZyv0dhPja3P5CDq7NvPLOTzd+dE9CHy/6AhEUi
         x8f7v97/i8yKkyM3wFH14sJNTVYXQ7hvIA15YNdpmgDYNf34KkeUKbzO2wSWTKzAQQ2L
         wmQ/LCiBPrWGAMEAJTAEEVZUZjX2wpYhS2Ajwpb3mkcNqEC+P6ZRPFu3+Cc+t0m1oYP+
         EL9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747944350; x=1748549150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PEAP9pb/0X/MHqDazxQDkHXQgCofrGr3ghVoB2vRtOE=;
        b=icvnt9hMBJfnFzAj5eiXh7ZrGCDUFm8rImNSLJ/Ht/fxv8ZJyg/Xwwm1+p4ZzzRDbs
         fxONZ1hwNJZhPg2VNLxN+ayL4g/TgJKWF9rSvLpRQvYG3yPi8cscB9mWBKFBgpVc+ctf
         YY56l2J8rz9XdHuBJlg+zLxbybHo1RSvhNUKU7W8ZJVbL3nGbD1sEntCKgXNVdWao2tV
         hrkeHaC1PUJATX3G0QhSORXjzeDj2ueSzkkXkWEuORm9mtHc+UbOvraN/DwtqqgZjQW4
         d+3HZxncAlPDJvxs6xe5v3vaL8VOEEOgimtpcVCTKKzvE8l9ZcSv67VusbY1MXg6Z9sC
         yqRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpVVkbOVsL8KZXl3W5kdJ4LEHT6qwr0/Y/am4IYD0WErqzgVsVR/PcOUhd670fRV9noc6PsBN1rGnOW7E=@vger.kernel.org, AJvYcCVnDs0xiAoPL/5PtIofgLgBJI+uUCTtwBZmxgtJyYto5u+nHVGdlTZfD6IYHIS40Q/CIazJaBkHUTGVWrHccWA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoTI32ME7OON1eSEw7MpzIyKDLsOnHHVW7auUbATORrjhwmu2/
	20abbadS3sBIG8KBzpGH4J/R2hQwOHX/jY4tiP/b1VXcMWE/WZMd5aSbRuC0tT4jeS+REtzttTk
	roWx+0mTUpBUfkmCE/sOPTOkBF+6pPNg=
X-Gm-Gg: ASbGncuC9roBCK7Ijm/vLw5I+JMUnG/snG1eQagfL5af+r826U2tjSPLGDvrD3beCy9
	Ds85naRwmyjWIltVqiLXSfH6Zgcg+wHSuq5JL7t3P5UtqxsOkkgyp5rI+40eGVI/cX4+d/pYvM/
	xWnLIFyr5F3ECIZcn3mNNIqTtax/+cs+xf
X-Google-Smtp-Source: AGHT+IGPM4c++XAu2BeE0v0Qn2lebj+uX6J1h637R5QAppETAHsqqSaI+d/qnmhdsieSt+fAB2/XC93MamPMrxQDWBg=
X-Received: by 2002:a17:902:ea0a:b0:224:c46:d164 with SMTP id
 d9443c01a7336-231d43891f9mr125907535ad.2.1747944350417; Thu, 22 May 2025
 13:05:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250413005650.1745894-1-ojeda@kernel.org> <CAH5fLgiF0kZdOYaQi18_LTNx6Onq-5PBomA=bwS0m0z+C0wtvg@mail.gmail.com>
 <CANiq72ngfTJ5PTYaJOOQ2NedERrLYzA62hL8Fgw5C4QkuZ2R-Q@mail.gmail.com> <Z_0X8Z9M2H0mmcK8@google.com>
In-Reply-To: <Z_0X8Z9M2H0mmcK8@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 22 May 2025 22:05:37 +0200
X-Gm-Features: AX0GCFsd3MjqVKVYRSlSmd3gv8L2oHNQPn44WQ8nmzQaz13xEZl3bEswwymnTDg
Message-ID: <CANiq72=ttuQYrGNDqNZDmBN5G4TUpna+ex8eD85HvOP723frDw@mail.gmail.com>
Subject: Re: [PATCH] rust: add C FFI types to the prelude
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 4:13=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Hmm. Maybe, but I think having it at the end is okay. Could we catch
> core::ffi with checkpath instead of clippy? Just search for core::ffi?

Sure, we can add it as a good first issue (Clippy would still be ideal
-- it allows to check all the current code).

I came up with this, which puts the right way first:

    Rust kernel code refers to C types, such as ``int``, using type
    aliases such as ``c_int``, which are readily available from
    the ``kernel`` prelude. Please do not use the aliases from
    ``core::ffi`` -- they may not map to the correct types.

If neither of you are against that, I will put that in a few days,
including Danilo's tag.

Thanks!

Cheers,
Miguel
