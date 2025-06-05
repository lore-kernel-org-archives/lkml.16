Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6A927B4EB
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 18:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749149108; cv=none; b=grmoIWnQaVE58MTytMU4/Fu+MDEl1slroK6jzRZFbI1NVJbpci6a95hKIa8W3pBg5brdg5+lLAR7HVI9Nhs/huJrFYsQVs7dmZeujwIPyujtK8hTE+PbCuD4D7tiXspRXDH5bN63GQg0O4FoNZfsWq3Xxm09yMJculWo0M0Q0Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749149108; c=relaxed/simple;
	bh=cmvfFRYB1PFHOpI2SRC8mvuCC9FS1HQfcs9TNxWoB3M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RcLQUn58k+mv1j15MgOyiBuUj+nB0F18PSIbPgRT4PUX/K2Mx6QLY/xdGmMnmAo8w/KlL33n1cZ92Ua3c97j6iChTIVxTqN+BUOriysS8YgOp1PlrHz+19dkIMK9XrS78xPiWOfRkK8PUlXl0VeiYoOSu8yq3ltMXFUpVqOaJLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=B054zcIf; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="B054zcIf"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ad56cbc7b07so204213766b.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 11:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1749149105; x=1749753905; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q9XTBJm/DbQyoJyugrERn5OxUzft8qC4Z3sD467xDNQ=;
        b=B054zcIfOnRelB00yKisGyNu3Pj3abFdbr3Qm5gH4ValHxHIH2f5IjSlFLbLWuPZ8e
         mUSZsCfTSZhkhFbWfZG+tYchyRvyLELKh1lIOklk3k8HK3BPrgzGviKF8HFTtWZREGi0
         AtUdW4KNtqqab8s5afi+/gKx/LGreqULxbQsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749149105; x=1749753905;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q9XTBJm/DbQyoJyugrERn5OxUzft8qC4Z3sD467xDNQ=;
        b=K+tuO3SaMgEjqBzBg6lKGn9WaF5fTqqdgollE7laE/LQB8e23gqHSxSKo+fdWXmC20
         keRlwZMezfgDQRm9vuOAiqPlKRCEwix7eFau6/7eB6wm8M1DkBxWw5yF2NgR/X2K0LnH
         9f6n2WcD88Sxe86R+STNDPOewuoPV3NpTQDWMCKZ0ztksqcrG4qG24wuZ9cCtCL6jYGi
         NWDGW6i4K6GMJ3krkpn3sAN1f9WCOssLstqT/VLt4957kh6m93A6TE0YG4O5S+OTo6LM
         wIveq2NMri82ue89bcZ0dhJSw1HspciBS16adleMMiD9Izf4lpdhGmb/FzT4Md9liolp
         m4LQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwgTP0IDXRbDDmFpIsQqoLasAdmxUopiwaBDQ2IfCSr3xqE6cevTtHQzGy4Ikf8h5yChsIXByKBHI/u1o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2EEcUqvrnylm6nAO2tTr2qITs5Iuh1wh/p9aTsK+r1lcZ+Lsg
	fJI3y4/r2ROF27hKiVP3BhleJJIbME9O/Jseqdcy6c7gRheoU6Uny75Of69Hcd8QdXUpUO6kw4z
	tGREJhz0=
X-Gm-Gg: ASbGncuXsA6Ld79havvG/X5KtQkIPV8sUqRxN9SaEQ+Gp01cGYrzX1Ue2JTg9H0AO87
	vyg1vCcgbtskkN6m+IEr7f3bsjNgmcxZm0q7opgbuRMKYDq95Jp87pzKqKPhQMAnMXye5lGZ3GU
	FOYpuo7YhJUjR6iHHaACPrwmBEa3BYb4FtlO+qX++VKLHuL7q4QE/262Ez+/0D+RSC1JyUrH9+J
	x1VLGvdTWIGcYj1DW34fCC8B81S0bFGlTODlx1Lb7c7cLZmxFIktryuvM7AzhYkwhrAxdwomGk4
	5todZhevZr3XtR8klFDjZ4evhqKWRDqxmIusWQO9KWgFyoXyrVOR7vcW5/gswYRv1+vZtSlGjAZ
	Ybv/hg91oiv+O11E5ZChZtZLmL940r5HuE4h2
X-Google-Smtp-Source: AGHT+IFMWx+92EISn/lfKhgFdUQc4zoPfQwtG5m01dhmp6n4/lztdUOyQd5lXnvvYebcUnex8zBL9w==
X-Received: by 2002:a17:907:3f07:b0:adb:156e:990b with SMTP id a640c23a62f3a-ade1a922aadmr31222766b.30.1749149104863;
        Thu, 05 Jun 2025 11:45:04 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada6ad6ab8esm1280905466b.185.2025.06.05.11.45.03
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 11:45:03 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-601dfef6a8dso2386090a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 11:45:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWWsHb6JnCt9TvesF1nrGxaGqsCXrwAnEtXbcwBp8SBJ2npRpkVb4omChSMDXOsOzYCFgW9q79ZZh6skB4=@vger.kernel.org
X-Received: by 2002:a05:6402:40c6:b0:602:e002:97b0 with SMTP id
 4fb4d7f45d1cf-607743a644cmr266621a12.18.1749149103123; Thu, 05 Jun 2025
 11:45:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605171156.2383-1-ebiggers@kernel.org> <CAHmME9ot0LdZ+SBYh9xLqFQLT0QL91mupwzUZRFyc=BV2QiJqw@mail.gmail.com>
 <CAMj1kXGEX_i-Gi3NAO+co6+4fKh5rQLhzwn=88wZbs+mVzGXPQ@mail.gmail.com>
In-Reply-To: <CAMj1kXGEX_i-Gi3NAO+co6+4fKh5rQLhzwn=88wZbs+mVzGXPQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 5 Jun 2025 11:44:46 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgd_4xrpXLUH1CGgGL=SXj0vq=XdJGGg388Exkti2Dg5Q@mail.gmail.com>
X-Gm-Features: AX0GCFsYM6S2PiHlmu7TlOVOIi2ktim4C4IM1PCtSKH5LTCkvkdZGrga_vDPEBM
Message-ID: <CAHk-=wgd_4xrpXLUH1CGgGL=SXj0vq=XdJGGg388Exkti2Dg5Q@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add entry for crypto library
To: Ard Biesheuvel <ardb@kernel.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Eric Biggers <ebiggers@kernel.org>, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S . Miller" <davem@davemloft.net>, Christoph Hellwig <hch@lst.de>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Should I just add you and Jason directly as 'M:' entries for this?

                 Linus
