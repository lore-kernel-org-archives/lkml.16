Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C09422068E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 17:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749664268; cv=none; b=F4hbL9s6/YBy73i2kakttIAgI26q0Miv9AnNHRmotvx5xSfIRTMYZUQDxEG/+3qXn96QaWOFMJFlTM0eRV63f0gvSaLLHIz+LmLvrSirQJ2Wwc2VAEBAs4YKmrW85LPLM/hvQw5ikRX1Pd/+7QVweaG+2y51NjFkiKVAbEE0ZdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749664268; c=relaxed/simple;
	bh=eGNFqynuBIFAxQfgXXE+O2+YXzwRJnVxUyYET5WrhRM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tPPevGIhpwbVO/ev49hJ0JW9OEtb8Wq1ROHzpWXIzcUsI53qVcz5X4pwWenPdkoNNm3VqJ6C4k6NAgy0O15s8sUALXm9lXp+4Pc/AisBJPKQ2Um0Gc2of8OIIqk/ctlSRtPrmx4fxwiQqsbB70LCModZLdLcFsysCt9dXElSUyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=eeP5QqJ1; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="eeP5QqJ1"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ad51ba0af48so239302466b.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 10:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1749664264; x=1750269064; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sNMRIvDjI5OxxkQoJ1BipcgVGMNLMdRP7oKxRHfqUb4=;
        b=eeP5QqJ1b6ERSQKr1GBNBQKslYpzvk9LwnkRhPaZ2m5glIcw0t4tByAVZqWGmTNz5U
         3fxh5rBma6XHiwkNFKO22zyl6S2YDaIdl6cF8pG8HRSa3jVE8y129w90mfIoBLTgOgQg
         n3yagfjaBDWlnqiDPpvR4LQi39Et18L9gGh9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749664264; x=1750269064;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sNMRIvDjI5OxxkQoJ1BipcgVGMNLMdRP7oKxRHfqUb4=;
        b=oDBvOG6BjdYjY4zmTAppknLK710zH9uKzKnW1eSueFeFwvbyRtyIxAjnClkmZ/iuQK
         gpxjF0m0e3ABr+Fb1d5rWymtUZm8hhOLKHYxzwKDtI+COdgU6lzGmVwfGM3JdEk+8s+X
         4a3QKvvxJS6R1u5KDQD+17HI6skKOIRPDT+FnYjvYSBq8Jv2XHfgtyXgf4CevMH5w3e0
         Afo6/foQn9PuO+HEzG76Mn6BiKFdIN7dx+XNWd+7FoRp4B+Y/3jhAwN4gNe0j+z8K9lq
         q5y3/s6tue1wyKQzh0VNBCwz9QdYqMq1Q/sWvgpUmYa0+5dwy7NDBttp2nBzPNhCSpcf
         OO/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXg82Pno5IFCi/X7+0Duj8cwXOtwc8WTSno1kWJII4ujd8Y0xpkUFTHZbeVjYyCqzeUvC8vEsqDvzYCt0Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo290n5vFjZ7aEdfRrqXuBg7ynHJFWkoXAQ1k7pbYHk1INLoFy
	gUXRYEJrAfAfZtupF3NgiKhT8kuO3q54iznnW4+o3kqQmuv3JI8O1ZN/ZaWK0jHsJcFfG08I6bl
	GNuZgR2c=
X-Gm-Gg: ASbGnctHEi4AUUZ2uWwakcv//ldXB96sLSj852cnJCglBHZey1sUyZBbw8ypFdanR1L
	iZ0rOpqptLYLFPmVbifkGiGtakWX9F9paBnrWUOalY68ZV4xZG8SEpbWc99B8wz5FUQanp/gELN
	F+dlWn2QItccGz6Ww+w7/ATMPh6kVvhaqP2DewCXse6lAMgye+qwYNQrOptdCmKjvDWfZyPxCxh
	Q7ziegacscQfAn9fpcyaYyFw9NxwbpRZg8X9uDOT52MNUp8R8ah/cUi4J6rM4QHSejVvuHZzvyN
	SoggF9WNB1rJ3UZ7ka3kFiE8bsHF+msEuvCR/mapoHGNsLNKGl/KGNlHc2jzXb4J4WTXigJ7DoC
	48sKjds4F3youwEA/41SuqJBTImkwT1y8acCY
X-Google-Smtp-Source: AGHT+IGZzZFy1Jki9DAkpLrrlFJK1sfzukmcf19iLozvmlbmz+M5goMrJ9J4Pvcf1qljeo4VdqSOqw==
X-Received: by 2002:a17:907:94d3:b0:add:fb1c:a9c3 with SMTP id a640c23a62f3a-adea56c718dmr36021966b.28.1749664264451;
        Wed, 11 Jun 2025 10:51:04 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1db5768asm924201566b.54.2025.06.11.10.51.03
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 10:51:03 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-60780d74bbaso171969a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 10:51:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWTJmuC6C5VJSDqK21YBZZlX0b/yB0trnkgI+b1H5swtU1AeFtG4+vlZ9s3YUVEU2CzIErg79kE7SlECAo=@vger.kernel.org
X-Received: by 2002:a05:6402:430a:b0:602:a0:1f2c with SMTP id
 4fb4d7f45d1cf-608666342e7mr349953a12.9.1749664263059; Wed, 11 Jun 2025
 10:51:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <301015.1748434697@warthog.procyon.org.uk> <CAHC9VhRn=EGu4+0fYup1bGdgkzWvZYpMPXKoARJf2N+4sy9g2w@mail.gmail.com>
In-Reply-To: <CAHC9VhRn=EGu4+0fYup1bGdgkzWvZYpMPXKoARJf2N+4sy9g2w@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 11 Jun 2025 10:50:46 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjY7b0gDcXiecsimfmOgs0q+aUp_ZxPHvMfdmAG_Ex_1Q@mail.gmail.com>
X-Gm-Features: AX0GCFvhYmOiGos_n7MIyKSpEE5Y2P1Gb8BenhLqBoBcFZYUdrTRYSzOg_XV1WU
Message-ID: <CAHk-=wjY7b0gDcXiecsimfmOgs0q+aUp_ZxPHvMfdmAG_Ex_1Q@mail.gmail.com>
Subject: Re: [PATCH] KEYS: Invert FINAL_PUT bit
To: Paul Moore <paul@paul-moore.com>
Cc: David Howells <dhowells@redhat.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Jun 2025 at 17:23, Paul Moore <paul@paul-moore.com> wrote:
>
> It doesn't look like this has made its way to Linus.

Bah. It "made it" in the sense that sure, it's in my inbox.

But particularly during the the early merge window I end up heavily
limiting my emails to pull requests. And then it ended up composted at
the bottom of my endless pile of emails.

I guess I can still take it if people just say "do it".

            Linus
