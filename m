Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798141D63D8;
	Thu, 29 May 2025 21:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748554808; cv=none; b=CFH4xPzoHd+m1KF0vm+Cw8uz0BomB+EnU3AcQ8pw33VnZ5gwv0PAJkUX9o54+morSZQhlJVjmS6u4U46izZ+IE1hWyQ/o8XPd1Bj5+Q4F4tn8zcapb6wzX6J4IwV4gjtzim6bAlDgZ+pOzBjfJYSEP34svLWql0822vLyLRcV8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748554808; c=relaxed/simple;
	bh=XZdWpx0S7I9UBNLfkfEM2fQSaxD6Z5eT5JgMAWAszRQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sfG/ka7Mmjq93EhjZGFasPLaKmy6iNY/MtqClCp1FiFUXK44wMBe+uHN9exK9yMzILNyiPVhXnQE2nRphJxRoCFOzJLrX9/7zNSu2fiTc94yX2stQb/bSBO01qx5oIJeSAUwMVTErdxp1ogSeWHQsUxbSEec43C/VEBEhWuYFBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S8aLqAVa; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S8aLqAVa"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-742766ebaa7so104368b3a.0;
        Thu, 29 May 2025 14:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748554807; x=1749159607; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jl1f2B0MQ+VON7tPtwun2UDMESatk+eEgrsywjF8/4c=;
        b=S8aLqAVa4lAiW+zL+QVAOreQ11E2wsZ8yVqeOoeXmnMDT0e6idNPzuHD62u7w8mdhz
         MveK0gYzzY4lcW7CN7IdAndFc+DGknPdaYLTtthFYEcdWNk0H4xEyS1pGce5qawS/PBq
         VVS9Ap3hKnWsqxCYgoP4Wl80OcPoi2EE9ib8gufNY39r3X7K9GiAB+8akuoTmOb6dd0+
         RL/OxqYtlTfjX3YnVK70GojZNjwFiw8HTuTyMbEWmILDR8sNamZYvd36bNDvK/rhsqfb
         eNHtmXsxjyUMchUEuD6X+I32YgAFqnZbdiFNsa9yXnfHjn6TKmT69Su7Ffvv6QtbX3QM
         TRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748554807; x=1749159607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jl1f2B0MQ+VON7tPtwun2UDMESatk+eEgrsywjF8/4c=;
        b=NGtbMhv45cQ2N23YM7Ln1W12CrPGoyUeefFzb9Uq0qelTDvjCFPsNJgRdE88OPFpUT
         tHZ0bDYRFNNSIaXrNhM9vq5Emv9Al5H1omC29+nuAklAGh58UhVWRn01CKIRU0Wpn7to
         BdfN9Fdn85YC9zVHy7o/CZVOdQs7rhfFaNKko07IjfAZsLgeq1iNLFDLxj1z7NfdpmAn
         aJYe/71oPE5b8z6QHexfQdO2r/tNsgWC1meJENIdiJ36R6aJGZ0Oj0PZMeFwwh8SaKVp
         rmlPZnqNHeZ89FmiZ602pJrPobT9fu9hVDeLo5+cpciVovL8U4/ZOzO0k6+BFLXqEC65
         O9nA==
X-Forwarded-Encrypted: i=1; AJvYcCXld/84yM6rPcq+pOBoQsWoAqjY92hmv6v/uCYOMAlrtcPabM2Njxz5SZhxtD5YNEfMZ82K5DBajvMxZWI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3c8pPNOK0lMwz067hWYcA+M+n+MOL7mISCFpK+iFxEj6l1Wo6
	xgFnqMwtAwk+2Bi3jw4+cSO3Fg+44eLm/YguDDUUpCdGYeURX9qbgecsgmtsYW6UDc9dxGzuh1c
	bL2jmWoRgbo4qpn9nn4qGQezMElRvAQxOgzRhwtK/ZQ==
X-Gm-Gg: ASbGncsQJ+eG/NGEbyncGZ9gGf7z/NcU/Y45kSEiDBbXUU7OfCyXqJNT3lkSL7tWos6
	vDELQAx1XipqU9uEiXCIro0c1KGrTXurkVJrzYpZqWm3ZcOhY5R+mKgPzY3cMBgRkcPxGuyPXau
	AU3DstXBuoLbibZq20vWxzT/psbzgs1oGE
X-Google-Smtp-Source: AGHT+IF2l+57iGtSifKJbB7KOZrfOi2S8iZgdOKGEgsw3+chaI97hU9fFyvCoUDYt41/BDVwDVpeRqpEc21FQed/iEg=
X-Received: by 2002:a17:90b:2b48:b0:312:ec:411a with SMTP id
 98e67ed59e1d1-3124db0a630mr48211a91.3.1748554806614; Thu, 29 May 2025
 14:40:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250529162923.434978-1-sylvan@sylvansmit.com>
In-Reply-To: <20250529162923.434978-1-sylvan@sylvansmit.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 29 May 2025 23:39:54 +0200
X-Gm-Features: AX0GCFu8_w538P0gLuxpyHTWpsHd-Iic2hzHb2Yjqahd9Osr4j8m46n_sSqHWec
Message-ID: <CANiq72m9hM_wpfahdHDXdCKpzVg=qiMj7t4g60H6at78gyZkSQ@mail.gmail.com>
Subject: Re: [PATCH] rust: list: Fix typo `much` in arc.rs
To: Sylvan Smit <sylvan@sylvansmit.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 29, 2025 at 6:29=E2=80=AFPM Sylvan Smit <sylvan@sylvansmit.com>=
 wrote:
>
> Correct the typo (s/much/must) in the ListArc documentation.
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Fixes: a48026315cd7 ("rust: list: add tracking for ListArc")
> Closes: https://github.com/Rust-for-Linux/linux/issues/1166
> Signed-off-by: Sylvan Smit <sylvan@sylvansmit.com>

Applied to `rust-next` -- thanks!

    [ Changed tag to "Reported-by" and sorted. - Miguel ]

Cheers,
Miguel
