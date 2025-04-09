Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D070C1C84AA
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 20:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744229882; cv=none; b=pXOrvf1H+Dz6WvwBtLeKEdWERPzzCBMcO8mX97wegI2ZBtupNhpCrL/DE6VJyYOdUANTeS/b/KNQD6K171Hpn5D6j4oHKZDDQ7aa+FjnQ1ZaAtxOoZrFqoNN/FXpcjQmD5dpp86QW0EolAZ8U7W6Hc1dYutUo9o+reF8Q6O7HW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744229882; c=relaxed/simple;
	bh=DN0wpjoBwbm62a2PojPzy9eL4TkNTyJB5bl5qwh5q5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BcITQBrjTYCWFyBjCiAB502AEIRyV+sOG4WZir9BUsZHNq+jmvKa+UMWrSJTSn6JuFmT3Nc2xBeQaBISaV4I5+ZGNa23b7a4BNj7KLgsiouAoP5EhBQReeQRFq6DtFIlwg9uaULAdlF0177IgV3WilsgxdESyQ2OL36XLce6VGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Mo86K5Mz; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Mo86K5Mz"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso4319415f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 13:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744229877; x=1744834677; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1bgWloY6Z/GPjOoVRp8gFI5U+gR/p1lk09lOlKvqmyk=;
        b=Mo86K5Mz2C2YZ/lCbp8AwSgUcxlfYpgkrNeQvpmRPm7PCzZSR8QwLZlDG4LSEEhF3A
         Uh1qivzIEGo561f7DoPKplRlk3DG/m3mkS8NzE9BU1QJmSuZ47fajbkFN/Bn7TW+QRwS
         scibgQoDNch7cgDHFS12ZdDsg3WHX6d0Jm94mdm7R8lZMHKnnp0QzzBZzApaG5C96CRf
         tX/QaXNAbz4xO68+gGCIVlafgyy+qAZ3gU/qoSmFtzutrwYCgSgNKXBdvP39H1Jk/c0c
         R8OF1+ROs2OCstR1WjgBL7NWUOyAxHTzt94/XLfb0FDOOUdSrT1gn0p+cE6aa9sUoV4h
         z11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744229877; x=1744834677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1bgWloY6Z/GPjOoVRp8gFI5U+gR/p1lk09lOlKvqmyk=;
        b=NrdPTrtYcVw5ymQHg+4Mti7jLiNSXh3mrgwiKB1kuloUQQHVno8O/1/SQG8hAqjGmz
         PEhej6wSq8qant/ebcaYUuLjhmEGuhmwyTCpKCWwOfGCdPr46erJfurjjfCTqAkna4iI
         YQ9Kc9g73fPcKbknOi38uITbhyC8Yq0xkEkI/CK9+1+Q4WlnTW0FX2XvOH7txsbad1nA
         yTf1BJlnasFygah3vO3yRPR7rri6tGkfYXOoWXbiMfh9mP9NFfdNUPeWZCL6COkRD0yG
         WHwT9xR1nfFhjco3HsBp4cG+Ph8Gs9+rCVM1TvDrF6x7HeZ63P1uOP5F9zsb6AKbE+S0
         RpTw==
X-Forwarded-Encrypted: i=1; AJvYcCUKOnHF9fhd3YdiBwwknTj/3j8oQ9SOSlt0gStFWJG9XPCwcB4ieDODya3CBVWmR4L6VTQN/oTFKGMdZiA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzE1h6pw/ooOLbGer01yc0q7AQ6GDHD6MEnAe1McPc7Ej4O+Krb
	3mydkbBUQoJiwCRePQ+9+y5TFah3wh75YOLBdonEImLQojEqyrBlaZh7oa3T1peq1/XSynNrtMS
	8vAk3Bxpi6tl1952krw8oEg/mwRmgiZGmOXvx
X-Gm-Gg: ASbGncuX3FpT3ap/jdltNbDAPBvgQy1VjDWoXTeBr7mJp5JeNIX6ThG2NKowzsi2XVL
	68dBR72tleGba0lph2i4lYtHSNX0AGXY3ba6wOMB6aQwJ8LGXIW0Q3H2piLg1dckBPiKHTMXVdR
	z1gSZ8kIEQ6oYawNABt+ho5Jc=
