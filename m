Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8032BAF9
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 00:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751072067; cv=none; b=m01i0dfz5r9lrMIFPP/x2PePsBDg/F3OIgPk2OTJwPUj6mgTp+8q0iqWE7lXMmzrUlHBv8MNktX3gRaGcxH9Uh9Vu8KCHDkhd/esj8e1rQSR0tToIHAPQUQXdTry2UAGTS3vDa9lm9NqWGzb4r5vixMSRfBoc0vNopZthBg/2O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751072067; c=relaxed/simple;
	bh=ihYX4jbLlsAgBR3K1G2zHtsDTgFanHhsNpPguZ5DU08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B1LelqDum/GjtNJra4nKpWUG790A0qWfNCs76VSEkCVDVNPfSsMW6qljICu/ZdTardnlKPFFLTuZy6i7WCGHQn818lxFhBWA3z54C8bzcirBW6HIN0+fOJ4XetdVf2o92Af62bXV76/W+S8rsEtT9Zgsgxds56w+zX0oJdeHmoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=GvXc/8FX; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="GvXc/8FX"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-606b58241c9so624007a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 17:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1751072063; x=1751676863; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fcxR9gUNpKu3U1/BnKj88yEF6VAeOQF6FO4D5ZntrgM=;
        b=GvXc/8FXL+XonKfKnuwr9mwbgXc/opoPe6OKE3c1SaPsWagl8aMYweHosUW2XjtX9O
         4uf/As0hvK5yGEM1x9bxPVYr1eTYge1M2ZLPVktCxySFFvruBP0bAC0z1q5bArRsC5o8
         W/pMxJ2uIcywwtn+zRCbJEbS/kA3B7xZfVpBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751072063; x=1751676863;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fcxR9gUNpKu3U1/BnKj88yEF6VAeOQF6FO4D5ZntrgM=;
        b=vsrR6RQ1adhIohRRgzu5DDVgBAosChr5M1kGOQ64WHiVOf24/0XJDdqqutyza7foGK
         cOeIwM/1gIx7Cf8qQRS4dsAcdXGtYD3SVdfBIuz66vyf/GzcGQxWWpRSnlRdS0Ee3QkM
         vS1R/wzPv5j2I2GMQMSZhANaVJwrCT7yS4Ak9HUfh120VCJEFh8pFpBymjXJ5ETyCbgi
         J705WXrfRtGhckkNfzGVG5qcOxJ5ZvRcM11yw3F9k0yTnbKJzg4UQjIZsrhWbXt3OxON
         A7zHCXHrjp6pga98IN0I+Frozvb2UGQBleJulmZlHzmB1PS0lhtIsrhtQNMxbgHlPTiW
         cLgw==
X-Forwarded-Encrypted: i=1; AJvYcCUugz7P37mpAmnLbsQGSEN5DYjJ83aIuB0Xf4f+1MyurS9reMMHm+1pogpuBLZyIYZQDGjwBQ6lQVJW8cE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIdPANf3vKUu9UvskdU41T0qnzzH1x8EP5hjJ/mLWcKLm5SAti
	Ib7bY5txMA5K8amJSP9PAfOeEzg0DRKlUaouqG6R8k/lb5sluYVAUiT3uPMppLMTRRuXGKiOe6X
	ad97zXrrGcg==
X-Gm-Gg: ASbGncsyR44auYBKWfKtMpJEm9tB3Auy/X5HEgqRPC4HCd+ox3r+uvmqHKXmtQb0f31
	a7aHl+g4bcrcCOf3yWBj8frVfxN/uyOE+1IpVeVEEw7Rb1m01X11M8FK8QpzeilOLHzWF3mYbhR
	zzHnVR/+VRdI7qviMqpYMnuq7umZ/HVXmCkH5xgSKvf9udyVpvbF0Q8BE5LRkvsRDm1FHNRnVbi
	/ny8c12zM0mBWhpi0nye1+0kP6KLTyUG1i6T+7/tRwJ5JOjaqSA98/mfaJwCGEfH6E4kFTSWcgK
	XlFPyj9LA12ZIqYKRFfr3Iz3xwV7GS4LDEzG+Zdi9s1gQjhoGzyg3DQAxg9M1oOfEKdNZDvIDX0
	nLzq9NRcqeGKopegQyxEDL0qPgbNSmp+66wTh
