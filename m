Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B17C248F5B
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 12:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746015157; cv=none; b=VWRjX0YPid+aZKu0Irad0dK9a9DTLG7HqlKV12goO74PFa8Z0o7jRlfZ6tfuZVArKcmcVo3H8S41/RjaZeZcmeoAdejBNresd/Gpb7Pdrf8AeV3Uh1qwoVUWH1H6br7BG8ajOHqaJlplLuorSYU83ddLoUoq6JnCVt0t6UcbVSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746015157; c=relaxed/simple;
	bh=gvAopjoNyA7dbzXulW4xl/bX7+60c+NQIsGH5vBcpAM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JVV6Zk+0Mj5nc55DAcvTtgEVuvpkOwm72H4bsl7076gPJlgbdinXFh9JomdjY5Tx3Ew0BLkKlXQf6n9FKIwRC8MKZRbNU1g925CkwYkAU4GSsOHvQhUCaNZAYFl81sogLY9kFYV5sNUFizj3NbJ2VMGDssUBnKtKcVJAVMmmSlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JoX/KL/S; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JoX/KL/S"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39ee682e0ddso4931181f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 05:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746015154; x=1746619954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=exV/Dw+Vt005ATLp0ivkfrkkCFtH2VHvaATRN0wi0iE=;
        b=JoX/KL/SKxbwaYtrIb6e8M4d38edn7SB1VToPaMgHnu3bfLoPPLR5uz4DgXAj3vbDA
         mifEb68lpFPpK6lr2U4f4KcbE+TyfjTp7+XXM4MtAqtmF36R7dmU7HWYEHk/RBGfzJBe
         c3r18duR5+t/pvFAGiiLTDg8J08N5gGcOddqR5wb+Qk3VECxWVlUViJxIXcgHd5Y+d8A
         De88Ijk6m33qvKXLtCZ1bRA5vjxy1OzZqE9L9ioA+cLu5lhZrsWbR36kzTf38ZtcOyQ0
         bdH+xiRTSYFrYPGSxe6Vswo3fYy3SXDMbc9pAlIaEP7580Bn8ZWE/S9makTUDueQVLvC
         DJIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746015154; x=1746619954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=exV/Dw+Vt005ATLp0ivkfrkkCFtH2VHvaATRN0wi0iE=;
        b=hLWHsWZyWKhD/ufQ2UT+bvdrR/1w9qv1vLIjTaVpJnSE+O9rJdacCS0shHjVgKOIdD
         MQqG8qiDTKz6DDsFaAbswr2BeBcblqG7TTZG2/8MYsiP1ztkEJ9SBPW0FhVEWLqFykh/
         QGit//gjdCnC3asHnQ3mpo+Mtaeoea58UmiAwvHArn9iNOMqTeSUjayxA4lQKKTZEvzo
         Pd8iO7o+bFI0RSyv1jsA9MxghoeVvsKOm+gxpeG7hJywWMCDjzLrFpoeLUcmmVL5LjX8
         QwlHtAwpQ0VkCM9BLrgm7rODTntKdukF50GAwFX2KTp4HgW9abJVpunf4CHTJg4RKIXh
         bmYg==
X-Forwarded-Encrypted: i=1; AJvYcCW6qlozVsS/k0Y8KrLU/6QgObZ8gNxwzW411lPGAYlSNfRfYXY8TBAzOtDZdFXburv6/B47ulBVGAoRTdk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy06tonxiQXEDtgAPqBSD21V46/7PuM6ijvkU8IGnC0RsbKBGBA
	KZbCgRt9R9gzu3FDPtr9FHIS+TAJzdT4ua4HE0bP3gGwH0ruljBh
X-Gm-Gg: ASbGncvyWcdG+Qk7J1m89rGxpqfXlAe4pBc37zf9w0/UgXCcbhJUufbRZ7QFarZci7e
	EcGZCxGvHPrxSOYENXE0ZUV1Zy9Wx0MSAEZFCR9ca6SZl5ZvfvBHdJXEMM1/oRqUnN+mWvf/Lnl
	7osiHwwOkMX5SR33YfU/to1j8U0kSxRWaafr/mI6PlbtVAeXw3zizcBsPUiYntKtMRckGRrYQJd
	eBdhORzr6hoxIOuXRslef5kj90R5wAhEuoTgqITDodlI2HgD+Nn2N+RQ3rl+Bj5Tt0WtMEIG1UX
	cT3eq8RtvrIjtl0cRyVtgE0Xqu1cAIoCX0Cle8TUaeE3LeDEvRK+bs4qzP+OApwF/cPkoLD9wtZ
	WJ0A=
X-Google-Smtp-Source: AGHT+IHdNy2cnEFHIFGItGh5hGfN1ZHCaeYaOLyj5VuHMZN0pXEx9Cb435wW4njErTV4EecqJL6luQ==
X-Received: by 2002:a05:6000:2585:b0:39e:e217:28c0 with SMTP id ffacd0b85a97d-3a08ff34c51mr2240192f8f.10.1746015154143;
        Wed, 30 Apr 2025 05:12:34 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073cc1842sm17094081f8f.54.2025.04.30.05.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 05:12:33 -0700 (PDT)
Date: Wed, 30 Apr 2025 13:12:32 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: Adding __popcountsi2 and __popcountdi2
Message-ID: <20250430131232.3caea352@pumpkin>
In-Reply-To: <20250425003342.GA795313@ax162>
References: <20250425003342.GA795313@ax162>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 24 Apr 2025 17:33:42 -0700
Nathan Chancellor <nathan@kernel.org> wrote:

> Hi Linus,
> 
> Since I ran into problems at pull request time previously, I figured I
> would save myself some trouble and gauge your opinion up front. How
> palatable would the diff at the end of the thread be for the kernel?
> Clang would like to start emitting calls to __popcountsi2 and
> __popcountdi2 [1] for certain architectures (ARM and RISC-V), which
> would normally be a part of the compiler runtime but obviously the
> kernel does not link against it so it breaks the build. I figured added
> these may not be as bad as the wcslen() case because most architectures
> generally have an optimized popcount implementation and I am not sure
> compiler builtins are banned entirely from the kernel but I can
> understand if it is still contentious. It sounds like GCC has previously
> wanted to something similar [2] and it was somewhat brought up on the
> mailing lists [3] but never persued further it seems. Since this is a
> compiler runtime function, '-fno-builtin' would not work to avoid this.

Is this the compiler converting a call to __builtin_popcount() into
a function call - which the kernel can arrange to never do.

Or the compiler detecting a code pattern that looks like an open-coded
'popcount' function and deciding to convert it to a call to the builtin?
(which is a translation the kernel pretty much never wants for any
such code pattern - including memcpy()).

In either case the link failure is exactly what you want.

	David

