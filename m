Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D340F3FC3;
	Sun,  6 Apr 2025 14:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743951493; cv=none; b=qV1ix9tCYmtnsQ0ndLm4nPHEuGDH7wEDkuil1vTAhW7WOIfDQftWTduagHxt7dayphYEO55bf/GTtySbyLH53x6TSezK6AF7EvrKVf+jxx69qtXPnb+8184YDBBmdvmQnTjaEQWuWVL5z9ilNivdpETFo0gWUiJVCmIdYy8c/RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743951493; c=relaxed/simple;
	bh=LD4gCfL3GvRux7EAboZSJrOHSTYF3Xl3Rn9jvkjdPC4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ohB/kXS5f6ackJfWyYG2E11XqTnhQJjCWDF3NkfzEQvdA4triYFW6jiYG+n7vQiJjw0hdEGVbZrjL3TJ3hAjg9M5z69wUnCo/TNpWC1IQ3PUX2NMQ4prBg3zeJB52ejnCSZmW0PDEcav0LpSksx15PhJLtLILcduzK+8PlwvT/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KJQG5vNJ; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KJQG5vNJ"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-30363975406so665081a91.0;
        Sun, 06 Apr 2025 07:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743951490; x=1744556290; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LD4gCfL3GvRux7EAboZSJrOHSTYF3Xl3Rn9jvkjdPC4=;
        b=KJQG5vNJVUwC3kx6k/8LZl65idlhS87bqNLeh/7h/olwAF4vLvmYIQL5ErJc03hEl3
         gbj80NLLKXFFMiXRgEIPizVfooUecYLdNJvlKSOh0nc+Lf1Zvge+EBvpgtfNZDu6zhmd
         jyCvyjmD72/LZfVUrJne01JFWnnEbb/bVlVbXbuDrirtd/ZsJltxhV+J4W7bcQ0ITR/s
         8m4KFr4BYMQtrk+6jPLBcynVI7fDxJ248Ce0sB82RlUh+MuG5kphQew+eYfL5rjurqYR
         nMKfmEN6dVB7fRU78RitGFly+osNGFFMkAv/4pf85mhC0XZY+lr/VEy2KdONGf/Zhwq5
         oMog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743951490; x=1744556290;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LD4gCfL3GvRux7EAboZSJrOHSTYF3Xl3Rn9jvkjdPC4=;
        b=w+7nQHNWBKHZMt97xZ9DqhPExmygteTt85gnPURD62abcph1W4bZhDtRJwl3TX8QhD
         IUB3EgHa+ep5BOlnN5vUr9hcuV1Ys273OSY8s6jUZsL44rgZYZUbGLoGIYP6IJSsnc1N
         tbisGOpXBDqtong0VO5zOFz40IUyJe3QrP57bSzET+u00qN23qrPkykqYqq4sLkIwlrA
         6MXhpsZF4LytaqVg9n2c9sYAXzljmOjUrzU5erqlVY/Ytyl4E2J1DWMPRJ36eArmQ3se
         YmQ8YaCJsl2MJ4Az+X+j8gqOlhXP5zf6LL5+KfVfYL+/11uci7mW+yyFSySDp89fBQki
         ey5w==
X-Forwarded-Encrypted: i=1; AJvYcCU5Ka88BLL1mzq+3iJz9ZY8DZbz5/AmV3Zqpk1g1/hqjZTMTUkc5adPw4ggX+sBRzr1ayeb8VFWca8Mdpk0@vger.kernel.org, AJvYcCVd7z1MSKnD5UdD+eCDbDZzEb2gbJ4b8ij1/D6CJmiU58EYULz9OGTKo2vDSe7QrKFpLJXfzp3XoNw=@vger.kernel.org, AJvYcCXO4LpZKXelGjeJLi93s2aoYSqKMLed/p0Lo0J7+nDOoxHnlKlpcGT9K+aIz7Tr/f2FWq37OEFS7gHH2V8ZlqQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEqGa3alwQQXRv0nCG7sznWL56/i5auIKijcgBy6+uHMk2nuOo
	hOqxsS975Y0+FsaSt2Wt9fM7mPOg0p8Le5XfmD+1rGiyQH+L++tz07b4XB0CK86jij2zWOdj9c6
	drrLG52oFnxFkIkzHT0hQ0/b5hKU=
X-Gm-Gg: ASbGncvRomL2N5TgHFO3Iyui0SA4MnVpM9le5K/VWi6edAravsDzUEKJ/ydJc8kOagu
	1DkBOOuWLozQdPV8cvqZEy4WgjTOOttL7P/OEfIlT0oQZMl79CIAjKrpB6qaP9sebSng8YLIYyC
	0T23OR2wGqQIoGirD6H91qEMNaUzb+pOVfpHys
X-Google-Smtp-Source: AGHT+IEfVSeiBAXjSknzK/xZLBwHijweGRpHQSxt6jHNfi/lxELpk/tC/Lu1J/ozA6LpyPGTHhggmiAaF5yD/zqzACg=
X-Received: by 2002:a17:90b:4b06:b0:2fe:b77a:2eba with SMTP id
 98e67ed59e1d1-306a485b36amr5142609a91.1.1743951490003; Sun, 06 Apr 2025
 07:58:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <399cceb4-dcf5-4af8-a8b7-6741e9b7e8ae@gmail.com> <0cc991ff-e0e5-453c-91dd-84710bf7e028@gmail.com>
In-Reply-To: <0cc991ff-e0e5-453c-91dd-84710bf7e028@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 6 Apr 2025 16:57:57 +0200
X-Gm-Features: ATxdqUGYlZlRK81NFG6hAu_fDJb-01806jsB08wIejZodjbETVB2OHX8iMEc4V8
Message-ID: <CANiq72=p4zjbvVKAR90wY2saFty6AS+-JCNWRvnFu7VeLzg43g@mail.gmail.com>
Subject: Re: [PATCH v3] arm: rust: Enable Rust support for ARMv7
To: Manish Shakya <msh.shakya@gmail.com>
Cc: chrisi.schrefl@gmail.com, Jamie.Cunliffe@arm.com, a.hindborg@kernel.org, 
	alex.gaynor@gmail.com, aliceryhl@google.com, andrew@lunn.ch, ardb@kernel.org, 
	benno.lossin@proton.me, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	corbet@lwn.net, gary@garyguo.net, guptarud@gmail.com, 
	linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux@armlinux.org.uk, ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	stappers@stappers.nl, thesven73@gmail.com, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 6, 2025 at 4:08=E2=80=AFPM Manish Shakya <msh.shakya@gmail.com>=
 wrote:
>
> CONFIG_RUST_DEBUG_ASSERTIONS=3Dy

This is great for testing...

> CONFIG_RUST_BUILD_ASSERT_ALLOW=3Dy

...but this one should really be disabled (both for testing and for
production use).

`RUST_BUILD_ASSERT_ALLOW` is really only there as a worst case
workaround (escape hatch) that nobody should ever hit, hopefully.

If you ever find you need to set it, then please report it -- thanks!

Cheers,
Miguel
