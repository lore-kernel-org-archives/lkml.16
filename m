Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C8564A98
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 13:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747316056; cv=none; b=V7oYyHsvHDHqorvhqL22jPRHMzTQgMxLW4vvWQmyEnMgAfHjeVqzTaw/n1DbgAKgWpIZSQxUHlXPYxA+4PPkyOWk4NgBLxVkAp3uTu2gZmtdUzz94bDLuspHkuAsp/IgKwiZuGwb7AAvY4mD7/ykqX1hrlK/CW9pk+GePVJl7k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747316056; c=relaxed/simple;
	bh=tSlO1Z+hu7gWzQYRT9HZ/IB9CDo4FxVzADK+bIgnKp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LOveLsKghzl0VVkFFf/i2/35AeS65MjqBf25rZxgJt/WZV+BfUTWLSXjv3T4+46ivT6Fil5k6jwWZCyns6h9fvB9brjj/yfkjVqXoUcX+70JCDNaSEmpSwhvTUNACNsoWr3DcXsRuuYOHNCxxmm7RCV997y7llpSF0AjaR+cWoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DuMFj4hU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DuMFj4hU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B37CC4CEEF
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 13:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747316056;
	bh=tSlO1Z+hu7gWzQYRT9HZ/IB9CDo4FxVzADK+bIgnKp0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DuMFj4hUGcpegnNdSrF0dkavcSMRsNGTExpWAnhwe8i2i8gx6h3u59XvJircoSk+w
	 pF0MogWbTZp8cIFLVPEsU2Qy6zK/6sawZKWA5tBvhWbX5RYcX/zl6BtGI4z8xOp1uP
	 bnofdl8AJ+IIc7V0M2SKdpCWmVmNYSGgOjip1FtKG3qLfvwoPx/02BIoMXBBqW48Bt
	 9KKqaCTFX44uk4gGaRRPJ1L9+iDWYBZvEYQTYWK8AbfeW83qjjzQGx9SVPumTVzYZB
	 +SLh75/jXZEFz8D3NxSBP5lhsHeHZIX1/dQzW3P96Z6MP/J1wW7n+gOUfeh022emmI
	 8c4bNLAPfADNQ==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54fd1650afdso1124388e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 06:34:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWjcFH9QDY1RQ6P/wR5RT5FWP4ATc9E6EsmOztL/viMHXiJaY1XaAs6lDe4kLDbUCKEKlgkfZv+al2ZvuQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRuHkVmO0pYvE6hmgZkpm6y/c52YP0w6zQ4IVcJNlT4zQRv/5h
	wl9GYrHRPGvpcOmHWDF3iRmYxjWqF0pbPMy7kNzSc6wTN1U69oKj1XEfUFRJKMKFoGL8lURlq67
	GKfGWmkzEaUW9ISxfgbk8II2n7qI=
X-Google-Smtp-Source: AGHT+IFOdYRlVIcXgdsCTy+sBoTuZXcVP49hfaTg04j9ox3vBRBzELNrCi2obUDSug6XKgKJiOmEhjgvgfVZCSLwOPs=
X-Received: by 2002:a05:651c:1106:b0:307:dc1f:e465 with SMTP id
 38308e7fff4ca-327fac11093mr8961471fa.22.1747316043479; Thu, 15 May 2025
 06:34:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514104242.1275040-9-ardb+git@google.com> <20250514104242.1275040-10-ardb+git@google.com>
 <20250515131120.GCaCXn-E8zQutUqKLn@fat_crate.local>
In-Reply-To: <20250515131120.GCaCXn-E8zQutUqKLn@fat_crate.local>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 15 May 2025 14:33:50 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGY0VYLdKiveeznH7+8AVD7Uq4PGEhr=+pcT-Nw3WWvgg@mail.gmail.com>
X-Gm-Features: AX0GCFun_tvTapFIplsyrDeJQ9YsjrXC5wLmrpwRJ2f-VzgNfqsMR_jm8QHHn1M
Message-ID: <CAMj1kXGY0VYLdKiveeznH7+8AVD7Uq4PGEhr=+pcT-Nw3WWvgg@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] x86/cpu: Use a new feature flag for 5 level paging
To: Borislav Petkov <bp@alien8.de>
Cc: Ard Biesheuvel <ardb+git@google.com>, Shivank Garg <shivankg@amd.com>, linux-kernel@vger.kernel.org, 
	x86@kernel.org, Ingo Molnar <mingo@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Brian Gerst <brgerst@gmail.com>, 
	"Rao, Bharata Bhasker" <bharata@amd.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 May 2025 at 14:11, Borislav Petkov <bp@alien8.de> wrote:
>
> On Wed, May 14, 2025 at 12:42:44PM +0200, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > Currently, the LA57 CPU feature flag is taken to mean two different
> > things at once:
> > - whether the CPU implements the LA57 extension, and is therefore
> >   capable of supporting 5 level paging;
> > - whether 5 level paging is currently in use.
>
> Btw, that gunk:
>
> We had started simplifying the whole 5-level crap:
>
> https://lore.kernel.org/all/20240621164406.256314-1-kirill.shutemov@linux.intel.com/
>
> Shivank, I hear the performance issues got resolved in the meantime?
>

It would be interesting to know whether CONFIG_X86_5LEVEL=n deviates
from CONFIG_X86_5LEVEL=y with 'no5lvl' on the command line. If passing
'no5lvl' makes up for the performance hit, then I don't think the
performance issues should stop us from removing this Kconfig symbol.
