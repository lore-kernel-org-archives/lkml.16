Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323E6367;
	Thu,  1 May 2025 19:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746127599; cv=none; b=JkTvORlqYcqjW+U1QF3ZtOCaMGG6c5KYaiq00XJ91ByX665NKHBYFKugoOIKSyU0rsEGqjI+yAoT4SR5SGB0tHLZhPPFEna6AB8Ej7vuMPShqdoxLoPz/tnGFEbeGSOq7ktnfgj1IBRxLu6ZoU+rIj/KOONSFLsSPNFRvu8unwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746127599; c=relaxed/simple;
	bh=hON7gcspRCv3oETiolgStSIyCvHMydpRIdHl60b7GLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cUyKhUOoo7xOhbW0oHkWLg0obt6x0OHdttzLGVmcG7TdFbPs6NuRYw28JuLBQHc0pnK3Ktu/VCiQC/DC54Sia9mIveo38tndF90hDvGy37gt/CZTwtMHnlIW+gjOz4xC3OZ49FCyiDjzjNIb0iOJH9U5s8A1ZrvkKCgPLs3b/Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MfD9eTZF; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MfD9eTZF"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3087a70557bso200981a91.2;
        Thu, 01 May 2025 12:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746127597; x=1746732397; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NK2R8+MXHPGTyMF8YvaeRiuPFOerCOkp4oR++2asRKI=;
        b=MfD9eTZFldQKwQvM1I5MogEjWBc/lls8uM5RYN8ahHNv8ikbAru0zwKujtIzsAGmuo
         ymC7dbrdXLOsiadHv+NKUDqLc+hAYY9lZqKsvw+LPlffkVIE1btexBKfcDRvelc5kbI3
         3AQgHpcUEM4CWDPfCmxAWzM8OX5XYbcBz+SS6jyjWwH2PKon6XMjrswNBQdkP4xvTVzv
         KliGBwXb2/PJoboQB6tZ0YOC8W9WCfDndzG00XxZH26VAOPC3FoyN+6e8dE68bHlAFs/
         3QSArFtWbpXTPuS5y5wMXZzFiuR09Qyj5lrVc2kSDUZa0C7MatyT3TJwFuVh+Kj8P1KE
         PYXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746127597; x=1746732397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NK2R8+MXHPGTyMF8YvaeRiuPFOerCOkp4oR++2asRKI=;
        b=AH2i0eu0hUYzrIP+lQpOJhEAg8JUrOHF6uXhi7TzodVHklWnztzQ/2Q769q08+iGaD
         yCIjoVwAUnby3p3PLRZKgqhTOwNt9AThZ81Pp4/0vbVtnjFQnfMpMuCSifX/x91k/HBl
         HyptDr7X08k49yXHPpnVS22oEtGbWxkYluhYfOiEiIa1ESO3q45bCsLwi0dtBznXn8Jw
         byE8QS7X2Xm2X+0RK4EtHeSFAViq4kPNDz5DMVFmcozK+TG1lUx4XR5D3YKI1LK4QVAc
         P/E4uFECqWOzYrjT+sQR7DMoj0my3fojzZ+2xAqL3qt4PetbT3hgGftMROn6C7ldWqRC
         wEfA==
X-Forwarded-Encrypted: i=1; AJvYcCWvkjXOOJ2l9ZEPYPLWwif1BY4lFwv3UnJZ8EUyxS9X4bOLBfkH+99XV1JH2T8om6ytzPq/ZksjcOV85Qb2/GY=@vger.kernel.org, AJvYcCXI7Pj44N1+hOMQPkb4hKpuoT+FMRpxBe2KJI5hqLwZyWx/Faen0ypXIeCDHTK/I/W5A4Sru4Lv6wmT3KY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTkn/p3qzsN7qlRfr4ubX7gsSl23ozJalmzaH3rAUWYqqvbN/y
	zy1NE7q5lE7ieLU8HQhRlwoEs5yFCXX/tlUIBkU/Rfvqx6ulneka4lzz1kr4gr1Ar+IwXNe/R1V
	JDKgMgAwEqS9RCXNVv/f2on6dgDA=
X-Gm-Gg: ASbGncsCC4s1qr+J23N6GU4jJRtj/tBzhnsGuyhQXduWR++Gl8a8/u8KCNDL5XOtPVm
	BC+jdZ8MRBOoGzbRjMlEuM6wnaHX4X4zqHTXVBJOjZx+2tpuWcRFbJY7Hp7UzhzYoVrNjG9qTW2
	GoDcXP1+5s9oHeYVx+fSPmow==
