Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9721DACA1;
	Mon, 12 May 2025 13:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747058153; cv=none; b=IWmjaExYc11mSNsDGJT8uqfW0DJLD0sANScWLjebABAnCvSKWDtc24ZPdE77SpzX4DeAGELtFO382v0bttaLUwKaGEyUMKqqOYSWAw/3oDV9se1y4KMiR13dpqxHMg9e4PntJTRX6tp0QNyni160yYRjnlsvJK+z4Jf7wd45YmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747058153; c=relaxed/simple;
	bh=+ZZSzyIE925hYW7q42//ezvUz+07QvMzLEpyUvxe9Xs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pqJX+7oKJncbR73erSz8w0iFYR9wSGWZB7i1DIGvqCILn73dtDpFrc2IFTNznC7d4OKyQfCKSlk5lBzF5BhQRuFsgHazVIZKDxMgwUFBooyusrWmUEG7o+BBo0Kl32zlvet+W/Ss7N3UUr9KlNdpoRp1Ji73mnMuj5w/v5g76jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=InVSDza7; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="InVSDza7"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22e696bbc85so5255095ad.2;
        Mon, 12 May 2025 06:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747058151; x=1747662951; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uagD9PML4UKLbVE3TK9z0hidHWU3xrubZHMIlw3aa6A=;
        b=InVSDza7OyZEGp64Rxjf0eBphpJNd8NfDNajZXaVMoewlyNtkaQTvt8JAtK7OVyVlm
         6KOCNZConBbwuwvNfTI0tDFUb7519lTkZowAk1xpqp3OfTf4sUZ+vSwe+i2WNi8tRX64
         NwXQYR64I8jBULwVjbCO+B82neG1bNwAgjA1sv9aKMX2xF0RTWuhBu+4/ipb/AEu8IbZ
         ZC6a8n5ISFlPJxN5wXjEGXZwEXSLaVV4FU1LJxqJrmxLmKeC5UNhW+gsTIn1IVdv8DKT
         NXoJn93U6tBD536Z69mKKJWJNQtOiOGre79uG0d4LPAc5ThFrrPIRXDLsm+tZPI1K1JV
         zGUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747058151; x=1747662951;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uagD9PML4UKLbVE3TK9z0hidHWU3xrubZHMIlw3aa6A=;
        b=HyoUUOvvTYR2J5XRbtJdn3F+NjHzlGm94zbVE5B8ZwewQ3zzP0JOtzBaXJX4ULUAvE
         4nkIjzXT6ek7qoWmw8qEzmntFtxK3LlWozigqBmjG1h2NHojtvnkImb5GimdcRvqryDb
         Xi+kkk3HNt8Wm7mCHDrAhjSDfNxXQkqv/2eCFcT3TzDd1odpTzcOMGOFH8sFcivUUq7m
         qe718Zi6UveasayR16iuLxg6BrRy+Uu0uwrtK1MiTDqCN5B4sB6uz562FjMw3OJiqW0i
         GwqvQC7ADazmUAYpv279FnwaOK0EE5uV13CZQXlKFnEZnowcMloJ5s5bBfiHZ2QXwshM
         lK+w==
X-Forwarded-Encrypted: i=1; AJvYcCU6smp9XtZQnjxSlZm/r5sDtvXwsqnPx8jWM+v6a3rE/6YUe81glRrnrkYUUSmxNXKUVrsQwptH+WDRixItUIE=@vger.kernel.org, AJvYcCX1IH3Phxg5fjWFjCWkS6mtB0ARFhC/89X6aIjylCDFgzlzjrcF9pU3xWE7/aTXSaGZWEPm4EI8lUqp5DI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5/p6fs3LG6M5pxHPhPm5Fopk1Ip+U5z1nqHBHW/ABVPCvubLS
	pRsdnykuTID4ljefokZCSRj6/K64HoAv2n65NlAFcW+iykXzWttNCOLejJJt/APZnHSIIiWismC
	l/uZQueBlvLkbDjbVQAS1E1XPZTE=
X-Gm-Gg: ASbGnctjArYDELdQbWr/VdUDUf0xrA3NBoVbYL0e+nNoYTu+c5+i2sojdU4HzRtCuRz
	rhLfwBIFLL616K2oG6GZUefX+xYvbq0xQ1UwmP89PiJbY2Suh5f3qHJ410AIHHs5ZkUtLkO/qdW
	h/FisE+aaKMT2Dd064inr2OisOnW+yHuUR
X-Google-Smtp-Source: AGHT+IFM0DnpRaQKkaWcwkchrJ3QrCTyVQMGRqJs2wr/StUOKT3dl/zrI3+MhxJsKUpkerRo8rtPtT+oQxFxgCaqxGw=
X-Received: by 2002:a17:903:443:b0:230:413c:d46b with SMTP id
 d9443c01a7336-230413cd6b0mr11618955ad.6.1747058150937; Mon, 12 May 2025
 06:55:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325133352.441425-1-andrewjballance@gmail.com>
In-Reply-To: <20250325133352.441425-1-andrewjballance@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 12 May 2025 15:55:37 +0200
X-Gm-Features: AX0GCFuoSyH2lQY6tvCfxm3orzDtbjWMIdmxl-_VMfgu74lYck7z6XPjpUnzfjs
Message-ID: <CANiq72kFCo-5HwXsTDsE=AKx2GEJvQn605F_07jfrXBRB-rOmA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: docs: replace rustdoc refrences to alloc::format
To: Andrew Ballance <andrewjballance@gmail.com>
Cc: dakr@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, rafael@kernel.org, 
	jubalh@iodoru.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 2:34=E2=80=AFPM Andrew Ballance
<andrewjballance@gmail.com> wrote:
>
> replaces alloc::format[1] in the pr_* and dev_* macros' doc comments
> with std::format[2] because they are identical but less likely to get
> confused with the kernel's alloc crate. and adds a url link
> for the std::format! macro
>
> Link: https://doc.rust-lang.org/alloc/macro.format.html [1]
> Link: https://doc.rust-lang.org/std/macro.format.html [2]
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>

Applied to rust-next -- thanks everyone!

    [ Fixed typo and reworded slightly. - Miguel ]

Cheers,
Miguel
