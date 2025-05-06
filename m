Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66160285416
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 17:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746551486; cv=none; b=ojQFOsk018VxZ0tr00zLGYgPR4CuMu28mAgTasE0kdD83P2WNyGOk4gtHp4DayUWINRssmIMfQnR0zhtlBnyNS7pS7jPuYwxE4q3wGmugO3oKdFxW0C2q/KmsyQU0Uhu13YraiLZ3+XSzzKCrv6tmWG883JK1M8xWmfdJGtaY/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746551486; c=relaxed/simple;
	bh=My6W3MkfoIZyrHHuK5rmqyALIpoImUdjOFcnr24p4KU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PQu2e2hIh/imQSj8r4VCT9OO+eA0t7sDCkR8lXFO4cDXCWPpMQlRG7MwyyPm9KJgTK4Q5l9em4NCUNo++S5+yDg7BV2snScbaZgQxvOzQuepqf/CJNov9xUiT2hgVLJ6ygtCVh59Zkb8ozhkYVgzrmqlIpVbkVH0Rzrlh2g4V1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=H/+vitR2; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="H/+vitR2"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac7bd86f637so14557766b.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 10:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1746551482; x=1747156282; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kVpQIt5Rrw+staztHrfoG13kD0v6kV8PWnmhH3DAGfo=;
        b=H/+vitR2K9beGwUpz5zg/BF0bhjdLEBGbXgvrwuqTQ9mx4R17slmEwQWFGSTjN6iY9
         h9Y/GQ03SE8zLi+soyn3MUlv0eLIoTfgrBQpJZWfWnRkCNMZxzg5wQzm3NYxEXoWOvri
         a872hUzPufHkd9of7z5eEONNuw/ylsBOgGUK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746551482; x=1747156282;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kVpQIt5Rrw+staztHrfoG13kD0v6kV8PWnmhH3DAGfo=;
        b=NnNnyioTg4d+2cH4IFT0L1LNh0wKvAnzRqaitrLHY9hsnjItSiRu6fr2Qy7l8b7Xq4
         5YxZMcaz1z2lWI7P3jraB8aMqAFnwEZJ3wJFhgYS7Lv8Aoa2wQhR1tzuSGJwAsf4HMHK
         H2+HMrvHgSexdBaKnOhNTK/yzXiFu3a8k0D5QiDoTtIeNhtwK+aAOV8TEYpA1V8csaJR
         LJsRbhR4JmRiK8nNJU91nQjI88skZgf/OepVzuiHkkd+HQV3lTPRJBkfLK3I5Sb+iDo0
         Pg9q+byD0qjbfANyX8TfTRkA1wnVLfUOBFkq5KAy3gWmdi6tQ6lBanOr2SU13P6pqt0j
         VC8w==
X-Forwarded-Encrypted: i=1; AJvYcCXIbGUxXX3BIg0JXORI3KUqn+sZU/M7N9S2tg8ca+vNtoF1r2AbhroGzUG34PkCij0L7mpZlmmZqtVGEGc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2j6mBQTMwS8g6FN+eEGxURjk0gIV8lmOlnSxPMqHXwWbVncAm
	dXTUYTQ03eKtqOcRUFGVKHbmPlbSScdemo6Qx1oz7HPjnK4q/p0zKPuGkiqeRztUavEmiyA5I6a
	8IF0=
X-Gm-Gg: ASbGnctlQM+zO6C8Lpp5s9uJ2tQ5x2iWZTmINj0g9M1SP9HqxnBxALXTJGerRuMeGSN
	opV6dmOI8K5a/bhRMBKaRKIVarszgXIUouCI4Qhs7lGy2hFF0XdslS5bolK8Xp9ZsGvz2F3tceS
	QS2JTEpQ5IQaHCX7rGXHnC04Fq38FqraO7ZgCIpM/FLi/dOm1ARhpJR/go6N8C5oBnMiitRDSjj
	LpFuaaqz0yQ0yefr5/p9qmzPk0uwiDC2rBb01I79uAKaTVCggubZhVmxxotLDj9/gZST/a6n4SL
	jbG5ePWNh9G2MnxZzRQDPdIZfzSvbl/s7TVSY7/nS+N4r7EK7T0PaodO4PZ9HQnZ+P/thrOei9p
	gOkpMq9KJN8ODBYjAB96WddlRqQ==
