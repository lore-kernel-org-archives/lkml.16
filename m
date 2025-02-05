Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9182136658;
	Wed,  5 Feb 2025 13:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738761170; cv=none; b=BAZ3vQgXHeqLF0D02cgu0uBFB0F1lJdqn+pz1QyDz3VZSPPvuyGlxstOqRWebJRVVPZoOCSZPDaTO3ezVeYncQMzWm/11onwisvEKr4MW8+g8Gu9XLneLiuYOFUsImaMk4yx8Nj4sHKuSX25Gjxgxk3zIOn0DowCSHFtYN4VvDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738761170; c=relaxed/simple;
	bh=6duYIf6h8o+WP0mCCkxvBXN2EQNvmCIGytkRay1nDck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rr9a+knMuQlteIh2oAdnzoVkXgJ5VgasNnegYkzEds6mhuMCi45w36C22SXFnL4qUKd8IoLCQzgDZDDGy4eIbZIkqLxLmMG+JmACPdzNbggCFMBZhIT+1W0CVoUtI0QTrwUZz1gPAKb4sQ+fL0UvQIk7XrOxXujWr1mH6lnU7zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RTScxOd5; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RTScxOd5"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2f45244a81fso1404434a91.1;
        Wed, 05 Feb 2025 05:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738761168; x=1739365968; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cAfHGmW5Jn6KSQz8KSJ3YqxRch6Hu8jeIGGPJU3eb1M=;
        b=RTScxOd5vLX04MVzjVpQwZBrgZktmN0Y/jTbXYTkC2zuJ6NQK/bYzN7dwecclNBFBl
         MNjvRUsJLJkuS89ltZen3bHX/Ule4xAyTblAYiH1pHr7CPqVM2spQs5QX3SPbPsgOc+4
         /FYD/wENb0dOMOM4AHerS9U+XuuyJVK8losQfhzRBqtA0QnU4JShxQa0UpY7br63KIHR
         /ph4Fp8iRRSz7AO7DOj7lD7ExpMLWk3LKjXsei6tF6+/d8hpy3bo7cxLlxbhu1FgidJ9
         SImudnUqtaWuzif/PZKdJsq2jQMtFY6Js6e0tbGvjRnP/nU+SAe014EOoVmB9DwUvtHH
         TBnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738761168; x=1739365968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cAfHGmW5Jn6KSQz8KSJ3YqxRch6Hu8jeIGGPJU3eb1M=;
        b=DEsFyy+oQsh7xgvOoIKh5CA5Lgm5frIVsV7t4jRmrDLbFqQlKUYCuceCdpQBck66mB
         aERi6g0pIS5LAlAxxkkIERPSVN6L0qVqZRBmUsbMd26id3/LzIAPSh88qJRto2BAvNx9
         2km1+cF/2djwnD11IQU+pfNFnK/UkJCqdBux8XqL6ZVqMblTJ+mqKa2jY9p/9G/crfNl
         KJ1pURc+AmAzkHZc/wcDLeozllC75DGEygPZiiJY7PcOor7StJ1QA5gp+7uRcHy5B+tN
         EcIojzC+GbqJ4uMXnQwaYTL8dUz/ktcaVYSE98x5kMtfwB44mbl+02X6mlTa59UaNBdQ
         thJA==
X-Forwarded-Encrypted: i=1; AJvYcCVxdoemE8/UhnGwIXvqdfZT28Pj3T1z5uHHNIl3M6uNyBmguLmbPppE9yil9Fh2oq9SJZaU3PmVAdMLdy71KnY=@vger.kernel.org, AJvYcCWrK5KxilZiV5HIG6Ae9tL040z+Gecu/P4YDto7lFCipOsWXBDsi8Oc3idbXsBxVST3zrN2iDJzE5c=@vger.kernel.org, AJvYcCXtufEjKtKmKAx9WciMsb5Tht3Wl1ySURBcaEIJ5qMKyJCSnJUkWVs1SScipDZ04FB13ZWJOR+BZ9ZiLgjI@vger.kernel.org
X-Gm-Message-State: AOJu0YxTu2ph3iWtv9hRiD7SLnxz3+kbAW+vqirHhnCBxMekY3s3vBdE
	ZPI/zRIQ1Ic+hwtW4t4tTfJR1dT64ih05JvvAKO4/8dg4OxzkHwMFyWZ2pt82EUHe5qZWsuKGmH
	TTknAJUJWE3Mj4z6CN6E+gxBQL4R4/ivjsi4=
