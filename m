Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D4B15B554
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 21:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744061642; cv=none; b=FbZtZiTu4CtKLng6B0lmqFzCjQfmkwuNMafOE1ldX8loUrHycY2Whyff5BDRey+sHDsqo4q0pnkelnFFnjk4LGIvWU05DZGvE3SCmm9AXFPHulM8QRExzaKyfMaZP5rMkGzQKU4XnHckcMsVzVjxjmbyeGelImT1TgfEZwXdsLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744061642; c=relaxed/simple;
	bh=c1iUpbhcrXzPl8Azbq+GjxoxxV7VV/BdFZJ0L+31bsE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sk6AaiJGcJkDJwrnc8WXKam0kQXcj5L1VVPo6AgMt08kIvnBKbsNVIE3anE3ceUgp2A/lobgs3pjER3YZvOWaVoCYQPqzZg3PjzmV24PIUxVdsy3nxeIeB0KUIZpffccCSNLKXKzL25ezorJfUSpW1lq96WIigQhMiKlyWVZBe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=dfZQRy89; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="dfZQRy89"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e5e1a38c1aso6597185a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 14:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1744061638; x=1744666438; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ypbOCgQfA8w2KdlopYIWQGlt+OxpNY3XdMomop2Fvk4=;
        b=dfZQRy89UQxnn5a8yKYYkbPuEyiGMUlg6c9qtJ5M/zpJSajErcgPQfbUls4bGL7DMr
         Rsku9FTJDrN2o0y9b+un/p4rFp/WX8LeeyXY8u5dHjCg5iBAaY7z7imlEwbFvaCuiFiU
         AH/RNM4MA0t+ZHOT6CXsKinruIRIkx7956eTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744061638; x=1744666438;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ypbOCgQfA8w2KdlopYIWQGlt+OxpNY3XdMomop2Fvk4=;
        b=NMPQZ8NrVfyW/NbHjokniAZ3esZkRj3lCotjjpqQuDToHvFHv/eex3Qv+yPqGdsA5h
         TCTHNuLMd2lRWsjeC5snivsC3Bj+Ij/BVy+9ucgqvhBhl5cjyjIQyYnTfqbhwPXOq2iJ
         PhliUyuLSy9MYzXgEaOl/xgJ8WXnVoJon5VBa8ctTeL6sMXlW+H1lLrENkmowwYt5pCd
         QjnZZit8D3XD7qHyk0ujdaJcokeWypNXq+RLatKHoaYVFdoc996pR5S1K/a9XGxSlx6B
         TFz0AdHRn7WSjKA1MQQhZP5BzRuiDtNiZm1KpFxuogD+HcLMleMa40U44/dmc1UciY1I
         rYLQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2QDg/aDAU+DzujCNH2EVIzhNQZpERl2E0BG6ffQo0sGWvw4CZ466qzrdZToJdrO9MIJWpEExqmdmgR2o=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi66MxX9Zd6seSVFYTlsnessC6R1e/NlDXcoTmVOII8x36Xpdt
	5fnxcO5niyRL31Iy174ZT542OH4qCj4+N3Y4CGxIpM7DvOXV1nruzEIW40JeDyJDpO6jaM1uZgx
	Ia9g=
X-Gm-Gg: ASbGncvCRD7a/26irgJ6/D6f1Noad/NTFIloW6Q1/UfOEya9f8Ca7k49Ii+NaLBKBe7
	sBYS5bomhkJWdXwDZnnTSiOYio8Nw5nDaRxS988t4n0MSJy0Xs2zW//jBJ/c6QK3EgRvpIwWLF0
	W2mA22aWRGEe+gWViX1kvTMdhzh7d2iLK+THKIQSRXuyaM8qYQ+wbhJxWCkijKuvoVLkL7D/EtU
	hxVbWd2aKJT5tuN9PCpOnPRF/gC17Ud6vS3JnhJkpX1kgMHBNh2aRbQa1BsU/3T91bLwN62nP7P
	qI76ycaWQNLmmzTKsPuRfkZijOQyr5ecqqEVOhSEhV/W+L2VTROVN8bR/OyR+9dnpgKkg8p4GpR
	OT6BeAiBoEC0brQ5xwz4=
X-Google-Smtp-Source: AGHT+IHtRDJtCfRr+9OhPbrOVE6HjwLexGP+eDR6I84MlPfQrqPzN8oa538yvYWxCCJ6WQFonrnWKw==
X-Received: by 2002:a17:907:9615:b0:ac2:9841:3085 with SMTP id a640c23a62f3a-ac7d17d8763mr1257437266b.30.1744061637877;
        Mon, 07 Apr 2025 14:33:57 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c013f80dsm796645866b.119.2025.04.07.14.33.57
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 14:33:57 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac2963dc379so801240666b.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 14:33:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVhD+G+zA/Ax99SrCa6KmUGpYEY60xrRdeyR9cX3eGGfATsY1mLOIGlUAKvy1KFTBBae2R9YONqZKJwyeQ=@vger.kernel.org
X-Received: by 2002:a17:907:3d87:b0:abf:6aa4:924c with SMTP id
 a640c23a62f3a-ac7d17747cfmr1256778866b.17.1744061636768; Mon, 07 Apr 2025
 14:33:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-kbuild-disable-gcc-plugins-v1-1-5d46ae583f5e@kernel.org>
In-Reply-To: <20250407-kbuild-disable-gcc-plugins-v1-1-5d46ae583f5e@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 7 Apr 2025 14:33:40 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjTbWiYwfj2wF9iP8SSVk2A_cZFDr5hu1bgU_PfxhyiiA@mail.gmail.com>
X-Gm-Features: ATxdqUGKkDY0PVxsE-mkdFJ1IAX_JWpY62Qh1ZEnaMl7fepQQaa7Zys4sYl5c8g
Message-ID: <CAHk-=wjTbWiYwfj2wF9iP8SSVk2A_cZFDr5hu1bgU_PfxhyiiA@mail.gmail.com>
Subject: Re: [PATCH] gcc-plugins: Disable GCC plugins for compile test builds
To: Mark Brown <broonie@kernel.org>
Cc: Kees Cook <kees@kernel.org>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Apr 2025 at 14:10, Mark Brown <broonie@kernel.org> wrote:
>
> Arnd bisected this to c56f649646ec ("landlock: Log mount-related
> denials") but that commit is fairly obviously not really at fault here,
> most likely this is an issue in the plugin.  Given how disruptive having
> key configs like this failing let's disable the plugins for compile test
> builds until a fix is found.

I'm not against this, but I do want to bring up the "are the plugins
worth having at all" discussion again.

They've been a pain before. Afaik, the actual useful cases are now
done by actual real compiler support (and by clang, at that).

Who actually *uses* the gcc plugins? They just worry me in general,
and this is not the first time they have caused ICE problems.

            Linus
