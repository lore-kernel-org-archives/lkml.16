Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5907B27F73D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750841582; cv=none; b=TAXWF8rzsPTewcAhzZzubzk7GCHiS6FTwyH9qVQYbOiHOwOktOnAzX5xrB0lCT4RC9IioYCOLbGAl67hQ54X+ZDs3Cpb759pi7IYM5xtPuBw52KgP9JPpX33OQ1i2pLW+26Z5KXCNn6Q9m/VSbM+9QgZsP/5SWHAei3di2WQAJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750841582; c=relaxed/simple;
	bh=/aGMiSWgswdb3PxpszlBovn3np9bIPgjxtNCoeUpgjw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JGxHkDjP7C/58Iveyqfl0rpIf2YLj+2gmCvGIflJd5C3yqQvGGzFNpwMbVjloilDNRn7J0I42Z1q3VJDP6yEqzwT19uTxtrj+wcmTssVx42uiB16Wv5JWqdg2rAmqkTdRivjsmi+K+WW2fzSfgf3l7K8K4pO7JKL4YheBt1kGLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yNvBUzm7; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yNvBUzm7"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-32b561a861fso11163311fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 01:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750841578; x=1751446378; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/aGMiSWgswdb3PxpszlBovn3np9bIPgjxtNCoeUpgjw=;
        b=yNvBUzm7HQioAxHvUAItpxKH1RAv/arKTA+stNrfkSkTJkbZIuAk095lskBmUla+B6
         2UQUpfSej9VRX9QLEeFidWzhkHGIRzcrcVff2ri79PHCtz2r3Mmm4Zo1pOfXvsX4PwAY
         4dKY8mqX8SF5/sTlmrkb2EuCbJPvTJmGijpOLmsMg3SZv/5xJ+8g7wsoRAzqOZsF+Qnk
         GZJQa2wVPm5gwARjgYIuBPNLGCtywSxkAIS2DX2HD0YIuiGtm3bRx62ER1oz8J4vMZbh
         o4CJM0I4O6kPtYTE0XjJ81ut61unA/Cu9KDEGE5MKZBOlDYa8Tr9EUk9nCu8iHOa42QZ
         Hepg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750841578; x=1751446378;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/aGMiSWgswdb3PxpszlBovn3np9bIPgjxtNCoeUpgjw=;
        b=uXcawljfZuVra2x6gM4A+E+RA4Dnsu4N+kpkrLmh0FIalvK2Mcr0I6ApwPHsoynNB2
         TXpy3AUIdy8By0YJUctj8SrvgM3zRErjNfkm+/4z2LyazzGCdhUutWTg5SLk7JVPNmnt
         w6Dngo5nvD+ML2tEAl8R6cATJVONPnmufQ4VmG4loJVZC2S6Rk/OyJQtJrHFbwqZZVmR
         OdfOaWdMRssGmuIDFl0I2SHtIrjvtGk6Fkc+p0KPMcBKMt4XkyF7OJcNhuXv+EEjOdqX
         ueHBtT/yhf3BlU2cqQhJk0kdDNCYG/9YZaV8I0mlYe+1zWxS4Mm4kyk3RyWvWUZBlMMm
         bcew==
X-Forwarded-Encrypted: i=1; AJvYcCWZ2vyzq0DbL+1Mk/5VfEc2oFe4rEbmnYIKxHlQ7NIqzY+SwW2rgJp8mbodj9iYCuIk7DgP80UTkBmO7R0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBU9CIv+pfb3/NjVNPUqgfy/Y6uqdDYC+NZ7vffG46xHkSFDiC
	6daqrKQ9kP6FvQGvEYRuebdtUVHKaW1N/l92FPi8O6WSC44e9l3bjkqbp+oZqtm4vFA4aJJhOR2
	H5yEBNSAjVEwvwOdO9AgwADByUbpqVdv0adnu8R5D
X-Gm-Gg: ASbGncs1EW+C86SL+iS83KVRvEuppt9eWGiXVu+kdPviEsKMZnfy+xrJucEfZD/V+3O
	K+vviz/c/JXOoZxeQbnTC2gkEBfXOQM07U/82VOIUccHjXcSMWMSvNWEZ9Q0ECJWcoSltVdS/TA
	xwdwEA4tLJF2A6YPa8KaEOorZfAcTYUinGi5mgpCpkX9l0uPAQMtfwEYkjsgeDtGppW7WmrEAv0
	tuv
X-Google-Smtp-Source: AGHT+IHn5jN08ujo8GoOIZXJyGKEDPnWbpxEqhAfrT8jEIaoiQ0R+LhHX8niQOlMCvkzPsyqSYJbSovaD/ar3ODPJFY=
X-Received: by 2002:a2e:bb98:0:b0:32c:bc69:e918 with SMTP id
 38308e7fff4ca-32cc641db52mr4677001fa.1.1750841578106; Wed, 25 Jun 2025
 01:52:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aFNYQkbEctT6N0Hb@lappy> <20250623132803.26760-1-dvyukov@google.com>
 <aFsE0ogdbKupvt7o@lappy>
In-Reply-To: <aFsE0ogdbKupvt7o@lappy>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 25 Jun 2025 10:52:46 +0200
X-Gm-Features: Ac12FXzXBIFSLBsUnXVDMCaUxIQVjV8jup_taqhSUWe1Psb2MF0u58GMi7noczg
Message-ID: <CACT4Y+Y04JC359J3DnLzLzhMRPNLem11oj+u04GoEazhpmzWTw@mail.gmail.com>
Subject: Re: [RFC 00/19] Kernel API Specification Framework
To: Sasha Levin <sashal@kernel.org>
Cc: kees@kernel.org, elver@google.com, linux-api@vger.kernel.org, 
	linux-kernel@vger.kernel.org, tools@kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Jun 2025 at 22:04, Sasha Levin <sashal@kernel.org> wrote:

> >6. What's the goal of validation of the input arguments?
> >Kernel code must do this validation anyway, right.
> >Any non-trivial validation is hard, e.g. even for open the validation function
> >for file name would need to have access to flags and check file precense for
> >some flags combinations. That may add significant amount of non-trivial code
> >that duplicates main syscall logic, and that logic may also have bugs and
> >memory leaks.
>
> Mostly to catch divergence from the spec: think of a scenario where
> someone added a new param/flag/etc but forgot to update the spec - this
> will help catch it.

How exactly is this supposed to work?
Even if we run with a unit test suite, a test suite may include some
incorrect inputs to check for error conditions. The framework will
report violations on these incorrect inputs. These are not bugs in the
API specifications, nor in the test suite (read false positives).