X-Gm-Gg: ASbGnct/2fD5OWCvk/6AzdxDkpE8R5bMxCrxFbFERqwxx74eDpS6QAP75ptvoPEP+Ak
	XMgEi3tc2JQtzOLjl1jXZtjamfTmCxcRrOw2Ff6cEd6TLQtdfj6HMuPx4Nuqw7O9J5Ykf8nom
X-Google-Smtp-Source: AGHT+IGhxND18/FiuqBivcbJhvPajzGYRoAgmYiGIAXuUA0qYwQ51d9O2tgSpInISAI3Z0mUQTNi7RvvZemHvkDrI7k=
X-Received: by 2002:a17:90b:1c12:b0:2ee:f64b:9aab with SMTP id
 98e67ed59e1d1-2f9e083493dmr1842793a91.6.1738761167698; Wed, 05 Feb 2025
 05:12:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250123-rfl-arm32-v3-1-8f13623d42c5@gmail.com>
 <a83b0149-7055-411b-ba86-d227919c7c32@app.fastmail.com> <f8b59f05-55b5-4208-8bdf-b4be8e93bc22@gmail.com>
 <65da77f7-bbd4-4cbe-a06c-75f10a6ec4ce@lunn.ch>
In-Reply-To: <65da77f7-bbd4-4cbe-a06c-75f10a6ec4ce@lunn.ch>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 5 Feb 2025 14:12:35 +0100
X-Gm-Features: AWEUYZn_HdJDwofkKyPvCBjvXo_483qp0SuoTZG2uYerx5l5HkF1GY4eb7dcmA0
Message-ID: <CANiq72n7UhQEh9TJU7UNBv2t0ZR_rNO3dqbVZ2cwr99u5SOVeg@mail.gmail.com>
Subject: Re: [PATCH v3] arm: rust: Enable Rust support for ARMv7
To: Andrew Lunn <andrew@lunn.ch>
Cc: Christian Schrefl <chrisi.schrefl@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, 
	Rudraksha Gupta <guptarud@gmail.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Geert Stappers <stappers@stappers.nl>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>, 
	Sven Van Asbroeck <thesven73@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2025 at 5:05=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> Floating point is banned within the kernel, except for in very narrow
> conditions, because the floating point registers are lazy saved on
> context switch. If the kernel uses the floating point registers, you
> can break user space in bad ways.
>
> I expect this has been discussed, since it is well known kernel
> restriction. Maybe go see what happened to that discussion within RfL?

Yeah, it has been discussed, including in the last couple weeks in the
Rust Zulip due to the upcoming move to the aarch64 `softfloat` target
(the disallowing of disabling `neon` in the hardfloat one).

Ideally, I think upstream Rust could perhaps give us a way to do
something like `-mgeneral-regs-only` or `-march=3D...+nofp` (in the form
GCC does it, i.e. a hard error if one even tries to use the floating
point types even within a function implementation, not just in
interfaces like in Clang), i.e. a way to avoid unintended use of
floating point facilities:

    https://godbolt.org/z/o1E5nrrzc

Currently it is unclear what form that could take (e.g. whether a
`-nofloat` target could be possible, "disabling" the `f*` types, just
Clippy...).

Cc'ing Catalin in case he wants to be in the loop, since I discussed
it with him recently.

Cheers,
Miguel