X-Google-Smtp-Source: AGHT+IG7urNiDwUEE56jT4vpHL2iomsbFVxFtP29a08CJdF/3BxD9zx5p1QxvsyQ3vSjWvDSZNXJDDEToZx1/XcP4IM=
X-Received: by 2002:a17:90a:e7ce:b0:309:f0d4:6e7f with SMTP id
 98e67ed59e1d1-30a4e6c3afdmr176589a91.5.1746127597407; Thu, 01 May 2025
 12:26:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250501-configfs-v6-0-66c61eb76368@kernel.org>
 <20250501-configfs-v6-1-66c61eb76368@kernel.org> <ELsEgktE6XbGxDyusumtuVzyX-eotyYuQdviHTZaIxN7KZaGFr0fNqrv5tac_gYWfbDZYNTC-wQyQuxnmufA2g==@protonmail.internalid>
 <CANiq72mS_HV5rDjP+t+k0jX9QeAgF2SB9_xX54iEBTH-GoPuEg@mail.gmail.com>
 <87msbw1s9e.fsf@kernel.org> <86-cT9dBPpEIyQXWVCeEmj3TRvBm6Ta0p1B20sSngRGOqOuC96i6hG3Q9Hg3bN8AQTCPXlsxg_C5Ok0G4JJzpQ==@protonmail.internalid>
 <CANiq72nd0Pfv4TrpULGQ_fZkyBpHyVVZ1H45_RJBgBxkJuzCJQ@mail.gmail.com> <87h62419r5.fsf@kernel.org>
In-Reply-To: <87h62419r5.fsf@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 1 May 2025 21:26:24 +0200
X-Gm-Features: ATxdqUGeX-jwGjrWgFrCjcHAUR0nxhvRjIRb3ROH0_c_igbsHUkjua3MWwgQypQ
Message-ID: <CANiq72miL3eZ40ujmA-pXCqMS8y2AzJQ1UKpL1_hX03AJ0fteQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] rust: configfs: introduce rust support for configfs
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Joel Becker <jlbec@evilplan.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Fiona Behrens <me@kloenk.dev>, 
	Charalampos Mitrodimas <charmitro@posteo.net>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Breno Leitao <leitao@debian.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 1, 2025 at 8:11=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> But why does that matter? Anything in the commit message after the cut
> is dropped when applying the patch, right?

Yes, but it is not common to add a newline there. I mentioned it
because it looked odd, no worries.

> I might not have the full picture, but it is my understanding that
> while `const fn` are evaluated in const context when called from const
> context, they _may_ be called from non-const context, and then they are
> evaluated in non-const context if their arguments are not const [1].
> They are not guaranteed to be evaluated in const context.
>
> So my thinking is that down the road, refactoring of this code may cause
> the `AttributeList::add` to be called in a way so that it is not
> evaluated in const context, and then the `assert` would be evaluated at
> run time. With `build_error` we would get an error during build.

No, it will always be evaluated at compile-time (if it is evaluated at all)=
.

Please see again the links I provided. There is no `const fn` in the
example I provided, and yet it is a build error.

From your link, it is clear `const` blocks are a const context, which
are always evaluated at compile time:

    Certain forms of expressions, called constant expressions, can be
    evaluated at compile time.

    In const contexts, these are the only allowed expressions, and are
    always evaluated at compile time.

    A const context is one of the following: (...) A const block

And from mine, it mentions that it is guaranteed to be evaluated if
execution reaches that point and that such evaluation would happen at
compile time:

    A const block is a variant of a block expression whose body
    evaluates at compile-time instead of at runtime.

    If the const block expression is executed at runtime, then the
    constant is guaranteed to be evaluated, even if its return value is
    ignored:

        fn foo<T>() -> usize {
            // If this code ever gets executed, then the assertion has
            // definitely been evaluated at compile-time.
            const { assert!(std::mem::size_of::<T>() > 0); }
            // Here we can have unsafe code relying on the type being
            // non-zero-sized.
            /* ... */
            42
        }

That example they give is precisely about using a `const` block for
guaranteeing something that unsafe code relies on.

I hope that helps.

Cheers,
Miguel
