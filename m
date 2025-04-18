Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D444A215066;
	Fri, 18 Apr 2025 22:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745015416; cv=none; b=txgU348QbaYqtBfYzh3uElkJMqDKns9Oz7tnY+6ClXTHNPElKO6I2aZIQP1F9eMX/cmoGPH1PRz79v4uO77FXHi22NsbrQ9TbMtbKQ+67rUe3uw8qw1ThDLnZljMfbmmqhHTCPviL6kwW2XJXPr6oziuFH4k0VPa/jzj4KNNTm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745015416; c=relaxed/simple;
	bh=zkoZNkcg8xsjJ7WQXbeltGuC11SYz+mHZwZh4tJ2mXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XdzkYxIx45q0lcgUGmMHB413cMkbHEuf1f5pT7r1gUCswggJSzlG4+uD+SKXBWxtaT5Xch4mVCJyLkghG+1bepICQ594F85jDh3ddPIC7kpzzAj8T+upoLyoqm0CY7TzHRtlf7tIFQw2N+GXA7fdimmzbF53M+TIaTou0+MbYQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XRiAy+r4; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XRiAy+r4"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7370f389d07so210438b3a.3;
        Fri, 18 Apr 2025 15:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745015414; x=1745620214; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mpl3W4dIB2fYN/5rZ3qoigNWiCJKGydTdscNJ2zvlFI=;
        b=XRiAy+r4yGg2z4zIddVmGE4OvZI3XZOFrf6JW3D1TH/sBYisO5GDBP9Ay3pzowtmDU
         UFLgG2FYzrOUEv3tX/ntPQQuDNM8FbDI6IppyIagsLx/gwHdHn6zHgxrcu9/DPeeS7uf
         YDC4ULOFaq/XuTNNfE8OQAv+N2CXC9vkQntVMqFtDyTkAtKOJD8S3OhmroMT4xyrfcj5
         9juiT87liuUdeVQ+0Jfcw4ToKHg5kb2oHLr0+ZHip+PkEP8rxU+qe0zA9LFNWMYT9bEs
         e/92coNN9gHHpB+0elgjOXpsSopPeOyZqxH+1z0d2Hgr5aQe6yW3kQE7kL7L6/IJCQrc
         vHcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745015414; x=1745620214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mpl3W4dIB2fYN/5rZ3qoigNWiCJKGydTdscNJ2zvlFI=;
        b=vXsVgdGPggIG0doLpUX0XQRK/4xSnOSwp6Wunj8JxTxfc3qMBFxDp5fbqtgud3pr21
         B3P79T7kSChVbkms+kKEphAURt2cp77m1L5bntRslE8Bv+ujPcQOOA881RqB4z1uiuH/
         ccMWE97xfo8y8t2Bbj4FjoPnSCi85d4eV7znrCoKuGNus/romydCOFa0NxU+jjLEgIAB
         Zsq4PmnNYzS1FOPrhwmseSbFbS6iVviiyh3A/F9VGh0OJ/dI45XCVWgQTwctS8B+JPgB
         /Kk6oavftbODB3B32ogA4xeJ5sDhJBcviC5iPMwFG4sd0KkV0JYxciWreKMRs6MFwarB
         BHig==
X-Forwarded-Encrypted: i=1; AJvYcCUwoIgkKo90+QQcTdrAEgDQQ2bN37wzR9o77cRjaLxeyNA16HlMFcZelGy8urj+bXvkGMOo2h9n1fYki3U=@vger.kernel.org, AJvYcCV1813Me7ha5XSg/BDw6YpuM1UEbLdcBNl8UYFcWDQrDEON98/s7r473WuznEfpawQr3D+uqO/BIFZZyIZ3kbk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTKjnAYpqGEijfEJ/H0TeobCTLvpfZwS+sOe+EFAHkmWQW9APi
	GJUexbK0lhrjZCTZfnoO6Ab9zPoQewx4M6ZblEXC1bud/Q7MNVvMfvGYNJ5Z2uYoLtLx62r86YW
	yFcFT3PUN3w+/pNZlgDi28bU++1Y=
