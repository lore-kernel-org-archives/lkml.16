Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B852E20DF4
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 17:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744739764; cv=none; b=SQJvS4rsA/1r0Uu5EAyblpDSTyNq8+yY3GjWqdblL0R/x8DFe5/PUWeslcfvyfMKICGcPTiivDL1I91QwoyR3myCOMOu3W3fY4C07uOi2yITuL1y8FTLdgz/J2akqAgMIPpCvkP3lFiV0E6nER4eWgg2ewP2ogVNSHGoUZ/DUMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744739764; c=relaxed/simple;
	bh=c86fNt+ApUHvVvZcEbUJVjVRreBXvM73091hrP4qKdA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ex2SqQt5SRfEPSc5FFnazpblCmWvHR6VcBq78NMF600A4TKr71tCS3rr/QOJ5WEJxSMSUJ6NAlb1JyC60+GkXWWCU2uubob9xqTm7/9LZngAX2h/HcQiKDPwrRoXVt3pIEl2ztETtPR61z8pErs2+Fu4bFT+Vl4vFYYOH77o8Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FscDal+g; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FscDal+g"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so64105805e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744739761; x=1745344561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3dii88vxy+0kWYHHaG5dKqAQf7HwnhiHLf0E63iO/PI=;
        b=FscDal+gBVAsIc7PKqe4zEohMeameRYvG19PTSvxH9raAoSZCyfPZXK4KBUGki4az3
         VLV27CQ8wwQjijMk59u3SfN5DH1vmEfLnYg9XffRUXNznO/q1DcwLYsj4374cjyawmw9
         8iW1fpYzW8/y1aMaiC0nEYgIG0p3N9NKzQ8+hjdsd3N+aDike6HGF113ZTvqYmSqANrm
         5JOowfQUJPF/Y07BsBssJyfYvsD8r6YLlmwwoMb1cYAeHNcGsK7Ypf/3AFSlS5W2ir+5
         mcMC33fSteuqsWP38kvu8GEN34AQwYqsuyBzOc6lzaihN3x9KycAE0XhWzhlmS9eu4f1
         dPAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744739761; x=1745344561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3dii88vxy+0kWYHHaG5dKqAQf7HwnhiHLf0E63iO/PI=;
        b=MfN4Me/qe25MT5/KZEgZiJTANgMmZeSOXsB4FVZF5XuDOMVMbAU0LvZyXCoxHUblb0
         khQuTptIZFL2hY2gyRh7os+UBIWDKCfzIOSMhd9ICNZmj3CyUF5CY7zNfEWNiPxpn9x8
         y2gMz8qFxOyUWEbeCyKyLcgldzIOEqPzOcgrGNbdttNuxAs52+vjRBXN+2zHOwvF7oru
         wwMPnZBcuExhrogkdhX9x1dXMMdcsRru3DsUYQPNokQiGEf8zVjgp8mJthpJoFinKQle
         3YMkK0uTuuRNGS8+J75qAdIKySSkdqSjU5JbqgAPiVwS5Ixn1R1ed3uCf5ObL8om6BBw
         RgAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXU0DBjq9iyho80guvRynSpRFNH7ApIxFje5Zfv/cJWSiGfDvZHcKe4T2QHFB1B2kG4MMJUUzgnbtBgyxY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3TJKnTfdGvu0u9eAhXJbf+3MDsSidy7HKLXnSD4vCjxD3I6Bk
	AcQEfqJh2E4W0cmzhPCtQV1mAC2u9gnRyZzP21Z6gqXYCD8WPOZm
X-Gm-Gg: ASbGncsn/wWGEZFxw4QhEsBYYU658htiS6Rm96nrexHaGd8mXOzXzrctzG0bKH5JxLj
	fIKUKX8e6FUjlx4oSfPoG+w5Aq72k8xfgDL0EMSldWKaP+V80UrQlE/WYr9eZhBzrxIaEbU4VPI
	01Ivydb4yaOuaBK74ecFJm7eiAFqvkLo1/9GQtdkuNeHeXE+YNnq7xM+f5grk7Ej+HeUm8HFKQP
	aQ95F0KJw0/HXTx6eAG4gksjG9s4eVzT639J467NxTORnrJVLATWCLQ1wc6Av6pPvv/l3N0bhr4
	U7UGAgX0i/XfnTOJ3ZfJPduFwS6+Bh6tFG1SEkFDE/Cc0TqR0wW90i9XE3dyp3gxc02Zb7dW68I
	MrsOk7Nr8f6SsEg==
X-Google-Smtp-Source: AGHT+IGptWUhUPghhzbUlnMiXUjXKLkOLTWNhwNQRBrnxW8Pmu0xPEUxkmF80iqK/Ldomew+G/oa5A==
X-Received: by 2002:a05:600c:a42:b0:43c:fdbe:4398 with SMTP id 5b1f17b1804b1-4405a001461mr524545e9.6.1744739760718;
        Tue, 15 Apr 2025 10:56:00 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2066d069sm221245635e9.17.2025.04.15.10.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 10:56:00 -0700 (PDT)
Date: Tue, 15 Apr 2025 18:55:58 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: linux-um@lists.infradead.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>, Anton
 Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg
 <johannes@sipsolutions.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH] um/asm: Replace "REP; NOP" with PAUSE mnemonic
Message-ID: <20250415185558.112621df@pumpkin>
In-Reply-To: <20250414145650.10776-1-ubizjak@gmail.com>
References: <20250414145650.10776-1-ubizjak@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 14 Apr 2025 16:55:57 +0200
Uros Bizjak <ubizjak@gmail.com> wrote:

> Current minimum required version of binutils is 2.25,
> which supports PAUSE instruction mnemonic.
> 
> Replace "REP; NOP" with this proper mnemonic.
> 
> No functional change intended.
> 
> Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
> Cc: Johannes Berg <johannes@sipsolutions.net>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@kernel.org>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> ---
>  arch/x86/um/asm/processor.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/x86/um/asm/processor.h b/arch/x86/um/asm/processor.h
> index 478710384b34..233a7a0d29c9 100644
> --- a/arch/x86/um/asm/processor.h
> +++ b/arch/x86/um/asm/processor.h
> @@ -24,7 +24,7 @@
>  /* REP NOP (PAUSE) is a good thing to insert into busy-wait loops. */
>  static __always_inline void rep_nop(void)
>  {
> -	__asm__ __volatile__("rep;nop": : :"memory");
> +	__asm__ __volatile__("pause": : :"memory");
>  }
>  

That only makes sense if you also change the function name.

	David

>  static __always_inline void cpu_relax(void)

