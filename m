Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85771DF74F
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 16:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745254226; cv=none; b=Zglh18Y91BKCN5llp0Z7/dFY9ioI9hA898jFlsWTGN8q42cvSwrG3fNAt49eUgMYKzNhMK/F/U61X5hfyueo0ToIpf2J83pCEZm1EWaKJ3F8uiZiYrts0UPL4yeVQrpnojWa9ri2PuK/cr6qlkJ7z02PQc7y8bS0s8tK5+lJUc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745254226; c=relaxed/simple;
	bh=75jmGP9bVo8fjvixWVxCAKwFwqHftpu3jiKMLJI5AIA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G5n/5lBYfa9u7fNBR0LC2+KJgwbuxyovrs59g5w2ynB11UebuAGeRd7SiAibG9x2xfpouEIGwpcWyak/RkfRqN7jPx6VqbUMsoqKqXsKLO41fviK2qD0LDgKvECwWsXgyNpSiDJxpURs1C3QjERRlzo8R1osF+FfSubJNqZSAKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=QTYA9rKP; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="QTYA9rKP"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso780533766b.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 09:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745254222; x=1745859022; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AjR2RVxOW6ZgZFj+OsQW+gCNX95bGPWFoitBsuyvSlg=;
        b=QTYA9rKPB/LCyf3Yi7RRl79He44xNJ8y00zfsRRwzAlU4sklP8GNhswQIQauLPoTmI
         1oEh+k0YMvF4NT0jQWzYay/z88JtTUg0aqoA38aA0wE+l0+nD9IJXPXoete5pBysWWM5
         W1x2xkZjEtNCoHY6wdsiKtuVtlyj0yGJh5UBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745254222; x=1745859022;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AjR2RVxOW6ZgZFj+OsQW+gCNX95bGPWFoitBsuyvSlg=;
        b=oNYGQpbwX0NgNLRdJD1QVnASec8ffck5uYI98prws5eXPuSsNOB6D0IwmvJFWrFcY1
         PVcEp5L9AvrWD83nxiyE/9DGYgmk73B63Q3Ld3AvZ4Xe0Dqy7FmT5USTo0+iKr/gjxrN
         BU/Yd/RcPgVPV+5BI4DA3VeGR8q/Z0Y8ayb3YQddELyw8p44OHKHa7zKGJipf/kIvyS3
         Osjxs+LwmGQvk7IyeheVAQl2X2pxVK0IvmfRy7yEc+ulsffIJmTpMoaLIrXBbuYQ87fd
         +TzKSFE8cUSRtnlwnM9XL3xd+yEl00RChEBcIRAkT+qGiDScX7WOHY8RoKlDg+C7+zYt
         9FEQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0yLf1x3MwH6t5wzcN0i4R+PWfYzLmjGAAgYPUCHAa8yxtbs8OEP7bLOrz8l3mgo5tZK83YBs1HNuqTbY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzM0xcU6FrITEjDeIgtDAMgF/ni9Qu1OuqtZoFI2pcYGaa9DNYq
	9U68SGw0cOm593KevsEQtvlF40qVHhbokF4t6Q8SgwbJsjLUGXDwfrX+hMBNGqXxS9mJaYP1OHO
	ROz0=
X-Gm-Gg: ASbGncvGifUoN9KNMciO6VKcgAH029BAVxTbd3Ih5DuSGsATgMVSIkuL0vzMOrvTAIy
	0wzU7gGIGGzJpF81uIIHrMAlCHX2g868mcL6zjHjNPj5zPT2fSxSpJnCoX6yjk0F2v367qkCfvN
	KOvfSoKFQ9OGnpOgEI3LoRbobN+hYCsqTMoDOogV39aTZ1xiKXcVe8Mgn34Rw1+EH4URDdn0fBn
	33hMZ74UmcK6+asl/cUEKbMhJD496GAcWgBfFcMOISZOdgSFLK1MhEEdMf9vetyTHA5MhuZBHyI
	oRn/eIv+8PLHBA8SgI9EpqXcmIq5L3ey2L1bfRoKOz6JjsUOmMuWZOBx6QVETv57mwMb74z36/y
	pAGPaXY/QeBCTkM8=
X-Google-Smtp-Source: AGHT+IH/y5azYMEU1N06hyXRm9eR2gUJtvZq7tjbFYUqSTA826ho6Rq5MJpPhFLnv8V4INokLTV1aA==
X-Received: by 2002:a17:907:7255:b0:acb:33ba:2889 with SMTP id a640c23a62f3a-acb74dd0838mr1106759266b.41.1745254221768;
        Mon, 21 Apr 2025 09:50:21 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f62554a102sm4645700a12.10.2025.04.21.09.50.19
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 09:50:20 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso780522866b.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 09:50:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVc6RLdEIGnB6J5z0CyGtEGcTncBE5Ak8xIhbACVuAsC7KGN4GOThcjTdAp6JU29tJSA7JG5slIUWGYZUA=@vger.kernel.org
X-Received: by 2002:a17:907:9488:b0:ac2:baab:681c with SMTP id
 a640c23a62f3a-acb74b7faedmr1249730566b.28.1745254219430; Mon, 21 Apr 2025
 09:50:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <4f941c51-784a-4f10-8df5-6bd103d1d80e@roeck-us.net>
 <202504201840.3C1F04B09@keescook> <CAHk-=whryuuKnd_5w6169EjfRr_f+t5BRmKt+qfjALFzfKQNvQ@mail.gmail.com>
 <202504210909.D4EAB689@keescook>
In-Reply-To: <202504210909.D4EAB689@keescook>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 21 Apr 2025 09:50:03 -0700
X-Gmail-Original-Message-ID: <CAHk-=whjZ-id_1m7cgp4aC+N6yZj3s5Jy=mf2oiEADJ3Tp8sxw@mail.gmail.com>
X-Gm-Features: ATxdqUE3yRy15GcXJDAlg5Pr-Yx6SJeDj43KQDBRp_RmQ2nTvhE5ZYLb4m2ELZQ
Message-ID: <CAHk-=whjZ-id_1m7cgp4aC+N6yZj3s5Jy=mf2oiEADJ3Tp8sxw@mail.gmail.com>
Subject: Re: [PATCH] gcc-15: acpi: sprinkle random '__nonstring' crumbles around
To: Kees Cook <kees@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Apr 2025 at 09:39, Kees Cook <kees@kernel.org> wrote:
>
> Yes, I understand that, but you didn't coordinate with anyone.

I upgraded my machine overnight and released rc3 on Sunday.

And honestly, at that point I did not *CARE* about coordinating. I had
expected things to work, since I knew people had been working on it,
and since F42 had already been released.

The fact that you then complain about a "unreleased compiler version"
is ludicrous.

If you had fixes for it, and they hadn't made it to me, that is 100% on *you*.

My problem was that my kernel didn't build, and that is what I needed
to fix. It was way too late to worry about "coordinating" things at
that point.

               Linus
