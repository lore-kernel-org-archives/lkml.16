Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E551A5BA3
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 19:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745695804; cv=none; b=jybQnPaUj8SHV+6LPNGRLlhrQCB3wZ9HlqvSInkvD2hDCznP3dUxqW3cqEFaEBtyzF4bLcNpbb0STlON3K/8QHvkqr1NwOjzbNE2V2zpVf+K67wiry9veSMRPrLxD4hyeMyNCsXv8SmAexfQVoFrSvL7f1EJxgVXv5LFy7Ouv/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745695804; c=relaxed/simple;
	bh=PmaWBCjji7WCxxOPaf+1SKH1bXCxNgaMzQcGeN4NW4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k/5n9nXHUMqZRmScVA+b2DbP1ttT95mXrEHvTwjKLLRfcCiDjbdXUEglbLfBrM9xZePw/5qQ9A+3PRMhYrKfiBjylN5UVpxnDsuNU7CAg0wLTnseHCehhHYnhDlPaBo6i2JVok+0mhxT2PJTAaJixWRRzkC7DZRrL97Ky1OVwOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=NLwiFauy; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="NLwiFauy"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5f435c9f2f9so4539229a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 12:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745695798; x=1746300598; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SAmZJnkixm3evgqXXEJgAXtv6B9uAHmojpNR8VdWt0M=;
        b=NLwiFauy2N22mrup0kI86FlFsO2kmJ23orDifkAfZCSluKhiJ7MPlxY5WDicq2m1yG
         4aitAqi9BnhxzDTs8ZyDtkJ6hQuSgq4VI06bidds+zZSeP2AftXmqyRYmUYNU9AS2xmx
         veKmm4boQSBeiZWyc6w726n46EYn8S6SjVeJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745695798; x=1746300598;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SAmZJnkixm3evgqXXEJgAXtv6B9uAHmojpNR8VdWt0M=;
        b=lh13SDVL23et8u1ZR6X7Is3fqdrQp3edES/Y+b73T5OrecG5gOAp0g8+6ZqiBeXhsr
         HheDlx86XwJuV+pUZRGiLUaAeh+/mIh2UTYnKAzCqcgrT+BTesFR7Tqhh9SlO9lcAv/T
         MBD8gQeCOpUtQcS/0pI9sysC+06dlXNqTc4G+5Yvwgh5Lggo/C7blgqD+UY3LdVS2A0Y
         EfK3pd05XYRXLc6BOdtWfVFKwisgY7Xv70hBpEnY3O7RPUiF56hkGpqUdIkF3c4wNKGJ
         HG7c0iQw1+/ea1NfPID/pWeYL0Tb5ZKRedmhIIJ0H1DUUaQY23jdnLKKZqg4vpeO/V7T
         Ekiw==
X-Forwarded-Encrypted: i=1; AJvYcCXfVzJtLWLjDcD3wgtEN3KFwz8O0H+tHUGHOyJUhfBtrc59Oov2x+e1zZRbPNSOryg/w9G7/8M8zbLk+M8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBUtLRShqakbjKYaEIV7ADC69tD60UTVBW2zF2am2JUFIKh2nY
	32S5ylmMxgMlLx0qvI+8/ud515/DdRYutUtqaAZ4wqRGgLVyrvfxT/ZKSgVW8yrrpjlQnB1Dy4K
	YeHc=
X-Gm-Gg: ASbGncuoUUk8uBWY9MzZq9qYCqeA1H2BsgXggnvFFf9D8QDuIyOq18M7PjbUVm4e2fx
	T1qqdWyAFRHoayn+Im3QolbL0DMHRnOQcyMH1D1W5TPVzl1DU2R7VzxYJj9H9WJqPNkwqaFP1ff
	qainDyey3nDamRAsedEnGvWi7NngRJUDPFaZhi6AP8+YYdWK0/osHje4BU71x6jb9BhDlYJpvyF
	/Ygj+5G0V7lk7bkfwVkDlLyurNuU3GKZwaHs80oZp7sTwfswq3/BmUjoDHEdt+mNh/2/0jYcAZ7
	+7dTLHdPAYHZV1zLUxx1B/s5cObqEPurW1Py/EzrHdPwMoWIlobr79QicE11xjHbQLi8CtNcRlJ
	BIwaP/+c4pa4sW2c=
X-Google-Smtp-Source: AGHT+IHPKTEZk1IyyTc+O+6Z1YYMBo+2W7gOBjsQjWVMNMt0p/FmRS+WC6WkKmN3Sk757nhaLkcmlQ==
X-Received: by 2002:a17:906:6a23:b0:ac6:bca0:eb70 with SMTP id a640c23a62f3a-ace84b55d83mr350097666b.56.1745695798102;
        Sat, 26 Apr 2025 12:29:58 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41c71csm332463566b.4.2025.04.26.12.29.57
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 12:29:57 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9ebdfso4841023a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 12:29:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXHVpHLcu4j34bmqCt7qjsyN2NzlzVrlvjQlFKAk0DPs4Dp/QuqLuufbFhmosAn0OvKgp0N5lduh1N/atk=@vger.kernel.org
X-Received: by 2002:a17:907:7e95:b0:aca:a1d8:981f with SMTP id
 a640c23a62f3a-ace848c02e9mr293296866b.12.1745695493835; Sat, 26 Apr 2025
 12:24:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425141740.734030-1-arnd@kernel.org> <aAyiganPp_UsNlnZ@gmail.com>
 <d2b0e71c-e79b-40d6-8693-3202cd894d66@app.fastmail.com>
In-Reply-To: <d2b0e71c-e79b-40d6-8693-3202cd894d66@app.fastmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 26 Apr 2025 12:24:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh=TUsVv6xhtzYsWJwJggrjyOfYT3kBu+bHtoYLK0M9Xw@mail.gmail.com>
X-Gm-Features: ATxdqUEWPVpzwOGKhxkHhMGljegHuR82-vkbdZlf8siCRhETy-JGPbqLh9g70WQ
Message-ID: <CAHk-=wh=TUsVv6xhtzYsWJwJggrjyOfYT3kBu+bHtoYLK0M9Xw@mail.gmail.com>
Subject: Re: [PATCH] [RFC] x86/cpu: rework instruction set selection
To: Arnd Bergmann <arnd@arndb.de>
Cc: Ingo Molnar <mingo@kernel.org>, Arnd Bergmann <arnd@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Alexander Usyskin <alexander.usyskin@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>, 
	Mike Rapoport <rppt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 26 Apr 2025 at 11:59, Arnd Bergmann <arnd@arndb.de> wrote:
>
> Right. With the current set of features, CMOV is almost the
> same as 686. My reasoning was that support for CMOV has a
> very clear definition, with the instruction either being
> available or not.

Yeah, I don't think there's any reason to make CMOV a reason to drop support.

It has questionable performance impact - I doubt anybody can measure
it - and the "maintenance burden" is basically a single compiler flag.

(And yes, one use in a x86 header file that is pretty questionable
too: I think the reason for the cmov is actually i486-only behavior
and we could probably unify the 32-bit and 64-bit implementation)

Let's not drop Pentium support due to something as insignificant as that.

Particularly as the only half-way "modern" use of the Pentium core is
actually the embedded cores (ie old atoms and clones).

We have good reasons to drop i486 (and the "fake Pentium" cores that
weren't). We _don't_ have good reason to drop Pentium support, I
think.

>  An easy answer here would be
> to not have X86_PAE depend on anything, but instead make it
> force X86_MINIMUM_CPU_FAMILY=6.

Make it so.

          Linus
