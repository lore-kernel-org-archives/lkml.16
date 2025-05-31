Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A979C238D32
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 15:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748705990; cv=none; b=J99EpzkeY/TO1TwLWZpgPtWljlyRPlM2H2/2Pf10D4b1KnQAVBcpsaqsTCH143VhEUircQ/kLrP5fbWQ2FhAtF9FX1JW9rsCgQsezWbQp7qo/tZQnQmSABglx/ujpUgviSMCxx7SYXvBG7xO/RhztD/dntJgYQUNorRZng2AtA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748705990; c=relaxed/simple;
	bh=gU9laCodEqgFk7Nl1GeUd8LpwRSNdhguSR7gzLHmTs0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ek092yNYZPcOXIqvCzomo9oW5qkPmLn/pbQZ5aU76muIiSr66gDVPfAi74WdAMyMZvtl1w1DhF7O1TJ6Gy0XEdVVjvTLNAwZRWMDXGnCTpNO3fqTcS+51mrpCwV1lcSHOeZ3Ipd5Zv90p9aYyO3uvvBThmiKwC1JTOJJHi42VLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mXXYUSuY; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mXXYUSuY"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-30eccc61f96so507300a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 08:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748705988; x=1749310788; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gU9laCodEqgFk7Nl1GeUd8LpwRSNdhguSR7gzLHmTs0=;
        b=mXXYUSuYU9GuWW6woMg48mjSjP8zTHYwerlqjn9GdM+EOT/AUHCl7dhSk4tscVRerm
         e/lq9pyv5IC0o6h+uqH9n8Q70bFKrgdqh4ttJMuiwd0rdL0qrcEbLKZ/G93knKalr9tk
         GMUzB5JCUBp6RhzvzZIMVgmauaDQzuTw3GK/s2klvfpA9ozf6WqwlgyNq+ro5pHnmNnH
         G4ZLakf7d0udoDed/oHTmWieNk7ZLRHR91f2h22fE2MSdsyOdeMKvlzG6u9EnYbbRDLe
         wdi04VVBSctMUInvwtFRo73Diu6d4DkcJFS97l6w8ZkDEh34dQQ6Q/DAkKp40eaLvuTL
         mrTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748705988; x=1749310788;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gU9laCodEqgFk7Nl1GeUd8LpwRSNdhguSR7gzLHmTs0=;
        b=q/Y+NEy74Mnrf9dH5o9gn9f6LZ2vn5SLMJZXC/nrc8EF7IG2mdS/ML/BjBn2/Y/8jJ
         HVH1p9H073ktr5nBruzdBESjRrSf+spLngc5vPc7+EFr/xIXv5SLNVc5uqF2nsA7ekRh
         ZqyKxcnQawvSDTW1ibsmiBQN1EHxuR8RhPu+S193puRbF2mpxsVnBTVRCmhyVGBGcWpb
         BK1yulGKcNgq2spy6t+U7spfqmeBwMI31cKBCxDaF99BD7YsshkqY3igUZ6QyuyPDsSb
         zKsQ9XiZLC52WWdszw+D5VVU6HuTI4eojyfVohlIXZzam876aCzh6IVR8ph4ckT7Zp6o
         nVMw==
X-Forwarded-Encrypted: i=1; AJvYcCVKoCFaPSiAmd1OzzncIUIGRg2lsYJC0JnTZ2jjrtdapb4yC6CKaNCittMuBxNudkgZabq/2C3dF6wVeao=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNb9yZrKsBatEdUuTdnzBY60zodUbB5uMjnT/deDECx4dW6/as
	B5exlKVmc+SM6XeHIXc8rug1AqDXuTPcEKwBbf3kuL/KZNyYukL8/ZoHDpIbHuJfJEtkFWM1Yye
	12OFYuYK3vQM14IeMMDbVbww5LfkzPe0=
X-Gm-Gg: ASbGnct6uInScQsjqHuIsZot5SOo9TeMUB4R9bA6xV0PNPJYo6GHuMJcPSORa9D5PIa
	/PCauGrTYJ0c4013fMt5Tca434tZjBJmtWzQoJFn3tmwMwnkRikzhJow7ag/shOQ/Hm5XenN31W
	4HC8MkENsFf3kHSQ4PSSZ/y8WrRnQ81TI3wJ1Au3YFpKE=
X-Google-Smtp-Source: AGHT+IHl6zouE4LWARtWKof5FoX2/BnOqPpqC+poFZfUJPlE46SCdWhcUwZ/kirEdrkRwdjAkYmAGKCIoWWAMRBa2wc=
X-Received: by 2002:a17:90b:4f4d:b0:310:8d79:dfe4 with SMTP id
 98e67ed59e1d1-31241849819mr4211406a91.4.1748705987877; Sat, 31 May 2025
 08:39:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250529002509.GA161456@ax162>
In-Reply-To: <20250529002509.GA161456@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 31 May 2025 17:39:35 +0200
X-Gm-Features: AX0GCFvKLgSzAfNJ19aRo-_vAJqqHWKC-i3DNuV70pOA1O5Q3qSVFZf8BAgbIoM
Message-ID: <CANiq72mbAvxhT37xQFAPur_vfpDN7ufbtPeyF+UnU3f7i5sRkg@mail.gmail.com>
Subject: Re: Prebuilt LLVM 20.1.6 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 29, 2025 at 2:25=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> I have built and uploaded LLVM 20.1.6 to
> https://mirrors.edge.kernel.org/pub/tools/llvm/.
>
> If there are any issues found, please let us know via email or
> https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
> opportunity to get them fixed in main and backported before the 20.x
> series is no longer supported.

As usual, thanks! The combined package works for a x86_64 Rust enabled buil=
d:

Tested-by: Miguel Ojeda <ojeda@kenel.org>

Cheers,
Miguel