X-Google-Smtp-Source: AGHT+IFzVU49eKTzFPrhmuZD3BOLoviXlhczciAaiLTAY5C6P8pAzNOIm7m4N1ClupkNMA5fFiTJ3A==
X-Received: by 2002:a17:907:7214:b0:ac7:b231:9554 with SMTP id a640c23a62f3a-ad1e7c9e5cdmr43668466b.11.1746551482178;
        Tue, 06 May 2025 10:11:22 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891ee1f2sm731726866b.75.2025.05.06.10.11.20
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 10:11:20 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5f63ac6ef0fso146335a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 10:11:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV10QaQMJyEgexktyPQ4VkUBQAuZujObIsHgjcJXtNN+kP5A6p8Xle1+Z/a/CkfUn+bGEp2D8EPv1LqNZ4=@vger.kernel.org
X-Received: by 2002:a05:6402:26ca:b0:5f8:7a76:aae9 with SMTP id
 4fb4d7f45d1cf-5fbe7a66827mr501286a12.4.1746551480500; Tue, 06 May 2025
 10:11:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425084216.3913608-1-mingo@kernel.org> <alpine.DEB.2.21.2505050944230.31828@angie.orcam.me.uk>
 <CAHk-=wicfBCyMj_x5BiL32o55jqXfnxgn=X5BZZjA-FFER82Jg@mail.gmail.com>
 <alpine.DEB.2.21.2505061104490.31828@angie.orcam.me.uk> <A5AC3B8B-335C-4594-B0DC-D9247B286A37@zytor.com>
In-Reply-To: <A5AC3B8B-335C-4594-B0DC-D9247B286A37@zytor.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 6 May 2025 10:11:04 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjCiEk-kc-vOug2GKJdhHKce3vWALbqjybLPcKLHNmEbQ@mail.gmail.com>
X-Gm-Features: ATxdqUG63A4EhNKzj9lAUUg9Ljmn9lZixDHh0Qusva79q4HVYffJ8dWJ_EBTfPs
Message-ID: <CAHk-=wjCiEk-kc-vOug2GKJdhHKce3vWALbqjybLPcKLHNmEbQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/15] x86: Remove support for TSC-less and CX8-less CPUs
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org, 
	"Ahmed S . Darwish" <darwi@linutronix.de>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, John Ogness <john.ogness@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 May 2025 at 09:44, H. Peter Anvin <hpa@zytor.com> wrote:
>
> a. Someone would have to take it on;
> b. It will need continuous testing;
> c. That someone would *also* have to go through the additional effort of keeping the mainline code clean for the maintainers of the modern hardware.

I think the main issue is "when problems happen, people who
*shouldn't* have to care get reports".

I really think that the way forward is basically what we did for ia64:
get rid of i486 support in mainline, and people who care about i486
can maintain a smallish patch that basically keeps it alive for them.

Because I suspect that the "patch to keep it working in practice" is
likely going to remain pretty small: it's the silly cmpxchg helper
wrappers, it's disabling ARCH_USE_CMPXCHG_LOCKREF, and probably a few
X86_FEATURE_CX8 tests.

And it probably (a) works fine and (b) won't be code that changs very
much upstream, so maintaining it outside the main tree is likely not a
lot of work.

But because it's outside of the main tree, it won't cause pointless
noise from 0day bots etc, and won't affect people who care about
modern machines. And it can do various hacky things because the patch
would *only* be used by people who actually run on an i486-class
machine.

(Ok, if you actually care about the i486SX, the patch will be much
bigger, because it will have that whole FPU emulation code in it)

             Linus
