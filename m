Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3443594D
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 18:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743272259; cv=none; b=APaHujGZlnCG/GB62xSlJUyf+NHJT2tGlGqCsot9PvZjYIH21g+XxR7Y4/fdsPINDa5R/8pCGgxqgz5mUTwqwsEys2KkrLl/PC8I5pqb7yEPKXlf4zMkSQQXIRFi3/QmjCH8QRvXNdByq4qFuakPQqiy7R+S9oBJ+KckmuJppi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743272259; c=relaxed/simple;
	bh=tlR+eGGp/o8RP6u86aV4Y1yq1UkeI7Du9iPI4TwgoyQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NGnlwNgSo+U+w055V+ze/mv/amMD/dQWKpnyWHagOvuhUMkJEo1t6c0B0ZzDVdFNrS4ClNdOLGTVrGf4Ao7Vxc/5Apd7MqqBtCtdT73FVnKC9NKIXfq8DuR4FpxvS0MaThmWgnBrn5M+SpH09nNvOth0hW77/guyD2ux4FGj1Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=euH1KCJy; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="euH1KCJy"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e8be1c6ff8so6084277a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 11:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743272255; x=1743877055; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n9yPHJORL4pBLeVppY/n0tJvcTCeRkdiSHd3Zz7N/+w=;
        b=euH1KCJyu0zdFojas8ELJ5/+YHAdDL5Eb/JRaniQ65zEPyEmlnZK+1II3q8EYAKDRB
         6MBkuRl+8XD8/N3Kraxyt4uxpoNSG61zBWICnVhW0iQIvHfTFolrqcNanL4FIuFshLK3
         tlKx6OU22aYj/YZ/SwzOwDV5UoAp87sNjrkzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743272255; x=1743877055;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n9yPHJORL4pBLeVppY/n0tJvcTCeRkdiSHd3Zz7N/+w=;
        b=eDjyvQ1yv9PDYnZu93PoouYFjU3EU6Ae+UI3qffvaj+5FqwXmCdQk/LKdLX3czTg+e
         lTRx/ajSbAuaasRiUyWMI2lbE+U4Y/tgo7L493tEqt86BMBdRw81ik9bYBxzd9efzaLW
         56TVXuhBDVBC1Dk3KWr/YnqEXOxjBkruaIAPfdOcPOfqZgXVL08KeoNgW6uv4TQO01yc
         nSFt+Bwq1eBCMPZr++KR19NjK1aTdnMv60il8Qx0NcMRINSXJ95SeW3F8S0UN6lR3Hjl
         yHBjIbJajzxP8+MD5oOi3t364SuyAWxFTvvw+L1LDzvrVuK/EelhpjbMMXYfhwxf7Ail
         b/aA==
X-Forwarded-Encrypted: i=1; AJvYcCUl1f4vXR9q4TOMcCpaXeIjb6SVAa8aHsdzDgaUARJ5L99chP11j3KlTGAwZoTfjg+k7ACjwEO+Pb+aMSU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEwim7La0ZdT5QjQPHK3eYvJqQ5EMwywV9lVsVXJcojRjUzPS+
	Eqdoh+GQoHkrxzzXpFzqG6PD2i9P9fyvxAeqFtC59Mx0/4vVFXvyCD3RM3anqiRqCRwIS1w5y53
	j1UE=
X-Gm-Gg: ASbGncttSs9O5miP67f9c7x96tjSEZFaKFy+IypHTxbH+Mm0F+vUq1enulQpdLulxaX
	rK5LjM6M9+furgWVdR1tSv+dWydgKTtKQOJDVUUzW7+XaSqc3vXSyZqOcd+gxc+pUGNrlYO6qU4
	1/fPQKEpbaIvV9OQoWuZ/oZc1nApT7qeKc5nr/z3ocEmOufcwZ/UyK0WaWqNKcnkzhdQaeVEIFb
	JusdkF4WkYzZpbYWS5ZT/6Fwz3+YriWnpi9n42IOL+OIm2rMjoCBcCia41/x8b2Co80kJCkxUSi
	v6KAx/90AkeDex+6vqnv6BsDo53E+zYoYCuvwWTHl3C5lg4KA5k/9gEWuV3p+lz9HO7oLmckcvI
	gc4TwaYH/CBGmwRDPNvk=
X-Google-Smtp-Source: AGHT+IHWXg925Kjttjkh04k0+60Hp5MnagtlRgj8uXvCxiOa6lqTbQzG/cdg7UYSt0I4yrV0v6PLcA==
X-Received: by 2002:a05:6402:51d2:b0:5ec:da2e:6e30 with SMTP id 4fb4d7f45d1cf-5edfcbe93b8mr2829726a12.4.1743272255074;
        Sat, 29 Mar 2025 11:17:35 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc16aae56sm3270964a12.14.2025.03.29.11.17.34
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Mar 2025 11:17:34 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac2902f7c2aso556038866b.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 11:17:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVs5D9k2jtNRJz4qGbZlVHBbSqbNyOd3DRhEda7maZ3oNUjuCuoE4ZICmT5SNWYYdlvnbYCQybZB421Z8E=@vger.kernel.org
X-Received: by 2002:a17:907:6eaa:b0:ac4:2b0:216f with SMTP id
 a640c23a62f3a-ac738bad2cemr293239266b.43.1743272254023; Sat, 29 Mar 2025
 11:17:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZZ3F/Pp1pxkdqfiD@gondor.apana.org.au> <ZfO6zKtvp2jSO4vF@gondor.apana.org.au>
 <ZkGN64ulwzPVvn6-@gondor.apana.org.au> <ZpkdZopjF9/9/Njx@gondor.apana.org.au>
 <ZuetBbpfq5X8BAwn@gondor.apana.org.au> <ZzqyAW2HKeIjGnKa@gondor.apana.org.au>
 <Z5Ijqi4uSDU9noZm@gondor.apana.org.au> <Z-JE2HNY-Tj8qwQw@gondor.apana.org.au>
 <20250325152541.GA1661@sol.localdomain> <CAHk-=whoeJQqyn73_CQVVhMXjb7-C_atv2m6s_Ssw7Ln9KfpTg@mail.gmail.com>
 <20250329180631.GA4018@sol.localdomain>
In-Reply-To: <20250329180631.GA4018@sol.localdomain>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 29 Mar 2025 11:17:17 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi5Ebhdt=au6ymV--B24Vt95Y3hhBUG941SAZ-bQB7-zA@mail.gmail.com>
X-Gm-Features: AQ5f1Jrj02nuuU3jVC6wxLZbrb8UO2ZPR4XngM0ocq2feDDCLoOzwqBb1MawlUM
Message-ID: <CAHk-=wi5Ebhdt=au6ymV--B24Vt95Y3hhBUG941SAZ-bQB7-zA@mail.gmail.com>
Subject: Re: [GIT PULL] Crypto Update for 6.15
To: Eric Biggers <ebiggers@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 29 Mar 2025 at 11:06, Eric Biggers <ebiggers@kernel.org> wrote:
>
> The crypto_shash API is synchronous and operates on virtual addresses.  So it
> just provides a simple way to support multiple hash algorithms, and none of the
> legacy asynchronous hardware offload stuff.  It's crypto_ahash that has that.

Well, it's "simple" only compared to ahash.

It's still a complete nightmare compared to just doing the obvious
thing directly when that is an option.

I happened to just merge the rdma updates a couple of minutes ago, and
they actually removed the example I was using (ie the whole "use
crypto layer for crc32c" insanity).

             Linus
