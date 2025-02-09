Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F821DF980
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 19:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739129575; cv=none; b=E/fLPJ9hquL+kkB5763sIdYv80QsoG7X4EEaJGmgjukiN6IFnxwzBzUe0yUED4F5g6dhJE25enMRhr/4Zl3aO3zt97f51Q3kSg3fPysIKpKYTdfLT1M6PpTQ6VZiDWLo3dH8E90XSBSV6R5fgQFP/Zr6hAoyPf0Jr59pIePCZu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739129575; c=relaxed/simple;
	bh=Hw5Jj54lHlKsvWdyOciOtY61GHLLyD922U2Ybh/FkBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SEG1a3KsXiPtOOd7Cohu5ZCtJx8GiAHDRHKVU5JaBmkjs9yMICHNvm2l7WOdAljU0CzIaucCm/d4hANnqNxkOVK2EDMJ0YDMccTuLccwSh+jeZaaRTA592DN5XD1/VaSUlTBkSzDnbDIIWUIDOmDT7jcVd1rvnzgr2CR8A3O/Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=CCKEhFQ/; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="CCKEhFQ/"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ab2b29dfc65so587311966b.1
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 11:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1739129571; x=1739734371; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3OYZn6iFxER/JL2avDuYDbzyExRqovS2QnLbQ0tqh0Y=;
        b=CCKEhFQ/ka9jHoF+rCN80edG+lKN7KiqmDTefhqlo3tE/y9AloLgmyLAS4TS5Sc2sJ
         15Td6En7r1d8yOQIUxZh9iMYyS3fxXq083bIyEltlzz0ZUHr+Hg/nuUmOwMRPeuLEvrW
         4py7UZcQ2ooqDUYsVDPGR0B9NlKq9BWF9yc2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739129571; x=1739734371;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3OYZn6iFxER/JL2avDuYDbzyExRqovS2QnLbQ0tqh0Y=;
        b=LK+wUNBtDje8F4C58JFxXD2kA4gaXSm+POjx9HkQPYIove8NMG1elrmt3+AhvbWRRC
         9CTebEdy5QcTG3W3ntIplBoycLedkFvG/3UZpM0LJJ4Hv2dhrrP5R3ARFQzFay3f4qi1
         3eDQicMhARoB2qkfYEtr/NX55NeogIAgTa/rsU7WZJH3xrHzNMi/OCWw3Eql362V1k3A
         SW7R89L/YaipD7WyatWDunEmz5K/uQeYf0BVVJxBpCf9nnzXXvp5o7I9m0qLM8qSFUOV
         gPukSKje7KWyxl3wb1GIq9Zya2of3oJBPJtylVqDDlnTk6tS0hFXDzVPfkv7ieZwW7u1
         bI+w==
X-Forwarded-Encrypted: i=1; AJvYcCXWuTGg+mOSO/ugXepQS7itwq6V4U1YKkUGmMJB5yjPr2oBZJdTJ2xc3b4xPtv5WE49i8c8ub9vSB+Rh18=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyuj5EFj91VyTgPhA6ZALHufteokEFaOk8hb0isFt+FZt6rWaiJ
	C5fj9/MTq+LrZzG2w2ZL4YoZ0+DYJ453o83obd2Xv/MKlCJOmDuwqIJg4YxaSaSO0i4UVku5NW7
	SYFQ=
X-Gm-Gg: ASbGncsu6Q5o+CKgBZPWtPpwS8ou2Mr/ocJVxW1AEaHrDOXWuHensiV3nCK1WrlSEAd
	Y6VLOsego4uSdoVf99DzhFJiD5QY6S3O5fjr8ZyQB9m36Gedcq6fuHqnt8NfpsJxfUydd5mkKc7
	PFZyyBJnk2eZ0yaGlK4+ZNIRWcMi8EykmGbS+P40WYh0OQ+iWM2ygyEFG7tKZGo6NvBVSJTGjbs
	oR0Jhx60agWPDZy3uG7oHz2r/sOEsvGNua7pJO12eFTc0H3TSmaDHpvX3Cy/k0tAVJ4w3DgjMc4
	CQLF6BdufqZ7FHPAKgYRcU4XEOUzaAbgRBwvC3JiY4nAXV1aknRIG4BlZ15LZICi0w==