X-Gm-Gg: ASbGncu+FR0RhypaQxfisatuDHsMaZy8StZ2q4AG4MN/qUqjEqmUyS/YY3dDbKsFOqY
	/+gP8iHj3caAxCzkaoGRqgpTYtWlDBxRuRR9m1AuUJzrYVzyFF6HtB9KLhE3TZQRGnY1cDlJlP3
	QUt8lM6HuL+rVcjiz7ks/lJQ==
X-Google-Smtp-Source: AGHT+IFn8FiE8jazdZ6wyVZ45DOV0C3nC7qTp20z9exYfm7HJ2BvJ9N8pN3jaM48vWusyZfaTNpZMquqz7M51hKOKcY=
X-Received: by 2002:a17:90b:38cc:b0:2fe:91d0:f781 with SMTP id
 98e67ed59e1d1-3087bb3f2c3mr2159127a91.2.1745015413940; Fri, 18 Apr 2025
 15:30:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+G9fYvOanQBYXKSg7C6EU30k8sTRC0JRPJXYu7wWK51w38QUQ@mail.gmail.com>
 <20250407183716.796891-1-ojeda@kernel.org> <CA+G9fYt4otQK4pHv8pJBW9e28yHSGCDncKquwuJiJ_1ou0pq0w@mail.gmail.com>
 <CANiq72napRCGp3Z-xZJaA9zcgREe3Xy5efW8VW=NEZ13DAy+Xw@mail.gmail.com> <aAKrq2InExQk7f_k@dell-precision-5540>
In-Reply-To: <aAKrq2InExQk7f_k@dell-precision-5540>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 19 Apr 2025 00:30:01 +0200
X-Gm-Features: ATxdqUGpBpE_G6Uu2qNpTDVaVBlF8fn-vW8cLwwPBuctelO67ZKLVYcatHIb9lE
Message-ID: <CANiq72nPtr1FE_SBU_+wHVptfjnoSGaxjP4LWMzVbOF0M6LvnA@mail.gmail.com>
Subject: Re: Build: arm rustgcc unknown argument '-mno-fdpic'
To: Ben Wolsieffer <ben.wolsieffer@hefring.com>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Christian Schrrefl <chrisi.schrefl@gmail.com>, Russell King <rmk+kernel@armlinux.org.uk>, 
	Rudraksha Gupta <guptarud@gmail.com>, Alice Ryhl <aliceryhl@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, anders.roxell@linaro.org, arnd@arndb.de, 
	dan.carpenter@linaro.org, laura.nao@collabora.com, 
	linux-kernel@vger.kernel.org, lkft-triage@lists.linaro.org, 
	regressions@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	torvalds@linux-foundation.org, Nick Clifton <nickc@redhat.com>, 
	Richard Earnshaw <richard.earnshaw@arm.com>, Ramana Radhakrishnan <ramanara@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 18, 2025 at 9:44=E2=80=AFPM Ben Wolsieffer
<ben.wolsieffer@hefring.com> wrote:
>
> FDPIC is only relevant with no-MMU targets, and then only for userspace.
> When configured for the arm-*-uclinuxfdpiceabi target, GCC enables FDPIC
> by default to facilitate compiling userspace programs. FDPIC is never
> used for the kernel, and we pass -mno-fdpic when building the kernel to
> override the default and make sure FDPIC is disabled.
>
> Therefore, it is perfectly safe to omit that flag for kernel builds with
> Clang.

Thanks a lot for the details!

To clarify, this is for GCC kernel builds: skipping the flag is done
for libclang under GCC builds (because `bindgen` always uses libclang,
and `bindgen` is used by Rust to understand C headers).

So GCC will get the flag for the C side of the kernel builds, but
libclang will not get the flag because Clang doesn't recognize it.
Thus, if Clang vs. GCC differ in how they compute the layout of some
type, then we would have an issue "mixing" them.

As you can imagine, GCC kernel builds with Rust enabled are a hack due
to that, and it would be ideal to get `bindgen` to somehow be able to
understand C headers as GCC does:

    https://github.com/rust-lang/rust-bindgen/issues/1949

Cheers,
Miguel