X-Google-Smtp-Source: AGHT+IHF65zLg7feilUYDheUibZgFpivGomhAMQ9nvtXy1QRwJ0EXV2IXKYLDmuiA2LwoPriA5ZqZstTr5vam02ZaAA=
X-Received: by 2002:a05:6000:2411:b0:391:2dea:c984 with SMTP id
 ffacd0b85a97d-39d8f463cd4mr86810f8f.11.1744229877002; Wed, 09 Apr 2025
 13:17:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319205141.3528424-1-gary@garyguo.net> <20250319205141.3528424-3-gary@garyguo.net>
In-Reply-To: <20250319205141.3528424-3-gary@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 9 Apr 2025 22:17:44 +0200
X-Gm-Features: ATxdqUGIImZWdIXFXkMtgq_6FpLUl4WUHaHz6zPbTJ9JLlSwvxfpfqMMQQdWOGU
Message-ID: <CAH5fLgifMPxer5TcWUBUYKtGsPFryqPVwXT8-5qmmY6F3=nuBw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] kbuild: rust: provide an option to inline C
 helpers into Rust
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Tamir Duberstein <tamird@gmail.com>, Christian Brauner <brauner@kernel.org>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dirk Behme <dirk.behme@de.bosch.com>, Daniel Xu <dxu@dxuuu.xyz>, 
	"Steven Rostedt (Google)" <rostedt@goodmis.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	"Rob Herring (Arm)" <robh@kernel.org>, Matt Gilbride <mattgilbride@google.com>, 
	Paul Moore <paul@paul-moore.com>, Kees Cook <kees@kernel.org>, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 19, 2025 at 9:53=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> A new Kconfig option, `RUST_INLINE_HELPERS` is added to allow C helpers
> (which were created to allow Rust to call into inline/macro C functions
> without having to re-implement the logic in Rust) to be inlined into
> Rust crates without performing global LTO.
>
> If the option is enabled, the following is performed:
> * For helpers, instead of compiling them to an object file to be linked
>   into vmlinux, they're compiled to LLVM IR.
> * The LLVM IR is patched to add `linkonce_odr` linkage. This linkage
>   means that functions are inlineable (effect of `_odr`), and the
>   symbols generated will have weak linkage if emitted into object file
>   (important since as later described, we might have multiple copies of
>   the same symbol) and it will may be discarded if it is not invoked or
>   all invocations are inlined.
> * The LLVM IR is compiled to bitcode (This is step is not necessary, but
>   is a performance optimisation to prevent LLVM from always have to
>   reparse the same IR).
> * When a Rust crate is compiled, instead of generating an object file, we
>   ask LLVM bitcode to be generated.
> * llvm-link is invoked to combine the helper bitcode with the crate
>   bitcode. This step is similar to LTO, but this is much faster since it
>   only needs to inline the helpers.
> * clang is invoked to turn the combined bitcode into a final object file.
>
> Some caveats with the option:
> * clang and Rust doesn't have the exact target string. Clang generates
>   `+cmov,+cx8,+fxsr` but Rust doesn't enable them (in fact, Rust will
>   complain if `-Ctarget-feature=3D+cmov,+cx8,+fxsr` is used). x86-64 alwa=
ys
>   enable these features, so they are in fact the same target string, but
>   LLVM doesn't understand this and so inlining is inhibited. This is bypa=
ssed
>   with `--ignore-tti-inline-compatible`.
> * LLVM doesn't want to inline functions compiled with
>   `-fno-delete-null-pointer-checks` with code compiled without. So we
>   remove this flag when compiling helpers. This is okay since this is one=
 of
>   the hardening features that does not change the ABI, and we shouldn't h=
ave
>   null pointer dereferences in these helpers.
>
> The checks can also be bypassed with force inlining (`__always_inline`),
> but doing so would also bypass inlining cost analysis.
>
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Tested-by: Andreas Hindborg <a.hindborg@kernel.org>
> Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Is this compatible with DEBUG_INFO_BTF? I'm concerned that we have the
same issue as in commit 5daa0c35a1f0 ("rust: Disallow BTF generation
with Rust + LTO").

The commit message should either explain why we don't have the same
issue, or this patch should prevent configurations from enabling both.

Alice