X-Google-Smtp-Source: AGHT+IG6BdTfxukYcBha2xU+e/zK8FlNKkymuH9czRjF2os/noEk0gv+P1xhZAhCE8jZbxnBHeHkuA==
X-Received: by 2002:a05:6402:2809:b0:5f7:f55a:e5e1 with SMTP id 4fb4d7f45d1cf-60c88e98dbcmr4662996a12.24.1751072063238;
        Fri, 27 Jun 2025 17:54:23 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b24fsm216718666b.34.2025.06.27.17.54.22
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 17:54:22 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-607cc1a2bd8so614984a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 17:54:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX+hqH6TppFHxVzFlMvaAtpyZaouZKPhjv/f8YpdlMnKs1VLgPu26xn6Ky/3iW1xmzztaSVApqKaAhI79E=@vger.kernel.org
X-Received: by 2002:a05:6402:51cb:b0:60c:4a96:423a with SMTP id
 4fb4d7f45d1cf-60c88e7308cmr4952711a12.18.1751072062068; Fri, 27 Jun 2025
 17:54:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627181428.GA1234@sol>
In-Reply-To: <20250627181428.GA1234@sol>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 27 Jun 2025 17:54:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiT=UUcgCVVo5ui_2Xb9fdg4JrPK=ZqpPxDhCgq9vynDg@mail.gmail.com>
X-Gm-Features: Ac12FXySqvJ1tGZd6uU7BKMl--GPFvTk66FXlw4mrxXnAGnE6PjcTh6U-u4Ld08
Message-ID: <CAHk-=wiT=UUcgCVVo5ui_2Xb9fdg4JrPK=ZqpPxDhCgq9vynDg@mail.gmail.com>
Subject: Re: [GIT PULL] Crypto library fix for v6.16-rc4
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

On Fri, 27 Jun 2025 at 11:15, Eric Biggers <ebiggers@kernel.org> wrote:
>
> Fix a regression where the purgatory code sometimes fails to build.

Hmm. This is obviously a fine and simple fix, but at the same time it
smells to me that the underlying problem here is  that the purgatory
code is just too damn fragile, and is being very incestuous with the
sha2 code.

The purgatory code tends to be really special in so many other ways
too (if you care, just look at how it plays games with compiler flags
because it also doesn't want tracing code etc).

And when it comes to the crypto code, it plays games with just
re-building the sha256.c file inside the purgatory directory, and is
just generallyt being pretty hacky.

Anyway, I've pulled this because as long as it fixes the issue and you
are ok with dealing with this crazy code I think it's all good.

But I also get the feeling that this should be very much seen as a
purgatory code problem, not a crypto library problem.

We seem to have the same hacks for risc-v, s390 and x86, and I wonder
if the safe thing to do long-term from a maintenance sanity standpoint
would be to just make the purgatory code hackery use the generic
sha256 implementation.

I say that purely as a "maybe it's not a good idea to mix the crazy
purgatory code with the special arch-specific optimized code that may
need special infrastructure".

The fact that the x86 sha256 routines do that whole irq_fpu_usable()
thing etc is a symptom of that kind of "the architecture code is
special".

But as long as you are fine with maintaining that arch-optimized code
knowing that it gets (mis-)used by the strange purgatory code, I
certainly don't mind the status quo with that one-liner fix.

So I guess this email is just me saying "if this keeps triggering
problems, just make the purgatory code use the slow generic routines".

Because it's not necessarily worth the pain to support arch-optimized
versions for that case.

If there is pain, that is.

                    Linus