X-Google-Smtp-Source: AGHT+IFkBTayQV33Rs165Xjyn+0dEl7f953zfUtR1kFs+f22AvcJthKHU8Yw4ZXCzEjlnOgu24YhLQ==
X-Received: by 2002:a17:907:3f27:b0:ab6:58bc:715b with SMTP id a640c23a62f3a-ab789ca29b4mr1055665266b.55.1739129571189;
        Sun, 09 Feb 2025 11:32:51 -0800 (PST)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7aab8d8fasm295795066b.58.2025.02.09.11.32.49
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 11:32:49 -0800 (PST)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ab2b29dfc65so587309366b.1
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 11:32:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU9mAD8dJQ2xigwU7jPp4Ww2Ht5TF/IW0UhrD8nQcYCXm8oK0mffSE/7bO9cCYTPSEYZ04Eesq1PF+CzfQ=@vger.kernel.org
X-Received: by 2002:a17:907:7e92:b0:aaf:c259:7f6 with SMTP id
 a640c23a62f3a-ab789c627e1mr1220851466b.45.1739129569271; Sun, 09 Feb 2025
 11:32:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250209191008.142153-1-david.laight.linux@gmail.com>
In-Reply-To: <20250209191008.142153-1-david.laight.linux@gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 9 Feb 2025 11:32:32 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiQQQ9yo84KCk=Y_61siPsrH=dF9t5LPva0Sbh_RZ0-3Q@mail.gmail.com>
X-Gm-Features: AWEUYZkIEyygdjdtgqEM9UjeSXpn0CystKuNI2lg08YFjtDgCkT1DG_hRzS76Rc
Message-ID: <CAHk-=wiQQQ9yo84KCk=Y_61siPsrH=dF9t5LPva0Sbh_RZ0-3Q@mail.gmail.com>
Subject: Re: [PATCH 1/1] x86: In x86-64 barrier_nospec can always be lfence
To: David Laight <david.laight.linux@gmail.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Josh Poimboeuf <jpoimboe@redhat.com>, 
	Andi Kleen <ak@linux.intel.com>, Dan Williams <dan.j.williams@intel.com>, 
	linux-arch@vger.kernel.org, Kees Cook <keescook@chromium.org>, 
	kernel-hardening@lists.openwall.com
Content-Type: text/plain; charset="UTF-8"

On Sun, 9 Feb 2025 at 11:10, David Laight <david.laight.linux@gmail.com> wrote:
>
> +#define barrier_nospec() __rmb()

This is one of those "it happens to work, but it's wrong" things.

Just make it explicit that it's "lfence" in the current implementation.

Is __rmb() also an lfence? Yes. And that's actually very confusing too
too. Because on x86, a regular read barrier is a no-op, and the "main"
rmb definition is actually this:

  #define __dma_rmb()     barrier()
  #define __smp_rmb()     dma_rmb()

so that it's only a compiler barrier.

And yes, __rmb() exists as the architecture-specific helper for "I
need to synchronize with unordered IO accesses" and is purely about
driver IO.

We should have called it "relaxed_rmb()" or "io_rmb()" or something
like that, but the IO memory ordering issues actually came up before
the modern SMP ordering issues, so due to that historical thing,
"rmb()" ends up being about the IO ordering.

It's confusing, I know. And historical. And too painful to change
because it all works and lots of people know the rules (except looking
around, it seems possibly the sunrpc code is confused, and uses
"rmb()" for SMP synchronization)

But basically a barrier_nospec() is not a IO read barrier, and an IO
read barrier is not a barrier_nospec().

They just happen to be implemented using the same instruction because
an existing instruction - that nobody uses in normal situations -
ended up effectively doing what that nospec barrier needed to do.

And some day in the future, maybe even that implementation equivalence
ends up going away again, and we end up with new barrier instructions
that depend on new CPU capabilities (or fake software capabilities:
kernel bootup flags that say "don't bother with the nospec
barriers").,

So please keep the __rmb() and the barrier_nospec() separate, don't
tie them together. They just have *soo* many differences, both
conceptual and practical.

             Linus
