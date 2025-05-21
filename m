Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C2325C71C
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 12:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747831433; cv=none; b=B1A+mzowBhpPP1i+vr8EkDkWUfUmn+2H65zopfJHuL5BdDz6aLbCR53RB7GF43x1HbJSA7j+Gc7FTPwMFPfeBf5j7y6lDKc9zGmpm6sB6McsI9q32LYlcQUMoF2OS6FkcSynAAR8rRajePkrnw8XuoxGDxYghBA/QkD8lHHWLJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747831433; c=relaxed/simple;
	bh=g/E+6a/KWS9AoRfupTUlbB92Hehc/fNW6oXPu1RuI4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SNiZMhUrh7iOK6oEXOgSMygt9cof02YuUTd8YYNoSo+oTE1Z7wfCmmBrS1z+UltrrmiPc9CJGImeLeEsaj7773zKB061se2HzHLbghM2ugnyHOz9EFSokT1D+O/qJljgB5c4PHPQjQhCWO8kr1QR1etCTm5HY1iFZ5u3Uv4554w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jHmEdBNW; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jHmEdBNW"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e7b9972069dso3399854276.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 05:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747831431; x=1748436231; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g/E+6a/KWS9AoRfupTUlbB92Hehc/fNW6oXPu1RuI4U=;
        b=jHmEdBNWjUrzRe73BO2Q+jQnxr2GUrEPkyhYJCZnTW9GenTzOTNt9K3V2ns7w8eMD2
         PWbpnruD+bMuiYb8GruB/Talw+LssKVGi4d1S9EcHCwJ2w1xfBNlbGi6fRAP1DpvWXbq
         asfILGdtw0ortdvQkD9pcOsr4lRBawncDpsz7+mUp2nRJj0puJAFs2vbv8O8YE4n2Vvl
         UMOB/U/rCU7ijM5Ldy61o3H0Wqtixdcl5lvdxlpUvn2hiNEtDIEwHR8x2nP45OHU4McE
         UzpOhrJS7MSeRx7dxeA7PeAi9f75yLRUJ4I4bx1j5X6lye/xii4ZBjwy6JOL4NAF2TKB
         P5XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747831431; x=1748436231;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g/E+6a/KWS9AoRfupTUlbB92Hehc/fNW6oXPu1RuI4U=;
        b=ZSUh9dluQFAt5SzPh1MmfhRr4emQEt+SEsz4bRU5eTS5quvUNo9xZxpxVuo0gnELkI
         kAda42ooU7XOAIFgDawtnWqwAMEoogaaXMc9PlNtXc7KDMVXwmIOOgWjXwarjCqo14Pn
         n+1zd5Sze2/6dWJ6k9rGvC62OaOE1YscZfWz3C4y6U0XLiArTQp/9q6j8J8XzLKvS9xH
         kZGbkYTzodQ01XLRatiH08u3okV59We4+t0cBAa6QcAoBlu8yia+mNTl+gNpBpkiVRLl
         sjKiXzry5v1ow4fIVc33wXpuaqWQXHOQ9ePS4zWajw3zUpzpqbkcGszuAEy4tg0kal+7
         typQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6HMBfYeN0m9vbzTryLEDQ/TSqkdFfk0n3LrDqKdkqtWinIS80CQ4yjih+MIi/VVsbpUwhFtV6NNhyl9I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyLZBn/znPboyJNuCC7dfKYf5AnPGynAnTwMUXVBofqt53bcd0
	3HypT2iWVKpSg8wW3ww+mzFG8W7OIU1JScDNM9paTWCGqWQFlTTjWUCw3wdG5pUuOAiYY4Q4yBi
	Pt+ErlENH3LoesqDQsoXEFvZi/AjvgpVYfs6FE/hCew==
X-Gm-Gg: ASbGncvPfOYvM16sq79NmOXhytMgMFMZvecgPNznduEN6klA3OI8Vz5GcTnUHHXmewa
	6EQxZDgzRFOIcU/mdmdo/R0Si5VOsYnHlFGYf4qjNMHdN2lA9y1VdqI0An6X+Ua8JG0goQtKtiI
	rbdcYkgXxVCIXxJYObdRvFGxpDBbyZ7kbzYA==
X-Google-Smtp-Source: AGHT+IHrf3yFJE5nkM7mTBJOaEWSNoHcIKcp9Pj5czvAg+e2Q2xsCFIRTCxMIzjNh1kxMUtU4OpLdyLcFK7WNX682rA=
X-Received: by 2002:a05:6902:91c:b0:e7b:6881:5272 with SMTP id
 3f1490d57ef6-e7b6a41073cmr27363209276.41.1747831431305; Wed, 21 May 2025
 05:43:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250516092716.3918-1-victorshihgli@gmail.com>
 <20250516092716.3918-3-victorshihgli@gmail.com> <CAPDyKFqCo2-9fYYAoNpmJf7XOiTvLM07hQks1io-S0MvmbAjCQ@mail.gmail.com>
 <e9559e3d-8c77-4748-90ce-4be5e8ac6ead@intel.com>
In-Reply-To: <e9559e3d-8c77-4748-90ce-4be5e8ac6ead@intel.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 21 May 2025 14:43:14 +0200
X-Gm-Features: AX0GCFvGmElWazgfg-Gv2KRHx7HeRJnhhCbIQ8A-GtSNRIlA87-xwixs9iFXc6c
Message-ID: <CAPDyKFppthqZe-=_MuKCZLk=7u_Usu0Q3Enixh2BUC4ZJt=0+A@mail.gmail.com>
Subject: Re: [PATCH V1 2/2] mmc: sdhci-uhs2: Adjust some error messages and
 register dump for SD UHS-II card
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Victor Shih <victorshihgli@gmail.com>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, benchuanggli@gmail.com, 
	HL.Liu@genesyslogic.com.tw, Greg.tu@genesyslogic.com.tw, 
	Ben Chuang <ben.chuang@genesyslogic.com.tw>, 
	Victor Shih <victor.shih@genesyslogic.com.tw>
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 May 2025 at 13:04, Adrian Hunter <adrian.hunter@intel.com> wrote:
>
> On 19/05/2025 15:24, Ulf Hansson wrote:
> > On Fri, 16 May 2025 at 11:27, Victor Shih <victorshihgli@gmail.com> wrote:
> >>
> >> From: Victor Shih <victor.shih@genesyslogic.com.tw>
> >>
> >> Adjust some error messages to debug mode and register dump to dynamic
> >> debug mode to avoid causing misunderstanding it is an error.
> >
> > Dumping the register may be useful for the debug level, I am not sure.
> > Maybe Adrian has an opinion?
>
> My understanding was that the original issue was that these messages
> appear when it is not a UHS-II card, so the register dump should also
> become debug-only.

Good point, I agree!

[...]

Kind regards
Uffe
