Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13D31D416E
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 10:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739184939; cv=none; b=pPuQ8x1arEvIR2pjn4fF219pvnWB7vbuqAbhG0ovyLUQ/SMSk4lXsUVb+XynCJho7vO+HRjGGQaI+tFQ4tQAaHHJqJWZmoLdQWb1QMk1Q8t/msU8hPupoUkcCEDU3c9GxXBqnVYmEBxsQjKF9LKxLtS5hwivaRbMU1a9W7s8USM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739184939; c=relaxed/simple;
	bh=kf1Y9IksG1zOAT0N3rbawZNMzRh8UBQZaZri2h5M3z4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T0I1IQHqeJmkrr28Oluc86DwZCVcgssgtoRMTIJ9zcscIDox33+QrjMbOiO8oAanFAot0freDP2OP3WO8c8Jhv8KtE9MtyI+0dabawHiP3Xyll114QZiM8t2v13dxoLNfl3awZlZ8M4CjXZoemoGTQ/Dv4Q09WdcwMiq3n5w9dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=km4giSgs; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="km4giSgs"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c0155af484so574848885a.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 02:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739184936; x=1739789736; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZTbvRf06WHH8ABQ5ROT9cJPfdttTdmuqStRfKNnJIo=;
        b=km4giSgs/Z7YO1DQYmJWPFO889OaOowY8MFetNgXj6Ys0OlqM1q4bzmSE0/KYk+G89
         QL1YDGN+lPrV3cnD2h5J2v4he/0noK2yv/QGDXKVu4thnQfIcLAwQHLTWMYm+e3voeXR
         Amsnebt3SqKTLizOqX4q7XpnMS2hfpkoD7wRZkg8Wob0PMQIOYkILwvIlVZv1fcJjPM3
         fwxQSfFtMJGAzMYmITtzsUe5GidkpVfg0XUlUM0QbhUTLutq27H8MbScy8rXGXtgFJCI
         WyNHcAjWHG4zgkBFOsQBK/TWDlbbBBkEko/C78ah3cPcw21F7ggtlLUC8MaAQ5DydFOS
         QfgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739184936; x=1739789736;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZTbvRf06WHH8ABQ5ROT9cJPfdttTdmuqStRfKNnJIo=;
        b=nujNHJwer4GJyHkRr2BuAGwlVEMfCeR/qxTIKbl2jsmsNuMfWXEBNIrYNGHIiKLfTW
         GxEBJAura0giJDLkF7AhTO6fg9JgtpaC4xSlM+Q+5Lft5xS77fGH1EHPEaCs/NNgNoGf
         1eROE7xBxSUZgv39o7sMwt3LavGEiGFVFhIndnWb486Cuuy+4ACiV5Q4E92lkjaMdSsy
         4SV8gpeL+1yhu4Dl7+vATjdItIcDMHVPkxub/OXN0uge0fOtLyfKOkdghivI1k95b31W
         lhDaueL0RMmsQXoOAL5cbVYgiEqWYry+a89KZH++TrUa9GnlCrkwpMlc5AMbWaHjbVYo
         7xgA==
X-Forwarded-Encrypted: i=1; AJvYcCWpNDKGfuhkilIvXcr5SH5o/xQZshGlOipaXfSOnmYP3ao42PcA1spwVRobnlZahbj99eELfTgiBnO/Imc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMxSSuubLASNxBXaEJGWCpg7c6PLT4rrEksdw27dXtxWxREgf6
	9DOETP3qd/Za6/q4YL+8g28AcXHu4/aW8q1BQRFvokjFF75D6Ph4BsuzwlVCivuknxvZDsbYkPs
	b03ooX6pDCpFXcZGEGLzzZsH7MWS1P7un8ZMw
X-Gm-Gg: ASbGncunvgZ7isrMkqznZff1ktuf+XNm0XVc52hnNE3Dh2NcLg5Z1/6QmCJtMDuHdXK
	b+FMYXXWcrpqtqeWGuCIaRzR7GBFmo7bJdg6sCM8qzygpFXtdQg0VcdYszrMGFeBQmhfTI0NMXQ
	==
X-Google-Smtp-Source: AGHT+IGsHeoYwaR4b+cLOfm/IAdj6GsgRMKpMsh5eDAWykiaAPiYDe+1fWfL4we3hSi/6qmQMlor2HnWS/urw9Rblt0=
X-Received: by 2002:a05:620a:25cd:b0:7b6:913f:3df3 with SMTP id
 af79cd13be357-7c047c8cefcmr2158684585a.47.1739184936471; Mon, 10 Feb 2025
 02:55:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250208-rust-kunit-v1-0-94a026be6d72@weissschuh.net> <20250208-rust-kunit-v1-2-94a026be6d72@weissschuh.net>
In-Reply-To: <20250208-rust-kunit-v1-2-94a026be6d72@weissschuh.net>
From: David Gow <davidgow@google.com>
Date: Mon, 10 Feb 2025 18:55:24 +0800
X-Gm-Features: AWEUYZkS7f05xkYouMN4Z_uHeEj0_BcTyQqJQGir943IvZJ11LBZ9jjVfVs5i-0
Message-ID: <CABVgOSmkny3ir9G6XnMmWUKW9Z9vX+6mkd9MCjo9cd37cm+eCg@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: add kunitconfig
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 8 Feb 2025 at 21:32, Thomas Wei=C3=9Fschuh <linux@weissschuh.net> w=
rote:
>
> The kunitconfig file in a directory is used by kunit.py to enable all
> necessary kernel configurations to run the tests in that subdirectory.
> Add such a file for rust/.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---

I could swear we already had one of these lying around: maybe it was
in an old Pull Request somewhere...

Anyway, this is great, thanks!

Reviewed-by: David Gow <davidgow@google.com>

Cheers,
-- David


>  rust/.kunitconfig | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/rust/.kunitconfig b/rust/.kunitconfig
> new file mode 100644
> index 0000000000000000000000000000000000000000..9e72a5ab03c9a122348fea7c1=
db69e1b3fedcc00
> --- /dev/null
> +++ b/rust/.kunitconfig
> @@ -0,0 +1,3 @@
> +CONFIG_KUNIT=3Dy
> +CONFIG_RUST=3Dy
> +CONFIG_RUST_KERNEL_DOCTESTS=3Dy
>
> --
> 2.48.1
>
>
