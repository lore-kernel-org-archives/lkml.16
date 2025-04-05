Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A794619E998
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 22:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743892492; cv=none; b=qVVULPS8BbT3SuXbIg4KZsBDqnwKV0/IHBODB24TQcfnbLp4dYpoHS/X2FB5e9Gkgdlnd2cFXHRyQEibY57Cw02nUqvxF7D0fJwTZQsbPR6Omxk12yo/HxmdIBzKN+Ag9EB3FB76vvp+hZAUtac36cSOeCE8xGApYhuSoqGXo1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743892492; c=relaxed/simple;
	bh=Jwa7WVh1Mbn44z4uCieGuSkSoP/aImVcM5D1P7xUJgU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e023iIzLU0HmIhJInQ2uObQnUYHG/rWQTF1QpD6tw8aStNskIchD+0hJchroOW4qsKU1WDk21mh52V/hgY0ZqgOQHD1xAYhyQY3lSOI2v4Gwt5y4mfy9/zqbNT1hvCAJ2p+sHNFU2O+lTOJ/ywkFX45p9gqPXNFzU2g21j024Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=UiDZJUH1; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="UiDZJUH1"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e686d39ba2so5847066a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 15:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743892486; x=1744497286; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tT2mm+ItL4N6xmscnWjjPD3E7M42LVXxM6kDybYeTbg=;
        b=UiDZJUH17t+AyovH+OqMVfIorL37ganWheYitYfqRxarhEdGGAAt/c1SF/xbXTaWxK
         d4O9ZzNPA7HqrpOtEoGZmO65kCchTT0hmbryWAusrUU2h6yk9F7dVqDp+ScNm8TcAsj0
         cDJCA1n6UouCp3/EBH+TFS1ym/4/TVgEp8tHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743892486; x=1744497286;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tT2mm+ItL4N6xmscnWjjPD3E7M42LVXxM6kDybYeTbg=;
        b=HchHh8wgNiRKFFXWcDZ6I283ggD9vfEMMin+PlFJVqtd1Ci7pt5KYpXzwzQmvr3eTW
         QZwsltH1Oj45zwO56bJFqhEuIzAvj4p06YTOUQWTUO9ncaBpn6XcbVVlwPuXfMHFxPNc
         jG8eoIg1Dn/XDc2ZVZw/bIfg1jaVnGhLED5xylXjRVCr4NfOH46zPP9MUgFb42kbFmZf
         YnU4+1rKq9eyPTU0SROSSYobBNPbgAB3//ZQFG5sUySyxwtYFS6tFn0Wdv16f+6zhBnN
         p4nIpLdoDnEsn5V+FtLpwsekn9ztusITrwyPcsfpBZkpyHO4qJw5lCU0mHzyjuvtEP0q
         ExLw==
X-Forwarded-Encrypted: i=1; AJvYcCXsAFe/15bkl05j7VJalldomIwL+s8GppUZtrbtw277lghY5afURmRunwagjEQGlRduiKPle/Tm3KDDkHo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9wXGbCviTDBVWlmka37lTZk0JgeOZYUdbT/Y0Pwi9p+GiRgOQ
	ZObLPJtoxL0L+ulQR/a3G3M3MuggTBSpx7xHYow1qUbbXbuM6TVjVEP/joJWC1qowAFXcbO4+q3
	4XzE=
X-Gm-Gg: ASbGncvxjQb3nnm+Aj042pj7fhpg79YKX7vk6D9tgTzXa1vukhLjcIoSulUw6wO9YCg
	HTTXbiPvJ0YsrJb7TrXQm7VPWvrR60Abe6IYxDrBsLP+KSg1QfytJMfclimWsTG2SegU4wUKtCf
	fhECynqOSzXeM9ASjzH/T1JJRoIxMG4VaZAdjFccJA2H4luDHSxA6WcrmLF7VZJdnNZkGWhez5J
	CMd+sPnD9Y0mnB5slq78/tYRmTbqXyVfG+r2SrTSj/nStfF5yBGziiR6aC9nzcZwDnz/oUrokcz
	r8O9KSF1+DK2uaG2kKpNGvLxBh66jYn0g7XLco17zkSJNNFTceht4BaZ7MBDNLjbQge7G22CINF
	3XqdRR2x2//JXAExR9Nc68F1r109qHA==
X-Google-Smtp-Source: AGHT+IHlrT/mLxdqVtlAJvTG4uWTNCX3xW1BdZ5kxSPv6mGGTqnH3T/IyHGcs3ML37LL9FDHPCDLZg==
X-Received: by 2002:a17:906:f5a2:b0:ac3:5c8e:d3f6 with SMTP id a640c23a62f3a-ac7d1cce91emr775324966b.55.1743892486563;
        Sat, 05 Apr 2025 15:34:46 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c01c2170sm490983766b.170.2025.04.05.15.34.44
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Apr 2025 15:34:45 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac3eb3fdd2eso240242066b.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 15:34:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUo144y6aCphXmAFmernsvGuYuCecBb/SaqZG69Qv0rVytFBcMO+wB8iUbyHdiCgQkK77uQcEn0Ba+L7S0=@vger.kernel.org
X-Received: by 2002:a17:906:dc8f:b0:abf:8f56:fe76 with SMTP id
 a640c23a62f3a-ac7d18bbd79mr666317166b.25.1743892484382; Sat, 05 Apr 2025
 15:34:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPM=9twD=Epq278=nVGxMU4veeEpznYLnr_PVQ9WqvdnxZac_w@mail.gmail.com>
 <CAPM=9tw5SBS_P1oX+ySAhNx-M_NeO4RzK249i6vtwSU0V4mbDA@mail.gmail.com>
In-Reply-To: <CAPM=9tw5SBS_P1oX+ySAhNx-M_NeO4RzK249i6vtwSU0V4mbDA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 5 Apr 2025 15:34:28 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi+93hTajFWaRL+vih3NjrwsNe8gzgMxmQc5BE+gPQnoA@mail.gmail.com>
X-Gm-Features: ATxdqUEiA6LOTMVfYZDKtw0Uy6wB6ERJBodsv9nW5wea49PdH9NSkRvjU3sFM0w
Message-ID: <CAHk-=wi+93hTajFWaRL+vih3NjrwsNe8gzgMxmQc5BE+gPQnoA@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 6.15-rc1
To: Dave Airlie <airlied@gmail.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Simona Vetter <simona@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

I was going to report this separately, but then the pull came in, so
I'm just replying to that one instead...

On Sat, 5 Apr 2025 at 14:51, Dave Airlie <airlied@gmail.com> wrote:
>
> amdgpu:

Does any of this happen to fix this (repeated a couple of hundred
times each time):

  [drm] scheduler comp_1.1.1 is not ready, skipping
  [drm] scheduler comp_1.3.0 is not ready, skipping
  [drm] scheduler comp_1.0.1 is not ready, skipping

which seems to happen on my machine when the display goes to sleep and
then comes back from low-power state.

It also seems to make the power resume quite a bit slower. Everything
still seems to *work*, just annoying messages and an extra several
seconds of black screen...

This is on my threadripper with the same ancient "Sapphire Pulse RX
580 8GB" or whatever it is. lspci calls it "Ellesmere [Radeon RX
470/480/570/570X/580/580X/590] (rev e7)"

I will be pulling and testing, but I thought I'd mention this issue regardless.

                Linus
