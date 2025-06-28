Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54732153D8
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 02:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751079352; cv=none; b=fSGvzMOUagMKF9L7fhnDjwZaVV8K2+ZT9aKu0AwgP/YlFmpFkSUV7ZRBpOX7/J6T/f31RSj/U7bwbT5hSCVsVsDwlIlKsodc/oZfq1tLvclIcG0sfU8vj57k1qFOjLMsd/3WRyVxGGrXyUQXYhhyPar6V0V2z3NarVZCEAbvM3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751079352; c=relaxed/simple;
	bh=KbfRmXC4NTNauZOUB9GD+mVCeRsqTlS05VgQMq21mdQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FCjLtGD3hxq5fSKC9ojLps8SZXbhEjkwH4bqB1JTCzTONTcm/zMTZUIeNiI0Gmui06LzRyzCaWXf9leLfNtmGHQDIXZ59OhcJe4kawJFkO1gxVtbZo2hJfPZ4xUUASYuxOW4GUxsVZKiTf40T7WjLBCOh8GMr4CjKXSPAJ8UChM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=EcHca1wg; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="EcHca1wg"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-60c4f796446so4687078a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 19:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1751079348; x=1751684148; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vCBwF/dyDWbSKrtKSs8jNwvCbb36MAxnZBMIIhEp6cI=;
        b=EcHca1wgzOiJS/SVWo+M0KxzFNufUtJvU0//bNuiClOi7Wvj42glBla9xVCBNKcZi0
         pn95fQTu9dZbKLipC3Rl3damj21jFWOFIlOZH4w2kEYf94Wak0zEYw31ew0WqKTF2aal
         2aRXkdVDe1Ud4J7YYeJCh4An2QUDES1pBXWoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751079348; x=1751684148;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vCBwF/dyDWbSKrtKSs8jNwvCbb36MAxnZBMIIhEp6cI=;
        b=l3vsz63s7XBQpDpdDsTArppEur+j35l1pXo3GYX7d5A8vtPjk1SyK/7Mc+/sThONNS
         jA1zSZOntI7ad9mXcn//VveIzfiiNOzqfYticFtyik4YovfrZFlVp6ExEwRCoUyFwixY
         En9t/Ni0DDTIj9She/tNFB83nOTQg2HX8FKWxYOh7TYNEory00VkEZ9mNR7/LJpqTusC
         D6zXsFEpWT1xJ4XcuuN10Lyn5dB10/piPbif+DeGKtqOxddJ85sq9hiDNWsrAhOBhYiB
         65nGiMA3/7qhSRqMeyTfriP5BTyGTqOu24zsmr2i+fvYXLTQDTXkHObTSe0GMi9rr0NR
         nKbA==
X-Forwarded-Encrypted: i=1; AJvYcCUXdL0FW5VX9E2IqdIyyuXeZelIkRcHVUdpJot3iuQkBbqarPrPIAzmtndmHF6oBtKPlBh9qc9EiP43/OE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbcUL+UoijQwlZYff1zh+WUdBeWNMRmQJ5lninymTRXpgwdebO
	aHEtoXp/GZw/rayvHq62yqWStleG1VZd5av17RtwO5W2oTrWGJPagM2mNfKFzO6wiIz5mtSNw6Q
	6oOCGzzoxFw==
X-Gm-Gg: ASbGncv4SZZQ4/OY898Lx5qqoWh0jEkqU25DZGqH0jx3d0dMPvNRLwdwkAv6OF+etSs
	7of5iGM71pW9m72+/cdZh8GMRzc+9aLeDbWNnZ7GxbNCMS4NlCGRlVlcFkkB6YFdU4dPcoBwMeo
	qGiI2juUc6J/gboCgjczC1iZUIU2AFWnDGx0G9KqXDRqeMc+6ml9j8ZRHWYOUwAFbcUIudLEh66
	P2moCyCcaxlJgBCxkP5OokbkXktMR0lsROVtz7YKs2Kwa6OHirtBRz4lzVZSG7h6IBn1nQU2eQl
	UdWj5K54Q2oWoHSznSufd0YkFY9oD3BQ+QVS1LKfUSfYmSo9La1heqhzJZFSld+G/mmxJTFIxEi
	KrsgzQSae9dT6t6Je0s2RnC52A3luk42415rQ
X-Google-Smtp-Source: AGHT+IHOWf4BAVybgLM/iRLra1YVH/ttw353N2PlsP5F/cPG1hnmfZrywl/RvYxsR48/aDoEutoHIw==
X-Received: by 2002:a05:6402:5110:b0:607:f082:583a with SMTP id 4fb4d7f45d1cf-60c88e65b77mr5152639a12.27.1751079348104;
        Fri, 27 Jun 2025 19:55:48 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c8321a08fsm2195478a12.78.2025.06.27.19.55.46
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 19:55:47 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-60867565fb5so4714130a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 19:55:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV/+V9DkqvafPfBUEO9+H2NIzlDYdxA8n7S07KrKNBXRtPhvrr4L0Q3BRnY6I9gty7ejNGtAdRLK0qTDho=@vger.kernel.org
X-Received: by 2002:a05:6402:3484:b0:60c:44d6:2817 with SMTP id
 4fb4d7f45d1cf-60c88e17023mr4811505a12.20.1751079346498; Fri, 27 Jun 2025
 19:55:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627181428.GA1234@sol> <CAHk-=wiT=UUcgCVVo5ui_2Xb9fdg4JrPK=ZqpPxDhCgq9vynDg@mail.gmail.com>
 <20250628011834.GA1246405@google.com>
In-Reply-To: <20250628011834.GA1246405@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 27 Jun 2025 19:55:30 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgVCdMX_KODjSaMD4hXwd6o7R83vM+i19b9M-nXW8Fe+A@mail.gmail.com>
X-Gm-Features: Ac12FXwe-leVLRXXPSsAQJY65WNZMY2oAHPhDoNGg64tIEkUqJ2tjXfK6FvYKHg
Message-ID: <CAHk-=wgVCdMX_KODjSaMD4hXwd6o7R83vM+i19b9M-nXW8Fe+A@mail.gmail.com>
Subject: Re: [GIT PULL] Crypto library fix for v6.16-rc4
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

On Fri, 27 Jun 2025 at 18:18, Eric Biggers <ebiggers@kernel.org> wrote:
>
> Purgatory actually gets the generic SHA-256 code already.  The way it works is
> that for purgatory lib/crypto/sha256.c is built with __DISABLE_EXPORTS defined,
> and that file detects that and disables the arch-optimized code.  The
> arch-optimized assembly code is not built into purgatory.

Ahh. I completely missed that odd interaction with __DISABLE_EXPORTS.

             Linus
