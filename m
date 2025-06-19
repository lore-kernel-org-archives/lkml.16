Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09262045B1;
	Thu, 19 Jun 2025 10:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750329271; cv=none; b=MAx0peD6gvtX0fXVpGD6BYK/A6eUDsWhRB/hMeA2n/F3EYVn380NJCCWX1LLSed5jk35gmLGH9JXuaTv31c+mP+nRwHMMw6YAQowN+Dc2H7AItfyr2vlr5UXi0FBqF0WA1WsyfncKWxwr+p9H4FHS182aUB/9X47Kwc1rPSlC7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750329271; c=relaxed/simple;
	bh=6a4Y8qAUk6EuE9zFdW1m9aWG35FRz7pxroGjzElJl0E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LICSLHw2/FS0Qu2DJqcq2gZMCSC8LBIQvRtgzrIfLZtOCE17ZctuQ32wWtFtXSr0WMHiV/GVh91uc/kHqhyjtJtGS2Y/tL9KvV+CGlOEG+LUS8ea8JvvJLvLleY/tIJArfybD6a7f4R2M4WlKTRitX0ch9LNtCWvh11+AIPfqoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DZq5lwNE; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DZq5lwNE"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-60707b740a6so873165a12.0;
        Thu, 19 Jun 2025 03:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750329268; x=1750934068; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yEiR8dXtS7Mdb8/rWv9s6OkEqJqRg68b+4Cq9b7JrdA=;
        b=DZq5lwNE9YH7CYTs3mV4zWLOeo69wv9rAJ+mhzKeTrp8TCPSq68FKLgl368rBEzcEO
         ChmfMyjeY1XodXzlAcDrALSfeHheJD5zeqzsqEeTe/utnc+yphkfxlI6xqukQVt6arl6
         7HDJARJ9Y07Y0sHtpcs8VptbYRNl6sPbtdzqez3ApUKbKVpTgr8F+bWWT3Rfkwh0pkRv
         bk0EHCI1+T13d/T39W1exJ/4DYGUxHMl60UWg9U+Z/09eBQADnzwKP3XmaDOv9b7p2vB
         QxUcLuCYpzvzZp5vYgF0+JeRJpX5HFKVXvXS2iU9RvHkMmdsRBgeynY1/YfEemlVRiu2
         Duxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750329268; x=1750934068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yEiR8dXtS7Mdb8/rWv9s6OkEqJqRg68b+4Cq9b7JrdA=;
        b=gNH3XY4cKTRz2hXRsoJKbbBGAHAYmmPks3HgKUBydw8CFWBdFj0P+t3BsAeHQEwG6X
         mFrizXAScz0Z+bBqbkgMfohgaBLcq6p9Gn9UpvcQfVZxUq/sDghQ7EYYPsuCIC4wIFoZ
         TW4dkhTJz5oK7D9qGYJj8nD1LMgYxQQjxtDpa5XtoB4t13Ng4iA3UveDI4NS99Q7ZLvt
         mbDojxcbgmTc97ZlcLPM02sZPwTFNpR9c4aGZxKDZoSiXD+P1jrpcXcx24fkSnntgqP5
         syk8OUQ1pZuGloZSNTgLYRLvwHzHYd8KtC0F0i71BwDQn95FTqNTYA2c5qPd8dNlr8fm
         EtZA==
X-Forwarded-Encrypted: i=1; AJvYcCUFdHH8sInE89RdYPy6lXkzsRjf5AadpLgPTL/HaRe82rrWz7ZrpfPb1qTgibJjok+tsyLy35QBgMc=@vger.kernel.org, AJvYcCXnGCUjztYxjkMJkxPDn1zEi27f9X5kHXBH/DyPWSJhB5Mndk1ZFOoBZytF2Pl8Jkj0LHXwED7d3sfgsTXH@vger.kernel.org
X-Gm-Message-State: AOJu0YzFypusVDFv52M5Zt0adYjbN839TAK36t6SgptptKKka2l9YJje
	PmsHgwYcjmlLANBXUKhkMJ3AaSZBsGOmUMHDw93JltsJXNfwP8zrTrxh5h6e96hIcZRQaKiPYB4
	Jld+Kwsdmdqel/Lk60WW6AVmYsp1aijU=
X-Gm-Gg: ASbGnctmTx69vUupGAHR2D8HmuYAceGlJdMFSxvQdgP24ECmiIZSujIM0gwBYguNLYw
	cOf+yEdjIdeTewpAtTN73zFESeinYF5XXG896zXBo0yOJxr+bQl10r2aewdXJDAw8t1FXSJ2+cW
	UXxRNMxxqz3Y7jlIYwYIufrwLthLesl0Ozd0kXsKws7zCWFjgIFQa/rQ==
X-Google-Smtp-Source: AGHT+IElgZBza7vItmCMBlR6wW8z2Jobs+mBJ1ddJjsQmBO5sHTBsqZzipMghymTRo+KzFeXhevLX/hn3iVgPyuOyZY=
X-Received: by 2002:a17:907:9814:b0:ade:405:9e38 with SMTP id
 a640c23a62f3a-adfad383841mr1876048566b.24.1750329268089; Thu, 19 Jun 2025
 03:34:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250618092810.29370-1-work@onurozkan.dev>
In-Reply-To: <20250618092810.29370-1-work@onurozkan.dev>
From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Thu, 19 Jun 2025 16:04:16 +0530
X-Gm-Features: Ac12FXyEQra6b9IL29Fm0FgHl1bGQrkdd3yxpCg7wCi5OhJr12K_dq2oYZUdrwI
Message-ID: <CAOh2x=nP4tOVm1nGiMc1ateXCjM98s6kr+eAzHBH4nCJG1jrFg@mail.gmail.com>
Subject: Re: [PATCH] rust: replace literals with constants in `clk::Hertz`
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 3:07=E2=80=AFPM Onur =C3=96zkan <work@onurozkan.dev=
> wrote:
>
> Replaces repeated numeric literals in `Hertz` conversions
> with named constants.
>
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> ---
>  rust/kernel/clk.rs | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
